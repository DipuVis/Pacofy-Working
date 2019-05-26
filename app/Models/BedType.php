<?php

/**
 * BedType Model
 *
 * BedType Model manages BedType operation. 
 *
 * @category   BedType
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

class BedType extends Model
{
	protected $table = 'bed_type';
	public $timestamps  = false;
}
