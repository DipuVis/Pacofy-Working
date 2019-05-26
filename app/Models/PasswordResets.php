<?php

/**
 * PasswordResets Model
 *
 * PasswordResets Model manages PasswordResets operation. 
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

class PasswordResets extends Model
{
    protected $table = 'password_resets';

    public $timestamps = false;
}