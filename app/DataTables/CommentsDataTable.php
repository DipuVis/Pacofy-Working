<?php

namespace App\DataTables;

use App\Models\Comment;
use Yajra\Datatables\Services\DataTable;
use Illuminate\Support\Facades\Request;
class CommentsDataTable extends DataTable
{
    public function ajax()
    {
        return $this->datatables
            ->eloquent($this->query())
            //->addColumn('action', function ($comment) {

                //$edit = '<a href="'.url('admin/display_photo/'.$comment->id).'" class="btn btn-xs btn-primary"><i class="glyphicon glyphicon-edit"></i></a>&nbsp;';

                /*$comment = '<a href="'.url('admin/comment_photo/'.$photo->id).'" class="btn btn-xs btn-primary">Comment</a>&nbsp;';*/
                // $delete = (Auth::admin()->user()->can('delete_user')) ? '<a data-href="'.url('admin/delete_user/'.$users->id).'" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#confirm-delete"><i class="glyphicon glyphicon-trash"></i></a>' : '';

                //return $edit;
            //})
            ->addColumn('uname', function ($comment) {   
                $user_name = '<a href="'.url('admin/edit_member/'.$comment->users->id).'" ><h5>'.ucfirst($comment->users->name).'</h5></a>';
                return $user_name;
            })
            ->make(true);
    }

    public function query()
    {
        $id    = Request::segment(3);
        $query = Comment::where('photo_id', $id)->select();

        return $this->applyScopes($query);
    }

    public function html()
    {
        return $this->builder()
            ->addColumn(['data' => 'comment', 'name' => 'comments.comment', 'title' => 'Comment'])
            ->addColumn(['data' => 'uname', 'name' => 'uname', 'title' => 'User Name'])
            ->addColumn(['data' => 'created_at', 'name' => 'comments.created_at', 'title' => 'Created At'])
            ->addColumn(['data' => 'updated_at', 'name' => 'comments.updated_at', 'title' => 'Updated At'])
            //->addColumn(['data' => 'action', 'name' => 'action', 'title' => 'Action', 'orderable' => false, 'searchable' => false])
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
