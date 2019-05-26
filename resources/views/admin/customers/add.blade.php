@php 
$form_data = [
    'page_title'=> 'Add Customer',
    'page_subtitle'=> 'Add Customer', 
    'form_name' => 'Add Customer',
    'form_id' => 'add_customer',
    'action' => URL::to('/').'/admin/add_customer',
    'fields' => [
          ['type' => 'text', 'class' => '', 'label' => 'First Name', 'name' => 'first_name', 'value' => ''],
          ['type' => 'text', 'class' => '', 'label' => 'Last Name', 'name' => 'last_name', 'value' => ''],
          ['type' => 'text', 'class' => '', 'label' => 'Email', 'name' => 'email', 'value' => ''],
          ['type' => 'password', 'class' => '', 'label' => 'Password', 'name' => 'password', 'value' => ''],
          ['type' => 'select', 'options' => ['Active' => 'Active', 'Inactive' => 'Inactive'], 'class' => 'validate_field', 'label' => 'Status', 'name' => 'status', 'value' => ''],
    ]
  ];
@endphp
@include("admin.common.form.primary", $form_data)

<script type="text/javascript">
   $(document).ready(function () {

            jQuery.validator.addMethod("laxEmail", function(value, element) {
              // allow any non-whitespace characters as the host part
              return this.optional( element ) || /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test( value );
            }, 'Please enter a valid email address.');

            $('#add_customer').validate({
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
                        laxEmail:true
                    },
                    password: {
                        required: true,
                        minlength: 6
                    }
                }
            });

        });
</script>