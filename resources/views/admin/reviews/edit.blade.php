@extends('admin.template')
@section('main')
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- right column -->
        <div class="col-md-8 col-sm-offset-2">
          <!-- Horizontal Form -->
          <div class="box box-info box_info">
            <div class="box-header with-border">
              <h3 class="box-title">Edit Review Form</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form id="rev_form" action="{{url('admin/edit_review')}}/{{$result->id}}" method="post">
              <div class="box-body">
                <div class="form-group">
                  <label for="booking_id" class="col-sm-3 control-label">Booking Id</label>
                  <div class="col-sm-6">
                    <p>{{$result->booking_id}}</p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                  <label for="property_name" class="col-sm-3 control-label">Property Name</label>
                  <div class="col-sm-6">
                    <p>{{$result->property_name}}</p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                  <label for="sender" class="col-sm-3 control-label">Sender</label>
                  <div class="col-sm-6">
                    <p>{{$result->sender}}</p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                  <label for="receiver" class="col-sm-3 control-label">Receiver</label>
                  <div class="col-sm-6">
                    <p>{{$result->receiver}}</p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                  <label for="reviewer" class="col-sm-3 control-label">Reviewer</label>
                  <div class="col-sm-6">
                    <p>{{$result->reviewer}}</p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="form-group">
                  <label for="comments" class="col-sm-3 control-label">Comments<em class="text-danger">*</em></label>
                  <div class="col-sm-6">
                    <textarea name="comments" class="form-control">{{$result->comments}}</textarea>
                    <span class="text-danger">{{ $errors->first('comments') }}</span>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-default" name="cancel" value="cancel">Cancel</button>
                <button type="submit" class="btn btn-info pull-right" name="submit" value="submit">Submit</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  @push('scripts')
<script>
  $('#input_dob').datepicker({ 'format': 'dd-mm-yyyy'});

  $(document).ready(function () {

            $('#rev_form').validate({
                rules: {
                    comments: {
                        required: true
                    }
                }
            });

        });
</script>
@endpush
@stop


