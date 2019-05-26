<?php

namespace App\DataTables;
use App\Models\Category;
use Yajra\Datatables\Services\DataTable;
use Auth;

class CategoriesDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', function ($category) {

                $edit = \Helpers::has_permission(Auth::user()->id, 'edit_category') ? '<a href="'.url('admin/edit_category/'.$category->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;':'';
                $delete = \Helpers::has_permission(Auth::user()->id, 'delete_category') ? '<a href="'.url('admin/delete_category/'.$category->id).'" class="btn btn-xs btn-primary delete-warning"><i class="glyphicon glyphicon-trash"></i></a>':'';

                //$delete = (Auth::admin()->user()->can('delete_user')) ? '<a data-href="'.url('admin/delete_user/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>' : '';

                return $edit.' '.$delete;
            })
            ->make(true);
    }

    public function query()
    {
        $query = Category::select();
        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'id', 'name' => 'categories.id', 'title' => 'Id'])
            ->addColumn(['data' => 'name', 'name' => 'categories.name', 'title' => 'Name'])
            ->addColumn(['data' => 'status', 'name' => 'categories.status', 'title' => 'Status'])
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
        return 'categoriesdatatables_' . time();
    }
}
