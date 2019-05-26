@extends('template')

@section('main')
  <div class="container margin-top40 mb30">
      @include('listing.sidebar')
      <form method="post" action="{{url('listing/'.$result->id.'/'.$step)}}" class='signup-form login-form' accept-charset='UTF-8'>
        <div class="col-md-9">
          <div class="row">
              <h3>{{trans('messages.listing_book.booking_title')}}</h3>
              <p class="text-muted">{{trans('messages.listing_book.booking_data')}}.</p>
          </div>
          <div class="row">
            <div class="col-md-8">
              <div class="col-md-12 min-height-div">
                <label class="label-large">{{trans('messages.listing_book.booking_type')}}</label>
                <select name="booking_type" id="select-booking_type" class="form-control">
                    <option value="request" {{ ($result->booking_type == 'request') ? 'selected' : '' }}>{{trans('messages.listing_book.review_request')}}</option>
                    <option value="instant" {{ ($result->booking_type == 'instant') ? 'selected' : '' }}>{{trans('messages.listing_book.guest_instant')}}</option>
                </select>
              </div>
            </div>
          </div>
          <div style="clear:both;"></div>
          <div class="col-md-12 row mrg-top-25 l-pad-none">
            <div class="col-md-10 col-sm-6 col-xs-6 l-pad-none text-left">
              <a data-prevent-default="" href="{{ url('listing/'.$result->id.'/pricing') }}" class="btn btn-large btn-primary">{{trans('messages.listing_description.back')}}</a>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6 text-right">
              <button type="submit" class="btn btn-large btn-primary next-section-button">
                {{trans('messages.listing_basic.next')}}
              </button>
            </div>
          </div>
        </div>
      </form>
  </div>
@stop