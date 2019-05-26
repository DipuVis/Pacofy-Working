<?php
/**
 * Customer Controller
 *
 * Customer Controller manages Customer by admin. 
 *
 * @category   Customer
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
use App\DataTables\CustomerDataTable;
use App\Models\User;
use App\Http\Helpers\Common;
use Validator;

class CustomerController extends Controller
{
    protected $helper; 

    public function __construct()
    {
        $this->helper = new Common;
    }

    public function index(CustomerDataTable $dataTable)
    {
        return $dataTable->render('admin.customers.view');
    }


    public function add(Request $request)
    {
        if(!$_POST)
        {
            return view('admin.customers.add');
        }
        else if($_POST)
        {
           
            $rules = array(
                'first_name'    => 'required|max:255',
                'last_name'     => 'required|max:255',
                'email'         => 'required|max:255|email|unique:users',
                'password'      => 'required|min:6'
            );

            $fieldNames = array(
                'first_name'    => 'First_name',
                'last_name'     => 'Last_name',
                'email'         => 'Email',
                'password'      => 'Password'
            );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput(); 
            }
            else
            {
                $user = new User;
                $user->first_name = $request->first_name;
                $user->last_name = $request->last_name;
                $user->email = $request->email;
                $user->password = \Hash::make($request->password);
                $user->save();

                return redirect('admin/customers');
            }
        }
    }

    public function update(Request $request)
    {
        if(!$_POST)
        {
			$data['result'] = User::find($request->id);

            return view('admin.customers.edit', $data);
        }
        else if($_POST)
        {
            $rules = array(
                'first_name'    => 'required|max:255',
                'last_name'     => 'required|max:255',
            );

            $fieldNames = array(
                'first_name'    => 'First Name',
                'last_name'     => 'Last Name',
            );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                $user = User::find($request->id);
                $user->first_name = $request->first_name;
                $user->last_name  = $request->last_name;
                $user->status     = $request->status;
                $user->save();

                $this->helper->one_time_message('success', 'Updated Successfully');
                return redirect('admin/customers');
            }
        }
    }


    public function delete(Request $request)
    {
        if(env('APP_MODE', '') != 'test'){
            User::find($request->id)->delete();
            $this->helper->one_time_message('success', 'Deleted Successfully');
        }

        return redirect('admin/customers');
    }
}
