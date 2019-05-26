<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Helpers\Common;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Auth;
use App\Models\User;
use App\Models\UserDetails;
use App\Models\Messages;

use App\Models\Country;
use App\Models\PasswordResets;
use App\Models\Payment;
use App\Models\Notification;
use App\Models\Timezone;
use App\Models\Reviews;
use App\Models\Accounts;
use App\Models\UsersVerification;
use App\Models\Properties;
use App\Models\Payouts;
use App\Models\Bookings;
use App\Models\Currency;
//use App\Http\Helpers\FacebookHelper;
use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;

use Validator;
use Socialite;
use Mail;
use DateTime;
use Hash;
use Excel;
use DB;
use Image;
use Session;
use App\Http\Controllers\EmailController;

class UserController extends Controller
{
    protected $helper;
    
   // public function __construct(FacebookHelper $fb)
     public function __construct()
    {
        $this->helper = new Common;
       // $this->fb = $fb;
    }

    public function create(Request $request, EmailController $email_controller)
    {
       $rules = array(
            'first_name'      => 'required|max:255',
            'last_name'       => 'required|max:255',
            'email'           => 'required|max:255|email|unique:users',
            'password'        => 'required|min:6',
            'date_of_birth'   => 'check_age',
            'birthday_day'    => 'required',
            'birthday_month'  => 'required',
            'birthday_year'   => 'required',
        );

        $messages = array(
            'required'                => ':attribute is required.',
            'birthday_day.required'   => 'Birth date field is required.',
            'birthday_month.required' => 'Birth date field is required.',
            'birthday_year.required'  => 'Birth date field is required.',
        );

        $fieldNames = array(
            'first_name'      => 'First name',
            'last_name'       => 'Last name',
            'email'           => 'Email',
            'password'        => 'Password',
        );

        $validator = Validator::make($request->all(), $rules, $messages);
        $validator->setAttributeNames($fieldNames); 

        if ($validator->fails()) 
        {
            return back()->withErrors($validator)->withInput();
        }
        else
        {
            $user = new User;
            $user->first_name   =   $request->first_name;
            $user->last_name    =   $request->last_name;
            $user->email        =   $request->email;
            $user->password     =   bcrypt($request->password);
            $user->status       =   'Active';
            $user->save();

            $user_details             = new UserDetails;
            $user_details->user_id    = $user->id;
            $user_details->field      = 'date_of_birth';
            $user_details->value      = $request->birthday_year.'-'.$request->birthday_month.'-'.$request->birthday_day;
            $user_details->save();

            $user_verification  = new UsersVerification;
            $user_verification->user_id  =   $user->id;
            $user_verification->save();

            $email_controller->welcome_email($user);
            
            if(Auth::attempt(['email' => $request->email, 'password' => $request->password]))
            {
                $this->helper->one_time_message('success', trans('messages.success.register_success'));
                return redirect()->intended('dashboard');
            }
            else
            {
                $this->helper->one_time_message('danger', trans('messages.error.login_error'));
                return redirect('login');
            }
        }
    }
    

    public function dashboard()
    {   
        $data['all_message'] = Messages::where('receiver_id', \Auth::user()->id)->get();
        return view('users.dashboard', $data);
    }

    public function profile(Request $request)
    {
        if($_POST){

            $rules = array(
                'first_name'      => 'required|max:255',
                'last_name'       => 'required|max:255',
                'email'           => 'required|max:255|email',
                'birthday_day'    => 'required',
                'birthday_month'  => 'required',
                'birthday_year'   => 'required',
            );

            $messages = array(
                'required'                => ':attribute is required.',
                'birthday_day.required'   => 'Birth date field is required.',
                'birthday_month.required' => 'Birth date field is required.',
                'birthday_year.required'  => 'Birth date field is required.',
            );

            $fieldNames = array(
                'first_name'      => 'First name',
                'last_name'       => 'Last name',
                'email'           => 'Email',
            );

            $validator = Validator::make($request->all(), $rules, $messages);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }else{
               
                $user = User::find(Auth::user()->id);
                $user->first_name = $request->first_name;
                $user->last_name  = $request->last_name;
                $user->email      = $request->email;
                $user->save();

                $temp_details = $request->details;
                $temp_details['date_of_birth'] = $request->birthday_year.'-'.$request->birthday_month.'-'.$request->birthday_day;
                foreach ($temp_details as $key => $value) {
                    if(!is_null($value) && $value != '')
                        UserDetails::updateOrCreate(['user_id' => Auth::user()->id, 'field' => $key],['value' => $value]);
                }

                $new_email = ($user->email != $request->email) ? 'yes' : 'no';

                if($new_email == 'yes')
                {
                    $email_controller->change_email_confirmation($user);

                    $this->helper->one_time_message('success', trans('messages.success.email_cofirmation_success'));
                }
                else
                {
                    $this->helper->one_time_message('success', trans('messages.profile.profile_updated'));
                }
            }
        }

        $data['timezone'] = Timezone::get()->pluck('zone', 'value');
        $data['country'] = Country::get()->pluck('name', 'short_name');
        $data['details'] = $details = UserDetails::where('user_id', Auth::user()->id)->pluck('value','field')->toArray();

        if(isset($details['date_of_birth'])) $data['date_of_birth'] = explode('-', $details['date_of_birth']);
        else $data['date_of_birth'] = [];
        return view('users.profile', $data);
    }

    public function media()
    {
        $data['result'] = User::find(Auth::user()->id);

        if(isset($_FILES["photos"]["name"]))
        {
            foreach($_FILES["photos"]["error"] as $key=>$error) 
            {
                $tmp_name = $_FILES["photos"]["tmp_name"][$key];

                $name = str_replace(' ', '_', $_FILES["photos"]["name"][$key]);
                
                $ext = pathinfo($name, PATHINFO_EXTENSION);

                $name = 'profile_'.time().'.'.$ext;

                $path = 'public/images/profile/'.Auth::user()->id;
                                
                if(!file_exists($path))
                {
                    mkdir($path, 0777, true);
                    copy(url('public/images/property/index.html'), $path.'/index.html');
                }
                                           
                if($ext == 'png' || $ext == 'jpg' || $ext == 'jpeg' || $ext == 'gif')   
                {            
                    if(move_uploaded_file($tmp_name, $path."/".$name))
                    {
                        $user                 = User::find(Auth::user()->id);
                        $user->profile_image  = $name;
                        $user->save();
                    }
                }
            }
        }

        return view('users.media', $data);
    }

    public function account_preferences(Request $request, EmailController $email_controller)
    {
        $data['currency_code'] = Currency::where('default', 1)->first();
        $currency_code = $data['currency_code']->code;
        
        if(!$_POST)
        {
           // echo "asdfdsaf";exit();
            $data['payouts']   = Accounts::where('user_id', Auth::user()->id)->orderBy('id','desc')->get();
            $data['country']   = Country::all()->pluck('name','short_name');
            return view('account/preferences', $data);
        }
        else
        {

            $account                    =   new Accounts;
            $account->user_id           = Auth::user()->id;
            $account->address1          = $request->address1;
            $account->address2          = $request->address2;
            $account->city              = $request->city;
            $account->state             = $request->state;
            $account->postal_code       = $request->postal_code;
            $account->country           = $request->country;
            $account->payment_method_id = $request->payout_method;
            $account->account           = $request->account;
            $account->currency_code     = $currency_code;  //@$currency_code->code;
            
            $account->save();

            $account_check = Accounts::where('user_id', Auth::user()->id)->where('selected','Yes')->get();

            if($account_check->count() == 0)
            {
                $account->selected = 'Yes';
                $account->save();
            }

            $email_controller->account_preferences($account->id);

            $this->helper->one_time_message('success', trans('messages.success.payout_update_success'));
            return redirect('users/account_preferences');
        }
    }

    public function account_delete(Request $request, EmailController $email_controller)
    {
        $account = Accounts::find($request->id);
        if($account->selected == 'Yes')
        {
            $this->helper->one_time_message('error', trans('messages.error.payout_error'));
            return redirect('users/account_preferences');
        }
        else
        {
            $email_controller->account_preferences($account->id, 'delete');
             
            $account->delete();

            $this->helper->one_time_message('success', trans('messages.success.payout_delete_success'));
            return redirect('users/account_preferences');
        }
    }

    public function account_default(Request $request, EmailController $email_controller)
    {
        $account = Accounts::find($request->id);

        if($account->selected == 'Yes')
        {
            $this->helper->one_time_message('error', trans('messages.error.payout_account_error'));
            return redirect('users/account_preferences');
        }
        else
        {
            $account_all       = Accounts::where('user_id', \Auth::user()->id)->update(['selected'=>'No']);
            $account->selected = 'Yes';
            $account->save();

            $email_controller->account_preferences($account->id, 'default_update');

            $this->helper->one_time_message('success', trans('messages.success.default_payout_success'));
            return redirect('users/account_preferences');
        }
    }

    public function security(Request $request)
    {
        if($_POST){
            $rules = array(
            'old_password'          => 'required',
            'new_password'          => 'required|min:6|max:30|different:old_password',
            'password_confirmation' => 'required|same:new_password|different:old_password'
            );

            $fieldNames = array(
            'old_password'          => 'Old Password',
            'new_password'          => 'New Password',
            'password_confirmation' => 'Confirm Password'
            );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames);

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                $user = User::find(Auth::user()->id);

                if(!Hash::check($request->old_password, $user->password))
                {
                    return back()->withInput()->withErrors(['old_password' => trans('messages.profile.pwd_not_correct')]);
                }

                $user->password = bcrypt($request->new_password);

                $user->save();

                $this->helper->one_time_message('success', trans('messages.profile.pwd_updated'));
                return redirect('users/security');
            }
        }
        return view('account.security');
    }

    public function show(Request $request)
    {
        $data['result'] = User::find($request->id);
        $data['details'] = UserDetails::where('user_id', $request->id)->pluck('value', 'field')->toArray();
        
        $data['reviews_from_guests'] = Reviews::where(['receiver_id'=>$request->id, 'reviewer'=>'guest']);
        $data['reviews_from_hosts'] = Reviews::where(['receiver_id'=>$request->id, 'reviewer'=>'host']);

        $data['reviews_count'] = $data['reviews_from_guests']->count() + $data['reviews_from_hosts']->count();

        $data['title'] = $data['result']->first_name."'s Profile ";

        return view('users.show', $data);
    }

    public function transaction_history(Request $request)
    {
        $data['lists'] = Properties::where('host_id', Auth::user()->id)->pluck('name','id');
        return view('account.transaction_history', $data);
    }

    public function get_completed_transaction(Request $request){
        $transaction        = $this->transaction_result();
        $transaction_result = $transaction->paginate(10)->toJson();
        echo $transaction_result;
    }

    public function transaction_result()
    {
        $where['user_id'] = Auth::user()->id;
        //$transaction      = Payouts::where($where)->orderBy('updated_at','DESC');
       // $transaction      = Payouts::with('properties')->where($where)->orderBy('updated_at','DESC')->get();
        $transaction        = Payouts::join('properties',function($join){
                                        $join->on('properties.id','=','payouts.property_id');
                              })
                              ->select('payouts.*','properties.name as property_name')
                              ->where($where)
                              ->orderBy('updated_at','DESC');
//dd( $transaction );

        return $transaction;
    }


    public function verification(Request $request)
    {
        $data          = [];
        $data['title'] = 'Verify your account';
        return view('users.verification', $data);
    }

    public function confirmEmail(Request $request)
    {
        $password_resets = PasswordResets::whereToken($request->code);
       
        if($password_resets->count() && Auth::user()->email == $password_resets->first()->email)
        {
            $password_result = $password_resets->first();
            $datetime1 = new DateTime();
            $datetime2 = new DateTime($password_result->created_at);
            $interval  = $datetime1->diff($datetime2);
            $hours     = $interval->format('%h');
            if($hours >= 1)
            {
                $password_resets->delete();
                $this->helper->one_time_message('success', trans('messages.login.token_expired'));
                return redirect('login');
            }
            $data['result'] = User::whereEmail($password_result->email)->first();
            $data['token']  = $request->code;
            $user = User::find($data['result']->id);
            $user->status = "Active";
            $user->save();

            //User Verification 
            //$user_verification = UsersVerification::find($data['result']->id);
            $user_verification = UsersVerification::where('user_id',$data['result']->id)->first();

            $user_verification->email = 'yes';
            $user_verification->save();
            $password_resets->delete();

            $this->helper->one_time_message('success', trans('messages.profile.email_confirmed'));
            return redirect('dashboard');
        }
        else
        {
            $this->helper->one_time_message('success', trans('messages.login.invalid_token'));
            return redirect('dashboard');
        }
    }
    public function newConfirmEmail(Request $request, EmailController $emailController)
    {
        $userInfo = User::find(Auth::user()->id);

        $emailController->new_email_confirmation($userInfo);

        $this->helper->one_time_message('success', trans('messages.profile.new_confirm_link_sent',['email'=>$userInfo->email]));
        if($request->redirect == 'verification')
            return redirect('users/edit_verification');
        else
            return redirect('dashboard');
    }

    public function facebookLoginVerification()
    {       
        Session::put('verification', 'yes');
        return Socialite::with('facebook')->redirect();
    }

    public function facebookConnect(Request $request)
    {
        $facebook_id = $request->id;
       
        $verification = UsersVerification::find(Auth::user()->id);
        $verification->facebook = 'yes';
        $verification->fb_id = $facebook_id;
        $verification->save();
        $this->helper->one_time_message('success', trans('messages.profile.connected_successfully', ['social'=>'Facebook']));
        return redirect('users/edit_verification');
    }

    public function facebookDisconnectVerification(Request $request)
    {
        $verification = UsersVerification::find(Auth::user()->id);
        $verification->facebook = 'no';
        $verification->fb_id = '';
        $verification->save();
        $this->helper->one_time_message('success', trans('messages.profile.disconnected_successfully', ['social'=>'Facebook'])); 
        return redirect('users/edit_verification');
    }

    public function googleLoginVerification()
    {       
        Session::put('verification', 'yes');
        return Socialite::with('google')->redirect();
    }

    public function googleConnect(Request $request)
    {
        $google_id = $request->id;

        $verification = UsersVerification::find(Auth::user()->id);

        $verification->google = 'yes';
        $verification->google_id = $google_id;

        $verification->save();

        $this->helper->one_time_message('success', trans('messages.profile.connected_successfully', ['social'=>'Google']));
        return redirect('users/edit_verification');
    }

    public function googleDisconnect(Request $request)
    {
        $verification = UsersVerification::find(Auth::user()->id);

        $verification->google = 'no';
        $verification->google_id = '';

        $verification->save();

        $this->helper->one_time_message('success', trans('messages.profile.disconnected_successfully', ['social'=>'Google'])); 
        return redirect('users/edit_verification');
    }

    //Code for Reviews starts here...

    public function reviews(Request $request)
    {
        $data['reviewsAboutYou'] = Reviews::where('receiver_id', Auth::user()->id)
                                    ->orderBy('id', 'desc')
                                    ->get();

        $data['reviewsByYou'] = Reviews::where('sender_id', Auth::user()->id)
                                    ->orderBy('id', 'desc')
                                 ->get();
        //echo "<pre>";print_r($data['reviewsByYou']);exit();

        $data['reviewsToWrite'] = Bookings::with(['reviews'])
                                    ->whereRaw('DATEDIFF(now(),end_date) <= 14')
                                    ->whereRaw('DATEDIFF(now(),end_date) >= 1')->where(['status'=>'Accepted'])->where(function($query) {
                            return $query->where('user_id', Auth::user()->id)->orWhere('host_id', Auth::user()->id);
                                    })->get();
     
        $data['expiredReviews'] = Bookings::with(['reviews'])->whereRaw('DATEDIFF(now(),end_date) > 14')->where(function($query) {
                return $query->where('user_id', Auth::user()->id)->orWhere('host_id', Auth::user()->id);
            })->get();

        $data['reviewsToWriteCount'] = 0;

        for($i=0; $i<$data['reviewsToWrite']->count(); $i++) {

            if($data['reviewsToWrite'][$i]->review_days > 0 && $data['reviewsToWrite'][$i]->reviews->count() < 2) {

                if($data['reviewsToWrite'][$i]->reviews->count() == 0)
                    $data['reviewsToWriteCount'] += 1;
                for($j=0; $j<$data['reviewsToWrite'][$i]->reviews->count(); $j++) {
                    if(@$data['reviewsToWrite'][$i]->reviews[$j]->sender_id != Auth::user()->id)
                        $data['reviewsToWriteCount'] += 1;
                }
            }
        }

        $data['expiredReviewsCount'] = 0;

        for($i=0; $i<$data['expiredReviews']->count(); $i++) {
            if($data['expiredReviews'][$i]->review_days <= 0 && $data['expiredReviews'][$i]->reviews->count() < 2) {
                if($data['expiredReviews'][$i]->reviews->count() == 0)
                    $data['expiredReviewsCount'] += 1;
                for($j=0; $j<$data['expiredReviews'][$i]->reviews->count(); $j++) {
                    if(@$data['expiredReviews'][$i]->reviews[$j]->sender_id != Auth::user()->id)
                        $data['expiredReviewsCount'] += 1;
                }
            }
        }
        $data['title'] = 'Reviews';
        //echo "<pre>";print_r($data);exit();
        return view('users.reviews_tpl', $data);
    }

    public function edit_Reviews(Request $request)
    {
        $data['result'] = $reservationDetails = Bookings::find($request->id);
        $data['title']  = 'Update your reviews';
        if(Auth::user()->id == $reservationDetails->user_id) {
            $reviewsChecking = Reviews::where(['booking_id'=>$request->id, 'reviewer'=>'guest'])->get();
            $data['review_id'] = ($reviewsChecking->count()) ? $reviewsChecking[0]->id : '';
        }
        else {
            $reviewsChecking = Reviews::where(['booking_id'=>$request->id, 'reviewer'=>'host'])->get();
            $data['review_id'] = ($reviewsChecking->count()) ? $reviewsChecking[0]->id : '';
        }

        if(!$_POST) {
            if($reservationDetails->user_id == Auth::user()->id)
                return view('users.edit_reviews_guest', $data);
            else if($reservationDetails->host_id == Auth::user()->id)
                return view('users.edit_reviews_host', $data);
        }
        else {
           
            $data  = $request;
            if($data->review_id == '')
                $reviews = new Reviews;
            else
                $reviews = Reviews::find($data->review_id);

            $reviews->booking_id = $reservationDetails->id;
            $reviews->property_id = $reservationDetails->property_id;

            if($reservationDetails->user_id == Auth::user()->id) {
                $reviews->sender_id = $reservationDetails->user_id;
                $reviews->receiver_id = $reservationDetails->host_id;
                $reviews->reviewer = 'guest';
            }
            else if($reservationDetails->host_id == Auth::user()->id) {
                $reviews->sender_id = $reservationDetails->host_id;
                $reviews->receiver_id = $reservationDetails->user_id;
                $reviews->reviewer = 'host';
            }

            foreach($data->all() as $key=>$value) {
                if($key != 'section' && $key != 'review_id') {
                    $reviews->$key = $value;
                }
            }


            $reviews->save();
            
            return json_encode(['success'=>true, 'review_id'=>$reviews->id]);
        }
    }

    public function reviewDetails($id){
        $data['reviewsAboutYou'] = Reviews::where('id', $id)
                                    ->orderBy('id', 'desc')
                                    ->get();

        $data['reviewsByYou'] = Reviews::where('sender_id', Auth::user()->id)
                                    ->orderBy('id', 'desc')
                                 ->get();
        //echo "<pre>";print_r($data['reviewsByYou']);exit();

        $data['reviewsToWrite'] = Bookings::with(['reviews'])
                                    ->whereRaw('DATEDIFF(now(),end_date) <= 14')
                                    ->whereRaw('DATEDIFF(now(),end_date) >= 1')->where(['status'=>'Accepted'])->where(function($query) {
                            return $query->where('user_id', Auth::user()->id)->orWhere('host_id', Auth::user()->id);
                                    })->get();
     
        $data['expiredReviews'] = Bookings::with(['reviews'])->whereRaw('DATEDIFF(now(),end_date) > 14')->where(function($query) {
                return $query->where('user_id', Auth::user()->id)->orWhere('host_id', Auth::user()->id);
            })->get();

        $data['reviewsToWriteCount'] = 0;

        for($i=0; $i<$data['reviewsToWrite']->count(); $i++) {

            if($data['reviewsToWrite'][$i]->review_days > 0 && $data['reviewsToWrite'][$i]->reviews->count() < 2) {

                if($data['reviewsToWrite'][$i]->reviews->count() == 0)
                    $data['reviewsToWriteCount'] += 1;
                for($j=0; $j<$data['reviewsToWrite'][$i]->reviews->count(); $j++) {
                    if(@$data['reviewsToWrite'][$i]->reviews[$j]->sender_id != Auth::user()->id)
                        $data['reviewsToWriteCount'] += 1;
                }
            }
        }

        $data['expiredReviewsCount'] = 0;

        for($i=0; $i<$data['expiredReviews']->count(); $i++) {
            if($data['expiredReviews'][$i]->review_days <= 0 && $data['expiredReviews'][$i]->reviews->count() < 2) {
                if($data['expiredReviews'][$i]->reviews->count() == 0)
                    $data['expiredReviewsCount'] += 1;
                for($j=0; $j<$data['expiredReviews'][$i]->reviews->count(); $j++) {
                    if(@$data['expiredReviews'][$i]->reviews[$j]->sender_id != Auth::user()->id)
                        $data['expiredReviewsCount'] += 1;
                }
            }
        }
        $data['reviewDetails'] = Reviews::where('id','=',$id)->first();
        $data['title']         = 'View Review Details';
        return view('users.reviews_details', $data);

    }

    //Code for Reviews ends here...


    
}
