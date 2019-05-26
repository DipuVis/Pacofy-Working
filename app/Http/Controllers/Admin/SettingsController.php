<?php

/**
 * Settings Controller
 *
 * Settings Controller manages Settings by admin. 
 *
 * @category   Settings
 * @package    vRent
 * @author     Techvillage Dev Team
 * @copyright  2017 Techvillage
 * @license    
 * @version    1.3
 * @link       http://techvill.net
 * @email      support@techvill.net
 * @since      Version 1.3
 * @deprecated None
 */

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Helpers\Common;
use App\Models\Settings;
use App\Models\PaymentSetting;
use App\Models\Language;
use App\Models\Currency;
use App\Models\PropertyFees;
use App\Models\Admin;
use Validator;
use Mail;
use DB;
//use Session;
class SettingsController extends Controller
{
    protected $helper;

    public function __construct()
    {
        $this->helper = new Common;
    }

    public function general(Request $request)
    {
        if(!$_POST)
        {
            $general          = Settings::where('type','general')->orWhere('type','googleMap')->get()->toArray();
            $data['result']   = $this->helper->key_value('name', 'value', $general);
            $data['language'] = $this->helper->key_value('id', 'name', Language::where('status','=','active')->get()->toArray());
            $data['currency'] = $this->helper->key_value('id', 'name', Currency::where('status','=','active')->get()->toArray());
            //echo "<pre>";print_r($data['currency']);
            return view('admin.settings.general', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'name'              => 'required',
                    'default_currency'  => 'required',
                    'default_language'  => 'required',
                );

            $fieldNames = array(
                    'name'              => 'Name',
                    'default_currency'  => 'Default Currency',
                    'default_language'  => 'required',
                 );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                if(env('APP_MODE', '') != 'test'){
                    $head_code = is_null($request->head_code)?'':$request->head_code;
                    Settings::where(['name' => 'name'])->update(['value' => $request->name]);
                    Settings::where(['name' => 'head_code'])->update(['value' =>  $head_code]);
                    Settings::where(['name' => 'default_currency'])->update(['value' => $request->default_currency]);
                    Settings::where(['name' => 'default_language'])->update(['value' => $request->default_language]);
                    Language::where('default', '=', '1')->update(['default' => '0']);
                    Language::where('id', $request->default_language)->update(['default' => '1']);

                    Currency::where('default', '=', '1')->update(['default' => '0']);
                    Currency::where('id', $request->default_currency)->update(['default' => '1']);

                    foreach($_FILES["photos"]["error"] as $key=>$error) 
                    {
                        $tmp_name = $_FILES["photos"]["tmp_name"][$key];

                        $name = str_replace(' ', '_', $_FILES["photos"]["name"][$key]);
                        
                        $ext = pathinfo($name, PATHINFO_EXTENSION);

                        $name = time().'_'.$key.'.'.$ext;
                                                   
                        if($ext == 'png' || $ext == 'jpg' || $ext == 'jpeg' || $ext == 'gif' || $ext == 'ico')   
                        {            
                            if(move_uploaded_file($tmp_name, "public/front/images/logos/".$name))
                            {
                                Settings::where(['name' => $key])->update(['value' => $name]);
                            }
                        }
                    }
                }
                $this->helper->one_time_message('success', 'Updated Successfully');

                return redirect('admin/settings');
            }
        }
    }

    public function photos(Request $request)
    {
        if(!$_POST)
        {
            $photos = Settings::where('type','photos')->get()->toArray();
            $data['result'] = $this->helper->key_value('name', 'value', $photos);
            return view('admin.settings.photos', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'photo_min_height' => 'required',
                    'photo_min_width'  => 'required',
                    'photo_max_size'   => 'required'
                );

            
            $fieldNames = array(
                    'photo_min_height' => 'Minimum Height',
                    'photo_min_width'  => 'Minimum Width',
                    'photo_max_size'   => 'Max Size'
                 );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                if(env('APP_MODE', '') != 'test'){
                    Settings::where(['name' => 'photo_min_height'])->update(['value' => $request->photo_min_height]);
                    Settings::where(['name' => 'photo_min_width'])->update(['value' => $request->photo_min_width]);
                    Settings::where(['name' => 'photo_max_size'])->update(['value' => $request->photo_max_size]);
                }

                $this->helper->one_time_message('success', 'Updated Successfully');

                return redirect('admin/settings/photos');
            }
        }
    }

    public function email(Request $request)
    {
        if(!$_POST)
        {
            $general         = Settings::where('type','email')->get()->toArray();
            $data['result']  = $this->helper->key_value('name', 'value', $general);
            $data['drivers'] = array('smtp'=>'SMTP','sendmail'=>'Send Mail');
            return view('admin.settings.email', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'driver'            => 'required',
                    'host'              => 'required',
                    'port'              => 'required',
                    'from_address'      => 'required',
                    'from_name'         => 'required',
                    'encryption'        => 'required',
                    'username'          => 'required',
                    'password'          => 'required',
                );

            $fieldNames = array(
                    'driver'            => 'Driver',
                    'host'              => 'Host',
                    'port'              => 'Port',
                    'from_address'      => 'From Address',
                    'from_name'         => 'From Name',
                    'encryption'        => 'Encryption',
                    'username'          => 'Username',
                    'password'          => 'Password',
                 );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                //echo "<pre>";print_r($request->all());exit();
                if($request->driver=='smtp'){
                   /* Start Checking SMTP */
                 \Config::set([
                    'mail.driver'     => isset($request->driver) ? $request->driver : '',

                    'mail.host'       => isset($request->host) ? $request->host : '',

                    'mail.port'       => isset($request->port) ?$request->port : '',

                    'mail.from'       => ['address' => isset($request->from_address) ? $request->from_address : '',
                    'name'            => isset($request->from_name) ? $request->from_name : '' ],

                    'mail.encryption' => isset($request->encryption) ? $request->encryption : '',

                    'mail.username'   => isset($request->username) ? $request->username : '',

                    'mail.password'   => isset($request->password) ? $request->password : ''
                    ]);
                    $adminDetails     = Admin::where('status','active')->first();
                    $fromInfo         = \Config::get('mail.from');
                    $user             = [];
                    $user['to']       = $fromInfo['address'];
                    //$user['from']     = $fromInfo['address'];
                    $user['from']     = $adminDetails->email;
                    $user['fromName'] = ucfirst($adminDetails->username);
                    try{
                        $ok = Mail::send('emails.verify', ['user' => $user], function ($m) use ($user) {
                            $m->from($user['from'],$user['fromName']);
                            $m->to($user['to']);
                            $m->subject('Verify SMTP Settings');
                        });
                        $field    = 'email_status';
                        $res      =  DB::table('settings')->where(['name' => $field])->count();
                        if($res==0){
                            DB::insert(DB::raw("INSERT INTO settings(name,value,type) VALUES ('$field','1','email')"));
                        }else{
                            DB::table('settings')->where(['name' => $field])->update(array('name'=>$field,'value' => 1));
                        }
                        $this->helper->one_time_message('success', 'Updated Successfully');

                    }catch(\Exception $e){
                        $field    = 'email_status';
                        $res      =  DB::table('settings')->where(['name' => $field])->count();
                        if($res==0){
                            DB::insert(DB::raw("INSERT INTO settings(name,value,type) VALUES ('$field','0','email')"));
                        }else{
                            DB::table('settings')->where(['name' => $field])->update(array('name'=>$field,'value' => 0));
                        }
                       
                    }

                   /*   End Checking  */
        
                    if(env('APP_MODE', '') != 'test'){
                        Settings::where(['name' => 'driver'])->update(['value' => $request->driver]);
                        Settings::where(['name' => 'host'])->update(['value' => $request->host]);
                        Settings::where(['name' => 'port'])->update(['value' => $request->port]);
                        Settings::where(['name' => 'from_address'])->update(['value' => $request->from_address]);
                        Settings::where(['name' => 'from_name'])->update(['value' => $request->from_name]);
                        Settings::where(['name' => 'encryption'])->update(['value' => $request->encryption]);
                        Settings::where(['name' => 'username'])->update(['value' => $request->username]);
                        Settings::where(['name' => 'password'])->update(['value' => $request->password]);
                    }
                }else{
                   if(env('APP_MODE', '') != 'test'){
                        Settings::where(['name' => 'driver'])->update(['value' => $request->driver]);
                    } 
                    $this->helper->one_time_message('success', 'Updated Successfully');
                }

                //$this->helper->one_time_message('success', 'Updated Successfully');

                return redirect('admin/settings/email');
            }
        }
    }

    

    public function payment_methods(Request $request)
    {

        if(!$_POST)
        {
            $paypal = Settings::where('type','paypal')->get()->toArray();
            $stripe = Settings::where('type','stripe')->get()->toArray();
            $data['paypal'] = $this->helper->key_value('name', 'value', $paypal);
            $data['stripe'] = $this->helper->key_value('name', 'value', $stripe);
            
            //return $data;
            return view('admin.settings.payment', $data);
        }
        else if($_POST['gateway'] == 'paypal')
        {
           
            $rules = array(
                    'username'      => 'required',
                    'password'      => 'required',
                    'signature'     => 'required',
                    'mode'          => 'required',
                    'paypal_status' => 'required',
                );

            
            $fieldNames = array(
                    'username'      => 'PayPal Username',
                    'password'      => 'PayPal Password',
                    'signature'     => 'PayPal Signature',
                    'mode'          => 'PayPal Mode',
                    'paypal_status' => 'Paypal Status',
                 );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                $data['success'] = 0;
                $data['errors'] = $validator->messages();
                echo json_encode($data);
            }
            else
            {
                //dd($request->all());
                //echo "ddd";exit();
                if(env('APP_MODE', '') != 'test'){
                    Settings::where(['name' => 'username', 'type' => 'PayPal'])->update(['value' => $request->username]);
                    Settings::where(['name' => 'password', 'type' => 'PayPal'])->update(['value' => $request->password]);
                    Settings::where(['name' => 'signature', 'type' => 'PayPal'])->update(['value' => $request->signature]);
                    Settings::where(['name' => 'mode', 'type' => 'PayPal'])->update(['value' => $request->mode]);
                    
                    $match                  = ['type'=>'PayPal','name'=>'paypal_status'];               
                    $paymentSettings        = Settings::firstOrNew($match);
                    $paymentSettings->name  = 'paypal_status';
                    $paymentSettings->value = $request->paypal_status;
                    $paymentSettings->type  = 'PayPal';
                    $paymentSettings->save();
                    
                }

                $data['message'] = 'Updated Successfully';
                $data['success'] = 1;
                echo json_encode($data);
            }
        }
        else if($_POST['gateway'] == 'stripe')
        {
            $rules = array(
                'secret_key'            => 'required',
                'publishable_key'       => 'required',
                'stripe_status'         => 'required',
            );

            $fieldNames = array(
                'secret_key'        => 'Secret Key',
                'publishable_key'   => 'Publishable Key',
                'stripe_status'     => 'Stripe Status',
            );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                $data['success'] = 0;
                $data['errors'] = $validator->messages();
                echo json_encode($data);
            }
            else
            {
                if(env('APP_MODE', '') != 'test'){
                    Settings::where(['name' => 'secret', 'type' => 'Stripe'])->update(['value' => $request->secret_key]);
                    Settings::where(['name' => 'publishable', 'type' => 'Stripe'])->update(['value' => $request->publishable_key]);

                    $match                  = ['type'=>'Stripe','name'=>'stripe_status'];               
                    $paymentSettings        = Settings::firstOrNew($match);
                    $paymentSettings->name  = 'stripe_status';
                    $paymentSettings->value = $request->stripe_status;
                    $paymentSettings->type  = 'Stripe';
                    $paymentSettings->save();
                }

                $data['message'] = 'Updated Successfully';
                $data['success'] = 1;
                echo json_encode($data);
            }
        }
    }

    public  function social_links(Request $request)
    {
        if(!$_POST)
        {
            $general = Settings::where('type','join_us')->get()->toArray();
            $data['result'] = $this->helper->key_value('name', 'value', $general);
            
            return view('admin.settings.social', $data);
        }
        else if($_POST)
        {
            
            $rules = array(
                    'facebook'          => 'required',
                    'google_plus'       => 'required',
                    'twitter'           => 'required',
                    'linkedin'          => 'required',
                    'pinterest'         => 'required',
                    'youtube'           => 'required',
                    'instagram'         =>'required'
                    
                );

            $fieldNames = array(
                    'facebook'            => 'Facebook',
                    'google_plus'         => 'Google Plus',
                    'twitter'             => 'Twitter',
                    'linkedin'            => 'Linkedin',
                    'pinterest'           => 'Pinterest',
                    'youtube'             => 'Youtube',
                    'instagram'           => 'Instagram'
                   
                 );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                if(env('APP_MODE', '') != 'test'){
                    Settings::where(['name' => 'facebook'])->update(['value' => $request->facebook]);
                    Settings::where(['name' => 'google_plus'])->update(['value' => $request->google_plus]);
                    Settings::where(['name' => 'twitter'])->update(['value' => $request->twitter]);
                    Settings::where(['name' => 'linkedin'])->update(['value' => $request->linkedin]);
                    Settings::where(['name' => 'pinterest'])->update(['value' => $request->pinterest]);
                    Settings::where(['name' => 'youtube'])->update(['value' => $request->youtube]);
                    Settings::where(['name' => 'instagram'])->update(['value' => $request->instagram]);
                }

                $this->helper->one_time_message('success', 'Updated Successfully');
                return redirect('admin/settings/social_links');
            }
        }
    }

    public function api_informations(Request $request)
    {
        if(!$_POST)
        {
            $data['google'] = Settings::where('type', 'google')->pluck('value', 'name')->toArray();
            $data['google_map'] = Settings::where('type', 'googleMap')->pluck('value', 'name')->toArray();
            $data['facebook'] = Settings::where('type', 'facebook')->pluck('value', 'name')->toArray();
            return view('admin.api_credentials', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'facebook_client_id'     => 'required',
                    'facebook_client_secret' => 'required',
                    'google_client_id'       => 'required',
                    'google_client_secret'   => 'required',
                    'google_map_key'         => 'required',
                    );

            $fieldNames = array(
                        'facebook_client_id'     => 'Facebook Client ID',
                        'facebook_client_secret' => 'Facebook Client Secret',
                        'google_client_id'       => 'Google Client ID',
                        'google_client_secret'   => 'Google Client Secret',
                        'google_map_key'   => 'Google Map Browser Key',
                        'google_map_server_key'   => 'Google Map Server Key',
                        );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                if(env('APP_MODE', '') != 'test'){
                    Settings::where(['name' => 'client_id', 'type' => 'Facebook'])->update(['value' => $request->facebook_client_id]);

                    Settings::where(['name' => 'client_secret', 'type' => 'Facebook'])->update(['value' => $request->facebook_client_secret]);

                    Settings::where(['name' => 'client_id', 'type' => 'Google'])->update(['value' => $request->google_client_id]);

                    Settings::where(['name' => 'client_secret', 'type' => 'Google'])->update(['value' => $request->google_client_secret]);

                    Settings::where(['name' => 'key', 'type' => 'GoogleMap'])->update(['value' => $request->google_map_key]);

                    //ApiCredentials::where(['name' => 'server_key', 'site' => 'GoogleMap'])->update(['value' => $request->google_map_server_key]);

                    $this->helper->one_time_message('success', 'Updated Successfully'); 
                }
                
                return redirect('admin/settings/api_informations');
            }
        }
        else
        {
            return redirect('admin/settings/api_informations');
        }
    }

    public function fees(Request $request){
        if($_POST){
            $rules = array(
                    'more_then_seven'       => 'required',
                    'less_then_seven'       => 'required',
                    'guest_service_charge'  => 'required|numeric|max:99|min:0'
                );

            $fieldNames = array(
                    'more_then_seven'        => 'Field',
                    'less_then_seven'        => 'Field',
                    'guest_service_charge'   => 'Field'
                );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                PropertyFees::where(['field' => 'more_then_seven'])->update(['value' => $request->more_then_seven]);
                PropertyFees::where(['field' => 'less_then_seven'])->update(['value' => $request->less_then_seven]);
                PropertyFees::where(['field' => 'guest_service_charge'])->update(['value' => $request->guest_service_charge]);
                $this->helper->one_time_message('success', 'Updated Successfully');
            }
        }

        $fees = PropertyFees::pluck('value', 'field')->toArray();
        $data['result'] = $fees;
        return view('admin.settings.fees', $data);
    }

    
}
