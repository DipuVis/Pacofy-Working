@php 
$form_data = [
    'page_title'=> 'Edit Role',
    'page_subtitle'=> '', 
    'form_name' => 'Edit Role Form',
    'form_id' => 'edit_role',
    'action' => URL::to('/').'/admin/settings/edit_role/'.$result->id,
    'fields' => [
      ['type' => 'text', 'class' => '', 'label' => 'Name', 'name' => 'name', 'value' => $result->name],
      ['type' => 'text', 'class' => '', 'label' => 'Display Name', 'name' => 'display_name', 'value' => $result->display_name],
      ['type' => 'textarea', 'class' => '', 'label' => 'Description', 'name' => 'description', 'value' => $result->description],
      ['type' => 'checkbox', 'boxes' => $permissions, 'class' => 'validate_field', 'label' => 'Permissions', 'name' => 'permission[]', 'value' => $stored_permissions ],
    ]
  ];
@endphp
@include("admin.common.form.setting", $form_data)

<script type="text/javascript">
   $(document).ready(function () {

            $('#edit_role').validate({
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