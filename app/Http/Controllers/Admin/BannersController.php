<?php

/**
 * Banners Controller
 *
 * Banners Controller manages banners in home page. 
 *
 * @category   Banners
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
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\DataTables\BannersDataTable;
use App\Models\Banners;
use App\Http\Helpers\Common;
use Validator;

class BannersController extends Controller
{
    protected $helper;  // Global variable for instance of Helpers

    public function __construct()
    {
        $this->helper = new Common;
    }

    /**
     * Load Datatable for Banners
     *
     * @param array $dataTable  Instance of BannersDataTable
     * @return datatable
     */
    public function index(BannersDataTable $dataTable)
    {
        return $dataTable->render('admin.banners.view');
    }

    /**
     * Add a New Banners
     *
     * @param array $request  Input values
     * @return redirect     to Banners view
     */
    public function add(Request $request)
    {
        if(!$_POST)
        {
            return view('admin.banners.add');
        }
        else if($_POST)
        {
            // Add Banners Validation Rules
            $rules = array(
                'heading'    => 'required|max:100',
                'image'      => 'required'
            );

            // Add Banners Validation Custom Names
            $fieldNames = array(
                'heading'    => 'Heading',
                'image'      => 'Image'
            );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput(); // Form calling with Errors and Input values
            }
            else
            {
                $image     =   $request->file('image');
                $extension =   $image->getClientOriginalExtension();
                $filename  =   'banner_'.time() . '.' . $extension;

                $success = $image->move('public/front/images/banners', $filename);
                
                if(!isset($success))
                    return back()->withError('Could not upload Image');

                $banners = new Banners;

                $banners->heading  = $request->heading;
                $banners->image = $filename;
                $banners->status = $request->status;
                if(isset($request->subheading))
                    $banners->subheading = $request->subheading;
                $banners->save();

                $this->helper->one_time_message('success', 'Added Successfully'); // Call flash message function
                return redirect('admin/settings/banners');
            }
        }
        else
        {
            return redirect('admin/settings/banners');
        }
    }

    /**
     * Update Banners Details
     *
     * @param array $request    Input values
     * @return redirect     to Banners View
     */
    public function update(Request $request)
    {
        if(!$_POST)
        {
			$data['result'] = Banners::find($request->id);

            return view('admin.banners.edit', $data);
        }
        else if($_POST)
        {
            // Edit Banners Validation Rules
            $rules = array(
                    'heading'    => 'required|max:100'
                    );

            // Edit Banners Validation Custom Names
            $fieldNames = array(
                        'heading'    => 'Heading'
                        );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput(); // Form calling with Errors and Input values
            }
            else
            {
                $banners = Banners::find($request->id);

                $banners->heading  = $request->heading;
                $banners->status   = $request->status;
                if(isset($request->subheading))
                    $banners->subheading = $request->subheading;
                $image     =   $request->file('image');

                if($image) {
                    $extension =   $image->getClientOriginalExtension();
                    $filename  =   'banner_'.time() . '.' . $extension;
    
                    $success = $image->move('public/front/images/banners', $filename);
        
                    if(!isset($success))
                        return back()->withError('Could not upload Image');

                    $banners->image = $filename;
                }

                $banners->save();

                $this->helper->one_time_message('success', 'Updated Successfully'); // Call flash message function
                return redirect('admin/settings/banners');
            }
        }
        else
        {
            return redirect('admin/settings/banners');
        }
    }

    /**
     * Delete Banners
     *
     * @param array $request    Input values
     * @return redirect     to Banners View
     */
    public function delete(Request $request)
    {
        if(env('APP_MODE', '') != 'test'){
            $banners   = Banners::find($request->id);
            $file_path = public_path().'/front/images/banners/'.$banners->image;
            if(file_exists($file_path)){
               unlink($file_path);
            }
            Banners::find($request->id)->delete();
            $this->helper->one_time_message('success', 'Deleted Successfully'); // Call flash message function
        }
        
        return redirect('admin/settings/banners');
    }
}
