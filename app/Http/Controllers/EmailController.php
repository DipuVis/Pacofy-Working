<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Mail;
use Config;
use Auth;
use DateTime;
use DateTimeZone;
use App\Models\PasswordResets;
use App\Models\User;
use App\Models\Rooms;
use App\Models\Bookings;
use App\Models\Settings;
use App\Models\Payouts;
use App\Models\Currency;
use App\Models\Accounts;
use App\Models\Admin;
use App\Http\Helpers\Common;
use PHPMailer\PHPMailer\PHPMailer;
use DB;

class EmailController extends Controller
{
    private $helper;

    public function __construct(){
      $this->helper = new Common;
    }

   public function welcome_email($user)
    {
        //New Code starts here 
        $emailSettings               = Settings::where('type','email')->get()->toArray();
        $emailConfig                 = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails                = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        //New Code Ends here
        $token                       = $this->helper->randomCode(100);
        $password_resets             = new PasswordResets;
        $password_resets->email      = $user->email;
        $password_resets->token      = $token;
        $password_resets->created_at = date('Y-m-d H:i:s');
        $password_resets->save();

        $data['first_name'] = $user->first_name;
        $data['email']      = $user->email;
        $data['token']      = $token;
        $data['type']       = 'register';
        $data['url']        = url('/').'/';

        $data['subject']    = "Please confirm your e-mail address";
        $data['view']       = resource_path('views/sendmail/email_confirm.blade.php');
        $data['link']       = $data['url'].'users/confirm_email?code='.$data['token'];
        $data['message_body'] = '';
        $data['user_name']    = '';
        if(env('APP_MODE', '') != 'test'){
            if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
                @Mail::send('emails.email_confirm', $data, function($message) use($data) {
                    $message->to($data['email'], $data['first_name'])->subject('Please confirm your e-mail address');
                });
            }else if($emailConfig['driver']=='sendmail'){
                $this->sendPhpEmail($data,$emailConfig);
            }
        }
        return true;
    }

   
    public function forgot_password($user)
    {

        $emailSettings   = Settings::where('type','email')->get()->toArray();
        $emailConfig     = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails    = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        $token = $this->helper->randomCode(100);
        $exist = PasswordResets::where('token', $token)->count();
        while ($exist) {
            $token = $this->helper->randomCode(100);
            $exist = PasswordResets::where('token', $token)->count();
        }

        $password_resets = new PasswordResets;
        $password_resets->email      = $user->email;
        $password_resets->token      = $token;
        $password_resets->created_at = date('Y-m-d H:i:s');
        $password_resets->save();

        $data['first_name'] = $user->first_name;
        $data['email']      = $user->email;
        $data['token']      = $token;
        $data['url']        = url('/').'/';

        $data['subject']    = "Reset your Password";
        $data['link']       = $data['url'].'users/reset_password?secret='.$token;
        $data['view']       = resource_path('views/sendmail/forget_password.blade.php');
        $data['message_body'] = '';
        $data['user_name']    = '';
        //echo "<pre>";print_r($data);exit();
        if(env('APP_MODE', '') != 'test'){
        if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
             @Mail::send('emails.forgot_password', $data, function($message) use($user) {
                $message->to($user->email, $user->first_name)->subject('Reset your Password');
            });
         }else if($emailConfig['driver']=='sendmail'){
             $this->sendPhpEmail($data,$emailConfig);
         } 
        }
        return true;
    }

    public function change_email_confirmation($user)
    {

        $emailSettings   = Settings::where('type','email')->get()->toArray();
        $emailConfig     = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails    = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        $token = $this->helper->randomCode(100);

        $password_resets = new PasswordResets;
        $password_resets->email      = $user->email;
        $password_resets->token      = $token;
        $password_resets->created_at = date('Y-m-d H:i:s');
        $password_resets->save();

        $data['first_name']  = $user->first_name;
        $data['email']       = $user->email;
        $data['token']       = $token;
        $data['type']        = 'change';
        $data['url']         = url('/').'/';

        $data['subject']     = "Please confirm your e-mail address";
        $data['view']        = resource_path('views/sendmail/email_confirm.blade.php');
        $data['link']        = $data['url'].'users/confirm_email?code='.$data['token'];
        $data['message_body'] ="";
        $data['user_name']    = '';

        if(env('APP_MODE', '') != 'test'){
            if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
                @Mail::send('emails.email_confirm', $data, function($message) use($user) {
                $message->to($user->email, $user->first_name)->subject('Please confirm your e-mail address');
            });
            }
            else if($emailConfig['driver']=='sendmail'){
              $this->sendPhpEmail($data,$emailConfig);
            }
            
        }
        return true;
    }

    public function new_email_confirmation($user)
    {

        $emailSettings   = Settings::where('type','email')->get()->toArray();
        $emailConfig     = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails    = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        $token = $this->helper->randomCode(100);

        $password_resets = new PasswordResets;
        $password_resets->email      = $user->email;
        $password_resets->token      = $token;
        $password_resets->created_at = date('Y-m-d H:i:s');
        $password_resets->save();

        $data['first_name']   = $user->first_name;
        $data['email']        = $user->email;
        $data['token']        = $token;
        $data['type']         = 'new_confirm';
        $data['url']          = url('/').'/';

        $data['subject']      = "Please confirm your e-mail address";
        $data['view']         = resource_path('views/sendmail/email_confirm.blade.php');
        $data['link']         = $data['url'].'users/confirm_email?code='.$data['token'];
        $data['message_body'] = '';
        $data['user_name']    = '';
        if(env('APP_MODE', '') != 'test'){
             if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
                @Mail::send('emails.email_confirm', $data, function($message) use($user) {
                $message->to($user->email, $user->first_name)->subject('Please confirm your e-mail address');
            });
            }else if($emailConfig['driver']=='sendmail'){
              $this->sendPhpEmail($data,$emailConfig);
            }
        }

        return true;
    }

    public function account_preferences($account_id, $type = 'update')
    {

        //echo $type;exit();
        $emailSettings   = Settings::where('type','email')->get()->toArray();
        $emailConfig     = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails    = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        if($type != 'delete') {
            $result               = Accounts::find($account_id);
            $user                 = $result->users;
            $data['first_name']   = $user->first_name;
            $data['email']        = $user->email;
            $data['updated_time'] = $result->updated_at_time;
            $data['updated_date'] = $result->updated_at_date;
        }else {
            $user = Auth::user();
            $data['first_name'] = $user->first_name;
            $data['email']      = $user->email;
            $now_dt = new DateTime(date('Y-m-d H:i:s'));
            $data['deleted_time'] = $now_dt->format('d M').' at '.$now_dt->format('H:i');
        }

        $data['type']      = $type;
        $data['url']       = url('/').'/';
        $data['view']      = resource_path('views/sendmail/account_preferences.blade.php');
        $data['link']      = $data['url'].'users/account_preferences';

        if($type == 'update'){
            $data['subject'] = $subject = "Your Payout information has been updated in ".SITE_NAME;
            $data['message_body']="Your ".$emailConfig['from_name']." payout information was updated on ".$data['updated_time'].".";
        }
        else if($type == 'delete'){
             $data['subject']           = $subject = "Your payout information has been deleted in ".SITE_NAME;
             $data['message_body']      = "Your ".$emailConfig['from_name']." payout information was updated on ".$data['deleted_time'].".";
         }
        else if($type == 'default_update'){
             $data['subject']       =  $subject = "Your Default Payout Information Has Been Changed in ".SITE_NAME;
             $data['message_body']  ="We hope this message finds you well. Your ".$emailConfig['from_name']." payout account information was recently changed on ".$data['updated_time'].". To help keep your account secure, we wanted to reach out to confirm that you made this change. Feel free to disregard this message if you updated your payout account information on ".$data['updated_time'].".";
         }

         $data['user_name']    = '';
         //$data['email']        = $user->email;
        if(env('APP_MODE', '') != 'test'){
            if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
                @Mail::send('emails.account_preferences', $data, function($message) use($user, $data, $subject) {
                $message->to($user->email, $user->first_name)->subject($subject);
            });
            }
            else if($emailConfig['driver']=='sendmail'){
              $this->sendPhpEmail($data,$emailConfig);
            }
            
        }
        return true;
    }

    public function booking($booking_id)
    {

        $emailSettings   = Settings::where('type','email')->get()->toArray();
        $emailConfig     = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails    = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        $booking         = Bookings::find($booking_id);
        $user            = $booking->host;
        //echo "<pre>";print_r($user);
        $data['url']     = url('/').'/';
        $data['result']  = Bookings::where('bookings.id', $booking_id)->with(['users', 'properties', 'host', 'currency', 'messages'])->first()->toArray();
        //echo "<pre>";print_r($data['result']);exit();
        $data['subject']    = "Booking inquiry for ".$data['result']['properties']['name'];
        $data['url']        = url('/').'/';
        $data['view']       = resource_path('views/sendmail/booking.blade.php');
        $data['link']       = $data['url'].'booking/'.$data['result']['id'];
        $data['user_name']  = $data['result']['users']['first_name'];
        $data['first_name'] = $data['result']['host']['first_name'];
        $data['email']      = $user->email;
        $total_night = $data['result']['total_night']>1?"nights":"night";
        $data["total_night"]=$data['result']['total_night'].' '.$total_night;

        $guest = $data['result']['guest']>1?"guests":"guest";
        $data["total_guest"]=$data['result']['guest'].' '.$guest;


        $data['message_body'] =$data["total_night"].' at '.$data['result']['properties']['name'].'<br>'.$data['result']['messages'][0]['message'].'<br>Property Name: '.$data['result']['properties']['name'].'<br> Number of Guest:'.$data["total_guest"].'<br> Number of Night:'.$data["total_night"].'<br> Checkin Time:'.$data['result']['start_date'];

        // echo "<pre>";print_r($data);exit();

        if(env('APP_MODE', '') != 'test'){
            if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
                    @Mail::send('emails.booking', $data, function($message) use($user, $data) {
                    //echo "<pre>";print_r($user);exit();
                    $message->to($user->email, $user->first_name)->subject("Booking inquiry for ".$data['result']['properties']['name']);
            });
            }
            else if($emailConfig['driver']=='sendmail'){
              $this->sendPhpEmail($data,$emailConfig);
            }
            
        }
        return true;
    }

    //item sold --
    public function item_sold($photo){
        $emailSettings   = Settings::where('type','email')->get()->toArray();
        $emailConfig     = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails                = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        $user = $photo->users;
        $url = url('photo/single/'.$photo->id);

        $data['url']       = url('/').'/';
        $data['subject']    = "Photo sold";
        $data['link']='';
        $data['view']      = resource_path('views/sendmail/custom_email.blade.php');
        $data['message_body'] = 'One of your <a href="'.$url.'">photo</a> sold';
        $data['content'] = 'One of your <a href="'.$url.'">photo</a> sold';
       
        if(env('APP_MODE', '') != 'test'){
             if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
                @Mail::send('emails.custom_email', $data, function($message) use($user, $data) {
                $message->to($user->email, $user->first_name)->subject("Photo sold");
                });
             }
             else if($emailConfig['driver']=='sendmail'){
              $this->sendPhpEmail($data,$emailConfig);
            }
            
        }
        return true;
    }

    public function need_pay_account($booking_id, $type)
    {
        $emailSettings   = Settings::where('type','email')->get()->toArray();
        $emailConfig     = $this->helper->key_value('name','value',$emailSettings);
        $adminDetails                = Admin::where('status','active')->first();
        $emailConfig['email_address']= $adminDetails->email;
        $emailConfig['username']     = $adminDetails->username;
        $result       = Bookings::find($booking_id);
        $data['type'] = $type;
        
        if($type == 'guest') {
            $user                  = $result->users;
            $data['email']         = $user->email;
            $data['payout_amount'] = $result->admin_guest_payment;
        }
        else {
            $user                  = $result->host;
            $data['email']         = $user->email;
            $data['payout_amount'] = $result->admin_host_payment;
        }

        $data['currency_symbol'] = $result->currency->symbol;
        $data['first_name']      = $user->first_name;
        $data['user_id']         = $user->id;
        $data['url'] = url('/').'/';

        $data['subject']    = "Please set a payment account";
        $data['view']       = resource_path('views/sendmail/need_pay_account.blade.php');
        $data['link']       = $data['url'].'users/account_preferences';
        
        $data['message_body']= "Amount ".$data['currency_symbol']." ".$data['payout_amount']." is waiting for you but you did not add any payment account to send the money. Please log in to your ".SITE_NAME." account and";
        $data['user_name']    = '';
        if(env('APP_MODE', '') != 'test'){
            if($emailConfig['driver']=='smtp' && $emailConfig['email_status']==1){
            @Mail::send('emails.need_pay_account', $data, function($message) use($user, $data) {
                $message->to($user->email, $user->first_name)->subject("Please set a payment account");
            });
        }else if($emailConfig['driver']=='sendmail'){
              $this->sendPhpEmail($data,$emailConfig);
            }
        }
        return true;
    }

    public function sendPhpEmail($data,$configEmail)
    {
        require 'vendor/autoload.php';
        $mail            = new PHPMailer(true);
        $mail->SetFrom($configEmail['email_address'], ucfirst($configEmail['username']));
        $mail->AddAddress($data['email'], $data['first_name']);
        $mail->WordWrap  = 50;
        $mail->Subject   = $data['subject'];
        $link            = $data['link'];
        $message         = file_get_contents($data['view']); 
        $message         = str_replace('#site_name#', $configEmail['from_name'], $message); 
        $message         = str_replace('#first_name#', $data['first_name'], $message); 
        $message         = str_replace('#link#', $link, $message); 
        $message         = str_replace('#message_body#',$data['message_body'], $message); 
        $message         = str_replace('#user_name#',$data['user_name'], $message); 
        $mail->MsgHTML($message);
        $mail->IsHTML(true); 
        $mail->CharSet="utf-8";        
        $mail->Send();
    }

}
