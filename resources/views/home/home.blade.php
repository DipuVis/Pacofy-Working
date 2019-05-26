@extends('template')

@section('main')
  
    <div id="mega-slider" class="carousel slide" data-ride="carousel">
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        @php $i = 0 @endphp
          @foreach($banners as $banner)
          <div class="item {{$i==0?'active':''}}">
            <img src="{{ url('public/front/images/banners/'.$banner->image) }}" alt="...">
            <div class="carousel-caption">
              <h2>{{$banner->heading}}</h2>
              <p>{{$banner->subheading}}</p>
            </div>
          </div>
          @php $i = 1 @endphp
        @endforeach
        
      </div>

      <!-- Controls -->
      <a class="left carousel-control" href="#mega-slider" role="button" data-slide="prev">
      </a>
      <a class="right carousel-control" href="#mega-slider" role="button" data-slide="next">
      </a>
    </div>
    <div class="mg-bn-forms-up">
      <div class="mg-book-now2 mg-book-now">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="mg-bn-forms">
                <form id="front-search-form" method="post" action="{{url('search')}}">
                  <div class="row">
                    <div class="col-sm-6 col-md-4 col-xs-12 input-mb">
                      <div class="input-group date mg-check-in col-xs-12">
                        <input class="form-control" id="front-search-field" placeholder="{{trans('messages.home.where_want_to_go')}}" autocomplete="off" name="location" type="text" required>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-2 col-xs-12 input-mb">
                      <div class="input-group date mg-check-in">
                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                        <input class="form-control" name="checkin" id="front-search-checkin" placeholder="{{trans('messages.search.check_in')}}" autocomplete="off" type="text" readonly="readonly" required>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-2 col-xs-12 input-mb">
                      <div class="input-group date mg-check-out">
                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                        <input class="form-control" name="checkout" id="front-search-checkout" placeholder="{{trans('messages.search.check_out')}}" type="text" readonly="readonly" required>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-2 col-xs-12">
                      <div class="input-group date mg-check-out col-xs-12">
                        <select id="front-search-guests" class="form-control black-select">
                          <option value="1">1 {{trans('messages.home.guest')}}</option>
                          @for($i=2;$i<=16;$i++)
                            <option value="{{ $i }}"> {{ ($i == '16') ? $i.'+ '.'Guests' : $i.' '.'Guests' }} </option>
                          @endfor
                        </select>
                      </div>
                    </div>
                    <div class="col-md-2 col-xs-12 front-search">
                      <button type="submit" class="btn btn-main btn-block">{{trans('messages.home.search')}}</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
         </div>
      </div>
    </div>
    <div class="container">
      <div class="row margin-top40" >
        @for($i=0;$i<= $city_count-1;$i++)
        <div class="col-md-4" style="margin-bottom:15px;">
          <div class="ex-image-container" style="background-image:url({{ @$starting_cities[$i]->image_url }});">
            <a href="{{URL::to('/')}}/search?location={{$starting_cities[$i]->name}}&source=ds">
              <div class="ex-container">
                <div class="ex-center-content">
                    <div class="h2">
                      <strong>
                       {{$starting_cities[$i]->name}}
                      </strong>
                    </div>
                </div>
              </div>
            </a>
          </div>
        </div>
        @endfor
      </div>
    </div>
@stop