<?php

/**
 * AmenityTypeDataTable Data Table
 *
 * AmenityTypeDataTable Data Table handles AmenityTypeDataTable datas. 
 *
 * @category   AmenityTypeDataTable
 * @package    vRent
 * @author     Techvillage Dev Team
 * @copyright  2017 Techvillage
 * @license    
 * @version    1.3
 * @link       http://techvill.net
 * @since      Version 1.3
 * @deprecated None
 */

namespace App\DataTables;

use App\Models\AmenityType;
use Yajra\Datatables\Services\DataTable;

class AmenityTypeDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', function ($amenity_type) {

                $edit = '<a href="'.url('admin/settings/edit_amenities_type/'.$amenity_type->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;';
                $delete = '<a href="'.url('admin/settings/delete_amenities_type/'.$amenity_type->id).'" class="btn btn-xs btn-danger delete-warning"><i class="glyphicon glyphicon-trash"></i></a>';
                // $delete = (Auth::admin()->user()->can('delete_user')) ? '<a data-href="'.url('admin/delete_user/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>' : '';

                return $edit.' '.$delete;
            })
            ->make(true);
    }
	
    public function query()
    {
        $query = AmenityType::select();

        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'name', 'name' =>'amenity_type.name', 'title' => 'Name'])
            ->addColumn(['data' => 'description', 'name' =>'amenity_type.description', 'title' => 'Description'])
            ->addColumn(['data' => 'action', 'name' =>'action', 'title' => 'Action', 'orderable' => false, 'searchable' => false])
            ->parameters($this->getBuilderParameters());
    }

    protected function getColumns()
    {
        return [
            'id',
            'created_at',
            'updated_at',
        ];
    }

    protected function filename()
    {
        return 'amenitytypedatatables_' . time();
    }
}
