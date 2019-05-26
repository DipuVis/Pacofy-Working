<div class="box box-info box_info">
    <div class="panel-body">
    <h4 class="all_settings">Manage Settings</h4>
        <ul class="nav navbar-pills nav-tabs nav-stacked no-margin" role="tablist">

          @if(Permission::has_permission(Auth::guard('admin')->user()->id, 'manage_banners'))
            <li class="{{ (Route::current()->uri() == 'admin/settings') ? 'active' : ''  }}">
                <a href="{{ url('admin/settings') }}" data-group="profile">General</a>
            </li>
          @endif

          @if(Permission::has_permission(Auth::guard('admin')->user()->id, 'manage_banners'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/banners') ? 'active' : ''  }}">
                <a href="{{ url('admin/settings/banners') }}" data-group="profile">Banners</a>
            </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'starting_cities_settings'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/starting_cities') || (Route::current()->uri() == 'admin/settings/add_starting_cities') || (Route::current()->uri() == 'admin/settings/edit_starting_cities/{id}') ? 'active' : ''  }}">
                <a href="{{ url('admin/settings/starting_cities') }}" data-group="home_cities">Starting Cities</a>
            </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_property_type'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/property_type' || Route::current()->uri() == 'admin/settings/add_property_type' || Route::current()->uri() == 'admin/settings/edit_property_type/{id}') ? 'active' : ''  }}">
                <a href="{{ url('admin/settings/property_type') }}" data-group="property_type">Property Type</a>
            </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'space_type_setting'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/space_type' || Route::current()->uri() == 'admin/settings/add_space_type' || Route::current()->uri() == 'admin/settings/edit_space_type/{id}') ? 'active' : ''  }}">
              <a href="{{ url('admin/settings/space_type') }}" data-group="space_type">Space Type</a>
            </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_bed_type'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/bed_type' || Route::current()->uri() == 'admin/settings/add_bed_type'|| Route::current()->uri() == 'admin/settings/edit_bed_type/{id}') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/bed_type') }}" data-group="bed_type">Bed Type</a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_currency'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/currency' || Route::current()->uri() == 'admin/settings/add_currency' || Route::current()->uri() == 'admin/settings/edit_currency/{id}') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/currency') }}" data-group="currency">Currency</a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_country'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/country' || Route::current()->uri() == 'admin/settings/add_country' || Route::current()->uri() == 'admin/settings/edit_country/{id}') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/country') }}">Country</a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_amenities_type'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/amenities_type' || Route::current()->uri() == 'admin/settings/add_amenities_type' || Route::current()->uri() == 'admin/settings/edit_amenities_type/{id}') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/amenities_type') }}">Amenities Type</a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'email_settings'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/email') ? 'active' : ''  }}">
              <a href="{{ url('admin/settings/email') }}">Email Settings</a>
            </li>
          @endif

           @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'general_settings'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/fees') ? 'active' : ''  }}">
              <a href="{{ url('admin/settings/fees') }}">Fees</a>
            </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_language'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/language' || Route::current()->uri() == 'admin/settings/add_language' || Route::current()->uri() == 'admin/settings/edit_language/{id}') ? 'active' : ''  }}">
              <a href="{{ url('admin/settings/language') }}" data-group="language">Language</a>
            </li>
          @endif

          @if(Permission::has_permission(Auth::guard('admin')->user()->id, 'role_settings'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/roles') ? 'active' : ''  }}">
              <a href="{{ url('admin/settings/roles') }}" data-group="profile">Roles & Permissions</a>
            </li>
          @endif

          @if(Permission::has_permission(Auth::guard('admin')->user()->id, 'backup_settings'))
            <li class="{{ (Route::current()->uri() == 'admin/settings/backup') ? 'active' : ''  }}">
              <a href="{{ url('admin/settings/backup') }}" data-group="profile">Database Beckups</a>
            </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_metas'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/metas' || Route::current()->uri() == 'admin/settings/edit_meta/{id}') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/metas') }}" data-group="metas">Metas</a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'api_informations'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/api_informations') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/api_informations') }}" data-group="api_informations">Api Credentials</a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'payment_settings'))

              <li class="{{ (Route::current()->uri() == 'admin/settings/payment_methods') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/payment_methods') }}" data-group="payment_methods">Payment Methods</a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'social_links'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/social_links') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/social_links') }}" data-group="social_links">Social Links</a>
              </li>
          @endif
          
          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_admin'))
              <li class="{{ (Route::current()->uri() == 'admin/settings/roles' || Route::current()->uri() == 'admin/permissions' || Route::current()->uri() == 'admin/settings/add_role' || Route::current()->uri() == 'admin/settings/edit_role/{id}') ? 'active' : ''  }}">
                  <a href="{{ url('admin/settings/roles') }}"><span>Roles & Permissions</span></a>
              </li>
          @endif

          @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'database_backup'))
            <li class="{{ (Route::current()->uri() == 'admin/backup') ? 'active' : ''  }}">
              <a href="{{ url('admin/settings/backup') }}"><span>Database Backup</span></a>
            </li>
          @endif

        </ul>
    </div>
</div>