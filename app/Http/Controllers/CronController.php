<?php

namespace App\Http\Controllers;

use App\Http\Helpers\Common;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
use Mail;
use Config;
use Auth;
use DateTime;
use DateTimeZone;
use App\Models\User;
use App\Models\Rooms;
use App\Models\Bookings;
use File;

class CronController extends Controller
{
    private $helper;

    public function __construct(){
      $this->helper = new Common;
    }

    public function index(){
        //$this->check_booking_expired();
         $this->sqlDump();
    }

    public function check_booking_expired(){
        $date           = new DateTime;
        $date->modify('-24 hours');
        $formatted_date = $date->format('Y-m-d H:i:s');
        $results        = Bookings::where('created_at','<',$formatted_date)->where('status', 'Pending')->get();
        foreach ($results as $result) {
            Bookings::where('id', $result->id)->update(['status' => 'Expired', 'expired_at' => date('Y-m-d H:i:s')]);
        }
    }

    public function reset_data(){
        Artisan::call('db:seed', ['--class' => 'ResetDataSeeder']);
    }

    public function ImportDump(){
            try{
                Log::info("Clearing the junk database");
                Artisan::call('migrate:refresh');
                DB::unprepared(file_get_contents('db/vrent_dump.sql'));
                $this->copyImageBackupFiles();
            }catch (\Exception $e){
                Log::error($e->getMessage());
            }

    }

    public function copyImageBackupFiles(){
            if (File::isWritable(public_path('front/images/banners')) && File::isWritable(public_path('front/images/logos')) && File::isWritable(public_path('front/images/starting_cities')) && File::isWritable(public_path('images/profile')) && File::isWritable(public_path('images/property')))
            {
                  File::cleanDirectory(public_path('front/images/banners'));
                  File::cleanDirectory(public_path('front/images/logos'));
                  File::cleanDirectory(public_path('front/images/starting_cities'));
                  File::cleanDirectory(public_path('images/profile'));
                  File::cleanDirectory(public_path('images/property'));
                  /* banners copy start */
                      $files_banners      = scandir(public_path('frontend_backup/images/banners'));
                      $source_images      = public_path('frontend_backup/images/banners/');
                      $destination_images = public_path('front/images/banners/');

                      foreach ($files_banners as $file) {
                        if (in_array($file, array(".",".."))) continue;
                        copy($source_images.$file, $destination_images.$file);
                      }
                  /* banners copy end */

                  /* logos copy start */
                        $files_logos       = scandir(public_path('frontend_backup/images/logos'));
                        $source_logos      = public_path('frontend_backup/images/logos/');
                        $destination_logos = public_path('front/images/logos/');

                        foreach ($files_logos as $file) {
                          if (in_array($file, array(".",".."))) continue;
                          copy($source_logos.$file, $destination_logos.$file);
                        }
                  /* logos copy end */

                  /* starting_cities copy start */
                          $files_starting_cities       = scandir(public_path('frontend_backup/images/starting_cities'));
                          $source_starting_cities      = public_path('frontend_backup/images/starting_cities/');
                          $destination_starting_cities = public_path('front/images/starting_cities/');

                          foreach ($files_starting_cities as $file) {
                            if (in_array($file, array(".",".."))) continue;
                            copy($source_starting_cities.$file, $destination_starting_cities.$file);
                          }
                    /* starting_cities copy end */

                    /*Property Copy Starts here*/

                      for($property=1; $property<=17; $property++){
                                    $path = public_path('images/property/').$property;                    
                                    mkdir($path, 0777, true);
                                    $files_property       = scandir(public_path("frontend_backup/images/property/$property"));
                                    $source_property      = public_path("frontend_backup/images/property/$property/");
                                    $destination_property = public_path("images/property/$property/");
                                    foreach ($files_property as $file) {
                                      if (in_array($file, array(".",".."))) continue;
                                      copy($source_property.$file, $destination_property.$file);
                                    }
                                
                          }
                    /*Property copy ends here*/

                    /*Profile Copy Starts here*/
                          for($profile=1; $profile<=3; $profile++){
                                    $path = public_path('images/profile/').$profile;
                                    mkdir($path, 0777, true);
                                    $files_profile       = scandir(public_path("frontend_backup/images/profile/$profile"));
                                    $source_profile      = public_path("frontend_backup/images/profile/$profile/");
                                    $destination_profile = public_path("images/profile/$profile/");
                                    foreach ($files_profile as $file) {
                                      if (in_array($file, array(".",".."))) continue;
                                      copy($source_profile.$file, $destination_profile.$file);
                                    }
                          }

                    /*Profile Copy Ends here*/

            }else{
                Log::info("Don't have write permission !");
            }
    }

}
