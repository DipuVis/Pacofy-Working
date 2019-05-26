@extends('admin.template')

@section('main')

  <!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3 settings_bar_gap">
          @include('admin.common.settings_bar')
        </div>
        <!-- right column -->
        <div class="col-md-9">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="error_email_settings">  
                <div class="alert alert-warning fade in alert-dismissable">
                  <strong>Warning!</strong> Whoops there was an error. Please verify your below information. <a class="close" href="#" data-dismiss="alert" aria-label="close" title="close">×</a>
                </div>
            </div>
            <div class="box-header with-border">
              <h3 class="box-title">{{ $form_name or '' }}</h3><span class="email_status" >(<span style="color: green"><i class="fa fa-check" aria-hidden="true"></i>Verified</span>)</span>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form id="{{ $form_id or ''}}" method="post" action="{{ $action or ''}}" class="form-horizontal {{ $form_class or '' }}" {{ isset($form_type) && $form_type == 'file'? "enctype=multipart/form-data":"" }}>
              {{ csrf_field() }}
              <div class="box-body">
                @foreach($fields as $field)
                  @include("admin.common.fields.".$field['type'], ['field' => $field])
                @endforeach
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                @if(Request::segment(3) == 'email' || Request::segment(3) == '' || Request::segment(3) == 'api_informations' || Request::segment(3) == 'payment_methods' || Request::segment(3) == 'social_links')
                <a class="btn btn-default" href="{{ url('admin/settings') }}">Cancel</a>
                @else
                <a class="btn btn-default" href="{{ url()->previous() }}">Cancel</a>
                @endif
                <!--  <button type="submit" class="btn btn-default">Cancel</button> -->
                <button type="submit" class="btn btn-info pull-right">Submit</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->

          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>

@endsection