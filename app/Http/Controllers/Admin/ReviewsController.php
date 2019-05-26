<?php

/**
 * Reviews Controller
 *
 * Reviews Controller manages Reviews by admin. 
 *
 * @category   Reviews
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
use App\DataTables\ReviewsDataTable;
use App\Models\Reviews;
use Validator;
use App\Http\Helpers\Common;
class ReviewsController extends Controller
{
    protected $helper;

    public function __construct()
    {
        $this->helper = new Common;
    }
	
    public function index(ReviewsDataTable $dataTable)
    {
        return $dataTable->render('admin.reviews.view');
    }
   

    
     /**
     * Update Reviews Details
     *
     * @param array $request    Input values
     * @return redirect     to Reviews View
     */
    public function edit(Request $request)
    {
        
        if(!$_POST)
        {
            $data['result'] = Reviews::join('properties', function($join) {
                                $join->on('properties.id', '=', 'reviews.property_id');
                            })
                        ->join('users', function($join) {
                                $join->on('users.id', '=', 'reviews.sender_id');
                            })
                        ->join('users as receiver', function($join) {
                                $join->on('receiver.id', '=', 'reviews.receiver_id');
                            })
                        ->where('reviews.id',$request->id)->select(['reviews.id as id', 'booking_id', 'properties.name as property_name', 'users.first_name as sender', 'receiver.first_name as receiver', 'reviewer', 'comments'])->first();
            //echo "<pre>";print_r($data['result']);
            return view('admin.reviews.edit', $data);
        }
        else if($request->submit)
        {
            // Edit Reviews Validation Rules
            $rules = array(
                    'comments' => 'required'
                    );

            // Edit Reviews Validation Custom Fields Name
            $niceNames = array(
                        'comments' => 'Comments'
                        );

            $validator = Validator::make($request->all(), $rules);
            $validator->setAttributeNames($niceNames); 

            if ($validator->fails()) 
            {
                return back()->withErrors($validator)->withInput(); // Form calling with Errors and Input values
            }
            else
            {
                $user            = Reviews::find($request->id);
                $user->comments  = $request->comments;
                $user->save();
                $this->helper->one_time_message('success', 'Updated Successfully'); // Call flash message function
                return redirect('admin/reviews');
            }
        }
        else
        {
            return redirect('admin/reviews');
        }
    }
    
    
}
