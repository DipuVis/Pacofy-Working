@php 
$form_data = [
    'page_title'=> 'Add Role',
    'page_subtitle'=> '', 
    'form_name' => 'Add Role Form',
    'form_id' => 'add_role',
    'action' => URL::to('/').'/admin/settings/add_role',
    'fields' => [
      ['type' => 'text', 'class' => '', 'label' => 'Name', 'name' => 'name', 'value' => old('name')],
      ['type' => 'text', 'class' => '', 'label' => 'Display Name', 'name' => 'display_name', 'value' => old('display_name')],
      ['type' => 'textarea', 'class' => '', 'label' => 'Description', 'name' => 'description', 'value' => old('description')],
      ['type' => 'checkbox', 'boxes' => $permissions, 'class' => 'validate_field', 'label' => 'Permissions', 'name' => 'permission[]'],
    ]
  ];
@endphp
@include("admin.common.form.setting", $form_data)

<script type="text/javascript">
   $(document).ready(function () {

            $('#add_role').validate({
                rules: {
                    name: {
                        required: true
                    },
                    display_name: {
                        required: true
                    },
                    description: {
                        required: true
                    }
                }
            });

        });
</script>