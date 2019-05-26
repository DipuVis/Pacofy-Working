@extends('admin.template')
@section('main')
 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Members
        <small>Control panel</small>
      </h1>
      @include('admin.common.breadcrumb')
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Members Management</h3>
              @if(Helpers::has_permission(Auth::user()->id, 'add_member'))
                <div style="float:right;"><a class="btn btn-success" href="{{ url('admin/add_member') }}">Add User</a></div>
              @endif
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              {!! $dataTable->table() !!}
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
@endsection

@push('scripts')
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.0.3/css/buttons.dataTables.min.css">
<script src="https://cdn.datatables.net/buttons/1.0.3/js/dataTables.buttons.min.js"></script>
<script src="{{url('public/js/buttons.server-side.js')}}"></script>
<script src="{{ url('public/backend/dist/js/jquery.dataTables.min.js') }}" type="text/javascript"></script>
{!! $dataTable->scripts() !!}
@endpush