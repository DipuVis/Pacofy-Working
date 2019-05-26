<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Helpers\Common;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use View;
use App\Models\Bookings;
use App\Models\BookingDetails;
use App\Models\Messages;
use App\Models\Penalty;
use App\Models\Payouts;
use App\Models\Properties;
use App\Models\PayoutPenalties;
use App\Models\PropertyDates;
use App\Models\PropertyFees;
use DateTime;
use Auth;
use DB;
use Session;
class TripsController extends Controller
{
    private $helper;

    public function __construct(){
        $this->helper = new Common;
    }

    public function active(){
        $data['pending_trips'] = Bookings::with('users','properties')->where('status','!=','contact')->where('status','Pending')->where('user_id',Auth::user()->id)->get();
        $this->expiry_check($data['pending_trips']);
        $data['current_trips'] = Bookings::with('users','properties')->where(function($query) {
                $query->where('start_date','>=',date('Y-m-d'))->where('end_date','<=',date('Y-m-d'));
            })->orWhere(function($query) {
                $query->where('start_date','<=',date('Y-m-d'))->where('end_date','>=',date('Y-m-d'));
            })->where('status','!=','Pending')->where('status','!=','contact')->where('user_id',Auth::user()->id)->get();

        $data['upcoming_trips'] = Bookings::with('users','properties')->where('start_date','>',date('Y-m-d'))->where('status','!=','contact')->where('status','!=','Pending')->where('user_id',Auth::user()->id)->get();
        //echo "<pre>";print_r($data['previous_trips']);exit();
        return view('trips.active', $data);
    }

    public function expiry_check($trips){
        foreach ($trips as $key => $trip) {
           $expiration_time = strtotime($trip->expiration_time);
           $present_time = strtotime(date('Y-m-d'));
           $diff = $expiration_time - $present_time;
           if($diff < 0){
            $this->expire($trip->id);
           }
        }
    }

    public function previous(){
        $data['previous_trips'] = Bookings::with('users','properties')->where('end_date','<',date('Y-m-d'))->where('user_id',Auth::user()->id)->get();
        $data['title']          = 'Your previous trips';
        //echo "<pre>";print_r($data['previous_trips']);exit();
        return view('trips.previous', $data);
    }

    public function guest_cancel(Request $request){
        $bookings = Bookings::find($request->id);
        $properties = Properties::find($bookings->property_id);
        $payount = Payouts::where(['user_id'=>$bookings->host_id,'booking_id'=> $request->id])->first();
        
        if(isset($payount->id)){
            $payout_penalties = PayoutPenalties::where('payout_id', $payount->id)->get();
            if(!empty($payout_penalties)){
                foreach ($payout_penalties as $key => $payout_penalty) {
                    $prv_penalty = Penalty::where('id', $payout_penalty->penalty_id)->first();
                    $update_amount = $prv_penalty->remaining_penalty+$payout_penalty->amount;
                    Penalty::where('id', $payout_penalty->penalty_id)->update(['remaining_penalty' => $update_amount, 'status' => 'Pending']);
                }
            }
        }

        $now = new DateTime(); 
        $booking_start = new DateTime($bookings->start_date); 
        $interval_diff = $now->diff($booking_start);
        $interval = $interval_diff->days;
   
        if($now <  $booking_start)
        { 
            $payouts = new Payouts;
            $payouts->booking_id     = $request->id;
            $payouts->property_id    = $bookings->property_id;
            $payouts->user_id        = $bookings->user_id;
            $payouts->user_type      = 'guest';
            $payouts->amount         = $bookings->total;
            $payouts->currency_code  = $bookings->currency_code;
            $payouts->penalty_amount = 0;
            $payouts->status         = 'Future';
            $payouts->save();

            $payouts_host_amount     = Payouts::where('user_id', $bookings->host_id)->where('booking_id', $request->id)->delete();
        
            $days = $this->helper->get_days($bookings->start_date, $bookings->end_date);
            
            for($j=0; $j<count($days)-1; $j++)
            {
                PropertyDates::where('property_id', $bookings->property_id)->where('date', $days[$j])->where('status', 'Not available')->delete();
            }

            $messages = new Messages;
            $messages->property_id    = $bookings->property_id;
            $messages->booking_id     = $bookings->id;
            $messages->receiver_id    = $bookings->host_id;
            $messages->sender_id      = Auth::user()->id;
            $messages->message        = $request->cancel_message;
            $messages->type_id        = 2;
            $messages->save();


            $cancel = Bookings::find($request->id);
            $cancel->cancelled_by = "Guest";
            $cancel->cancelled_at = date('Y-m-d H:i:s');
            $cancel->status = "Cancelled";
            $cancel->save();

            $booking_details = new BookingDetails;
            $booking_details->booking_id = $request->id;
            $booking_details->field      = 'cancelled_reason';
            $booking_details->value      = $request->cancel_reason;
            $booking_details->save();
        }
        else
        {
            $this->helper->one_time_message('danger', trans('messages.error.booking_cancel_error'));
            return redirect('trips/active');
        }
       
        $this->helper->one_time_message('success', trans('messages.success.resere_cancel_success'));

        return redirect('trips/active');
    }

    public function expire($booking_id){

      $booking = Bookings::find($booking_id);
      $cancel_count = Bookings::where('host_id', $booking->host_id)->where('cancelled_by', 'Host')->where('cancelled_at', '>=', DB::raw('DATE_SUB(NOW(), INTERVAL 6 MONTH)'))->get()->count();
      $fees = PropertyFees::pluck('value', 'field');

      $host_penalty     = $fees['host_penalty'];
      $currency         = $fees['currency'];
      $more_then_seven  = $fees['more_then_seven'];
      $less_then_seven  = $fees['less_then_seven'];
      $cancel_limit     = $fees['cancel_limit'];
          
      if(Session::get('currency'))
        $code =  Session::get('currency');
      else
        $code = DB::table('currency')->where('default', 1)->first()->code;

      if($host_penalty != 0 && $cancel_count > $cancel_limit)
      {
        $penalty                  = new Penalty;
        $penalty->property_id     = $booking->property_id;
        $penalty->user_id         = $booking->user_id;
        $penalty->booking_id      = $booking_id;
        $penalty->currency_code   = $booking->currency_code;
        $penalty->amount          = $this->helper->convert_currency($penalty_currency,$code,$penalty_before_days);
        $penalty->remain_amount   = $penalty->amount;    
        $penalty->status          = "Pending";
        $penalty->save();
      }
      
      $to_time   = strtotime($booking->created_at);
      $from_time = strtotime(date('Y-m-d H:i:s'));
      $diff_mins = round(abs($to_time - $from_time) / 60,2);

      if($diff_mins >= 1440)
      {
          $booking->status       = 'Expired';
          $booking->expired_at   = date('Y-m-d H:i:s');
          $booking->save();

          $days = $this->helper->get_days($booking->start_date, $booking->end_date);
          for($j=0; $j<count($days)-1; $j++)
          {
              PropertyDates::where('property_id', $booking->property_id)->where('date', $days[$j])->where('status', 'Not available')->delete();
          }

          $payouts = new Payouts;
          $payouts->booking_id     = $booking_id;
          $payouts->property_id    = $booking->property_id;
          $payouts->user_id        = $booking->user_id;
          $payouts->user_type      = 'guest';
          $payouts->amount         = $booking->guest_payout;
          $payouts->penalty_amount = 0;
          $payouts->currency_code  = $booking->currency_code;
          $payouts->status         = 'Future';
          $payouts->save();

          $messages = new Messages;
          $messages->property_id    = $booking->property_id;
          $messages->booking_id     = $booking->id;
          $messages->receiver_id    = $booking->user_id;
          $messages->sender_id      = Auth::user()->id;
          $messages->message        = '';
          $messages->type_id        = 7;
          $messages->save();

      }
      else
      {
          
      }
    }

    public function receipt(Request $request){

        $data['booking']          = Bookings::where('code',$request->code)->first();
        //echo "<pre>";print_r( $data['booking']->property_address );exit();
        $data['title']            = 'Payment receipt for';
        if($data['booking']->user_id != Auth::user()->id) abort('404');
        $data['additional_title'] = $request->code;
        return view('trips.receipt', $data);
    }
}