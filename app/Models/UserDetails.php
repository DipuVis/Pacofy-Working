<?php

/**
 * UserDetails Model
 *
 * UserDetails Model manages UserDetails operation. 
 *
 * @category   UserDetails
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

class UserDetails extends Model
{
	protected $table    = 'user_details';
	protected $fillable = ['user_id', 'field', 'value'];
    public $timestamps  = false;

    public function user(){
        return $this->belongsTo('App\Models\User', 'user_id', 'id');
    }

    public function fields()
    {
    	//echo "dfsdf";exit();
    	return UserDetail::whereStatus('Active')->get();
    }


}