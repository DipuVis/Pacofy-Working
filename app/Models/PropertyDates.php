<?php

/**
 * PropertyDates Model
 *
 * PropertyDates Model manages PropertyDates operation. 
 *
 * @category   PropertyDates
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

class PropertyDates extends Model
{
	protected $table = 'property_dates';
	protected $fillable = ['property_id', 'status', 'date', 'price'];

	public function properties(){
        return $this->belongsTo('App\Models\Properties', 'property_id', 'id');
    }
}
