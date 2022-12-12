<!DOCTYPE html>
  <html>
    <head>
      <title>Invoice</title>
      <style type="text/css">
        *,
        *:after,
        *:before {
          box-sizing: inherit;
        }

        html {
          box-sizing: border-box;
        }

        body {
          font-family: "Montserrat", Helvetica, Arial, serif;
          font-size: 15px;
          font-weight: 300;
          letter-spacing: 0.01em;
          line-height: 1.6;
          color: #2c2c2c;
        }

        p{
          margin: 0;
          padding: 0;
          display: block;
        }

        table {
          border-spacing: 0;
          width: 100%;
        }
        .content-wrapper, .content{
          width: 100%;
          height: 100%;
          overflow: hidden;
        }
        .invoice-header-left{
          width: 50%;
          margin: 0;
          padding: 0;
          float: left;
        }
        .invoice-header-right{
          width: 50%;
          margin: 0;
          padding: 0;
          float: right;
          text-align: right;
        }
        .invoice-logo{
          width: 100%;
          margin-bottom: 20px;
          overflow: hidden;
        }
        .product-details{
          width: 100%;
          margin-top: 30px;
          margin-bottom: 15px;
          overflow: hidden;
        }
        .table{
          height: 100%;
          width: 100%;
          margin: 0;
          padding: 0;
        }
        .table tr th, .table tr td{
          text-align: center;
          padding: 5px;
          border: 1px solid #ddd;
          font-size: 12px;
          vertical-align: middle;
        }
        .table.table-borderless tr th, .table.table-borderless tr td{
          border: none;
          vertical-align: middle;
        }
        .product-image{
          width: 50px;
          height: 40px;
          margin: 0;
          padding: 0;
        }
        .invoice-amount-info{
          width: 40%;
          float: right;
          display: inline-block;
        }
        .note_or_terms{
          width: 58%;
          float: left;
          display: inline-block;
        }
        .footer{
          position: fixed;
          left: 0;
          bottom: 0;
          width: 100%;
          text-align: center;
        }
      </style>
    </head>
  <body>
      <div class="content-wrapper">
        <div class="content">
        <div class="col-md-12" style="margin-bottom:40px; border-bottom: 1px solid #ddd; padding-bottom:35px;">
              <div class="invoice-header-left">
                  <div class="recipient-info">
                        <h4>BILL FORM:</h4>
                        <strong>{{$order->venue->name}}</strong>
                        {{--<p>Division: {{$order->venue->division->name}}, District: {{$order->venue->district->name}}, City: {{$order->venue->city->name}}</p>--}}
                        <p>{{$order->venue->organization->name}}</p>
                        <br>
                        <p>{{$order->venue->address}}</p>
                  </div>
              </div><!--/.invoice-header-left-->

              <div class="invoice-header-right">
                <div class="invoice-logo">
                    <img style="width:150px;" src="{{public_path('logo.png')}}" alt="Logo">
                </div>
              </div><!--/.invoice-header-right-->
          </div><!--/.col-md-12-->

          <div class="col-md-12">
            <div class="invoice-header-left">
                <div class="recipient-info">
                      <h4>BILL TO:</h4>
                      <p>{{$order->name}}</p>
                      <p>{{$order->email}}</p>
                      <p>{{$order->mobile_number}}</p>
                      <br>
                      <p>{{$order->address}}</p>
                </div>
            </div><!--/.invoice-header-left-->

            <div class="invoice-header-right">
              <div class="invoice-primary-info">
                {{--<h1 style="text-transform: uppercase;margin-bottom: 0;">{{$order->venue->name}}</h1>--}}
                <div style="margin-bottom: 10px;margin-top: 0;">
                  <P>INVOICE NO.</P>
                  <P>INV-{{$order->id}}</P>
                </div>
                <P>
                  <P>INVOICE DATE.</P>
                  <P>{{date('d F Y', strtotime($order->created_at))}}</P>
                </P>
              </div>
            </div><!--/.invoice-header-right-->
        </div><!--/.col-md-12-->

          <div class="product-details">
            <table class="table" cellspacing="0" width="100%">
              <thead>
                <tr>
                  <th>#</th>
                  {{--<th>Venue</th>--}}
                  <th>Occasion</th>
                  {{--<th>Capacity</th>--}}
                  <th>Total Guests</th>
                  <th>Price Type</th>
                  <th>Start Date</th>
                  <th>End Date</th>
                  <th>Status</th>
                  <th>Payment Status</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                <td>1</td>
                {{--<td>{{$order->venue->name}}</td>--}}
                <td>{{$order->occasion->name}}</td>
                {{--<td>{{$order->capacity}}</td>--}}
                <td>{{$order->total_guests}}</td>
                <td>{{$order->price_type}}</td>
                <td>{{date('d F Y', strtotime($order->start_date))}}</td>
                <td>{{date('d F Y', strtotime($order->end_date))}}</td>
                <td>{{$order->status}}</td>
                <td>{{$order->payment_status}}</td>
              </tr>
              </tbody>
            </table>
          </div><!--/.product-details-->
{{--          <div class="note_or_terms">
                etetet
              </div><!--/.notesor_terms-->--}}
          <div class="invoice-amount-info">
            <table class="table table-borderless">
              <tbody>
                <tr>
                  <th style="text-align: right;">Net Total : </th>
                  <td>{{$order->net_total_price}}tk</td>
                </tr>
                <tr>
                  <th style="text-align: right;">Paid Amount :</th>
                  <td>{{$order->net_total_price}}tk</td>
                </tr>
                <tr>
                  <th style="text-align: right;">Due Amount : </th>
                  <td>0tk</td>
                </tr>
              </tbody>
            </table>
          </div><!--/.invoice-amount-info-->
        </div><!--/.content-->
      </div><!--/.content-wrapper-->



      <div class="footer">
        <div style=" width:100%; display:inline-block; text-align:center; color:blue;font-size:11px; padding-top:5px;">Developed By: Md. Abdul Awal</div>
      </div><!--.footer-->

  </body>
  </html>
