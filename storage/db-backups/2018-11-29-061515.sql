

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("1","2","123/1","","New york","","1001","US","EUR","customer@techvill.net","1","No","2018-04-11 13:19:59","2018-04-12 14:22:52");
INSERT INTO accounts VALUES("2","1","1111","","New York","","10004","US","EUR","borna.techvill@gmail.com","1","Yes","2018-04-11 16:27:24","2018-04-11 16:27:24");
INSERT INTO accounts VALUES("3","2","111","","New york","","10005","US","EUR","bornabornaly007@gmail.com","1","Yes","2018-04-12 14:13:32","2018-04-12 14:22:52");
INSERT INTO accounts VALUES("4","2","123456","","Australia","","3000","AU","EUR","customer@techvill.net","1","No","2018-04-12 14:14:51","2018-04-12 14:22:52");
INSERT INTO accounts VALUES("5","2","321","","Australia","","3000","AU","EUR","customer123@yahoo.com","1","No","2018-04-12 14:18:12","2018-04-12 14:22:52");
INSERT INTO accounts VALUES("6","3","124/1","","New York","","1005","US","EUR","mahfuzasinthy@gmail.com","1","Yes","2018-04-12 16:38:24","2018-04-12 16:55:24");
INSERT INTO accounts VALUES("7","3","11122","","New York","","1204","US","EUR","account@gmail.com","1","No","2018-04-12 16:39:39","2018-04-12 16:55:24");
INSERT INTO accounts VALUES("8","3","1234","","New York","","1007","VU","EUR","stockpile.techvill@gmail.com","1","No","2018-04-12 16:53:22","2018-04-12 16:55:24");





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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO admin VALUES("1","admin","admin@techvill.net","$2y$10$iqWncX1VDtz5MsnK9r4KFeI2tYNkOMlOxL0IUu24L/QkHI26rI2EG","","Active","1U0BFOWXhluF4ZdIq5UGcESQGDqnsiiTe26F3sUEA0atawWZ8MSwynyjo2Lm","2018-11-28 11:17:24","");





CREATE TABLE IF NOT EXISTS `amenities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO amenity_type VALUES("1","Common Amenities","");
INSERT INTO amenity_type VALUES("2","Safety Amenities","");





CREATE TABLE IF NOT EXISTS `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `heading` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subheading` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO banners VALUES("1","Welcome to Hotel","Lorem ipsum dolor sit amet, consectetur adipiscing elit","banner_1.jpg","Active");
INSERT INTO banners VALUES("2","Feel Like Your Home","Lorem ipsum dolor sit amet, consectetur adipiscing elit","banner_2.jpg","Active");
INSERT INTO banners VALUES("3","Luxury Vacation Rentals Around the World","Lorem ipsum dolor sit amet, consectetur adipiscing elit","banner_3.jpg","Active");





CREATE TABLE IF NOT EXISTS `bed_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO booking_details VALUES("1","1","country","AU");
INSERT INTO booking_details VALUES("2","2","country","BD");
INSERT INTO booking_details VALUES("3","3","country","BD");
INSERT INTO booking_details VALUES("4","2","decline_reason","dates_not_available");
INSERT INTO booking_details VALUES("5","4","country","AU");
INSERT INTO booking_details VALUES("6","5","country","CA");
INSERT INTO booking_details VALUES("7","6","country","BD");
INSERT INTO booking_details VALUES("8","7","country","BR");
INSERT INTO booking_details VALUES("9","8","country","BD");





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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO bookings VALUES("1","2","ERxu5C","1","2","2018-11-28","0000-00-00","Accepted","1","2","12","26","1","0","1","0","0","26","instant","USD","Flexible","ch_1CFfC8DpvvQP5tMR0U6VKv8X","2","","","","","","2018-04-11 16:24:48","2018-04-11 16:24:48");
INSERT INTO bookings VALUES("2","3","m0wtUO","1","2","2018-11-28","0000-00-00","Declined","1","3","4","16","3","0","1","0","0","16","request","EUR","Flexible","9P049291CP579571C","1","","","2018-04-11 18:05:58","","","2018-04-11 17:04:47","2018-04-11 18:05:58");
INSERT INTO bookings VALUES("3","4","Q9MB6r","1","2","2018-11-21","2018-11-27","Accepted","1","3","22","69","0","0","3","0","0","69","instant","BRL","Flexible","0EX08288RJ3218715","1","","","","","","2018-04-11 17:50:13","2018-04-11 17:50:13");
INSERT INTO bookings VALUES("4","5","ZOQy3s","1","2","2018-11-28","0000-00-00","Expired","1","2","5","11","0","0","1","0","0","11","request","USD","Flexible","58W067956A932224U","1","","2018-04-15 12:20:23","","","","2018-04-11 18:29:14","2018-04-15 12:20:23");
INSERT INTO bookings VALUES("5","7","P5RhtR","1","2","2018-11-21","2018-11-27","Expired","1","5","7","37","0","0","2","0","0","37","request","CAD","Flexible","ch_1CFhEkDpvvQP5tMRkT8Thy3D","2","","2018-04-15 12:20:23","","","","2018-04-11 18:35:38","2018-04-15 12:20:23");
INSERT INTO bookings VALUES("6","11","Pru3id","1","2","2018-11-28","0000-00-00","Expired","1","2","9","19","0","0","1","0","0","19","request","EUR","Flexible","ch_1CFzu1DpvvQP5tMRJJJFAcyr","2","","2018-04-15 12:20:23","","","","2018-04-12 14:31:29","2018-04-15 12:20:23");
INSERT INTO bookings VALUES("7","2","3nVe9i","1","2","2018-11-28","0000-00-00","Accepted","1","2","47","103","4","0","5","0","0","103","instant","BRL","Flexible","ch_1CG0MoDpvvQP5tMRYdmp7FUh","2","","","","","","2018-04-12 15:01:15","2018-04-12 15:01:15");
INSERT INTO bookings VALUES("8","6","YW9suc","1","2","2018-11-28","0000-00-00","Accepted","1","1","20","21","0","0","1","0","0","21","instant","BRL","Flexible","ch_1CG0TODpvvQP5tMRKNd2UbxJ","2","","","","","","2018-04-12 15:08:02","2018-04-12 15:08:02");





CREATE TABLE IF NOT EXISTS `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `iso3` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_short_name_unique` (`short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO currency VALUES("1","US Dollar","USD","$","1.00","Active","1");
INSERT INTO currency VALUES("2","Pound Sterling","GBP","&pound;","0.65","Active","0");
INSERT INTO currency VALUES("3","Europe","EUR","&euro;","0.88","Active","0");
INSERT INTO currency VALUES("4","Australian Dollar","AUD","&#36;","1.41","Active","0");
INSERT INTO currency VALUES("5","Singapore","SGD","$","1.41","Active","0");
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
INSERT INTO currency VALUES("31","Vietnamese Dong","VND","?","22471.00","Active","0");
INSERT INTO currency VALUES("32","South African Rand","ZAR","R","13.55","Active","0");





CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  `default` enum('1','0') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO language VALUES("1","English","en","Active","1");
INSERT INTO language VALUES("2","????","ar","Active","0");
INSERT INTO language VALUES("3","?? (??)","ch","Active","0");
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO messages VALUES("1","2","1","2","1","Dear host,\nPlease confirm my booking & let me know.\n\nThank you.","4","1","0","0","2018-04-11 16:24:48","2018-04-11 17:02:17");
INSERT INTO messages VALUES("2","3","2","2","1","","4","1","0","0","2018-04-11 17:04:47","2018-04-11 17:59:48");
INSERT INTO messages VALUES("3","4","3","2","1","","4","1","0","0","2018-04-11 17:50:13","2018-04-11 18:03:44");
INSERT INTO messages VALUES("4","4","3","1","2","Dear Guset,\nYour booking is confirmed. Have a nice journey.\n\nThank you.","1","1","0","0","2018-04-11 18:00:56","2018-04-11 18:01:06");
INSERT INTO messages VALUES("5","4","3","2","1","Hello,\nThank you.","1","1","0","0","2018-04-11 18:01:24","2018-04-11 18:03:44");
INSERT INTO messages VALUES("6","3","2","1","2","","6","1","0","0","2018-04-11 18:05:58","2018-04-11 18:11:41");
INSERT INTO messages VALUES("7","5","4","2","1","","4","1","0","0","2018-04-11 18:29:14","2018-04-11 18:29:44");
INSERT INTO messages VALUES("8","7","5","2","1","","4","1","0","0","2018-04-11 18:35:38","2018-04-11 18:36:20");
INSERT INTO messages VALUES("9","11","6","2","1","","4","1","0","0","2018-04-12 14:31:29","2018-04-12 14:56:31");
INSERT INTO messages VALUES("10","2","7","2","1","","4","1","0","0","2018-04-12 15:01:15","2018-04-12 17:28:39");
INSERT INTO messages VALUES("11","6","8","2","1","","4","1","0","0","2018-04-12 15:08:02","2018-04-12 17:28:27");
INSERT INTO messages VALUES("12","5","4","2","2","","7","0","0","0","2018-04-15 12:20:23","2018-04-15 12:20:23");
INSERT INTO messages VALUES("13","7","5","2","2","","7","0","0","0","2018-04-15 12:20:23","2018-04-15 12:20:23");
INSERT INTO messages VALUES("14","11","6","2","2","","7","0","0","0","2018-04-15 12:20:23","2018-04-15 12:20:23");





CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO migrations VALUES("2071","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2072","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("2073","2015_09_26_161159_entrust_setup_tables","1");
INSERT INTO migrations VALUES("2074","2015_10_05_153204_create_timezone_table","1");
INSERT INTO migrations VALUES("2075","2017_02_08_044609_create_accounts_table","1");
INSERT INTO migrations VALUES("2076","2017_02_08_045108_create_pages_table","1");
INSERT INTO migrations VALUES("2077","2017_02_08_045204_create_reports_table","1");
INSERT INTO migrations VALUES("2078","2017_02_08_045412_create_country_table","1");
INSERT INTO migrations VALUES("2079","2017_02_08_045643_create_language_table","1");
INSERT INTO migrations VALUES("2080","2017_02_08_045745_create_currency_table","1");
INSERT INTO migrations VALUES("2081","2017_02_23_110333_create_backup_table","1");
INSERT INTO migrations VALUES("2082","2017_02_27_124315_create_seo_metas_table","1");
INSERT INTO migrations VALUES("2083","2017_03_01_130507_create_user_details_table","1");
INSERT INTO migrations VALUES("2084","2017_03_29_070352_create_payment_methods_table","1");
INSERT INTO migrations VALUES("2085","2017_04_02_110016_create_notification_table","1");
INSERT INTO migrations VALUES("2086","2017_05_04_102846_create_admin_table","1");
INSERT INTO migrations VALUES("2087","2017_05_04_103841_create_property_type_table","1");
INSERT INTO migrations VALUES("2088","2017_05_04_104010_create_amenities_table","1");
INSERT INTO migrations VALUES("2089","2017_05_04_104406_create_amenity_type_table","1");
INSERT INTO migrations VALUES("2090","2017_05_04_104509_create_rules_table","1");
INSERT INTO migrations VALUES("2091","2017_05_04_105120_create_settings_table","1");
INSERT INTO migrations VALUES("2092","2017_05_04_105515_create_properties_table","1");
INSERT INTO migrations VALUES("2093","2017_05_04_105605_create_property_description_table","1");
INSERT INTO migrations VALUES("2094","2017_05_04_105636_create_property_price_table","1");
INSERT INTO migrations VALUES("2095","2017_05_04_105726_create_property_address_table","1");
INSERT INTO migrations VALUES("2096","2017_05_04_105742_create_property_photos_table","1");
INSERT INTO migrations VALUES("2097","2017_05_04_105800_create_property_details_table","1");
INSERT INTO migrations VALUES("2098","2017_05_04_112613_create_property_dates_table","1");
INSERT INTO migrations VALUES("2099","2017_05_04_112728_create_property_rules_table","1");
INSERT INTO migrations VALUES("2100","2017_05_04_112954_create_property_fees_table","1");
INSERT INTO migrations VALUES("2101","2017_05_04_113049_create_bookings_table","1");
INSERT INTO migrations VALUES("2102","2017_05_04_113223_create_penalty_table","1");
INSERT INTO migrations VALUES("2103","2017_05_04_113243_create_payout_table","1");
INSERT INTO migrations VALUES("2104","2017_05_04_113355_create_payout_penalties_table","1");
INSERT INTO migrations VALUES("2105","2017_05_04_113622_create_booking_details_table","1");
INSERT INTO migrations VALUES("2106","2017_05_04_114011_create_reviews_table","1");
INSERT INTO migrations VALUES("2107","2017_05_04_114131_create_messages_table","1");
INSERT INTO migrations VALUES("2108","2017_05_04_114152_create_bed_types_table","1");
INSERT INTO migrations VALUES("2109","2017_05_04_114215_create_banners_table","1");
INSERT INTO migrations VALUES("2110","2017_05_04_114238_create_starting_cities_table","1");
INSERT INTO migrations VALUES("2111","2017_05_07_133954_create_message_type_table","1");
INSERT INTO migrations VALUES("2112","2017_05_08_073511_create_property_beds_table","1");
INSERT INTO migrations VALUES("2113","2017_05_13_055552_create_space_type_table","1");
INSERT INTO migrations VALUES("2114","2017_05_18_121707_create_property_steps_table","1");
INSERT INTO migrations VALUES("2115","2017_06_18_080440_create_table_user_verification","1");





CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('read','unread') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO pages VALUES("1","Help","help","Help page coming soon.","","Active","","");
INSERT INTO pages VALUES("2","Why Host","Why Host","<h1><strong>Why Host</strong></h1>\n\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.</p>\n\n<p>Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus.</p>\n\n<p>Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh.Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh.Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh.</p>\n\n<p>&nbsp;</p>","first","Active","2018-04-12 12:44:25","2018-04-12 18:23:49");
INSERT INTO pages VALUES("3","Responsible Hosting","Responsible Hosting","<h1>Responsible Hosting</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt.</p>","first","Active","2018-04-12 12:48:41","2018-04-12 12:48:41");
INSERT INTO pages VALUES("4","Trust & Safety","Trust & Safety","<h1>Trust &amp; Safety</h1>\n\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.&nbsp;</p>","first","Active","2018-04-12 12:50:02","2018-04-12 12:50:02");
INSERT INTO pages VALUES("5","About Us","About us","<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.&nbsp;</p>","second","Active","2018-04-12 12:53:52","2018-04-12 12:53:52");
INSERT INTO pages VALUES("6","Polices","Polices","<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.&nbsp;</p>","second","Active","2018-04-12 12:54:25","2018-04-12 12:54:25");
INSERT INTO pages VALUES("7","Terms","Terms","<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.&nbsp;</p>","second","Active","2018-04-12 12:54:49","2018-04-12 12:54:49");
INSERT INTO pages VALUES("8","Privacy","Privacy","<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.&nbsp;</p>","second","Active","2018-04-12 12:55:35","2018-04-12 12:55:35");





CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO password_resets VALUES("test@techvill.net","jfrGlJH7xYG6KXhzeXRoMV6JVFhVEY3YusAaPaRFV0jAbuNf6CRrdbHhjX3uqlPgSjTyhyy3jwl7FhTNg2WCjFmplMBoeKEbaOQK","2018-04-11 13:11:26");
INSERT INTO password_resets VALUES("customer@techvill.net","FbnTTJNon02LdTzZrmTTApwxGy8nHncleCmTZAK0Stbbm8EwZ53lQ7c2LMAgzeUcwxpDMvkW75UNnLzNtqU5A77Mq8nffzrN01cL","2018-04-11 13:17:13");
INSERT INTO password_resets VALUES("mahfuzasinthy@gmail.com","FVk5TfJDjTkogWaidNxUkmEpSggYtYaceB0NDdd0z5uClsond05J42cGQ3fenKChAWp2JFGVDPRQgCA8NVNkdizH1KXupA2akcb7","2018-04-12 15:56:13");
INSERT INTO password_resets VALUES("test@techvill.net","A7EmAMBoslEAHTI6EDHAqfjTfq7t179SeRAIQGiJRkZetzlrAaxQRiaVSvSywfISnlUWIyZ6sxT6hekvWoF04iS6LbCPvuUjh09F","2018-04-12 17:35:39");
INSERT INTO password_resets VALUES("test@techvill.net","RJ3rhSJzK8o05qXbx8jUS4c4aLuCoRkPLrXQ2qXs80RJEtuqBcrQvUv4UsG31dlqKbxoB67YH9dL8fKLFjYU8HHfbHHvYUEAYheM","2018-04-12 18:11:51");





CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payment_methods VALUES("1","Paypal","Active");
INSERT INTO payment_methods VALUES("2","Stripe","Active");





CREATE TABLE IF NOT EXISTS `payout_penalties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payout_id` int(11) NOT NULL,
  `penalty_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payouts VALUES("1","1","1","2","Host","borna.techvill@gmail.com","31","0","Completed","EUR","2018-04-11 16:24:48","2018-04-11 16:28:23");
INSERT INTO payouts VALUES("2","3","1","0","Host","","66","0","Future","BRL","2018-04-11 17:50:13","2018-04-11 17:50:13");
INSERT INTO payouts VALUES("3","2","2","3","Guest","customer@techvill.net","20","0","Completed","EUR","2018-04-11 18:05:58","2018-04-11 18:24:50");
INSERT INTO payouts VALUES("4","7","1","0","Host","","98","0","Future","BRL","2018-04-12 15:01:15","2018-04-12 15:01:15");
INSERT INTO payouts VALUES("5","8","1","6","Host","borna.techvill@gmail.com","1","0","Completed","EUR","2018-04-12 15:08:02","2018-04-12 15:09:17");
INSERT INTO payouts VALUES("6","4","2","5","Guest","","11","0","Future","USD","2018-04-15 12:20:23","2018-04-15 12:20:23");
INSERT INTO payouts VALUES("7","5","2","7","Guest","","28","0","Future","CAD","2018-04-15 12:20:23","2018-04-15 12:20:23");
INSERT INTO payouts VALUES("8","6","2","11","Guest","","22","0","Future","EUR","2018-04-15 12:20:23","2018-04-15 12:20:23");





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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO properties VALUES("1","Beautiful overview of Central Park","","1","2","4","1","3.00","2,4,6,7,27,29","1","2","2","instant","Flexible","Listed","","2018-04-11 13:28:14","2018-04-11 13:39:51");
INSERT INTO properties VALUES("2","France\'s gift to America-Statue of Liberty","","1","2","2","1","2.00","6,7,15,27","5","2","1","instant","Flexible","Listed","","2018-04-11 13:53:16","2018-04-11 14:03:34");
INSERT INTO properties VALUES("3","Time square Evening  View- Hotel Hyatt","","1","1","1","1","0.50","3,14,15,17,19,20,21,27","1","1","1","request","Flexible","Listed","","2018-04-11 14:18:26","2018-04-11 14:53:33");
INSERT INTO properties VALUES("4","Entire home/apt in Paris","","1","1","1","1","0.50","1,4,7,30,31","17","1","1","instant","Flexible","Listed","","2018-04-11 14:55:37","2018-04-11 15:01:56");
INSERT INTO properties VALUES("5","City of Light meets city of sin at Paris Las Vegas","","1","1","1","1","0.50","2,7,8,27,31","1","1","1","request","Flexible","Listed","","2018-04-11 15:05:28","2018-04-11 15:08:49");
INSERT INTO properties VALUES("6","Entire home/apt in Zürich","","1","1","1","1","0.50","1,8,21,29,30","1","1","1","instant","Flexible","Listed","","2018-04-11 15:13:30","2018-04-11 15:20:53");
INSERT INTO properties VALUES("7","Entire home/apt in Lausanne","","1","1","1","1","0.50","3,29,30","1","1","1","request","Flexible","Listed","","2018-04-11 15:59:59","2018-04-11 16:04:03");
INSERT INTO properties VALUES("8","Entire home/apt in Barcelona","","1","1","1","1","0.50","","1","1","1","request","Flexible","Unlisted","","2018-04-11 16:09:27","2018-04-11 16:15:50");
INSERT INTO properties VALUES("9","Entire home/apt in ","","1","2","2","1","2.00","","1","1","1","request","Flexible","Unlisted","","2018-04-11 16:14:35","2018-04-11 16:14:45");
INSERT INTO properties VALUES("10","Entire home/apt in","","1","1","1","1","0.50","","1","1","1","request","Flexible","Unlisted","","2018-04-11 17:39:28","2018-04-11 17:41:54");
INSERT INTO properties VALUES("11","Brooklyn Bridge-New York","","1","1","1","1","0.50","2,4,5,7,15,27","1","1","1","request","Flexible","Listed","","2018-04-12 14:03:10","2018-04-12 14:07:33");
INSERT INTO properties VALUES("12","Metropolitan Museum New York","","1","2","2","4","2.00","4,28","1","1","2","instant","Flexible","Listed","","2018-04-12 15:39:44","2018-04-12 15:43:56");
INSERT INTO properties VALUES("13","Entire home/apt in Tambon Nong Chaeng","","3","1","1","1","0.50","2,3,6,7,8,27,30","1","1","2","instant","Flexible","Listed","","2018-04-12 15:56:43","2018-04-12 15:58:52");
INSERT INTO properties VALUES("14","Entire home/apt in Sydney","","3","1","1","1","0.50","1,2,3,4,6,7,17,18,19,21,24,27","1","1","1","instant","Flexible","Listed","","2018-04-12 16:07:14","2018-04-12 16:14:22");
INSERT INTO properties VALUES("15","Australian National Maritime Museum-Sydney","","3","1","1","1","0.50","3","1","1","1","instant","Flexible","Listed","","2018-04-12 16:17:29","2018-04-12 16:27:39");
INSERT INTO properties VALUES("16","Entire home/apt in Sydney","","3","1","1","1","0.50","4,5,6,7,27,30,31","1","2","1","instant","Flexible","Listed","","2018-04-12 16:28:41","2018-04-12 16:34:37");
INSERT INTO properties VALUES("17","Entire home/apt in Barcelona","","3","1","1","1","0.50","2","1","1","6","instant","Flexible","Listed","","2018-04-12 16:48:52","2018-04-12 17:10:14");





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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_address VALUES("1","1","422 Greenwich St, New York, NY 10013, USA","","40.7219357","-74.0098003","New York","New York","US","10013");
INSERT INTO property_address VALUES("2","2","1 Liberty Island - Ellis Island, New York, NY 10004, USA","","40.6892494","-74.0445004","New York","New York","US","10004");
INSERT INTO property_address VALUES("3","3","New York City Hall, 11 Centre St, New York, NY 10007, USA","","40.7127753","-74.0059728","New York","New York","US","10007");
INSERT INTO property_address VALUES("4","4","Hôtel de Ville, 75004 Paris, France","","48.85661400000001","2.3522219000000177","Paris","Île-de-France","FR","75004");
INSERT INTO property_address VALUES("5","5","Paris , Île-de-France , France","","48.8583698","2.2944833000000244","Paris","Île-de-France","FR","75007");
INSERT INTO property_address VALUES("6","6","switzerland","","46.2049398","6.14230120000002","Genève","Genève","CH","1204");
INSERT INTO property_address VALUES("7","7","Unnamed Road, 6072 Sachseln, Switzerland","","46.818188","8.227511999999933","Sachseln","Obwalden","CH","6072");
INSERT INTO property_address VALUES("8","8","","","0","0","","","","");
INSERT INTO property_address VALUES("9","9","","","0","0","","","","");
INSERT INTO property_address VALUES("10","10","","","0","0","","","","");
INSERT INTO property_address VALUES("11","11","New York City Hall, 11 Centre St, New York, NY 10007, USA","","40.7127753","-74.0059728","New York","New York","US","10007");
INSERT INTO property_address VALUES("12","12","20 Washington Square N, New York, NY 10012, USA","","40.73082279999999","-73.99733200000003","New York","New York","US","10012");
INSERT INTO property_address VALUES("13","13","1 Dinso Rd, Khwaeng Wat Bowon Niwet, Khet Phra Nakhon, Krung Thep Maha Nakhon 10200, Thailand","","13.7563309","100.50176510000006","???","Krung Thep Maha Nakhon","TH","10200");
INSERT INTO property_address VALUES("14","14","MLC Centre, Sydney NSW 2000, Australia","","-33.8567844","151.21529669999995","Sydney","New South Wales","AU","2000");
INSERT INTO property_address VALUES("15","15","MLC Centre, Sydney NSW 2000, Australia","","-33.8688197","151.20929550000005","Sydney","New South Wales","AU","2000");
INSERT INTO property_address VALUES("16","16","MLC Centre, Sydney NSW 2000, Australia","","-33.8688197","151.20929550000005","Sydney","New South Wales","AU","2000");
INSERT INTO property_address VALUES("17","17","Carrer de la Canuda, 45, 08002 Barcelona, Spain","","41.38506389999999","2.1734034999999494","Barcelona","Catalunya","ES","08002");





CREATE TABLE IF NOT EXISTS `property_beds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `bed_type_id` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `property_dates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `status` enum('Available','Not available') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Available',
  `price` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_dates VALUES("1","1","Available","9","0000-00-00","2018-04-11 13:37:36","2018-04-11 13:37:36");
INSERT INTO property_dates VALUES("2","7","Available","5","0000-00-00","2018-04-11 16:04:16","2018-04-11 16:04:16");
INSERT INTO property_dates VALUES("3","7","Available","5","0000-00-00","2018-04-11 16:04:26","2018-04-11 16:04:26");
INSERT INTO property_dates VALUES("4","2","Available","0","0000-00-00","2018-04-11 16:24:48","2018-04-11 16:24:48");
INSERT INTO property_dates VALUES("5","2","Available","0","0000-00-00","2018-04-11 16:24:48","2018-04-11 16:24:48");
INSERT INTO property_dates VALUES("6","3","Available","0","0000-00-00","2018-04-11 17:04:47","2018-04-11 17:04:47");
INSERT INTO property_dates VALUES("7","3","Available","0","0000-00-00","2018-04-11 17:04:47","2018-04-11 17:04:47");
INSERT INTO property_dates VALUES("8","3","Available","0","0000-00-00","2018-04-11 17:04:47","2018-04-11 17:04:47");
INSERT INTO property_dates VALUES("9","4","Available","0","0000-00-00","2018-04-11 17:50:13","2018-04-11 17:50:13");
INSERT INTO property_dates VALUES("10","4","Available","0","0000-00-00","2018-04-11 17:50:13","2018-04-11 17:50:13");
INSERT INTO property_dates VALUES("11","4","Available","0","0000-00-00","2018-04-11 17:50:13","2018-04-11 17:50:13");
INSERT INTO property_dates VALUES("19","11","Available","10","0000-00-00","2018-04-12 14:08:08","2018-04-12 14:08:08");
INSERT INTO property_dates VALUES("20","11","Available","10","0000-00-00","2018-04-12 14:08:21","2018-04-12 14:08:21");
INSERT INTO property_dates VALUES("21","11","Available","10","0000-00-00","2018-04-12 14:08:21","2018-04-12 14:08:21");
INSERT INTO property_dates VALUES("24","2","Available","0","0000-00-00","2018-04-12 15:01:15","2018-04-12 15:01:15");
INSERT INTO property_dates VALUES("25","2","Available","0","0000-00-00","2018-04-12 15:01:15","2018-04-12 15:01:15");
INSERT INTO property_dates VALUES("26","6","Available","0","0000-00-00","2018-04-12 15:08:02","2018-04-12 15:08:02");
INSERT INTO property_dates VALUES("27","17","Available","10","0000-00-00","2018-04-12 18:03:40","2018-04-12 18:03:40");
INSERT INTO property_dates VALUES("28","17","Available","10","0000-00-00","2018-04-12 18:03:49","2018-04-12 18:03:49");





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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_description VALUES("1","1","Located in Times Square, this Manhattan hotel is within 7 minutes’ walk of Rockefeller Center and Radio City Music Hall. Guests can enjoy the convenience of a concierge service and on-site dining.\nServing traditional American cuisine with views of Times Square, the Brasserie 1605 prepares breakfast, lunch and dinner. Guests at the Times Square Crowne Plaza can also have drinks at the Broadway 49 Bar.","The Central Park Zoo features more than 100 species of animals from the tropics, polar regions, and the California Coast. An equatorial rain forest houses monkeys and free-flying birds while penguins inhabit the Arctic section. Other animal highlights include polar bears, snow leopards, and red pandas. Near the entrance is the charming Delacorte Clock, where bronze musical animals encircle the time piece and play nursery chimes every half-hour.","A walk, peddle, or carriage ride through the crisscrossing pathways of Central Park is a must-do on anyone\'s New York City itinerary. In winter, you can even lace up your skates and glide across Wollman Rink. This huge park in the city center, a half-mile wide and 2.5 miles long, is one of the things that makes New York such a beautiful and livable city. Besides being a great place to experience a little nature, Central Park has many attractions within its borders, including the Belvedere Castle, Strawberry Fields, the Central Park Zoo, and the Lake","","","","Located within Central Park, Strawberry Fields is a memorial for John Lennon, who was tragically murdered in front of the Dakota apartments just off the west side of the park. A mosaic is set in the pathway with the word \"Imagine\" inscribed, named after Lennon\'s 1971 song. The landscape was designed by Vaux and Olmstead and features 161 species of plants (one from every country in the world).","");
INSERT INTO property_description VALUES("2","2","At the crossroads of Tribeca and the Financial District, just a block from the World Trade Center, Four Seasons Hotel New York Downtown adds its classic architectural profile to the world’s most famous skyline. Discover a New York luxury hotel with Downtown’s creativity and confidence, surrounded by the non-stop, dynamic scenes of the new New York.","On a tour to the Statue of Liberty, you have the option to stop at Ellis Island and explore the Immigration Museum. This fantastic museum is located in the historic immigration station complex, where thousands of immigrants were processed before entering the United States. Displays focus on the process, the experiences, and the stories of the people who came through here on their journey to the United States. You can even search the on-site computer database to see a record of immigrants who came through here.","The Statue of Liberty was France\'s gift to America. Built in 1886, it remains a famous world symbol of freedom and one of the greatest American icons. It is one of the world\'s largest statues, standing just under 152 feet tall from the base to the torch, and weighing approximately 450,000 pounds.\nYou can see the statue from land, with particularly good views from Battery Park, on the southern tip of Manhattan. However, to truly appreciate the Statue of Liberty, it\'s best to take a short boat trip to Liberty Island and see it up close. You can walk around the base, enter the pedestal, or, with advance reservations, go right up to the crown.","","Tickets to go inside the statue sell out. Pre-purchasing tickets is a must during the high season and a good idea at any time of year. The Statue of Liberty and Ellis Island Guided Tour is a three-hour trip that takes you to both the Statue of Liberty and Ellis Island. Note: Buying tickets at the ferry can be tricky, with hawkers claiming to be \"official representatives\" trying to sell you more expensive tickets before you can find the ticket booth.","","","");
INSERT INTO property_description VALUES("3","3","It may be hard to believe, but when it officially opens today, the Park Hyatt New York will be the first five-star hotel to debut in Gotham in over a decade. Indeed, ever since the opening of the nearby Mandarin-Oriental in 2003, New York has been awash in small-scale, chic-boutiques rather than pricey, full-service grand-dames. But as it opens today, the Park Hyatt intends to return the City’s hotel culture back to its high-glamour— and high-priced — roots.","","","","","","","");
INSERT INTO property_description VALUES("4","4","Set in the trendy Oberkampf quarter, this hip, no-frills hotel is a 5-minute walk from Ménilmontant metro station, 9 minutes from the Parc de Belleville, and 1.6 km from Père Lachaise Cemetery.\n\nThe bright, casual rooms are accessed by stairs only, and feature free Wi-Fi and flat-screen TVs, as well as minibars, and tea and coffeemaking equipment. Family rooms add extra beds.\n\nContinental breakfast is free. There are coin-operated laundry facilities available for a surcharge.","","","","","","","");
INSERT INTO property_description VALUES("5","5","The City of Light meets the city of sin at Paris Las Vegas. The centrally-located Parisian-themed hotel boasts a replica Eiffel Tower, a mock Arc de Triomphe and French restaurants mixed with a Las Vegas-style nightclub and shows.","","","","","","","");
INSERT INTO property_description VALUES("6","6","Offering luxury guest rooms, the lovely Boutique Hotel Wellenberg lies within a 5-minute walk from Town Hall . Residing in a 5-story historical building, the hotel was renovated in 2009.The property is about 550 meters away from Paradeplatz. Nestled in the museum district and 1 km from the city center.\n\nA shopping street and boutiques are also set close by.","","","","","","","");
INSERT INTO property_description VALUES("7","7","Elegant and authentic, Beau-Rivage is an exceptional house, with its incredible view on the iconic Jet d\'Eau, the lake, the Mont-Blanc, the snowy summits and the city. Through its history, contribute to extend the list of extraordinary personalities who have stayed at Beau-Rivage.\n\nWith its humanity and attention to detail, together we will make your stay unique.","","","","","","","");
INSERT INTO property_description VALUES("8","8","Located on Paral·lel Avenue, where long tradition theaters come together with the trendiest restaurants in the city, Hotel Barcelona Universal is just 5 minutes away from Barcelona\'s emblematic promenade that connects Plaza Catalunya to the port.","","","","","","","");
INSERT INTO property_description VALUES("9","9","","","","","","","","");
INSERT INTO property_description VALUES("10","10","Hotel details\nIn Bangkok\'s vibrant Pratunam area, this upscale contemporary hotel is 9 minutes from the CentralWorld shopping mall, and 6 km from Wat Phra Kaew temple. \n\nFeaturing city, garden or pool views, the warm rooms come with free Wi-Fi, flat-screen TVs and DVD players, as well as tea and coffeemakers, minifridges and safes. Suites add whirlpool tubs. Club rooms have access to a private lounge offering free breakfast and cocktails.","","","","","","","");
INSERT INTO property_description VALUES("11","11","Discover a destination at once bohemian, sophisticated and inspiring. SIXTY SoHo hotel mirrors its stylish surroundings, standing as an inimitable hotel in one of New York City’s most vibrant neighborhoods. Stay in big city style, relax in newly renovated guestrooms and suites, and imbibe at stunning spaces at this upscale SoHo hotel.","","","","","","","");
INSERT INTO property_description VALUES("12","12","Located in Chelsea, Hotel Pennsylvania is within a 5-minute walk of  Penn Station and within 15 minutes of other popular attractions like Macy\'s. This 1705-room hotel has a restaurant along with conveniences like a fitness center and a 24-hour business center. Centrally located in New York, the hotel is also a short walk from Empire State Building and Times Square","","","","","","","");
INSERT INTO property_description VALUES("13","13","In Bangkok\'s vibrant Pratunam area, this upscale contemporary hotel is 9 minutes from the CentralWorld shopping mall, and 6 km from Wat Phra Kaew temple. \n\nFeaturing city, garden or pool views, the warm rooms come with free Wi-Fi, flat-screen TVs and DVD players, as well as tea and coffeemakers, minifridges and safes. Suites add whirlpool tubs. Club rooms have access to a private lounge offering free breakfast and cocktails.","","","","","","","");
INSERT INTO property_description VALUES("14","14","Set amid the pubs and craft shops of The Rocks district, this industrial-chic hotel in a redbrick 1887 building, is a 5-minute walk from Circular Quay train station and a 15-minute walk from both Sydney Opera House and Sydney Harbour Bridge.\n\nFeaturing bold fabrics, the chic rooms and suites have free Wi-Fi, flat-screens, minibars, room service, and tea and coffeemakers. Upgraded rooms add iPod docks, sitting areas and/or sofabeds, while some suites offer harbour views.","","The Sydney Opera House, a world-class performing arts venue and iconic Australian landmark, defines the Sydney Harbour in the heart of the city. Designed by Danish architect Jorn Utzon, the structure is a masterpiece of late 20th-century architecture, despite challenges that plagued the 15-year project before it was formally opened by Queen Elizabeth II in 1973. Distinguished by soaring halls with a white ceramic-tiled exterior shaped to evoke the sails of a yacht, this UNESCO World Heritage Site is a must-see Sydney attraction.","","","","","");
INSERT INTO property_description VALUES("15","15","Set in the Central Business District, this sophisticated hotel is a 5-minute walk from Wynyard train station and 1.5 km from the Sydney Opera House. \n\nThe warm polished apartments feature paid Wi-Fi, flat-screen TVs, and minibars. All also offer kitchens, washer/dryers and room service, and some have balconies. Upgraded apartments add sofabeds, and there\'s also a 3-bedroom penthouse apartment with a whirlpool bath and a terrace.","","","","","","","");
INSERT INTO property_description VALUES("16","16","This bright and modern hotel, set in the Central Business District, is across the street from Hyde Park and a 7-minute walk from Town Hall railway station. It’s also 2.4 km from the Sydney Opera House.\n\nThe colourful rooms feature free Wi-Fi, flat-screen TVs with DVD players, and tea and coffeemaking equipment. Upgraded rooms add microwaves, minifridges, wet bars and sitting areas; some add private balconies and park views. The 2-bedroom apartments feature full kitchens.","","","","","","","");
INSERT INTO property_description VALUES("17","17","Set in the 22@ business district, this modern hotel is a 5-minute walk from the Llacuna metro station and 1.9 km from Mar Bella beach. \n\nColorful rooms come with complimentary Wi-Fi, flat-screen TVs, and coffeemakers. Upgraded rooms add pull-out sofas. Kids 18 and under stay free with a parent.\n\nBreakfast is served in a contemporary dining room for a fee. There\'s also a bar, a business center and a meeting room.","","","","","","","");





CREATE TABLE IF NOT EXISTS `property_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `field` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE IF NOT EXISTS `property_fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_fees VALUES("1","more_then_seven","5");
INSERT INTO property_fees VALUES("2","less_then_seven","5");
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
  `serial` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_photos VALUES("2","1","1523428499_43289202.jpg","","0","2");
INSERT INTO property_photos VALUES("3","1","1523428511_89826496.jpg","","0","3");
INSERT INTO property_photos VALUES("4","1","1523428522_43289251.jpg","","0","4");
INSERT INTO property_photos VALUES("5","1","1523428546_43289305.jpg","","0","5");
INSERT INTO property_photos VALUES("6","1","1523429218_crowne-plaza-jamaica-2589646442-2x1.jpg","","1","5");
INSERT INTO property_photos VALUES("7","2","1523430028_Property-FourSeasonsHotelNewYorkDowntown-Hotel-GuestroomSuite-RoyalSuiteDiningArea-FourSeasonsHotelsLimited.jpg","","1","1");
INSERT INTO property_photos VALUES("19","2","1523430750_four-seasons-hotel-new-york-downtown_5a1e97058efda.jpg","","0","3");
INSERT INTO property_photos VALUES("20","2","1523430777_hotel-bathrooms-around-the-world-that-are-bigger-than-your-bathroom-large-four-seasons-hotel-l-cf7c00a31f146ef9.jpg","","0","3");
INSERT INTO property_photos VALUES("22","2","1523430857_four-seasons-hotel-new-york-downtown_5a1e97058efda.jpg","","0","5");
INSERT INTO property_photos VALUES("24","2","1523430957_Four-Seasons-Hotel-New-York.jpg","","0","5");
INSERT INTO property_photos VALUES("25","3","1523431422_ie_hyatt_andaz_palm_springs_rendering.jpg","","1","1");
INSERT INTO property_photos VALUES("26","3","1523431431_cambria-dbl.jpg","","0","2");
INSERT INTO property_photos VALUES("27","3","1523431439_hotel-new-york-park-hyatt-spa-lounge.jpg","","0","3");
INSERT INTO property_photos VALUES("28","3","1523431461_p19140h20i1mj91uid1djij2s1r8r41.jpg","","0","4");
INSERT INTO property_photos VALUES("29","3","1523431483_who97502gr12.jpg","","0","5");
INSERT INTO property_photos VALUES("30","4","1523433599_maxresdefault.jpg","","1","1");
INSERT INTO property_photos VALUES("31","4","1523433609_4cc673c4-b370-40bf-ac59-e39ade71c161.jpg","","0","2");
INSERT INTO property_photos VALUES("32","4","1523433624_bellagio-hotel-salone-suite-bed.tif.jpg","","0","3");
INSERT INTO property_photos VALUES("33","4","1523433674_Hotels-private-pool-Las-Vegas-Bellagio2.jpg","","0","4");
INSERT INTO property_photos VALUES("34","4","1523433687_140596_216_z.jpg","","0","5");
INSERT INTO property_photos VALUES("35","5","1523434041_Las-Vegas-Hotels.jpg","","1","1");
INSERT INTO property_photos VALUES("36","5","1523434055_Executive-Suite-Living-Room-FINAL.jpg","","0","2");
INSERT INTO property_photos VALUES("37","5","1523434067_6-1200x900.jpg","","0","3");
INSERT INTO property_photos VALUES("38","5","1523434078_las-vegas-suite-cityscape-suite.jpg","","0","4");
INSERT INTO property_photos VALUES("39","5","1523434097_hotel-room-opt.jpg","","0","5");
INSERT INTO property_photos VALUES("40","6","1523434661_zrhdt-studio-0191-hor-feat.jpg","","1","1");
INSERT INTO property_photos VALUES("41","6","1523434691_6a0128763ee05d970c01b7c7673976970b.jpg","","0","2");
INSERT INTO property_photos VALUES("42","6","1523434712_00028506_m.jpg","","0","3");
INSERT INTO property_photos VALUES("43","6","1523434727_zurich-marriott-hotel-17_4822.jpg","","0","4");
INSERT INTO property_photos VALUES("44","7","1523437368_2012Apr-Exploring-Geneva-index.jpg","","1","1");
INSERT INTO property_photos VALUES("45","7","1523437381_117a93f7c6ea8761035a920430b09030.jpg","","0","2");
INSERT INTO property_photos VALUES("46","7","1523437391_hotel-beau-rivage-room.jpg","","0","3");
INSERT INTO property_photos VALUES("47","7","1523437404_rooms-deluxe-room-1300x720.jpg","","0","4");
INSERT INTO property_photos VALUES("48","7","1523437418_luxury_hotels_in_lausanne_beau_rivage_palace_junior_suite_living-942.jpg","","0","5");
INSERT INTO property_photos VALUES("49","11","1523516744_15850998750_c204bb3d34_k_d.0.jpg","","0","1");
INSERT INTO property_photos VALUES("50","11","1523516763_AG1447_SIXTYSOHO_SHOT9-e1500388487251.jpg","","0","2");
INSERT INTO property_photos VALUES("51","11","1523516772_bedroom-boutique-city-modern.jpg","","0","3");
INSERT INTO property_photos VALUES("52","11","1523516801_hotelhugo.png","","1","4");
INSERT INTO property_photos VALUES("53","12","1523522542_leonardo-1253861-bg-exterior-night2-2_S-image.jpg","","1","1");
INSERT INTO property_photos VALUES("54","12","1523522551_12887_134_z.jpg","","0","2");
INSERT INTO property_photos VALUES("55","12","1523522561_57330112.jpg","","0","3");
INSERT INTO property_photos VALUES("56","12","1523522570_67384088.jpg","","0","4");
INSERT INTO property_photos VALUES("57","12","1523522580_Penn-5000-Club-Single-1024x683.jpg","","0","5");
INSERT INTO property_photos VALUES("58","12","1523522590_New-York-Hotel-Edison-the-rum-house-900x400px.jpg","","0","6");
INSERT INTO property_photos VALUES("59","13","1523523486_240229_14080521030020700086.jpg","","1","1");
INSERT INTO property_photos VALUES("60","14","1523524372_1.jpeg","","1","1");
INSERT INTO property_photos VALUES("61","14","1523524387_2.jpg","","0","2");
INSERT INTO property_photos VALUES("62","14","1523524424_3.jpg","","0","3");
INSERT INTO property_photos VALUES("63","15","1523524708_3.jpg","","0","1");
INSERT INTO property_photos VALUES("64","15","1523525093_img1.jpg","","1","2");
INSERT INTO property_photos VALUES("65","15","1523525129_img2.jpg","","0","3");
INSERT INTO property_photos VALUES("66","15","1523525150_img3.jpg","","0","4");
INSERT INTO property_photos VALUES("67","16","1523525610_22.jpg","","0","1");
INSERT INTO property_photos VALUES("68","16","1523525622_33.jpg","","1","2");
INSERT INTO property_photos VALUES("69","16","1523525647_44.jpg","","0","3");
INSERT INTO property_photos VALUES("70","17","1523527743_holiday.jpg","","1","1");
INSERT INTO property_photos VALUES("71","17","1523527761_holiday-inn-express-barcelona-2531990657-2x1.jpg","","0","2");
INSERT INTO property_photos VALUES("72","17","1523527783_hotel-indigo-barcelona-4512483595-2x1.jpg","","0","3");





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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_price VALUES("1","1","5","1","5","2","10","0","0","0","USD");
INSERT INTO property_price VALUES("2","2","1","1","2","0","12","0","0","0","USD");
INSERT INTO property_price VALUES("3","3","3","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("4","4","0","1","0","0","5","0","0","0","EUR");
INSERT INTO property_price VALUES("5","5","0","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("6","6","0","1","0","0","5","0","0","0","CHF");
INSERT INTO property_price VALUES("7","7","0","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("8","8","0","0","0","0","0","0","0","0","USD");
INSERT INTO property_price VALUES("9","9","0","0","0","0","0","0","0","0","USD");
INSERT INTO property_price VALUES("10","10","0","0","0","0","0","0","0","0","USD");
INSERT INTO property_price VALUES("11","11","0","1","7","0","10","0","0","0","USD");
INSERT INTO property_price VALUES("12","12","2","1","0","0","10","15","0","0","EUR");
INSERT INTO property_price VALUES("13","13","0","1","0","0","5","10","0","0","THB");
INSERT INTO property_price VALUES("14","14","0","1","0","0","6","10","0","0","MXN");
INSERT INTO property_price VALUES("15","15","0","1","0","0","5","0","0","0","USD");
INSERT INTO property_price VALUES("16","16","0","1","0","0","7","0","0","0","USD");
INSERT INTO property_price VALUES("17","17","0","1","0","0","10","12","0","0","USD");





CREATE TABLE IF NOT EXISTS `property_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `rules` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO property_steps VALUES("1","1","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("2","2","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("3","3","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("4","4","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("5","5","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("6","6","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("7","7","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("8","8","1","1","0","0","0","0");
INSERT INTO property_steps VALUES("9","9","1","0","0","0","0","0");
INSERT INTO property_steps VALUES("10","10","1","1","0","0","0","0");
INSERT INTO property_steps VALUES("11","11","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("12","12","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("13","13","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("14","14","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("15","15","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("16","16","1","1","1","1","1","1");
INSERT INTO property_steps VALUES("17","17","1","1","1","1","1","1");





CREATE TABLE IF NOT EXISTS `property_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO reviews VALUES("1","1","2","1","2","host","Dear Guest,\nHope so it was a nice tour with your family and you liked our accommodation too.\n\n Thank you for visiting","Hello,\nHope so it was a nice tour with your family and you liked our accommodation too.  \n\n Thank you for visiting","","","","","","","","3","","","","3","","","","","","3","1","2018-04-12 18:43:58","2018-04-15 12:52:10");
INSERT INTO reviews VALUES("2","2","1","1","2","guest","The apartment was in a great location, friendly helpful host. He arranged for us to stash our bags on arrival before place was ready for us. foods was so tasty and in dinner there was an special menu that was really good.Overall it was a nice trips .\nThank you.","","Have not that much issue about your apartment instead of air condition problem. Have a little look on it.\n\nThank you.","","4","3","","4","","5","","5","They were really good as much we didn\'t expect!","3","","5","","2","","","1","2018-04-12 18:51:22","2018-04-15 13:11:01");
INSERT INTO reviews VALUES("3","1","2","8","6","host","Dear Guest,\nThank you for visiting our apartment.","Had a nice trips?","","","","","","","","3","","","","3","","","","","","3","1","2018-04-15 13:14:07","2018-04-15 13:14:34");





CREATE TABLE IF NOT EXISTS `role_admin` (
  `admin_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`admin_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO roles VALUES("1","admin","Admin","Admin User","","");





CREATE TABLE IF NOT EXISTS `rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO seo_metas VALUES("1","/","Home | Vrent Home","Vacation Rental Marketplace","vrent");
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO settings VALUES("1","name","Vacation Rental","general");
INSERT INTO settings VALUES("2","logo","logo.png","general");
INSERT INTO settings VALUES("3","favicon","favicon.ico","general");
INSERT INTO settings VALUES("4","head_code","","general");
INSERT INTO settings VALUES("5","default_currency","1","general");
INSERT INTO settings VALUES("6","default_language","1","general");
INSERT INTO settings VALUES("7","email_logo","email_logo.png","general");
INSERT INTO settings VALUES("8","username","techvillage_business_api1.gmail.com","PayPal");
INSERT INTO settings VALUES("9","password","9DDYZX2JLA6QL668","PayPal");
INSERT INTO settings VALUES("10","signature","AFcWxV21C7fd0v3bYYYRCpSSRl31ABayz5pdk84jno7.Udj6-U8ffwbT","PayPal");
INSERT INTO settings VALUES("11","mode","sandbox","PayPal");
INSERT INTO settings VALUES("12","publishable","pk_test_c2TDWXsjPkimdM8PIltO6d8H","Stripe");
INSERT INTO settings VALUES("13","secret","sk_test_UWTgGYIdj8igmbVMgTi0ILPm","Stripe");
INSERT INTO settings VALUES("14","driver","smtp","email");
INSERT INTO settings VALUES("15","host","mail.techvill.net","email");
INSERT INTO settings VALUES("16","port","587","email");
INSERT INTO settings VALUES("17","from_address","vrent@techvill.net","email");
INSERT INTO settings VALUES("18","from_name","Vrent","email");
INSERT INTO settings VALUES("19","encryption","tls","email");
INSERT INTO settings VALUES("20","username","vrent@techvill.net","email");
INSERT INTO settings VALUES("21","password","(Oov$$P?)ImE","email");
INSERT INTO settings VALUES("22","facebook","#","join_us");
INSERT INTO settings VALUES("23","google_plus","#","join_us");
INSERT INTO settings VALUES("24","twitter","#","join_us");
INSERT INTO settings VALUES("25","linkedin","#","join_us");
INSERT INTO settings VALUES("26","pinterest","#","join_us");
INSERT INTO settings VALUES("27","youtube","#","join_us");
INSERT INTO settings VALUES("28","instagram","#","join_us");
INSERT INTO settings VALUES("29","key","AIzaSyBYscmIGBbHydud3Vd_3HcvF_ZiBXX6uZw","googleMap");
INSERT INTO settings VALUES("30","client_id","155732176097-s2b8liiqj6v8l39r25baq31vm3adg8uv.apps.googleusercontent.com","google");
INSERT INTO settings VALUES("31","client_secret","ltyqX9vFSqkaRjo4-rxphynm","google");
INSERT INTO settings VALUES("32","client_id","166441230733266","facebook");
INSERT INTO settings VALUES("33","client_secret","0787364d54422d8ff0bbb646c7f3231e","facebook");
INSERT INTO settings VALUES("34","email_status","1","email");
INSERT INTO settings VALUES("44","paypal_status","1","PayPal");





CREATE TABLE IF NOT EXISTS `space_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO space_type VALUES("1","Entire home/apt","Entire home/apt","Active");
INSERT INTO space_type VALUES("2","Private room","Private room","Active");
INSERT INTO space_type VALUES("3","Shared room","Shared room","Active");





CREATE TABLE IF NOT EXISTS `starting_cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO starting_cities VALUES("1","New York","starting_city_1.jpg","Active");
INSERT INTO starting_cities VALUES("2","Sydney","starting_city_2.jpg","Active");
INSERT INTO starting_cities VALUES("3","Paris","starting_city_3.jpg","Active");
INSERT INTO starting_cities VALUES("4","Barcelona","starting_city_4.jpg","Active");
INSERT INTO starting_cities VALUES("5","Thailand","starting_city_5.jpg","Active");
INSERT INTO starting_cities VALUES("6","Switzerland","starting_city_6.jpg","Active");





CREATE TABLE IF NOT EXISTS `timezone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO user_details VALUES("1","1","date_of_birth","1994-7-16");
INSERT INTO user_details VALUES("2","2","date_of_birth","1988-7-15");
INSERT INTO user_details VALUES("3","3","date_of_birth","1994-7-16");





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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users VALUES("1","John","Smith","test@techvill.net","$2y$10$OuldzPrPSk8VbFn70Oy98eTbFEqVFI5P9vDgeL1E.iaZR/QIyCvsm","profile_1523427162.png","0","Active","BdSLSt0Ssxu0tSAPvzSdrOWumWMLVJcecgTC3VQeZG3TVPooAmUxTHEvNgEI","2018-04-11 13:11:26","2018-04-12 18:09:57");
INSERT INTO users VALUES("2","customer","customer","customer@techvill.net","$2y$10$XCCRysiYVaXK07dmxITca.G3WbXkXE6Veb34UsSu/rJrljViMutqy","profile_1523427507.jpg","0","Active","qEr3wh4jB6OsQwjAdYfAcgoNYd0iKExAIDgGBRqrWMtNSqlbIg5RWOEk1E7d","2018-04-11 13:17:13","2018-04-11 13:18:27");
INSERT INTO users VALUES("3","Mahfuza","sinthy","mahfuzasinthy@gmail.com","$2y$10$X5yUcuvbiATOzksK8wLvdOd3.B2z3bY21Z1.TNFhKmHoImKWbocBq","profile_1523525839.png","0","Active","eTc2llMif3t2LomZxEF6H8dmb3LNuULWM13BQuIm6E51MqpgQj4V6Sgj6KeT","2018-04-12 15:56:13","2018-04-12 19:00:33");





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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO users_verification VALUES("1","1","no","no","no","no","no","","","");
INSERT INTO users_verification VALUES("2","2","no","no","yes","no","no","","112802396600335739450","");
INSERT INTO users_verification VALUES("3","3","no","no","no","no","no","","","");



