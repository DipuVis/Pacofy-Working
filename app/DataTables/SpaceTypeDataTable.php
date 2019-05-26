<?php

namespace App\DataTables;
use App\Models\SpaceType;
use Yajra\Datatables\Services\DataTable;

class SpaceTypeDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', function ($space_type) {

                $edit = '<a href="'.url('admin/settings/edit_space_type/'.$space_type->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;';
                $delete = '<a href="'.url('admin/settings/delete_space_type/'.$space_type->id).'" class="btn btn-xs btn-danger delete-warning"><i class="glyphicon glyphicon-trash"></i></a>';
                // $delete = (Auth::admin()->user()->can('delete_user')) ? '<a data-href="'.url('admin/delete_user/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>' : '';

                return $edit.' '.$delete;
            })
            ->make(true);
    }

    public function query()
    {
        $query = SpaceType::query();
        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'name', 'name' => 'space_type.name', 'title' => 'Name'])
            ->addColumn(['data' => 'description', 'name' => 'space_type.description', 'title' => 'Description'])
            ->addColumn(['data' => 'status', 'name' => 'space_type.status', 'title' => 'Status'])
            ->addColumn(['data' => 'action', 'name' => 'action', 'title' => 'Action', 'orderable' => false, 'searchable' => false])
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
        return 'spacetypedatatables_' . time();
    }
}
