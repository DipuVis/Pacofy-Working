<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//cron job
Route::get('cron', 'CronController@index');
Route::get('import', 'CronController@ImportDump');


//user can view it anytime with or without logged in
Route::group(['middleware' => ['locale']], function () {
	Route::get('/', 'HomeController@index');
	Route::post('search/result', 'SearchController@search_result');
	Route::get('search', 'SearchController@index');
	Route::match(array('GET', 'POST'),'properties/{id}', 'PropertyController@single');
	Route::post('property/get-price', 'PropertyController@get_price');
	Route::get('signup', 'LoginController@signup');
	Route::post('/checkUser/check', 'LoginController@check')->name('checkUser.check');

});
//Auth::routes();

Route::post('set_session', 'HomeController@set_session');

//only can view if admin is logged in
Route::group(['prefix' => 'admin', 'middleware' => ['guest:admin']], function(){
	Route::get('/', function(){
        return Redirect::to('admin/dashboard');
    });
    Route::match(array('GET', 'POST'), 'profile', 'Admin\AdminController@profile');
    Route::get('logout', 'Admin\AdminController@logout');
	Route::get('dashboard', 'Admin\DashboardController@index');
	Route::get('customers', 'Admin\CustomerController@index')->middleware(['permission:customers']);
	Route::match(array('GET', 'POST'), 'add_customer', 'Admin\CustomerController@add')->middleware(['permission:add_customer']);
	Route::match(array('GET', 'POST'), 'edit_customer/{id}', 'Admin\CustomerController@update')->middleware(['permission:edit_customer']);
    

	Route::get('properties', 'Admin\PropertiesController@index')->middleware(['permission:properties']);
	
	Route::match(array('GET', 'POST'), 'add_properties', 'Admin\PropertiesController@add')->middleware(['permission:add_properties']);

     Route::match(array('GET', 'POST'),'listing/{id}/photo_message', 'Admin\PropertiesController@photo_message');

    Route::match(array('GET', 'POST'),'listing/{id}/photo_delete', 'Admin\PropertiesController@photo_delete');

    Route::match(array('GET', 'POST'),'listing/{id}/update_status', 'Admin\PropertiesController@update_status');

	Route::match(array('POST'),'listing/photo/make_default_photo', 'Admin\PropertiesController@make_default_photo');

	Route::match(array('POST'),'listing/photo/make_photo_serial', 'Admin\PropertiesController@make_photo_serial');

    Route::match(array('GET', 'POST'),'listing/{id}/{step}', 'Admin\PropertiesController@listing')->where(['id' => '[0-9]+','page' => 'basics|description|location|amenities|photos|pricing|calendar|details|booking']);


    Route::post('ajax-calender/{id}', 'Admin\CalendarController@calender_json');
    Route::post('ajax-calender-price/{id}', 'Admin\CalendarController@calender_price_set');

	Route::match(array('GET', 'POST'), 'edit_property/{id}', 'Admin\PropertiesController@update')->middleware(['permission:edit_properties']);
	Route::get('delete_property/{id}', 'Admin\PropertiesController@delete')->middleware(['permission:delete_property']);

	Route::get('bookings', 'Admin\BookingsController@index')->middleware(['permission:manage_bookings']);
	Route::get('bookings/detail/{id}', 'Admin\BookingsController@details')->middleware(['permission:manage_bookings']);
	Route::post('bookings/pay', 'Admin\BookingsController@pay')->middleware(['permission:manage_bookings']);
	Route::get('booking/need_pay_account/{id}/{type}', 'Admin\BookingsController@need_pay_account');
	
	Route::group(['middleware' => 'permission:manage_penalty'], function () {
		Route::get('host_penalty', 'Admin\PenaltiesController@host_penalty');
		Route::get('guest_penalty', 'Admin\PenaltiesController@guest_penalty');
	});

	Route::group(['middleware' => 'permission:manage_reviews'], function () {
		Route::get('reviews', 'Admin\ReviewsController@index');
		Route::match(array('GET', 'POST'), 'edit_review/{id}', 'Admin\ReviewsController@edit');
	});

	Route::get('reports', 'Admin\ReportsController@index')->middleware(['permission:manage_reports']);

	Route::group(['middleware' => 'permission:manage_amenities'], function () {
		Route::get('amenities', 'Admin\AmenitiesController@index');
		Route::match(array('GET', 'POST'), 'add_amenities', 'Admin\AmenitiesController@add');
		Route::match(array('GET', 'POST'), 'edit_amenities/{id}', 'Admin\AmenitiesController@update');
		Route::get('delete_amenities/{id}', 'Admin\AmenitiesController@delete');
	});

	Route::group(['middleware' => 'permission:manage_pages'], function () {
		Route::get('pages', 'Admin\PagesController@index');
		Route::match(array('GET', 'POST'), 'add_page', 'Admin\PagesController@add');
		Route::match(array('GET', 'POST'), 'edit_page/{id}', 'Admin\PagesController@update');
		Route::get('delete_page/{id}', 'Admin\PagesController@delete');
	});

	
	Route::group(['middleware' => 'permission:manage_admin'], function () {
		Route::get('admin_users', 'Admin\AdminController@index');
		Route::match(array('GET', 'POST'), 'add_admin', 'Admin\AdminController@add');
		Route::match(array('GET', 'POST'), 'edit_admin/{id}', 'Admin\AdminController@update');
		Route::match(array('GET', 'POST'), 'delete_admin/{id}', 'Admin\AdminController@delete');
	});


	Route::group(['middleware' => 'permission:manage_withdraw'], function () {
		Route::get('withdrawals', 'Admin\WithdrawalsController@index');
		Route::get('withdrawals/approve/{id}', 'Admin\WithdrawalsController@approve_payments');
	});

	Route::match(array('GET', 'POST'), 'settings', 'Admin\SettingsController@general')->middleware(['permission:general_setting']);
	Route::match(array('GET', 'POST'), 'settings/fees', 'Admin\SettingsController@fees')->middleware(['permission:general_setting']);

	Route::group(['middleware' => 'permission:manage_banners'], function () {
		Route::get('settings/banners', 'Admin\BannersController@index');
		Route::match(array('GET', 'POST'), 'settings/add_banners', 'Admin\BannersController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_banners/{id}', 'Admin\BannersController@update');
		Route::get('settings/delete_banners/{id}', 'Admin\BannersController@delete');
	});

	Route::group(['middleware' => 'permission:starting_cities_settings'], function () {
		Route::get('settings/starting_cities', 'Admin\StartingCitiesController@index');
		Route::match(array('GET', 'POST'), 'settings/add_starting_cities', 'Admin\StartingCitiesController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_starting_cities/{id}', 'Admin\StartingCitiesController@update');
		Route::get('settings/delete_starting_cities/{id}', 'Admin\StartingCitiesController@delete');
	});

	Route::group(['middleware' => 'permission:manage_property_type'], function () {
		Route::get('settings/property_type', 'Admin\PropertyTypeController@index');
		Route::match(array('GET', 'POST'), 'settings/add_property_type', 'Admin\PropertyTypeController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_property_type/{id}', 'Admin\PropertyTypeController@update');
		Route::get('settings/delete_property_type/{id}', 'Admin\PropertyTypeController@delete');
	});

	Route::group(['middleware' => 'permission:space_type_setting'], function () {
		Route::get('settings/space_type', 'Admin\SpaceTypeController@index');
		Route::match(array('GET', 'POST'), 'settings/add_space_type', 'Admin\SpaceTypeController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_space_type/{id}', 'Admin\SpaceTypeController@update');
		Route::get('settings/delete_space_type/{id}', 'Admin\SpaceTypeController@delete');
	});

	Route::group(['middleware' => 'permission:manage_bed_type'], function () {
		Route::get('settings/bed_type', 'Admin\BedTypeController@index');
		Route::match(array('GET', 'POST'), 'settings/add_bed_type', 'Admin\BedTypeController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_bed_type/{id}', 'Admin\BedTypeController@update');
		Route::get('settings/delete_bed_type/{id}', 'Admin\BedTypeController@delete');
	});

	Route::group(['middleware' => 'permission:manage_currency'], function () {
		Route::get('settings/currency', 'Admin\CurrencyController@index');
		Route::match(array('GET', 'POST'), 'settings/add_currency', 'Admin\CurrencyController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_currency/{id}', 'Admin\CurrencyController@update');
		Route::get('settings/delete_currency/{id}', 'Admin\CurrencyController@delete');
	});

	Route::group(['middleware' => 'permission:manage_country'], function () {
		Route::get('settings/country', 'Admin\CountryController@index');
		Route::match(array('GET', 'POST'), 'settings/add_country', 'Admin\CountryController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_country/{id}', 'Admin\CountryController@update');
		Route::get('settings/delete_country/{id}', 'Admin\CountryController@delete');
	});

	Route::group(['middleware' => 'permission:manage_amenities_type'], function () {
		Route::get('settings/amenities_type', 'Admin\AmenitiesTypeController@index');
		Route::match(array('GET', 'POST'), 'settings/add_amenities_type', 'Admin\AmenitiesTypeController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_amenities_type/{id}', 'Admin\AmenitiesTypeController@update');
		Route::get('settings/delete_amenities_type/{id}', 'Admin\AmenitiesTypeController@delete');
	});

	Route::match(array('GET', 'POST'), 'settings/email', 'Admin\SettingsController@email')->middleware(['permission:email_settings']);

	Route::group(['middleware' => 'permission:manage_language'], function () {
		Route::get('settings/language', 'Admin\LanguageController@index');
		Route::match(array('GET', 'POST'), 'settings/add_language', 'Admin\LanguageController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_language/{id}', 'Admin\LanguageController@update');
		Route::get('settings/delete_language/{id}', 'Admin\LanguageController@delete');
	});

	Route::match(array('GET', 'POST'), 'settings/fees', 'Admin\SettingsController@fees')->middleware(['permission:manage_fees']);

	Route::group(['middleware' => 'permission:manage_metas'], function () {
		Route::get('settings/metas', 'Admin\MetasController@index');
		Route::match(array('GET', 'POST'), 'settings/edit_meta/{id}', 'Admin\MetasController@update');
	});

	Route::match(array('GET', 'POST'), 'settings/api_informations', 'Admin\SettingsController@api_informations')->middleware(['permission:api_informations']);
	Route::match(array('GET', 'POST'), 'settings/payment_methods', 'Admin\SettingsController@payment_methods')->middleware(['permission:payment_settings']);
	Route::match(array('GET', 'POST'), 'settings/social_links', 'Admin\SettingsController@social_links')->middleware(['permission:social_links']);

	Route::group(['middleware' => 'permission:manage_roles'], function () {
		Route::get('settings/roles', 'Admin\RolesController@index');
		Route::match(array('GET', 'POST'), 'settings/add_role', 'Admin\RolesController@add');
	    Route::match(array('GET', 'POST'), 'settings/edit_role/{id}', 'Admin\RolesController@update');
		Route::get('settings/delete_role/{id}', 'Admin\RolesController@delete');
	});

	Route::group(['middleware' => 'permission:database_backup'], function () {
	    Route::get('settings/backup', 'Admin\BackupController@index');
	    Route::get('backup/save', 'Admin\BackupController@add');
	    Route::get('backup/download/{id}', 'Admin\BackupController@download');
    });


});

//only can view if admin is not logged in if they are logged in then they will be redirect to dashboard
Route::group(['prefix' => 'admin', 'middleware' => 'no_auth:admin'], function () {
    Route::get('login', 'Admin\AdminController@login');
});

//Route::get('users/show/{id}', 'UserController@show');

//only can view if user is not logged in if they are logged in then they will be redirect to dashboard
Route::group(['middleware' => ['no_auth:users', 'locale']], function () {
    Route::get('login', 'LoginController@index');
    Route::get('auth/login', function()
    {
    	return Redirect::to('login');
    });

    Route::get('googleLogin', 'LoginController@googleLogin');
    Route::get('facebookLogin', 'LoginController@facebookLogin');
   
    
    Route::get('register', 'HomeController@register');

    Route::match(array('GET', 'POST'), 'forgot_password', 'LoginController@forgot_password');

    Route::post('create', 'UserController@create');

    Route::post('authenticate', 'LoginController@authenticate');

    Route::get('users/reset_password/{secret?}', 'LoginController@reset_password');

    Route::post('users/reset_password', 'LoginController@reset_password');
});

  Route::get('googleAuthenticate', 'LoginController@googleAuthenticate');
  Route::get('facebookAuthenticate', 'LoginController@facebookAuthenticate');

//only can view if user is logged in
Route::group(['middleware' => ['guest:users', 'locale']], function () {
	
    Route::get('dashboard', 'UserController@dashboard');
    Route::match(array('GET', 'POST'),'users/profile', 'UserController@profile');
    Route::match(array('GET', 'POST'),'users/profile/media', 'UserController@media');
    
    // User verification
    Route::get('users/edit_verification', 'UserController@verification');
    Route::get('users/confirm_email/{code?}', 'UserController@confirmEmail');
    Route::get('users/new_email_confirm', 'UserController@newConfirmEmail');

    Route::get('facebookLoginVerification', 'UserController@facebookLoginVerification');
    Route::get('facebookConnect/{id}', 'UserController@facebookConnect');
    Route::get('facebookDisconnect', 'UserController@facebookDisconnectVerification');

    Route::get('googleLoginVerification', 'UserController@googleLoginVerification');
    Route::get('googleConnect/{id}', 'UserController@googleConnect');
    Route::get('googleDisconnect', 'UserController@googleDisconnect');
    //Route::get('googleAuthenticate', 'LoginController@googleAuthenticate');

    Route::get('users/show/{id}', 'UserController@show');

    Route::match(array('GET', 'POST'),'users/reviews', 'UserController@reviews');
    Route::match(['get', 'post'], 'reviews/edit/{id}', 'UserController@edit_Reviews');
    Route::match(['get', 'post'], 'reviews/details/{id}', 'UserController@reviewDetails');

    Route::match(array('GET', 'POST'),'properties', 'PropertyController@user_properties');
    Route::match(array('GET', 'POST'),'property/create', 'PropertyController@create');
    Route::match(array('GET', 'POST'),'listing/{id}/photo_message', 'PropertyController@photo_message');
    Route::match(array('GET', 'POST'),'listing/{id}/photo_delete', 'PropertyController@photo_delete');

	Route::match(array('POST'),'listing/photo/make_default_photo', 'PropertyController@make_default_photo');

	Route::match(array('POST'),'listing/photo/make_photo_serial', 'PropertyController@make_photo_serial');

    Route::match(array('GET', 'POST'),'listing/{id}/update_status', 'PropertyController@update_status');
    Route::match(array('GET', 'POST'),'listing/{id}/{step}', 'PropertyController@listing')->where(['id' => '[0-9]+','page' => 'basics|description|location|amenities|photos|pricing|calendar|details|booking']);
    
    Route::post('ajax-calender/{id}', 'CalendarController@calender_json');
    Route::post('ajax-calender-price/{id}', 'CalendarController@calender_price_set');
    
    Route::post('currency-symbol', 'PropertyController@currency_symbol');

    Route::match(['get', 'post'], 'payments/book/{id?}', 'PaymentController@index');
    Route::post('payments/create_booking', 'PaymentController@create_booking');
    Route::get('payments/success', 'PaymentController@success');
    Route::get('payments/cancel', 'PaymentController@cancel');

    Route::get('payments/stripe', 'PaymentController@stripe_payment');
    Route::post('payments/stripe-request', 'PaymentController@stripe_request');
    
    Route::get('booking/{id}', 'BookingController@index')->where('id', '[0-9]+');
    Route::get('booking/requested', 'BookingController@requested');
    Route::get('booking/itinerary_friends', 'BookingController@requested');
    Route::post('booking/accept/{id}', 'BookingController@accept');
    Route::post('booking/decline/{id}', 'BookingController@decline');
    Route::get('booking/expire/{id}', 'BookingController@expire');

    Route::get('my_bookings', 'BookingController@my_bookings');
    Route::post('booking/host_cancel', 'BookingController@host_cancel');

    Route::get('trips/active', 'TripsController@active');
    Route::get('trips/previous', 'TripsController@previous');
    Route::get('booking/receipt', 'TripsController@receipt');
    Route::post('trips/guest_cancel', 'TripsController@guest_cancel');

    Route::get('inbox', 'InboxController@index');
    //Route::get('messaging/qt_with/{id}', 'InboxController@host_message'); //temporary
    Route::get('messaging/host/{id}', 'InboxController@host_message');
    Route::get('messaging/guest/{id}', 'InboxController@guest_message');
    Route::post('inbox/reply/{id}', 'InboxController@reply');
    Route::post('inbox/message_count', 'InboxController@message_count');
    Route::post('inbox/message_with_type', 'InboxController@message_with_type');

    Route::match(['get', 'post'], 'users/account_preferences', 'UserController@account_preferences');
    Route::get('users/account_delete/{id}', 'UserController@account_delete');
    Route::get('users/account_default/{id}', 'UserController@account_default');
    
    Route::get('users/transaction_history', 'UserController@transaction_history');
    Route::post('users/account_transaction_history', 'UserController@get_completed_transaction');

    Route::match(['get', 'post'], 'users/security', 'UserController@security');
    Route::get('logout', function()
	{
		Auth::logout(); 
		return Redirect::to('login');
	});
});

Route::post('admin/authenticate', 'Admin\AdminController@authenticate');

Route::get('{name}', 'HomeController@static_pages');
