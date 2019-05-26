<?php

use Illuminate\Database\Seeder;

class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('permissions')->truncate();

        DB::table('permissions')->insert([
              ['id' => '1', 'name' => 'manage_admin', 'display_name' => 'Manage Admin', 'description' => 'Manage Admin Users'],
              ['id' => '2', 'name' => 'customers', 'display_name' => 'View Customers', 'description' => 'View Customer'],
              ['id' => '3', 'name' => 'add_customer', 'display_name' => 'Add Customer', 'description' => 'Add Customer'],
              ['id' => '4', 'name' => 'edit_customer', 'display_name' => 'Edit Customer', 'description' => 'Edit Customer'],
              ['id' => '5', 'name' => 'delete_customer', 'display_name' => 'Delete Customer', 'description' => 'Delete Customer'],
              ['id' => '6', 'name' => 'properties', 'display_name' => 'View Properties', 'description' => 'View Properties'],
              ['id' => '7', 'name' => 'add_properties', 'display_name' => 'Add Properties', 'description' => 'Add Properties'],
              ['id' => '8', 'name' => 'edit_properties', 'display_name' => 'Edit Properties', 'description' => 'Edit Properties'],
              ['id' => '9', 'name' => 'delete_property', 'display_name' => 'Delete Property', 'description' => 'Delete Property'],
              ['id' => '10', 'name' => 'manage_bookings', 'display_name' => 'Manage Bookings', 'description' => 'Manage Bookings'],
              ['id' => '11', 'name' => 'manage_penalty', 'display_name' => 'Penalty', 'description' => 'Penalty'],
              ['id' => '12', 'name' => 'send_email', 'display_name' => 'Send Email', 'description' => 'Emails'],
              ['id' => '13', 'name' => 'manage_reviews', 'display_name' => 'Manage Reviews', 'description' => 'Manage Reviews'],
              ['id' => '14', 'name' => 'manage_reports', 'display_name' => 'Manage Reports', 'description' => 'Manage Reports'],
              ['id' => '15', 'name' => 'manage_amenities', 'display_name' => 'Manage Amenities', 'description' => 'Manage Amenities'],
              ['id' => '16', 'name' => 'manage_pages', 'display_name' => 'Manage Pages', 'description' => 'Manage Pages'],
              ['id' => '17', 'name' => 'database_backup', 'display_name' => 'Database Backup', 'description' => 'Database Backup'],
              ['id' => '18', 'name' => 'manage_banners', 'display_name' => 'Manage Banners', 'description' => 'Manage Banners'],
              ['id' => '19', 'name' => 'manage_currency', 'display_name' => 'Manage Currency', 'description' => 'Manage Currency'],
              ['id' => '20', 'name' => 'manage_language', 'display_name' => 'Manage Language', 'description' => 'Manage Language'],
              ['id' => '21', 'name' => 'manage_country', 'display_name' => 'Manage Country', 'description' => 'Manage Country'],
              ['id' => '22', 'name' => 'manage_fees', 'display_name' => 'Manage Fees', 'description' => 'Manage Fees'],
              ['id' => '23', 'name' => 'social_links', 'display_name' => 'Social Links', 'description' => 'Social Links'],
              ['id' => '24', 'name' => 'manage_metas', 'display_name' => 'Manage Metas', 'description' => 'Manage Metas'],
              ['id' => '25', 'name' => 'manage_starting_cities', 'display_name' => 'Manage Starting Cities', 'description' => 'Manage Starting Cities'],
              ['id' => '26', 'name' => 'manage_bed_type', 'display_name' => 'Manage Bed Type', 'description' => 'Manage Bed Type'],
              ['id' => '27', 'name' => 'general_setting', 'display_name' => 'General Setting', 'description' => 'General Setting'],
              ['id' => '28', 'name' => 'manage_amenities_type', 'display_name' => 'Manage Amenities Type', 'description' => 'Manage Amenities Type'],
              ['id' => '29', 'name' => 'space_type_setting', 'display_name' => 'Space Type Setting', 'description' => 'Space Type Setting'],
              ['id' => '30', 'name' => 'email_settings', 'display_name' => 'Email Settings', 'description' => 'Email Settings'],
              ['id' => '31', 'name' => 'starting_cities_settings', 'display_name' => 'Starting Cities Settings', 'description' => 'Starting Cities Settings'],
              ['id' => '32', 'name' => 'api_informations', 'display_name' => 'Api Credentials', 'description' => 'Api Credentials'],
              ['id' => '33', 'name' => 'payment_settings', 'display_name' => 'Payment Settings', 'description' => 'Payment Settings'],
              ['id' => '34', 'name' => 'manage_withdraw', 'display_name' => 'Manage Withdraw', 'description' => 'Manage Withdraw'],
              ['id' => '35', 'name' => 'general_settings', 'display_name' => 'General Setting', 'description' => 'General Setting'],
              ['id' => '36', 'name' => 'manage_property_type', 'display_name' => 'Manage Property Type', 'description' => 'Manage Property Type'],
              ['id' => '37', 'name' => 'manage_roles', 'display_name' => 'Manage Roles', 'description' => 'Manage Roles'],
        ]);
    }
}
