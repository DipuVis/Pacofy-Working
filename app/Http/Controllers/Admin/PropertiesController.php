<?php

/**
 * Properties Controller
 *
 * Properties Controller manages Properties by admin. 
 *
 * @category   Properties
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
use App\DataTables\PropertyDataTable;
use App\Http\Controllers\Admin\CalendarController;

use App\Models\Properties;
use App\Models\PropertyDetails;
use App\Models\PropertyAddress;
use App\Models\PropertyPhotos;
use App\Models\PropertyPrice;
use App\Models\PropertyType;
use App\Models\PropertyDates;
use App\Models\PropertyDescription;
use App\Models\Currency;
use App\Models\SpaceType;
use App\Models\BedType;
use App\Models\PropertySteps;
use App\Models\Country;
use App\Models\Amenities;
use App\Models\AmenityType;
use App\Models\User;
use Session;

use Validator;
use App\Http\Helpers\Common;

class PropertiesController extends Controller
{
    protected $helper; 

    public function __construct()
    {
        $this->helper = new Common;
    }

    public function index(PropertyDataTable $dataTable)
    {
        return $dataTable->render('admin.properties.view');
    }

    public function add(Request $request)
    {
          if($_POST){

            $rules = array(
                'property_type_id'  => 'required',
                'space_type'        => 'required',
                'accommodates'      => 'required',
                'map_address'       => 'required',
                'host_id'           => 'required',
            );

            $fieldNames = array(
                'property_type_id'  => 'Home Type',
                'space_type'        => 'Room Type',
                'accommodates'      => 'Accommodates',
                'map_address'       => 'City',
                'host_id'           => 'Host'
            );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames);

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                $property                  = new Properties;
                $property->host_id         = $request->host_id;
                $property->name            = SpaceType::find($request->space_type)->name.' in '.$request->city;
                $property->property_type   = $request->property_type_id;
                $property->space_type      = $request->space_type;
                $property->accommodates    = $request->accommodates;
                $property->save();

                $property_address                 = new PropertyAddress;
                $property_address->property_id    = $property->id;
                $property_address->address_line_1 = $request->route;
                $property_address->city           = $request->city;
                $property_address->state          = $request->state;
                $property_address->country        = $request->country;
                $property_address->postal_code    = $request->postal_code;
                $property_address->latitude       = $request->latitude;
                $property_address->longitude      = $request->longitude;
                $property_address->save();

                $property_price                 = new PropertyPrice;
                $property_price->property_id    = $property->id;
                $property_price->currency_code  = \Session::get('currency');
                $property_price->save();

                $property_steps                   = new PropertySteps;
                $property_steps->property_id      = $property->id;
                $property_steps->save();

                $property_description              = new PropertyDescription;
                $property_description->property_id = $property->id;
                $property_description->save();

                return redirect('admin/listing/'.$property->id.'/basics');
            }
        }

        $data['property_type'] = PropertyType::where('status', 'Active')->pluck('name', 'id');
        $data['space_type']    = SpaceType::where('status', 'Active')->pluck('name', 'id');
        $data['users']         = User::where('status', 'Active')->get();
        return view('admin.properties.add', $data);
    }

    public function listing(Request $request, CalendarController $calendar){

        $step            = $request->step;
        $property_id     = $request->id;
       //echo $step;

        $data['step']    = $step;
        $data['result']  = Properties::find($property_id);
        $data['details'] = PropertyDetails::pluck('value', 'field');
        
        if($step == 'basics'){
            if($_POST){
                $property                     = Properties::find($property_id);
                $property->bedrooms           = $request->bedrooms;
                $property->beds               = $request->beds;
                $property->bathrooms          = $request->bathrooms;
                $property->bed_type           = $request->bed_type;
                $property->property_type      = $request->property_type;
                $property->space_type         = $request->space_type;
                $property->accommodates       = $request->accommodates;
                $property->save();

                $property_steps = PropertySteps::where('property_id', $property_id)->first();
                $property_steps->basics = 1;
                $property_steps->save();
                return redirect('admin/listing/'.$property_id.'/description');
            }

            $data['bed_type']       = BedType::pluck('name', 'id');
            $data['property_type']  = PropertyType::where('status', 'Active')->pluck('name', 'id');
            $data['space_type']     = SpaceType::pluck('name', 'id');
        }else if($step == 'description'){
            if($_POST){
                $rules = array(
                    'name'     => 'required|max:50',
                    'summary'  => 'required|max:500',
                );
        
                $fieldNames = array(
                    'name'     => 'Name',
                    'summary'  => 'Summary',
                );

                $validator = Validator::make($request->all(), $rules);
                $validator->setAttributeNames($fieldNames);

                if ($validator->fails()) {
                    return back()->withErrors($validator)->withInput(); 
                }else{
                    $property           = Properties::find($property_id);
                    $property->name     = $request->name;
                    if($property->name != $request->name) 
                        $property->url_name = $this->helper->pretty_url($request->name);
                    $property->save();

                    $property_description              = PropertyDescription::where('property_id', $property_id)->first();
                    $property_description->summary     = $request->summary;
                    $property_description->save();

                    $property_steps = PropertySteps::where('property_id', $property_id)->first();
                    $property_steps->description = 1;
                    $property_steps->save();
                    return redirect('admin/listing/'.$property_id.'/location');
                } 
            }
            $data['description']       = PropertyDescription::where('property_id', $property_id)->first();
        }else if($step == 'details'){
            if($_POST){
                $property_description                       = PropertyDescription::where('property_id', $property_id)->first();
                $property_description->about_place          = $request->about_place;
                $property_description->place_is_great_for   = $request->place_is_great_for;
                $property_description->guest_can_access     = $request->guest_can_access;
                $property_description->interaction_guests   = $request->interaction_guests;
                $property_description->other                = $request->other;
                $property_description->about_neighborhood   = $request->about_neighborhood;
                $property_description->get_around           = $request->get_around;
                $property_description->save();

                return redirect('admin/listing/'.$property_id.'/description');
            } 
        }else if($step == 'location'){
            if($_POST){
                $rules = array(
                    'address_line_1'    => 'required|max:250',
                    'address_line_2'    => 'max:250',
                    'country'           => 'required',
                    'city'              => 'required',
                    'state'             => 'required',
                    'latitude'          => 'required|not_in:0',
                );
            
                $fieldNames = array(
                    'address_line_1' => 'Address Line 1',
                    'country' => 'Country',
                    'city' => 'City',
                    'state' => 'State',
                    'latitude' => 'Map',
                );

                $messages = [
                    'not_in' => 'Please set :attribute pointer',
                ];

                $validator = Validator::make($request->all(), $rules, $messages);
                $validator->setAttributeNames($fieldNames); 

                if ($validator->fails()) {
                    return back()->withErrors($validator)->withInput(); // Form calling with Errors and Input values
                }else{
                    $property_address                 = PropertyAddress::where('property_id', $property_id)->first(); // Where condition for Update
                    $property_address->address_line_1 = $request->address_line_1;
                    $property_address->address_line_2 = $request->address_line_2;
                    $property_address->latitude       = $request->latitude;
                    $property_address->longitude      = $request->longitude;
                    $property_address->city           = $request->city;
                    $property_address->state          = $request->state;
                    $property_address->country        = $request->country;
                    $property_address->postal_code    = $request->postal_code;
                    $property_address->save();

                    $property_steps = PropertySteps::where('property_id', $property_id)->first();
                    $property_steps->location = 1;
                    $property_steps->save();

                    return redirect('admin/listing/'.$property_id.'/amenities');
                }
            }
            $data['country']       = Country::pluck('name', 'short_name');
        }else if($step == 'amenities'){
            if($_POST && is_array($request->amenities)){
                $rooms = Properties::find($request->id);
                $rooms->amenities = implode(',', $request->amenities);
                $rooms->save();
                return redirect('admin/listing/'.$property_id.'/photos');
            }
            $data['property_amenities'] = explode(',', $data['result']->amenities);
            $data['amenities']      = Amenities::where('status', 'Active')->get();
            $data['amenities_type'] = AmenityType::get();
        }else if($step == 'photos'){
            if($_FILES){
                $rules = array(
                    'photos' => 'required',
                    'photos.*' => 'image|mimes:jpeg,bmp,png,gif',
                );

            
                $fieldNames = array(
                    'photos'  => 'Photos',
                    'photos.*'=> 'Photos'
                );

                $validator = Validator::make($request->all(), $rules);
                $validator->setAttributeNames($fieldNames); 

                if ($validator->fails()) {
                    return back()->withErrors($validator)->withInput(); // Form calling with Errors and Input values
                }else{
                    if(isset($_FILES["photos"]["name"]))
                    {
                        foreach($_FILES["photos"]["error"] as $key=>$error) 
                        {
                            $tmp_name = $_FILES["photos"]["tmp_name"][$key];

                            $name = str_replace(' ', '_', $_FILES["photos"]["name"][$key]);
                            
                            $ext = pathinfo($name, PATHINFO_EXTENSION);

                            $name = time().'_'.$name; //time().'_'.$key.'.'.$ext;

                            $path = 'public/images/property/'.$property_id;
                                            
                            if(!file_exists($path))
                            {
                                mkdir($path, 0777, true);
                                //copy(url('public/images/property/index.html'), $path.'/index.html');
                            }
                                                       
                            if($ext == 'png' || $ext == 'jpg' || $ext == 'jpeg' || $ext == 'gif')   
                            {            
                                if(move_uploaded_file($tmp_name, $path."/".$name))
                                {
                                    //$photo_exist         = PropertyPhotos::where('property_id', $property_id)->count();
                                    $photo_exist_first   = PropertyPhotos::where('property_id', $property_id)->count();
                                    //echo $photo_exist_first;exit();
                                    if($photo_exist_first!=0){
                                        $photo_exist         = PropertyPhotos::orderBy('serial', 'desc')->where('property_id', $property_id)->take(1)->first();
                                    }
                                    $photos              = new PropertyPhotos;
                                    $photos->property_id = $property_id;
                                    $photos->photo       = $name;
                                    if($photo_exist_first!=0){
                                        $photos->serial = $photo_exist->serial+1;
                                    }else{
                                        $photos->serial = $photo_exist_first+1;
                                    }
                                    //$photos->serial      = if($photo_exist_first!=0)?$photo_exist->serial+1:$photo_exist_first+1;
                                    if(!$photo_exist_first) $photos->cover_photo     = 1;
                                    
                                    $photos->save();

                                    $property_steps = PropertySteps::where('property_id', $property_id)->first();
                                    $property_steps->photos = 1;
                                    $property_steps->save();
                                }
                            }
                        }
                    }

                    
                    return redirect('admin/listing/'.$property_id.'/photos');
                }
            }
            $data['photos']    = PropertyPhotos::where('property_id', $property_id)
                                ->orderBy('serial','asc')
                                ->get();
        }else if($step == 'pricing'){
            if($_POST){
                $rules = array(
                    'price' => 'required|numeric|min:5',
                );
            
                $fieldNames = array(
                    'price'  => 'Price',
                );

                $validator = Validator::make($request->all(), $rules);
                $validator->setAttributeNames($fieldNames); 

                if ($validator->fails()) {
                    return back()->withErrors($validator)->withInput(); 
                }else{
                    $property_price                    = PropertyPrice::where('property_id', $property_id)->first();
                    $property_price->price             = $request->price;
                    $property_price->weekly_discount   = $request->weekly_discount;
                    $property_price->monthly_discount  = $request->monthly_discount;
                    $property_price->currency_code     = $request->currency_code;
                    $property_price->cleaning_fee      = $request->cleaning_fee;
                    $property_price->guest_fee         = $request->guest_fee;
                    $property_price->guest_after       = $request->guest_after;
                    $property_price->security_fee      = $request->security_fee;
                    $property_price->weekend_price     = $request->weekend_price;
                    $property_price->save();

                    $property_steps = PropertySteps::where('property_id', $property_id)->first();
                    $property_steps->pricing = 1;
                    $property_steps->save();

                    return redirect('admin/listing/'.$property_id.'/booking');
                }
            }
        }else if($step == 'booking'){
            if($_POST){
                $properties               = Properties::find($property_id);
                $properties->booking_type = $request->booking_type;
                $properties->status       = 'Listed'; 
                $properties->save();

                $property_steps          = PropertySteps::where('property_id', $property_id)->first();
                $property_steps->booking = 1;
                $property_steps->save();
                
                return redirect('admin/listing/'.$property_id.'/calender');
                //return redirect('admin/properties');
            }
        }else if($step == 'calender'){
            $data['calendar'] = $calendar->generate($request->id);
        }

        return view("admin.listing.$step", $data);
    }

     public function update(Request $request)
    {
        if(!$_POST)
        {
              $amenity_type=AmenityType::get();
              $am = [];
              foreach ($amenity_type as $key => $value) {
                $am[$value->id]=$value->name;
              }
              $data['am'] = $am;
            $data['result'] = Amenities::find($request->id);
            return view('admin.amenities.edit', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'title'          => 'required',
                    'description'    => 'required',
                    'symbol'         => 'required',
                    'type_id'        => 'required',
                    'status'         => 'required'

                    );

            $fieldNames = array(
                        'title'             => 'Title',
                        'description'       => 'Description',
                        'symbol'            => 'Symbol'
                        );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {   $amenitie = Amenities::find($request->id);
                $amenitie->title          = $request->title;
                $amenitie->description    = $request->description;
                $amenitie->symbol         = $request->symbol;
                $amenitie->type_id        = $request->type_id;
                $amenitie->status         = $request->status;
                $amenitie->save();

                $this->helper->one_time_message('success', 'Updated Successfully');
                return redirect('admin/amenities');
            }
        }
      
    }
    
    public function delete(Request $request)
    {
        
        Properties::find($request->id)->delete();
        $this->helper->one_time_message('success', 'Deleted Successfully');
        return redirect('admin/properties');
    }
    public function photo_message(Request $request)
    {
        $property = Properties::find($request->id);
            $photos = PropertyPhotos::find($request->photo_id);
            $photos->message = $request->messages;
            $photos->save();
        
        return json_encode(['success'=>'true']);
    }

    public function photo_delete(Request $request){
      
        $property = Properties::find($request->id);
            $photos = PropertyPhotos::find($request->photo_id);
            $photos->delete();
        
        return json_encode(['success'=>'true']);
    }

    public function make_default_photo(Request $request){

        if($request->option_value == 'Yes'){
        PropertyPhotos::where('property_id', '=', $request->property_id)
        ->update(['cover_photo' => 0]);

        $photos = PropertyPhotos::find($request->photo_id);
        $photos->cover_photo = 1;
        $photos->save();
        }
        return json_encode(['success'=>'true']);
    }

    public function make_photo_serial(Request $request){
       
        $photos = PropertyPhotos::find($request->id);
        $photos->serial = $request->serial;
        $photos->save();

        return json_encode(['success'=>'true']);
    }
    

}
