<?php

namespace App\DataTables;
use App\Models\Meta;
use Yajra\Datatables\Services\DataTable;

class MetasDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            ->addColumn('action', function ($seo_metas) {

                $edit = '<a href="'.url('admin/settings/edit_meta/'.$seo_metas->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;';

                // $delete = (Auth::admin()->user()->can('delete_user')) ? '<a data-href="'.url('admin/delete_user/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>' : '';

                return $edit;
            })
            ->make(true);
    }

    public function query()
    {
        $query = Meta::select();
        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            //->addColumn(['data' => 'id', 'name' => 'metas.id', 'title' => 'Id'])
            ->addColumn(['data' => 'url', 'name' => 'seo_metas.url', 'title' => 'Url'])
            ->addColumn(['data' => 'title', 'name' => 'seo_metas.title', 'title' => 'Title'])
            ->addColumn(['data' => 'description', 'name' => 'seo_metas.description', 'title' => 'Description'])
            ->addColumn(['data' => 'keywords', 'name' => 'seo_metas.keywords', 'title' => 'Keywords'])
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
        return 'campaignsdatatables_' . time();
    }
}
