@extends('template')

@section('main')
  <div class="container margin-top30">
    <div class="col-md-3">
      <div class="panel panel-default">
          <div class="panel-footer">
            <div class="panel">
              @include('common.sidenav')
            </div>
          </div>
      </div>
    </div>

    <div class="col-md-9">
      <div class="panel panel-default">
        <div class="panel-body h5">
          {{trans('messages.users_media.profile_photo')}}
        </div>
        <div class="panel-footer">
          <div class="panel">
            <div class="panel-body">
              <div class="col-lg-4 text-center">
                <div data-picture-id="91711885" class="profile_pic_container picture-main space-sm-2 space-md-2">
                  <div class="media-photo profile-pic-background">
                    <img width="225" height="225" title="{{ Auth::user()->first_name }}" src="{{  \Auth::user()->profile_src }}" alt="{{ @$result->first_name }}">
                  </div>
                </div>
              </div>
              <div class="col-lg-8">
                <ul class="list-layout picture-tiles clearfix ui-sortable"></ul>
                <p>
                 {{trans('messages.users_media.photo_data')}} .
                </p>
                <div class="row row-condensed">
                  <div class="col-md-12" style="border: 2px solid #ddd;width: 50%">
                    <span class="btn btn-block btn-large file-input-container">
                        <!--{{trans('messages.users_media.file_upload')}}-->
                      <form name="ajax_upload" method="post" id="ajax_upload" enctype="multipart/form-data" action="{{ url('/') }}/users/profile/media" accept-charset="UTF-8">
                          <input type="file" name="photos[]" id="profile_image">
                          <iframe style="display:none;" name="upload_frame" id="upload_frame"></iframe>
                      </form>
                    </span>   
                  </div>
                </div>
                <div class="errorTxt_p"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </div>
@push('scripts')

<script type="text/javascript">

  $('#profile_image').on('change', function(){
    $('#ajax_upload').submit();
  });
</script>
@endpush
@stop

@section('validation_script')
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.12.0/additional-methods.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        $('#ajax_upload').validate({
            rules: {
                'photos[]': {
                    //extension: "jpg|png|jpeg|gif"
                    accept: "image/jpg,image/jpeg,image/png,image/gif"
                    //accept: "image/*"
                }
            },
            messages: {
                'photos[]': {
                    accept: 'The file must be an image (jpg, jpeg, png or gif)'
                    //extension: 'The file must be an image (jpg, jpeg, png or gif)'
                }
            },
            errorElement : 'div',
            errorLabelContainer: '.errorTxt_p'
        });
    });
</script>  
@endsection