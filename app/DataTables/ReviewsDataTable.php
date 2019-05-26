<?php

namespace App\DataTables;

use App\Models\Reviews;
use Yajra\Datatables\Services\DataTable;

class ReviewsDataTable extends DataTable
{
    
    public function ajax()
    {
        $reviews = $this->query();

        return $this->datatables
            ->of($reviews)
            ->addColumn('action', function ($reviews) {

                $edit = '<a href="'.url('admin/edit_review/'.$reviews->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;';

                return $edit;
            })
            ->addColumn('property_name', function ($reviews) {
                return '<a href="'.url('admin/edit_review/'.$reviews->id).'">'.$reviews->property_name.'</a>';
            })
            ->make(true);
    }

    
    public function query()
    {
        
        $reviews = Reviews::join('properties', function($join) {
                                $join->on('properties.id', '=', 'reviews.property_id');
                            })
                        ->join('users', function($join) {
                                $join->on('users.id', '=', 'reviews.sender_id');
                            })
                        ->join('users as receiver', function($join) {
                                $join->on('receiver.id', '=', 'reviews.receiver_id');
                            })
                        ->select(['reviews.id as id', 'booking_id', 'properties.name as property_name', 'users.first_name as sender', 'receiver.first_name as receiver', 'reviewer', 'comments', 'reviews.created_at as created_at', 'reviews.updated_at as updated_at']);
        return $this->applyScopes($reviews);
    }

   
    public function html()
    {
        return $this->builder()
        ->addColumn(['data' => 'property_name', 'name' => 'properties.name', 'title' => 'Property Name'])
        ->addColumn(['data' => 'sender', 'name' => 'users.first_name', 'title' => 'Sender'])
        ->addColumn(['data' => 'receiver', 'name' => 'receiver.first_name', 'title' => 'Receiver'])
        ->addColumn(['data' => 'reviewer', 'name' => 'review_by', 'title' => 'Reviewer'])
        ->addColumn(['data' => 'comments', 'name' => 'comments', 'title' => 'Comments'])
        ->addColumn(['data' => 'created_at', 'name' => 'reviews.created_at', 'title' => 'Date'])
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
            // add your columns
            'created_at',
            'updated_at',
        ];
    }

    protected function filename()
    {
        return 'reviewdatatables_' . time();
    }
}
