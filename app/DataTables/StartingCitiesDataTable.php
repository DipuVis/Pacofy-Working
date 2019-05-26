<?php

namespace App\DataTables;
use App\Models\StartingCities;
use Yajra\Datatables\Services\DataTable;

class StartingCitiesDataTable extends DataTable
{
  protected $exportColumns = ['name', 'image'];

    public function ajax()
    {
       $staring_cities = $this->query();

        return $this->datatables
            ->of($staring_cities)
            ->addColumn('image', function ($staring_cities) {   
                return '<img src="'.$staring_cities->image_url.'" width="200" height="100">';
            })
            ->addColumn('action', function ($staring_cities) {   
                return '<a target="_blank" href="'.url('admin/settings/edit_starting_cities/'.$staring_cities->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;<a href="'.url('admin/settings/delete_starting_cities/'.$staring_cities->id).'" class="btn btn-xs btn-danger delete-warning"><i class="glyphicon glyphicon-trash"></i></a>';
            })
            ->addColumn('name', function ($staring_cities) {   
                return '<a target="_blank" href="'.url('admin/settings/edit_starting_cities/'.$staring_cities->id).'">'.$staring_cities->name.'</a>';
            })
            ->make(true);
    }

    public function query()
    {
       $staring_cities = StartingCities::select();
        return $this->applyScopes($staring_cities);
    }

    public function html()
    {
        return $this->builder()
        ->columns([
            'name',
            'image',
        ])
        ->addColumn(['data' => 'action', 'name' => 'action', 'title' => 'Action', 'orderable' => false, 'searchable' => false])
        ->parameters([
            'dom' => 'lBfrtip',
            'buttons' => [],
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
        return 'spacetypedatatables_' . time();
    }
}
