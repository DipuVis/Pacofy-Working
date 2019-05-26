<?php

namespace App\DataTables;
use App\Models\Page;
use Yajra\Datatables\Services\DataTable;

class PagesDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', function ($pages) {

                $edit = '<a href="'.url('admin/edit_page/'.$pages->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;';
                $delete = '<a href="'.url('admin/delete_page/'.$pages->id).'" class="btn btn-xs btn-danger delete-warning"><i class="glyphicon glyphicon-trash"></i></a>';
                // $delete = (Auth::admin()->user()->can('delete_user')) ? '<a data-href="'.url('admin/delete_user/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>' : '';

                return $edit.' '.$delete;
            })
            ->make(true);
    }

    public function query()
    {
        $query = Page::select();
        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'name', 'name' => 'pages.name', 'title' => 'Name'])
            ->addColumn(['data' => 'url', 'name' => 'pages.url', 'title' => 'Url'])
            ->addColumn(['data' => 'status', 'name' => 'pages.status', 'title' => 'Status'])
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
        return 'membersdatatables_' . time();
    }
}
