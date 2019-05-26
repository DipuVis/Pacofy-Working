@extends('template')
@section('main')
  <!-- Modal -->
  <div class="modal fade" id="hotel_date_package" role="dialog" style="display:none;z-index:1000000;">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close cls-reload" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">{{trans('messages.listing_calendar.calendar_title')}}</h4>
        </div>
        <form method="post" action="hotel_date_package/" class='form-horizontal' id='dtpc_form'>
          <div class="modal-body">
            <p style="background-color: green;color:white;text-align: center;font-size:15px;display:none;" id="model-message"></p>
            <input type="hidden" value="{{ $result->id }}" name="property_id" id="dtpc_property_id">
            <div class="form-group">
              <label for="input_dob" class="col-sm-3 control-label">{{trans('messages.listing_calendar.start_date')}} <em class="text-danger">*</em></label>
              <div class="col-sm-6">
                <input type="text" class="form-control" name="start_date" id='dtpc_start' placeholder = "{{trans('messages.listing_calendar.start_date')}}" autocomplete = 'off'>
                <span class="text-danger" id="error-dtpc-start">{{ $errors->first('start_date') }}</span>
              </div>
            </div>
            <div style="clear:both;"></div>
            <div class="form-group">
              <label for="input_dob" class="col-sm-3 control-label">{{trans('messages.listing_calendar.end_date')}} <em class="text-danger">*</em></label>
              <div class="col-sm-6">
                <input type="text" class="form-control" name="end_date" id='dtpc_end' placeholder = "{{trans('messages.listing_calendar.end_date')}}" autocomplete = 'off'>
                <span class="text-danger" id="error-dtpc-end">{{ $errors->first('end_date') }}</span>
              </div>
            </div>
            <div style="clear:both;"></div>
            <div class="form-group">
              <label for="input_dob" class="col-sm-3 control-label">{{trans('messages.listing_calendar.price')}} <em class="text-danger">*</em></label>
              <div class="col-sm-6">
                <input type="text" class="form-control" name="price" id='dtpc_price' placeholder = "">
                <span class="text-danger" id="error-dtpc-price">{{ $errors->first('price') }}</span>
              </div>
            </div>

             <div class="form-group">
              <label for="input_dob" class="col-sm-3 control-label">Status<em class="text-danger">*</em></label>
              <div class="col-sm-6">
                <select class="form-control" name="status" id="dtpc_status">
                  <option value="">--Please Select--</option>
                  <option value="Available">Available</option>
                  <option value="Not available">Not Available</option>
                </select>
                <span class="text-danger" id="error-dtpc-status">{{ $errors->first('status') }}</span>
              </div>
            </div>

          </div>
          
          <div class="modal-footer">
            <button class="btn btn-info pull-right" type="submit" name="submit">{{trans('messages.listing_calendar.submit')}}</button>
            <button type="button" class="btn btn-default cls-reload" data-dismiss="modal">{{trans('messages.listing_calendar.close')}}</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Modal End -->
  <div class="container margin-top40 mb30">
    @include('listing.sidebar')
    <form method='post' action="property-save/{{$result->id}}/pricing">
    <input type="hidden" id="dtpc_property_id" value="{{$result->id}}">
    <div class="col-md-9" >
      <div id="calender-dv">
        {!! $calendar !!}
      </div>
      <div class="row padding-top20">
        <div class="col-md-6 col-sm-6 col-xs-6 text-left"  style="margin-top: 30px">
            <a data-prevent-default="" href="{{ url('listing/'.$result->id.'/booking') }}" class="btn btn-large btn-primary">{{trans('messages.listing_description.back')}}</a>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-6 text-right"  style="margin-top: 30px">
            <a data-prevent-default="" href="{{ url('properties') }}" class="btn btn-large btn-primary">{{trans('messages.listing_calendar.your_list')}}</a>
        </div>
      </div>
    </div>
    </form>
    
  </div>
@stop