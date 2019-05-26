<?php

/**
 * Country Model
 *
 * Country Model manages Country operation. 
 *
 * @category   Language
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

class Country extends Model
{
	protected $table = 'country';
    public $timestamps = false;

    public function property_address(){
    	return $this->hasMany('App\Models\PropertyAddress', 'country', 'short_name');
    }
}
