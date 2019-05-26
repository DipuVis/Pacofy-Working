@extends('template')

@section('main')
  <div class="container margin-top30">
    <div class="col-md-4 col-center">
      <div class="panel panel-default">
        <div class="panel-body h4">{{trans('messages.forgot_pass.reset_pass')}}</div>
        <div class="panel">
          <div class="panel-body">
            <form id="forgot_password_form" method="post" action="{{url('forgot_password')}}" class='signup-form login-form' accept-charset='UTF-8'>  
              <div class="col-sm-12">
                <p>{{trans('messages.forgot_pass.please_enter_email')}}</p>
              </div>
              <div class="col-sm-12">
                @if ($errors->has('email')) <p class="error-tag">{{ $errors->first('email') }}</p> @endif
                <input type="text" class="form-control" name="email" placeholder = "Email">
              </div>
              
              <div class="col-sm-12 mrg-top-25">
                <button class="btn ex-btn" type="submit">
                  {{trans('messages.forgot_pass.reset_link')}}
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
@stop

@section('validation_script')

<script type="text/javascript">
  
  jQuery.validator.addMethod("laxEmail", function(value, element) {
          // allow any non-whitespace characters as the host part
          return this.optional( element ) || /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test( value );
    }, 'Please enter a valid email address.');

  $(document).ready(function () {
     $('#forgot_password_form').validate({
        rules: {
          email: {
            required: true,
            maxlength: 255,
            laxEmail: true
          }
        }
     });
  });

</script>

@endsection