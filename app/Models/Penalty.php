<?php

/**
 * Penalty Model
 *
 * Penalty Model manages Penalty operation. 
 *
 * @category   Penalty
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

class Penalty extends Model
{
	protected $table = 'penalty';

	public function bookings(){
        return $this->belongsTo('App\Models\Bookings', 'booking_id', 'id');
    }

    public function payout_penalties(){
    	return $this->hasMany('App\Models\PayoutPenalties', 'penalty_id', 'id');
    }
}
