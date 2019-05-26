<?php

/**
 * Language Model
 *
 * Language Model manages Language operation. 
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

class Language extends Model
{
	protected $table = 'language';
    public $timestamps = false;
}
