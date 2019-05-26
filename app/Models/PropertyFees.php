<?php

/**
 * PropertyFees Model
 *
 * PropertyFees Model manages PropertyFees operation. 
 *
 * @category   PropertyFees
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

class PropertyFees extends Model
{
	protected $table = 'property_fees';
	public $timestamps = false;
}
