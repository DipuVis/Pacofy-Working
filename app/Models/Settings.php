<?php

/**
 * Settings Model
 *
 * Settings Model manages Settings operation. 
 *
 * @category   Settings
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
class Settings extends Model
{
	protected $table    = 'settings';
    public $timestamps  = false;

    protected $fillable = ['value'];
}
