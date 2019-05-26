<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\PropertyPrice;
use App\Models\PropertyDates;
use App\Models\Bookings;
use App\Http\Helpers\Common;
use Validator;
use Form;

class CalendarController extends Controller
{
    public $startDay = 'monday';
    private $helper;

    public function __construct()
    {
        $this->helper = new Common;
    }
    
    public function generate($property_id= '', $year = '', $month = '')
    {
        if ($year == '')
            $year  = date('Y');

        if ($month == '')
            $month = date('m');

        $property_price = PropertyPrice::where('property_id', $property_id)->first();

        $totalDays = cal_days_in_month(CAL_GREGORIAN, $month, $year);

        $startDays = array('sunday' => 0, 'monday' => 1, 'tuesday' => 2, 'wednesday' => 3, 'thursday' => 4, 'friday' => 5, 'saturday' => 6);
        $startDay  = ( ! isset($startDays[$this->startDay])) ? 0 : $startDays[$this->startDay];

        $localDate = mktime(12, 0, 0, $month, 1, $year);
        $date       = getdate($localDate);
        $day        = $startDay + 1 - $date["wday"];
        
        $prvTime  = mktime(12, 0, 0, $month-1, 1, $year);
        $nxtTime  = mktime(12, 0, 0, $month+1, 1, $year);
        
        
        $prvMonth = date('m', $prvTime);
        $nxtMonth = date('m', $nxtTime);
        
        $prvYear  = date('Y', $prvTime);
        $nxtYear  = date('Y', $nxtTime);
        
       
        $curDay    = date('j');
        $curYear   = date('Y');
        $curMonth  = date('m');
    
        
        $prevTotalDays = date('t', $prvTime);

        while ($day > 1)
        {
            $day -= 7;
        }   

        $monthSelect = '<select name="year_month" id="calendar_dropdown">';
        $yearMonth   = $this->year_month();
        foreach ($yearMonth as $key => $value) {
            $selected = date('Y-m', $localDate) == $key?'selected':'';
            $monthSelect .= '<option value="'.$key.'" '.$selected.'>'.$value.'</option>';
        }
        $monthSelect .= '</select>';

        $out = '';   
        $out .= '<div class="host-calendar-container">
                    <div class="calendar-month">';

        $out .= '<div class="row-space-2 deselect-on-click">
                    <a href="'.url('manage-listing/'.$property_id.'/calendar').'" class="month-nav month-nav-previous panel text-center" data-year="'.$prvYear.'" data-month="'.$prvMonth.'"> <i class="fa fa-chevron-left fa-lg calendar-icon-style"></i> </a> 
                    <a href="'.url('manage-listing/'.$property_id.'/calendar').'" class="month-nav month-nav-next panel text-center" data-year="'.$nxtYear.'" data-month="'.$nxtMonth.'"> <i class="fa fa-chevron-right fa-lg calendar-icon-style"></i> </a> 
                    <div class="current-month-selection"> <h2> <span>'.date('F Y', $localDate).'</span> <span> &nbsp;</span> <span class="current-month-arrow">▾</span> </h2>'.$monthSelect.'<div class="spinner-next-to-month-nav">Just a moment...</div></div> 
                 </div>';

        $out .= '<div class="col-md-12 col-sm-12 col-xs-12"><div class="calenBox">';
        $out .='<div class="margin-top10">
                    <div class="col-md-02"><div class="wkText">Mon</div></div>
                    <div class="col-md-02"><div class="wkText">Tue</div></div>
                    <div class="col-md-02"><div class="wkText">Wed</div></div>
                    <div class="col-md-02"><div class="wkText">Thu</div></div>
                    <div class="col-md-02"><div class="wkText">Fri</div></div>
                    <div class="col-md-02"><div class="wkText">Sat</div></div>
                    <div class="col-md-02"><div class="wkText">Sun</div></div>
                </div>';

        while($day <= $totalDays){
            for ($i = 0; $i < 7; $i++){

                $class = '';
                if($day < $curDay && $year <= $curYear && $month <= $curMonth)
                    $class = 'dt-not-available';
                else if($year < $curYear || $month < $curMonth)
                    $class = 'dt-not-available';
                else if($day == $curDay && $year == $curYear && $month == $curMonth)
                    $class = 'dt-today';

                if($year > $curYear)
                    $class = '';

                $today = '';
                if($day == $curDay && $year == $curYear && $month == $curMonth)
                    $today = 'Today';
                    

                if ($day > 0 && $day <= $totalDays)
                {
                    $date      = $year.'-'.$month.'-'.$day;
                    
                    $finalDay = $day;
                }
                else
                {
                    if($day <= 0)
                    {
                        $dayPrev  = $prevTotalDays + $day;
                        
                        $date      = $prvYear.'-'.$prvMonth.'-'.$dayPrev;
                        
                        $finalDay = $dayPrev;
                    }
                    else if($day > $totalDays)
                    {
                        $dayNext  = $day - $totalDays;
                        
                        $date      = $nxtYear.'-'.$nxtMonth.'-'.$dayNext;
                        
                        $finalDay = $dayNext;
                    }
                }
                /*$out .= '<div class="col-md-02">
                            <div class="calender_box date-package-modal '.$class.'" id="'.$date.'" data-day="'.$day.'" data-month="'.$month.'" data-year="'.$year.'" data-price="'.$property_price->price($date).'" data-status="'.$property_price->available($date).'">
                                <div class="wkText final_day">'.$finalDay.' '.$today.'</div>
                                <div class="dTfont wkText">'.$property_price->currency->symbol.$property_price->price($date).'</div>
                            </div>
                        </div>';*/
                   if(($day >= $curDay && $year >= $curYear && $month >= $curMonth) && ($property_price->available($date)=='Not available') ){
                    //echo "if".'<br>';
                    //echo "ddd";exit();
                    $class = 'dt-available-with-events';
                    $out .= '<div class="col-md-02" style="cursor:pointer">
                                <div class="calender_box date-package-modal '.$class.'"  id="'.$date.'" data-day="'.$day.'" data-month="'.$month.'" data-year="'.$year.'" data-price="'.$property_price->price($date).'"data-status="'.$property_price->available($date).'">
                                    <div class="wkText final_day">'.$finalDay.' '.$today.'</div>
                                    <div class="dTfont wkText">'.$property_price->currency->symbol.$property_price->price($date).'</div>
                                </div>
                            </div>';
                    }else{
                        if(($month >= $curMonth) && ($property_price->available($date)=='Not available') ){
                            $class = 'dt-available-with-events';
                            $out .= '<div class="col-md-02" style="cursor:pointer">
                                    <div class="calender_box date-package-modal '.$class.'" id="'.$date.'" data-day="'.$day.'" data-month="'.$month.'" data-year="'.$year.'" data-price="'.$property_price->price($date).'"data-status="'.$property_price->available($date).'">
                                        <div class="wkText final_day">'.$finalDay.' '.$today.'</div>
                                        <div class="dTfont wkText">'.$property_price->currency->symbol.$property_price->price($date).'</div>
                                    </div>
                                </div>';
                        }else{
                           $out .= '<div class="col-md-02" style="cursor:pointer">
                                    <div class="calender_box date-package-modal '.$class.'" id="'.$date.'" data-day="'.$day.'" data-month="'.$month.'" data-year="'.$year.'" data-price="'.$property_price->price($date).'"data-status="'.$property_price->available($date).'">
                                        <div class="wkText final_day">'.$finalDay.' '.$today.'</div>
                                        <div class="dTfont wkText">'.$property_price->currency->symbol.$property_price->price($date).'</div>
                                    </div>
                            </div>'; 
                        }
                    }
                $day++;
            }
        }
        

        $out .= '</div></div></div></div>';

        return $out;
    }

    public function calender_json(Request $request, CalendarController $calendar)
    {
        $year              = @$request->year;
        $month             = @$request->month;
        $data['room_step'] = 'edit_calendar';
        $data['calendar']  = $calendar->generate($request->id, $year, $month);
      
        return json_encode($data);
    }

    public function calender_price_set(Request $request, CalendarController $calendar){
        $start_date = date('Y-m-d', strtotime($request->start_date));
        $end_date   = date('Y-m-d', strtotime($request->end_date));
        
        $start_date = strtotime($start_date);
        $end_date   = strtotime($end_date);
        
        for ($i=$start_date; $i<=$end_date; $i+=86400) 
        {
            $date = date("Y-m-d", $i);

            $data = [ 'property_id' => $request->id,
                      'price'   => ($request->price) ? $request->price : '0',
                      'status'  => $request->status,
                    ];

            PropertyDates::updateOrCreate(['property_id' => $request->id, 'date' => $date], $data);
        }

        $data['status'] = 1;
        return json_encode($data);
    }

    public function year_month()
    {
        $res = array();

        for($i=-2;$i<30;$i++)
        {
          $date               = strtotime("+$i months");
          $value              = date('Y-m', $date);
          $label              = date('F Y', $date);
          $res[$value]        = $label; 
        }
        return $res;
    }

}
