<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\DataTables\BookingsDataTable;
use App\Models\Bookings;
use App\Models\BookingDetails;
use App\Models\PropertyType;
use App\Models\Currency;
use App\Models\SpaceType;
use App\Models\Payouts;
use Validator;
use App\Http\Helpers\Common;
use App\Http\Controllers\EmailController;

class BookingsController extends Controller
{
    protected $helper;

    public function __construct()
    {
        $this->helper = new Common;
    }
	 
    public function index(BookingsDataTable $dataTable)
    {
        return $dataTable->render('admin.bookings.view');
    }
    
    public function details(Request $request){

      $data['result'] = $result = Bookings::find($request->id);
      $data['details'] = BookingDetails::pluck('value', 'field')->toArray();
        
      $payouts = Payouts::whereBookingId($request->id)->whereUserType('Host')->first();
      
      $data['penalty_amount'] = @$payouts->total_penalty_amount;
      
      return view('admin.bookings.detail', $data);
      
    }
   
    public function pay(Request $request)
    {
        $booking_id = $request->booking_id;
        $booking = Bookings::find($booking_id);
        $booking_details = BookingDetails::find($booking_id);

        //$currency      = urlencode('EUR');
        $data['currency_default'] = Currency::where('default', 1)->first();
        $default_currency = $data['currency_default']->code;

        if($request->user_type == 'guest'){
            $payout_email = $booking->guest_account;
            $amount = $this->helper->convert_currency($booking->currency_code, $default_currency , $booking->guest_payout);
            $payout_user_id = $booking->user_id;
            $payout_id = $request->guest_payout_id;
        }else if($request->user_type == 'host'){
            $payout_email = $booking->host_account;
            $amount = $this->helper->convert_currency($booking->currency_code, $default_currency , $booking->host_payout);
            $payout_user_id = $booking->host_id;
            $payout_id = $request->host_payout_id;
        }else{
            return redirect('admin/bookings/detail/'.$booking_id); 
        }

        $payouts                       = Payouts::find($payout_id);
        $payouts->booking_id           = $booking_id;
        $payouts->property_id          = $booking->property_id;
        $payouts->amount               = $amount;
        $payouts->currency_code        = $default_currency;
        $payouts->user_type            = $request->user_type;
        $payouts->user_id              = $payout_user_id;
        $payouts->account              = $payout_email;
        $payouts->status               = 'Completed';
        $payouts->save();


        $this->helper->one_time_message('success', ucfirst($request->user_type).' payout amount successfully marked as paid');
        return redirect('admin/bookings/detail/'.$booking_id);  
    }

    public function need_pay_account(Request $request, EmailController $email)
    {
        $type = $request->type;
        $email->need_pay_account($request->id, $type);

        $this->helper->one_time_message('success', 'Email sent Successfully'); // Call flash message function
        return redirect('admin/bookings/detail/'.$request->id);
    }

}
