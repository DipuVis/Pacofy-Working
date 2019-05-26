@php 
$form_data = [
		'page_title'=> 'Page Add Form',
		'page_subtitle'=> 'Add Page', 
		'form_name' => 'Page Add Form',
		'form_id' => 'add_page',
		'action' => URL::to('/').'/admin/add_page',
		'fields' => [
			    ['type' => 'text', 'class' => '', 'label' => 'Name', 'name' => 'name', 'value' => ''],
      		['type' => 'text', 'class' => '', 'label' => 'Url', 'name' => 'url', 'value' => ''],
      		['type' => 'editor', 'class' => '', 'label' => 'Content', 'name' => 'content', 'id' => 'content', 'value' => ''],
      		['type' => 'select', 'options' => ['first' => 'First Column', 'second' => 'Second Column'], 'class' => 'validate_field', 'label' => 'Position', 'name' => 'position', 'value' => ''],
			    ['type' => 'select', 'options' => ['Active' => 'Active', 'Inactive' => 'Inactive'], 'class' => 'validate_field', 'label' => 'Status', 'name' => 'status', 'value' => ''],
		]
	];
@endphp
@include("admin.common.form.primary", $form_data)

<!-- Include CKEditor and jQuery adapter -->
<script src="//cdn.ckeditor.com/4.4.3/basic/ckeditor.js"></script>
<script src="//cdn.ckeditor.com/4.4.3/basic/adapters/jquery.js"></script>

<script type="text/javascript">

   $(document).ready(function () {

        CKEDITOR.instances.content.on('change', function() {    
           if(CKEDITOR.instances.content.getData().length >  0) {
              $('label[for="content"]').hide();
           }
        });
 

        $('#add_page').validate({
            ignore: [],
            rules: {
                name: {
                    required: true
                },
                url: {
                    required: true
                },
                content: {
                  
                  required: function(textarea) {
                    CKEDITOR.instances[textarea.id].updateElement(); // update textarea
                    var editorcontent = textarea.value.replace(/<[^>]*>/gi, ''); // strip tags
                    return editorcontent.length === 0;
                  }
                  
                  /*
                  required: function(){
                     CKEDITOR.instances.content.updateElement();
                  },
                  minlength:10
                  */
                }
            }/*,
            messages: {
                content:{
                    required:"Please enter Text",
                    minlength:"Please enter 10 characters"
                }
            }
            */
        });

   });
</script>