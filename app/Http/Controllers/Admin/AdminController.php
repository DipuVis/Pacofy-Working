<?php
 
namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Auth;
use App\Models\Admin;
use App\Models\RoleAdmin;
use App\Models\PermissionRole;
use App\Models\Roles;
use App\Http\Helpers\Common;
use Validator;
use App\DataTables\AdminuserDataTable;

class AdminController extends Controller
{
    protected $helper;
    
    public function __construct()
    {
        $this->helper = new Common;
    }

    public function index(AdminuserDataTable $dataTable)
    {
        return $dataTable->render('admin.admin.view');
    }

    public function add(Request $request)
    {
        if(!$_POST)
        {
            $data['roles'] = Roles::all()->pluck('display_name','id');

            return view('admin.admin.add', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'username'   => 'required|unique:admin|max:255',
                    'email'      => 'required|email|unique:admin|max:255',
                    'password'   => 'required|max:50',
                    'role'       => 'required',
                    'status'     => 'required'
                    );

            $fieldNames = array(
                        'username'   => 'Username',
                        'email'      => 'Email',
                        'password'   => 'Password',
                        'role'       => 'Role',
                        'status'     => 'Status'
                        );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                $admin = new Admin;
                $admin->username = $request->username;
                $admin->email    = $request->email;
                $admin->password = bcrypt($request->password);
                $admin->status   = $request->status;
                $admin->save();

                RoleAdmin::insert(['admin_id' => $admin->id, 'role_id' => $request->role]);

                $this->helper->one_time_message('success', 'Added Successfully');

                return redirect('admin/admin_users');
            }
        }
        else
        {
            return redirect('admin/admin_users');
        }
    }

    public function installer_create(array $data)
    {

        if(isset($data['name']) && isset($data['email']) && isset($data['password']))
        {
            $admin = new Admin;
            $admin->delete();
            $admin->username =   $data['name'];
            $admin->email    =   $data['email'];
            $admin->password =   bcrypt($data['password']);
            $admin->save();

            $role_user = new RoleAdmin;
            $role_user->delete();
            $role_user->admin_id = $admin->id;
            $role_user->role_id = '1';
            $role_user->save();

            $data = [
                        ['permission_id' => 1, 'role_id' => '1'],
                        ['permission_id' => 2, 'role_id' => '1'],
                        ['permission_id' => 3, 'role_id' => '1'],
                        ['permission_id' => 4, 'role_id' => '1'],
                        ['permission_id' => 5, 'role_id' => '1'],
                        ['permission_id' => 6, 'role_id' => '1'],
                        ['permission_id' => 7, 'role_id' => '1'],
                        ['permission_id' => 8, 'role_id' => '1'],
                        ['permission_id' => 9, 'role_id' => '1'],
                        ['permission_id' => 10, 'role_id' => '1'],
                        ['permission_id' => 11, 'role_id' => '1'],
                        ['permission_id' => 12, 'role_id' => '1'],
                        ['permission_id' => 13, 'role_id' => '1'],
                        ['permission_id' => 14, 'role_id' => '1'],
                        ['permission_id' => 15, 'role_id' => '1'],
                        ['permission_id' => 16, 'role_id' => '1'],
                        ['permission_id' => 17, 'role_id' => '1'],
                        ['permission_id' => 18, 'role_id' => '1'],
                        ['permission_id' => 19, 'role_id' => '1'],
                        ['permission_id' => 20, 'role_id' => '1'],
                        ['permission_id' => 21, 'role_id' => '1'],
                        ['permission_id' => 22, 'role_id' => '1'],
                        ['permission_id' => 23, 'role_id' => '1'],
                        ['permission_id' => 24, 'role_id' => '1'],
                        ['permission_id' => 25, 'role_id' => '1'],
                        ['permission_id' => 26, 'role_id' => '1'],
                        ['permission_id' => 27, 'role_id' => '1'],
                        ['permission_id' => 28, 'role_id' => '1'],
                        ['permission_id' => 29, 'role_id' => '1'],
                        ['permission_id' => 30, 'role_id' => '1'],
                        ['permission_id' => 31, 'role_id' => '1'],
                        ['permission_id' => 32, 'role_id' => '1'],
                        ['permission_id' => 33, 'role_id' => '1'],
                        ['permission_id' => 34, 'role_id' => '1'],
                        ['permission_id' => 35, 'role_id' => '1'],
                        ['permission_id' => 36, 'role_id' => '1'],
                        ['permission_id' => 37, 'role_id' => '1'],
                    ];
            
            return PermissionRole::insert($data);
        }
    }

    public function update(Request $request)
    {
        if(!$_POST)
        {
            $data['result']  = Admin::find($request->id);
            
            $data['roles']   = Roles::all()->pluck('display_name', 'id');
            
            $data['role_id'] = Roles::role_admin($request->id)->role_id;

            return view('admin.admin.edit', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'username'   => 'required|max:255|unique:admin,username,'.$request->id,
                    'email'      => 'required|max:255|email|unique:admin,email,'.$request->id,
                    'role'       => 'required',
                    'status'     => 'required'
                    );

            $fieldNames = array(
                        'username'   => 'Username',
                        'email'      => 'Email',
                        'role'       => 'Role',
                        'status'     => 'Status'
                        );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($fieldNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput();
            }
            else
            {
                $admin = Admin::find($request->id);

                $admin->username = $request->username;
                $admin->email    = $request->email;
                $admin->status   = $request->status;
                
                if($request->password != '')
                    $admin->password = bcrypt($request->password);

                $admin->save();

                RoleAdmin::updateOrCreate(['admin_id' => $request->id],['role_id' => $request->role]);

                $this->helper->one_time_message('success', 'Updated Successfully');

                return redirect('admin/admin_users');
            }
        }
        else
        {
            return redirect('admin/admin_users');
        }
    }


    public function login()
    {
        return view('admin.login');
    }

    public function authenticate(Request $request)
    {
        $admin = Admin::where('email', $request['email'])->first();
        if(@$admin->status != 'Inactive')
        {
            
            if(Auth::guard('admin')->attempt(['email' => trim($request['email']), 'password' => trim($request['password'])]))
            {
                return redirect()->intended('admin/dashboard'); 
            }
            else
            {
                $this->helper->one_time_message('danger', 'Please Check Your Email/Password'); 
                return redirect('admin/login'); 
            }
        }
        else
        {
            $this->helper->one_time_message('danger', 'You are Blocked.'); 
            return redirect('admin/login'); 
        }
    }

    public function validator(array $data){
        $rules = array(
            'name' => 'required|max:255',
            'email' => 'required|email|max:255',
            'password' => 'required|min:6|max:50',
        );

        $fieldNames = array(
            'name'   => 'Username',
            'email'      => 'Email',
            'password'   => 'Password',
        );

        $validator = Validator::make($data, $rules);
        $validator->setAttributeNames($fieldNames);
        return $validator;
        
    }

    
    public function logout()
    {
        Auth::guard('admin')->logout();

        return redirect('admin/login');
    }

    public function profile(Request $request){
        if(!$_POST)
        {
            $data['result'] = Auth::guard('admin')->user();
            
            return view('admin.profile', $data);
        }
        else if($_POST)
        {
            $rules = array(
                    'name'       => 'required|max:255',
                    'password'   => 'confirmed|max:50',
                );

            $fieldNames = array(
                        'name'       => 'Name',
                        'password'   => 'Password',
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
                    $extension_type =  [1 => 'gif', 2 => 'jpg', 3 => 'png'];
                    if (!empty($_FILES) && $_FILES['profile_pic']['name'] != '') 
                    {
                        $img_name = 'profile';
                        $path = 'public/images/profile/'.\Auth::guard('admin')->user()->id;
                                            
                        if(!file_exists($path)) {
                            mkdir($path, 0777, true);
                        }
                    
                        $tempFile = $_FILES['profile_pic']['tmp_name'];             
                        
                        $extension      =   @exif_imagetype( $_FILES['profile_pic']['tmp_name']);
                        
                        if($extension){
                            $filename       =   $img_name . '.' . $extension_type[$extension];

                            $targetPath = 'public/images/profile/'.\Auth::guard('admin')->user()->id.'/';
                             
                            $targetFile =  $targetPath. $filename;
                         
                            move_uploaded_file($tempFile,$targetFile);
                            list($width, $height) = getimagesize($targetFile);
                        }
                    }

                    $user = Admin::find(Auth::guard('admin')->user()->id);
                    $user->username  = $request->name;
                    if(isset($request->password) && $request->password != '') $user->password   = \Hash::make($request->password);
                    if(isset($filename) && $filename != '') $user->profile_image   = $filename;
                    $user->save();
                }
                
                $this->helper->one_time_message('success', 'Updated Successfully');
                return redirect('admin/profile');
            }
        }
    }

    public function delete(Request $request)
    {
        Admin::find($request->id)->delete();
        RoleAdmin::where('admin_id', $request->id)->delete();

        $this->helper->one_time_message('success', 'Deleted Successfully');

        return redirect('admin/admin_users');
    }
}
