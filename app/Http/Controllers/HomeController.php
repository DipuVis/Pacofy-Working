<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Helpers\Common;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use View;
use Auth;
use App;
use Session;
use Route;
use App\Models\Currency;
use App\Models\Page;
use App\Models\Settings;
use App\Models\StartingCities;
use App\Models\Banners;
use App\Models\language;
use App\Models\Admin;
use Twilio\Rest\Client;
require base_path() . '/vendor/autoload.php';

        //require __DIR__ . '/vendor/autoload.php';

class HomeController extends Controller
{
    private $helper;
    
    public function __construct()
    {
        $this->helper = new Common;
    }
     
    public function index()
    {
        

    // $mac = $this->GetMAC();
    // echo strlen($mac);exit();
    


        /*$sid    = 'AC47c75ed49337d2a1d1f83c4078c5ee93';
        $token  = '6f4a4336ea8dba33fe5ff4b2220480be';
        $client = new Client($sid, $token);

        // Use the client to do fun stuff like send text messages!
        $client->messages->create(
            // the number you'd like to send the message to
            '+8801762723110',
            array(
                // A Twilio phone number you purchased at twilio.com/console
                'from' => '+16052773451 ',
                // the body of the text message you'd like to send
                'body' => 'This is a test message!Sent by a test account'
            )
        );
        */
        
        $data['starting_cities']     = StartingCities::where('status', 'Active')->get();
        //echo "<pre>";print_r($data['starting_cities']);exit();
        $data['city_count']          = StartingCities::where('status', 'Active')->get()->count();
        $data['banners']             = Banners::where('status', 'Active')->get();
        $sessionLanguage             = Session::get('language');
        $language                    = Settings::where(['name'=>'default_language','type'=>'general'])->first();
        //dd($language);
        $languageDetails             = language::where(['id'=>$language->value])->first();
        //dd($languageDetails);
        //echo $sessionLanguage;exit();
        if(!(@$sessionLanguage)){
            Session::pull('language');
            Session::put('language', $languageDetails->short_name);
            App::setLocale($languageDetails->short_name);
        }
        return view('home.home', $data);
    }
    
    public function phpinfo()
    {
        echo phpinfo();
    }

    public function login()
    {   
        return view('home.login');
    }
   
    public function set_session(Request $request)
    {
        if($request->currency) {
            Session::put('currency', $request->currency);
            $symbol = Currency::code_to_symbol($request->currency);
            Session::put('symbol', $symbol);
        }
        else if($request->language) {
            //echo $request->language;exit();
            Session::put('language', $request->language);
            App::setLocale($request->language);
        }
    }

    public function cancellation_policies()
    {
        return view('home.cancellation_policies');
    }
 
    public function static_pages(Request $request)
    {
        $pages          = Page::where(['url'=>$request->name, 'status'=>'Active']);
        if(!$pages->count()) abort('404');  
        $pages           = $pages->first();
        $data['content'] = str_replace(['SITE_NAME', 'SITE_URL'], [SITE_NAME, url('/')], $pages->content);
        $data['title']   = $pages->url;

        return view('home.static_pages', $data);
    }

}
