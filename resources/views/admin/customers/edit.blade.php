@php 
$form_data = [
    'page_title'=> 'Edit Customer',
    'page_subtitle'=> 'Edit Customer', 
    'form_name' => 'Edit Customer',
    'form_id' => 'edit_customer',
    'action' => URL::to('/').'/admin/edit_customer/'.@$result->id,
    'fields' => [
          ['type' => 'text', 'class' => '', 'label' => 'First Name', 'name' => 'first_name', 'value' => @$result->first_name],
          ['type' => 'text', 'class' => '', 'label' => 'Last Name', 'name' => 'last_name', 'value' => @$result->last_name],
          ['type' => 'text', 'class' => '', 'label' => 'Email', 'name' => 'email', 'value' => @$result->email, 'readonly' => true],
          ['type' => 'select', 'options' => ['Active' => 'Active', 'Inactive' => 'Inactive'], 'class' => 'validate_field', 'label' => 'Status', 'name' => 'status', 'value' => @$result->status],
    ]
  ];
@endphp
@include("admin.common.form.primary", $form_data)

<script type="text/javascript">
   $(document).ready(function () {

            $('#edit_customer').validate({
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
                        email:true
                    }
                }
            });

        });
</script>