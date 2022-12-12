<?php

namespace App\Admin\Controllers;

use App\Models\Order;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Mpdf\Mpdf;

class OrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Order';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Order());

        $grid->column('id', __('Id'));
        $grid->column('venue.name', __('Venue'));
        $grid->column('user.name', __('User'));
        $grid->column('category.name', __('Category'));
        $grid->column('occasion,name', __('Occasion'));
        $grid->column('start_date', __('Start date'));
        $grid->column('end_date', __('End date'));
        $grid->column('name', __('Name'));
        $grid->column('email', __('Email'));
        $grid->column('mobile_number', __('Mobile number'));
        //$grid->column('capacity', __('Capacity'));
        $grid->column('total_guests', __('Total guests'));
        //$grid->column('price_type', __('Price type'));
        $grid->column('net_total_price', __('Net total price'));
        //$grid->column('address', __('Address'));
        //$grid->column('receive_promotional_offers', __('Receive promotional offers'));
        //$grid->column('agree', __('Agree'));
        $grid->column('status', __('Status'));
        //$grid->column('payment_id', __('Payment id'));
        $grid->column('payment_status', __('Payment status'));
        $grid->column('invoice', __('Invoice'))->display(function () {
            return '<a class="btn btn-success btn-xs" target="_blank" href="/admin/venue/order/invoice/'.$this->id.'">Generate</a>';
        });
        $grid->column('created_at', __('Created at'))->display(function () {
            return date('d/F/Y h:i a', strtotime($this->created_at));
        })->sortable();
        $grid->column('updated_at', __('Updated at'))->display(function () {
            return !empty($this->updated_at) ? date('d/F/Y h:i a', strtotime($this->updated_at)) : '';
        })->sortable();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Order::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('venue_id', __('Venue id'));
        $show->field('user_id', __('User id'));
        $show->field('category_id', __('Category id'));
        $show->field('occasion_id', __('Occasion id'));
        $show->field('start_date', __('Start date'));
        $show->field('end_date', __('End date'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('mobile_number', __('Mobile number'));
        $show->field('capacity', __('Capacity'));
        $show->field('total_guests', __('Total guests'));
        $show->field('price_type', __('Price type'));
        $show->field('net_total_price', __('Net total price'));
        $show->field('address', __('Address'));
        $show->field('receive_promotional_offers', __('Receive promotional offers'));
        $show->field('agree', __('Agree'));
        $show->field('status', __('Status'));
        $show->field('payment_id', __('Payment id'));
        $show->field('payment_status', __('Payment status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Order());

        $form->number('venue_id', __('Venue id'));
        $form->number('user_id', __('User id'));
        $form->number('category_id', __('Category id'));
        $form->number('occasion_id', __('Occasion id'));
        $form->date('start_date', __('Start date'))->default(date('Y-m-d'));
        $form->date('end_date', __('End date'))->default(date('Y-m-d'));
        $form->text('name', __('Name'));
        $form->email('email', __('Email'));
        $form->text('mobile_number', __('Mobile number'));
        $form->number('capacity', __('Capacity'));
        $form->number('total_guests', __('Total guests'));
        $form->text('price_type', __('Price type'));
        $form->decimal('net_total_price', __('Net total price'));
        $form->textarea('address', __('Address'));
        $form->switch('receive_promotional_offers', __('Receive promotional offers'));
        $form->switch('agree', __('Agree'));
        $form->text('status', __('Status'))->default('pending');
        $form->text('payment_id', __('Payment id'));
        $form->text('payment_status', __('Payment status'))->default('pending');

        return $form;
    }

    public function invoice($id){
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
        $name = 'invoice_'.$order->id.'.pdf';
        \Storage::disk('public')->put('invoices/'.$name, $mpdf->Output($name, 'S'));
        $mpdf->Output($name, 'I');
    }
}
