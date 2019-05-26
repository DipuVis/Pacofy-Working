

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `account` text COLLATE utf8_unicode_ci NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `selected` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("1","5","Dhaka, Bangladesh","Dhaka, Bangladesh","Dhaka","Bangladesh","1234","BD","EUR","borna.techvill@gmail.com","1","Yes","2018-03-01 06:50:27","2018-03-01 06:50:27");
INSERT INTO accounts VALUES("2","8","123","123","Dhaka","","123","AF","EUR","borna.techvill@gmail.com","1","Yes","2018-03-31 11:41:28","2018-03-31 11:41:28");
INSERT INTO accounts VALUES("3","4","164/1","","Dhaka","Bangladesh","1203","BD","EUR","borna.techvill@gmail.com","1","Yes","2018-04-01 06:25:24","2018-04-01 06:25:24");





CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_username_unique` (`username`),
  UNIQUE KEY `admin_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO admin VALUES("1","admin","admin@techvill.net","$2y$10$iqWncX1VDtz5MsnK9r4KFeI2tYNkOMlOxL0IUu24L/QkHI26rI2EG","","Active","S8MtaMp0bLPu5tC7wDxIdSZjaFvyvqhxedmmj9CFD7juUXrkGDymOuv5ZTDF","2018-08-30 07:40:45","");





CREATE TABLE IF NOT EXISTS `amenities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO amenities VALUES("1","Essentials","Towels, bed sheets, soap and toilet paper","essentials","1","Active");
INSERT INTO amenities VALUES("2","TV","","tv","1","Active");
INSERT INTO amenities VALUES("3","Cable TV","","desktop","1","Active");
INSERT INTO amenities VALUES("4","Air Conditioning ","","air-conditioning","1","Active");
INSERT INTO amenities VALUES("5","Heating","Heating","heating","1","Active");
INSERT INTO amenities VALUES("6","Kitchen","Kitchen","meal","1","Active");
INSERT INTO amenities VALUES("7","Internet","Internet","internet","1","Active");
INSERT INTO amenities VALUES("8","Gym","Gym","gym","1","Active");
INSERT INTO amenities VALUES("9","Elevator in Building","","elevator","1","Active");
INSERT INTO amenities VALUES("10","Indoor Fireplace","","fireplace","1","Active");
INSERT INTO amenities VALUES("11","Buzzer/Wireless Intercom","","intercom","1","Active");
INSERT INTO amenities VALUES("12","Doorman","","doorman","1","Active");
INSERT INTO amenities VALUES("13","Shampoo","","smoking","1","Active");
INSERT INTO amenities VALUES("14","Wireless Internet","Wireless Internet","wifi","1","Active");
INSERT INTO amenities VALUES("15","Hot Tub","","hot-tub","1","Active");
INSERT INTO amenities VALUES("16","Washer","Washer","washer","1","Active");
INSERT INTO amenities VALUES("17","Pool","Pool","pool","1","Active");
INSERT INTO amenities VALUES("18","Dryer","Dryer","dryer","1","Active");
INSERT INTO amenities VALUES("19","Breakfast","Breakfast","cup","1","Active");
INSERT INTO amenities VALUES("20","Free Parking on Premises","","parking","1","Active");
INSERT INTO amenities VALUES("21","Family/Kid Friendly","Family/Kid Friendly","family","1","Active");
INSERT INTO amenities VALUES("22","Smoking Allowed","","smoking","1","Active");
INSERT INTO amenities VALUES("23","Suitable for Events","Suitable for Events","balloons","1","Active");
INSERT INTO amenities VALUES("24","Pets Allowed","","paw","1","Active");
INSERT INTO amenities VALUES("25","Pets live on this property","","ok","1","Active");
INSERT INTO amenities VALUES("26","Wheelchair Accessible","Wheelchair Accessible","accessible","1","Active");
INSERT INTO amenities VALUES("27","Smoke Detector","Smoke Detector","ok","2","Active");
INSERT INTO amenities VALUES("28","Carbon Monoxide Detector","Carbon Monoxide Detector","ok","2","Active");
INSERT INTO amenities VALUES("29","First Aid Kit","","ok","2","Active");
INSERT INTO amenities VALUES("30","Safety Card","Safety Card","ok","2","Active");
INSERT INTO amenities VALUES("31","Fire Extinguisher","Essentials","ok","2","Active");





CREATE TABLE IF NOT EXISTS `amenity_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO amenity_type VALUES("1","Common Amenities","");
INSERT INTO amenity_type VALUES("2","Safety Amenities","");





CREATE TABLE IF NOT EXISTS `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO backups VALUES("1","2018-02-13-072145.sql","2018-02-13 07:21:45","");
INSERT INTO backups VALUES("2","2018-04-02-101828.sql","2018-04-02 10:18:28","");





CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subheading` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO banners VALUES("1","Welcome to Hotel","Lorem ipsum dolor sit amet, consectetur adipiscing elit","banner_1.png","Active");
INSERT INTO banners VALUES("2","Feel Like Your Home","Lorem ipsum dolor sit amet, consectetur adipiscing elit","banner_2.jpg","Active");
INSERT INTO banners VALUES("3","Perfect Place for Dining","Lorem ipsum dolor sit amet, consectetur adipiscing elit","banner_3.jpg","Active");





CREATE TABLE IF NOT EXISTS `bed_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO bed_type VALUES("1","king");
INSERT INTO bed_type VALUES("2","Queen");
INSERT INTO bed_type VALUES("3","Double");
INSERT INTO bed_type VALUES("4","Single");
INSERT INTO bed_type VALUES("5","Sofa bed");
INSERT INTO bed_type VALUES("6","Sofa");
INSERT INTO bed_type VALUES("7","Sofa bed");
INSERT INTO bed_type VALUES("8","Bunk bed");
INSERT INTO bed_type VALUES("9","Air mattress");
INSERT INTO bed_type VALUES("10","Floor mattress");
INSERT INTO bed_type VALUES("11","Toddler bed");
INSERT INTO bed_type VALUES("12","Crib");
INSERT INTO bed_type VALUES("13","Water bed");
INSERT INTO bed_type VALUES("14","Hammock");





CREATE TABLE IF NOT EXISTS `booking_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `field` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO booking_details VALUES("1","1","country","AF");
INSERT INTO booking_details VALUES("2","2","country","AF");
INSERT INTO booking_details VALUES("3","3","country","BD");
INSERT INTO booking_details VALUES("4","4","country","BD");
INSERT INTO booking_details VALUES("5","5","country","AF");
INSERT INTO booking_details VALUES("6","6","country","BD");
INSERT INTO booking_details VALUES("7","7","country","BD");
INSERT INTO booking_details VALUES("8","8","country","BD");
INSERT INTO booking_details VALUES("9","9","country","BD");
INSERT INTO booking_details VALUES("10","10","country","BD");
INSERT INTO booking_details VALUES("11","11","country","BD");
INSERT INTO booking_details VALUES("12","12","country","AF");
INSERT INTO booking_details VALUES("13","13","country","AF");
INSERT INTO booking_details VALUES("14","13","cancelled_reason","travel_dates_changed");
INSERT INTO booking_details VALUES("15","14","country","AF");
INSERT INTO booking_details VALUES("16","15","country","DZ");
INSERT INTO booking_details VALUES("17","16","country","AF");
INSERT INTO booking_details VALUES("18","17","country","AF");
INSERT INTO booking_details VALUES("19","17","cancelled_reason","travel_dates_changed");
INSERT INTO booking_details VALUES("20","18","country","AF");
INSERT INTO booking_details VALUES("21","19","country","BD");





CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('Accepted','Pending','Cancelled','Declined','Expired') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `guest` int(11) NOT NULL DEFAULT '0',
  `total_night` int(11) NOT NULL DEFAULT '0',
  `per_night` double NOT NULL DEFAULT '0',
  `base_price` double NOT NULL DEFAULT '0',
  `cleaning_charge` double NOT NULL DEFAULT '0',
  `guest_charge` double NOT NULL DEFAULT '0',
  `service_charge` double NOT NULL DEFAULT '0',
  `security_money` double NOT NULL DEFAULT '0',
  `host_fee` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `booking_type` enum('request','instant') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'request',
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `cancellation` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method_id` int(11) NOT NULL DEFAULT '0',
  `accepted_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `declined_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` enum('Host','Guest') COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO bookings VALUES("1","6","bj5Zy3","4","2","2018-02-13","2018-02-14","Accepted","1","1","10","11","0","0","1","0","0","11","instant","USD","Flexible","9DU46205614312029","1","","","","","","2018-02-13 09:46:11","2018-02-13 09:46:11");
INSERT INTO bookings VALUES("2","1","RiqQL8","1","2","2018-02-14","2018-02-15","Accepted","1","1","5","5","0","0","0","0","0","5","instant","USD","Flexible","ch_1BvOdTDpvvQP5tMRWHQnb5H5","2","","","","","","2018-02-14 11:41:10","2018-02-14 11:41:10");
INSERT INTO bookings VALUES("3","9","YG1ift","5","8","2018-03-06","2018-03-07","Accepted","1","1","22","42","19","0","1","0","0","42","instant","USD","Flexible","ch_1C2ZMJDpvvQP5tMRa5LWfKLS","2","","","","","","2018-03-06 06:33:11","2018-03-06 06:33:11");
INSERT INTO bookings VALUES("4","11","PEu6Pj","7","8","2018-03-06","2018-03-07","Accepted","1","1","19","20","0","0","1","0","0","20","instant","USD","Flexible","8TB12918A3605925E","1","","","","","","2018-03-06 06:46:48","2018-03-06 06:46:48");
INSERT INTO bookings VALUES("5","11","9DyPiZ","7","5","2018-03-11","2018-03-12","Accepted","1","1","5","5","0","0","0","0","0","5","instant","USD","Flexible","42W09214AF320744Y","1","","","","","","2018-03-11 12:41:07","2018-03-11 12:41:07");
INSERT INTO bookings VALUES("6","12","E1Tdcu","2","3","2018-03-23","2018-03-24","Accepted","1","1","39","41","0","0","2","0","0","41","instant","BRL","Flexible","0AR74583NF743344N","1","","","","","","2018-03-23 05:46:15","2018-03-23 05:46:15");
INSERT INTO bookings VALUES("7","12","LUu9Q2","2","3","2018-03-24","2018-03-27","Accepted","1","3","39","123","0","0","6","0","0","123","instant","BRL","Flexible","2C3829407D3679344","1","","","","","","2018-03-23 06:15:26","2018-03-23 06:15:26");
INSERT INTO bookings VALUES("8","13","V7xpqJ","2","3","2018-03-23","2018-03-27","Accepted","1","4","5","31","5","0","1","5","0","31","instant","USD","Flexible","ch_1C8jVcDpvvQP5tMRpiIAod2w","2","","","","","","2018-03-23 06:35:58","2018-03-23 06:35:58");
INSERT INTO bookings VALUES("9","13","hlWCi6","2","3","2018-03-28","2018-03-30","Accepted","1","2","5","21","5","0","1","5","0","21","instant","USD","Flexible","ch_1C8jXvDpvvQP5tMRA67guT5k","2","","","","","","2018-03-23 06:38:21","2018-03-23 06:38:21");
INSERT INTO bookings VALUES("10","13","c6Bh2j","2","3","2018-03-27","2018-03-28","Accepted","1","1","7","21","7","0","0","7","0","21","instant","AUD","Flexible","8EH72711BY962783F","1","","","","","","2018-03-23 08:05:25","2018-03-23 08:05:25");
INSERT INTO bookings VALUES("11","14","mL3AFm","2","3","2018-03-24","2018-03-28","Accepted","1","4","1","4","0","0","0","0","0","4","instant","USD","Flexible","0M995379FK8707205","1","","","","","","2018-03-23 09:42:38","2018-03-23 09:42:38");
INSERT INTO bookings VALUES("12","13","sCPN0t","2","3","2018-04-01","2018-04-03","Accepted","1","2","20","82","20","0","2","20","0","82","instant","BRL","Flexible","ch_1CBej6DpvvQP5tMRxGwAkp0g","2","","","","","","2018-03-31 08:06:17","2018-03-31 08:06:18");
INSERT INTO bookings VALUES("13","15","dEY1JE","2","3","2018-04-01","2018-04-02","Cancelled","2","1","20","51","10","10","1","10","0","51","instant","BRL","Flexible","5L305125XM8528934","1","","","","2018-03-31 09:46:51","Guest","2018-03-31 09:37:52","2018-03-31 09:46:51");
INSERT INTO bookings VALUES("14","15","wVb2mF","2","8","2018-03-31","2018-04-03","Accepted","2","3","5","22","2","2","1","2","0","22","instant","EUR","Flexible","ch_1CBhU3DpvvQP5tMRfeTBMZg4","2","","","","","","2018-03-31 11:02:56","2018-03-31 11:02:56");
INSERT INTO bookings VALUES("15","16","b3XuPl","4","8","2018-04-08","2018-04-10","Accepted","1","2","5","16","3","0","1","2","0","16","instant","EUR","Flexible","03N93137J41176239","1","","","","","","2018-03-31 11:11:05","2018-03-31 11:11:05");
INSERT INTO bookings VALUES("16","16","WJj9lM","4","8","2018-04-10","2018-04-12","Accepted","1","2","5","16","3","0","1","2","0","16","instant","EUR","Flexible","ch_1CBhq1DpvvQP5tMR3CGHW8iw","2","","","","","","2018-03-31 11:25:37","2018-03-31 11:25:37");
INSERT INTO bookings VALUES("17","16","db4HuA","4","8","2018-04-13","2018-04-15","Cancelled","1","2","5","16","3","0","1","2","0","16","instant","EUR","Flexible","ch_1CBhtqDpvvQP5tMRGjFj1Zue","2","","","","2018-03-31 11:36:47","Guest","2018-03-31 11:29:34","2018-03-31 11:36:47");
INSERT INTO bookings VALUES("18","14","WSvYs1","2","6","2018-03-29","2018-03-30","Accepted","1","1","2","2","0","0","0","0","0","2","instant","SGD","Flexible","ch_1CBiR1DpvvQP5tMRIs6hZPlu","2","","","","","","2018-03-31 12:03:51","2018-03-31 12:03:51");
INSERT INTO bookings VALUES("19","18","0weOeN","6","9","2018-03-29","2018-03-30","Accepted","1","1","10","11","0","0","1","0","0","11","instant","SGD","Flexible","ch_1CC0HnDpvvQP5tMRxr6IYIta","2","","","","","","2018-04-01 07:07:30","2018-04-01 07:07:30");





CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `iso3` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_short_name_unique` (`short_name`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO country VALUES("1","AF","Afghanistan","AFG","4","93");
INSERT INTO country VALUES("2","AL","Albania","ALB","8","355");
INSERT INTO country VALUES("3","DZ","Algeria","DZA","12","213");
INSERT INTO country VALUES("4","AS","American Samoa","ASM","16","1684");
INSERT INTO country VALUES("5","AD","Andorra","AND","20","376");
INSERT INTO country VALUES("6","AO","Angola","AGO","24","244");
INSERT INTO country VALUES("7","AI","Anguilla","AIA","660","1264");
INSERT INTO country VALUES("8","AQ","Antarctica","","","0");
INSERT INTO country VALUES("9","AG","Antigua and Barbuda","ATG","28","1268");
INSERT INTO country VALUES("10","AR","Argentina","ARG","32","54");
INSERT INTO country VALUES("11","AM","Armenia","ARM","51","374");
INSERT INTO country VALUES("12","AW","Aruba","ABW","533","297");
INSERT INTO country VALUES("13","AU","Australia","AUS","36","61");
INSERT INTO country VALUES("14","AT","Austria","AUT","40","43");
INSERT INTO country VALUES("15","AZ","Azerbaijan","AZE","31","994");
INSERT INTO country VALUES("16","BS","Bahamas","BHS","44","1242");
INSERT INTO country VALUES("17","BH","Bahrain","BHR","48","973");
INSERT INTO country VALUES("18","BD","Bangladesh","BGD","50","880");
INSERT INTO country VALUES("19","BB","Barbados","BRB","52","1246");
INSERT INTO country VALUES("20","BY","Belarus","BLR","112","375");
INSERT INTO country VALUES("21","BE","Belgium","BEL","56","32");
INSERT INTO country VALUES("22","BZ","Belize","BLZ","84","501");
INSERT INTO country VALUES("23","BJ","Benin","BEN","204","229");
INSERT INTO country VALUES("24","BM","Bermuda","BMU","60","1441");
INSERT INTO country VALUES("25","BT","Bhutan","BTN","64","975");
INSERT INTO country VALUES("26","BO","Bolivia","BOL","68","591");
INSERT INTO country VALUES("27","BA","Bosnia and Herzegovina","BIH","70","387");
INSERT INTO country VALUES("28","BW","Botswana","BWA","72","267");
INSERT INTO country VALUES("29","BV","Bouvet Island","","","0");
INSERT INTO country VALUES("30","BR","Brazil","BRA","76","55");
INSERT INTO country VALUES("31","IO","British Indian Ocean Territory","","","246");
INSERT INTO country VALUES("32","BN","Brunei Darussalam","BRN","96","673");
INSERT INTO country VALUES("33","BG","Bulgaria","BGR","100","359");
INSERT INTO country VALUES("34","BF","Burkina Faso","BFA","854","226");
INSERT INTO country VALUES("35","BI","Burundi","BDI","108","257");
INSERT INTO country VALUES("36","KH","Cambodia","KHM","116","855");
INSERT INTO country VALUES("37","CM","Cameroon","CMR","120","237");
INSERT INTO country VALUES("38","CA","Canada","CAN","124","1");
INSERT INTO country VALUES("39","CV","Cape Verde","CPV","132","238");
INSERT INTO country VALUES("40","KY","Cayman Islands","CYM","136","1345");
INSERT INTO country VALUES("41","CF","Central African Republic","CAF","140","236");
INSERT INTO country VALUES("42","TD","Chad","TCD","148","235");
INSERT INTO country VALUES("43","CL","Chile","CHL","152","56");
INSERT INTO country VALUES("44","CN","China","CHN","156","86");
INSERT INTO country VALUES("45","CX","Christmas Island","","","61");
INSERT INTO country VALUES("46","CC","Cocos (Keeling) Islands","","","672");
INSERT INTO country VALUES("47","CO","Colombia","COL","170","57");
INSERT INTO country VALUES("48","KM","Comoros","COM","174","269");
INSERT INTO country VALUES("49","CG","Congo","COG","178","242");
INSERT INTO country VALUES("50","CD","Congo, the Democratic Republic of the","COD","180","242");
INSERT INTO country VALUES("51","CK","Cook Islands","COK","184","682");
INSERT INTO country VALUES("52","CR","Costa Rica","CRI","188","506");
INSERT INTO country VALUES("53","CI","Cote D\'Ivoire","CIV","384","225");
INSERT INTO country VALUES("54","HR","Croatia","HRV","191","385");
INSERT INTO country VALUES("55","CU","Cuba","CUB","192","53");
INSERT INTO country VALUES("56","CY","Cyprus","CYP","196","357");
INSERT INTO country VALUES("57","CZ","Czech Republic","CZE","203","420");
INSERT INTO country VALUES("58","DK","Denmark","DNK","208","45");
INSERT INTO country VALUES("59","DJ","Djibouti","DJI","262","253");
INSERT INTO country VALUES("60","DM","Dominica","DMA","212","1767");
INSERT INTO country VALUES("61","DO","Dominican Republic","DOM","214","1809");
INSERT INTO country VALUES("62","EC","Ecuador","ECU","218","593");
INSERT INTO country VALUES("63","EG","Egypt","EGY","818","20");
INSERT INTO country VALUES("64","SV","El Salvador","SLV","222","503");
INSERT INTO country VALUES("65","GQ","Equatorial Guinea","GNQ","226","240");
INSERT INTO country VALUES("66","ER","Eritrea","ERI","232","291");
INSERT INTO country VALUES("67","EE","Estonia","EST","233","372");
INSERT INTO country VALUES("68","ET","Ethiopia","ETH","231","251");
INSERT INTO country VALUES("69","FK","Falkland Islands (Malvinas)","FLK","238","500");
INSERT INTO country VALUES("70","FO","Faroe Islands","FRO","234","298");
INSERT INTO country VALUES("71","FJ","Fiji","FJI","242","679");
INSERT INTO country VALUES("72","FI","Finland","FIN","246","358");
INSERT INTO country VALUES("73","FR","France","FRA","250","33");
INSERT INTO country VALUES("74","GF","French Guiana","GUF","254","594");
INSERT INTO country VALUES("75","PF","French Polynesia","PYF","258","689");
INSERT INTO country VALUES("76","TF","French Southern Territories","","","0");
INSERT INTO country VALUES("77","GA","Gabon","GAB","266","241");
INSERT INTO country VALUES("78","GM","Gambia","GMB","270","220");
INSERT INTO country VALUES("79","GE","Georgia","GEO","268","995");
INSERT INTO country VALUES("80","DE","Germany","DEU","276","49");
INSERT INTO country VALUES("81","GH","Ghana","GHA","288","233");
INSERT INTO country VALUES("82","GI","Gibraltar","GIB","292","350");
INSERT INTO country VALUES("83","GR","Greece","GRC","300","30");
INSERT INTO country VALUES("84","GL","Greenland","GRL","304","299");
INSERT INTO country VALUES("85","GD","Grenada","GRD","308","1473");
INSERT INTO country VALUES("86","GP","Guadeloupe","GLP","312","590");
INSERT INTO country VALUES("87","GU","Guam","GUM","316","1671");
INSERT INTO country VALUES("88","GT","Guatemala","GTM","320","502");
INSERT INTO country VALUES("89","GN","Guinea","GIN","324","224");
INSERT INTO country VALUES("90","GW","Guinea-Bissau","GNB","624","245");
INSERT INTO country VALUES("91","GY","Guyana","GUY","328","592");
INSERT INTO country VALUES("92","HT","Haiti","HTI","332","509");
INSERT INTO country VALUES("93","HM","Heard Island and Mcdonald Islands","","","0");
INSERT INTO country VALUES("94","VA","Holy See (Vatican City State)","VAT","336","39");
INSERT INTO country VALUES("95","HN","Honduras","HND","340","504");
INSERT INTO country VALUES("96","HK","Hong Kong","HKG","344","852");
INSERT INTO country VALUES("97","HU","Hungary","HUN","348","36");
INSERT INTO country VALUES("98","IS","Iceland","ISL","352","354");
INSERT INTO country VALUES("99","IN","India","IND","356","91");
INSERT INTO country VALUES("100","ID","Indonesia","IDN","360","62");
INSERT INTO country VALUES("101","IR","Iran, Islamic Republic of","IRN","364","98");
INSERT INTO country VALUES("102","IQ","Iraq","IRQ","368","964");
INSERT INTO country VALUES("103","IE","Ireland","IRL","372","353");
INSERT INTO country VALUES("104","IL","Israel","ISR","376","972");
INSERT INTO country VALUES("105","IT","Italy","ITA","380","39");
INSERT INTO country VALUES("106","JM","Jamaica","JAM","388","1876");
INSERT INTO country VALUES("107","JP","Japan","JPN","392","81");
INSERT INTO country VALUES("108","JO","Jordan","JOR","400","962");
INSERT INTO country VALUES("109","KZ","Kazakhstan","KAZ","398","7");
INSERT INTO country VALUES("110","KE","Kenya","KEN","404","254");
INSERT INTO country VALUES("111","KI","Kiribati","KIR","296","686");
INSERT INTO country VALUES("112","KP","Korea, Democratic People\'s Republic of","PRK","408","850");
INSERT INTO country VALUES("113","KR","Korea, Republic of","KOR","410","82");
INSERT INTO country VALUES("114","KW","Kuwait","KWT","414","965");
INSERT INTO country VALUES("115","KG","Kyrgyzstan","KGZ","417","996");
INSERT INTO country VALUES("116","LA","Lao People\'s Democratic Republic","LAO","418","856");
INSERT INTO country VALUES("117","LV","Latvia","LVA","428","371");
INSERT INTO country VALUES("118","LB","Lebanon","LBN","422","961");
INSERT INTO country VALUES("119","LS","Lesotho","LSO","426","266");
INSERT INTO country VALUES("120","LR","Liberia","LBR","430","231");
INSERT INTO country VALUES("121","LY","Libyan Arab Jamahiriya","LBY","434","218");
INSERT INTO country VALUES("122","LI","Liechtenstein","LIE","438","423");
INSERT INTO country VALUES("123","LT","Lithuania","LTU","440","370");
INSERT INTO country VALUES("124","LU","Luxembourg","LUX","442","352");
INSERT INTO country VALUES("125","MO","Macao","MAC","446","853");
INSERT INTO country VALUES("126","MK","Macedonia, the Former Yugoslav Republic of","MKD","807","389");
INSERT INTO country VALUES("127","MG","Madagascar","MDG","450","261");
INSERT INTO country VALUES("128","MW","Malawi","MWI","454","265");
INSERT INTO country VALUES("129","MY","Malaysia","MYS","458","60");
INSERT INTO country VALUES("130","MV","Maldives","MDV","462","960");
INSERT INTO country VALUES("131","ML","Mali","MLI","466","223");
INSERT INTO country VALUES("132","MT","Malta","MLT","470","356");
INSERT INTO country VALUES("133","MH","Marshall Islands","MHL","584","692");
INSERT INTO country VALUES("134","MQ","Martinique","MTQ","474","596");
INSERT INTO country VALUES("135","MR","Mauritania","MRT","478","222");
INSERT INTO country VALUES("136","MU","Mauritius","MUS","480","230");
INSERT INTO country VALUES("137","YT","Mayotte","","","269");
INSERT INTO country VALUES("138","MX","Mexico","MEX","484","52");
INSERT INTO country VALUES("139","FM","Micronesia, Federated States of","FSM","583","691");
INSERT INTO country VALUES("140","MD","Moldova, Republic of","MDA","498","373");
INSERT INTO country VALUES("141","MC","Monaco","MCO","492","377");
INSERT INTO country VALUES("142","MN","Mongolia","MNG","496","976");
INSERT INTO country VALUES("143","MS","Montserrat","MSR","500","1664");
INSERT INTO country VALUES("144","MA","Morocco","MAR","504","212");
INSERT INTO country VALUES("145","MZ","Mozambique","MOZ","508","258");
INSERT INTO country VALUES("146","MM","Myanmar","MMR","104","95");
INSERT INTO country VALUES("147","NA","Namibia","NAM","516","264");
INSERT INTO country VALUES("148","NR","Nauru","NRU","520","674");
INSERT INTO country VALUES("149","NP","Nepal","NPL","524","977");
INSERT INTO country VALUES("150","NL","Netherlands","NLD","528","31");
INSERT INTO country VALUES("151","AN","Netherlands Antilles","ANT","530","599");
INSERT INTO country VALUES("152","NC","New Caledonia","NCL","540","687");
INSERT INTO country VALUES("153","NZ","New Zealand","NZL","554","64");
INSERT INTO country VALUES("154","NI","Nicaragua","NIC","558","505");
INSERT INTO country VALUES("155","NE","Niger","NER","562","227");
INSERT INTO country VALUES("156","NG","Nigeria","NGA","566","234");
INSERT INTO country VALUES("157","NU","Niue","NIU","570","683");
INSERT INTO country VALUES("158","NF","Norfolk Island","NFK","574","672");
INSERT INTO country VALUES("159","MP","Northern Mariana Islands","MNP","580","1670");
INSERT INTO country VALUES("160","NO","Norway","NOR","578","47");
INSERT INTO country VALUES("161","OM","Oman","OMN","512","968");
INSERT INTO country VALUES("162","PK","Pakistan","PAK","586","92");
INSERT INTO country VALUES("163","PW","Palau","PLW","585","680");
INSERT INTO country VALUES("164","PS","Palestinian Territory, Occupied","","","970");
INSERT INTO country VALUES("165","PA","Panama","PAN","591","507");
INSERT INTO country VALUES("166","PG","Papua New Guinea","PNG","598","675");
INSERT INTO country VALUES("167","PY","Paraguay","PRY","600","595");
INSERT INTO country VALUES("168","PE","Peru","PER","604","51");
INSERT INTO country VALUES("169","PH","Philippines","PHL","608","63");
INSERT INTO country VALUES("170","PN","Pitcairn","PCN","612","0");
INSERT INTO country VALUES("171","PL","Poland","POL","616","48");
INSERT INTO country VALUES("172","PT","Portugal","PRT","620","351");
INSERT INTO country VALUES("173","PR","Puerto Rico","PRI","630","1787");
INSERT INTO country VALUES("174","QA","Qatar","QAT","634","974");
INSERT INTO country VALUES("175","RE","Reunion","REU","638","262");
INSERT INTO country VALUES("176","RO","Romania","ROM","642","40");
INSERT INTO country VALUES("177","RU","Russian Federation","RUS","643","70");
INSERT INTO country VALUES("178","RW","Rwanda","RWA","646","250");
INSERT INTO country VALUES("179","SH","Saint Helena","SHN","654","290");
INSERT INTO country VALUES("180","KN","Saint Kitts and Nevis","KNA","659","1869");
INSERT INTO country VALUES("181","LC","Saint Lucia","LCA","662","1758");
INSERT INTO country VALUES("182","PM","Saint Pierre and Miquelon","SPM","666","508");
INSERT INTO country VALUES("183","VC","Saint Vincent and the Grenadines","VCT","670","1784");
INSERT INTO country VALUES("184","WS","Samoa","WSM","882","684");
INSERT INTO country VALUES("185","SM","San Marino","SMR","674","378");
INSERT INTO country VALUES("186","ST","Sao Tome and Principe","STP","678","239");
INSERT INTO country VALUES("187","SA","Saudi Arabia","SAU","682","966");
INSERT INTO country VALUES("188","SN","Senegal","SEN","686","221");
INSERT INTO country VALUES("189","CS","Serbia and Montenegro","","","381");
INSERT INTO country VALUES("190","SC","Seychelles","SYC","690","248");
INSERT INTO country VALUES("191","SL","Sierra Leone","SLE","694","232");
INSERT INTO country VALUES("192","SG","Singapore","SGP","702","65");
INSERT INTO country VALUES("193","SK","Slovakia","SVK","703","421");
INSERT INTO country VALUES("194","SI","Slovenia","SVN","705","386");
INSERT INTO country VALUES("195","SB","Solomon Islands","SLB","90","677");
INSERT INTO country VALUES("196","SO","Somalia","SOM","706","252");
INSERT INTO country VALUES("197","ZA","South Africa","ZAF","710","27");
INSERT INTO country VALUES("198","GS","South Georgia and the South Sandwich Islands","","","0");
INSERT INTO country VALUES("199","ES","Spain","ESP","724","34");
INSERT INTO country VALUES("200","LK","Sri Lanka","LKA","144","94");
INSERT INTO country VALUES("201","SD","Sudan","SDN","736","249");
INSERT INTO country VALUES("202","SR","Suriname","SUR","740","597");
INSERT INTO country VALUES("203","SJ","Svalbard and Jan Mayen","SJM","744","47");
INSERT INTO country VALUES("204","SZ","Swaziland","SWZ","748","268");
INSERT INTO country VALUES("205","SE","Sweden","SWE","752","46");
INSERT INTO country VALUES("206","CH","Switzerland","CHE","756","41");
INSERT INTO country VALUES("207","SY","Syrian Arab Republic","SYR","760","963");
INSERT INTO country VALUES("208","TW","Taiwan, Province of China","TWN","158","886");
INSERT INTO country VALUES("209","TJ","Tajikistan","TJK","762","992");
INSERT INTO country VALUES("210","TZ","Tanzania, United Republic of","TZA","834","255");
INSERT INTO country VALUES("211","TH","Thailand","THA","764","66");
INSERT INTO country VALUES("212","TL","Timor-Leste","","","670");
INSERT INTO country VALUES("213","TG","Togo","TGO","768","228");
INSERT INTO country VALUES("214","TK","Tokelau","TKL","772","690");
INSERT INTO country VALUES("215","TO","Tonga","TON","776","676");
INSERT INTO country VALUES("216","TT","Trinidad and Tobago","TTO","780","1868");
INSERT INTO country VALUES("217","TN","Tunisia","TUN","788","216");
INSERT INTO country VALUES("218","TR","Turkey","TUR","792","90");
INSERT INTO country VALUES("219","TM","Turkmenistan","TKM","795","7370");
INSERT INTO country VALUES("220","TC","Turks and Caicos Islands","TCA","796","1649");
INSERT INTO country VALUES("221","TV","Tuvalu","TUV","798","688");
INSERT INTO country VALUES("222","UG","Uganda","UGA","800","256");
INSERT INTO country VALUES("223","UA","Ukraine","UKR","804","380");
INSERT INTO country VALUES("224","AE","United Arab Emirates","ARE","784","971");
INSERT INTO country VALUES("225","GB","United Kingdom","GBR","826","44");
INSERT INTO country VALUES("226","US","United States","USA","840","1");
INSERT INTO country VALUES("227","UM","United States Minor Outlying Islands","","","1");
INSERT INTO country VALUES("228","UY","Uruguay","URY","858","598");
INSERT INTO country VALUES("229","UZ","Uzbekistan","UZB","860","998");
INSERT INTO country VALUES("230","VU","Vanuatu","VUT","548","678");
INSERT INTO country VALUES("231","VE","Venezuela","VEN","862","58");
INSERT INTO country VALUES("232","VN","Viet Nam","VNM","704","84");
INSERT INTO country VALUES("233","VG","Virgin Islands, British","VGB","92","1284");
INSERT INTO country VALUES("234","VI","Virgin Islands, U.s.","VIR","850","1340");
INSERT INTO country VALUES("235","WF","Wallis and Futuna","WLF","876","681");
INSERT INTO country VALUES("236","EH","Western Sahara","ESH","732","212");
INSERT INTO country VALUES("237","YE","Yemen","YEM","887","967");
INSERT INTO country VALUES("238","ZM","Zambia","ZMB","894","260");
INSERT INTO country VALUES("239","ZW","Zimbabwe","ZWE","716","263");





CREATE TABLE IF NOT EXISTS `currency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `default` enum('1','0') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_code_unique` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO currency VALUES("1","US Dollar","USD","$","1.00","Active","0");
INSERT INTO currency VALUES("2","Pound Sterling","GBP","&pound;","0.65","Active","0");
INSERT INTO currency VALUES("3","Europe","EUR","&euro;","0.88","Active","0");
INSERT INTO currency VALUES("4","Australian Dollar","AUD","&#36;","1.41","Active","0");
INSERT INTO currency VALUES("5","Singapore","SGD","&#36;","1.41","Active","1");
INSERT INTO currency VALUES("6","Swedish Krona","SEK","kr","8.24","Active","0");
INSERT INTO currency VALUES("7","Danish Krone","DKK","kr","6.58","Active","0");
INSERT INTO currency VALUES("8","Mexican Peso","MXN","$","16.83","Active","0");
INSERT INTO currency VALUES("9","Brazilian Real","BRL","R$","3.88","Active","0");
INSERT INTO currency VALUES("10","Malaysian Ringgit","MYR","RM","4.31","Active","0");
INSERT INTO currency VALUES("11","Philippine Peso","PHP","P","46.73","Active","0");
INSERT INTO currency VALUES("12","Swiss Franc","CHF","&euro;","0.97","Active","0");
INSERT INTO currency VALUES("13","India","INR","&#x20B9;","66.24","Active","0");
INSERT INTO currency VALUES("14","Argentine Peso","ARS","&#36;","9.35","Active","0");
INSERT INTO currency VALUES("15","Canadian Dollar","CAD","&#36;","1.33","Active","0");
INSERT INTO currency VALUES("16","Chinese Yuan","CNY","&#165;","6.37","Active","0");
INSERT INTO currency VALUES("17","Czech Republic Koruna","CZK","K&#269;","23.91","Active","0");
INSERT INTO currency VALUES("18","Hong Kong Dollar","HKD","&#36;","7.75","Active","0");
INSERT INTO currency VALUES("19","Hungarian Forint","HUF","Ft","276.41","Active","0");
INSERT INTO currency VALUES("20","Indonesian Rupiah","IDR","Rp","14249.50","Active","0");
INSERT INTO currency VALUES("21","Israeli New Sheqel","ILS","&#8362;","3.86","Active","0");
INSERT INTO currency VALUES("22","Japanese Yen","JPY","&#165;","120.59","Active","0");
INSERT INTO currency VALUES("23","South Korean Won","KRW","&#8361;","1182.69","Active","0");
INSERT INTO currency VALUES("24","Norwegian Krone","NOK","kr","8.15","Active","0");
INSERT INTO currency VALUES("25","New Zealand Dollar","NZD","&#36;","1.58","Active","0");
INSERT INTO currency VALUES("26","Polish Zloty","PLN","z&#322;","3.71","Active","0");
INSERT INTO currency VALUES("27","Russian Ruble","RUB","p","67.75","Active","0");
INSERT INTO currency VALUES("28","Thai Baht","THB","&#3647;","36.03","Active","0");
INSERT INTO currency VALUES("29","Turkish Lira","TRY","&#8378;","3.05","Active","0");
INSERT INTO currency VALUES("30","New Taiwan Dollar","TWD","&#36;","32.47","Active","0");
INSERT INTO currency VALUES("31","Vietnamese Dong","VND","&#8363;","22471.00","Active","0");
INSERT INTO currency VALUES("32","South African Rand","ZAR","R","13.55","Active","0");





CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `default` enum('1','0') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO language VALUES("1","English","en","Active","0");
INSERT INTO language VALUES("2","????","ar","Active","0");
INSERT INTO language VALUES("3","?? (??)","ch","Active","1");
INSERT INTO language VALUES("4","Français","fr","Active","0");
INSERT INTO language VALUES("5","Português","pt","Inactive","0");
INSERT INTO language VALUES("6","???????","ru","Active","0");
INSERT INTO language VALUES("7","Español","es","Active","0");
INSERT INTO language VALUES("8","Türkçe","tr","Active","0");





CREATE TABLE IF NOT EXISTS `message_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO message_type VALUES("1","query","");
INSERT INTO message_type VALUES("2","guest_cancellation","");
INSERT INTO message_type VALUES("3","host_cancellation","");
INSERT INTO message_type VALUES("4","booking_request","");
INSERT INTO message_type VALUES("5","booking_accecpt","");
INSERT INTO message_type VALUES("6","booking_decline","");
INSERT INTO message_type VALUES("7","booking_expire","");





CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `type_id` int(11) DEFAULT NULL,
  `read` int(11) NOT NULL DEFAULT '0',
  `archive` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO messages VALUES("1","6","1","2","4","","4","1","0","0","2018-02-13 09:46:11","2018-03-31 09:51:47");
INSERT INTO messages VALUES("2","1","2","2","1","","4","0","0","0","2018-02-14 11:41:10","2018-02-14 11:41:10");
INSERT INTO messages VALUES("3","9","3","8","5","sdaffdsgfdsgfds","4","1","0","0","2018-03-06 06:33:11","2018-03-31 10:44:11");
INSERT INTO messages VALUES("4","11","4","8","7","","4","0","0","0","2018-03-06 06:46:48","2018-03-06 06:46:48");
INSERT INTO messages VALUES("5","11","5","5","7","","4","0","0","0","2018-03-11 12:41:07","2018-03-11 12:41:07");
INSERT INTO messages VALUES("6","12","6","3","2","Message for the host.","4","0","0","0","2018-03-23 05:46:15","2018-03-23 05:46:15");
INSERT INTO messages VALUES("7","12","7","3","2","Test Message for the host.","4","0","0","0","2018-03-23 06:15:26","2018-03-23 06:15:26");
INSERT INTO messages VALUES("8","13","8","3","2","Message for the host.","4","0","0","0","2018-03-23 06:35:58","2018-03-23 06:35:58");
INSERT INTO messages VALUES("9","13","9","3","2","","4","0","0","0","2018-03-23 06:38:21","2018-03-23 06:38:21");
INSERT INTO messages VALUES("10","13","10","3","2","Message for the host.","4","0","0","0","2018-03-23 08:05:25","2018-03-23 08:05:25");
INSERT INTO messages VALUES("11","14","11","3","2","Message for the host.","4","0","0","0","2018-03-23 09:42:38","2018-03-23 09:42:38");
INSERT INTO messages VALUES("12","13","12","3","2","","4","0","0","0","2018-03-31 08:06:19","2018-03-31 08:06:19");
INSERT INTO messages VALUES("13","15","13","3","2","","4","1","0","0","2018-03-31 09:37:52","2018-03-31 09:39:20");
INSERT INTO messages VALUES("14","15","13","3","2","","2","0","0","0","2018-03-31 09:46:51","2018-03-31 09:46:51");
INSERT INTO messages VALUES("15","15","14","8","2","hello....","4","0","0","0","2018-03-31 11:02:56","2018-03-31 11:02:56");
INSERT INTO messages VALUES("16","16","15","8","4","Hi,\nMessage to host","4","1","0","0","2018-03-31 11:11:05","2018-03-31 11:11:38");
INSERT INTO messages VALUES("17","16","16","8","4","asofdsifdsghsdgidfshgdfighdfighdfd\ndfhdgfhgfjgfj","4","1","0","0","2018-03-31 11:25:37","2018-03-31 11:29:59");
INSERT INTO messages VALUES("18","16","17","8","4","","4","1","0","0","2018-03-31 11:29:34","2018-04-01 06:19:39");
INSERT INTO messages VALUES("19","16","17","8","4","","2","1","0","0","2018-03-31 11:36:47","2018-04-01 06:19:39");
INSERT INTO messages VALUES("20","14","18","6","2","","4","0","0","0","2018-03-31 12:03:51","2018-03-31 12:03:51");
INSERT INTO messages VALUES("21","16","15","4","8","hi..your booking is confirm.","1","0","0","0","2018-04-01 06:22:05","2018-04-01 06:22:05");
INSERT INTO messages VALUES("22","18","19","9","6","This is a test message for the host.","4","0","0","0","2018-04-01 07:07:30","2018-04-01 07:07:30");





CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2015_09_26_161159_entrust_setup_tables","1");
INSERT INTO migrations VALUES("4","2015_10_05_153204_create_timezone_table","1");
INSERT INTO migrations VALUES("5","2017_02_08_044609_create_accounts_table","1");
INSERT INTO migrations VALUES("6","2017_02_08_045108_create_pages_table","1");
INSERT INTO migrations VALUES("7","2017_02_08_045204_create_reports_table","1");
INSERT INTO migrations VALUES("8","2017_02_08_045412_create_country_table","1");
INSERT INTO migrations VALUES("9","2017_02_08_045643_create_language_table","1");
INSERT INTO migrations VALUES("10","2017_02_08_045745_create_currency_table","1");
INSERT INTO migrations VALUES("11","2017_02_23_110333_create_backup_table","1");
INSERT INTO migrations VALUES("12","2017_02_27_124315_create_seo_metas_table","1");
INSERT INTO migrations VALUES("13","2017_03_01_130507_create_user_details_table","1");
INSERT INTO migrations VALUES("14","2017_03_29_070352_create_payment_methods_table","1");
INSERT INTO migrations VALUES("15","2017_04_02_110016_create_notification_table","1");
INSERT INTO migrations VALUES("16","2017_05_04_102846_create_admin_table","1");
INSERT INTO migrations VALUES("17","2017_05_04_103841_create_property_type_table","1");
INSERT INTO migrations VALUES("18","2017_05_04_104010_create_amenities_table","1");
INSERT INTO migrations VALUES("19","2017_05_04_104406_create_amenity_type_table","1");
INSERT INTO migrations VALUES("20","2017_05_04_104509_create_rules_table","1");
INSERT INTO migrations VALUES("21","2017_05_04_105120_create_settings_table","1");
INSERT INTO migrations VALUES("22","2017_05_04_105515_create_properties_table","1");
INSERT INTO migrations VALUES("23","2017_05_04_105605_create_property_description_table","1");
INSERT INTO migrations VALUES("24","2017_05_04_105636_create_property_price_table","1");
INSERT INTO migrations VALUES("25","2017_05_04_105726_create_property_address_table","1");
INSERT INTO migrations VALUES("26","2017_05_04_105742_create_property_photos_table","1");
INSERT INTO migrations VALUES("27","2017_05_04_105800_create_property_details_table","1");
INSERT INTO migrations VALUES("28","2017_05_04_112613_create_property_dates_table","1");
INSERT INTO migrations VALUES("29","2017_05_04_112728_create_property_rules_table","1");
INSERT INTO migrations VALUES("30","2017_05_04_112954_create_property_fees_table","1");
INSERT INTO migrations VALUES("31","2017_05_04_113049_create_bookings_table","1");
INSERT INTO migrations VALUES("32","2017_05_04_113223_create_penalty_table","1");
INSERT INTO migrations VALUES("33","2017_05_04_113243_create_payout_table","1");
INSERT INTO migrations VALUES("34","2017_05_04_113355_create_payout_penalties_table","1");
INSERT INTO migrations VALUES("35","2017_05_04_113622_create_booking_details_table","1");
INSERT INTO migrations VALUES("36","2017_05_04_114011_create_reviews_table","1");
INSERT INTO migrations VALUES("37","2017_05_04_114131_create_messages_table","1");
INSERT INTO migrations VALUES("38","2017_05_04_114152_create_bed_types_table","1");
INSERT INTO migrations VALUES("39","2017_05_04_114215_create_banners_table","1");
INSERT INTO migrations VALUES("40","2017_05_04_114238_create_starting_cities_table","1");
INSERT INTO migrations VALUES("41","2017_05_07_133954_create_message_type_table","1");
INSERT INTO migrations VALUES("42","2017_05_08_073511_create_property_beds_table","1");
INSERT INTO migrations VALUES("43","2017_05_13_055552_create_space_type_table","1");
INSERT INTO migrations VALUES("44","2017_05_18_121707_create_property_steps_table","1");
INSERT INTO migrations VALUES("45","2017_06_18_080440_create_table_user_verification","1");





CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('read','unread') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO pages VALUES("1","Help","help","Help page coming soon.","","Active","","");





CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO password_resets VALUES("shahin.techvill@gmail.com","R1c9yNKSpJ2aH3l3grjpeWNQOaq6pgDwMfz9wvQQ5SzWIDXSsTL6aVpZWe9ZlFPH36m0Pw46DRC5927fy7RYaw51insnzz2kxHmu","2018-03-20 11:10:41");
INSERT INTO password_resets VALUES("shahin.techvill@gmail.com","ZBOAVKHfygABdtFfzcbeJyj6Ahiuq8JHnwP3VEOFjwozNMGHnN0ExEDLJSOaGrh9QulnH6IQv3m1cLPOC5KKttemOx3qUM1bXPEo","2018-03-20 11:08:21");
INSERT INTO password_resets VALUES("sefa@gmail.com","lWIQC7SJRqmgcPK4HKUHaxnMwNWPiLj8FoQjvE7Fv4FRU2lmuUOnnFXXCW4rFdrlB1AuAE1CJBZek5O3xEGXm64SZyKBo1kihyS8","2018-03-06 06:13:38");
INSERT INTO password_resets VALUES("test@techvill.net","ufCdJ2RDSTZAqCJTLO0wICMfPsoYOYAAaaVJExk8MFZhO9BVBNocmco0v5Iw7VYj2KaY5sneaKa3LYu7UCl4TsgFnCmeiRGnvDy2","2018-03-05 06:24:04");
INSERT INTO password_resets VALUES("borna606@gmail.com","3H3pBQkCMZXaN6a0r8KcfF2ZzQXM6P8sRUtgm3DVYpGuNaz5kMVNC0KwmF9AgIXsuvThnNqJWPtspg3x4QXjNsCQw62BhXnoBPhw","2018-03-01 07:01:40");
INSERT INTO password_resets VALUES("borna606@gmail.com","izX0PVkEQ6gGPPUM4E7NtL5oqrDtfG8O2kLaim3NSqGuCrd9mL5Sm3m0kN8tukFQqCMffGRDIpBY7QKJOOHUCCgAFgj4Ebom1ugv","2018-03-01 07:00:48");
INSERT INTO password_resets VALUES("borna606@gmail.com","vrTetJ3QP6j5prr3igpuZWnHAixhiLfjZUqfDgv1szDjxf4W39uOI9wehWX88QXrxax2R3DGQt6lNloO9vCWbQ6lbsWPIxAElF2a","2018-03-01 06:29:34");
INSERT INTO password_resets VALUES("shahin.techvill@gmail.com","mGU6SuR6wCSqDt7pNOS0l7o1LOQQP397lmE0AQ6EZUb3Ys61j9gdRSrzB9yApB3ZB0IyVu3ZWVqYAcyuUJTUBKvSFatWDhbXNfec","2018-03-20 11:25:48");
INSERT INTO password_resets VALUES("shahin.developer@gmail.com","NOx1zt1MmXqMWXEhn3j6kwi0Ef3AApyq8bSjd8EiB378tPMi1QFvxH91fEHo2TnrdKJ3Iv39coNESYZq2HADQwelNnEQsnDKScF5","2018-03-21 12:10:37");
INSERT INTO password_resets VALUES("shahin.developer@gmail.com","eILUXDgWxqm5AvsvdVjEFYxilTTBdCaRc10TUViVWY7AhqRmN5vdXzVaINzj43hwZTvcd9W05CaIFT5DxkwPlCBHklEhnM910qkZ","2018-03-21 12:26:02");
INSERT INTO password_resets VALUES("shahin.techvill@gmail.com","aSHu5E3ogUBn78EvKCFrmJQkZy1cWqWO4OyuI1PW4E4wSEGXRBiMxdmhnU03kwjyAe4fveCKSHxjU7B8KZuBQlgAKXmNJI2dUPyL","2018-03-21 12:39:43");
INSERT INTO password_resets VALUES("tuhin.techvill@gmail.com","lxwQyG2whPj7WUf6ieD52WRiIOR2DTBxRVPp3NV0IseqU0j3PcOsk6Qe9taU17XqQfVGAkLir3oPPK3t6w5Qm3HWDS70X7Nr5xa1","2018-03-21 12:52:33");
INSERT INTO password_resets VALUES("shahin.techvill@gmail.com","ScMbN3rRY5guS7OD7NJQOfWB1zEKGVGRXR01y8w6kAJA4dMuFye9Qy6aL3Uv42LJVewc9tjgpQUMPOQwwFuYOmZwUy6tcSj8ccOa","2018-03-22 05:52:26");
INSERT INTO password_resets VALUES("sohel@gmail.com","E8mqNESqL7Rkxq4EQuEYhLNNrIPK6UcBLpqlS3eo3nFceZ83V0EsyMI5XO8580gakbBwwxhDPKd32uTaZ7MujEhKvzWxJxQ1q6zy","2018-03-23 05:06:58");
INSERT INTO password_resets VALUES("srijon@gmail.com","bZzMhlLN8EcZOuc8eviNEbgod2m0JneRH2csBWA6PuSo10u5EizbJTOyApt0K9OhA3PaGa0b7hMUnHzrPKoLZR45N9LeS6UuTNYf","2018-03-23 05:41:20");
INSERT INTO password_resets VALUES("borna606@gmail.com","SwWdiPQp7Fe1zjpdusk3mMQxSFh9FO0S9sdmawBEE9NRY3lZejcuISlsituxyj0sG2Jb8ZephcLrg0yQRbEgDtDP57WPu1M7pQuk","2018-03-31 09:57:46");
INSERT INTO password_resets VALUES("nipam@gmail.com","lWIfvfp9SZ5wFgNzPX1y0N9dq6MtqIzzVHH0WvdFJCV53ITnu13WF7zkqD6m6AyMwyOvoTCvkz6ZEQfRp4lACuBNsIOFiKj8CeB0","2018-03-31 10:37:19");
INSERT INTO password_resets VALUES("mariamakter@gmail.com","khEE3YXDayEqLmPfMC0o9tVrpBUc8PcYOpOMZdFtivRdOfmKzoAyZbQhoq9A2jrLtgydEj11ib0JcqFlJNcMriB8QcAkzM4a2CBq","2018-03-31 10:55:06");
INSERT INTO password_resets VALUES("risa@yahoo.com","Apw4D2OVbshwN9qgeD9Ev3kckzUfbQJZukP1C5lrl8gv2JVOTKn9GnjMxioa8i7HY3y1RMVcQRZK6hiCskZM0jzriBWNvVpUyiWI","2018-03-31 10:56:38");
INSERT INTO password_resets VALUES("jihad@gmail.com","zUlwWQb8yyHSgivkQX6ZyVIbFeCZScGUaNnmNuk3utqzRLs2feEI7lYxMmwLsy2tLNCfzTxhVGbxyR0oTf9Kc9ByStV64HwNNtMb","2018-04-01 05:05:41");
INSERT INTO password_resets VALUES("risa@yahoo.com","ObuMOHxe7bSTdDKaf6uTDDtdBET8sIZGabax1TeCLgjfaHDT1f3oZewS8DjGcEcZ85woyyQV0uDWiJlLr3LNZi1q6c1I8UvROuYI","2018-04-01 06:14:31");





CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payment_methods VALUES("1","Paypal","Active");
INSERT INTO payment_methods VALUES("2","Stripe","Active");





CREATE TABLE IF NOT EXISTS `payout_penalties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payout_id` int(11) NOT NULL,
  `penalty_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `payouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_type` enum('Host','Guest') COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `penalty_amount` double NOT NULL DEFAULT '0',
  `status` enum('Completed','Future') COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payouts VALUES("1","1","4","0","Host","","10","0","Future","USD","2018-02-13 09:46:11","2018-02-13 09:46:11");
INSERT INTO payouts VALUES("2","2","1","0","Host","","7","0","Future","USD","2018-02-14 11:41:10","2018-02-14 11:41:10");
INSERT INTO payouts VALUES("3","3","5","0","Host","","159","0","Future","USD","2018-03-06 06:33:11","2018-03-06 06:33:11");
INSERT INTO payouts VALUES("4","4","7","0","Host","","74","0","Future","USD","2018-03-06 06:46:48","2018-03-06 06:46:48");
INSERT INTO payouts VALUES("5","5","7","0","Host","","7","0","Future","USD","2018-03-11 12:41:07","2018-03-11 12:41:07");
INSERT INTO payouts VALUES("6","6","2","0","Host","","39","0","Future","BRL","2018-03-23 05:46:15","2018-03-23 05:46:15");
INSERT INTO payouts VALUES("7","7","2","0","Host","","117","0","Future","BRL","2018-03-23 06:15:26","2018-03-23 06:15:26");
INSERT INTO payouts VALUES("8","8","2","0","Host","","30","0","Future","USD","2018-03-23 06:35:58","2018-03-23 06:35:58");
INSERT INTO payouts VALUES("9","9","2","0","Host","","20","0","Future","USD","2018-03-23 06:38:21","2018-03-23 06:38:21");
INSERT INTO payouts VALUES("10","10","2","0","Host","","21","0","Future","AUD","2018-03-23 08:05:25","2018-03-23 08:05:25");
INSERT INTO payouts VALUES("11","11","2","0","Host","","4","0","Future","USD","2018-03-23 09:42:38","2018-03-23 09:42:38");
INSERT INTO payouts VALUES("12","12","2","0","Host","","19","0","Future","BRL","2018-03-31 08:06:19","2018-03-31 08:06:19");
INSERT INTO payouts VALUES("15","14","2","0","Host","","21","0","Future","EUR","2018-03-31 11:02:56","2018-03-31 11:02:56");
INSERT INTO payouts VALUES("14","13","3","15","Guest","","51","0","Future","BRL","2018-03-31 09:46:51","2018-03-31 09:46:51");
INSERT INTO payouts VALUES("16","15","4","0","Host","","15","0","Future","EUR","2018-03-31 11:11:05","2018-03-31 11:11:05");
INSERT INTO payouts VALUES("17","16","4","0","Host","","15","0","Future","EUR","2018-03-31 11:25:37","2018-03-31 11:25:37");
INSERT INTO payouts VALUES("20","18","2","0","Host","","2","0","Future","SGD","2018-03-31 12:03:51","2018-03-31 12:03:51");
INSERT INTO payouts VALUES("19","17","8","16","Guest","borna.techvill@gmail.com","16","0","Completed","EUR","2018-03-31 11:36:47","2018-03-31 11:43:06");
INSERT INTO payouts VALUES("21","19","6","0","Host","","10","0","Future","SGD","2018-04-01 07:07:30","2018-04-01 07:07:30");





CREATE TABLE IF NOT EXISTS `penalty` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Host','Guest') COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `remaining_penalty` double NOT NULL DEFAULT '0',
  `reason` enum('cancelation','demurrage','violation_of_rules') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Pending','Completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO permission_role VALUES("1","1");
INSERT INTO permission_role VALUES("2","1");
INSERT INTO permission_role VALUES("3","1");
INSERT INTO permission_role VALUES("4","1");
INSERT INTO permission_role VALUES("5","1");
INSERT INTO permission_role VALUES("6","1");
INSERT INTO permission_role VALUES("7","1");
INSERT INTO permission_role VALUES("8","1");
INSERT INTO permission_role VALUES("9","1");
INSERT INTO permission_role VALUES("10","1");
INSERT INTO permission_role VALUES("11","1");
INSERT INTO permission_role VALUES("12","1");
INSERT INTO permission_role VALUES("13","1");
INSERT INTO permission_role VALUES("14","1");
INSERT INTO permission_role VALUES("15","1");
INSERT INTO permission_role VALUES("16","1");
INSERT INTO permission_role VALUES("17","1");
INSERT INTO permission_role VALUES("18","1");
INSERT INTO permission_role VALUES("19","1");
INSERT INTO permission_role VALUES("20","1");
INSERT INTO permission_role VALUES("21","1");
INSERT INTO permission_role VALUES("22","1");
INSERT INTO permission_role VALUES("23","1");
INSERT INTO permission_role VALUES("24","1");
INSERT INTO permission_role VALUES("25","1");
INSERT INTO permission_role VALUES("26","1");
INSERT INTO permission_role VALUES("27","1");
INSERT INTO permission_role VALUES("28","1");
INSERT INTO permission_role VALUES("29","1");
INSERT INTO permission_role VALUES("30","1");
INSERT INTO permission_role VALUES("31","1");
INSERT INTO permission_role VALUES("32","1");
INSERT INTO permission_role VALUES("33","1");
INSERT INTO permission_role VALUES("34","1");
INSERT INTO permission_role VALUES("35","1");
INSERT INTO permission_role VALUES("36","1");
INSERT INTO permission_role VALUES("37","1");





CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO permissions VALUES("1","manage_admin","Manage Admin","Manage Admin Users","","");
INSERT INTO permissions VALUES("2","customers","View Customers","View Customer","","");
INSERT INTO permissions VALUES("3","add_customer","Add Customera","Add Customer","","");
INSERT INTO permissions VALUES("4","edit_customer","Edit Customera","Edit Customer","","");
INSERT INTO permissions VALUES("5","delete_customer","Delete Customera","Delete Customer","","");
INSERT INTO permissions VALUES("6","properties","View Properties","View Properties","","");
INSERT INTO permissions VALUES("7","add_properties","Add Properties","Add Properties","","");
INSERT INTO permissions VALUES("8","edit_properties","Edit Properties","Edit Properties","","");
INSERT INTO permissions VALUES("9","delete_property","Delete Property","Delete Property","","");
INSERT INTO permissions VALUES("10","manage_bookings","Manage Bookings","Manage Bookings","","");
INSERT INTO permissions VALUES("11","manage_penalty","Penalty","Penalty","","");
INSERT INTO permissions VALUES("12","send_email","send_email","Emails","","");
INSERT INTO permissions VALUES("13","manage_reviews","Manage Reviews","Manage Reviews","","");
INSERT INTO permissions VALUES("14","manage_reports","Manage Reports","Manage Reports","","");
INSERT INTO permissions VALUES("15","manage_amenities","Manage Amenities","Manage Amenities","","");
INSERT INTO permissions VALUES("16","manage_pages","Manage Pages","Manage Pages","","");
INSERT INTO permissions VALUES("17","database_backup","Database Backup","Database Backup","","");
INSERT INTO permissions VALUES("18","manage_banners","Manage Banners","Manage Banners","","");
INSERT INTO permissions VALUES("19","manage_currency","Manage Currency","Manage Currency","","");
INSERT INTO permissions VALUES("20","manage_language","Manage Language","Manage Language","","");
INSERT INTO permissions VALUES("21","manage_country","Manage Country","Manage Country","","");
INSERT INTO permissions VALUES("22","manage_fees","Manage Fees","Manage Fees","","");
INSERT INTO permissions VALUES("23","social_links","Social Links","Social Links","","");
INSERT INTO permissions VALUES("24","manage_metas","Manage Metas","Manage Metas","","");
INSERT INTO permissions VALUES("25","manage_starting_cities","Manage Starting Cities","Manage Starting Cities","","");
INSERT INTO permissions VALUES("26","manage_bed_type","Manage Bed Type","Manage Bed Type","","");
INSERT INTO permissions VALUES("27","general_setting","General Setting","General Setting","","");
INSERT INTO permissions VALUES("28","manage_amenities_type","Manage Amenities Type","Manage Amenities Type","","");
INSERT INTO permissions VALUES("29","space_type_setting","Space Type Setting","Space Type Setting","","");
INSERT INTO permissions VALUES("30","email_settings","Email Settings","Email Settings","","");
INSERT INTO permissions VALUES("31","starting_cities_settings","Starting Cities Settings","Starting Cities Settings","","");
INSERT INTO permissions VALUES("32","api_informations","Api Credentials","Api Credentials","","");
INSERT INTO permissions VALUES("33","payment_settings","Payment Settings","Payment Settings","","");
INSERT INTO permissions VALUES("34","manage_withdraw","Manage Withdraw","Manage Withdraw","","");
INSERT INTO permissions VALUES("35","general_settings","General Setting","General Setting","","");
INSERT INTO permissions VALUES("36","manage_property_type","Manage Property Type","Manage Property Type","","");
INSERT INTO permissions VALUES("37","manage_roles","Manage Roles","Manage Roles","","");





CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host_id` int(11) NOT NULL,
  `bedrooms` tinyint(4) DEFAULT NULL,
  `beds` tinyint(4) DEFAULT NULL,
  `bed_type` int(10) unsigned DEFAULT NULL,
  `bathrooms` double(8,2) DEFAULT NULL,
  `amenities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `property_type` int(11) NOT NULL DEFAULT '0',
  `space_type` int(11) NOT NULL DEFAULT '0',
  `accommodates` tinyint(4) DEFAULT NULL,
  `booking_type` enum('instant','request') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'request',
  `cancellation` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Flexible',
  `status` enum('Unlisted','Listed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Unlisted',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO properties VALUES("1","Entire home/apt in Bogra","","1","","","","","1,2,27,28","1","1","1","instant","Flexible","Listed","","2018-02-07 06:59:36","2018-02-07 07:01:57");
INSERT INTO properties VALUES("2","Entire home/apt in Dubai","","1","1","1","1","0.50","","1","1","1","request","Flexible","Unlisted","","2018-02-07 07:14:59","2018-02-07 07:15:14");
INSERT INTO properties VALUES("3","Entire home/apt in Dhaka","","1","1","1","1","0.50","","1","1","1","request","Flexible","Unlisted","","2018-02-07 12:02:41","2018-02-07 12:02:46");
INSERT INTO properties VALUES("4","Entire home/apt in ","","1","","","","","","1","1","1","request","Flexible","Unlisted","","2018-02-08 03:36:29","2018-02-08 03:36:29");
INSERT INTO properties VALUES("5","Entire home/apt in Dhanbad","","2","1","1","1","0.50","1,2,29","1","1","1","instant","Flexible","Listed","","2018-02-08 05:06:18","2018-03-23 05:08:08");
INSERT INTO properties VALUES("6","Entire home/apt in New Delhi","","4","1","1","1","0.50","1,2","1","1","1","instant","Flexible","Listed","","2018-02-11 07:39:25","2018-02-13 08:20:48");
INSERT INTO properties VALUES("7","Private room in New Delhi","","5","1","1","1","1.00","1,27","2","2","2","request","Flexible","Listed","2018-03-01 06:32:26","2018-02-26 11:06:47","2018-03-01 06:32:26");
INSERT INTO properties VALUES("8","Entire home/apt in New York","","5","1","1","1","0.50","27","1","1","1","instant","Flexible","Listed","","2018-02-26 11:50:29","2018-02-26 11:51:29");
INSERT INTO properties VALUES("9","New York City","","5","1","1","1","1.00","6,7,27","1","1","1","instant","Flexible","Listed","","2018-03-01 06:42:00","2018-03-01 06:45:55");
INSERT INTO properties VALUES("10","Private Room In Sydney","","5","1","1","1","0.50","","1","2","1","request","Flexible","Unlisted","","2018-03-01 07:12:42","2018-03-01 07:13:13");
INSERT INTO properties VALUES("11","Entire home/apt in New York","","7","1","1","1","0.50","1,22,30","1","1","1","instant","Flexible","Listed","","2018-03-05 06:24:21","2018-03-05 06:28:04");
INSERT INTO properties VALUES("12","New York","","2","1","1","1","0.50","3,5,16,27","1","1","1","instant","Flexible","Listed","","2018-03-23 05:36:55","2018-03-23 05:38:08");
INSERT INTO properties VALUES("13","Dhaka University","","2","1","1","1","0.50","7,13,28","1","1","1","instant","Flexible","Listed","","2018-03-23 06:21:12","2018-03-23 06:23:04");
INSERT INTO properties VALUES("14","Pabna University","","2","1","1","1","0.50","3,24,28","1","1","1","instant","Flexible","Listed","","2018-03-23 08:12:27","2018-03-23 08:13:40");
INSERT INTO properties VALUES("15","Entire home/apt in London","","2","2","2","1","2.00","2,27","5","1","5","instant","Flexible","Listed","","2018-03-31 09:29:47","2018-03-31 09:33:11");
INSERT INTO properties VALUES("16","Entire home/apt in London","","4","2","2","1","2.00","4,27","1","2","1","instant","Flexible","Listed","","2018-03-31 09:52:14","2018-03-31 10:32:13");
INSERT INTO properties VALUES("17","Entire home/apt in Brazil","","4","1","1","1","0.50","1,27","2","1","1","instant","Flexible","Listed","","2018-03-31 11:19:14","2018-03-31 11:20:41");
INSERT INTO properties VALUES("18","Dhaka University Dhaka","","6","1","1","1","0.50","1,5,17,18,28,29","1","1","1","instant","Flexible","Listed","","2018-04-01 05:03:32","2018-04-01 05:04:45");
INSERT INTO properties VALUES("19","Entire home/apt in Barcelona","","4","1","1","1","0.50","2,27","1","1","1","instant","Flexible","Listed","","2018-04-01 06:32:26","2018-04-01 06:36:49");
INSERT INTO properties VALUES("20","Private room in ","","4","1","1","1","0.50","","8","2","4","request","Flexible","Unlisted","","2018-04-01 12:04:55","2018-04-01 12:05:01");
INSERT INTO properties VALUES("21","Entire home/apt in ","","4","1","1","1","0.50","","1","2","1","request","Flexible","Unlisted","","2018-04-01 12:07:21","2018-04-01 12:07:29");
INSERT INTO properties VALUES("22","Pabna University 4","","5","1","1","1","0.50","1,5,23,28,30","1","1","1","instant","Flexible","Listed","","2018-04-02 05:01:07","2018-04-02 05:03:04");
INSERT INTO properties VALUES("23","Dhaka University 4","","6","1","1","1","0.50","4,10,26,27,29","1","3","1","request","Flexible","Listed","","2018-04-02 06:10:36","2018-04-02 06:11:50");





CREATE TABLE IF NOT EXISTS `property_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `address_line_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_address VALUES("1","1","Bir Sreshtho Square, Bir Srestho Square, Bogra, Bangladesh","sherpur","24.848078","89.37296330000004","Bogra","Rajshahi Division","BD","5840");
INSERT INTO property_address VALUES("2","2","Al Safa St - Dubai - United Arab Emirates","","25.2048493","55.270782800000006","Dubai","Dubai","AE","1216");
INSERT INTO property_address VALUES("3","3","Road No 11","","23.810332","90.41251809999994","Dhaka","Dhaka Division","BD","1212");
INSERT INTO property_address VALUES("4","4","Unnamed Road","","23.95357419999999","90.14949879999995","","Dhaka Division","BD","");
INSERT INTO property_address VALUES("5","5","Sindri - Dhanbad Main Rd, Mukunda, Pandey Muhalla, Dhanbad, Jharkhand 826001, India","","23.7956531","86.43038589999992","Dhanbad","Jharkhand","IN","826001");
INSERT INTO property_address VALUES("6","6","Kashmere Gate, 649, Hamilton Rd, Chhota Bazar, Mori Gate, New Delhi, Delhi 110006, India","","28.6618976","77.22739580000007","New Delhi","Delhi","IN","110006");
INSERT INTO property_address VALUES("7","7","Srinagar - Kanyakumari Hwy, Ladakh Budh Vihar Colony, Civil Lines, Delhi, 110054, India","","28.674135321559433","77.23318937147224","Delhi","Delhi","IN","110054");
INSERT INTO property_address VALUES("8","8","New York City Hall, 11 Centre St, New York, NY 10007, USA","","40.7127753","-74.0059728","New York","New York","US","10007");
INSERT INTO property_address VALUES("9","9","New York City Hall, 11 Centre St, New York, NY 10007, USA","","40.7127753","-74.0059728","New York","New York","US","10007");
INSERT INTO property_address VALUES("10","10","","","0","0","","","","");
INSERT INTO property_address VALUES("11","11","New York City Hall, 11 Centre St, New York, NY 10007, USA","","40.7127753","-74.0059728","New York","New York","US","10007");
INSERT INTO property_address VALUES("12","12","New York City Hall, 11 Centre St, New York, NY 10007, USA","","40.7127753","-74.0059728","New York","New York","US","10007");
INSERT INTO property_address VALUES("13","13","Arts Bhaban, Dhaka 1205, Bangladesh","","23.7341698","90.39275020000002","Dhaka","Dhaka Division","BD","1205");
INSERT INTO property_address VALUES("14","14","Dhaka - Pabna Hwy, Pabna, Bangladesh","","24.0132552","89.27840530000003","Pabna","Rajshahi Division","BD","");
INSERT INTO property_address VALUES("15","15","A4, London WC2N 5DU, UK","","51.5073509","-0.12775829999998223","London","England","GB","WC2N 5DU");
INSERT INTO property_address VALUES("16","16","A4, London WC2N 5DU, UK","","51.5073509","-0.12775829999998223","London","England","GB","WC2N 5DU");
INSERT INTO property_address VALUES("17","17","251-307 US-40, Brazil, IN 47834, USA","","39.52365199999999","-87.1250154","Brazil","Indiana","US","47834");
INSERT INTO property_address VALUES("18","18","Arts Bhaban, Dhaka 1205, Bangladesh","","23.7341698","90.39275020000002","Dhaka","Dhaka Division","BD","1205");
INSERT INTO property_address VALUES("19","19","Carrer de la Canuda, 45, 08002 Barcelona, Spain","","41.38506389999999","2.1734034999999494","Barcelona","Catalunya","ES","08002");
INSERT INTO property_address VALUES("20","20","","","0","0","","","","");
INSERT INTO property_address VALUES("21","21","","","0","0","","","","");
INSERT INTO property_address VALUES("22","22","Dhaka - Pabna Hwy, Pabna, Bangladesh","","24.0132552","89.27840530000003","Pabna","Rajshahi Division","BD","");
INSERT INTO property_address VALUES("23","23","Arts Bhaban, Dhaka 1205, Bangladesh","","23.7341698","90.39275020000002","Dhaka","Dhaka Division","BD","1205");





CREATE TABLE IF NOT EXISTS `property_beds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `bed_type_id` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `property_dates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `status` enum('Available','Not available') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Available',
  `price` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=377 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_dates VALUES("1","1","Available","5","2018-02-07","2018-02-07 07:02:04","2018-02-07 07:02:04");
INSERT INTO property_dates VALUES("2","1","Available","5","2018-02-08","2018-02-07 07:02:10","2018-02-07 07:02:10");
INSERT INTO property_dates VALUES("3","5","Available","5","2018-02-08","2018-02-08 05:08:43","2018-02-08 05:08:43");
INSERT INTO property_dates VALUES("4","5","Available","50","2018-02-09","2018-02-08 10:23:40","2018-02-08 10:23:40");
INSERT INTO property_dates VALUES("5","5","Available","55","2018-02-15","2018-02-08 10:23:55","2018-02-08 10:23:55");
INSERT INTO property_dates VALUES("6","5","Available","33","2018-02-11","2018-02-11 05:42:14","2018-02-11 05:42:31");
INSERT INTO property_dates VALUES("7","4","Available","33","2018-02-11","2018-02-11 06:16:38","2018-02-11 08:08:23");
INSERT INTO property_dates VALUES("8","4","Available","25","2018-02-12","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("9","4","Available","250","2018-02-13","2018-02-11 06:18:43","2018-02-11 08:27:07");
INSERT INTO property_dates VALUES("10","4","Available","250","2018-02-14","2018-02-11 06:18:43","2018-02-11 08:27:07");
INSERT INTO property_dates VALUES("11","4","Available","250","2018-02-15","2018-02-11 06:18:43","2018-02-11 08:27:07");
INSERT INTO property_dates VALUES("12","4","Available","33","2018-02-16","2018-02-11 06:18:43","2018-02-11 08:20:25");
INSERT INTO property_dates VALUES("13","4","Available","33","2018-02-17","2018-02-11 06:18:43","2018-02-11 08:20:25");
INSERT INTO property_dates VALUES("14","4","Available","33","2018-02-18","2018-02-11 06:18:43","2018-02-11 08:20:25");
INSERT INTO property_dates VALUES("15","4","Available","33","2018-02-19","2018-02-11 06:18:43","2018-02-11 08:20:25");
INSERT INTO property_dates VALUES("16","4","Available","33","2018-02-20","2018-02-11 06:18:43","2018-02-11 08:20:25");
INSERT INTO property_dates VALUES("17","4","Available","33","2018-02-21","2018-02-11 06:18:43","2018-02-11 08:20:25");
INSERT INTO property_dates VALUES("18","4","Available","25","2018-02-22","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("19","4","Available","25","2018-02-23","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("20","4","Available","25","2018-02-24","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("21","4","Available","25","2018-02-25","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("22","4","Available","25","2018-02-26","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("23","4","Available","25","2018-02-27","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("24","4","Available","25","2018-02-28","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("25","4","Available","25","2018-03-01","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("26","4","Available","25","2018-03-02","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("27","4","Available","25","2018-03-03","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("28","4","Available","25","2018-03-04","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("29","4","Available","25","2018-03-05","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("30","4","Available","25","2018-03-06","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("31","4","Available","25","2018-03-07","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("32","4","Available","25","2018-03-08","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("33","4","Available","25","2018-03-09","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("34","4","Available","25","2018-03-10","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("35","4","Available","25","2018-03-11","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("36","4","Available","25","2018-03-12","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("37","4","Available","25","2018-03-13","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("38","4","Available","25","2018-03-14","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("39","4","Available","25","2018-03-15","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("40","4","Available","25","2018-03-16","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("41","4","Available","25","2018-03-17","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("42","4","Available","25","2018-03-18","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("43","4","Available","25","2018-03-19","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("44","4","Available","25","2018-03-20","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("45","4","Available","25","2018-03-21","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("46","4","Available","25","2018-03-22","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("47","4","Available","25","2018-03-23","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("48","4","Available","25","2018-03-24","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("49","4","Available","25","2018-03-25","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("50","4","Available","25","2018-03-26","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("51","4","Available","25","2018-03-27","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("52","4","Available","25","2018-03-28","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("53","4","Available","25","2018-03-29","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("54","4","Available","25","2018-03-30","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("55","4","Available","25","2018-03-31","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("56","4","Available","25","2018-04-01","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("57","4","Available","25","2018-04-02","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("58","4","Available","25","2018-04-03","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("59","4","Available","25","2018-04-04","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("60","4","Available","25","2018-04-05","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("61","4","Available","25","2018-04-06","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("62","4","Available","25","2018-04-07","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("63","4","Available","25","2018-04-08","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("64","4","Available","25","2018-04-09","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("65","4","Available","25","2018-04-10","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("66","4","Available","25","2018-04-11","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("67","4","Available","25","2018-04-12","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("68","4","Available","25","2018-04-13","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("69","4","Available","25","2018-04-14","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("70","4","Available","25","2018-04-15","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("71","4","Available","25","2018-04-16","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("72","4","Available","25","2018-04-17","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("73","4","Available","25","2018-04-18","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("74","4","Available","25","2018-04-19","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("75","4","Available","25","2018-04-20","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("76","4","Available","25","2018-04-21","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("77","4","Available","25","2018-04-22","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("78","4","Available","25","2018-04-23","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("79","4","Available","25","2018-04-24","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("80","4","Available","25","2018-04-25","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("81","4","Available","25","2018-04-26","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("82","4","Available","25","2018-04-27","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("83","4","Available","25","2018-04-28","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("84","4","Available","25","2018-04-29","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("85","4","Available","25","2018-04-30","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("86","4","Available","25","2018-05-01","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("87","4","Available","25","2018-05-02","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("88","4","Available","25","2018-05-03","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("89","4","Available","25","2018-05-04","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("90","4","Available","25","2018-05-05","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("91","4","Available","25","2018-05-06","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("92","4","Available","25","2018-05-07","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("93","4","Available","25","2018-05-08","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("94","4","Available","25","2018-05-09","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("95","4","Available","25","2018-05-10","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("96","4","Available","25","2018-05-11","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("97","4","Available","25","2018-05-12","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("98","4","Available","25","2018-05-13","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("99","4","Available","25","2018-05-14","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("100","4","Available","25","2018-05-15","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("101","4","Available","25","2018-05-16","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("102","4","Available","25","2018-05-17","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("103","4","Available","25","2018-05-18","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("104","4","Available","25","2018-05-19","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("105","4","Available","25","2018-05-20","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("106","4","Available","25","2018-05-21","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("107","4","Available","25","2018-05-22","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("108","4","Available","25","2018-05-23","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("109","4","Available","25","2018-05-24","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("110","4","Available","25","2018-05-25","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("111","4","Available","25","2018-05-26","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("112","4","Available","25","2018-05-27","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("113","4","Available","25","2018-05-28","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("114","4","Available","25","2018-05-29","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("115","4","Available","25","2018-05-30","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("116","4","Available","25","2018-05-31","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("117","4","Available","25","2018-06-01","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("118","4","Available","25","2018-06-02","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("119","4","Available","25","2018-06-03","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("120","4","Available","25","2018-06-04","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("121","4","Available","25","2018-06-05","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("122","4","Available","25","2018-06-06","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("123","4","Available","25","2018-06-07","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("124","4","Available","25","2018-06-08","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("125","4","Available","25","2018-06-09","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("126","4","Available","25","2018-06-10","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("127","4","Available","25","2018-06-11","2018-02-11 06:18:43","2018-02-11 06:18:43");
INSERT INTO property_dates VALUES("128","6","Available","10","2018-02-14","2018-02-11 07:49:22","2018-02-13 08:17:59");
INSERT INTO property_dates VALUES("129","6","Available","25","2018-02-15","2018-02-11 07:49:22","2018-02-14 12:13:42");
INSERT INTO property_dates VALUES("130","6","Available","10","2018-02-16","2018-02-11 07:49:22","2018-02-13 08:18:25");
INSERT INTO property_dates VALUES("131","6","Available","10","2018-02-17","2018-02-11 07:49:22","2018-02-13 08:18:25");
INSERT INTO property_dates VALUES("132","6","Available","10","2018-02-18","2018-02-11 07:49:22","2018-02-13 08:18:25");
INSERT INTO property_dates VALUES("133","6","Available","10","2018-02-19","2018-02-11 07:49:22","2018-02-13 08:18:25");
INSERT INTO property_dates VALUES("134","6","Available","10","2018-02-20","2018-02-11 07:49:22","2018-02-13 08:18:25");
INSERT INTO property_dates VALUES("135","6","Available","10","2018-02-21","2018-02-11 07:49:22","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("136","6","Available","10","2018-02-22","2018-02-11 07:49:22","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("137","6","Available","10","2018-02-23","2018-02-11 07:49:22","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("138","6","Available","10","2018-02-24","2018-02-11 07:49:22","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("139","6","Available","10","2018-02-25","2018-02-11 07:49:22","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("140","6","Available","10","2018-02-26","2018-02-11 07:49:22","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("141","6","Available","10","2018-02-27","2018-02-11 07:49:22","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("142","5","Available","2600","2018-02-13","2018-02-13 06:29:23","2018-02-13 07:09:30");
INSERT INTO property_dates VALUES("143","6","Not available","10","2018-02-13","2018-02-13 07:14:07","2018-02-13 09:46:11");
INSERT INTO property_dates VALUES("144","6","Available","10","2018-02-28","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("145","6","Available","10","2018-03-01","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("146","6","Available","10","2018-03-02","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("147","6","Available","10","2018-03-03","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("148","6","Available","10","2018-03-04","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("149","6","Available","10","2018-03-05","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("150","6","Available","10","2018-03-06","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("151","6","Available","10","2018-03-07","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("152","6","Available","10","2018-03-08","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("153","6","Available","10","2018-03-09","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("154","6","Available","10","2018-03-10","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("155","6","Available","10","2018-03-11","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("156","6","Available","10","2018-03-12","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("157","6","Available","10","2018-03-13","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("158","6","Available","10","2018-03-14","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("159","6","Available","10","2018-03-15","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("160","6","Available","10","2018-03-16","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("161","6","Available","10","2018-03-17","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("162","6","Available","10","2018-03-18","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("163","6","Available","10","2018-03-19","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("164","6","Available","10","2018-03-20","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("165","6","Available","10","2018-03-21","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("166","6","Available","10","2018-03-22","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("167","6","Available","10","2018-03-23","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("168","6","Available","10","2018-03-24","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("169","6","Available","10","2018-03-25","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("170","6","Available","10","2018-03-26","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("171","6","Available","10","2018-03-27","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("172","6","Available","10","2018-03-28","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("173","6","Available","10","2018-03-29","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("174","6","Available","10","2018-03-30","2018-02-13 08:24:11","2018-02-13 08:24:11");
INSERT INTO property_dates VALUES("175","1","Not available","0","2018-02-14","2018-02-14 11:41:10","2018-02-14 11:41:10");
INSERT INTO property_dates VALUES("176","8","Available","10","2018-02-27","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("177","8","Available","10","2018-02-28","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("178","8","Available","10","2018-03-01","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("179","8","Available","10","2018-03-02","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("180","8","Available","10","2018-03-03","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("181","8","Available","10","2018-03-04","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("182","8","Available","10","2018-03-05","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("183","8","Available","10","2018-03-06","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("184","8","Available","10","2018-03-07","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("185","8","Available","10","2018-03-08","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("186","8","Available","10","2018-03-09","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("187","8","Available","10","2018-03-10","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("188","8","Available","10","2018-03-11","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("189","8","Available","10","2018-03-12","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("190","8","Available","10","2018-03-13","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("191","8","Available","10","2018-03-14","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("192","8","Available","10","2018-03-15","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("193","8","Available","10","2018-03-16","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("194","8","Available","10","2018-03-17","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("195","8","Available","10","2018-03-18","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("196","8","Available","10","2018-03-19","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("197","8","Available","10","2018-03-20","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("198","8","Available","10","2018-03-21","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("199","8","Available","10","2018-03-22","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("200","8","Available","10","2018-03-23","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("201","8","Available","10","2018-03-24","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("202","8","Available","10","2018-03-25","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("203","8","Available","10","2018-03-26","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("204","8","Available","10","2018-03-27","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("205","8","Available","10","2018-03-28","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("206","8","Available","10","2018-03-29","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("207","8","Available","10","2018-03-30","2018-02-26 11:51:45","2018-02-26 11:51:45");
INSERT INTO property_dates VALUES("208","9","Available","22","2018-03-02","2018-03-01 06:46:18","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("209","9","Available","22","2018-03-01","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("210","9","Available","22","2018-03-03","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("211","9","Available","22","2018-03-04","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("212","9","Available","22","2018-03-05","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("213","9","Not available","22","2018-03-06","2018-03-01 06:47:21","2018-03-06 06:33:11");
INSERT INTO property_dates VALUES("214","9","Available","22","2018-03-07","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("215","9","Available","22","2018-03-08","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("216","9","Available","22","2018-03-09","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("217","9","Available","22","2018-03-10","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("218","9","Available","22","2018-03-11","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("219","9","Available","22","2018-03-12","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("220","9","Available","22","2018-03-13","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("221","9","Available","22","2018-03-14","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("222","9","Available","22","2018-03-15","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("223","9","Available","22","2018-03-16","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("224","9","Available","22","2018-03-17","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("225","9","Available","22","2018-03-18","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("226","9","Available","22","2018-03-19","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("227","9","Available","22","2018-03-20","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("228","9","Available","22","2018-03-21","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("229","9","Available","22","2018-03-22","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("230","9","Available","22","2018-03-23","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("231","9","Available","22","2018-03-24","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("232","9","Available","22","2018-03-25","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("233","9","Available","22","2018-03-26","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("234","9","Available","22","2018-03-27","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("235","9","Available","22","2018-03-28","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("236","9","Available","22","2018-03-29","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("237","9","Available","22","2018-03-30","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("238","9","Available","22","2018-03-31","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("239","9","Available","22","2018-04-01","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("240","9","Available","22","2018-04-02","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("241","9","Available","22","2018-04-03","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("242","9","Available","22","2018-04-04","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("243","9","Available","22","2018-04-05","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("244","9","Available","22","2018-04-06","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("245","9","Available","22","2018-04-07","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("246","9","Available","22","2018-04-08","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("247","9","Available","22","2018-04-09","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("248","9","Available","22","2018-04-10","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("249","9","Available","22","2018-04-11","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("250","9","Available","22","2018-04-12","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("251","9","Available","22","2018-04-13","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("252","9","Available","22","2018-04-14","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("253","9","Available","22","2018-04-15","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("254","9","Available","22","2018-04-16","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("255","9","Available","22","2018-04-17","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("256","9","Available","22","2018-04-18","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("257","9","Available","22","2018-04-19","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("258","9","Available","22","2018-04-20","2018-03-01 06:47:21","2018-03-01 06:47:21");
INSERT INTO property_dates VALUES("259","11","Not available","0","2018-03-06","2018-03-06 06:46:48","2018-03-06 06:46:48");
INSERT INTO property_dates VALUES("260","11","Not available","5","2018-03-11","2018-03-11 07:20:47","2018-03-11 12:41:07");
INSERT INTO property_dates VALUES("261","11","Available","5","2018-03-12","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("262","11","Available","5","2018-03-13","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("263","11","Available","5","2018-03-14","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("264","11","Available","5","2018-03-15","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("265","11","Available","5","2018-03-16","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("266","11","Available","5","2018-03-17","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("267","11","Available","5","2018-03-18","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("268","11","Available","5","2018-03-19","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("269","11","Available","5","2018-03-20","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("270","11","Available","5","2018-03-21","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("271","11","Available","5","2018-03-22","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("272","11","Available","5","2018-03-23","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("273","11","Available","5","2018-03-24","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("274","11","Available","5","2018-03-25","2018-03-11 07:20:47","2018-03-11 07:20:47");
INSERT INTO property_dates VALUES("275","11","Available","5","2018-03-26","2018-03-11 07:20:48","2018-03-11 07:20:48");
INSERT INTO property_dates VALUES("276","11","Available","5","2018-03-27","2018-03-11 07:20:48","2018-03-11 07:20:48");
INSERT INTO property_dates VALUES("277","11","Available","5","2018-03-28","2018-03-11 07:20:48","2018-03-11 07:20:48");
INSERT INTO property_dates VALUES("278","11","Available","5","2018-03-29","2018-03-11 07:20:48","2018-03-11 07:20:48");
INSERT INTO property_dates VALUES("279","11","Available","5","2018-03-30","2018-03-11 07:20:48","2018-03-11 07:20:48");
INSERT INTO property_dates VALUES("280","11","Available","5","2018-03-31","2018-03-11 07:20:48","2018-03-11 07:20:48");
INSERT INTO property_dates VALUES("281","12","Not available","0","2018-03-23","2018-03-23 05:46:15","2018-03-23 05:46:15");
INSERT INTO property_dates VALUES("282","12","Not available","0","2018-03-24","2018-03-23 06:15:26","2018-03-23 06:15:26");
INSERT INTO property_dates VALUES("283","12","Not available","0","2018-03-25","2018-03-23 06:15:26","2018-03-23 06:15:26");
INSERT INTO property_dates VALUES("284","12","Not available","0","2018-03-26","2018-03-23 06:15:26","2018-03-23 06:15:26");
INSERT INTO property_dates VALUES("285","13","Not available","0","2018-03-23","2018-03-23 06:35:58","2018-03-23 06:35:58");
INSERT INTO property_dates VALUES("286","13","Not available","0","2018-03-24","2018-03-23 06:35:58","2018-03-23 06:35:58");
INSERT INTO property_dates VALUES("287","13","Not available","0","2018-03-25","2018-03-23 06:35:58","2018-03-23 06:35:58");
INSERT INTO property_dates VALUES("288","13","Not available","0","2018-03-26","2018-03-23 06:35:58","2018-03-23 06:35:58");
INSERT INTO property_dates VALUES("289","13","Not available","0","2018-03-28","2018-03-23 06:38:21","2018-03-23 06:38:21");
INSERT INTO property_dates VALUES("290","13","Not available","0","2018-03-29","2018-03-23 06:38:21","2018-03-23 06:38:21");
INSERT INTO property_dates VALUES("291","13","Not available","0","2018-03-27","2018-03-23 08:05:25","2018-03-23 08:05:25");
INSERT INTO property_dates VALUES("292","14","Not available","0","2018-03-24","2018-03-23 09:42:38","2018-03-23 09:42:38");
INSERT INTO property_dates VALUES("293","14","Not available","0","2018-03-25","2018-03-23 09:42:38","2018-03-23 09:42:38");
INSERT INTO property_dates VALUES("294","14","Not available","0","2018-03-26","2018-03-23 09:42:38","2018-03-23 09:42:38");
INSERT INTO property_dates VALUES("295","14","Not available","0","2018-03-27","2018-03-23 09:42:38","2018-03-23 09:42:38");
INSERT INTO property_dates VALUES("296","13","Not available","0","2018-04-01","2018-03-31 08:06:18","2018-03-31 08:06:18");
INSERT INTO property_dates VALUES("297","13","Not available","0","2018-04-02","2018-03-31 08:06:18","2018-03-31 08:06:18");
INSERT INTO property_dates VALUES("299","15","Not available","0","2018-03-31","2018-03-31 11:02:56","2018-03-31 11:02:56");
INSERT INTO property_dates VALUES("300","15","Not available","0","2018-04-01","2018-03-31 11:02:56","2018-03-31 11:02:56");
INSERT INTO property_dates VALUES("301","15","Not available","0","2018-04-02","2018-03-31 11:02:56","2018-03-31 11:02:56");
INSERT INTO property_dates VALUES("302","16","Not available","0","2018-04-08","2018-03-31 11:11:05","2018-03-31 11:11:05");
INSERT INTO property_dates VALUES("303","16","Not available","0","2018-04-09","2018-03-31 11:11:05","2018-03-31 11:11:05");
INSERT INTO property_dates VALUES("304","16","Not available","0","2018-04-10","2018-03-31 11:25:37","2018-03-31 11:25:37");
INSERT INTO property_dates VALUES("305","16","Not available","0","2018-04-11","2018-03-31 11:25:37","2018-03-31 11:25:37");
INSERT INTO property_dates VALUES("309","18","Not available","10","2018-04-01","2018-04-01 05:28:09","2018-04-01 07:07:30");
INSERT INTO property_dates VALUES("308","14","Not available","0","2018-03-29","2018-03-30 12:03:51","2018-03-31 12:03:51");
INSERT INTO property_dates VALUES("310","18","Available","10","2018-04-02","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("311","18","Available","10","2018-04-03","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("312","18","Available","10","2018-04-04","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("313","18","Available","10","2018-04-05","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("314","18","Available","10","2018-04-06","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("315","18","Available","10","2018-04-07","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("316","18","Available","10","2018-04-08","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("317","18","Available","10","2018-04-09","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("318","18","Available","10","2018-04-10","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("319","18","Available","10","2018-04-11","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("320","18","Available","10","2018-04-12","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("321","18","Available","10","2018-04-13","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("322","18","Available","10","2018-04-14","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("323","18","Available","10","2018-04-15","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("324","18","Available","10","2018-04-16","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("325","18","Available","10","2018-04-17","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("326","18","Available","10","2018-04-18","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("327","18","Available","10","2018-04-19","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("328","18","Available","10","2018-04-20","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("329","18","Available","10","2018-04-21","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("330","18","Available","10","2018-04-22","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("331","18","Available","10","2018-04-23","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("332","18","Available","10","2018-04-24","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("333","18","Available","10","2018-04-25","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("334","18","Available","10","2018-04-26","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("335","18","Available","10","2018-04-27","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("336","18","Available","10","2018-04-28","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("337","18","Available","10","2018-04-29","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("338","18","Available","10","2018-04-30","2018-04-01 05:28:09","2018-04-01 05:55:46");
INSERT INTO property_dates VALUES("339","19","Available","11","2018-04-01","2018-04-01 06:38:41","2018-04-01 07:23:26");
INSERT INTO property_dates VALUES("340","19","Available","11","2018-04-02","2018-04-01 06:38:51","2018-04-01 07:23:36");
INSERT INTO property_dates VALUES("341","22","Available","10","2018-04-16","2018-04-02 05:03:45","2018-04-02 05:03:45");
INSERT INTO property_dates VALUES("342","23","Available","10","2018-04-23","2018-04-02 06:16:45","2018-04-02 06:16:45");
INSERT INTO property_dates VALUES("343","23","Not available","10","2018-05-03","2018-04-02 06:19:41","2018-04-02 06:19:41");
INSERT INTO property_dates VALUES("344","23","Not available","10","2018-05-01","2018-04-02 06:20:07","2018-04-02 06:20:07");
INSERT INTO property_dates VALUES("345","22","Not available","10","2018-05-03","2018-04-02 06:23:43","2018-04-02 06:23:43");
INSERT INTO property_dates VALUES("346","18","Available","10","2018-05-01","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("347","18","Available","10","2018-05-02","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("348","18","Available","10","2018-05-03","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("349","18","Available","10","2018-05-04","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("350","18","Available","10","2018-05-05","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("351","18","Available","10","2018-05-06","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("352","18","Available","10","2018-05-07","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("353","18","Available","10","2018-05-08","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("354","18","Available","10","2018-05-09","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("355","18","Available","10","2018-05-10","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("356","18","Available","10","2018-05-11","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("357","18","Available","10","2018-05-12","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("358","18","Available","10","2018-05-13","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("359","18","Available","10","2018-05-14","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("360","18","Available","10","2018-05-15","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("361","18","Available","10","2018-05-16","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("362","18","Available","10","2018-05-17","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("363","18","Available","10","2018-05-18","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("364","18","Available","10","2018-05-19","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("365","18","Available","10","2018-05-20","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("366","18","Available","10","2018-05-21","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("367","18","Available","10","2018-05-22","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("368","18","Available","10","2018-05-23","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("369","18","Available","10","2018-05-24","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("370","18","Available","10","2018-05-25","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("371","18","Available","10","2018-05-26","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("372","18","Available","10","2018-05-27","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("373","18","Available","10","2018-05-28","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("374","18","Available","10","2018-05-29","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("375","18","Available","10","2018-05-30","2018-04-02 09:28:54","2018-04-02 09:29:26");
INSERT INTO property_dates VALUES("376","18","Available","10","2018-05-31","2018-04-02 09:28:54","2018-04-02 09:29:26");





CREATE TABLE IF NOT EXISTS `property_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `place_is_great_for` text COLLATE utf8_unicode_ci,
  `about_place` text COLLATE utf8_unicode_ci,
  `guest_can_access` text COLLATE utf8_unicode_ci,
  `interaction_guests` text COLLATE utf8_unicode_ci,
  `other` text COLLATE utf8_unicode_ci,
  `about_neighborhood` text COLLATE utf8_unicode_ci,
  `get_around` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_description VALUES("1","1","This a property","","","","","","","");
INSERT INTO property_description VALUES("2","2","Test","","","","","","","");
INSERT INTO property_description VALUES("3","3","","","","","","","","");
INSERT INTO property_description VALUES("4","4","","","","","","","","");
INSERT INTO property_description VALUES("5","5","Test","","","","","","","");
INSERT INTO property_description VALUES("6","6","Entire home/apt in New Delhi","","","","","","","");
INSERT INTO property_description VALUES("7","7","Private room in New Delhi","","","","","","","");
INSERT INTO property_description VALUES("8","8","Entire home/apt in New York","","","","","","","");
INSERT INTO property_description VALUES("9","9","New York City","","","","","","","");
INSERT INTO property_description VALUES("10","10","Private Room In Sydney","","","","","","","");
INSERT INTO property_description VALUES("11","11","Entire home/apt in New York","","","","","","","");
INSERT INTO property_description VALUES("12","12","Entire home/apt in New York","","","","","","","");
INSERT INTO property_description VALUES("13","13","Entire home/apt in Dhaka","","","","","","","");
INSERT INTO property_description VALUES("14","14","Entire home/apt in Pabna","Awesome air blow.","Its located at dhaka.","Any time guest can access","Awesome communication way.","Yes Noticable","Best Place to view","Nice Place");
INSERT INTO property_description VALUES("15","15","Entire home/apt in London","","","","","","","");
INSERT INTO property_description VALUES("16","16","London","","","","","","","");
INSERT INTO property_description VALUES("17","17","Brazil","","","","","","","");
INSERT INTO property_description VALUES("18","18","Dhaka University Dhaka","","","","","","","");
INSERT INTO property_description VALUES("19","19","Entire home/apt in Barcelona","","","","","","","");
INSERT INTO property_description VALUES("20","20","","","","","","","","");
INSERT INTO property_description VALUES("21","21","","","","","","","","");
INSERT INTO property_description VALUES("22","22","Entire home/apt in Pabna","","","","","","","");
INSERT INTO property_description VALUES("23","23","Entire home/apt in Dhaka","","","","","","","");





CREATE TABLE IF NOT EXISTS `property_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `field` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `property_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_fees VALUES("1","more_then_seven","0");
INSERT INTO property_fees VALUES("2","less_then_seven","0");
INSERT INTO property_fees VALUES("3","host_service_charge","0");
INSERT INTO property_fees VALUES("4","guest_service_charge","5");
INSERT INTO property_fees VALUES("5","cancel_limit","0");
INSERT INTO property_fees VALUES("6","currency","USD");
INSERT INTO property_fees VALUES("7","host_penalty","0");





CREATE TABLE IF NOT EXISTS `property_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(105) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_photo` int(11) NOT NULL DEFAULT '0',
  `serial` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_photos VALUES("3","2","1517987764_hotel_room4.jpg","","0","10");
INSERT INTO property_photos VALUES("2","1","1517986829_hotel_room3.jpg","","1","3");
INSERT INTO property_photos VALUES("4","2","1517988458_img_400_300.jpg","","0","6");
INSERT INTO property_photos VALUES("5","2","1517995775_cycle_400_300.jpg","","1","1");
INSERT INTO property_photos VALUES("7","2","1518004392_hotel_room1.jpg","","0","3");
INSERT INTO property_photos VALUES("8","2","1518004460_img_400_300.jpg","","0","2");
INSERT INTO property_photos VALUES("9","2","1518004866_slide-6.png","","0","11");
INSERT INTO property_photos VALUES("10","3","1518004974_img_400_300.jpg","","1","1");
INSERT INTO property_photos VALUES("11","3","1518004996_hdel.jpg","","0","2");
INSERT INTO property_photos VALUES("19","1","1518086462_8318812592_3bf18a4518_b.jpg","","0","1");
INSERT INTO property_photos VALUES("15","5","1518066390_hotel_room4.jpg","","1","1");
INSERT INTO property_photos VALUES("12","4","1518061417_hotel_room4.jpg","","1","55");
INSERT INTO property_photos VALUES("21","6","1518509991_hotel_room1.jpg","","1","1");
INSERT INTO property_photos VALUES("13","4","1518061517_cycle_400_300.jpg","","0","26");
INSERT INTO property_photos VALUES("14","4","1518062472_hotel_room2.jpg","","0","3");
INSERT INTO property_photos VALUES("16","5","1518066398_hotel_room2.jpg","","0","2");
INSERT INTO property_photos VALUES("17","5","1518066420_cycle_400_300.jpg","","0","4");
INSERT INTO property_photos VALUES("18","5","1518066428_hotel_room1.jpg","","0","4");
INSERT INTO property_photos VALUES("20","1","1518086499_37cb3942e6b4bc587ca7233f34c4cf4f.jpg","","0","2");
INSERT INTO property_photos VALUES("22","6","1518510001_cycle_400_300.jpg","","0","2");
INSERT INTO property_photos VALUES("23","7","1519643361_travel.jpg.jpg","","1","1");
INSERT INTO property_photos VALUES("24","7","1519643387_01.jpg","","0","2");
INSERT INTO property_photos VALUES("26","7","1519643793_1280px-Sixty_Dome_Mosque,Bagerhat.jpg","","0","3");
INSERT INTO property_photos VALUES("27","8","1519645871_environment.jpg","","1","1");
INSERT INTO property_photos VALUES("28","9","1519886599_37cb3942e6b4bc587ca7233f34c4cf4f.jpg","","1","1");
INSERT INTO property_photos VALUES("29","9","1519886613_1280px-Sixty_Dome_Mosque,Bagerhat.jpg","","0","2");
INSERT INTO property_photos VALUES("30","9","1519886623_8318812592_3bf18a4518_b.jpg","","0","2");
INSERT INTO property_photos VALUES("31","9","1519886655_12497074484_b75e5db667_b.jpg","","0","4");
INSERT INTO property_photos VALUES("32","11","1520231098_1-alcazar-seville-cr-visions-of-our-land-getty.jpg","","1","1");
INSERT INTO property_photos VALUES("33","12","1521783463_Barcelona-Cafes.jpg","","1","1");
INSERT INTO property_photos VALUES("34","12","1521783469_0221-unions-disney-04.jpg","","0","2");
INSERT INTO property_photos VALUES("35","13","1521786112_masthead-the-charles-hotel-harvard-square.jpg","","1","1");
INSERT INTO property_photos VALUES("36","13","1521786119_cleopatra-palace-hotel-mare-nostrum-resort-1.jpg","","0","2");
INSERT INTO property_photos VALUES("37","14","1521792794_Pabna-University-of-Science-and-Technology-PUST.jpg","","1","1");
INSERT INTO property_photos VALUES("38","15","1522488650_maxresdefault.jpg","","0","2");
INSERT INTO property_photos VALUES("39","15","1522488685_sairu-hill-resorts.jpg","","1","0");
INSERT INTO property_photos VALUES("40","15","1522488722_Nilachal-Hill-Bandarban-Bangladesh-01.jpg","","0","3");
INSERT INTO property_photos VALUES("41","16","1522490103_sairu-hill-resorts.jpg","","1","1");
INSERT INTO property_photos VALUES("42","16","1522490123_sajek.jpg","","0","2");
INSERT INTO property_photos VALUES("43","17","1522495201_sajek.jpg","","1","1");
INSERT INTO property_photos VALUES("44","18","1522559060_cleopatra-palace-hotel-mare-nostrum-resort-1.jpg","","1","1");
INSERT INTO property_photos VALUES("48","19","1522566054_wheel.jpg","","1","3");
INSERT INTO property_photos VALUES("46","19","1522564502_images.jpg","","0","3");
INSERT INTO property_photos VALUES("47","19","1522564528_ZMSI_spain_barcelona_guell-park-mosaic.jpg","","0","1");
INSERT INTO property_photos VALUES("49","22","1522645339_24itc5.jpg","","1","1");
INSERT INTO property_photos VALUES("50","22","1522645347_cleopatra-palace-hotel-mare-nostrum-resort-1.jpg","","0","2");
INSERT INTO property_photos VALUES("51","23","1522649489_Barcelona-Cafes.jpg","","1","1");





CREATE TABLE IF NOT EXISTS `property_price` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `cleaning_fee` int(11) NOT NULL DEFAULT '0',
  `guest_after` int(11) NOT NULL DEFAULT '0',
  `guest_fee` int(11) NOT NULL DEFAULT '0',
  `security_fee` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `weekend_price` int(11) NOT NULL DEFAULT '0',
  `weekly_discount` int(11) NOT NULL DEFAULT '0',
  `monthly_discount` int(11) NOT NULL DEFAULT '0',
  `currency_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_price VALUES("1","1","0","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("2","2","0","0","0","0","0","0","0","0","USD");
INSERT INTO property_price VALUES("3","3","0","0","0","0","0","0","0","0","USD");
INSERT INTO property_price VALUES("4","4","0","0","0","0","0","0","0","0","USD");
INSERT INTO property_price VALUES("5","5","0","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("6","6","0","1","0","0","100","0","0","0","PHP");
INSERT INTO property_price VALUES("7","7","1","1","0","0","10","0","2","4","MYR");
INSERT INTO property_price VALUES("8","8","0","1","0","0","10","0","0","0","MYR");
INSERT INTO property_price VALUES("9","9","5","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("10","10","0","0","0","0","0","0","0","0","MYR");
INSERT INTO property_price VALUES("11","11","0","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("12","12","0","1","0","0","10","0","0","0","USD");
INSERT INTO property_price VALUES("13","13","20","1","20","20","20","20","0","0","BRL");
INSERT INTO property_price VALUES("14","14","0","1","0","0","5","0","0","0","BRL");
INSERT INTO property_price VALUES("15","15","10","1","10","10","20","20","0","0","BRL");
INSERT INTO property_price VALUES("16","16","15","1","10","10","20","20","0","0","BRL");
INSERT INTO property_price VALUES("17","17","10","1","10","10","20","20","0","0","BRL");
INSERT INTO property_price VALUES("18","18","0","1","0","0","10","0","0","0","USD");
INSERT INTO property_price VALUES("19","19","5","1","15","10","10","30","0","0","EUR");
INSERT INTO property_price VALUES("20","20","0","0","0","0","0","0","0","0","SGD");
INSERT INTO property_price VALUES("21","21","0","0","0","0","0","0","0","0","SGD");
INSERT INTO property_price VALUES("22","22","0","1","0","0","10","0","0","0","SGD");
INSERT INTO property_price VALUES("23","23","0","1","0","0","10","0","0","0","USD");





CREATE TABLE IF NOT EXISTS `property_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `rules` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `property_steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `basics` int(11) NOT NULL DEFAULT '0',
  `description` int(11) NOT NULL DEFAULT '0',
  `location` int(11) NOT NULL DEFAULT '0',
  `photos` int(11) NOT NULL DEFAULT '0',
  `pricing` int(11) NOT NULL DEFAULT '0',
  `booking` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_steps VALUES("1","1","0","1","1","1","1","1");
INSERT INTO property_steps VALUES("2","2","1","1","1","1","0","0");
INSERT INTO property_steps VALUES("3","3","1","0","0","1","0","0");
INSERT INTO property_steps VALUES("4","4","0","0","0","1","0","0");
INSERT INTO property_steps VALUES("5","5","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("6","6","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("7","7","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("8","8","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("9","9","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("10","10","1","1","0","0","0","0");
INSERT INTO property_steps VALUES("11","11","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("12","12","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("13","13","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("14","14","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("15","15","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("16","16","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("17","17","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("18","18","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("19","19","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("20","20","1","0","0","0","0","0");
INSERT INTO property_steps VALUES("21","21","1","0","0","0","0","0");
INSERT INTO property_steps VALUES("22","22","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("23","23","1","1","1","1","1","1");





CREATE TABLE IF NOT EXISTS `property_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_type VALUES("1","Apartment","Apartment","Active");
INSERT INTO property_type VALUES("2","House","House","Active");
INSERT INTO property_type VALUES("3","Bed & Break Fast","Bed & Break Fast","Active");
INSERT INTO property_type VALUES("5","Townhouse","Townhouse","Active");
INSERT INTO property_type VALUES("6","Condominium","Condominium","Active");
INSERT INTO property_type VALUES("7","Bungalow","Bungalow","Active");
INSERT INTO property_type VALUES("8","Cabin","Cabin","Active");
INSERT INTO property_type VALUES("9","Villa","Villa","Active");
INSERT INTO property_type VALUES("10","Castle","Castle","Active");
INSERT INTO property_type VALUES("11","Dorm","Dorm","Active");
INSERT INTO property_type VALUES("12","Treehouse","Treehouse","Active");
INSERT INTO property_type VALUES("13","Boat","Boat","Active");
INSERT INTO property_type VALUES("14","Plane","Plane","Active");
INSERT INTO property_type VALUES("15","Camper/RV","Camper/RV","Active");
INSERT INTO property_type VALUES("16","Lgloo","Lgloo","Active");
INSERT INTO property_type VALUES("17","Lighthouse","Lighthouse","Active");
INSERT INTO property_type VALUES("18","Yurt","Yurt","Active");
INSERT INTO property_type VALUES("19","Tipi","Tipi","Active");
INSERT INTO property_type VALUES("20","Cave","Cave","Active");
INSERT INTO property_type VALUES("21","Island","Island","Active");
INSERT INTO property_type VALUES("22","Chalet","Chalet","Active");
INSERT INTO property_type VALUES("23","Earth House","Earth House","Active");
INSERT INTO property_type VALUES("24","Hut","Hut","Active");
INSERT INTO property_type VALUES("25","Train","Train","Active");
INSERT INTO property_type VALUES("26","Tent","Tent","Active");
INSERT INTO property_type VALUES("27","Other","Other","Active");





CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `status` enum('unsolved','solved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unsolved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `reviewer` enum('guest','host') COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `secret_feedback` text COLLATE utf8_unicode_ci,
  `comments` text COLLATE utf8_unicode_ci,
  `improve_message` text COLLATE utf8_unicode_ci,
  `rating` int(11) DEFAULT NULL,
  `accuracy` int(11) DEFAULT NULL,
  `accuracy_message` text COLLATE utf8_unicode_ci,
  `location` int(11) DEFAULT NULL,
  `location_message` text COLLATE utf8_unicode_ci,
  `communication` int(11) DEFAULT NULL,
  `communication_message` text COLLATE utf8_unicode_ci,
  `checkin` int(11) DEFAULT NULL,
  `checkin_message` text COLLATE utf8_unicode_ci,
  `cleanliness` int(11) DEFAULT NULL,
  `cleanliness_message` text COLLATE utf8_unicode_ci,
  `amenities` int(11) DEFAULT NULL,
  `amenities_message` text COLLATE utf8_unicode_ci,
  `value` int(11) DEFAULT NULL,
  `value_message` text COLLATE utf8_unicode_ci,
  `house_rules` int(11) DEFAULT NULL,
  `recommend` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO reviews VALUES("1","6","2","18","14","guest","This is test Asdf.dfdfdfddffdfsdfasdadsfdsfds","","This is another test.","Need to improve host.","4","1","Accuracy","2","Location","4","Communication","5","Arrival","4","Cleanliness","5","Amenities","1","Value","","1","2018-03-31 12:53:33","2018-04-01 04:54:18");
INSERT INTO reviews VALUES("2","6","9","19","18","host","This is not so cool place.","This is not so cool place.","","","","","","","","1","","","","1","","","","","","1","0","2018-04-01 07:11:42","2018-04-01 07:11:42");
INSERT INTO reviews VALUES("3","9","6","19","18","guest","This is not so cool place.","","This is not so cool place.","This is not so cool place.","4","2","asfdasddsfafsdafsda","2","asdfdsafsda","2","asdfdsafsda","4","asdfdsaf","2","adsfsdafd","4","asdfdsafsda","2","asdfdsafdsa","","1","2018-04-01 07:12:25","2018-04-01 07:12:57");





CREATE TABLE IF NOT EXISTS `role_admin` (
  `admin_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`admin_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO role_admin VALUES("1","1");





CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO roles VALUES("1","admin","Admin","Admin User","","");





CREATE TABLE IF NOT EXISTS `rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO rules VALUES("1","Suitable for children (2-12 years)","Active");
INSERT INTO rules VALUES("2","Suitable for infants (Under 2 years)","Active");
INSERT INTO rules VALUES("3","Suitable for pets","Active");
INSERT INTO rules VALUES("4","Smoking allowed","Active");
INSERT INTO rules VALUES("5","Events or parties allowed","Active");





CREATE TABLE IF NOT EXISTS `seo_metas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO seo_metas VALUES("1","/","Home | Vrent Home","Buy, sell and download photos","");
INSERT INTO seo_metas VALUES("2","login","Log In","Log In","");
INSERT INTO seo_metas VALUES("3","register","Register","Register","");
INSERT INTO seo_metas VALUES("4","newest","Newest Photos","Newest Photos","");
INSERT INTO seo_metas VALUES("5","forgot_password","Forgot Password","Forgot Password","");
INSERT INTO seo_metas VALUES("6","dashboard","Feeds","Feeds","");
INSERT INTO seo_metas VALUES("7","uploads","Uploads","Uploads","");
INSERT INTO seo_metas VALUES("8","notification","Notification","Notification","");
INSERT INTO seo_metas VALUES("9","profile","Profile","Profile","");
INSERT INTO seo_metas VALUES("10","profile/{id}","Profile","Profile","");
INSERT INTO seo_metas VALUES("11","manage-photos","Manage Photos","Manage Photos","");
INSERT INTO seo_metas VALUES("12","earning","Earning","Earning","");
INSERT INTO seo_metas VALUES("13","purchase","Purchase","Purchase","");
INSERT INTO seo_metas VALUES("14","settings","Settings","Settings","");
INSERT INTO seo_metas VALUES("15","settings/account","Settings","Settings","");
INSERT INTO seo_metas VALUES("16","settings/payment","Settings","Settings","");
INSERT INTO seo_metas VALUES("17","photo/single/{id}","Photo Single","Photo Single","");
INSERT INTO seo_metas VALUES("18","payments/success","Payment Success","Payment Success","");
INSERT INTO seo_metas VALUES("19","payments/cancel","Payment Cancel","Payment Cancel","");
INSERT INTO seo_metas VALUES("20","profile-uploads/{type}","Profile Uploads","Profile Uploads","");
INSERT INTO seo_metas VALUES("21","photo-details/{id}","Photo Details","Photo Details","");
INSERT INTO seo_metas VALUES("22","withdraws","Withdraws","Withdraws","");
INSERT INTO seo_metas VALUES("23","photos/download/{id}","Photos Download","Photos Download","");
INSERT INTO seo_metas VALUES("24","users/reset_password/{secret?}","Reset Password","Reset Password","");
INSERT INTO seo_metas VALUES("25","search/{word}","Search Result","Search Result","");
INSERT INTO seo_metas VALUES("26","search/user/{word}","Search User Result","Search User Result","");
INSERT INTO seo_metas VALUES("27","signup","Signup","Signup","");
INSERT INTO seo_metas VALUES("28","property/create","Create New Property","Create New Property","");
INSERT INTO seo_metas VALUES("29","listing/{id}/{step}","Property Listing","Property Listing","");
INSERT INTO seo_metas VALUES("30","properties","Properties","Properties","");
INSERT INTO seo_metas VALUES("31","my_bookings","My Bookings","My Bookings","");
INSERT INTO seo_metas VALUES("32","trips/active","Your Trips","Your Trips","");
INSERT INTO seo_metas VALUES("33","users/profile","Edit Profile","Edit Profile","");
INSERT INTO seo_metas VALUES("34","users/account_preferences","Account Preferences","Account Preferences","");
INSERT INTO seo_metas VALUES("35","users/transaction_history","Transaction History","Transaction History","");
INSERT INTO seo_metas VALUES("36","users/security","Security","Security","");
INSERT INTO seo_metas VALUES("37","search","Search","Search","");
INSERT INTO seo_metas VALUES("38","inbox","Inbox","Inbox","");
INSERT INTO seo_metas VALUES("39","users/profile/media","Profile Photo","Profile Photo","");
INSERT INTO seo_metas VALUES("40","booking/requested","Payment Completed","Payment Completed","");





CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO settings VALUES("1","name","Vrent","general");
INSERT INTO settings VALUES("2","logo","logo.png","general");
INSERT INTO settings VALUES("3","favicon","favicon.ico","general");
INSERT INTO settings VALUES("4","head_code","","general");
INSERT INTO settings VALUES("5","default_currency","5","general");
INSERT INTO settings VALUES("6","default_language","3","general");
INSERT INTO settings VALUES("7","email_logo","email_logo.png","general");
INSERT INTO settings VALUES("8","username","techvillage_business_api1.gmail.com","PayPal");
INSERT INTO settings VALUES("9","password","9DDYZX2JLA6QL668","PayPal");
INSERT INTO settings VALUES("10","signature","AFcWxV21C7fd0v3bYYYRCpSSRl31ABayz5pdk84jno7.Udj6-U8ffwbT","PayPal");
INSERT INTO settings VALUES("11","mode","sandbox","PayPal");
INSERT INTO settings VALUES("12","publishable","pk_test_c2TDWXsjPkimdM8PIltO6d8H","Stripe");
INSERT INTO settings VALUES("13","secret","sk_test_UWTgGYIdj8igmbVMgTi0ILPm","Stripe");
INSERT INTO settings VALUES("14","driver","smtp","email");
INSERT INTO settings VALUES("15","host","smtp.gmail.com","email");
INSERT INTO settings VALUES("16","port","587","email");
INSERT INTO settings VALUES("17","from_address","stockpile.techvill@gmail.com","email");
INSERT INTO settings VALUES("18","from_name","stockpile.techvill@gmail.com","email");
INSERT INTO settings VALUES("19","encryption","tls","email");
INSERT INTO settings VALUES("20","username","stockpile.techvill@gmail.com","email");
INSERT INTO settings VALUES("21","password","xgldhlpedszmglvj","email");
INSERT INTO settings VALUES("22","facebook","#","join_us");
INSERT INTO settings VALUES("23","google_plus","#","join_us");
INSERT INTO settings VALUES("24","twitter","#","join_us");
INSERT INTO settings VALUES("25","linkedin","#","join_us");
INSERT INTO settings VALUES("26","pinterest","#","join_us");
INSERT INTO settings VALUES("27","youtube","#","join_us");
INSERT INTO settings VALUES("28","instagram","#","join_us");
INSERT INTO settings VALUES("29","key","AIzaSyAbXN-nzWC9zwj7Nn_XmsSx5dh8AjFApBI","googleMap");
INSERT INTO settings VALUES("30","client_id","383114162181-ck3ridv4vmm9jgsk2lhl9rmcg88mpvhq.apps.googleusercontent.com","google");
INSERT INTO settings VALUES("31","client_secret","SH9NmcJ0DyoOrNgv0hDtITJg","google");
INSERT INTO settings VALUES("32","client_id","2063256323956458","facebook");
INSERT INTO settings VALUES("33","client_secret","d80735c1ef694bcd57c3467b8295ed68","facebook");





CREATE TABLE IF NOT EXISTS `space_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO space_type VALUES("1","Entire home/apt","Entire home/apt","Active");
INSERT INTO space_type VALUES("2","Private room","Private room","Active");
INSERT INTO space_type VALUES("3","Shared room","Shared room","Active");





CREATE TABLE IF NOT EXISTS `starting_cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO starting_cities VALUES("1","New York","starting_city_1.jpg","Active");
INSERT INTO starting_cities VALUES("2","Sydney","starting_city_2.jpg","Active");
INSERT INTO starting_cities VALUES("3","Paris","starting_city_3.jpg","Active");
INSERT INTO starting_cities VALUES("4","Barcelona","starting_city_4.jpg","Active");
INSERT INTO starting_cities VALUES("5","Berlin","starting_city_5.jpg","Active");
INSERT INTO starting_cities VALUES("6","Budapest","starting_city_6.jpg","Active");





CREATE TABLE IF NOT EXISTS `timezone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO timezone VALUES("1","(GMT-11:00) International Date Line West","Pacific/Kwajalein");
INSERT INTO timezone VALUES("2","(GMT-11:00) Midway Island","Pacific/Midway");
INSERT INTO timezone VALUES("3","(GMT-11:00) Samoa","Pacific/Samoa");
INSERT INTO timezone VALUES("4","(GMT-10:00) Hawaii","Pacific/Honolulu");
INSERT INTO timezone VALUES("5","(GMT-10:00) Pacific/Honolulu","Pacific/Honolulu");
INSERT INTO timezone VALUES("6","(GMT-09:00) Alaska","US/Alaska");
INSERT INTO timezone VALUES("7","(GMT-08:00) America/Los_Angeles","America/Los_Angeles");
INSERT INTO timezone VALUES("8","(GMT-08:00) Pacific Time (US &amp; Canada)","America/Los_Angeles");
INSERT INTO timezone VALUES("9","(GMT-08:00) Tijuana","America/Tijuana");
INSERT INTO timezone VALUES("10","(GMT-07:00) America/Denver","America/Denver");
INSERT INTO timezone VALUES("11","(GMT-07:00) America/Phoenix","America/Phoenix");
INSERT INTO timezone VALUES("12","(GMT-07:00) Arizona","US/Arizona");
INSERT INTO timezone VALUES("13","(GMT-07:00) Chihuahua","America/Chihuahua");
INSERT INTO timezone VALUES("14","(GMT-07:00) Mazatlan","America/Mazatlan");
INSERT INTO timezone VALUES("15","(GMT-07:00) Mountain Time (US &amp; Canada)","US/Mountain");
INSERT INTO timezone VALUES("16","(GMT-06:00) America/Chicago","America/Chicago");
INSERT INTO timezone VALUES("17","(GMT-06:00) America/Mexico_City","America/Mexico_City");
INSERT INTO timezone VALUES("18","(GMT-06:00) Central America","America/Managua");
INSERT INTO timezone VALUES("19","(GMT-06:00) Central Time (US &amp; Canada)","US/Central");
INSERT INTO timezone VALUES("20","(GMT-06:00) Guadalajara","America/Mexico_City");
INSERT INTO timezone VALUES("21","(GMT-06:00) Mexico City","America/Mexico_City");
INSERT INTO timezone VALUES("22","(GMT-06:00) Monterrey","America/Monterrey");
INSERT INTO timezone VALUES("23","(GMT-06:00) Saskatchewan","Canada/Saskatchewan");
INSERT INTO timezone VALUES("24","(GMT-05:00) America/Nassau","America/Nassau");
INSERT INTO timezone VALUES("25","(GMT-05:00) America/New_York","America/New_York");
INSERT INTO timezone VALUES("26","(GMT-05:00) America/Port-au-Prince","America/Port-au-Prince");
INSERT INTO timezone VALUES("27","(GMT-05:00) America/Toronto","America/Toronto");
INSERT INTO timezone VALUES("28","(GMT-05:00) Bogota","America/Bogota");
INSERT INTO timezone VALUES("29","(GMT-05:00) Eastern Time (US &amp; Canada)","US/Eastern");
INSERT INTO timezone VALUES("30","(GMT-05:00) Indiana (East)","US/East-Indiana");
INSERT INTO timezone VALUES("31","(GMT-05:00) Lima","America/Lima");
INSERT INTO timezone VALUES("32","(GMT-05:00) Quito","America/Bogota");
INSERT INTO timezone VALUES("33","(GMT-04:30) Caracas","America/Caracas");
INSERT INTO timezone VALUES("34","(GMT-04:00) Atlantic Time (Canada)","Canada/Atlantic");
INSERT INTO timezone VALUES("35","(GMT-04:00) Georgetown","America/Argentina/Buenos_Aires");
INSERT INTO timezone VALUES("36","(GMT-04:00) La Paz","America/La_Paz");
INSERT INTO timezone VALUES("37","(GMT-03:30) Newfoundland","Canada/Newfoundland");
INSERT INTO timezone VALUES("38","(GMT-03:00) America/Argentina/Buenos_Aires","America/Argentina/Buenos_Aires");
INSERT INTO timezone VALUES("39","(GMT-03:00) America/Cordoba","America/Cordoba");
INSERT INTO timezone VALUES("40","(GMT-03:00) America/Fortaleza","America/Fortaleza");
INSERT INTO timezone VALUES("41","(GMT-03:00) America/Montevideo","America/Montevideo");
INSERT INTO timezone VALUES("42","(GMT-03:00) America/Santiago","America/Santiago");
INSERT INTO timezone VALUES("43","(GMT-03:00) America/Sao_Paulo","America/Sao_Paulo");
INSERT INTO timezone VALUES("44","(GMT-03:00) Brasilia","America/Sao_Paulo");
INSERT INTO timezone VALUES("45","(GMT-03:00) Buenos Aires","America/Argentina/Buenos_Aires");
INSERT INTO timezone VALUES("46","(GMT-03:00) Greenland","America/Godthab");
INSERT INTO timezone VALUES("47","(GMT-03:00) Santiago","America/Santiago");
INSERT INTO timezone VALUES("48","(GMT-02:00) Mid-Atlantic","America/Noronha");
INSERT INTO timezone VALUES("49","(GMT-01:00) Azores","Atlantic/Azores");
INSERT INTO timezone VALUES("50","(GMT-01:00) Cape Verde Is.","Atlantic/Cape_Verde");
INSERT INTO timezone VALUES("51","(GMT+00:00) Africa/Casablanca","Africa/Casablanca");
INSERT INTO timezone VALUES("52","(GMT+00:00) Atlantic/Canary","Atlantic/Canary");
INSERT INTO timezone VALUES("53","(GMT+00:00) Atlantic/Reykjavik","Atlantic/Reykjavik");
INSERT INTO timezone VALUES("54","(GMT+00:00) Casablanca","Africa/Casablanca");
INSERT INTO timezone VALUES("55","(GMT+00:00) Dublin","Etc/Greenwich");
INSERT INTO timezone VALUES("56","(GMT+00:00) Edinburgh","Europe/London");
INSERT INTO timezone VALUES("57","(GMT+00:00) Europe/Dublin","Europe/Dublin");
INSERT INTO timezone VALUES("58","(GMT+00:00) Europe/Lisbon","Europe/Lisbon");
INSERT INTO timezone VALUES("59","(GMT+00:00) Europe/London","Europe/London");
INSERT INTO timezone VALUES("60","(GMT+00:00) Lisbon","Europe/Lisbon");
INSERT INTO timezone VALUES("61","(GMT+00:00) London","Europe/London");
INSERT INTO timezone VALUES("62","(GMT+00:00) Monrovia","Africa/Monrovia");
INSERT INTO timezone VALUES("63","(GMT+00:00) UTC","UTC");
INSERT INTO timezone VALUES("64","(GMT+01:00) Amsterdam","Europe/Amsterdam");
INSERT INTO timezone VALUES("65","(GMT+01:00) Belgrade","Europe/Belgrade");
INSERT INTO timezone VALUES("66","(GMT+01:00) Berlin","Europe/Berlin");
INSERT INTO timezone VALUES("67","(GMT+01:00) Bern","Europe/Berlin");
INSERT INTO timezone VALUES("68","(GMT+01:00) Bratislava","Europe/Bratislava");
INSERT INTO timezone VALUES("69","(GMT+01:00) Brussels","Europe/Brussels");
INSERT INTO timezone VALUES("70","(GMT+01:00) Budapest","Europe/Budapest");
INSERT INTO timezone VALUES("71","(GMT+01:00) Copenhagen","Europe/Copenhagen");
INSERT INTO timezone VALUES("72","(GMT+01:00) Europe/Amsterdam","Europe/Amsterdam");
INSERT INTO timezone VALUES("73","(GMT+01:00) Europe/Belgrade","Europe/Belgrade");
INSERT INTO timezone VALUES("74","(GMT+01:00) Europe/Berlin","Europe/Berlin");
INSERT INTO timezone VALUES("75","(GMT+01:00) Europe/Bratislava","Europe/Bratislava");
INSERT INTO timezone VALUES("76","(GMT+01:00) Europe/Brussels","Europe/Brussels");
INSERT INTO timezone VALUES("77","(GMT+01:00) Europe/Budapest","Europe/Budapest");
INSERT INTO timezone VALUES("78","(GMT+01:00) Europe/Copenhagen","Europe/Copenhagen");
INSERT INTO timezone VALUES("79","(GMT+01:00) Europe/Ljubljana","Europe/Ljubljana");
INSERT INTO timezone VALUES("80","(GMT+01:00) Europe/Madrid","Europe/Madrid");
INSERT INTO timezone VALUES("81","(GMT+01:00) Europe/Monaco","Europe/Monaco");
INSERT INTO timezone VALUES("82","(GMT+01:00) Europe/Oslo","Europe/Oslo");
INSERT INTO timezone VALUES("83","(GMT+01:00) Europe/Paris","Europe/Paris");
INSERT INTO timezone VALUES("84","(GMT+01:00) Europe/Podgorica","Europe/Podgorica");
INSERT INTO timezone VALUES("85","(GMT+01:00) Europe/Prague","Europe/Prague");
INSERT INTO timezone VALUES("86","(GMT+01:00) Europe/Rome","Europe/Rome");
INSERT INTO timezone VALUES("87","(GMT+01:00) Europe/Stockholm","Europe/Stockholm");
INSERT INTO timezone VALUES("88","(GMT+01:00) Europe/Tirane","Europe/Tirane");
INSERT INTO timezone VALUES("89","(GMT+01:00) Europe/Vienna","Europe/Vienna");
INSERT INTO timezone VALUES("90","(GMT+01:00) Europe/Warsaw","Europe/Warsaw");
INSERT INTO timezone VALUES("91","(GMT+01:00) Europe/Zagreb","Europe/Zagreb");
INSERT INTO timezone VALUES("92","(GMT+01:00) Europe/Zurich","Europe/Zurich");
INSERT INTO timezone VALUES("93","(GMT+01:00) Ljubljana","Europe/Ljubljana");
INSERT INTO timezone VALUES("94","(GMT+01:00) Madrid","Europe/Madrid");
INSERT INTO timezone VALUES("95","(GMT+01:00) Paris","Europe/Paris");
INSERT INTO timezone VALUES("96","(GMT+01:00) Prague","Europe/Prague");
INSERT INTO timezone VALUES("97","(GMT+01:00) Rome","Europe/Rome");
INSERT INTO timezone VALUES("98","(GMT+01:00) Sarajevo","Europe/Sarajevo");
INSERT INTO timezone VALUES("99","(GMT+01:00) Skopje","Europe/Skopje");
INSERT INTO timezone VALUES("100","(GMT+01:00) Stockholm","Europe/Stockholm");
INSERT INTO timezone VALUES("101","(GMT+01:00) Vienna","Europe/Vienna");
INSERT INTO timezone VALUES("102","(GMT+01:00) Warsaw","Europe/Warsaw");
INSERT INTO timezone VALUES("103","(GMT+01:00) West Central Africa","Africa/Lagos");
INSERT INTO timezone VALUES("104","(GMT+01:00) Zagreb","Europe/Zagreb");
INSERT INTO timezone VALUES("105","(GMT+02:00) Asia/Beirut","Asia/Beirut");
INSERT INTO timezone VALUES("106","(GMT+02:00) Asia/Jerusalem","Asia/Jerusalem");
INSERT INTO timezone VALUES("107","(GMT+02:00) Asia/Nicosia","Asia/Nicosia");
INSERT INTO timezone VALUES("108","(GMT+02:00) Athens","Europe/Athens");
INSERT INTO timezone VALUES("109","(GMT+02:00) Bucharest","Europe/Bucharest");
INSERT INTO timezone VALUES("110","(GMT+02:00) Cairo","Africa/Cairo");
INSERT INTO timezone VALUES("111","(GMT+02:00) Europe/Athens","Europe/Athens");
INSERT INTO timezone VALUES("112","(GMT+02:00) Europe/Helsinki","Europe/Helsinki");
INSERT INTO timezone VALUES("113","(GMT+02:00) Europe/Istanbul","Europe/Istanbul");
INSERT INTO timezone VALUES("114","(GMT+02:00) Europe/Riga","Europe/Riga");
INSERT INTO timezone VALUES("115","(GMT+02:00) Europe/Sofia","Europe/Sofia");
INSERT INTO timezone VALUES("116","(GMT+02:00) Harare","Africa/Harare");
INSERT INTO timezone VALUES("117","(GMT+02:00) Helsinki","Europe/Helsinki");
INSERT INTO timezone VALUES("118","(GMT+02:00) Istanbul","Europe/Istanbul");
INSERT INTO timezone VALUES("119","(GMT+02:00) Jerusalem","Asia/Jerusalem");
INSERT INTO timezone VALUES("120","(GMT+02:00) Kyiv","Europe/Helsinki");
INSERT INTO timezone VALUES("121","(GMT+02:00) Pretoria","Africa/Johannesburg");
INSERT INTO timezone VALUES("122","(GMT+02:00) Riga","Europe/Riga");
INSERT INTO timezone VALUES("123","(GMT+02:00) Sofia","Europe/Sofia");
INSERT INTO timezone VALUES("124","(GMT+02:00) Tallinn","Europe/Tallinn");
INSERT INTO timezone VALUES("125","(GMT+02:00) Vilnius","Europe/Vilnius");
INSERT INTO timezone VALUES("126","(GMT+03:00) Baghdad","Asia/Baghdad");
INSERT INTO timezone VALUES("127","(GMT+03:00) Europe/Minsk","Europe/Minsk");
INSERT INTO timezone VALUES("128","(GMT+03:00) Europe/Moscow","Europe/Moscow");
INSERT INTO timezone VALUES("129","(GMT+03:00) Kuwait","Asia/Kuwait");
INSERT INTO timezone VALUES("130","(GMT+03:00) Minsk","Europe/Minsk");
INSERT INTO timezone VALUES("131","(GMT+03:00) Moscow","Europe/Moscow");
INSERT INTO timezone VALUES("132","(GMT+03:00) Nairobi","Africa/Nairobi");
INSERT INTO timezone VALUES("133","(GMT+03:00) Riyadh","Asia/Riyadh");
INSERT INTO timezone VALUES("134","(GMT+03:00) St. Petersburg","Europe/Moscow");
INSERT INTO timezone VALUES("135","(GMT+03:00) Volgograd","Europe/Volgograd");
INSERT INTO timezone VALUES("136","(GMT+03:30) Tehran","Asia/Tehran");
INSERT INTO timezone VALUES("137","(GMT+04:00) Abu Dhabi","Asia/Muscat");
INSERT INTO timezone VALUES("138","(GMT+04:00) Asia/Dubai","Asia/Dubai");
INSERT INTO timezone VALUES("139","(GMT+04:00) Asia/Tbilisi","Asia/Tbilisi");
INSERT INTO timezone VALUES("140","(GMT+04:00) Baku","Asia/Baku");
INSERT INTO timezone VALUES("141","(GMT+04:00) Muscat","Asia/Muscat");
INSERT INTO timezone VALUES("142","(GMT+04:00) Tbilisi","Asia/Tbilisi");
INSERT INTO timezone VALUES("143","(GMT+04:00) Yerevan","Asia/Yerevan");
INSERT INTO timezone VALUES("144","(GMT+04:30) Kabul","Asia/Kabul");
INSERT INTO timezone VALUES("145","(GMT+05:00) Ekaterinburg","Asia/Yekaterinburg");
INSERT INTO timezone VALUES("146","(GMT+05:00) Indian/Maldives","Indian/Maldives");
INSERT INTO timezone VALUES("147","(GMT+05:00) Islamabad","Asia/Karachi");
INSERT INTO timezone VALUES("148","(GMT+05:00) Karachi","Asia/Karachi");
INSERT INTO timezone VALUES("149","(GMT+05:00) Tashkent","Asia/Tashkent");
INSERT INTO timezone VALUES("150","(GMT+05:30) Asia/Calcutta","Asia/Calcutta");
INSERT INTO timezone VALUES("151","(GMT+05:30) Asia/Colombo","Asia/Colombo");
INSERT INTO timezone VALUES("152","(GMT+05:30) Chennai","Asia/Calcutta");
INSERT INTO timezone VALUES("153","(GMT+05:30) Kolkata","Asia/Kolkata");
INSERT INTO timezone VALUES("154","(GMT+05:30) Mumbai","Asia/Calcutta");
INSERT INTO timezone VALUES("155","(GMT+05:30) New Delhi","Asia/Calcutta");
INSERT INTO timezone VALUES("156","(GMT+05:30) Sri Jayawardenepura","Asia/Calcutta");
INSERT INTO timezone VALUES("157","(GMT+05:45) Kathmandu","Asia/Katmandu");
INSERT INTO timezone VALUES("158","(GMT+06:00) Almaty","Asia/Almaty");
INSERT INTO timezone VALUES("159","(GMT+06:00) Astana","Asia/Dhaka");
INSERT INTO timezone VALUES("160","(GMT+06:00) Dhaka","Asia/Dhaka");
INSERT INTO timezone VALUES("161","(GMT+06:00) Novosibirsk","Asia/Novosibirsk");
INSERT INTO timezone VALUES("162","(GMT+06:00) Urumqi","Asia/Urumqi");
INSERT INTO timezone VALUES("163","(GMT+06:30) Rangoon","Asia/Rangoon");
INSERT INTO timezone VALUES("164","(GMT+07:00) Asia/Bangkok","Asia/Bangkok");
INSERT INTO timezone VALUES("165","(GMT+07:00) Asia/Jakarta","Asia/Jakarta");
INSERT INTO timezone VALUES("166","(GMT+07:00) Bangkok","Asia/Bangkok");
INSERT INTO timezone VALUES("167","(GMT+07:00) Hanoi","Asia/Bangkok");
INSERT INTO timezone VALUES("168","(GMT+07:00) Jakarta","Asia/Jakarta");
INSERT INTO timezone VALUES("169","(GMT+07:00) Krasnoyarsk","Asia/Krasnoyarsk");
INSERT INTO timezone VALUES("170","(GMT+08:00) Asia/Chongqing","Asia/Chongqing");
INSERT INTO timezone VALUES("171","(GMT+08:00) Asia/Hong_Kong","Asia/Hong_Kong");
INSERT INTO timezone VALUES("172","(GMT+08:00) Asia/Kuala_Lumpur","Asia/Kuala_Lumpur");
INSERT INTO timezone VALUES("173","(GMT+08:00) Asia/Macau","Asia/Macau");
INSERT INTO timezone VALUES("174","(GMT+08:00) Asia/Makassar","Asia/Makassar");
INSERT INTO timezone VALUES("175","(GMT+08:00) Asia/Shanghai","Asia/Shanghai");
INSERT INTO timezone VALUES("176","(GMT+08:00) Asia/Taipei","Asia/Taipei");
INSERT INTO timezone VALUES("177","(GMT+08:00) Beijing","Asia/Hong_Kong");
INSERT INTO timezone VALUES("178","(GMT+08:00) Chongqing","Asia/Chongqing");
INSERT INTO timezone VALUES("179","(GMT+08:00) Hong Kong","Asia/Hong_Kong");
INSERT INTO timezone VALUES("180","(GMT+08:00) Irkutsk","Asia/Irkutsk");
INSERT INTO timezone VALUES("181","(GMT+08:00) Kuala Lumpur","Asia/Kuala_Lumpur");
INSERT INTO timezone VALUES("182","(GMT+08:00) Perth","Australia/Perth");
INSERT INTO timezone VALUES("183","(GMT+08:00) Singapore","Asia/Singapore");
INSERT INTO timezone VALUES("184","(GMT+08:00) Taipei","Asia/Taipei");
INSERT INTO timezone VALUES("185","(GMT+08:00) Ulaan Bataar","Asia/Ulan_Bator");
INSERT INTO timezone VALUES("186","(GMT+09:00) Asia/Seoul","Asia/Seoul");
INSERT INTO timezone VALUES("187","(GMT+09:00) Asia/Tokyo","Asia/Tokyo");
INSERT INTO timezone VALUES("188","(GMT+09:00) Osaka","Asia/Tokyo");
INSERT INTO timezone VALUES("189","(GMT+09:00) Sapporo","Asia/Tokyo");
INSERT INTO timezone VALUES("190","(GMT+09:00) Seoul","Asia/Seoul");
INSERT INTO timezone VALUES("191","(GMT+09:00) Tokyo","Asia/Tokyo");
INSERT INTO timezone VALUES("192","(GMT+09:00) Yakutsk","Asia/Yakutsk");
INSERT INTO timezone VALUES("193","(GMT+09:30) Adelaide","Australia/Adelaide");
INSERT INTO timezone VALUES("194","(GMT+09:30) Darwin","Australia/Darwin");
INSERT INTO timezone VALUES("195","(GMT+10:00) Australia/Brisbane","Australia/Brisbane");
INSERT INTO timezone VALUES("196","(GMT+10:00) Australia/Hobart","Australia/Hobart");
INSERT INTO timezone VALUES("197","(GMT+10:00) Australia/Melbourne","Australia/Melbourne");
INSERT INTO timezone VALUES("198","(GMT+10:00) Australia/Sydney","Australia/Sydney");
INSERT INTO timezone VALUES("199","(GMT+10:00) Brisbane","Australia/Brisbane");
INSERT INTO timezone VALUES("200","(GMT+10:00) Canberra","Australia/Canberra");
INSERT INTO timezone VALUES("201","(GMT+10:00) Guam","Pacific/Guam");
INSERT INTO timezone VALUES("202","(GMT+10:00) Hobart","Australia/Hobart");
INSERT INTO timezone VALUES("203","(GMT+10:00) Magadan","Asia/Magadan");
INSERT INTO timezone VALUES("204","(GMT+10:00) Melbourne","Australia/Melbourne");
INSERT INTO timezone VALUES("205","(GMT+10:00) Port Moresby","Pacific/Port_Moresby");
INSERT INTO timezone VALUES("206","(GMT+10:00) Solomon Is.","Asia/Magadan");
INSERT INTO timezone VALUES("207","(GMT+10:00) Sydney","Australia/Sydney");
INSERT INTO timezone VALUES("208","(GMT+10:00) Vladivostok","Asia/Vladivostok");
INSERT INTO timezone VALUES("209","(GMT+11:00) New Caledonia","Asia/Magadan");
INSERT INTO timezone VALUES("210","(GMT+12:00) Auckland","Pacific/Auckland");
INSERT INTO timezone VALUES("211","(GMT+12:00) Fiji","Pacific/Fiji");
INSERT INTO timezone VALUES("212","(GMT+12:00) Kamchatka","Asia/Kamchatka");
INSERT INTO timezone VALUES("213","(GMT+12:00) Marshall Is.","Pacific/Fiji");
INSERT INTO timezone VALUES("214","(GMT+12:00) Pacific/Auckland","Pacific/Auckland");
INSERT INTO timezone VALUES("215","(GMT+12:00) Wellington","Pacific/Auckland");
INSERT INTO timezone VALUES("216","(GMT+13:00) Nuku&#39;alofa","Pacific/Tongatapu");





CREATE TABLE IF NOT EXISTS `user_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `field` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO user_details VALUES("1","1","google_id","112145424834638445243");
INSERT INTO user_details VALUES("2","2","date_of_birth","1986-6-16");
INSERT INTO user_details VALUES("3","3","date_of_birth","1966-5-11");
INSERT INTO user_details VALUES("4","4","date_of_birth","1994-7-16");
INSERT INTO user_details VALUES("5","5","date_of_birth","1994-7-16");
INSERT INTO user_details VALUES("6","6","date_of_birth","1990-6-5");
INSERT INTO user_details VALUES("7","7","date_of_birth","2014-4-12");
INSERT INTO user_details VALUES("8","8","date_of_birth","2006-5-13");
INSERT INTO user_details VALUES("9","9","date_of_birth","1958-9-9");
INSERT INTO user_details VALUES("10","4","gender","Female");
INSERT INTO user_details VALUES("11","4","about","Hi this is Borna.");
INSERT INTO user_details VALUES("12","4","live","Dhaka, Bangladesh");
INSERT INTO user_details VALUES("13","6","live","Dhaka");
INSERT INTO user_details VALUES("14","6","about","I am a software engineer.");





CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `profile_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users VALUES("1","Shahin","Alam","shahin.techvill@gmail.com","","","0","Active","","2018-03-22 05:52:26","2018-03-22 05:52:26");
INSERT INTO users VALUES("2","sohel","kha","sohel@gmail.com","$2y$10$R/6hjn6KOdMpynFyjI0r.u1rtPueNcN1VQUEM1.iLzfV/3NMaqcgS","","0","Active","vhkAiCIHwt4tmnlBY4WwoeA2rHUMwW0Nbr7zBXOLr6dBhHtxIYbw2KGTIbEe","2018-03-23 05:06:58","2018-03-23 05:06:58");
INSERT INTO users VALUES("3","srijon","Islam","srijon@gmail.com","$2y$10$ybcNAH7Wl7cbMrgFPFMnCuXYfCA3Xq4jV9gkRx0VXJHToMWHro6LG","","0","Active","xjce4iQ5U8HbXhx2S1MhJ0M7Zu6AqhhgsrxhqEdO3YHHOiFHFqmlOtEOEyUd","2018-03-23 05:41:20","2018-03-23 05:41:20");
INSERT INTO users VALUES("4","Farzana","borna","borna.techvill@gmail.com","$2y$10$TIo3Hy27HDAkORCAoRQI7.tLhRMXeY.b16XL/zG82vQ.TrEikdXTK","profile_1522562861.jpg","0","Active","swlNXBaZCdUGqzkFQu8XzdBX424z8TrqZIjwRT7Omkki5QoJ7R9XiS9JZ6Vp","2018-03-31 09:50:44","2018-04-01 06:07:41");
INSERT INTO users VALUES("5","Borna","bornaly","borna606@gmail.com","$2y$10$aMStwnnfeLU8Xluywxfk2ueeUwabdIqomDUJhJxzmtf0sBBiUob66","","0","Active","dfnlOit1kpNDP5uYU1i5qYOSqPqcU4sIj4KFh3yQH8BRS9QiT0G319lKpxLV","2018-03-31 09:57:46","2018-03-31 09:57:46");
INSERT INTO users VALUES("6","Nipam","khan","nipam@gmail.com","$2y$10$lzZNNvdQhIf0EoY1TV2yGOS9EZkaaB17.mywFLoz/1pH.sXVRMdbK","profile_1522567122.png","0","Active","uJCnxqHfGW4FXKB82nROkk9P0fRICSHCF0x5L8CAChpbnWiJnlmUmSkBnrtX","2018-03-31 10:37:19","2018-04-01 07:18:42");
INSERT INTO users VALUES("7","mariam","mitu","mariamakter@gmail.com","$2y$10$tU15GWaiQsNQEG7GyiAsG.Z4Y2N9fCpdGh4Iy.BgSO97YmjWF0rCq","","0","Active","PyUFhNCyAgP8tGcMn5IatrctOoEtqNuj3I9mhvouhMgA9kHb1OADTy8NE6Np","2018-03-31 10:55:06","2018-03-31 10:55:06");
INSERT INTO users VALUES("8","risa","risa","risa@yahoo.com","$2y$10$jWFHRhxcTJuawBAoL.ecJeagxAtZezOFYIgB51J.hg1GGe8lpQ1Xy","","0","Active","iRq4o6KUrh3bsykhhBqSfAfP8D302vuNGvHeHLvA3CWofaGH6NUBlxS5jefq","2018-03-31 10:56:38","2018-03-31 10:56:38");
INSERT INTO users VALUES("9","Jihad","Islam","jihad@gmail.com","$2y$10$/ikO9yWN30efhnC8XZVN.ubevYb2gjcYqtKxLRvtnBi6577KpdvkC","","0","Active","","2018-04-01 05:05:41","2018-04-01 05:05:41");





CREATE TABLE IF NOT EXISTS `users_verification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `facebook` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `google` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `linkedin` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `phone` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `fb_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users_verification VALUES("1","1","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("2","2","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("3","3","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("4","4","yes","no","no","no","no","","","");
INSERT INTO users_verification VALUES("5","5","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("6","6","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("7","7","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("8","8","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("9","9","no","no","no","no","no","","","");



