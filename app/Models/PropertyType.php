<?php

/**
 * PropertyType Model
 *
 * PropertyType Model manages PropertyType operation. 
 *
 * @category   PropertyType
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

class PropertyType extends Model
{
	protected $table = 'property_type';
	public $timestamps = false;

	public function properties(){
        return $this->hasMany('App\Models\Properties', 'property_type', 'id');
    }
}
