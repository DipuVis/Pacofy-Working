<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">

        <li class="{{ (Route::current()->uri() == 'admin/dashboard') ? 'active' : ''  }}"><a href="{{ url('admin/dashboard') }}"><i class="fa fa-dashboard"></i><span>Dashboard</span></a></li>
        
        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'customers'))
          <li class="{{ (Route::current()->uri() == 'admin/customers') || (Route::current()->uri() == 'admin/add_customer') || (Route::current()->uri() == 'admin/edit_customer/{id}') ? 'active' : ''  }}"><a href="{{ url('admin/customers') }}"><i class="fa fa-users"></i><span>Customers</span></a></li>
        @endif

        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'properties'))
          <li class="{{ (Route::current()->uri() == 'admin/properties') || (Route::current()->uri() == 'admin/add_properties') || (Route::current()->uri() == 'admin/listing/{id}/{step}') ? 'active' : ''  }}"><a href="{{ url('admin/properties') }}"><i class="fa fa-home"></i><span>Properties</span></a></li>
        @endif

        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_bookings'))
          <li class="{{ (Route::current()->uri() == 'admin/bookings') || (Route::current()->uri() == 'admin/bookings/detail/{id}') ? 'active' : ''  }}"><a href="{{ url('admin/bookings') }}"><i class="fa fa-home"></i><span>Bookings</span></a></li>
        @endif
        
        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_penalty'))
          <li class="treeview {{ (Route::current()->uri() == 'admin/guest_penalty' || Route::current()->uri() == 'admin/host_penalty') ? 'active' : ''  }}">
            <a href="#">
              <i class="fa fa-plane"></i> <span>Penalty</span><i class="fa fa-angle-left pull-right"></i>
            </a>
            <ul class="treeview-menu">
              <li class="{{ (Route::current()->uri() == 'admin/guest_penalty') ? 'active' : ''  }}"><a href="{{ url('admin/guest_penalty') }}"><span>Guest Penalty</span></a></li>
              <li class="{{ (Route::current()->uri() == 'admin/host_penalty') ? 'active' : ''  }}"><a href="{{ url('admin/host_penalty') }}"><span>Host Penalty</span></a></li>
            </ul>
          </li>
        @endif

  
        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_amenities'))
          <li class="{{ (Route::current()->uri() == 'admin/amenities') || (Route::current()->uri() == 'admin/add_amenities') || (Route::current()->uri() == 'admin/edit_amenities/{id}') ? 'active' : ''  }}"><a href="{{ url('admin/amenities') }}"><i class="fa fa-bullseye"></i><span>Amenities</span></a></li>
        @endif
       
        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_pages'))
          <li class="{{ (Route::current()->uri() == 'admin/pages') || (Route::current()->uri() == 'admin/add_page') || (Route::current()->uri() == 'admin/edit_page/{id}') ? 'active' : ''  }}"><a href="{{ url('admin/pages') }}"><i class="fa fa-newspaper-o"></i><span>Static Pages</span></a></li>
        @endif
        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_reviews'))
          <li class="{{ (Route::current()->uri() == 'admin/reviews') || (Route::current()->uri() == 'admin/edit_review/{id}') ? 'active' : ''  }}"><a href="{{ url('admin/reviews') }}"><i class="fa fa-eye"></i><span>Manage Reviews</span></a></li>
        @endif
        @if(Helpers::has_permission(Auth::guard('admin')->user()->id, 'manage_admin'))
          <li class="{{ (Route::current()->uri() == 'admin/admin_users') || (Route::current()->uri() == 'admin/add_admin') || (Route::current()->uri() == 'admin/edit_admin/{id}') ? 'active' : ''  }}">
            <a href="{{ url('admin/admin_users') }}">
              <i class="fa fa-user-plus"></i> <span>Users</span>
            </a>
          </li>
        @endif

        <li class="{{ (Request::segment(2) == 'settings') ? 'active' : ''  }}"><a href="{{ url('admin/settings') }}"><i class="fa fa-gears"></i><span>Settings</span></a></li>

        <!-- <li class="{{ (Route::current()->uri() == 'admin/settings') ? 'active' : ''  }}"><a href="{{ url('admin/settings') }}"><i class="fa fa-gears"></i><span>Settings</span></a></li> -->


      </ul>
    </section>
    <!-- /.sidebar -->
</aside>