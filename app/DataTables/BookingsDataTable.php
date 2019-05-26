<?php

namespace App\DataTables;

use App\Models\Bookings;
use Yajra\Datatables\Services\DataTable;

class BookingsDataTable extends DataTable
{
    public function ajax()
    {
        $bookings = $this->query();

        return $this->datatables
            ->of($bookings)
            ->addColumn('action', function ($bookings) {
                return '<a href="'.url('admin/bookings/detail/'.$bookings->id).'" class="btn btn-xs btn-primary" title="Detail View"><i class="fa fa-share"></i></a>&nbsp;';
            })
            ->addColumn('host_name', function ($bookings) {
                return '<a href="'.url('admin/edit_customer/'.$bookings->host_id).'">'.ucfirst($bookings->host_name).'</a>';
            })
            ->make(true);
    }

    public function query()
    {
        $bookings = Bookings::join('properties', function($join) {
                                $join->on('properties.id', '=', 'bookings.property_id');
                            })
                        ->join('users', function($join) {
                                $join->on('users.id', '=', 'bookings.user_id');
                            })
                        ->join('currency', function($join) {
                                $join->on('currency.code', '=', 'bookings.currency_code');
                            })
                        ->leftJoin('users as u', function($join) {
                                $join->on('u.id', '=', 'bookings.host_id');
                            })
                        ->select(['bookings.id as id', 'u.first_name as host_name', 'users.first_name as guest_name', 'properties.name as property_name', \DB::raw('CONCAT(currency.symbol, bookings.total) AS total_amount'), 'bookings.status', 'bookings.created_at as created_at', 'bookings.updated_at as updated_at', 'bookings.start_date', 'bookings.end_date', 'bookings.guest', 'bookings.host_id', 'bookings.user_id', 'bookings.total', 'bookings.currency_code', 'bookings.service_charge', 'bookings.host_fee']);

        return $this->applyScopes($bookings);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'host_name', 'name' => 'u.first_name', 'title' => 'Host Name'])
            ->addColumn(['data' => 'guest_name', 'name' => 'users.first_name', 'title' => 'Guest Name'])
            ->addColumn(['data' => 'property_name', 'name' => 'properties.name', 'title' => 'Property Name'])
            ->addColumn(['data' => 'total_amount', 'name' => 'bookings.total', 'title' => 'Total Amount'])
            ->addColumn(['data' => 'status', 'name' => 'bookings.status', 'title' => 'Status'])
            ->addColumn(['data' => 'created_at', 'name' => 'bookings.created_at', 'title' => 'Date'])
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
        return 'bookingsdatatables_' . time();
    }
}
