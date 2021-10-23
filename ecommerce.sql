-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2021 at 03:23 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(25, 'quam debitis', 'quam-debitis', '2021-07-16 05:43:03', '2021-07-16 05:43:03'),
(26, 'debts', 'debts', '2021-07-16 05:43:03', '2021-09-09 06:03:58'),
(27, 'nam suscipit', 'nam-suscipit', '2021-07-16 05:43:03', '2021-07-16 05:43:03'),
(28, 'ad perferendis', 'ad-perferendis', '2021-07-16 05:43:03', '2021-07-16 05:43:03'),
(29, 'delectus veniam', 'delectus-veniam', '2021-07-16 05:43:03', '2021-07-16 05:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'thương', 'ngothuong2409@gmail.com', '0382010106', 'Text thoi nha', '2021-09-08 21:52:33', '2021-09-08 21:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `created_at`, `updated_at`, `expiry_date`) VALUES
(1, 'fffff50', 'percent', '50.00', '700.00', '2021-08-02 20:53:38', '2021-08-04 19:58:02', '2021-08-05 17:00:00'),
(2, 'ol50', 'fixed', '510.00', '1000.00', '2021-08-04 19:40:23', '2021-09-09 05:55:49', '2021-08-09 17:00:00'),
(3, 'c40', 'fixed', '300.00', '500.00', '2021-08-04 20:57:16', '2021-08-04 23:48:54', '2021-08-03 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '25,26,27,28,29', 8, '2021-07-20 17:00:00', '2021-07-21 00:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'silder 4', 'subslider 4', '200', 'localhost:8000/shop', '1626789767.jpg', 1, '2021-07-20 07:02:47', '2021-07-20 07:10:40'),
(4, 'slider 2', '200', 'subslider 2', 'localhost:8000', '1626789791.jpg', 1, '2021-07-20 07:03:11', '2021-07-20 07:03:11'),
(5, 'silder 3', 'subslider 3', '200', 'localhost:8000/shop', '1626790088.jpg', 1, '2021-07-20 07:08:08', '2021-07-20 07:14:33');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_07_15_062304_create_sessions_table', 1),
(8, '2021_07_16_110131_create_categories_table', 2),
(9, '2021_07_16_110424_create_products_table', 3),
(10, '2021_07_20_023221_create_home_sliders_table', 4),
(11, '2021_07_21_051632_create_home_categories_table', 5),
(12, '2021_07_21_121115_create_sales_table', 6),
(13, '2021_07_29_031927_create_coupons_table', 7),
(14, '2021_08_05_020414_add_expiry_date_to_coupons_table', 8),
(15, '2021_08_05_042501_create_cache_table', 9),
(16, '2021_08_07_024511_create_orders_table', 9),
(17, '2021_08_07_024613_create_order_items_table', 9),
(18, '2021_08_07_024647_create_shippings_table', 9),
(19, '2021_08_07_024717_create_transactions_table', 9),
(20, '2021_08_11_062221_add_status_to_transaction', 10),
(21, '2021_09_06_035012_add_delivered_cancled_date_to_orders_table', 11),
(22, '2021_09_06_113839_create_reviews_table', 12),
(23, '2021_09_06_114929_add_rstatus_to_order_items_table', 12),
(24, '2021_09_09_035157_create_contacts_table', 13),
(25, '2021_09_09_090853_create_settings_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `canceled_date`) VALUES
(1, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 22:53:18', '2021-08-10 22:53:18', NULL, NULL),
(2, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 22:54:53', '2021-08-10 22:54:53', NULL, NULL),
(3, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 22:56:27', '2021-08-10 22:56:27', NULL, NULL),
(4, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 22:58:23', '2021-08-10 22:58:23', NULL, NULL),
(5, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 23:01:42', '2021-08-10 23:01:42', NULL, NULL),
(6, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 23:02:13', '2021-08-10 23:02:13', NULL, NULL),
(7, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 23:05:14', '2021-08-10 23:05:14', NULL, NULL),
(8, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 23:48:20', '2021-08-10 23:48:20', NULL, NULL),
(9, 1, '466.00', '0.00', '97.86', '563.86', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', 'ordered', 1, '2021-08-10 23:50:01', '2021-08-10 23:50:01', NULL, NULL),
(10, 1, '271.00', '0.00', '56.91', '327.91', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 22:45:28', '2021-08-11 22:45:28', NULL, NULL),
(11, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 22:47:50', '2021-08-11 22:47:50', NULL, NULL),
(12, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 22:53:12', '2021-08-11 22:53:12', NULL, NULL),
(13, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 22:53:49', '2021-08-11 22:53:49', NULL, NULL),
(14, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 23:07:52', '2021-08-11 23:07:52', NULL, NULL),
(15, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 23:12:38', '2021-08-11 23:12:38', NULL, NULL),
(16, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 23:13:31', '2021-08-11 23:13:31', NULL, NULL),
(17, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 23:26:05', '2021-08-11 23:26:05', NULL, NULL),
(18, 1, '483.00', '0.00', '101.43', '584.43', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'ordered', 1, '2021-08-11 23:26:15', '2021-08-11 23:26:15', NULL, NULL),
(19, 1, '474.00', '0.00', '99.54', '573.54', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '121001', 'delivered', 1, '2021-08-11 23:43:50', '2021-09-05 21:26:24', '2021-09-06', NULL),
(20, 1, '474.00', '0.00', '99.54', '573.54', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '121001', 'canceled', 1, '2021-08-11 23:44:03', '2021-09-05 21:25:55', NULL, '2021-09-06'),
(21, 2, '379.00', '0.00', '79.59', '458.59', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', 'canceled', 0, '2021-09-05 20:44:42', '2021-09-06 04:31:15', '2021-09-06', '2021-09-06'),
(22, 4, '745.00', '0.00', '156.45', '901.45', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', '104/116/19 duong so 19 binh hung hoa binh tan', '104/116/19 duong so 19 binh hung hoa binh tan', 'TP HCM', 'Ho Chi Minh', 'vietnam', '70000', 'ordered', 0, '2021-09-10 20:43:00', '2021-09-10 20:43:00', NULL, NULL),
(23, 4, '686.00', '0.00', '144.06', '830.06', 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', '104/116/19 duong so 19 binh hung hoa binh tan', '104/116/19 duong so 19 binh hung hoa binh tan', 'TP HCM', 'Ho Chi Minh', 'vietnam', '70000', 'ordered', 0, '2021-09-10 20:45:23', '2021-09-10 20:45:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `created_at`, `updated_at`, `rstatus`) VALUES
(1, 25, 5, '379.00', 1, '2021-08-10 23:01:42', '2021-08-10 23:01:42', 0),
(2, 28, 5, '87.00', 1, '2021-08-10 23:01:42', '2021-08-10 23:01:42', 0),
(3, 25, 6, '379.00', 1, '2021-08-10 23:02:13', '2021-08-10 23:02:13', 0),
(4, 28, 6, '87.00', 1, '2021-08-10 23:02:13', '2021-08-10 23:02:13', 0),
(5, 25, 7, '379.00', 1, '2021-08-10 23:05:14', '2021-08-10 23:05:14', 0),
(6, 28, 7, '87.00', 1, '2021-08-10 23:05:14', '2021-08-10 23:05:14', 0),
(7, 25, 8, '379.00', 1, '2021-08-10 23:48:20', '2021-08-10 23:48:20', 0),
(8, 28, 8, '87.00', 1, '2021-08-10 23:48:20', '2021-08-10 23:48:20', 0),
(9, 25, 9, '379.00', 1, '2021-08-10 23:50:01', '2021-08-10 23:50:01', 0),
(10, 28, 9, '87.00', 1, '2021-08-10 23:50:01', '2021-08-10 23:50:01', 0),
(11, 27, 10, '271.00', 1, '2021-08-11 22:45:28', '2021-08-11 22:45:28', 0),
(12, 27, 11, '271.00', 1, '2021-08-11 22:47:50', '2021-08-11 22:47:50', 0),
(13, 29, 11, '212.00', 1, '2021-08-11 22:47:50', '2021-08-11 22:47:50', 0),
(14, 27, 12, '271.00', 1, '2021-08-11 22:53:12', '2021-08-11 22:53:12', 0),
(15, 29, 12, '212.00', 1, '2021-08-11 22:53:12', '2021-08-11 22:53:12', 0),
(16, 27, 13, '271.00', 1, '2021-08-11 22:53:49', '2021-08-11 22:53:49', 0),
(17, 29, 13, '212.00', 1, '2021-08-11 22:53:49', '2021-08-11 22:53:49', 0),
(18, 27, 14, '271.00', 1, '2021-08-11 23:07:52', '2021-08-11 23:07:52', 0),
(19, 29, 14, '212.00', 1, '2021-08-11 23:07:52', '2021-08-11 23:07:52', 0),
(20, 27, 15, '271.00', 1, '2021-08-11 23:12:38', '2021-08-11 23:12:38', 0),
(21, 29, 15, '212.00', 1, '2021-08-11 23:12:38', '2021-08-11 23:12:38', 0),
(22, 27, 16, '271.00', 1, '2021-08-11 23:13:31', '2021-08-11 23:13:31', 0),
(23, 29, 16, '212.00', 1, '2021-08-11 23:13:31', '2021-08-11 23:13:31', 0),
(24, 27, 17, '271.00', 1, '2021-08-11 23:26:05', '2021-08-11 23:26:05', 0),
(25, 29, 17, '212.00', 1, '2021-08-11 23:26:05', '2021-08-11 23:26:05', 0),
(26, 27, 18, '271.00', 1, '2021-08-11 23:26:15', '2021-08-11 23:26:15', 0),
(27, 29, 18, '212.00', 1, '2021-08-11 23:26:15', '2021-08-11 23:26:15', 0),
(28, 30, 19, '474.00', 1, '2021-08-11 23:43:51', '2021-08-11 23:43:51', 0),
(29, 30, 20, '474.00', 1, '2021-08-11 23:44:03', '2021-08-11 23:44:03', 0),
(30, 25, 21, '379.00', 1, '2021-09-05 20:44:42', '2021-09-06 06:41:07', 1),
(31, 27, 22, '271.00', 1, '2021-09-10 20:43:00', '2021-09-10 20:43:00', 0),
(32, 30, 22, '474.00', 1, '2021-09-10 20:43:01', '2021-09-10 20:43:01', 0),
(33, 29, 23, '212.00', 1, '2021-09-10 20:45:23', '2021-09-10 20:45:23', 0),
(34, 30, 23, '474.00', 1, '2021-09-10 20:45:23', '2021-09-10 20:45:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`) VALUES
(25, 'aut perspiciatis', 'aut-perspiciatis', 'Soluta officiis fuga dolor iure. Et in impedit alias reprehenderit facilis. Ut eos reprehenderit aut excepturi similique.', 'Eum officiis aspernatur maiores aut quia. Aliquam expedita facere ipsum nobis ut dignissimos. Fugit quo dolorem commodi exercitationem aspernatur aliquam et. Nemo sed enim in consectetur quisquam tempora. Id sed accusamus impedit omnis ex odit. Aut porro veniam neque qui ea. Labore quaerat et vel sapiente minus. Optio adipisci eos autem exercitationem tenetur voluptatibus.', '379.00', '300.00', 'DIGI153', 'instock', 0, 161, 'digital_16.jpg', NULL, 27, '2021-07-16 05:44:59', '2021-07-21 04:47:15'),
(27, 'totam reiciendis', 'totam-reiciendis', 'Tempore adipisci incidunt modi est aut. Qui quo sit dolorem quod illo sit et. Laudantium quia doloremque enim ratione dolorum. Voluptatem autem fugiat non qui quae.', 'Necessitatibus et omnis aliquid ipsa est molestias facere earum. Harum provident consequatur et sunt. Excepturi perferendis ea minus et in eveniet. Ea voluptatem corporis velit cum rerum placeat. Minima assumenda quaerat repudiandae ullam quis iusto est. Dolor ipsum non sint qui autem labore. Porro architecto omnis atque et sequi nobis. Aperiam itaque voluptas iure placeat et magnam odit et. Ut est sed magnam repellendus.', '271.00', '250.00', 'DIGI237', 'instock', 0, 198, 'digital_09.jpg', NULL, 25, '2021-07-16 05:44:59', '2021-07-21 04:47:34'),
(28, 'cumque expedita', 'cumque-expedita', 'Sint quibusdam illum error asperiores rerum. Sequi molestias pariatur soluta qui rerum qui ab expedita. Tenetur sed nulla pariatur adipisci.', 'Consequatur maiores quia magni pariatur. Occaecati qui adipisci aut iusto eum laudantium. Id enim ullam est porro rem. Nihil iure recusandae dicta eligendi voluptatum non sint. Eum blanditiis non incidunt quidem. Cupiditate doloribus est pariatur qui animi nemo quia et. Dolores ut reprehenderit sit voluptates perspiciatis tempore a.', '87.00', '86.00', 'DIGI428', 'instock', 0, 176, 'digital_12.jpg', NULL, 28, '2021-07-16 05:44:59', '2021-07-21 04:47:54'),
(29, 'porro ipsam', 'porro-ipsam', 'Debitis velit omnis blanditiis debitis modi minima. Hic eligendi quas cumque libero rerum fuga. Corrupti doloribus reprehenderit qui recusandae nihil id maxime. Ad aut asperiores eligendi qui.', 'Reprehenderit ab minus aliquid sunt non reiciendis. Ut ut aut in minima sit ut. Et provident dicta explicabo provident aliquam voluptatibus. Occaecati qui rem quisquam commodi. Dolorem omnis voluptatem deleniti nesciunt voluptas ut. Ratione quia nihil voluptatem fugiat nobis id. Culpa qui labore voluptate quia recusandae sunt laboriosam.', '212.00', '210.00', 'DIGI368', 'instock', 0, 181, 'digital_15.jpg', NULL, 25, '2021-07-16 05:44:59', '2021-07-21 04:48:15'),
(30, 'rerum ea', 'rerum-ea', 'Expedita aut non alias rem sed aut doloremque deserunt. Tenetur dicta excepturi adipisci. Voluptatem suscipit deleniti corrupti repellat consequatur. Velit ipsum omnis placeat aut.', 'Mollitia tempore ut velit ut voluptatibus est et. Atque est debitis eum nesciunt. Nesciunt molestiae quod et dolor et id repellat. Ducimus ut dicta aut iste aut. Ut quaerat harum occaecati nihil at. Culpa dolor eos nihil labore ea minus magni. Qui cum vitae id aliquam ea sequi officia. Quis qui ullam ratione inventore vel non accusantium nostrum. Hic corrupti accusamus voluptatum. Est eaque ea accusantium iste sed dolores. Quos omnis illo mollitia.', '474.00', '472.00', 'DIGI212', 'instock', 0, 139, 'digital_13.jpg', NULL, 27, '2021-07-16 05:44:59', '2021-07-21 04:48:35'),
(31, 'aliquid maiores', 'aliquid-maiores', 'Et molestiae recusandae et non delectus neque. Sed vero dignissimos omnis velit laborum. Vitae ipsum cumque nostrum mollitia consequatur nihil nam. Animi vero voluptatum nihil quo.', 'Quas enim dolores labore autem non repellat qui. Quae iure non non mollitia suscipit officia qui repellat. Consequatur assumenda illum sint dolores est deserunt. Dicta harum cupiditate et quidem mollitia sunt nobis. Aliquid fuga consequatur sequi laboriosam laboriosam. In explicabo quae accusamus dolore natus. Reiciendis sunt aliquam debitis praesentium. Autem laborum dolores est et.', '45.00', NULL, 'DIGI165', 'instock', 0, 162, 'digital_01.jpg', NULL, 29, '2021-07-16 05:44:59', '2021-07-16 05:44:59'),
(32, 'cum repellat', 'cum-repellat', 'Enim libero id deserunt doloribus. Doloribus reiciendis mollitia quod omnis ducimus iusto. Voluptatem laudantium ducimus et ut. Eligendi quas eius maiores ab doloribus laudantium et.', 'Perferendis deleniti impedit consequatur repellat nihil voluptates. Quidem minima fuga iusto qui explicabo a corrupti ullam. Fugit iste qui voluptas saepe consequatur eum. Omnis magnam molestias non voluptatem maxime qui aut. Qui aut eaque ea totam vitae aut hic. Est perferendis quaerat esse qui id. Et qui at dignissimos vitae. Dolor ducimus inventore quo sit. Est nesciunt quis laboriosam amet odio. Et vero exercitationem quisquam omnis impedit tempore.', '466.00', NULL, 'DIGI458', 'instock', 0, 153, 'digital_06.jpg', NULL, 28, '2021-07-16 05:44:59', '2021-07-16 05:44:59'),
(33, 'est aut', 'est-aut', 'Sed cum quo vero fuga laudantium voluptatibus eligendi. Nihil quia magnam nam quidem quam accusamus cumque. Possimus et dolores sapiente et minus. Neque est et dignissimos iusto.', 'Recusandae modi exercitationem voluptate excepturi. Et illum architecto aut necessitatibus aspernatur. Eligendi illum nobis blanditiis velit. Qui ea voluptate nobis sunt recusandae aut et. Quam nam ut corrupti minima repudiandae. Sed esse autem quaerat ea expedita expedita. Saepe veritatis totam mollitia deserunt id facilis maxime. Recusandae illum quos libero fuga et nulla. Adipisci libero repellat sint voluptas quisquam. Odio dignissimos quos id a nisi officiis.', '59.00', NULL, 'DIGI383', 'instock', 0, 198, 'digital_08.jpg', NULL, 26, '2021-07-16 05:44:59', '2021-07-16 05:44:59'),
(34, 'inventore quia', 'inventore-quia', 'Doloribus ratione eius omnis qui eos modi. Sequi dolor minima ipsum possimus nulla. Sunt voluptatem nemo dolorem autem est qui.', 'Ea est non qui nulla cumque. Ea sint asperiores assumenda sunt sunt. In laborum accusantium rerum reprehenderit culpa sapiente qui. Odio qui iusto et temporibus possimus quas quasi veritatis. Magni sit blanditiis laboriosam eaque unde. Dolorum reprehenderit nesciunt laborum iure optio. Incidunt dicta voluptatem velit ut non dolorum. Quas qui magni eum repellat adipisci et.', '231.00', NULL, 'DIGI32', 'instock', 0, 191, 'digital_04.jpg', NULL, 25, '2021-07-16 05:44:59', '2021-07-16 05:44:59'),
(35, 'praesentium occaecati', 'praesentium-occaecati', 'Doloribus debitis aut velit neque blanditiis fugiat. Et officia sunt in quas et doloribus. Qui eos ut molestias aut totam fugiat. Eum nihil sint iure id temporibus et.', 'Expedita quis aut laudantium quia. Pariatur sequi beatae quos laboriosam dolorem fugit perferendis. Quaerat temporibus vel at. Temporibus qui perferendis doloremque. Nihil autem aliquam pariatur alias maxime odit animi velit. Accusantium placeat qui quasi eos corporis alias enim. Consectetur magni sed ex quis.', '26.00', NULL, 'DIGI168', 'instock', 0, 149, 'digital_03.jpg', NULL, 28, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(36, 'magni consequatur', 'magni-consequatur', 'Aut non laudantium animi et. Quo aspernatur alias mollitia molestiae. Ex maiores soluta eaque dolorem quasi. Ipsa enim qui qui nulla architecto quidem voluptatum.', 'Consequuntur est labore nihil rem corrupti ipsam qui. Animi deserunt quia qui et sunt maiores repudiandae. Recusandae animi neque vitae quos molestias ut autem. Error quae ea pariatur facere aut. Repellat officiis autem minus ut porro et. Vel sequi voluptas tenetur voluptas quia cupiditate sed. Eaque magnam consequatur reprehenderit corrupti officia.', '70.00', NULL, 'DIGI382', 'instock', 0, 184, 'digital_05.jpg', NULL, 27, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(37, 'quaerat quia', 'quaerat-quia', 'Modi corporis eos rem in voluptatibus perspiciatis officiis. Laborum voluptatibus temporibus ab.', 'Sapiente explicabo sit numquam minima temporibus doloribus. Sed unde aliquam fugiat et. Est at ut et odio facilis dolorum sit. Culpa ullam animi natus non. Ducimus rerum sit sequi sequi voluptatibus facilis sed quae. Fugiat deleniti asperiores est qui itaque cupiditate. Velit ut et quos magnam et. Voluptas deserunt et reiciendis libero eum sint sunt. Aut ut deleniti magni et in. Quia eveniet aliquam voluptate rem. Ut voluptatem distinctio et quod porro.', '237.00', NULL, 'DIGI267', 'instock', 0, 163, 'digital_17.jpg', NULL, 29, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(38, 'mollitia modi', 'mollitia-modi', 'Voluptatem ipsa reprehenderit nam ullam velit qui. Cupiditate expedita quis accusamus nostrum quo laborum dicta. Cupiditate reprehenderit ut esse ratione eligendi modi optio.', 'Autem laboriosam hic tenetur autem. Alias animi iusto vero tenetur. Nemo cupiditate velit incidunt vel. Qui rerum dolores aut excepturi consequatur quia. Voluptatem deleniti impedit reiciendis qui. Assumenda harum corrupti repellendus saepe natus. Voluptates rerum odit qui nihil expedita provident. Dolorum suscipit qui distinctio ea. Reprehenderit eum in iste deleniti provident. Laborum eaque accusantium dignissimos consequatur minima.', '260.00', NULL, 'DIGI67', 'instock', 0, 159, 'digital_02.jpg', NULL, 25, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(39, 'doloribus ipsam', 'doloribus-ipsam', 'Voluptas consequatur qui dolore possimus. Sequi in voluptatum numquam facilis commodi corporis in. Eius voluptas corporis consequatur qui voluptatem aut.', 'Dolorem qui eos nostrum suscipit corporis aut molestias. Voluptas quis adipisci et aut excepturi non voluptatem. Non nesciunt quod voluptas incidunt optio voluptate. Quaerat nesciunt expedita nulla ullam nisi doloremque laborum. Nihil illo sunt aut. Necessitatibus velit quia quas odit sed harum sint. Deleniti cupiditate vero consequatur. Necessitatibus id reprehenderit sunt saepe voluptas qui. Voluptate rerum odio nihil omnis voluptatem.', '485.00', NULL, 'DIGI450', 'instock', 0, 106, 'digital_19.jpg', NULL, 29, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(40, 'aut incidunt', 'aut-incidunt', 'Numquam quo et iure assumenda quia corporis. Dolorum explicabo corrupti quo aut neque eos ut veritatis. Incidunt accusamus est sequi porro aperiam est quibusdam.', 'Qui et dolorem non voluptate. Dolorem ut modi veritatis quas aliquam sint voluptatem. Consectetur atque perspiciatis omnis molestias tenetur doloremque ut. Maxime nihil velit earum. Nisi itaque neque iure ut nostrum accusantium expedita. Atque molestiae aut minus explicabo in maiores ex. Veritatis non exercitationem est voluptas dolor velit quasi. Odit nihil fugit repellendus maiores reiciendis. Eum fugiat aut et rem. Nostrum aut ea minus. Voluptatibus sint dolores nemo eligendi et.', '185.00', NULL, 'DIGI193', 'instock', 0, 181, 'digital_22.jpg', NULL, 29, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(41, 'nulla voluptates', 'nulla-voluptates', 'Nobis quo voluptas fugit velit doloremque commodi laborum. Repellat vitae aut vitae libero amet. Perferendis maiores iusto sit.', 'Magnam et rerum numquam laboriosam dolorem. Fuga quo dolor eaque est sunt autem. Facere quia in non aut. Sit non repellat ut nesciunt ut velit. Repellendus quaerat sunt et repudiandae quae quia. Qui ea vero numquam a. Dolores asperiores est et adipisci quos. Facilis earum ut id odio. Corporis qui hic minima et enim omnis voluptatem. Et iste ut alias. Ullam adipisci dolores a laudantium possimus dignissimos quos.', '69.00', NULL, 'DIGI234', 'instock', 0, 174, 'digital_07.jpg', NULL, 26, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(42, 'ut consequatur', 'ut-consequatur', 'Quibusdam quia voluptas facilis. Quas pariatur voluptatem magnam qui cum similique occaecati. Quia iure inventore laudantium molestiae asperiores et ipsam. Ipsam debitis sit est beatae fugit.', 'At tempora voluptatem officia dolorem ducimus molestiae. Accusantium voluptas maxime consectetur maxime eaque officia. Aut beatae ducimus dicta nulla officia. Numquam vero unde distinctio dolores vero voluptas officiis non. Nemo atque quas eveniet. Sunt possimus harum tempore est fuga magnam. Cumque quidem explicabo saepe occaecati voluptatem esse harum ut. Dolores tempore qui sit quos.', '274.00', NULL, 'DIGI158', 'instock', 0, 164, 'digital_21.jpg', NULL, 28, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(43, 'occaecati minus', 'occaecati-minus', 'Aliquid quidem tempora autem dolores maxime. Dignissimos voluptas maiores nesciunt quas nam ipsam facilis molestiae. Est vitae eum quo odio odio nesciunt ut.', 'Consequatur minima recusandae vero ullam. Neque ut nihil accusantium odit. Nulla delectus vel omnis ex. Ea eligendi harum ut quae non omnis. Et cumque eos porro libero consequuntur. Voluptas quaerat alias nihil quos sunt. Exercitationem fugit consequatur quae quas quos rem. Dolor velit quo aut inventore. Blanditiis a delectus exercitationem. Commodi dolore nulla ipsam in placeat ipsa. Eaque et cupiditate autem minus. Et sed velit qui eum.', '376.00', NULL, 'DIGI76', 'instock', 0, 162, 'digital_10.jpg', NULL, 29, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(44, 'non et', 'non-et', 'Aspernatur eum qui et voluptate maiores. Minus sed dolores ut saepe quos autem facere. Rem ea tempore dolorem eos neque omnis. Totam non id distinctio et nostrum velit.', 'Fugit voluptates ut perspiciatis aut ea. Autem qui non facere rerum excepturi. Dolore atque itaque ut est esse ut. Autem consequuntur quisquam hic ducimus quaerat atque dolorum. Non voluptatem aperiam sint alias suscipit. Non perferendis et ipsam neque earum. Accusantium ratione ad enim sint a sit atque. Velit unde delectus a mollitia quia. Excepturi animi dolores pariatur ratione et facilis nostrum.', '412.00', NULL, 'DIGI280', 'instock', 0, 125, 'digital_11.jpg', NULL, 28, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(45, 'aut dicta', 'aut-dicta', 'Necessitatibus dolorem nulla nostrum et odit ullam assumenda. Voluptatem vero autem eum consequatur dolore ut architecto. Dolore non ut qui veniam omnis. Eum repudiandae nihil aut enim.', 'Fuga aut natus rerum magnam nulla aliquam. Voluptates molestias aspernatur consequatur ipsam alias. Dolorem facilis in eligendi ad corporis quo et. Repudiandae non praesentium ratione ea velit eius. Amet vel repellat facilis voluptatibus qui sint deleniti adipisci. Quis ea quas sit voluptate harum laborum. Qui et ut praesentium quia ducimus dolorem. Quaerat voluptatum autem voluptatem ut. In doloremque nihil magni nesciunt. Aut iste pariatur qui aspernatur et ea.', '359.00', NULL, 'DIGI454', 'instock', 0, 172, 'digital_18.jpg', NULL, 26, '2021-07-16 05:45:00', '2021-07-16 05:45:00'),
(46, 'new product', 'new-product', 'short description', 'description', '240.00', '250.00', 'DIGI9078', 'instock', 0, 100, '1631254721.jpg', ',16312547210.jpg,16312547211.jpg', 25, '2021-07-19 01:36:33', '2021-09-09 23:18:41'),
(49, 'new product tiny', 'new-product-tiny', '<p><strong>short description<em> :&nbsp;</em></strong><em>this is a short description</em></p>', '<p><strong>Description:</strong> This is a description</p>\n<p><span style=\"text-decoration: line-through;\"><strong>Description:</strong>&nbsp;This is a description</span></p>\n<blockquote>\n<p><strong>Description:</strong>&nbsp;This is a description</p>\n</blockquote>\n<p><em><strong>Description:</strong>&nbsp;This is a description</em></p>', '200.00', '100.00', 'DIGI6798', 'instock', 0, 123, '1627044710.jpg', NULL, 26, '2021-07-23 05:51:50', '2021-07-23 05:51:50');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rating`, `comment`, `order_item_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Good', 30, '2021-09-06 06:33:30', '2021-09-06 06:33:30'),
(2, 4, 'good', 30, '2021-09-06 06:41:07', '2021-09-06 06:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2021-07-22 05:31:23', 1, NULL, '2021-08-03 20:03:48');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1s6hUF0lYuIzTA48QlMwEqVVI6tM2y276UD3ZmJF', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/97.0.206 Chrome/91.0.4472.206 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiYjRHejN3V2hSbVZTbHRDZ1ZieXZXT1h1ZUozcWxWZm5PVTFGNFJtciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jaGVja291dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRscDlpbThKby4vUTYxZW1tWklPWUouMnhITzNyM3E0TFlQa0FEN1IuSFFtR3pmMERTZTIyTyI7czo0OiJjYXJ0IjthOjE6e3M6NDoiY2FydCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6MTp7czozMjoiMGQ4ODE4MTdiYjgxZTYwMTdkMmRmOTJkMDMxM2Y2MDciO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjo5OntzOjU6InJvd0lkIjtzOjMyOiIwZDg4MTgxN2JiODFlNjAxN2QyZGY5MmQwMzEzZjYwNyI7czoyOiJpZCI7aToyNTtzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czoxNjoiYXV0IHBlcnNwaWNpYXRpcyI7czo1OiJwcmljZSI7ZDozNzk7czo3OiJvcHRpb25zIjtPOjM5OiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbU9wdGlvbnMiOjE6e3M6ODoiACoAaXRlbXMiO2E6MDp7fX1zOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQB0YXhSYXRlIjtpOjIxO3M6NDE6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBpc1NhdmVkIjtiOjA7fX19fXM6ODoiY2hlY2tvdXQiO2E6NDp7czo4OiJkaXNjb3VudCI7aTowO3M6ODoic3VidG90YWwiO3M6NjoiMzc5LjAwIjtzOjM6InRheCI7czo1OiI3OS41OSI7czo1OiJ0b3RhbCI7czo2OiI0NTguNTkiO319', 1631345358),
('52xfjbFmRV5uyse1cCaUpzxEowe5mqxxTnCynCgJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/97.0.206 Chrome/91.0.4472.206 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUhBTVhJNWJma0lXcHdITGdjTXZvTUUzR0gySTNZaVpnMTFyZ2Q5ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1631546071),
('86i7PoW7SlI8hBTftmV9f2SJluX642mySoMGD1Bh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/97.0.206 Chrome/91.0.4472.206 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjh3RkVLRkpZN0dyNHp5b1lGUGVXOGU5c0dZbGVoSUF5TVRNZ29KWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1631599175),
('dWkLt0rAHyXS0f4XwzuawejdsflvXofcch5WvLFM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.168 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXl0YmEwajJsVW1Qdjd1MzNtQ0ZOT05pWDdMaGxKUmV6UmY5WVBxTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1634094913),
('feB1GKFaBX4R6RnYPXXhJ4I230NBm0jN8VKPctmY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.168 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1hqSUZtbG1ucG03QUV5VDd3eG94eXB1TDJLdVdzMXY5dXp2ZWJmVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1634011017),
('Fs0SCvE1djpXyVZgaQrrmIj6v6EPuF7fcaeBLDz7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.168 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHRiTHUyRVpoRkNJZlpSeTluS0paRkNCM1lZOUN3cjlHb3BhSVdBcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1634606014),
('i70icE9q8obBTyIQMEuI9T10GP6PRMGFsiHHagfc', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/97.0.206 Chrome/91.0.4472.206 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoieVZEWlZkQnBuZWxveGVGejZmelZST1hNRWxjYlJBQ05lb3NLYlhNaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90aGFuay15b3UiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkT1NtdFQvcENBcEd2TXMwdkEwSW5LTzhxL0dWRVZKZENrR0RoYTVrT2x3V3M5MGs1a25QaksiO3M6NDoiY2FydCI7YTowOnt9fQ==', 1631331941),
('rQN2Djp1fo2DKP9y8xbeZCnZ9o1ihVYaRyxJ1VUw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.92 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0dzWnFBeGFuclNzWUdqM1NuRERxQzNLSnZpdmlCVG12ZUNEcERoYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zaG9wIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1634797418),
('Rr5JfdoRI2hdQcJHaWm2m8JoVd5lc26AaQrUEF2m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.168 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQWVOYklxd1FJdUNEbGJkdmVibGNsQzc2aEpiVWwzQ0xKVzdSV2JrdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1634606012);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twiter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `phone`, `phone2`, `address`, `map`, `twiter`, `facebook`, `pinterest`, `instagram`, `youtube`, `created_at`, `updated_at`) VALUES
(1, 'vansang@gmail.com', '0382010106', '0382010106', '104/116/19 đường số 18 phường bình hưng hòa quận bình tân tp HCM', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.8589064716875!2d106.60445191410554!3d10.82210776130976!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bc74f323667%3A0xaa8b842c8de108f5!2zMTA0LCAxMTYgxJDGsOG7nW5nIHPhu5EgMTgsIELDrG5oIEjGsG5nIEhvw6AsIELDrG5oIFTDom4sIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaCA3MDAwMDAsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1631183224459!5m2!1svi!2s', '#', '#', '#', '#', '#', '2021-09-09 03:05:36', '2021-09-09 03:33:10');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `order_id`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 7, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', '2021-08-10 23:05:14', '2021-08-10 23:05:14'),
(2, 8, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', '2021-08-10 23:48:20', '2021-08-10 23:48:20'),
(3, 9, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'hcm', 'vn', '10000', '2021-08-10 23:50:01', '2021-08-10 23:50:01'),
(4, 10, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'Vietnam', '10000', '2021-08-11 22:45:28', '2021-08-11 22:45:28'),
(5, 11, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 22:47:50', '2021-08-11 22:47:50'),
(6, 12, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 22:53:12', '2021-08-11 22:53:12'),
(7, 13, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 22:53:49', '2021-08-11 22:53:49'),
(8, 14, 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 23:07:52', '2021-08-11 23:07:52'),
(9, 15, 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 23:12:38', '2021-08-11 23:12:38'),
(10, 16, 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 23:13:31', '2021-08-11 23:13:31'),
(11, 17, 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 23:26:05', '2021-08-11 23:26:05'),
(12, 18, 'thương', 'ngô', '0382010106', 'ngothuong2409@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '10000', '2021-08-11 23:26:15', '2021-08-11 23:26:15'),
(13, 19, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '121001', '2021-08-11 23:43:51', '2021-08-11 23:43:51'),
(14, 20, 'thương', 'ngô', '0382010106', 'admin@gmail.com', 'line1', 'line2', 'TP HCM', 'Ho Chi Minh', 'vietnam', '121001', '2021-08-11 23:44:03', '2021-08-11 23:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mode` enum('cod','paypal','card') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `created_at`, `updated_at`, `mode`, `status`) VALUES
(1, 1, 9, '2021-08-10 23:50:01', '2021-08-10 23:50:01', 'cod', 'pending'),
(2, 1, 18, '2021-08-11 23:26:15', '2021-08-11 23:26:15', 'cod', 'pending'),
(3, 2, 21, '2021-09-05 20:44:42', '2021-09-05 20:44:42', 'cod', 'pending'),
(4, 4, 22, '2021-09-10 20:43:01', '2021-09-10 20:43:01', 'cod', 'pending'),
(5, 4, 23, '2021-09-10 20:45:23', '2021-09-10 20:45:23', 'cod', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'ADM for admin and USR for user or  customer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `utype`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$e9.lIR9BRR4tUUaY2cRzz.Hpsti6r/jc2PILI/T5vTW0Lg66FElAa', NULL, NULL, NULL, NULL, NULL, 'ADM', '2021-07-15 04:14:05', '2021-07-15 04:14:05'),
(2, 'user', 'user@gmail.com', NULL, '$2y$10$lp9im8Jo./Q61emmZIOYJ.2xHO3r3q4LYPkAD7R.HQmGzf0DSe22O', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-07-15 04:14:55', '2021-09-06 22:33:59'),
(3, 'user2', 'user2@gmail.com', NULL, '$2y$10$yBI0Ru2fhz5qOLIVgGqbxOIrTUDUjl3L6JbcInY05aG.Kcy95verm', NULL, NULL, NULL, NULL, NULL, 'USR', '2021-07-15 08:02:27', '2021-07-15 08:02:27'),
(4, 'vanSang', 'vansang0105@gmail.com', NULL, '$2y$10$OSmtT/pCApGvMs0vA0InKO8q/GVEVJdCkGDha5kOlwWs90k5knPjK', NULL, NULL, 'zBBhnKlJ6mGBEAoPeQAkNaz3nCTLM9LbuPAKQZTzeIwrKBBjAmvCFiFK8CT7', NULL, NULL, 'USR', '2021-09-09 21:55:45', '2021-09-09 22:26:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
