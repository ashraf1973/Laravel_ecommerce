-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2017 at 03:09 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce_batch06`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` tinyint(4) NOT NULL DEFAULT '0',
  `publication_status` tinyint(4) NOT NULL DEFAULT '1',
  `deletion_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `category_description`, `parent_id`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(3, 'Fashion', 'Fashion have three child category  mans woman kid ', 0, 1, 1, NULL, NULL),
(7, 'Computer', 'Category Description....', 0, 1, 1, NULL, NULL),
(8, 'Mobile', 'Mobile Sub Category', 0, 1, 1, NULL, NULL),
(10, 'Laptop', 'Laptop Sub Category Description', 7, 1, 1, NULL, NULL),
(11, 'Desktop', '', 7, 1, 1, NULL, NULL),
(12, 'Normal Mobile', 'Normal Mobile Description', 8, 1, 1, NULL, NULL),
(13, 'Smart Phone', 'Smart Phone Description....', 8, 1, 1, NULL, NULL),
(15, 'Men', 'mans is the child category of Fashion', 3, 1, 1, NULL, NULL),
(16, 'Women', '-----------', 3, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacture`
--

CREATE TABLE `manufacture` (
  `id` int(10) UNSIGNED NOT NULL,
  `manufacture_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `manufacture_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication_status` tinyint(4) NOT NULL DEFAULT '1',
  `deletion_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manufacture`
--

INSERT INTO `manufacture` (`id`, `manufacture_name`, `manufacture_description`, `publication_status`, `deletion_status`, `created_at`, `updated_at`) VALUES
(1, 'HP', 'this is description of hp', 1, 0, NULL, NULL),
(2, 'Samsung', 'this is description of Samsung', 1, 0, NULL, NULL),
(3, 'Toshiba', 'this is description of Toshiba', 1, 0, NULL, NULL),
(4, 'LG', 'this is description of LG', 1, 0, NULL, NULL),
(6, 'Asus', '---', 1, 1, NULL, NULL),
(7, 'Intel', '', 1, 1, NULL, NULL),
(9, 'Samsung Mobile', '-----------', 1, 1, NULL, NULL),
(10, 'iPhone', '', 1, 1, NULL, NULL),
(11, 'Arong', 'fashion', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(32, '2014_10_12_000000_create_users_table', 1),
(33, '2014_10_12_100000_create_password_resets_table', 1),
(34, '2016_10_11_155208_create_category_table', 1),
(35, '2016_10_13_134724_create_manufacture_table', 1),
(36, '2016_10_13_141957_create_product_table', 1),
(37, '2016_10_16_132037_create_admin_table', 2),
(38, '2017_02_01_195733_create_tbl_customer_table', 3),
(39, '2017_02_02_170223_create_tbl_shipping_table', 4),
(40, '2017_02_03_122721_create_tbl_payment_table', 5),
(41, '2017_02_03_122920_create_tbl_order_table', 5),
(42, '2017_02_03_123154_create_tbl_order_details_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `manufacture_id` int(10) UNSIGNED NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8_unicode_ci NOT NULL,
  `new_price` double(8,2) NOT NULL,
  `old_price` double(8,2) NOT NULL,
  `publication_status` tinyint(4) NOT NULL DEFAULT '1',
  `deletion_status` tinyint(4) NOT NULL DEFAULT '1',
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL,
  `product_status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `category_id`, `manufacture_id`, `short_description`, `long_description`, `new_price`, `old_price`, `publication_status`, `deletion_status`, `is_featured`, `stock`, `product_status`, `created_at`, `updated_at`) VALUES
(1, 'Asus XL9000', 10, 6, '-------------', '-------------', 35000.00, 32000.00, 1, 1, 1, 10, NULL, NULL, NULL),
(2, 'Intel Core I5', 11, 7, '---------------', '-----------', 50000.00, 52000.00, 1, 1, 0, 10, NULL, NULL, NULL),
(3, 'IPhone 8', 13, 10, '--------------', '--------------', 74000.00, 72000.00, 1, 1, 1, 20, NULL, NULL, NULL),
(4, 'Unstitched Cotton Three Piece', 16, 11, 'Unstitched Three Pieces. Embroidery Work. Kameez: Cotton. Salwar: Cotton. Orna: Chiffon. Stylish Design. Brand new product.', 'Unstitched Three Pieces. Embroidery Work. Kameez: Cotton. Salwar: Cotton. Orna: Chiffon. Stylish Design. Brand new product. Unstitched Three Pieces. Embroidery Work. Kameez: Cotton. Salwar: Cotton. Orna: Chiffon. Stylish Design. Brand new product.', 599.00, 750.00, 1, 1, 1, 20, NULL, NULL, NULL),
(5, 'Printed Cotton Three Pieces', 16, 11, 'Unstitched Three Pieces.	printed Work.	Kameez: Cotton. Salwar: Cotton	Orna: Chiffon.	Stylish Design.	Brand new product.', 'Unstitched Three Pieces.	printed Work.	Kameez: Cotton. Salwar: Cotton	Orna: Chiffon.	Stylish Design.	Brand new product. Unstitched Three Pieces.	printed Work.	Kameez: Cotton. Salwar: Cotton	Orna: Chiffon.	Stylish Design.	Brand new product.', 645.00, 800.00, 1, 1, 0, 20, NULL, NULL, NULL),
(6, 'Gents Cotton Solid Color Polo Shirt', 15, 11, 'Gents cotton solid color polo shirt. size:S, M, L, XL,XXL. fabrication:GSM.', 'Gents cotton solid color polo shirt. size:S, M, L, XL,XXL. fabrication:GSM. Gents cotton solid color polo shirt. size:S, M, L, XL,XXL. fabrication:GSM.', 550.00, 700.00, 1, 1, 1, 10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin_lavel` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `admin_name`, `admin_email`, `admin_password`, `admin_lavel`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'NAHID', 'nahid@gmail.com', '21232f297a57a5a743894a0e4a801fc3', 1, NULL, NULL, NULL),
(2, 'Md.Ashrafuzzaman', 'ashrafdiu1973@gmail.com', '1f0d6d19910c01d0a48c4792ea3449a4', 2, NULL, NULL, NULL),
(3, 'imran', 'imran@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `first_name`, `last_name`, `company_name`, `email_address`, `password`, `address`, `mobile`, `city`, `zip_code`, `country`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ashraf', 'zaman', 'TT', 'ashraf@gmail.com', '508924b0eac2ba101ada28841c931e44', 'Rajabazar', '01773621713', 'dhaka', '1205', 'Bangladesh', NULL, NULL, NULL),
(2, 'imran', 'hossain', 'Nelam', 'imran@gmail.com', 'e18fdc9fa7cc2b5f4e497d21a48ea3b7', 'rajabazar', '01773621713', 'Dhaka', '1215', 'Australia', NULL, NULL, NULL),
(3, 'ashraf', 'zaman', 'Nelam', 'ashrafdiu1973@gmail.com', '508924b0eac2ba101ada28841c931e44', 'rajabazar', '01773621713', 'Dhaka', '1215', 'Canada', NULL, NULL, NULL),
(4, 'ashraf', 'zaman', 'Nelam', 'ashrafdiu@gmail.com', '508924b0eac2ba101ada28841c931e44', 'rajabazar', '01773621713', 'Dhaka', '1215', 'Australia', NULL, NULL, NULL),
(5, 'ashraf', 'zaman', 'Nelam', 'ashraf1973@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'rajabazar', '01773621713', 'Dhaka', '1215', 'USA', NULL, NULL, NULL),
(6, 'ashraf', 'zaman', 'Nelam', 'nahid@gmail.com', '508924b0eac2ba101ada28841c931e44', 'rajabazar', '01773621713', 'Dhaka', '1215', 'USA', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `order_total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `customer_id`, `shipping_id`, `payment_id`, `order_status`, `order_total`, `created_at`, `updated_at`) VALUES
(1, 6, 3, 2, 'pending', 1195.00, NULL, NULL),
(2, 6, 3, 3, 'pending', 1195.00, NULL, NULL),
(3, 5, 4, 4, 'pending', 74000.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `product_sales_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_sales_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'Gents Cotton Solid Color Polo Shirt', 550.00, 1, NULL, NULL),
(2, 1, 5, 'Printed Cotton Three Pieces', 645.00, 1, NULL, NULL),
(3, 2, 6, 'Gents Cotton Solid Color Polo Shirt', 550.00, 1, NULL, NULL),
(4, 2, 5, 'Printed Cotton Three Pieces', 645.00, 1, NULL, NULL),
(5, 3, 3, 'IPhone 8', 74000.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(10) UNSIGNED NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_payment`
--

INSERT INTO `tbl_payment` (`payment_id`, `payment_type`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'pending', NULL, NULL),
(2, 'paypal', 'pending', NULL, NULL),
(3, 'cash_on_delivery', 'pending', NULL, NULL),
(4, 'paypal', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_image`
--

CREATE TABLE `tbl_product_image` (
  `product_image_id` int(10) NOT NULL,
  `product_id` int(5) NOT NULL,
  `image_option` varchar(100) NOT NULL,
  `image_label` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_image`
--

INSERT INTO `tbl_product_image` (`product_image_id`, `product_id`, `image_option`, `image_label`) VALUES
(1, 1, 'product_image/135128asus_1.jpg', 1),
(2, 1, 'product_image/135128asus-zenbook-ux305f-bigcl.jpg', 0),
(3, 2, 'product_image/135314indel_desktop.jpg', 1),
(4, 2, 'product_image/135314intel.jpg', 0),
(5, 3, 'product_image/135507iphone7.jpg', 1),
(6, 3, 'product_image/135507iphone7_new.jpg', 0),
(7, 4, 'product_image/0949141 (1).jpg', 1),
(8, 4, 'product_image/0949142 (1).jpg', 0),
(9, 5, 'product_image/0952531 (2).jpg', 1),
(10, 5, 'product_image/0952532 (2).jpg', 0),
(11, 6, 'product_image/095655cf_polo_004_2_.jpg', 1),
(12, 6, 'product_image/095655cf_polo_004_1_.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shipping`
--

CREATE TABLE `tbl_shipping` (
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_shipping`
--

INSERT INTO `tbl_shipping` (`shipping_id`, `first_name`, `last_name`, `company_name`, `email_address`, `address`, `city`, `mobile_number`, `zip_code`, `country`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ashraf', 'zaman', 'Nelam', 'ashrafdiu1973@gmail.com', 'rajabazar', 'Dhaka', '01773621713', '1215', 'USA', NULL, NULL, NULL),
(2, 'ashraf', 'zaman', 'Nelam', 'ashrafdiu1973@gmail.com', 'rajabazar', 'Dhaka', '01773621713', '1215', 'USA', NULL, NULL, NULL),
(3, 'ashraf', 'zaman', 'Nelam', 'nahid@gmail.com', 'rajabazar', 'Dhaka', '01773621713', '1215', 'USA', NULL, NULL, NULL),
(4, 'ashraf', 'zaman', 'Nelam', 'ashrafdiu1973@gmail.com', 'rajabazar', 'Dhaka', '01773621713', '1215', 'USA', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_category_name_unique` (`category_name`);

--
-- Indexes for table `manufacture`
--
ALTER TABLE `manufacture`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manufacture_manufacture_name_unique` (`manufacture_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_product_name_unique` (`product_name`),
  ADD KEY `product_category_id_foreign` (`category_id`),
  ADD KEY `product_manufacture_id_foreign` (`manufacture_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_admin_admin_email_unique` (`admin_email`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_product_image`
--
ALTER TABLE `tbl_product_image`
  ADD PRIMARY KEY (`product_image_id`);

--
-- Indexes for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `manufacture`
--
ALTER TABLE `manufacture`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_product_image`
--
ALTER TABLE `tbl_product_image`
  MODIFY `product_image_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_shipping`
--
ALTER TABLE `tbl_shipping`
  MODIFY `shipping_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_manufacture_id_foreign` FOREIGN KEY (`manufacture_id`) REFERENCES `manufacture` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
