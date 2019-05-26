$(document).ready(function(){
	$("#dataTableBuilder").on("click", ".edit_meta", function(){
	  	var id          = this.id;
	  	var url         = APP_URL+'/admin/edit_meta';
		$.ajax({
      		type: "POST",
      		url: url,
      		data: {'id':id,method:'get_meta'},
      		dataType:'JSON',
      		async: false,
	      	success: function(msg) {
		         if(msg.status_check==1){
		            $('.edit_id').val(msg.id);
		            $('#input_url').val(msg.url);
		            $('#input_title').val(msg.title);
		            $('#input_description').val(msg.description);
		            $('#input_keywords').val(msg.keywords);
		         }
	      	},
	      	error: function(request, error) {
	        	console.log(error);
	      	}
	  	});
	});

  $(document).on('change', '#calendar_dropdown', function(){
      var year_month = $(this).val();
      year_month     = year_month.split('-');
      var year       = year_month[0];
      var month      = year_month[1];
      set_calendar(month, year);
  });

	$("#update_meta").on("click", function(){

	  var edit_id     = $('.edit_id').val();
	  var page_url    = $('#input_url').val();
	  var title       = $('#input_title').val();
	  var description = $('#input_description').val();
	  var keywords    = $('#input_keywords').val();
	  var url         = APP_URL+'/admin/edit_meta';
	  $.ajax({
	      type: "POST",
	      url: url,
	      data: {'edit_id':edit_id,'url':page_url,'title':title,'description':description,'keywords':keywords,method:'update_meta'},
	      dataType:'JSON',
	      async: false,
	      success: function(msg) {
	         if(msg.status_check==1){
	            $('.edit_id').val(msg.id);
	            $('#input_url').val(msg.url);
	            $('#input_title').val(msg.title);
	            $('#input_description').val(msg.description);
	            $('#input_keywords').val(msg.keywords);
	            $('#meta_message').css({'display':'block','text-align':'center'});
	            $('#meta_message').html(msg.message);
	         }else{
	            $('#meta_message').css({'display':'none','text-align':'center'});
	            $('.input_url').html(msg.url);
	            $('.input_title').html(msg.title);
	            $('.input_description').html(msg.description);
	            $('.input_keywords').html(msg.keywords);
	            
	         }
	      },
	      error: function(request, error) {
	          console.log(error);
	      }
	  });
	});
});


$(document.body).on('click', '.date-package-modal-admin', function(){
    var fl = $(this).hasClass('tile-previous');
    $('#model-message').html("");
    if(!fl){
        var sdate = $(this).attr('id');
        var div = sdate.split('-');
        var day = div[2];
        var month = div[1];
        var year = div[0];
        var price = $(this).attr('data-price');
        var status = $(this).attr('data-status');
        var date = day+'-'+month+'-'+year;
        $('#dtpc_start_admin').val(date);
        $('#dtpc_end_admin').val(date);
        $('#dtpc_price').val(price);
        $('#dtpc_status').val(status).change();

        $("#dtpc_start_admin").datepicker({
            format: "dd-mm-yyyy",
            onSelect: function(date) {
               
            },
        });
        $("#dtpc_end_admin").datepicker({
            format: "dd-mm-yyyy",
            onSelect: function(date) {
                
            },
        });
        $('#hotel_date_package_admin').modal();
    }
});

$(document.body).on('submit', "#dtpc_form", function(e){
  e.preventDefault();

  $('#error-dtpc-start').html('');
  $('#error-dtpc-end').html('');
  $('#error-dtpc-price').html('');
  var start_date = $('#dtpc_start_admin').val();
  var end_date = $('#dtpc_end_admin').val();
  var price = $('#dtpc_price').val();
  var status      = $('#dtpc_status').val();
  var property_id = $('#dtpc_property_id').val();
  var url = APP_URL+'/admin/ajax-calender-price/'+property_id;
  if(start_date == '') $('#error-dtpc-start').html('Start date not given.');
  if(end_date == '') $('#error-dtpc-end').html('End date not given.');
  if(price == '') $('#error-dtpc-price').html('Price not given.');
  else
  $.ajax({
      type: "POST",
      url: url,
      data: {'start_date':start_date, 'end_date':end_date, 'price':price, 'status':status},
      async: false,
      success: function(msg) {
            var year_month = $('#calendar_dropdown').val();
            year_month = year_month.split('-');
            var year = year_month[0];
            var month = year_month[1];
            set_calendar(month, year);
            $('#model-message').html("Data save successfully");
            $('#model-message').show(); 
      },
      error: function(request, error) {
          console.log(error);
      }
  });
});

function set_calendar(month, year){
  var property_id = $('#dtpc_property_id').val();
  var dataURL = APP_URL+'/admin/ajax-calender/'+property_id;
  var calendar = '';
  $.ajax({
    url: dataURL,
    data: {'month': month, 'year': year},
    type: 'post',
    async: false,
    dataType: 'json',
    success: function (result) {
      //if(result.success == 1)
      $('#calender-dv').html(result.calendar);
    },
    error: function (request, error) {
      console.log('error');
    }
  });
}

$(document).on('click', '.month-nav-next', function(e){
  e.preventDefault();
  var year = $(this).attr('data-year');
  var month = $(this).attr('data-month');
  set_calendar(month, year);
});

$(document).on('click', '.month-nav-previous', function(e){
  e.preventDefault();
  var year = $(this).attr('data-year');
  var month = $(this).attr('data-month');
  set_calendar(month, year);
});


