<?php

/**
 * Rules Model
 *
 * Rules Model manages Rules operation. 
 *
 * @category   Rules
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

class Rules extends Model
{
	protected $table = 'rules';
	public $timestamps = false;
}
