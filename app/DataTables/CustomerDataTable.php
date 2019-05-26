<?php

namespace App\DataTables;

use App\Models\User;
use Yajra\Datatables\Services\DataTable;
use Auth;
class CustomerDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', function ($users) {

                $edit = \Helpers::has_permission(Auth::guard('admin')->user()->id, 'edit_customer') ?'<a href="'.url('admin/edit_customer/'.$users->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;':'';

                return $edit;
            })
            ->make(true);
    }

    public function query()
    {
        $query = User::orderBy('id', 'desc')->select();
        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'first_name', 'name' => 'first_name', 'title' => 'First Name'])
            ->addColumn(['data' => 'last_name', 'name' => 'last_name', 'title' => 'Last Name'])
            ->addColumn(['data' => 'email', 'name' => 'email', 'title' => 'Email'])
            ->addColumn(['data' => 'status', 'name' => 'status', 'title' => 'Status', 'orderable' => false, 'searchable' => false])
            ->addColumn(['data' => 'created_at', 'name' => 'created_at', 'title' => 'Created At'])
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
        return 'customersdatatables_' . time();
    }
}
