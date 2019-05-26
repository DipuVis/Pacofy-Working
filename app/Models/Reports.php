<?php

/**
 * Reports Model
 *
 * Reports Model manages Reports operation. 
 *
 * @category   Reports
 * @package    vRent
 * @author     Techvillage Dev Team
 * @copyright  2017 Techvillage
 * @license    
 * @version    1.3
 * @link       http://techvill.net
 * @since      Version 1.3
 * @deprecated None
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Reports extends Model
{
    protected $table = 'reports';

    public function users(){
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }

    public function properties(){
        return $this->belongsTo('App\Models\Properties', 'property_id', 'id');
    }
}
