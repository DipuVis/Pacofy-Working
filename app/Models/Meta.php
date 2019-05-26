<?php

/**
 * Metas Model
 *
 * Metas Model manages Metas operation. 
 *
 * @category   Metas
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

class Meta extends Model
{
    protected $table = 'seo_metas';
    public $timestamps = false;
}
