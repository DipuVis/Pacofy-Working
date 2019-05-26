<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Currency;
use App\Models\Language;
use App\Models\Settings;
use App\Models\JoinUs;
use View;
use Config;
use Schema;
use Auth;
use App;
use Session;
use App\Models\Page;

class SetDataServiceProvider extends ServiceProvider
{

    public function boot()
    {
    	if(env('DB_DATABASE') != '') {
	    	if(Schema::hasTable('currency'))
	        	$this->currency(); 
			
			if(Schema::hasTable('language'))
				$this->language(); 
			
			if(Schema::hasTable('settings')){
				$this->settings();
				$this->api_info_set();
			}
			if(Schema::hasTable('pages'))
				$this->pages();
			
			$this->creditcard_validation();
			
		}
    }

    public function creditcard_validation(){
    
        \Validator::extend('expires', function($attribute, $value, $parameters, $validator) {
            $input    = $validator->getData();

            $expiryDate = gmdate('Ym', gmmktime(0, 0, 0, (int) array_get($input, $parameters[0]), 1, (int) array_get($input, $parameters[1])));
            
            return ($expiryDate > gmdate('Ym')) ? true : false;
        });

        \Validator::extend('validate_cc', function($attribute, $value, $parameters) {
            $str = '';
            foreach (array_reverse(str_split($value)) as $i => $c) 
            {
                $str .= $i % 2 ? $c * 2 : $c;
            }

            return array_sum(str_split($str)) % 10 === 0;
        });
    }

    public function register()
    {
        //
    }
	
	public function currency()
	{
        @ini_set('max_execution_time',300);
        $currency = Currency::where('status', '=', 'Active')->pluck('code', 'code');
        View::share('currency', $currency);
		/*$appMode  = getenv('APP_MODE');
		if($appMode=='local'){
        	$ip  = '220.158.205.5';
    	}else{
    		$ip  = getenv("REMOTE_ADDR");
    	}*/
    	$ip      = getenv("REMOTE_ADDR");
        $result  = unserialize(@file_get_contents('http://www.geoplugin.net/php.gp?ip='.$ip));
        if($result['geoplugin_currencyCode']) {
        	$default_currency = Currency::where('status', '=', 'Active')->where('code', '=', $result['geoplugin_currencyCode'])->first();
        	if(!@$default_currency)
        		$default_currency = Currency::where('status', '=', 'Active')->where('default', '=', '1')->first();
        }
        else
        	$default_currency = Currency::where('status', '=', 'Active')->where('default', '=', '1')->first();
		
		if(!@$default_currency)
			$default_currency = Currency::where('status', '=', 'Active')->first();
		if(isset($default_currency->code)){
			Session::put('currency', $default_currency->code);
			$symbol = Currency::code_to_symbol($default_currency->code);
			Session::put('symbol', $symbol);
		}
		View::share('default_currency', $default_currency);
		View::share('default_country', $result['geoplugin_countryCode']);
	}
	
	public function language()
	{
        $language = Language::where('status', '=', 'Active')->pluck('name', 'short_name');
        View::share('language', $language);
		
		$default_language = Language::where('status', '=', 'Active')->where('default', '=', '1')->limit(1)->get();
        View::share('default_language', $default_language);
        if($default_language->count() > 0) {
			Session::put('language', $default_language[0]->value);
			App::setLocale($default_language[0]->value);
		}
	}
	
	public function pages()
	{
		$footer_first  = Page::where('position', 'first')->where('status', 'Active')->get();
        $footer_second = Page::where('position', 'second')->where('status', 'Active')->get();
        View::share('footer_first', $footer_first);
        View::share('footer_second', $footer_second);
	}
	
	public function api_info_set(){
		$google   = Settings::where('type', 'google')->pluck('value', 'name')->toArray();
		$facebook = Settings::where('type', 'facebook')->pluck('value', 'name')->toArray();
	//	dd($google);
		if(isset($google['client_id']))
            \Config::set(['services.google' => [
                    'client_id' => $google['client_id'],
                    'client_secret' => $google['client_secret'],
                    'redirect' => url('/googleAuthenticate'),
                    ]
                ]);

        if(isset($facebook['client_id']))
        	 \Config::set(['services.facebook' => [
                        'client_id' => $facebook['client_id'],
                        'client_secret' => $facebook['client_secret'],
                        'redirect' => url('/facebookAuthenticate'),
                        ]
                        ]);
	}


	public function settings()
	{
        $settings = Settings::all();
        
        if(isset($settings[0])){	
        	$general = Settings::where('type', 'general')->pluck('value', 'name')->toArray();
        	$map     = Settings::where('type', 'googleMap')->pluck('value', 'name')->toArray();

	        View::share('settings', $settings);

	        $join_us = Settings::where('type', 'join_us')->get();
			View::share('join_us', $join_us);
			
			define('SITE_NAME', $general['name']);
			define('LOGO_URL', url('public/front/images/logos/'.$general['logo']));
			define('EMAIL_LOGO_URL', url('public/front/images/logos/'.$general['email_logo']));

			View::share('site_name', $general['name']);
			View::share('head_code', $general['head_code']);
			View::share('logo', url('public/front/images/logos/'.$general['logo']));
			View::share('favicon', url('public/front/images/logos/'.$general['favicon']));
			if(isset($settings[26]->value)){
                    \View::share('map_key', $map['key']);
                    define('MAP_KEY', $map['key']);
            }
			Config::set('site_name', $general['name']);
		}
	}
}
