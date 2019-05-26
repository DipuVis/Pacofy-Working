@extends('template')

@section('main')
  <div class="container margin-top30">
    <div class="col-md-4 col-center">
      <div class="panel panel-default">
        <div class="panel">
          <div class="panel-body">
            <div class="row col-center"> 
            <a href="{{ @$facebook_url?@$facebook_url:URL::to('facebookLogin') }}" class="btn btn-facebook" style="padding: 8px 8px !important">
              <div class="responsive-content" style="font-size: 13px !important"><i class="fa fa-facebook pad-r-3"></i>{{trans('messages.sign_up.sign_up_with_facebook')}}</div>
            </a>
            <!--<div class="clearfix"></div>-->
            <a href="{{URL::to('googleLogin')}}" class="btn btn-google" style="padding: 8px 8px !important;">
              <div class="responsive-content" style="font-size: 13px !important">
                <i class="fa fa-google-plus pad-r-4"></i>
                {{trans('messages.sign_up.sign_up_with_google')}}
              </div>
            </a>
             
              <div class="col-md-12 cls-or">
                <label>{{trans('messages.login.or')}}</label>
              </div>
            </div>
            
            <form id="signup_form" name="signup_form" method="post" action="{{url('create')}}" class='signup-form login-form' accept-charset='UTF-8' onsubmit="return ageValidate();">    
              <div class="row">
                <input type="hidden" name='email_signup' id='form'>
                <div class="col-sm-12">
                  @if ($errors->has('first_name')) <p class="error-tag">{{ $errors->first('first_name') }}</p> @endif
                  <input type="text" class='form-control' value="{{old('first_name')}}" name='first_name' id='first_name' placeholder='{{trans('messages.sign_up.first_name')}}'>
                </div>
                <div class="col-sm-12">
                  @if ($errors->has('last_name')) <p class="error-tag">{{ $errors->first('last_name') }}</p> @endif
                  <input type="text" class='form-control' value="{{old('last_name')}}" name='last_name' id='last_name' placeholder='{{trans('messages.sign_up.last_name')}}'>
                </div>
                <div class="col-sm-12">
                  @if ($errors->has('email')) <p class="error-tag">{{ $errors->first('email') }}</p> @endif
                  <input type="text" class='form-control' value="{{old('email')}}" name='email' id='email' placeholder='{{trans('messages.login.email')}}'>
                  <span class="text-danger">
                    <label id='emailError'></label>
                  </span>
                </div>
                <div class="col-sm-12">
                  @if ($errors->has('password')) <p class="error-tag">{{ $errors->first('password') }}</p> @endif
                  <input type="password" class='form-control' name='password' id='password' placeholder='{{trans('messages.login.password')}}'>
                </div>
                <div class="col-sm-12">
                  <label class="l-pad-none">{{trans('messages.sign_up.birth_day')}} <span style="color: red !important;">*</span></label>
                </div>
                <div class="col-sm-12">
                  @if ($errors->has('birthday_month') || $errors->has('birthday_day') || $errors->has('birthday_year')) 
                    <p class="error-tag">{{ $errors->has('birthday_month') ? $errors->first('birthday_month') : ($errors->has('birthday_day')) ? $errors->first('birthday_day') : ($errors->has('birthday_year')) ? $errors->first('birthday_year') : '' }}</p> 
                  @else
                    <p class="error-tag">{{$errors->first('date_of_birth')}}</p>
                  @endif
                </div>
                <div class="col-sm-12">
                  <div class="col-sm-4 l-pad-none r-pad-none">
                    <select name='birthday_month' class='form-control day-of-birth' id='user_birthday_month'>
                      <option value=''>{{trans('messages.sign_up.month')}}</option>
                      @for($m=1; $m<=12; ++$m)
                        <option value="{{$m}}" {{old('birthday_month')==$m?'selected="selected"':''}}>{{date('F', mktime(0, 0, 0, $m, 1))}}</option>
                      @endfor
                    </select>
                  </div>
                  <div class="col-sm-4 l-pad-none r-pad-none">
                    <select name='birthday_day' class='form-control day-of-birth' id='user_birthday_day'>
                      <option value=''>{{trans('messages.sign_up.day')}}</option>
                      @for($m=1; $m<=31; ++$m)
                        <option value="{{$m}}" {{old('birthday_day')==$m?'selected="selected"':''}}>{{$m}}</option>
                      @endfor
                    </select>
                  </div>
                  <div class="col-sm-4 l-pad-none r-pad-none">
                    <select name='birthday_year' class='form-control day-of-birth' id='user_birthday_year'>
                      <option value=''>{{trans('messages.sign_up.year')}}</option>
                      @for($m=date('Y'); $m > date('Y')-100; $m--)
                        <option value="{{$m}}"{{old('birthday_year')==$m?'selected="selected"':''}}>{{$m}}</option>
                      @endfor
                    </select>
                  </div>
                  <input type="hidden" id="day-of-birth" name="date_of_birth" value="{{old('date_of_birth')}}"/>
                  <span class="text-danger">
                    <label id='dobError'></label>
                  </span>
                </div>
                
                <div class="col-sm-12 pad-t-5">
                  <input name="btn" id="btn" type='submit' value='{{trans('messages.sign_up.sign_up')}}' class='btn ex-btn btn-block btn-large'>
                </div>
              </div>
            </form>

            <div class="col-sm-12 mrg-top-25">
              {{trans('messages.sign_up.already')}} {{ $site_name }} {{trans('messages.sign_up.member')}}?
              <a href="{{URL::to('/')}}/login?" class="modal-link link-to-login-in-signup" data-modal-href="/login_modal?" data-modal-type="login">
                {{trans('messages.sign_up.login')}}
            </div>  
          </div>
        </div>
      </div>
    </div>
  </div>
@stop

@section('validation_script')

<script type="text/javascript">
   
  $('select').on('change', function() {
      var dobError = ''; 
      var day = document.getElementById("user_birthday_day").value;
      var month = document.getElementById("user_birthday_month").value;
      var y = document.getElementById("user_birthday_year").value;
      var year = parseInt(y);
      var year2 = signup_form.birthday_year;
      var age = 18;
     
      var setDate = new Date(year + age, month - 1, day);
      var currdate = new Date();
      if (day == '' || month == '' || y == '') {
        $('#dobError').html('<label class="text-danger">This field is required.</label>');
          year2.focus();
          return false;
      }
      //window.alert(setDate);
      else if (setDate > currdate) {
          //window.alert(setDate);
          $('#dobError').html('<label class="text-danger">Age must be greater than 18.</label>');
          year2.focus();
          return false;
          // $('#dobError').html('<label class="text-danger">Age must be greater than 18.</label>');
          // $('#user_birthday_day').addClass('has-error');
          // $('#user_birthday_month').addClass('has-error');
          // $('#user_birthday_year').addClass('has-error');
      }
      else
      {
        $('#dobError').html('<span class="text-danger"></span>');
        return true;
      }
  });

   function ageValidate()
   {
      var dobError = ''; 
      var day = document.getElementById("user_birthday_month").value;
      var month = document.getElementById("user_birthday_day").value;
      var y = document.getElementById("user_birthday_year").value;
      var year = parseInt(y);
      var year2 = signup_form.birthday_year;
      var age = 18;
     
      var setDate = new Date(year + age, month - 1, day);
      var currdate = new Date();
      if (day == '' || month == '' || y == '') {
        $('#dobError').html('<label class="text-danger">This field is required.</label>');
          year2.focus();
          return false;
      }
      //window.alert(setDate);
      else if (setDate > currdate) {
          //window.alert(setDate);
          $('#dobError').html('<label class="text-danger">Age must be greater than 18.</label>');
          year2.focus();
          return false;
          // $('#dobError').html('<label class="text-danger">Age must be greater than 18.</label>');
          // $('#user_birthday_day').addClass('has-error');
          // $('#user_birthday_month').addClass('has-error');
          // $('#user_birthday_year').addClass('has-error');
      }
      else
      {
        $('#dobError').html('<span class="text-danger"></span>');
        return true;
      }
   }

   jQuery.validator.addMethod("laxEmail", function(value, element) {
      return this.optional( element ) || /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test( value );
    }, 'Please enter a valid email address.');

   $(document).ready(function () {

       $('#signup_form').validate({
          rules: {
              first_name: {
                  required: true,
                  maxlength: 255
              },
              last_name: {
                  required: true,
                  maxlength: 255
              },
              email: {
                  required: true,
                  maxlength: 255,
                  laxEmail: true
              },
              password: {
                  required: true,
                  minlength: 6
              }

          }
      });


      $('#email').blur(function(){
        var emailError = '';
        var email = $('#email').val();
        //var email2 = signup_form.email;
        var _token = $('input[name="_token"]').val();
        $.ajax({
          url:"{{ route('checkUser.check') }}",
          method:"POST",
          data:{email:email, _token:_token},
          success:function(result)
          {
            if(result == 'not_unique')
            {
              $('#emailError').html('<label class="text-danger">Email address is already Existed.</label>');
              $('#email').addClass('has-error');
              //email2.focus();
              $('#btn').attr('disabled', 'disabled');
            }
            else
            {
              $('#emailError').html('<label class="text-success"></label>');
              $('#email').removeClass('has-error');
              $('#btn').attr('disabled', false);
            }
          }
        })
        
      });

    });
</script>

@endsection