<?php

/**
 * Reports Controller
 *
 * Reports Controller display Reports. 
 *
 * @category   Reports
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

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\DataTables\ReportsDataTable;
use App\Models\Report;
use Validator;
use App\Http\Helpers\Common;

class ReportsController extends Controller
{
    protected $helper; 

    public function __construct()
    {
        $this->helper = new Common;
    }
	
    public function index(ReportsDataTable $dataTable)
    {
        return $dataTable->render('admin.reports.view');
    }

    public function display(Request $request)
    {
        $data['result'] = Report::find($request->id);

        return view('admin.reports.display', $data);
        
    }

    public function status_change(Request $request){
        $report = Report::find($request->report_id);
        $report->status = $request->status;
        $report->save();

        $data['status'] = 1;
        echo json_encode($data);
    }

    public function delete(Request $request)
    {
        Report::find($request->id)->delete();

        $this->helper->one_time_message('success', 'Deleted Successfully');

        return redirect('admin/reports');
    }
}
