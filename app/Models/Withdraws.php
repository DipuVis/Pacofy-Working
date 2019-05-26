<?php

/**
 * Withdraws Model
 *
 * Withdraws Model manages Withdraws operation. 
 *
 * @category   Withdraws
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

class Withdraws extends Model
{
    protected $table = 'withdraws';

    public function users(){
      return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }
    
    public function accounts(){
       return $this->belongsTo('App\Models\Accounts', 'account_id', 'id');
    }
}
