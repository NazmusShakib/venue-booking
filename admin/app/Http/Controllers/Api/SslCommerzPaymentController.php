<?php

namespace App\Http\Controllers\Api;

use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Library\SslCommerz\SslCommerzNotification;
use App\Models\Order;
use Mpdf\Mpdf;
use Illuminate\Support\Facades\Mail;
use App\Mail\AdminVenueBookingMailNotification;
use App\Mail\CustomerVenueBookingConfirmationNotification;
use App\Mail\VenueOwnerVenueBookingMailNotification;

class SslCommerzPaymentController extends Controller
{
    public function payment(Request $request)
    {

        # Here you have to receive all the order data to initate the payment.
        # Lets your oder trnsaction informations are saving in a table called "orders"
        # In orders table order uniq identity is "transaction_id","status" field contain status of the transaction, "amount" is the order amount to be paid and "currency" is for storing Site Currency which will be checked with paid currency.
        $order = Order::find($request->order_id);
        $post_data = array();
        $post_data['total_amount'] = $order->net_total_price; # You cant not pay less than 10
        $post_data['currency'] = "BDT";
        $post_data['tran_id'] = 'BO/'.$order->id.'/'.uniqid(); // tran_id must be unique

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = $order->name;
        $post_data['cus_email'] = $order->email;
        $post_data['cus_add1'] = $order->address;
        $post_data['cus_add2'] = "";
        $post_data['cus_city'] = "";
        $post_data['cus_state'] = "";
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = $order->mobile_number;
        $post_data['cus_fax'] = "";

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = $order->venue->name;
        $post_data['ship_add1'] = "";
        $post_data['ship_add2'] = "";
        $post_data['ship_city'] = "";
        $post_data['ship_state'] = "";
        $post_data['ship_postcode'] = "";
        $post_data['ship_phone'] = "";
        $post_data['ship_country'] = "Bangladesh";

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = $order->venue->name;
        $post_data['product_category'] = $order->category->name;
        $post_data['product_profile'] = $order->occasion->name;


        #Before  going to initiate the payment order status need to update as Pending.
        $order->currency = $post_data['currency'];
        $order->transaction_id = $post_data['tran_id'];
        $order->payment_status = 'pending';
        $order->update();

        $sslc = new SslCommerzNotification();
        # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        $payment_options = $sslc->makePayment($post_data, 'checkout', 'json');
        return $payment_options;
        if (!is_array($payment_options)) {
            print_r($payment_options);
            $payment_options = array();
        }
    }

    public function after_payment_success($id){
        $order = Order::find($id);
        $html = view('pdf.bookingInvoice', compact('order'));

        $mpdf = new mPDF([
            'mode' => 'utf-8',
            'format' => 'A4',
            'margin_bottom' => 0,
            'margin_footer' => 5,
        ]);

        //For Multilanguage Start
        $mpdf->autoScriptToLang = true;
        $mpdf->baseScript = 1;
        $mpdf->autoLangToFont = true;
        $mpdf->autoVietnamese = true;
        $mpdf->autoArabic = true;
        //For Multilanguage End

        $mpdf->setAutoTopMargin = 'stretch';
        $mpdf->setAutoBottomMargin = 'stretch';
        $mpdf->SetDisplayMode('none');
        $mpdf->writeHTML($html);
        //$mpdf->Output('invoice_'.time().'.pdf', 'I');
        $name = 'invoice_'.$order->id.'.pdf';
        $file = $mpdf->Output($name, 'S');
        \Storage::disk('public')->put('invoices/'.$name, $file);

        Mail::to(env('BOOKING_ADMIN_MAIL_ADDRESS'))->queue(new AdminVenueBookingMailNotification($order));
        Mail::to($order->email)->queue(new CustomerVenueBookingConfirmationNotification($order));
        Mail::to($order->venue->organization->email)->queue(new VenueOwnerVenueBookingMailNotification($order));
    }
    public function success(Request $request)
    {
        $status = 200;
        $message = '';
        $tran_id = $request->input('tran_id');
        $amount = $request->input('amount');
        $currency = $request->input('currency');

        $sslc = new SslCommerzNotification();

        #Check order status in order tabel against the transaction id or order id.
        $order = Order::select('id', 'transaction_id', 'payment_status', 'status', 'currency', 'net_total_price')
            ->where('transaction_id', $tran_id)
            ->first();

        if ($order->payment_status == 'pending') {
            $validation = $sslc->orderValidate($request->all(), $tran_id, $amount, $currency);

            if ($validation == TRUE) {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel. Here you need to update order status
                in order table as Processing or Complete.
                Here you can also sent sms or email for successfull transaction to customer
                */
                $order->payment_status = 'complete';
                $order->status = 'approved';
                $order->update();
                $message = "Transaction is successfully Completed.";

                //Invoice generating Email Notification Sending
                $this->after_payment_success($order->id);
            } else {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel and Transation validation failed.
                Here you need to update order status as Failed in order table.
                */
                $order->payment_status = 'failed';
                $order->status = 'pending';
                $order->update();
                $status = 400;
                $message = "Transaction Validation Fail.";
            }
        } else if ($order->payment_status == 'processing' || $order->payment_status == 'complete') {
            /*
             That means through IPN Order status already updated. Now you can just show the customer that transaction is completed. No need to udate database.
             */
             $message = "Transaction is successfully Completed";
        } else {
            #That means something wrong happened. You can redirect customer to your product page.
            $status = 400;
            $message = "Invalid Transaction.";
        }

        $redirect_url = env("PAYMENT_CLIENT_REDIRECT")."?order={$order->id}&status={$status}&message={$message}";
        return redirect($redirect_url);
    }

    public function fail(Request $request)
    {
        $status = 400;
        $message = '';
        $tran_id = $request->input('tran_id');

        $order = Order::select('id', 'transaction_id', 'payment_status', 'status', 'currency', 'net_total_price')
                    ->where('transaction_id', $tran_id)
                    ->first();

        if ($order->payment_status == 'pending') {
            $order->payment_status = 'failed';
            $order->status = 'pending';
            $order->update();
            $message = "Transaction is Falied.";
        } else if ($order->payment_status == 'processing' || $order->payment_status == 'complete') {
            $status = 200;
            $message = "Transaction is already Successful";
        } else {
            $message = "Transaction is Invalid";
        }

        $redirect_url = env("PAYMENT_CLIENT_REDIRECT")."?status={$status}&message={$message}";
        return redirect($redirect_url);
    }

    public function cancel(Request $request)
    {
        $status = 400;
        $message = '';
        $tran_id = $request->input('tran_id');

        $order = Order::select('id', 'transaction_id', 'payment_status', 'status', 'currency', 'net_total_price')
                            ->where('transaction_id', $tran_id)
                            ->first();

        if ($order->payment_status == 'pending') {
            $order->payment_status = 'canceled';
            $order->status = 'pending';
            $order->update();
            $message = "Transaction is Cancel.";
        } else if ($order->payment_status == 'processing' || $order->payment_status == 'complete') {
            $status = 200;
            $message = "Transaction is already Successful";
        } else {
            $message = "Transaction is Invalid";
        }

        $redirect_url = env("PAYMENT_CLIENT_REDIRECT")."?status={$status}&message={$message}";
        return redirect($redirect_url);
    }

    public function ipn(Request $request)
    {
        $status = 400;
        $message = '';
        $tran_id = $request->input('tran_id');

        #Received all the payement information from the gateway
        if (!empty($tran_id)) #Check transation id is posted or not.
        {
            #Check order status in order tabel against the transaction id or order id.
            $order = Order::select('id', 'transaction_id', 'payment_status', 'status', 'currency', 'net_total_price')
                            ->where('transaction_id', $tran_id)
                            ->first();

            if ($order->payment_status == 'pending') {
                $sslc = new SslCommerzNotification();
                $validation = $sslc->orderValidate($request->all(), $tran_id, $order->amount, $order->currency);
                if ($validation == TRUE) {
                    /*
                    That means IPN worked. Here you need to update order status
                    in order table as Processing or Complete.
                    Here you can also sent sms or email for successful transaction to customer
                    */
                    $order->payment_status = 'complete';
                    $order->status = 'approved';
                    $order->update();
                    $status = 200;
                    $message = "Transaction is successfully Completed";
                } else {
                    /*
                    That means IPN worked, but Transation validation failed.
                    Here you need to update order status as Failed in order table.
                    */
                    $order->payment_status = 'failed';
                    $order->status = 'pending';
                    $order->update();
                    $message = "validation Fail";
                }

            } else if ($order_details->payment_status == 'processing' || $order_details->payment_status == 'complete') {

                #That means Order status already updated. No need to udate database.
                $status = 200;
                $message = "Transaction is already successfully Completed";
            } else {
                #That means something wrong happened. You can redirect customer to your product page.
                $message = "Invalid Transaction";
            }
        } else {
            $message = "Invalid Data";
        }
        echo $message;
        //$redirect_url = env("PAYMENT_CLIENT_REDIRECT")."?status={$status}&message={$message}";
        //return redirect($redirect_url);
    }
}
