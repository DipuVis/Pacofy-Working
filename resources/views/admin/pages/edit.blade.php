@php
$form_data = [
		'page_title'=> 'Page Edit Form',
		'page_subtitle'=> 'Edit Page', 
		'form_name' => 'Page Edit Form',
		'form_id' => 'edit_page',
		'action' => URL::to('/').'/admin/edit_page/'.$result->id,
		'fields' => [
			['type' => 'text', 'class' => '', 'label' => 'Name', 'name' => 'name', 'value' => @$result->name],
      		['type' => 'text', 'class' => '', 'label' => 'Url', 'name' => 'url', 'value' => @$result->url],
      		['type' => 'editor','class' => '', 'label' => 'Content', 'name' => 'content', 'id' => 'content', 'value' => @$result->content],
			['type' => 'select', 'options' => ['first' => 'First Column', 'second' => 'Second Column'], 'class' => 'validate_field', 'label' => 'Position', 'name' => 'position', 'value' => @$result->position],
			['type' => 'select', 'options' => ['Active' => 'Active', 'Inactive' => 'Inactive'], 'class' => 'validate_field', 'label' => 'Status', 'name' => 'status', 'value' => @$result->status],
		]
	];
@endphp
@include("admin.common.form.primary", $form_data)

<script type="text/javascript">

   $(document).ready(function () {

            CKEDITOR.instances.content.on('change', function() {    
               if(CKEDITOR.instances.content.getData().length >  0) {
                   $('label[for="content"]').hide();
                }
            });

            $('#edit_page').validate({
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
                    }
                }
            });

        });
</script>