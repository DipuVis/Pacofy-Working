<?php

/**
 * PropertyDescription Model
 *
 * PropertyDescription Model manages PropertyDescription operation. 
 *
 * @category   PropertyDescription
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

class PropertyDescription extends Model
{
	protected $table = 'property_description';
	public $timestamps = false;

	public function properties(){
        return $this->belongsTo('App\Models\Properties', 'property_id', 'id');
    }
}
