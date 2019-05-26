<?php

namespace App\DataTables;
use App\Models\Properties;
use Yajra\Datatables\Services\DataTable;

class PropertyDataTable extends DataTable
{
    public function ajax()
    {
        $properties = $this->query();

        return $this->datatables
            ->of($properties)
            ->addColumn('action', function ($properties) {
                $edit = '<a href="'.url('admin/listing/'.$properties->properties_id).'/basics" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;';
                
                $delete = '<a href="'.url('admin/delete_property/'.$properties->properties_id).'" class="btn btn-xs btn-danger delete-warning"><i class="glyphicon glyphicon-trash"></i></a>';
                

                return $edit.$delete;
            })
            ->addColumn('host_name', function ($properties) {
                return ucfirst($properties->host_name);
            })
            ->make(true);
    }

    public function query()
    {
        $query = Properties::join('users', function($join) {
                                $join->on('users.id', '=', 'properties.host_id');
                            })
                        ->join('space_type', function($join) {
                                $join->on('space_type.id', '=', 'properties.space_type');
                            })

                        ->select(['properties.id as properties_id', 'properties.name as property_name', 'properties.status as property_status', 'properties.created_at as property_created_at', 'properties.updated_at as property_updated_at', 'properties.*', 'users.*', 'space_type.*'])
                        ;
                       

        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'properties_id', 'name' => 'properties.id', 'title' => 'Id'])
            ->addColumn(['data' => 'property_name', 'name' => 'properties.name', 'title' => 'Name'])
            ->addColumn(['data' => 'host_name', 'name' => 'users.first_name', 'title' => 'Host Name'])
            ->addColumn(['data' => 'space_type_name', 'name' => 'space_type.name', 'title' => 'Space Type'])
            ->addColumn(['data' => 'property_status', 'name' => 'properties.status', 'title' => 'Status'])
            ->addColumn(['data' => 'property_created_at', 'name' => 'properties.created_at', 'title' => 'Date'])
            ->addColumn(['data' => 'action', 'name' => 'action', 'title' => 'Action', 'orderable' => false, 'searchable' => false])
            ->parameters([
                'dom' => 'lBfrtip',
                // 'dom' => 'Bfrtip',
                'buttons' => [],
                'order' => [0, 'desc'],
            ]);
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
        return 'propertydatatables_' . time();
    }
}
