-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2022 at 02:55 PM
-- Server version: 5.7.33
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venue-booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 19, 'Calendar', 'fa-calendar', 'calendar', '*', '2022-06-29 10:27:37', '2022-08-20 00:20:46'),
(9, 0, 8, 'Category', 'fa-briefcase', 'categories', '*', '2022-07-01 06:44:36', '2022-07-01 06:52:37'),
(10, 0, 9, 'Occasion', 'fa-flag-o', 'occasions', '*', '2022-07-01 06:45:17', '2022-07-01 06:52:37'),
(11, 0, 10, 'Amenity', 'fa-certificate', 'amenities', '*', '2022-07-01 06:45:54', '2022-07-01 06:52:37'),
(12, 0, 11, 'Location', 'fa-road', '#', '*', '2022-07-01 06:46:32', '2022-07-01 06:52:37'),
(13, 12, 12, 'Division', 'fa-map-o', 'divisions', '*', '2022-07-01 06:48:47', '2022-07-01 06:52:37'),
(14, 12, 13, 'District', 'fa-map-marker', 'districts', '*', '2022-07-01 06:50:27', '2022-07-01 06:52:37'),
(15, 12, 14, 'City', 'fa-map-pin', 'cities', '*', '2022-07-01 06:50:51', '2022-07-01 06:52:37'),
(16, 19, 17, 'Venues', 'fa-venus-double', 'venues', '*', '2022-07-01 06:51:55', '2022-08-20 00:25:58'),
(17, 0, 20, 'Users', 'fa-users', '/users', '*', '2022-07-28 22:05:57', '2022-08-20 00:20:46'),
(18, 0, 18, 'Orders', 'fa-cart-arrow-down', '/orders', '*', '2022-08-13 00:08:32', '2022-08-20 00:20:46'),
(19, 0, 15, 'Venue', 'fa-venus', '#', '*', '2022-08-20 00:18:47', '2022-08-20 00:19:02'),
(20, 19, 16, 'Organization', 'fa-sitemap', '/organizations', '*', '2022-08-20 00:20:32', '2022-08-20 00:25:39'),
(21, 0, 21, 'Inbox', 'fa-bell-o', '/inboxes', '*', '2022-08-29 22:07:26', '2022-08-29 22:07:44'),
(22, 0, 22, 'Testmonials', 'fa-paper-plane-o', '/testmonials', '*', '2022-08-29 23:07:35', '2022-08-29 23:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1124, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:02:38', '2022-07-28 22:02:38'),
(1125, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:04:55', '2022-07-28 22:04:55'),
(1126, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:05:15', '2022-07-28 22:05:15'),
(1127, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Users\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\"}', '2022-07-28 22:05:57', '2022-07-28 22:05:57'),
(1128, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-28 22:05:57', '2022-07-28 22:05:57'),
(1129, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":16},{\\\"id\\\":8},{\\\"id\\\":17}]\"}', '2022-07-28 22:06:04', '2022-07-28 22:06:04'),
(1130, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:06:04', '2022-07-28 22:06:04'),
(1131, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-28 22:06:06', '2022-07-28 22:06:06'),
(1132, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:06:10', '2022-07-28 22:06:10'),
(1133, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 22:09:20', '2022-07-28 22:09:20'),
(1134, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 22:09:41', '2022-07-28 22:09:41'),
(1135, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 22:09:52', '2022-07-28 22:09:52'),
(1136, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 22:11:51', '2022-07-28 22:11:51'),
(1137, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 22:12:16', '2022-07-28 22:12:16'),
(1138, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:12:26', '2022-07-28 22:12:26'),
(1139, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:12:37', '2022-07-28 22:12:37'),
(1140, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:13:09', '2022-07-28 22:13:09'),
(1141, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:13:17', '2022-07-28 22:13:17'),
(1142, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 22:16:10', '2022-07-28 22:16:10'),
(1143, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:18:20', '2022-07-28 22:18:20'),
(1144, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:18:39', '2022-07-28 22:18:39'),
(1145, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:19:17', '2022-07-28 22:19:17'),
(1146, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:19:44', '2022-07-28 22:19:44'),
(1147, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:19:45', '2022-07-28 22:19:45'),
(1148, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:19:48', '2022-07-28 22:19:48'),
(1149, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:20:14', '2022-07-28 22:20:14'),
(1150, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:20:35', '2022-07-28 22:20:35'),
(1151, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:20:38', '2022-07-28 22:20:38'),
(1152, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:21:01', '2022-07-28 22:21:01'),
(1153, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:21:10', '2022-07-28 22:21:10'),
(1154, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:21:11', '2022-07-28 22:21:11'),
(1155, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"password\":\"fsdf\",\"type\":\"0\",\"email_verified_at\":\"2022-07-29 04:21:11\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:21:22', '2022-07-28 22:21:22'),
(1156, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:21:24', '2022-07-28 22:21:24'),
(1157, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:24:47', '2022-07-28 22:24:47'),
(1158, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":\"admin\",\"email\":null,\"password\":null,\"type\":\"0\",\"email_verified_at\":\"2022-07-29 04:24:47\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\"}', '2022-07-28 22:24:53', '2022-07-28 22:24:53'),
(1159, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:24:54', '2022-07-28 22:24:54'),
(1160, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":\"Admin\",\"email\":null,\"password\":null,\"type\":\"0\",\"email_verified_at\":\"2022-07-29 04:24:54\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\"}', '2022-07-28 22:25:00', '2022-07-28 22:25:00'),
(1161, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:25:01', '2022-07-28 22:25:01'),
(1162, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:25:02', '2022-07-28 22:25:02'),
(1163, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:25:07', '2022-07-28 22:25:07'),
(1164, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"password\":null,\"type\":\"1\",\"email_verified_at\":\"2022-07-29 04:25:07\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:25:10', '2022-07-28 22:25:10'),
(1165, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:25:11', '2022-07-28 22:25:11'),
(1166, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 22:26:29', '2022-07-28 22:26:29'),
(1167, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:26:34', '2022-07-28 22:26:34'),
(1168, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"password\":\"re\",\"type\":\"0\",\"email_verified_at\":\"2022-07-29 04:26:34\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:26:38', '2022-07-28 22:26:38'),
(1169, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:26:38', '2022-07-28 22:26:38'),
(1170, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:27:07', '2022-07-28 22:27:07'),
(1171, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"password\":\"wqwq\",\"type\":\"0\",\"email_verified_at\":\"2022-07-29 04:27:07\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/1\\/edit\"}', '2022-07-28 22:27:13', '2022-07-28 22:27:13'),
(1172, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:27:14', '2022-07-28 22:27:14'),
(1173, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:27:17', '2022-07-28 22:27:17'),
(1174, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:27:20', '2022-07-28 22:27:20'),
(1175, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"password\":null,\"type\":\"1\",\"email_verified_at\":\"2022-07-29 04:27:20\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:27:23', '2022-07-28 22:27:23'),
(1176, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:27:24', '2022-07-28 22:27:24'),
(1177, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"password\":\"ds\",\"type\":\"1\",\"email_verified_at\":\"2022-07-29 04:27:24\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:29:29', '2022-07-28 22:29:29'),
(1178, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"password\":\"ds\",\"type\":\"1\",\"email_verified_at\":\"2022-07-29 04:27:24\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:29:43', '2022-07-28 22:29:43'),
(1179, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:32:54', '2022-07-28 22:32:54'),
(1180, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:32:55', '2022-07-28 22:32:55'),
(1181, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:32:58', '2022-07-28 22:32:58'),
(1182, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:33:00', '2022-07-28 22:33:00'),
(1183, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":null,\"email_verified_at\":\"2022-07-29 04:33:00\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:33:02', '2022-07-28 22:33:02'),
(1184, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:33:02', '2022-07-28 22:33:02'),
(1185, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:33:06', '2022-07-28 22:33:06'),
(1186, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:33:30', '2022-07-28 22:33:30'),
(1187, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":null,\"email_verified_at\":\"2022-07-29 04:33:30\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:35:41', '2022-07-28 22:35:41'),
(1188, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:39:31', '2022-07-28 22:39:31'),
(1189, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:39:33', '2022-07-28 22:39:33'),
(1190, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:41:05', '2022-07-28 22:41:05'),
(1191, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:41:06', '2022-07-28 22:41:06'),
(1192, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:41:17', '2022-07-28 22:41:17'),
(1193, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:42:58', '2022-07-28 22:42:58'),
(1194, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:43:01', '2022-07-28 22:43:01'),
(1195, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":null,\"password_confirmation\":\"$2y$10$VTsL3Mk.182VVXgEon6WMusPr\\/CvVWw8EML7W4Q3vnK12Cv76MbD6\",\"email_verified_at\":\"2022-07-29 04:43:01\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:43:51', '2022-07-28 22:43:51'),
(1196, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:43:51', '2022-07-28 22:43:51'),
(1197, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"weew\",\"password_confirmation\":\"$2y$10$VTsL3Mk.182VVXgEon6WMusPr\\/CvVWw8EML7W4Q3vnK12Cv76MbD6\",\"email_verified_at\":\"2022-07-29 04:43:51\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:44:27', '2022-07-28 22:44:27'),
(1198, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:44:27', '2022-07-28 22:44:27'),
(1199, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"weew\",\"password_confirmation\":\"$2y$10$VTsL3Mk.182VVXgEon6WMusPr\\/CvVWw8EML7W4Q3vnK12Cv76MbD6\",\"email_verified_at\":\"2022-07-29 04:44:27\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:44:55', '2022-07-28 22:44:55'),
(1200, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:44:56', '2022-07-28 22:44:56'),
(1201, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"weew212121121221212121\",\"password_confirmation\":\"$2y$10$VTsL3Mk.182VVXgEon6WMusPr\\/CvVWw8EML7W4Q3vnK12Cv76MbD6\",\"email_verified_at\":\"2022-07-29 04:44:56\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:45:02', '2022-07-28 22:45:02'),
(1202, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:45:03', '2022-07-28 22:45:03'),
(1203, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"weew212121121221212121\",\"password_confirmation\":\"$2y$10$VTsL3Mk.182VVXgEon6WMusPr\\/CvVWw8EML7W4Q3vnK12Cv76MbD6\",\"email_verified_at\":\"2022-07-29 04:45:03\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:45:14', '2022-07-28 22:45:14'),
(1204, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:45:14', '2022-07-28 22:45:14'),
(1205, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"weew212121121221212121\",\"password_confirmation\":\"$2y$10$VTsL3Mk.182VVXgEon6WMusPr\\/CvVWw8EML7W4Q3vnK12Cv76MbD6\",\"email_verified_at\":\"2022-07-29 04:45:14\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:45:18', '2022-07-28 22:45:18'),
(1206, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:45:18', '2022-07-28 22:45:18'),
(1207, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:46:07', '2022-07-28 22:46:07'),
(1208, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"sdds\",\"password_confirmation\":\"dsds\",\"email_verified_at\":\"2022-07-29 04:46:07\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:47:09', '2022-07-28 22:47:09'),
(1209, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:47:28', '2022-07-28 22:47:28'),
(1210, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:47:29', '2022-07-28 22:47:29'),
(1211, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:47:39', '2022-07-28 22:47:39'),
(1212, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"dddsds\",\"password_confirmation\":\"dsds\",\"email_verified_at\":\"2022-07-29 04:47:39\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 22:47:49', '2022-07-28 22:47:49'),
(1213, 1, 'admin/users/1', 'GET', '127.0.0.1', '[]', '2022-07-28 22:49:09', '2022-07-28 22:49:09'),
(1214, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:49:18', '2022-07-28 22:49:18'),
(1215, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:49:20', '2022-07-28 22:49:20'),
(1216, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:52:37', '2022-07-28 22:52:37'),
(1217, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 22:55:29', '2022-07-28 22:55:29'),
(1218, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:57:25', '2022-07-28 22:57:25'),
(1219, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 22:57:26', '2022-07-28 22:57:26'),
(1220, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"type\":\"0\",\"password\":null,\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 04:57:26\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 22:57:28', '2022-07-28 22:57:28'),
(1221, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:57:28', '2022-07-28 22:57:28'),
(1222, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"type\":\"0\",\"password\":\"aaaaaaaa\",\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 04:57:28\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\"}', '2022-07-28 22:57:35', '2022-07-28 22:57:35'),
(1223, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:57:35', '2022-07-28 22:57:35'),
(1224, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"type\":\"0\",\"password\":\"aaaaaaaa\",\"password_confirmation\":\"aaaaaaaa\",\"email_verified_at\":\"2022-07-29 04:57:35\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\"}', '2022-07-28 22:57:40', '2022-07-28 22:57:40'),
(1225, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 22:57:41', '2022-07-28 22:57:41'),
(1226, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 23:03:05', '2022-07-28 23:03:05'),
(1227, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"type\":\"0\",\"password\":null,\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 05:03:05\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/1\\/edit\"}', '2022-07-28 23:03:11', '2022-07-28 23:03:11'),
(1228, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 23:03:11', '2022-07-28 23:03:11'),
(1229, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:03:16', '2022-07-28 23:03:16'),
(1230, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:03:18', '2022-07-28 23:03:18'),
(1231, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":null,\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 05:03:18\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:03:19', '2022-07-28 23:03:19'),
(1232, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:03:20', '2022-07-28 23:03:20'),
(1233, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":null,\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 05:03:20\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 23:04:23', '2022-07-28 23:04:23'),
(1234, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:04:25', '2022-07-28 23:04:25'),
(1235, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:06:03', '2022-07-28 23:06:03'),
(1236, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:06:06', '2022-07-28 23:06:06'),
(1237, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":null,\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 05:06:06\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:06:09', '2022-07-28 23:06:09'),
(1238, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:06:09', '2022-07-28 23:06:09'),
(1239, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"11111111\",\"password_confirmation\":\"11111111\",\"email_verified_at\":\"2022-07-29 05:06:09\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 23:07:13', '2022-07-28 23:07:13'),
(1240, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:07:14', '2022-07-28 23:07:14'),
(1241, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"11111111\",\"password_confirmation\":\"11111111\",\"email_verified_at\":\"2022-07-29 05:07:14\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 23:07:27', '2022-07-28 23:07:27'),
(1242, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:07:27', '2022-07-28 23:07:27'),
(1243, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:07:46', '2022-07-28 23:07:46'),
(1244, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:10:26', '2022-07-28 23:10:26'),
(1245, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:10:27', '2022-07-28 23:10:27'),
(1246, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"type\":\"0\",\"password\":null,\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 05:10:27\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:10:29', '2022-07-28 23:10:29'),
(1247, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-07-28 23:10:29', '2022-07-28 23:10:29'),
(1248, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"type\":\"0\",\"password\":\"dsdssdds\",\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 05:10:29\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\"}', '2022-07-28 23:11:32', '2022-07-28 23:11:32'),
(1249, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":null,\"username\":null,\"email\":null,\"type\":\"0\",\"password\":\"dsdssdds\",\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29 05:10:29\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\"}', '2022-07-28 23:11:46', '2022-07-28 23:11:46'),
(1250, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:11:47', '2022-07-28 23:11:47'),
(1251, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:12:09', '2022-07-28 23:12:09'),
(1252, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"dsds\",\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:12:12', '2022-07-28 23:12:12'),
(1253, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"dsds\",\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:12:25', '2022-07-28 23:12:25'),
(1254, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"dsds\",\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:14:36', '2022-07-28 23:14:36'),
(1255, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"dsds\",\"password_confirmation\":null,\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:17:41', '2022-07-28 23:17:41'),
(1256, 1, 'admin/users/1', 'GET', '127.0.0.1', '[]', '2022-07-28 23:17:58', '2022-07-28 23:17:58'),
(1257, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:18:02', '2022-07-28 23:18:02'),
(1258, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:18:05', '2022-07-28 23:18:05'),
(1259, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"abdulawalbd121@gmail.com\",\"password_confirmation\":\"abdulawalbd121@gmail.com\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:18:10', '2022-07-28 23:18:10'),
(1260, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:18:11', '2022-07-28 23:18:11'),
(1261, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:20:57', '2022-07-28 23:20:57'),
(1262, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:20:59', '2022-07-28 23:20:59'),
(1263, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:21:07', '2022-07-28 23:21:07'),
(1264, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:24:03', '2022-07-28 23:24:03'),
(1265, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:24:05', '2022-07-28 23:24:05'),
(1266, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:24:22', '2022-07-28 23:24:22'),
(1267, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"$2y$10$l4j5H7qXEBQ.cqGPTlCBAeUET7htaLf7Nf9RKmG8\\/UKX8VVrGAX\\/W\",\"password_confirmation\":\"$2y$10$l4j5H7qXEBQ.cqGPTlCBAeUET7htaLf7Nf9RKmG8\\/UKX8VVrGAX\\/W\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 23:24:27', '2022-07-28 23:24:27'),
(1268, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:24:28', '2022-07-28 23:24:28'),
(1269, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:24:30', '2022-07-28 23:24:30'),
(1270, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"$2y$10$l4j5H7qXEBQ.cqGPTlCBAeUET7htaLf7Nf9RKmG8\\/UKX8VVrGAX\\/W\",\"password_confirmation\":\"$2y$10$l4j5H7qXEBQ.cqGPTlCBAeUET7htaLf7Nf9RKmG8\\/UKX8VVrGAX\\/W\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:24:31', '2022-07-28 23:24:31'),
(1271, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:24:32', '2022-07-28 23:24:32'),
(1272, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:24:34', '2022-07-28 23:24:34'),
(1273, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"password\":\"11111111\",\"password_confirmation\":\"11111111\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:25:05', '2022-07-28 23:25:05'),
(1274, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:25:05', '2022-07-28 23:25:05'),
(1275, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:30:48', '2022-07-28 23:30:48'),
(1276, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:36:51', '2022-07-28 23:36:51'),
(1277, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\"}', '2022-07-28 23:37:49', '2022-07-28 23:37:49'),
(1278, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:37:50', '2022-07-28 23:37:50'),
(1279, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:38:03', '2022-07-28 23:38:03'),
(1280, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:38:11', '2022-07-28 23:38:11'),
(1281, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:38:12', '2022-07-28 23:38:12'),
(1282, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:38:18', '2022-07-28 23:38:18'),
(1283, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:39:14', '2022-07-28 23:39:14'),
(1284, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:39:15', '2022-07-28 23:39:15'),
(1285, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:41:33', '2022-07-28 23:41:33'),
(1286, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:41:35', '2022-07-28 23:41:35'),
(1287, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:41:43', '2022-07-28 23:41:43'),
(1288, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:41:44', '2022-07-28 23:41:44'),
(1289, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:41:51', '2022-07-28 23:41:51'),
(1290, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:41:54', '2022-07-28 23:41:54'),
(1291, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:41:54', '2022-07-28 23:41:54'),
(1292, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:42:01', '2022-07-28 23:42:01'),
(1293, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"0\",\"venue_id\":[\"1\",null],\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29 05:42:01\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:42:05', '2022-07-28 23:42:05'),
(1294, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:42:05', '2022-07-28 23:42:05'),
(1295, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:42:10', '2022-07-28 23:42:10'),
(1296, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:44:40', '2022-07-28 23:44:40'),
(1297, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/1\\/edit\"}', '2022-07-28 23:44:55', '2022-07-28 23:44:55'),
(1298, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:44:56', '2022-07-28 23:44:56'),
(1299, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\\/2\\/edit\"}', '2022-07-28 23:45:03', '2022-07-28 23:45:03'),
(1300, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '[]', '2022-07-28 23:45:03', '2022-07-28 23:45:03'),
(1301, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:45:07', '2022-07-28 23:45:07'),
(1302, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:45:10', '2022-07-28 23:45:10'),
(1303, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:45:12', '2022-07-28 23:45:12'),
(1304, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:45:13', '2022-07-28 23:45:13'),
(1305, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:45:15', '2022-07-28 23:45:15'),
(1306, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:45:19', '2022-07-28 23:45:19'),
(1307, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:45:19', '2022-07-28 23:45:19'),
(1308, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:45:22', '2022-07-28 23:45:22'),
(1309, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",null],\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:45:24', '2022-07-28 23:45:24'),
(1310, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:45:25', '2022-07-28 23:45:25'),
(1311, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:45:27', '2022-07-28 23:45:27'),
(1312, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:45:30', '2022-07-28 23:45:30'),
(1313, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:45:30', '2022-07-28 23:45:30'),
(1314, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:46:23', '2022-07-28 23:46:23'),
(1315, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:46:26', '2022-07-28 23:46:26'),
(1316, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:46:26', '2022-07-28 23:46:26'),
(1317, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:47:26', '2022-07-28 23:47:26'),
(1318, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:47:30', '2022-07-28 23:47:30'),
(1319, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:47:30', '2022-07-28 23:47:30'),
(1320, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:47:45', '2022-07-28 23:47:45'),
(1321, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:47:46', '2022-07-28 23:47:46'),
(1322, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:47:47', '2022-07-28 23:47:47'),
(1323, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:48:28', '2022-07-28 23:48:28'),
(1324, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:48:30', '2022-07-28 23:48:30'),
(1325, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:48:30', '2022-07-28 23:48:30'),
(1326, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:48:36', '2022-07-28 23:48:36'),
(1327, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:48:38', '2022-07-28 23:48:38'),
(1328, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:48:38', '2022-07-28 23:48:38'),
(1329, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:49:08', '2022-07-28 23:49:08'),
(1330, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:49:13', '2022-07-28 23:49:13'),
(1331, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:49:13', '2022-07-28 23:49:13'),
(1332, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:49:19', '2022-07-28 23:49:19'),
(1333, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:49:21', '2022-07-28 23:49:21'),
(1334, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:49:21', '2022-07-28 23:49:21'),
(1335, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:49:23', '2022-07-28 23:49:23'),
(1336, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",null],\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:49:27', '2022-07-28 23:49:27'),
(1337, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:49:28', '2022-07-28 23:49:28'),
(1338, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:49:33', '2022-07-28 23:49:33'),
(1339, 1, 'admin/users/2', 'PUT', '127.0.0.1', '{\"name\":\"sddsds\",\"username\":\"dsds\",\"email\":\"dssd@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"password_confirmation\":\"$2y$10$tvDqLB0RrqFBn0y\\/Nr750.N7meC8ls9PNxg.zqMG4hEg4TBL63MdO\",\"email_verified_at\":\"2022-07-29T05:42:01.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:49:35', '2022-07-28 23:49:35'),
(1340, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:49:35', '2022-07-28 23:49:35'),
(1341, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:51:18', '2022-07-28 23:51:18'),
(1342, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:51:50', '2022-07-28 23:51:50'),
(1343, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:51:53', '2022-07-28 23:51:53'),
(1344, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:51:55', '2022-07-28 23:51:55'),
(1345, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:51:56', '2022-07-28 23:51:56'),
(1346, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:51:58', '2022-07-28 23:51:58'),
(1347, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:52:07', '2022-07-28 23:52:07'),
(1348, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:52:07', '2022-07-28 23:52:07'),
(1349, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:55:14', '2022-07-28 23:55:14'),
(1350, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"FjxQb8qjabtSywHEF9gN82rN8CKqEbqe4sH4JHoR\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-28 23:55:20', '2022-07-28 23:55:20'),
(1351, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-28 23:55:20', '2022-07-28 23:55:20'),
(1352, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-28 23:55:27', '2022-07-28 23:55:27'),
(1353, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-07-29 03:11:35', '2022-07-29 03:11:35'),
(1354, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-29 03:11:36', '2022-07-29 03:11:36'),
(1355, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 03:11:43', '2022-07-29 03:11:43'),
(1356, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 03:11:48', '2022-07-29 03:11:48'),
(1357, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-29 03:11:53', '2022-07-29 03:11:53'),
(1358, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-29 03:11:53', '2022-07-29 03:11:53'),
(1359, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 03:12:05', '2022-07-29 03:12:05');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1360, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"sasas\",\"username\":\"admin\",\"email\":\"abdulawalbd121@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"2\",null],\"password\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"password_confirmation\":\"$2y$10$H4tKE8g65tRli4qRmKvMduXS5cwwE6LUOX5tQxUgN3kTwOzeIbX16\",\"email_verified_at\":\"2022-07-29T05:07:14.000000Z\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-07-29 03:12:09', '2022-07-29 03:12:09'),
(1361, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-07-29 03:12:09', '2022-07-29 03:12:09'),
(1362, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 03:12:13', '2022-07-29 03:12:13'),
(1363, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-07-29 05:17:30', '2022-07-29 05:17:30'),
(1364, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-29 05:17:31', '2022-07-29 05:17:31'),
(1365, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:20:40', '2022-07-29 05:20:40'),
(1366, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:20:42', '2022-07-29 05:20:42'),
(1367, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-07-29 05:27:37', '2022-07-29 05:27:37'),
(1368, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"12\"}', '2022-07-29 05:27:37', '2022-07-29 05:27:37'),
(1369, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-07-29 05:27:41', '2022-07-29 05:27:41'),
(1370, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Radisson\",\"description\":\"<h3><strong>Things To Know<\\/strong><\\/h3><h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":\"16\",\"city_id\":\"145\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 05:27:58', '2022-07-29 05:27:58'),
(1371, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-07-29 05:27:58', '2022-07-29 05:27:58'),
(1372, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:29:09', '2022-07-29 05:29:09'),
(1373, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:29:11', '2022-07-29 05:29:11'),
(1374, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"6\"}', '2022-07-29 05:29:25', '2022-07-29 05:29:25'),
(1375, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-07-29 05:29:25', '2022-07-29 05:29:25'),
(1376, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-07-29 05:29:26', '2022-07-29 05:29:26'),
(1377, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-07-29 05:29:27', '2022-07-29 05:29:27'),
(1378, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"name\":\"Radisson\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":\"16\",\"city_id\":\"146\",\"is_enabled\":\"on\",\"updated_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 05:29:32', '2022-07-29 05:29:32'),
(1379, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 05:29:33', '2022-07-29 05:29:33'),
(1380, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:29:37', '2022-07-29 05:29:37'),
(1381, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:29:43', '2022-07-29 05:29:43'),
(1382, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:29:45', '2022-07-29 05:29:45'),
(1383, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"name\":\"Radisson\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":null,\"city_id\":null,\"is_enabled\":\"on\",\"updated_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 05:30:14', '2022-07-29 05:30:14'),
(1384, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-29 05:30:16', '2022-07-29 05:30:16'),
(1385, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2022-07-29 05:30:24', '2022-07-29 05:30:24'),
(1386, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-07-29 05:30:25', '2022-07-29 05:30:25'),
(1387, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-07-29 05:30:26', '2022-07-29 05:30:26'),
(1388, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-07-29 05:30:27', '2022-07-29 05:30:27'),
(1389, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"name\":\"Radisson\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":\"16\",\"city_id\":\"146\",\"is_enabled\":\"on\",\"updated_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_method\":\"PUT\"}', '2022-07-29 05:30:30', '2022-07-29 05:30:30'),
(1390, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 05:30:30', '2022-07-29 05:30:30'),
(1391, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:30:32', '2022-07-29 05:30:32'),
(1392, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"6\"}', '2022-07-29 05:35:06', '2022-07-29 05:35:06'),
(1393, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"40\"}', '2022-07-29 05:35:06', '2022-07-29 05:35:06'),
(1394, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"41\"}', '2022-07-29 05:35:08', '2022-07-29 05:35:08'),
(1395, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Essel Tower Club\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"8\",null],\"occasions\":[\"3\",\"6\",\"9\",\"10\",\"14\",\"15\",\"16\",null],\"amenities\":[\"1\",\"6\",\"8\",\"10\",\"18\",\"29\",\"30\",\"31\",null],\"price_type\":\"per-night\",\"price\":\"30000\",\"capacity\":\"2000\",\"division_id\":\"6\",\"district_id\":\"41\",\"city_id\":\"317\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 05:35:39', '2022-07-29 05:35:39'),
(1396, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 05:35:39', '2022-07-29 05:35:39'),
(1397, 1, 'admin/venues/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:41:56', '2022-07-29 05:41:56'),
(1398, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:42:05', '2022-07-29 05:42:05'),
(1399, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:42:11', '2022-07-29 05:42:11'),
(1400, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 05:43:56', '2022-07-29 05:43:56'),
(1401, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:44:02', '2022-07-29 05:44:02'),
(1402, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"5\"}', '2022-07-29 05:45:47', '2022-07-29 05:45:47'),
(1403, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"36\"}', '2022-07-29 05:45:47', '2022-07-29 05:45:47'),
(1404, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"39\"}', '2022-07-29 05:45:52', '2022-07-29 05:45:52'),
(1405, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"38\"}', '2022-07-29 05:45:59', '2022-07-29 05:45:59'),
(1406, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Farm Aravalia Mangar\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul>\",\"categories\":[\"6\",null],\"occasions\":[\"6\",\"7\",\"12\",\"15\",\"16\",null],\"amenities\":[\"1\",\"3\",\"4\",\"21\",\"30\",\"36\",null],\"price_type\":\"per-day\",\"price\":\"70000\",\"capacity\":\"10000\",\"division_id\":\"5\",\"district_id\":\"38\",\"city_id\":\"299\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 05:46:20', '2022-07-29 05:46:20'),
(1407, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-07-29 05:46:21', '2022-07-29 05:46:21'),
(1408, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 05:46:53', '2022-07-29 05:46:53'),
(1409, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:46:59', '2022-07-29 05:46:59'),
(1410, 1, 'admin/venues/2/edit', 'GET', '127.0.0.1', '[]', '2022-07-29 05:47:20', '2022-07-29 05:47:20'),
(1411, 1, 'admin/venues/3/edit', 'GET', '127.0.0.1', '[]', '2022-07-29 05:47:41', '2022-07-29 05:47:41'),
(1412, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"8\"}', '2022-07-29 05:52:18', '2022-07-29 05:52:18'),
(1413, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"61\"}', '2022-07-29 05:52:18', '2022-07-29 05:52:18'),
(1414, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"63\"}', '2022-07-29 05:52:21', '2022-07-29 05:52:21'),
(1415, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Dreams Gardens\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p><br><\\/p>\",\"categories\":[\"4\",\"6\",\"8\",\"9\",null],\"occasions\":[\"1\",\"2\",\"4\",\"6\",\"8\",\"14\",null],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"12\",\"17\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"28\",\"32\",\"35\",\"36\",null],\"price_type\":\"per-day\",\"price\":\"80000\",\"capacity\":\"20000\",\"division_id\":\"8\",\"district_id\":\"63\",\"city_id\":\"479\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"after-save\":\"2\"}', '2022-07-29 05:52:38', '2022-07-29 05:52:38'),
(1416, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-07-29 05:52:38', '2022-07-29 05:52:38'),
(1417, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:52:53', '2022-07-29 05:52:53'),
(1418, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:58:52', '2022-07-29 05:58:52'),
(1419, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 05:58:59', '2022-07-29 05:58:59'),
(1420, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-07-29 05:59:05', '2022-07-29 05:59:05'),
(1421, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-07-29 05:59:06', '2022-07-29 05:59:06'),
(1422, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-07-29 05:59:07', '2022-07-29 05:59:07'),
(1423, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-29 05:59:11', '2022-07-29 05:59:11'),
(1424, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-07-29 06:02:04', '2022-07-29 06:02:04'),
(1425, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-07-29 06:02:04', '2022-07-29 06:02:04'),
(1426, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Casabella Banquet\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"8\",\"9\",null],\"occasions\":[\"1\",\"2\",\"4\",\"5\",\"8\",\"10\",\"12\",\"16\",null],\"amenities\":[\"1\",\"3\",\"5\",\"12\",\"13\",\"15\",\"16\",\"17\",\"18\",\"19\",\"21\",\"22\",null],\"price_type\":\"per-night\",\"price\":\"150000\",\"capacity\":\"25000\",\"division_id\":\"1\",\"district_id\":\"1\",\"city_id\":\"1\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 06:02:15', '2022-07-29 06:02:15'),
(1427, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 06:02:15', '2022-07-29 06:02:15'),
(1428, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"3\"}', '2022-07-29 06:04:20', '2022-07-29 06:04:20'),
(1429, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"20\"}', '2022-07-29 06:04:20', '2022-07-29 06:04:20'),
(1430, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"21\"}', '2022-07-29 06:04:22', '2022-07-29 06:04:22'),
(1431, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Nirvana Patio Club\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"5\",\"8\",null],\"occasions\":[\"4\",\"5\",\"6\",\"10\",\"13\",null],\"amenities\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"13\",\"20\",null],\"price_type\":\"per-day\",\"price\":\"25000\",\"capacity\":\"1200\",\"division_id\":\"3\",\"district_id\":\"21\",\"city_id\":\"185\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 06:04:33', '2022-07-29 06:04:33'),
(1432, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 06:04:33', '2022-07-29 06:04:33'),
(1433, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"5\"}', '2022-07-29 06:06:34', '2022-07-29 06:06:34'),
(1434, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"36\"}', '2022-07-29 06:06:35', '2022-07-29 06:06:35'),
(1435, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"38\"}', '2022-07-29 06:06:37', '2022-07-29 06:06:37'),
(1436, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Acura BMK\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"1\",\"8\",null],\"occasions\":[\"3\",\"7\",\"16\",null],\"amenities\":[\"2\",\"3\",\"4\",\"5\",\"6\",\"9\",\"11\",null],\"price_type\":\"per-night\",\"price\":\"85000\",\"capacity\":\"15000\",\"division_id\":\"5\",\"district_id\":\"38\",\"city_id\":\"296\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 06:10:00', '2022-07-29 06:10:00'),
(1437, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 06:10:01', '2022-07-29 06:10:01'),
(1438, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"7\"}', '2022-07-29 06:12:54', '2022-07-29 06:12:54'),
(1439, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"53\"}', '2022-07-29 06:12:54', '2022-07-29 06:12:54'),
(1440, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"56\"}', '2022-07-29 06:12:58', '2022-07-29 06:12:58'),
(1441, 1, 'admin/venues', 'POST', '127.0.0.1', '{\"name\":\"Hotel Mizu\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"8\",null],\"occasions\":[\"6\",\"7\",\"14\",\"15\",null],\"amenities\":[\"2\",\"3\",\"7\",\"17\",\"20\",\"21\",null],\"price_type\":\"per-day\",\"price\":\"25000\",\"capacity\":\"1450\",\"division_id\":\"7\",\"district_id\":\"56\",\"city_id\":\"426\",\"is_enabled\":\"on\",\"created_by\":\"1\",\"_token\":\"fVmyO5JM3glxhS79gIhM0y56jVCpAoXBJJHlo64g\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-29 06:13:09', '2022-07-29 06:13:09'),
(1442, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-29 06:13:10', '2022-07-29 06:13:10'),
(1443, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-07-30 07:17:12', '2022-07-30 07:17:12'),
(1444, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-30 07:17:13', '2022-07-30 07:17:13'),
(1445, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-30 07:17:19', '2022-07-30 07:17:19'),
(1446, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-30 23:09:33', '2022-07-30 23:09:33'),
(1447, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-30 23:09:43', '2022-07-30 23:09:43'),
(1448, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-30 23:09:47', '2022-07-30 23:09:47'),
(1449, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"3\"}', '2022-07-30 23:09:56', '2022-07-30 23:09:56'),
(1450, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-07-30 23:09:57', '2022-07-30 23:09:57'),
(1451, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-07-30 23:09:58', '2022-07-30 23:09:58'),
(1452, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-07-30 23:09:58', '2022-07-30 23:09:58');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1453, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"name\":\"Radisson\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":\"16\",\"city_id\":\"146\",\"is_enabled\":\"on\",\"updated_by\":\"1\",\"_token\":\"MZR5rDQ8vnJjFiEZkvcytqJp3K8zbvzTYatTv782\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-07-30 23:10:01', '2022-07-30 23:10:01'),
(1454, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-07-30 23:10:02', '2022-07-30 23:10:02'),
(1455, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-07-31 03:37:53', '2022-07-31 03:37:53'),
(1456, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-31 03:37:55', '2022-07-31 03:37:55'),
(1457, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-02 03:19:10', '2022-08-02 03:19:10'),
(1458, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 03:19:17', '2022-08-02 03:19:17'),
(1459, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 03:19:25', '2022-08-02 03:19:25'),
(1460, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"User\",\"username\":\"user\",\"email\":\"user@gmail.com\",\"type\":\"0\",\"password\":\"$2y$10$42fQJep86380hDrRU\\/Chs.d4TGNWj5RhRRIeUC3WuyoSjdJKkJOE6\",\"password_confirmation\":\"$2y$10$42fQJep86380hDrRU\\/Chs.d4TGNWj5RhRRIeUC3WuyoSjdJKkJOE6\",\"email_verified_at\":\"2022-08-02 09:19:26\",\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-08-02 03:19:36', '2022-08-02 03:19:36'),
(1461, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-08-02 03:19:36', '2022-08-02 03:19:36'),
(1462, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 03:19:39', '2022-08-02 03:19:39'),
(1463, 1, 'admin/users', 'POST', '127.0.0.1', '{\"name\":\"admin\",\"username\":\"admin\",\"email\":\"admin@gmail.com\",\"type\":\"1\",\"venue_id\":[\"1\",\"8\",null],\"password\":\"123456\",\"password_confirmation\":\"123456\",\"email_verified_at\":\"2022-08-02 09:19:39\",\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-08-02 03:20:16', '2022-08-02 03:20:16'),
(1464, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-08-02 03:20:17', '2022-08-02 03:20:17'),
(1465, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 03:22:34', '2022-08-02 03:22:34'),
(1466, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 03:22:40', '2022-08-02 03:22:40'),
(1467, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 03:43:52', '2022-08-02 03:43:52'),
(1468, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-08-02 03:43:54', '2022-08-02 03:43:54'),
(1469, 1, 'admin/calendar/events/1', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 03:44:01', '2022-08-02 03:44:01'),
(1470, 1, 'admin/calendar/event/update/1', 'POST', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\",\"status\":\"approved\"}', '2022-08-02 03:44:14', '2022-08-02 03:44:14'),
(1471, 1, 'admin/calendar/events/1', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 03:44:15', '2022-08-02 03:44:15'),
(1472, 1, 'admin/calendar/events/5', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 03:58:27', '2022-08-02 03:58:27'),
(1473, 1, 'admin/calendar/events/1', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 03:58:29', '2022-08-02 03:58:29'),
(1474, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-08-02 04:21:49', '2022-08-02 04:21:49'),
(1475, 1, 'admin/calendar/events/1', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:21:56', '2022-08-02 04:21:56'),
(1476, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 04:25:42', '2022-08-02 04:25:42'),
(1477, 1, 'admin/venues/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 04:25:47', '2022-08-02 04:25:47'),
(1478, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-02 04:26:19', '2022-08-02 04:26:19'),
(1479, 1, 'admin/calendar/events/8', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:26:22', '2022-08-02 04:26:22'),
(1480, 1, 'admin/calendar/events/8', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:26:22', '2022-08-02 04:26:22'),
(1481, 1, 'admin/calendar/events/7', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:36:44', '2022-08-02 04:36:44'),
(1482, 1, 'admin/calendar/events/7', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:36:44', '2022-08-02 04:36:44'),
(1483, 1, 'admin/calendar/events/1', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:36:46', '2022-08-02 04:36:46'),
(1484, 1, 'admin/calendar/events/1', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:36:47', '2022-08-02 04:36:47'),
(1485, 1, 'admin/calendar/events/6', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:36:49', '2022-08-02 04:36:49'),
(1486, 1, 'admin/calendar/events/6', 'GET', '127.0.0.1', '{\"_token\":\"zgj7Dej3QtBntlbHPjd954EhMxSoj9kjFJlxUPas\"}', '2022-08-02 04:36:49', '2022-08-02 04:36:49'),
(1487, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-13 00:05:03', '2022-08-13 00:05:03'),
(1488, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-13 00:05:04', '2022-08-13 00:05:04'),
(1489, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-13 00:07:43', '2022-08-13 00:07:43'),
(1490, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-13 00:07:46', '2022-08-13 00:07:46'),
(1491, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Orders\",\"icon\":\"fa-cart-arrow-down\",\"uri\":\"\\/orders\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"Se3BsbjxM5q7t2ea1mHUJ6Y9KRa1Kc8BfzqUPmUk\"}', '2022-08-13 00:08:32', '2022-08-13 00:08:32'),
(1492, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-13 00:08:32', '2022-08-13 00:08:32'),
(1493, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"Se3BsbjxM5q7t2ea1mHUJ6Y9KRa1Kc8BfzqUPmUk\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":16},{\\\"id\\\":18},{\\\"id\\\":8},{\\\"id\\\":17}]\"}', '2022-08-13 00:08:41', '2022-08-13 00:08:41'),
(1494, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-13 00:08:41', '2022-08-13 00:08:41'),
(1495, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-13 00:08:44', '2022-08-13 00:08:44'),
(1496, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-13 00:08:48', '2022-08-13 00:08:48'),
(1497, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2022-08-13 00:09:42', '2022-08-13 00:09:42'),
(1498, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2022-08-13 00:10:03', '2022-08-13 00:10:03'),
(1499, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2022-08-13 00:10:54', '2022-08-13 00:10:54'),
(1500, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2022-08-13 00:11:31', '2022-08-13 00:11:31'),
(1501, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-13 00:11:44', '2022-08-13 00:11:44'),
(1502, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2022-08-13 00:12:20', '2022-08-13 00:12:20'),
(1503, 1, 'admin/orders', 'GET', '127.0.0.1', '[]', '2022-08-13 00:15:26', '2022-08-13 00:15:26'),
(1504, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-13 00:55:22', '2022-08-13 00:55:22'),
(1505, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-14 06:42:46', '2022-08-14 06:42:46'),
(1506, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-14 06:42:48', '2022-08-14 06:42:48'),
(1507, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 06:42:53', '2022-08-14 06:42:53'),
(1508, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 06:43:01', '2022-08-14 06:43:01'),
(1509, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-14 06:48:15', '2022-08-14 06:48:15'),
(1510, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 06:48:56', '2022-08-14 06:48:56'),
(1511, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:54:31', '2022-08-14 06:54:31'),
(1512, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:55:02', '2022-08-14 06:55:02'),
(1513, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:56:00', '2022-08-14 06:56:00'),
(1514, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:56:39', '2022-08-14 06:56:39'),
(1515, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:57:47', '2022-08-14 06:57:47'),
(1516, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:58:05', '2022-08-14 06:58:05'),
(1517, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:58:35', '2022-08-14 06:58:35'),
(1518, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:58:47', '2022-08-14 06:58:47'),
(1519, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:58:58', '2022-08-14 06:58:58'),
(1520, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 06:59:22', '2022-08-14 06:59:22'),
(1521, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:00:06', '2022-08-14 07:00:06'),
(1522, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:08:59', '2022-08-14 07:08:59'),
(1523, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:09:04', '2022-08-14 07:09:04'),
(1524, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:09:15', '2022-08-14 07:09:15'),
(1525, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:09:33', '2022-08-14 07:09:33'),
(1526, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:10:42', '2022-08-14 07:10:42'),
(1527, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:11:55', '2022-08-14 07:11:55'),
(1528, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:12:02', '2022-08-14 07:12:02'),
(1529, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:12:10', '2022-08-14 07:12:10'),
(1530, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:12:13', '2022-08-14 07:12:13'),
(1531, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2022-08-14 07:20:52', '2022-08-14 07:20:52'),
(1532, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2022-08-14 07:21:15', '2022-08-14 07:21:15'),
(1533, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2022-08-14 07:34:08', '2022-08-14 07:34:08'),
(1534, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2022-08-14 07:34:35', '2022-08-14 07:34:35'),
(1535, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2022-08-14 07:35:14', '2022-08-14 07:35:14'),
(1536, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2022-08-14 07:35:42', '2022-08-14 07:35:42'),
(1537, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:40:09', '2022-08-14 07:40:09'),
(1538, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-14 07:40:19', '2022-08-14 07:40:19'),
(1539, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:12', '2022-08-14 07:51:12'),
(1540, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:14', '2022-08-14 07:51:14'),
(1541, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:15', '2022-08-14 07:51:15'),
(1542, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:16', '2022-08-14 07:51:16'),
(1543, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:17', '2022-08-14 07:51:17'),
(1544, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:20', '2022-08-14 07:51:20'),
(1545, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:22', '2022-08-14 07:51:22'),
(1546, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:23', '2022-08-14 07:51:23'),
(1547, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:25', '2022-08-14 07:51:25'),
(1548, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:36', '2022-08-14 07:51:36'),
(1549, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-14 07:51:38', '2022-08-14 07:51:38'),
(1550, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-15 08:27:23', '2022-08-15 08:27:23'),
(1551, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-15 08:27:24', '2022-08-15 08:27:24'),
(1552, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-15 08:27:30', '2022-08-15 08:27:30'),
(1553, 1, 'admin/calendar/events/1', 'GET', '127.0.0.1', '{\"_token\":\"ihh5NnApbeN6r2wsLBOT07m1cKX3NmGHHIPQgBnj\"}', '2022-08-15 08:27:34', '2022-08-15 08:27:34'),
(1554, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-19 23:56:03', '2022-08-19 23:56:03'),
(1555, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-19 23:56:04', '2022-08-19 23:56:04'),
(1556, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:17:50', '2022-08-20 00:17:50'),
(1557, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Venue\",\"icon\":\"fa-venus\",\"uri\":\"#\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\"}', '2022-08-20 00:18:47', '2022-08-20 00:18:47'),
(1558, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-20 00:18:47', '2022-08-20 00:18:47'),
(1559, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":16}]},{\\\"id\\\":18},{\\\"id\\\":8},{\\\"id\\\":17}]\"}', '2022-08-20 00:19:02', '2022-08-20 00:19:02'),
(1560, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:19:03', '2022-08-20 00:19:03'),
(1561, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:19:06', '2022-08-20 00:19:06'),
(1562, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:19:09', '2022-08-20 00:19:09'),
(1563, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":16}]},{\\\"id\\\":18},{\\\"id\\\":8},{\\\"id\\\":17}]\"}', '2022-08-20 00:19:18', '2022-08-20 00:19:18'),
(1564, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":16}]},{\\\"id\\\":18},{\\\"id\\\":8},{\\\"id\\\":17}]\"}', '2022-08-20 00:19:18', '2022-08-20 00:19:18'),
(1565, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:19:18', '2022-08-20 00:19:18'),
(1566, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:19:19', '2022-08-20 00:19:19'),
(1567, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Organization\",\"icon\":\"fa-home\",\"uri\":\"\\/organizations\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\"}', '2022-08-20 00:20:32', '2022-08-20 00:20:32'),
(1568, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-20 00:20:32', '2022-08-20 00:20:32'),
(1569, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":16}]},{\\\"id\\\":18},{\\\"id\\\":8},{\\\"id\\\":17}]\"}', '2022-08-20 00:20:46', '2022-08-20 00:20:46'),
(1570, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:20:46', '2022-08-20 00:20:46'),
(1571, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-20 00:20:48', '2022-08-20 00:20:48'),
(1572, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:20:55', '2022-08-20 00:20:55'),
(1573, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:03', '2022-08-20 00:21:03'),
(1574, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:06', '2022-08-20 00:21:06'),
(1575, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:07', '2022-08-20 00:21:07'),
(1576, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:08', '2022-08-20 00:21:08'),
(1577, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:10', '2022-08-20 00:21:10'),
(1578, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:11', '2022-08-20 00:21:11'),
(1579, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:13', '2022-08-20 00:21:13'),
(1580, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:14', '2022-08-20 00:21:14'),
(1581, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:15', '2022-08-20 00:21:15'),
(1582, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:17', '2022-08-20 00:21:17'),
(1583, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:22', '2022-08-20 00:21:22'),
(1584, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:21:26', '2022-08-20 00:21:26'),
(1585, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:25:26', '2022-08-20 00:25:26'),
(1586, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:25:31', '2022-08-20 00:25:31'),
(1587, 1, 'admin/auth/menu/20', 'PUT', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"Organization\",\"icon\":\"fa-sitemap\",\"uri\":\"\\/organizations\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}', '2022-08-20 00:25:39', '2022-08-20 00:25:39'),
(1588, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-20 00:25:39', '2022-08-20 00:25:39'),
(1589, 1, 'admin/auth/menu/16/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:25:44', '2022-08-20 00:25:44'),
(1590, 1, 'admin/auth/menu/16', 'PUT', '127.0.0.1', '{\"parent_id\":\"19\",\"title\":\"Venues\",\"icon\":\"fa-venus-double\",\"uri\":\"venues\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}', '2022-08-20 00:25:58', '2022-08-20 00:25:58'),
(1591, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-20 00:25:59', '2022-08-20 00:25:59'),
(1592, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:26:01', '2022-08-20 00:26:01'),
(1593, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:26:05', '2022-08-20 00:26:05'),
(1594, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 00:28:03', '2022-08-20 00:28:03'),
(1595, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 00:28:33', '2022-08-20 00:28:33'),
(1596, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 00:28:42', '2022-08-20 00:28:42'),
(1597, 1, 'admin/organizations/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:28:57', '2022-08-20 00:28:57'),
(1598, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:30:05', '2022-08-20 00:30:05'),
(1599, 1, 'admin/venues/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:30:07', '2022-08-20 00:30:07'),
(1600, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-20 00:30:09', '2022-08-20 00:30:09'),
(1601, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:30:12', '2022-08-20 00:30:12'),
(1602, 1, 'admin/venues/1', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:30:59', '2022-08-20 00:30:59'),
(1603, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:31:57', '2022-08-20 00:31:57'),
(1604, 1, 'admin/organizations/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:31:59', '2022-08-20 00:31:59'),
(1605, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 00:31:59', '2022-08-20 00:31:59'),
(1606, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 00:32:17', '2022-08-20 00:32:17'),
(1607, 1, 'admin/organizations/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:32:23', '2022-08-20 00:32:23'),
(1608, 1, 'admin/organizations/create', 'GET', '127.0.0.1', '[]', '2022-08-20 00:34:41', '2022-08-20 00:34:41'),
(1609, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:36:07', '2022-08-20 00:36:07'),
(1610, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:36:10', '2022-08-20 00:36:10'),
(1611, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:38:40', '2022-08-20 00:38:40'),
(1612, 1, 'admin/organizations/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:38:42', '2022-08-20 00:38:42'),
(1613, 1, 'admin/organizations', 'POST', '127.0.0.1', '{\"name\":\"dsdsds\",\"email\":\"user@gmail.com\",\"description\":\"sdds\",\"contact_name\":\"sdds\",\"contact_number\":\"sdds\",\"address\":\"dsdsds\",\"multiple_properties\":\"on\",\"creator_type\":\"AdminUser\",\"created_by\":\"1\",\"_token\":\"VaKNXho08nCNxPECuWb71ia7hEqB0bvdaDX7qHHY\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-20 00:38:53', '2022-08-20 00:38:53'),
(1614, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 00:38:53', '2022-08-20 00:38:53'),
(1615, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:41:16', '2022-08-20 00:41:16'),
(1616, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:41:23', '2022-08-20 00:41:23'),
(1617, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:48:38', '2022-08-20 00:48:38'),
(1618, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:48:40', '2022-08-20 00:48:40'),
(1619, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 00:51:19', '2022-08-20 00:51:19'),
(1620, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 00:53:43', '2022-08-20 00:53:43'),
(1621, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 00:54:01', '2022-08-20 00:54:01'),
(1622, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 00:55:33', '2022-08-20 00:55:33'),
(1623, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 00:55:55', '2022-08-20 00:55:55'),
(1624, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 00:56:38', '2022-08-20 00:56:38'),
(1625, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 00:58:14', '2022-08-20 00:58:14'),
(1626, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-20 00:58:39', '2022-08-20 00:58:39'),
(1627, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 01:02:17', '2022-08-20 01:02:17'),
(1628, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 01:02:28', '2022-08-20 01:02:28'),
(1629, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 01:02:51', '2022-08-20 01:02:51'),
(1630, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 01:03:15', '2022-08-20 01:03:15'),
(1631, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 01:03:55', '2022-08-20 01:03:55'),
(1632, 1, 'admin/venues/create', 'GET', '127.0.0.1', '[]', '2022-08-20 01:05:20', '2022-08-20 01:05:20'),
(1633, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 01:12:10', '2022-08-20 01:12:10'),
(1634, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 01:12:33', '2022-08-20 01:12:33'),
(1635, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 01:12:38', '2022-08-20 01:12:38'),
(1636, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-20 03:59:20', '2022-08-20 03:59:20'),
(1637, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-20 03:59:21', '2022-08-20 03:59:21'),
(1638, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 03:59:30', '2022-08-20 03:59:30'),
(1639, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 03:59:36', '2022-08-20 03:59:36'),
(1640, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 03:59:48', '2022-08-20 03:59:48'),
(1641, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 03:59:48', '2022-08-20 03:59:48'),
(1642, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-08-20 03:59:49', '2022-08-20 03:59:49'),
(1643, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-08-20 03:59:49', '2022-08-20 03:59:49'),
(1644, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Radisson\",\"star_rating\":\"5\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":\"16\",\"city_id\":\"146\",\"address\":\"adsssadadsad\",\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-20 03:59:58', '2022-08-20 03:59:58'),
(1645, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-20 03:59:59', '2022-08-20 03:59:59'),
(1646, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:00:35', '2022-08-20 04:00:35'),
(1647, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:00:42', '2022-08-20 04:00:42'),
(1648, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:00:43', '2022-08-20 04:00:43'),
(1649, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-08-20 04:00:44', '2022-08-20 04:00:44'),
(1650, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-08-20 04:00:44', '2022-08-20 04:00:44'),
(1651, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Radisson\",\"star_rating\":\"3\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":\"16\",\"city_id\":\"146\",\"address\":\"adsssadadsad\",\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-20 04:00:46', '2022-08-20 04:00:46'),
(1652, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-20 04:00:46', '2022-08-20 04:00:46'),
(1653, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:01:48', '2022-08-20 04:01:48'),
(1654, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:01:51', '2022-08-20 04:01:51'),
(1655, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:01:53', '2022-08-20 04:01:53'),
(1656, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Radisson\",\"star_rating\":\"5\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":null,\"city_id\":null,\"address\":\"adsssadadsad\",\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-20 04:01:59', '2022-08-20 04:01:59'),
(1657, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:02:00', '2022-08-20 04:02:00'),
(1658, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:02:07', '2022-08-20 04:02:07'),
(1659, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:02:08', '2022-08-20 04:02:08'),
(1660, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-08-20 04:02:14', '2022-08-20 04:02:14'),
(1661, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-08-20 04:02:15', '2022-08-20 04:02:15'),
(1662, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Radisson\",\"star_rating\":\"5\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":\"16\",\"city_id\":\"146\",\"address\":\"adsssadadsad\",\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\"}', '2022-08-20 04:02:16', '2022-08-20 04:02:16'),
(1663, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-20 04:02:17', '2022-08-20 04:02:17'),
(1664, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:04:21', '2022-08-20 04:04:21');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1665, 1, 'admin/venues/1', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Radisson\",\"star_rating\":\"5\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"9\",null],\"occasions\":[\"1\",\"2\",\"8\",null],\"amenities\":[\"1\",\"2\",\"4\",\"7\",\"9\",\"13\",\"17\",\"34\",null],\"price_type\":\"per-day\",\"price\":\"50000.00\",\"capacity\":\"5000\",\"division_id\":\"2\",\"district_id\":null,\"city_id\":null,\"address\":\"adsssadadsad\",\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-20 04:04:24', '2022-08-20 04:04:24'),
(1666, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:04:24', '2022-08-20 04:04:24'),
(1667, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:05:14', '2022-08-20 04:05:14'),
(1668, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:15:37', '2022-08-20 04:15:37'),
(1669, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:16:04', '2022-08-20 04:16:04'),
(1670, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:16:33', '2022-08-20 04:16:33'),
(1671, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:17:32', '2022-08-20 04:17:32'),
(1672, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2022-08-20 04:17:41', '2022-08-20 04:17:41'),
(1673, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:17:42', '2022-08-20 04:17:42'),
(1674, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-08-20 04:17:51', '2022-08-20 04:17:51'),
(1675, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-08-20 04:17:51', '2022-08-20 04:17:51'),
(1676, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:18:14', '2022-08-20 04:18:14'),
(1677, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:18:22', '2022-08-20 04:18:22'),
(1678, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:18:22', '2022-08-20 04:18:22'),
(1679, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:18:23', '2022-08-20 04:18:23'),
(1680, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-08-20 04:18:27', '2022-08-20 04:18:27'),
(1681, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-08-20 04:18:27', '2022-08-20 04:18:27'),
(1682, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"15\"}', '2022-08-20 04:18:29', '2022-08-20 04:18:29'),
(1683, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:20:16', '2022-08-20 04:20:16'),
(1684, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2022-08-20 04:20:24', '2022-08-20 04:20:24'),
(1685, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:20:25', '2022-08-20 04:20:25'),
(1686, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"30\"}', '2022-08-20 04:20:28', '2022-08-20 04:20:28'),
(1687, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:22:34', '2022-08-20 04:22:34'),
(1688, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:22:36', '2022-08-20 04:22:36'),
(1689, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2022-08-20 04:22:40', '2022-08-20 04:22:40'),
(1690, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"30\"}', '2022-08-20 04:22:41', '2022-08-20 04:22:41'),
(1691, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"35\"}', '2022-08-20 04:22:44', '2022-08-20 04:22:44'),
(1692, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"30\"}', '2022-08-20 04:22:45', '2022-08-20 04:22:45'),
(1693, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:22:52', '2022-08-20 04:22:52'),
(1694, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:22:57', '2022-08-20 04:22:57'),
(1695, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:22:59', '2022-08-20 04:22:59'),
(1696, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:24:12', '2022-08-20 04:24:12'),
(1697, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:24:20', '2022-08-20 04:24:20'),
(1698, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:24:20', '2022-08-20 04:24:20'),
(1699, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:24:22', '2022-08-20 04:24:22'),
(1700, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:25:24', '2022-08-20 04:25:24'),
(1701, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:25:36', '2022-08-20 04:25:36'),
(1702, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:25:46', '2022-08-20 04:25:46'),
(1703, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:25:46', '2022-08-20 04:25:46'),
(1704, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:25:49', '2022-08-20 04:25:49'),
(1705, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:26:32', '2022-08-20 04:26:32'),
(1706, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:26:39', '2022-08-20 04:26:39'),
(1707, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2022-08-20 04:26:47', '2022-08-20 04:26:47'),
(1708, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:26:48', '2022-08-20 04:26:48'),
(1709, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:27:16', '2022-08-20 04:27:16'),
(1710, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:28:16', '2022-08-20 04:28:16'),
(1711, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:28:16', '2022-08-20 04:28:16'),
(1712, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:28:17', '2022-08-20 04:28:17'),
(1713, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-08-20 04:28:20', '2022-08-20 04:28:20'),
(1714, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-08-20 04:28:20', '2022-08-20 04:28:20'),
(1715, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:32:01', '2022-08-20 04:32:01'),
(1716, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"s\"}', '2022-08-20 04:32:10', '2022-08-20 04:32:10'),
(1717, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"f\"}', '2022-08-20 04:32:14', '2022-08-20 04:32:14'),
(1718, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:32:24', '2022-08-20 04:32:24'),
(1719, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:32:53', '2022-08-20 04:32:53'),
(1720, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:35:27', '2022-08-20 04:35:27'),
(1721, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:35:58', '2022-08-20 04:35:58'),
(1722, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:36:19', '2022-08-20 04:36:19'),
(1723, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2022-08-20 04:36:29', '2022-08-20 04:36:29'),
(1724, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:36:29', '2022-08-20 04:36:29'),
(1725, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:36:31', '2022-08-20 04:36:31'),
(1726, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:36:32', '2022-08-20 04:36:32'),
(1727, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:37:39', '2022-08-20 04:37:39'),
(1728, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:40:00', '2022-08-20 04:40:00'),
(1729, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:41:43', '2022-08-20 04:41:43'),
(1730, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:42:03', '2022-08-20 04:42:03'),
(1731, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:42:32', '2022-08-20 04:42:32'),
(1732, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:42:47', '2022-08-20 04:42:47'),
(1733, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:43:18', '2022-08-20 04:43:18'),
(1734, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:43:26', '2022-08-20 04:43:26'),
(1735, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:43:26', '2022-08-20 04:43:26'),
(1736, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:43:46', '2022-08-20 04:43:46'),
(1737, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:45:17', '2022-08-20 04:45:17'),
(1738, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:45:34', '2022-08-20 04:45:34'),
(1739, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:45:49', '2022-08-20 04:45:49'),
(1740, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:46:09', '2022-08-20 04:46:09'),
(1741, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:46:45', '2022-08-20 04:46:45'),
(1742, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 04:46:53', '2022-08-20 04:46:53'),
(1743, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 04:46:53', '2022-08-20 04:46:53'),
(1744, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2022-08-20 04:46:58', '2022-08-20 04:46:58'),
(1745, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"16\"}', '2022-08-20 04:46:59', '2022-08-20 04:46:59'),
(1746, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 04:47:06', '2022-08-20 04:47:06'),
(1747, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:50:34', '2022-08-20 04:50:34'),
(1748, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:50:40', '2022-08-20 04:50:40'),
(1749, 1, 'admin/districts/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:50:43', '2022-08-20 04:50:43'),
(1750, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:50:49', '2022-08-20 04:50:49'),
(1751, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:50:52', '2022-08-20 04:50:52'),
(1752, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:51:00', '2022-08-20 04:51:00'),
(1753, 1, 'admin/orders/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:51:03', '2022-08-20 04:51:03'),
(1754, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:51:09', '2022-08-20 04:51:09'),
(1755, 1, 'admin/venues/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:51:14', '2022-08-20 04:51:14'),
(1756, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:51:45', '2022-08-20 04:51:45'),
(1757, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:51:51', '2022-08-20 04:51:51'),
(1758, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:52:19', '2022-08-20 04:52:19'),
(1759, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:59:43', '2022-08-20 04:59:43'),
(1760, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 04:59:45', '2022-08-20 04:59:45'),
(1761, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:02:10', '2022-08-20 05:02:10'),
(1762, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:02:11', '2022-08-20 05:02:11'),
(1763, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:02:13', '2022-08-20 05:02:13'),
(1764, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:04:57', '2022-08-20 05:04:57'),
(1765, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:05:06', '2022-08-20 05:05:06'),
(1766, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:05:09', '2022-08-20 05:05:09'),
(1767, 1, 'admin/venues/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:05:11', '2022-08-20 05:05:11'),
(1768, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2022-08-20 05:05:20', '2022-08-20 05:05:20'),
(1769, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":null}', '2022-08-20 05:05:20', '2022-08-20 05:05:20'),
(1770, 1, 'admin/load-api/districts', 'GET', '127.0.0.1', '{\"q\":\"6\"}', '2022-08-20 05:05:22', '2022-08-20 05:05:22'),
(1771, 1, 'admin/load-api/cities', 'GET', '127.0.0.1', '{\"q\":\"41\"}', '2022-08-20 05:05:22', '2022-08-20 05:05:22'),
(1772, 1, 'admin/venues/2', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Essel Tower Club\",\"star_rating\":null,\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"8\",null],\"occasions\":[\"3\",\"6\",\"9\",\"10\",\"14\",\"15\",\"16\",null],\"amenities\":[\"1\",\"6\",\"8\",\"10\",\"18\",\"29\",\"30\",\"31\",null],\"price_type\":\"per-night\",\"price\":\"30000.00\",\"capacity\":\"2000\",\"division_id\":\"6\",\"district_id\":\"41\",\"city_id\":\"318\",\"address\":null,\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-20 05:05:28', '2022-08-20 05:05:28'),
(1773, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-20 05:05:29', '2022-08-20 05:05:29'),
(1774, 1, 'admin/venues/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:05:31', '2022-08-20 05:05:31'),
(1775, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:05:36', '2022-08-20 05:05:36'),
(1776, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:08:18', '2022-08-20 05:08:18'),
(1777, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:18:51', '2022-08-20 05:18:51'),
(1778, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:18:53', '2022-08-20 05:18:53'),
(1779, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:23:26', '2022-08-20 05:23:26'),
(1780, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:23:32', '2022-08-20 05:23:32'),
(1781, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:23:34', '2022-08-20 05:23:34'),
(1782, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Organization\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-08-20 05:23:42', '2022-08-20 05:23:42'),
(1783, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"contact_name\",\"type\":\"desc\"}}', '2022-08-20 05:23:51', '2022-08-20 05:23:51'),
(1784, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"contact_name\",\"type\":\"asc\"}}', '2022-08-20 05:23:53', '2022-08-20 05:23:53'),
(1785, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"contact_name\",\"type\":\"asc\"}}', '2022-08-20 05:23:55', '2022-08-20 05:23:55'),
(1786, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:24:01', '2022-08-20 05:24:01'),
(1787, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:24:03', '2022-08-20 05:24:03'),
(1788, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 05:26:05', '2022-08-20 05:26:05'),
(1789, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 05:26:14', '2022-08-20 05:26:14'),
(1790, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 05:34:53', '2022-08-20 05:34:53'),
(1791, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:35:01', '2022-08-20 05:35:01'),
(1792, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:35:05', '2022-08-20 05:35:05'),
(1793, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:56:52', '2022-08-20 05:56:52'),
(1794, 1, 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 05:56:54', '2022-08-20 05:56:54'),
(1795, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 05:56:58', '2022-08-20 05:56:58'),
(1796, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-08-20 05:57:10', '2022-08-20 05:57:10'),
(1797, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 05:57:16', '2022-08-20 05:57:16'),
(1798, 1, 'admin/users/create', 'GET', '127.0.0.1', '[]', '2022-08-20 05:58:21', '2022-08-20 05:58:21'),
(1799, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 05:58:33', '2022-08-20 05:58:33'),
(1800, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 06:00:24', '2022-08-20 06:00:24'),
(1801, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 06:01:00', '2022-08-20 06:01:00'),
(1802, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 06:01:17', '2022-08-20 06:01:17'),
(1803, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 06:01:31', '2022-08-20 06:01:31'),
(1804, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 06:01:35', '2022-08-20 06:01:35'),
(1805, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 06:01:36', '2022-08-20 06:01:36'),
(1806, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"User\",\"username\":\"user\",\"email\":\"user@gmail.com\",\"password\":\"$2y$10$42fQJep86380hDrRU\\/Chs.d4TGNWj5RhRRIeUC3WuyoSjdJKkJOE6\",\"password_confirmation\":\"$2y$10$42fQJep86380hDrRU\\/Chs.d4TGNWj5RhRRIeUC3WuyoSjdJKkJOE6\",\"email_verified_at\":\"2022-08-02T09:19:26.000000Z\",\"venues\":[\"1\",\"2\",\"3\",null],\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-08-20 06:01:42', '2022-08-20 06:01:42'),
(1807, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-08-20 06:01:42', '2022-08-20 06:01:42'),
(1808, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 06:01:45', '2022-08-20 06:01:45'),
(1809, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 06:01:48', '2022-08-20 06:01:48'),
(1810, 1, 'admin/users/1', 'PUT', '127.0.0.1', '{\"name\":\"User\",\"username\":\"user\",\"email\":\"user@gmail.com\",\"password\":\"$2y$10$42fQJep86380hDrRU\\/Chs.d4TGNWj5RhRRIeUC3WuyoSjdJKkJOE6\",\"password_confirmation\":\"$2y$10$42fQJep86380hDrRU\\/Chs.d4TGNWj5RhRRIeUC3WuyoSjdJKkJOE6\",\"email_verified_at\":\"2022-08-02T09:19:26.000000Z\",\"venues\":[\"1\",\"2\",\"3\",\"4\",\"5\",null],\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/users\"}', '2022-08-20 06:01:54', '2022-08-20 06:01:54'),
(1811, 1, 'admin/users', 'GET', '127.0.0.1', '[]', '2022-08-20 06:01:54', '2022-08-20 06:01:54'),
(1812, 1, 'admin/users/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 06:09:00', '2022-08-20 06:09:00'),
(1813, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_VenuesSelectable\",\"args\":[\"1\"]}', '2022-08-20 06:09:07', '2022-08-20 06:09:07'),
(1814, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 06:14:23', '2022-08-20 06:14:23'),
(1815, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 06:17:37', '2022-08-20 06:17:37'),
(1816, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 06:50:15', '2022-08-20 06:50:15'),
(1817, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:08:23', '2022-08-20 07:08:23'),
(1818, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:08:26', '2022-08-20 07:08:26'),
(1819, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 07:08:27', '2022-08-20 07:08:27'),
(1820, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 07:08:41', '2022-08-20 07:08:41'),
(1821, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:08:47', '2022-08-20 07:08:47'),
(1822, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 07:08:49', '2022-08-20 07:08:49'),
(1823, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:10:17', '2022-08-20 07:10:17'),
(1824, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 07:10:18', '2022-08-20 07:10:18'),
(1825, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:10:27', '2022-08-20 07:10:27'),
(1826, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-20 07:10:30', '2022-08-20 07:10:30'),
(1827, 1, 'admin/organizations/1', 'PUT', '127.0.0.1', '{\"name\":\"dsdsds\",\"email\":\"user@gmail.com\",\"description\":\"sdds\",\"contact_name\":\"sdds\",\"contact_number\":\"sdds\",\"address\":\"dsdsds\",\"multiple_properties\":\"on\",\"users\":[\"1\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-20 07:10:37', '2022-08-20 07:10:37'),
(1828, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 07:10:37', '2022-08-20 07:10:37'),
(1829, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:10:41', '2022-08-20 07:10:41'),
(1830, 1, 'admin/organizations/1', 'PUT', '127.0.0.1', '{\"name\":\"dsdsds\",\"email\":\"user@gmail.com\",\"description\":\"sdds\",\"contact_name\":\"sdds\",\"contact_number\":\"sdds\",\"address\":\"dsdsds\",\"multiple_properties\":\"on\",\"users\":[\"1\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"7NAB0ToMfmJ5VXbs01pNwGqg41AuCGzoOrXEtk3g\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-20 07:10:43', '2022-08-20 07:10:43'),
(1831, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 07:10:43', '2022-08-20 07:10:43'),
(1832, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:17:11', '2022-08-20 07:17:11'),
(1833, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-20 07:17:13', '2022-08-20 07:17:13'),
(1834, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:17:16', '2022-08-20 07:17:16'),
(1835, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:17:49', '2022-08-20 07:17:49'),
(1836, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:45:19', '2022-08-20 07:45:19'),
(1837, 1, 'admin/organizations/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 07:45:21', '2022-08-20 07:45:21'),
(1838, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:19', '2022-08-20 23:42:19'),
(1839, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:20', '2022-08-20 23:42:20'),
(1840, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 23:42:27', '2022-08-20 23:42:27'),
(1841, 1, 'admin/organizations/4/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:32', '2022-08-20 23:42:32'),
(1842, 1, 'admin/organizations/5/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:34', '2022-08-20 23:42:34'),
(1843, 1, 'admin/organizations/6/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:35', '2022-08-20 23:42:35'),
(1844, 1, 'admin/organizations/7/edit', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:37', '2022-08-20 23:42:37'),
(1845, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-20 23:42:50', '2022-08-20 23:42:50'),
(1846, 1, 'admin/organizations/5', 'PUT', '127.0.0.1', '{\"name\":\"BK\",\"email\":\"userewwe@gmail.com\",\"description\":\"ewew\",\"contact_name\":\"ewewe\",\"contact_number\":\"weew\",\"address\":\"ewew\",\"multiple_properties\":\"off\",\"collaborators\":[\"1\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"Iq7kdzmjPvnJZckOJQCoMW2rhUXdSlFuAdU30eAg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-20 23:42:54', '2022-08-20 23:42:54'),
(1847, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:54', '2022-08-20 23:42:54'),
(1848, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-20 23:42:55', '2022-08-20 23:42:55'),
(1849, 1, 'admin/organizations/4', 'PUT', '127.0.0.1', '{\"name\":\"ewew\",\"email\":\"use22r@gmail.com\",\"description\":\"ewew\",\"contact_name\":\"sdds\",\"contact_number\":\"sdds\",\"address\":\"ewewew\",\"multiple_properties\":\"on\",\"collaborators\":[\"1\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"Iq7kdzmjPvnJZckOJQCoMW2rhUXdSlFuAdU30eAg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-20 23:42:59', '2022-08-20 23:42:59'),
(1850, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 23:42:59', '2022-08-20 23:42:59'),
(1851, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-20 23:43:03', '2022-08-20 23:43:03'),
(1852, 1, 'admin/organizations/6', 'PUT', '127.0.0.1', '{\"name\":\"serwe\",\"email\":\"usewerwerr@gmail.com\",\"description\":\"rwerwe\",\"contact_name\":\"rwer\",\"contact_number\":\"ewrwe\",\"address\":\"ewrwe\",\"multiple_properties\":\"on\",\"collaborators\":[\"1\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"Iq7kdzmjPvnJZckOJQCoMW2rhUXdSlFuAdU30eAg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-20 23:43:07', '2022-08-20 23:43:07'),
(1853, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 23:43:07', '2022-08-20 23:43:07'),
(1854, 1, 'admin/organizations/7', 'PUT', '127.0.0.1', '{\"name\":\"ererer\",\"email\":\"uerreerser@gmail.com\",\"description\":\"re\",\"contact_name\":\"rere\",\"contact_number\":\"erer\",\"address\":\"rerere\",\"multiple_properties\":\"on\",\"collaborators\":[\"1\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"Iq7kdzmjPvnJZckOJQCoMW2rhUXdSlFuAdU30eAg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-20 23:43:11', '2022-08-20 23:43:11'),
(1855, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-20 23:43:11', '2022-08-20 23:43:11'),
(1856, 1, 'admin/organizations/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 23:43:14', '2022-08-20 23:43:14'),
(1857, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-20 23:43:16', '2022-08-20 23:43:16'),
(1858, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-21 07:24:44', '2022-08-21 07:24:44'),
(1859, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-21 07:24:45', '2022-08-21 07:24:45'),
(1860, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 07:24:58', '2022-08-21 07:24:58'),
(1861, 1, 'admin/organizations/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 07:25:04', '2022-08-21 07:25:04'),
(1862, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-21 07:25:07', '2022-08-21 07:25:07'),
(1863, 1, 'admin/organizations/5', 'PUT', '127.0.0.1', '{\"name\":\"BK\",\"email\":\"userewwe@gmail.com\",\"description\":\"ewew\",\"contact_name\":\"ewewe\",\"contact_number\":\"weew\",\"address\":\"ewew\",\"multiple_properties\":\"off\",\"collaborators\":[\"1\",\"2\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"GqZX4Q6J8BXzSHHu4Mt7fo8DCLiBH3hvGyn6U8Ut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-21 07:25:10', '2022-08-21 07:25:10'),
(1864, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-21 07:25:11', '2022-08-21 07:25:11'),
(1865, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 07:26:39', '2022-08-21 07:26:39'),
(1866, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-21 07:26:42', '2022-08-21 07:26:42'),
(1867, 1, 'admin/organizations/1', 'PUT', '127.0.0.1', '{\"name\":\"dsdsds\",\"email\":\"user@gmail.com\",\"description\":\"sdds\",\"contact_name\":\"sdds\",\"contact_number\":\"sdds\",\"address\":\"dsdsds\",\"multiple_properties\":\"on\",\"collaborators\":[\"1\",\"2\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"GqZX4Q6J8BXzSHHu4Mt7fo8DCLiBH3hvGyn6U8Ut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-21 07:26:45', '2022-08-21 07:26:45'),
(1868, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-21 07:26:46', '2022-08-21 07:26:46'),
(1869, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 07:27:41', '2022-08-21 07:27:41'),
(1870, 1, 'admin/_handle_selectable_', 'GET', '127.0.0.1', '{\"selectable\":\"App_Admin_Selectable_UsersSelectable\",\"args\":[\"1\"]}', '2022-08-21 07:27:43', '2022-08-21 07:27:43'),
(1871, 1, 'admin/organizations/1', 'PUT', '127.0.0.1', '{\"name\":\"dsdsds\",\"email\":\"user@gmail.com\",\"description\":\"sdds\",\"contact_name\":\"sdds\",\"contact_number\":\"sdds\",\"address\":\"dsdsds\",\"multiple_properties\":\"on\",\"collaborators\":[\"1\",\"2\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"GqZX4Q6J8BXzSHHu4Mt7fo8DCLiBH3hvGyn6U8Ut\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-21 07:27:47', '2022-08-21 07:27:47'),
(1872, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-21 07:27:47', '2022-08-21 07:27:47'),
(1873, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-21 22:17:22', '2022-08-21 22:17:22'),
(1874, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-21 22:17:24', '2022-08-21 22:17:24'),
(1875, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 22:17:33', '2022-08-21 22:17:33'),
(1876, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 22:17:38', '2022-08-21 22:17:38'),
(1877, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 22:43:22', '2022-08-21 22:43:22'),
(1878, 1, 'admin/organizations/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 22:43:25', '2022-08-21 22:43:25'),
(1879, 1, 'admin/organizations/1', 'PUT', '127.0.0.1', '{\"name\":\"Demo Organization\",\"email\":\"user@gmail.com\",\"description\":\"sdds\",\"contact_name\":\"sdds\",\"contact_number\":\"sdds\",\"address\":\"dsdsds\",\"multiple_properties\":\"on\",\"collaborators\":[\"1\",\"2\",null],\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"9G5wSimvodI4PLn5PI6tO9ZFZNwr1yxru2Dh5Ve0\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/organizations\"}', '2022-08-21 22:43:33', '2022-08-21 22:43:33'),
(1880, 1, 'admin/organizations', 'GET', '127.0.0.1', '[]', '2022-08-21 22:43:34', '2022-08-21 22:43:34'),
(1881, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 22:48:01', '2022-08-21 22:48:01'),
(1882, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-21 22:48:03', '2022-08-21 22:48:03'),
(1883, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-22 04:39:45', '2022-08-22 04:39:45'),
(1884, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-22 04:39:47', '2022-08-22 04:39:47'),
(1885, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-22 04:40:00', '2022-08-22 04:40:00'),
(1886, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-22 04:40:12', '2022-08-22 04:40:12'),
(1887, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-22 22:21:13', '2022-08-22 22:21:13'),
(1888, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-22 22:21:14', '2022-08-22 22:21:14'),
(1889, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-22 22:21:23', '2022-08-22 22:21:23'),
(1890, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-22 22:21:27', '2022-08-22 22:21:27'),
(1891, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-23 05:16:41', '2022-08-23 05:16:41'),
(1892, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-23 05:16:43', '2022-08-23 05:16:43'),
(1893, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 05:16:51', '2022-08-23 05:16:51'),
(1894, 1, 'admin/venues/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 05:16:55', '2022-08-23 05:16:55'),
(1895, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-23 22:04:46', '2022-08-23 22:04:46'),
(1896, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-23 22:04:47', '2022-08-23 22:04:47'),
(1897, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:04:55', '2022-08-23 22:04:55'),
(1898, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:05:00', '2022-08-23 22:05:00'),
(1899, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-23 22:30:42', '2022-08-23 22:30:42'),
(1900, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-23 22:30:42', '2022-08-23 22:30:42'),
(1901, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:32:08', '2022-08-23 22:32:08'),
(1902, 1, 'admin/venues/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:32:25', '2022-08-23 22:32:25');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1903, 1, 'admin/venues/9', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"demo\",\"star_rating\":\"4\",\"description\":\"<p>dffddffdfd<\\/p><p>dffdg<\\/p><p>dfg<\\/p><p>dfgdfg<\\/p><p>df<\\/p><p><img src=\\\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQAAAQABAAD\\/2wEEEAAbABsAGwAbABwAGwAeACEAIQAeACoALQAoAC0AKgA9ADgAMwAzADgAPQBdAEIARwBCAEcAQgBdAI0AWABnAFgAWABnAFgAjQB9AJcAewBzAHsAlwB9AOAAsACcAJwAsADgAQMA2QDOANkBAwE6ARkBGQE6AYsBdwGLAgQCBAK2EQAbABsAGwAbABwAGwAeACEAIQAeACoALQAoAC0AKgA9ADgAMwAzADgAPQBdAEIARwBCAEcAQgBdAI0AWABnAFgAWABnAFgAjQB9AJcAewBzAHsAlwB9AOAAsACcAJwAsADgAQMA2QDOANkBAwE6ARkBGQE6AYsBdwGLAgQCBAK2\\/8IAEQgBkAJYAwEiAAIRAQMRAf\\/EABoAAAMBAQEBAAAAAAAAAAAAAAABAgMEBQb\\/2gAIAQEAAAAA5RiAGAAADYgGAxjAAGIGIXLOVsBZ6ZyINGl2sQwAAYDAKQADGMAYwABpHLMZmeuNUprMkpGneJgMABjYAxoAGAzHcbYAhpKMuasSFpZgVm3nVy\\/SQAxgDKbAAbSABgZbtjASQ+XPbm0z52rnXCG4al63l6SGDCgCm6EDE0CGMDDopghpYzjGbrKG4YSIhm1ZWdrAYwoB0xsAGIExguTtpiQE8nPWK0vAioRSmlLs0fOeiNg2xsKbobQDpCQwFwejQIank4r055uEgQMgTqARXo5MqrbbbKp0Dcg6GpACPL9egAWPnT3Yc+YppFMSmVtMqRvqsz2x6dG226boGAOgakYZeV7NCYkuPXHkInOiKnQp85e944ldXLXVvlz3vbbdUUDGxsYU0CWHl+1aAamJ83IrORyVamHm+p4Q9NLqpzkvpop02xjBugYDpC5PN9jVgJTy5c+OkVmQ9NtnyYyPYjG9NpXRgNLa3F702wY6YwQwA4uH1t2CSww5s6hEINtKXPCQ77vMuerLKnrlrDVN6G+tsbbZSAGBPDx+rvQxTx4Y5XE3KpOnvykvGq2151m05qxWJ3D0066G222IbGlPjnX6DYHPwckVai28KrpxSl6cxdZaZvSYvIe7hvqBLtdFDZQA2E83ml+zTAjyecEovXGC9W1zpwmaORqW4W1Z76Xnt0To222OgBgLh4rXqbthPDxSgm3nk3psuTZRnJdmvKyK0gdrVdxelA2UVVJANpcHGq9e6YLlvHztbvfhzzit86NMcofSZMmYk1mxJa6dt6UA23dORMGT5HPc+j2tjSM\\/Pw9h582WWWkhWTySIWmmcg7sxLl316dLYNt3SExgc\\/m8+uXT67YCDGdghcGeMSaOIQSAg6TOleXXF74d1NjbbpgDGLz+FzGnu0AACSBcXHjUpwBIhIKbvnoqzToNeimMpjApjCPJwNIz9ftBAJiQT4+UaaYCAlIkbznTTMrTC9KNO\\/VlDKGDbGsOHlig9HuYAAJijx0dd+feLU50QOs4mtJUmmdaX013uNW2OhjGZcGeC0g6e7oAABALl4lW\\/LPO0kKQ6H54NvTNXN1pfob8mvQ222xgcvCpIRp2ehGgAACXn4YW4yloemRB28fMjSGFMZddfb5fTpe21FMAPJlDgi9+nroGAAjjh8xz5oQqDKpvjAbuCnOud9vRyY+s5nTo1YRfPxYb866ZnLTT09VQDAEuPpc+VhMppElZnPoopgON4g6Pb5fN7ey4Se29YRhzF5T0iyN+zedmJjEJCw86c8wmWkksUUmANGht6r8\\/l9LscIJvmnTi6efXC2Mq9+vpWWzAEJLm4ImYVQ1MhjAwqm4sns02efDr0VtrYs587ujl1ynrIeNdL1vNenQCAmPNwJcQpuR5Lt8\\/KgZda4dryx07ufmy9PpwitdWubm6+QmuhmM1049Os5ehrQAJR5\\/MlCkZCFHuZebhjb6uWl6K1459BPn4NfT2SjGrrhvTk0z2sjLTU7dI5evr0ABKePlzmVLM3JnfvR53Kbd\\/Ry3z9ZlxYdumFYcnb0VVsnLDl78ubTSmpub6WsOnq3GwFPLwwlMMlzOenr3y8nbo7KpTnycl9sZZ8+PodZLLa4c+vArqwd4R19Lzw6dOuNaYKPOynSeWWVXKpNpZ19aBRSz5+ae3XKc+ee3Q0oSOSennru8\\/p6OB9GlZm1d2PVbanl42ZXz46Lty5MGtJ5PVz7rZKmIy5ufXvfPBzR03V6Fk8xvKrVY3vb5L3XpRvrTOfhUzGWusarlOU7csbvkx9LXRpKIx5suronjHETFXrppZhlpVdGaq6vk20rv1rXRrn48MogfXakiM9cFpePDlY6rW9Iywz6ejm5oddOCUo6Khpaehx5j6Ojk3ro6Ok20qOXmylROc7bxWfNZ5qnswDescNYyGm56dpUdFmayJImnpveOOi6ry2XXfSa2lllniomc5fTWGJXGq6eWse3oOfeOHqjjxo6duycO3g61leYLIReuUM6RW+3PXbLe8JwyZIo5ntrzyPle88fZjPadfmdXHp083JefS99x8HRk9by6OTZZVe3NKt6zfRWfZnW81znH6NYZ7ZclEVjhfKvQ5Oa619TxfY4uI6+iePNbzn3ehh5Pfzm\\/b5fRxdbnTLt51IWut7Y7YdbNeWub0efJTpjKOWR8U9vHkaLaL51rtRgY7XHRvPA9tK7eO+dELbtzx2lTr157EX0N3hXL38mOjiJnNzGXHr2cGdtoUFxbTzsOrXDkNNK3yIzQ9Nrx31xz33nPfoxjY68q5fQjh304Q58dzCOTTu88rPQlNpaNCYnSV0zrnHOGOnvhveUVvkb57zrz105hlnvc68uGNbRgV08Y4bSGkwGAzW9nzZ9dJEBvIONXzdsPQjPpi1UzJZS4hWcuneClGggSiaBW2KS45DtqjDINU1beSp25ixu3MsKp8SN45OjvtiiLSRSAoAYxc\\/n8z216yIFA0MQ3Q22KygSV0pRfLy+mszHH0+oBokYgKQLk8UabKGFW6oHRTbbYMo0EY5BXffneSMO31qZNAgBTIMjn50kKSUDBtDYgG0MQ6acwD6N+\\/5gC+rvelMTbGAA0gQJgkpmVGcoFIpATEqakSSDp9j\\/\\/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME\\/9oACAECEAAAAOoAiEABzxRoZ9ICRIIIVGYNKzPSESJEIQqRYs0Q6LpEzEQjWFItQ0LFz01JJJEQ6cxUtsl1lpLJdwkkgjpzlUmrmapUoRUkgjryi6sLC6gtkBJIRrty5m1TeZppDUSLJIuYb68+RdJqk1SWkRmISHXpnz0U3pNKCxJiIiL6K80FOhWllsoxmSSE69a5cSjdbpZOkCY2c+UPRq3HHAWtdKDQJl0lcsa3pcTnzKNb0qqIYnfNECal4cqOltVag1rON5tMtQrnwWy7aKrn0LpmXOi51JWZxukWal0udTS2sgljOmZzddclmF1O2OsCohc6ZXKYnTXKqzNuvLqSq57mRqwynOaLoyt6892TWbc6zcZ1tkJhZNLnOtOvLrYpAzh0MM7kixZi9E3nQoi3HLe9TGc9IyoTLpnawQF2ggkSQTF7b0nOKBaoKCARj\\/\\/EABgBAQEBAQEAAAAAAAAAAAAAAAABAgME\\/9oACAEDEAAAAIAKUKAlAF5gKqiikCKga5BS1VKlCQCFMoKtqqJREgsgBJatq0MdIJJFslQiyW1aorGxMkaSErIU1aoMbpjNFRmohVW1RU5dNGAzq5ZWIK1qiaE566EizNSSwgW7UlpzzeoDEIgiWW9SgcZetAwskSzIL00tDng3sKzEhLMJRpL03Y5ZTXTQJZiEMIVblL01ME3dULc5kRMxR0c7BVlsrpRZMpEzYIbzYNCpd6S24kiMtZhF1LBrNVq7zmb3GbOdzYkItlKWy61efPPo0dNZ5dPJrBYS0KVbbrnid7JrV5XhvnYE6Y1VkU0u0m5iXVxOW8CUK1WZqla1hrJq5y49MQCk1tg21m22JL1xzlxcgA3vOZdXWVtZDTnrmAAiyrRaqF05TC6BAgKKAA\\/\\/xAAgEAACAwACAwEBAQAAAAAAAAABAgADEQQSEBMwFCBA\\/9oACAEBAAECAP8APn+HM85mTMhW2xFAQGa4LtFimxgOxJmq5tSFv9GfzkzP5zMzMzMzJmGNXa9aGMdDAkunbRDCfJIYMIftkzMyZMzM+IPjMzMz4WqSVM0AwBJZGIMMEZIZWjQD7gZmZmZgmfMHxkzzn8Gyl2s0AMIB4LB7GgGtAWaYhZlc\\/LM++ZMzMzIpEz4MXsNzsAhFZjRfGhjB4WNGGYQlYQDsT\\/kzzghGZnjP4rImf2ZbZWWbMAW4kQmbB4E2N5ARxcXJBMMH0zBMzMzMwTMzMyZ5qgH9mWhXrd7IWFzlX0QsRiiEQ+QJmnyzNC3sDA\\/ATAM\\/jPGAZmEZMmPKiJnnPFzPV0tSwBkEYAPNhMKkiFoAqBSCT4xYtqMysHilP7zwP7zIP4zJmZZKwJkzJmEclbauQtj4wUkKDM0Qhg0BMHiuYKiGlaPWqYtWOptC6P5H2HkeeueLykHjP6IZjZoZwRiw+CiK9ZDx5kytQ0DYF7KnqqEczUIPkfUeB\\/W7DOUwas+c\\/h3pd2xSCIxE1ShD1AK4cMDCEe21lixrAxuRjbawsAYoFsFgYvU\\/YH\\/Ny2BpI\\/u1r\\/DsIVAK7Mik31wo5aGEQFYykRGBsrKrCcnqMIFqqSpayq3urf5OTZtLj+jLOT7LHJ7MWMYsBGLBgkKuHQRkMUobLGZpbA5jFQYrEs6koKbJgWIXlVo+I+RjtOI39clmjzETz3wwkQHuZuMzFoRAC86ErK6rUQsIrdQFJs3BGNYuWmwQf4r7WgKOP6dVFsxYSYRUdbyClgRI95gh8bBBUwYB1sYkISpG6C0qRRcjCkFVr+IHwM5VfrhSgD+SGnQx5WHVVNKlUMIUAM7wB2SqGZEFMLO0AEMUBrIoAKlwQajbWi\\/ED5GctzCUZG\\/rkq1RoeK6Ucil6+jFkIEe5naIrrmEEdEZbUPVqwSSAergI5dlmBEf2Iw+IgB+JjsWMJ4j\\/Cxbq4vixLkWuuoh667e7WTGOEGb4CsDZGgqalZWbWFfrCrCAKxQnxHz5DKvQhxxrM+Aq\\/PnixAjpchJ8qWOn4AbWTaVeqlndHDJGpahEepfkPnyXtZmJ2uD\\/Be7gRnUQ+dMMyA4fGonVHewN0dFu9hdblu9tVoP+Ix5aqjr1zhv9iXdpipY2KMzDG\\/jYBYxIZFCOOwsKu4s6BaxTXW48b9nlb8trCCYhBoO\\/V1dXFVfpvOBGORwYIZsBCMC2qxGGdQxsMUrZKmpI8WH67yHFvJIQV9PV0R+\\/wBrKLIRUpTq7mA7M\\/gQUOPIYlIXmdcDVwOHqsnJZLQfpyWMK9epGJNpeI30uBqZFTsXJmQRT06lGRRUzFj1nbsLAwjN46gMAvGgtuapvWti3j+z5ve57YpMC4QCht5C\\/V05samqtKyCPAIgAGm2FOwfQZkM6gQL3JWEq1LWV2rVajYUAW9Lf4tm8hwpCKpBrYgjsFykwH5ZzFrhAV5hGTAUZ3AEd\\/IsY6CoJMzuFKgjxSpDpYvFsU4RhRWXkK85L1XFqrGKWXo1QmYUR3HFjPT\\/AAPgRke10sRx4VvAEI8GMPGCGCP4CkbEdxQKWeXIjU3B8IzM6Czktx3KuCwhf2Gzv7e4hdIi8XzZYB8rrS5JmZjEiY3kxj4HjSY1KqJ2WhUVZXaLWjik9BavIWzMMMKsEa1KmcapolkeWhQpUO9VhbDB8naxQCBA7mGCERQUPh+NakIiAgAihL0zjqQ1hurXqyOFeqwqaOgdeR3wi9KrEN6IdRw\\/fW8INZkEItNLA\\/BlcAZhhGkztM0gzo9Zp5BEZWWipwkWUVUcdw4SLD4tR1qdbwSvVq+gYXdr0RmhBgRa+nRlxRiRBhlhosr+JllesMIBKwCdYZuAsOQrVcfjvxPzLXdw6uNfxEQhxYsqaOe9iyi0jQ4sIClDUw7o1tSH2Czv7DZ2BZ64JhSVrQfOTMyXQgzCM8AsAH8greWvC2quTuLvZsIYOrCphHVJZLIJXcCUmaH7sttKMj2VqtbBPZvpdBK0CmWMgE4xlhEzMwgxyymuqW1GEYFeqyp5hAhvNq32uLegrE0mdtaxr2s7VtHUWPWag1VxnYN2KEYZYlbgtXUsVeqlisUqOjhI5oIlsUZmYRewGEOqNahVK1SyBLfBXKFuiUWUiJdmeMIKkEOCtUEMsRCxYBxyPcCHD9i2ujVhgzAWdxZ3gCkEM0RWVShtWsCAYRY7QAlWDEIDUlOEXpbT6616Ux4lQS8VMlq3izdhGMGVkldukWgPDUKjUQHFw5IuBIJcLYLxYjgWQQEENYeytolLMK4IPNscNDNMUixH8FjBCrgnTatqxq7KfWh936RzP0LyUv7ljGgNdsuXr0QdwjVqGXoy4ZY4v7MpUeCx81iyyItcsFXiqCDwxeEEdQnTqa5XcGUsWlk7uRebvfXYL\\/eL63ZHqCGk1esJPYxL6r3MlZRWTj8iWolZSqtq60tUqQykMcLMBD4qBGA6K0iPSRYW9ndiSbDf7fc1j2TFNUI7MxY3BFK1Mpj0qlED2pRSazXYvrKOIFnHDBBala0i96W5JpNy1ixbazOj19WFi52CkQGwLLFWtPFIqJiWFWhYmPUaDxhxvy+ty4rssYPbA9zXPWlq8ljFsaKvGW3kVDk3jktc3KqNgnYhZfDyQ4WxmHEltnFNx4ychgXLqVMSABHQnx3dlLFZcQK5qJnYl4FEKrCYjuLAsRSxteNGtcVwi5yVczi2G8unIu5bzaIGJtUDohtrM48EdWnFjxJUOj+HtW2y7uDqCwIzJWzx2sKV3hV7B7ZWyMx7WAxFJd4ZnZ0zHipZFXGZIiuTBCFL277idaJb7jd3eahFjFIASzpabkvHJHNttWwKWZi6t3rct2D11l1FKCWqksnQBFRWQCyVwF1edy4DlmAMW1GZO\\/YmiVNZOqo5pCzWnUKxARbVSOOtSqoCMtj2TMrdGWEWOI5B8IVsdg9TC+1xKnR0sFtc95gtBNqX2NUTKxykUeizjOCSbH7qzOqoNQiboYQEeMwQ+EJYsfCts1XK+sVCoQK4tW7wE6evoE6OQlaKHTqCZ16UhhKzUjxYkczXIlg7sK6LS5wWMhdR+dK2cUek0+n1Gv1er1Cv19AvTr16dOnTpFfsrd7E6JSamT0lJoIDIYqkZ0VCv5umVR6eqwgBQIFNZr9PpNXoWl47uKyYQU9H5Px\\/j\\/H+T8n5hR6PR6PQeP8AnPG\\/KOP+b835TUKPzflPE\\/EeEOM9edUTOuXAVer0he3bsr+w2+AdD92YLm7vbuX2YAsQspr6dBWVNYIuDdenpKBOnTp6\\/V6\\/V6hX0zMzM\\/i+27k9gVs7\\/o9xs76U9PrKTe4bsG3dBDQ+RAZgGZMwL6PR6Uqeq7hrByjzTzv3Ny\\/dxqOnXrmYRMzr169evXrmTlWYF6lcwecmhvb7xyP0\\/p\\/T7\\/f7xb2DbszOvTp06Djej0+q2ez2+4cgPyh+IL09XQTiUATd7bu7v8YU6dZ2LWVnifl\\/N+b0ej0er19OuZhGZgHjr169cAyDxuhvZ7febxe1nbQZVyK7hM69OgWh\\/aLhYDvb29+2wHx169evXr169evXp6\\/X6vV6vT6Pzfl\\/J+Q8Q8T8n5Rxvzmn1dMP0IzM69czjEJ\\/\\/8QAOxAAAgIBAwIEAwYFAwQCAwAAAQIAESEDEjFBURAiYXETMpEgMFJTgaEEI0BCYlBysSRDY5KC0RTB4f\\/aAAgBAQADPwD\\/AFUHkSyVHA5m1TqH9JT5h2mzQiFlC4EXcaAjXuIHN4hYgkmNXNiLd1cDszGG5moQTmWbM7CGAAr0l525rLRduQx9oL4IH+rYMVRpgmhm\\/WKygKZuJLGgBmEnMs2eTPNYm5SIRCSO820Bn1m1AAYWNk2YVIPhcrr4UDmHwYDDf6N\\/OI6bfvwwlYJ9jENl2wOg5gBG3Tr3yZVgfr6Ta2eIG6UZzKYzGYgYk9uAJx5SB0FyzBxL8QBe4X28MDv1m9vaWSZuP+jH4zDb\\/aM\\/fH4WoeoJE2puYGuLgZW25qrgUlqtmPlg0QWOdQwqrDFtLFE8Ta2IeBAUrrdxiYENqDnvCx8K8KOD4XXp4HmKOTNI8K022Kwf9G\\/6h\\/8Ab93\\/ADUX0JjbxpoLPX0jabsckXkHkQfzAOHphH20D5e1zTXNktG1BvP6UIUJvI7wE4Mq7nrz1hGABBsqs3zFr1g6i\\/ABs1OZRr0H2EZct5rwI4us94VJFSvfpAy0R7H\\/AEb\\/AKl\\/u9jLqAXakQEklyvejkwPS6aMajI1NiC8TUN9hAgNJmE7iR6wDgZlnr4AweC9JU7eB3H28DF255Eo2CRXEfgCbUJ5Z+sF4uEcTHNQXm8\\/\\/qHqtf6H\\/PPufutFLJvd2BgApha3YEIckaYIm5h8NKP7zPBPeZsQpgAEX1jOSbuG6PEonxINZnpLlcA+NjwEuZ9JUPjXrAosmbmDDgRDnv36GXdQn1xmoSoI7\\/15CsR2jfESmF39yU02IhRFZzljxNg03PLG4oHkADOQJ8JdinJ+YzarAD5pZLVgRg+7rdzsxs9BM5mYAJmGsmC8WREI8rEHsYSMiYMFAV4lsAdI\\/vM2Iea+wAciHdZibyArWe5iXtA\\/\\/h9IE72eo4gKBiSDQyBPlBOINuDY\\/rhsex0MUuoIx90X1NFO9waiVdVwY23TYGyJvZSLzGBNYoG5+HiVeAfWUbEvpcuvbwoATOIQ0F5xCwwOIqaZJXLcTr4uXFcxkZlUMWvJrpDZ3GgBZnEyPaFzU01UkiM+4qOBmXhLJEOfNgiUB9L7zLEYO2MyAdYNg3D3gFgf11aT+0ph90pIJq+kCg32JqOt7AVU9IP1nAIi3g2JdkTHPSVRUwXXgTxLBxCqo3eE1DhZwOKgK1Dx4A6bNdVH2lmJCfuYWUgDANtLIwMSwT6zV081QgYhnF\\/hWeUH4dDuTGGUyAxo3UNAkDN+lQb\\/AJ6rIzG6v+1TYuDYJzCwybBHJgV+xFA31lk5\\/qh4gaddzBuGJuRSO33IGvnhdMmWdbWaNqmzlj+wgM3MikfqOogIEAFGDNCAZPAlkm5QqbLsGJt1FC45ELaTaarY\\/EZs2Csg9+Yw1HY4NyzmYguxKm2lceXmoHGQa\\/thVaAOQCZR8G1Aqnjr6mHTz8GgOvWAiyfN0HQSiCdT2iGwDFs5FdhCdMoAMcRCK3CmH0MRMJWBE5bnoIAOMVzAQDBurdcJU1f+XpAAFv2gsDqf6igoqNYxYgOmlChX3DodwG5KyOoiuq6qGxtIMKfw\\/vqQN8qhVibKrJ6xkPYwgAfrcwDfMKjiE8mYIrPMPbEDuSxVaE1qBxUOoKRmFfMLwIfihd\\/rfpMmj7GVzkyxKMHUzabB6Qu6C4SjBiOPDUUEDtmMhDDvNTVzsBHYmbatQPYwYI57QAsCai7epMNeahQ6TqL9DCm1hkEXNpsnmPtDE4hV7uyRHBvrGWirAseRPRbMC2o8w9YTuBcACOGpgK6kS+h\\/pbcaY\\/WHBgdBQqsEfcIAaUsOPSDSLE+VvwLx7GOfK1e3abibNEChCyIPwn9KgbgUDxPKPace03GcGYN9pjIyesBokcx1Ko0YMyC9zUImmXBbmh+kUudt0O8ZR5uvgVA3QGKp82R1iqbOYdQgREULgmqijTrlycwaRCZqoeghJq89TDsBIHzEwMwIv1m24QKBBgVStDmeWt2IGTaeRkS6NEgnmLuLbrA6DrCo4HzVELANYNgVAALGBK0yQwvtAF3EfIYV1NxPIHA7y3ZTjt\\/SkuW7mWqzLD7YXSa4dIBnzqH5V6LCDnmeX1jOSR+phHl\\/WEgmp61CV29Cf1n0EG2EwVZaKQbOehinTpa4yTGWnDi81XMFDA9TGC5HMsiZuwSRN43tqQXjiC4nrXeIFOw1fQwAc5Mar2nNVAxNmVC4ZukQbtsCk82RiM3yOSB3jcCUc3XWEgY6XAaAGLmsoBUYs2IGO5yb6VL8+AFrE+K9qQD2gGqcX3HpEyzVuHYRHJOGB\\/QCbLcdaoeohayRZBv+kCKR3xKDZsUKENDEZSa\\/DL+0CLI4N\\/SfFc6rkhd03OT3JnM2qZuN3OkviANTC5RNKa6TzWIbmOMwdp5W3C7FLEchuO8RWphiXgAKISPAV9gdoWUFeScCaqMtnIi2WAIECf2gw4Fmu03LYwvWbTkWOkxd9ciWoI4lcGEYMWhnjpLxuAMUWp\\/QiIfmIIPS4unYIzwPW4ppuTwK6zaH+IAdtAGG7FURAYqmwOlf0hJDQ03ccTSAqEHeMrCNNb5P2rBEOnpDS2WNtsTxCVGpXl3RwCKOzJgKj1Al0ALIgsbTYEH7xviEKpvmoUveDCxuhV0JRhoYx0hMIsEcTTGoj7TtqveoBpfKo3HwUoAFqpvNA1AOcz6+PfgzzjPrftN7eYw7KUUnT1mcwYMOxjKOLKnNSzXFTdy1HoYcqQOZfOaENheDCWLKv7y8Gj6TTZPUEUJRpXDe4i1gwutD+4i5tsdLx\\/TZVLncTyA0Oe0I4+k3CyKOMfbZ1XTXlminS+H0qo50ipZbPzHvUKeXeGANip8MEIL3g2Yx0tIjqc+0+GqMgwphdzqK+0MozF1GIS9oyXM3mwKVcCeXd03UIYRmO4UhaI6wsFHaF9oboIl+aLQ2DA5JMKmjgwDrZ8NpqIH3crtxNNFvqO8rIUXN9LQrt3gB82R6GHkA7Tx7CC5ggYE2mjCMmjOxF7c1HY5EJWgOTUJWyQGEHAPSjLOBzCOvHMUZJoEYlOABcOCQNrcG5YonP9MWZm65Ih2ru5M8g95tAMsOCbIr7lSp3JuHaZRSBvOaHCiMoxdhzMDHQeBbTZVxYnwv4fag65lfwpPUm4dQ5+RbJgck1UCjcj+WFOliadlitknPaK7ElT9YtAryJZqIErrfgsuHx8u4MLuaYVQOephoi\\/BS1rxHJ4IuFEJYiIFO013JgJFIP90ayRVrjE3KxLVWahPe7iuSLPlHQcmBgQVzDW67jbeTR6wFUU1Qe4y77yN2P6XbpN3OJu3X1xKbPInkHvLUTa4wLND7r+a+p3UCJepd0xB9iOonrfjvRlurEA0wh421NbRuj5QQZ\\/cAFB6XGcwgVZrt4lGzADc6mE9fHnwvwwTcswkzabuBlySDDqbST5ZigRzEW7+aDDhutYmmyk1RBsxvMwOL6RGyBlhmLvXoDLe\\/29IqgACVqWLOCTKAH9LvcJ2nCrjbn9Za3\\/cZgSxiBU39bAgIBH9A5Y6SrApdee3gzKFPSdeg8MDxIlHwx9nEqXQ61BR96mmrdxefUTeODVYhFgGBnA3DM+HtF5jaeAbhydtA9uYhKkr+twgkA7veLRJjX8wr9oHHr\\/SWGELNbfMZ5llpd4DQHf5uAMwlSVNioaUd5akff0CTCxZu8rwLWeg5hccUg4HgWx49J3EAOPHbfeHwsHIFRTQVaAFQg8UZR7mISbJmkDTExbJUiDBrNAyx5xYJ\\/XE0c59RATSChE8oKVNPUNIDY5jVtQmvU1csspNEwoLYVUDrYN+PH39KT2Et9b3ECO1c5MJcE3hBB8J\\/cwjSbttErSq8zJsHi4F\\/hg3UmeavS\\/vtyle4hXcOxqA1QM34E0Urdqe4ijSWupFSye5jJyILx4EXCDCTB14gBwZnwIhoGxm5TEQG7EUDjMFmxzGIAuCiCaJhOBkCEJu7GpgwHO0XcuMAaH6xTYO4e0ALbQSSMQqSGHlrPWbGcbsF\\/GtrXwf+fv60Wmnu8mCWELFqG7pccuM4qYN9zExxdd4MwqrcnjE3fw4VVqiLn\\/UBb\\/s+\\/wBGixxnmaOQgJvuYqBl3ndixNFqDlgYEBG8FNpA9JWDe6+J1OSfAz18B9kXCWO02O8RcHzN36DwHgYavMN\\/oY1VVATp0hX9YMxqIuEAURFLC+4xGXUbpRm4sQoF4M3jJF9vDKpZ56ShT+1wHg\\/ehUAJwZuJIRuwmptqgBO+oIn+Ri0fLF7GC8NR9essBGtcytZV2Y28+G4MRwWNfetTaj8A0iz4ekHb5mOIy0T1zCULgjGCJQugfcQgg9buWfsZgzd16QHTSiCe0pmvpiMBdY6GMhphRlkQnT1KoVKgsmX9PBNvy59IaIHEcTOTLlgXmoE47eCEEgkEd5gMOLqVQ6gRdor9Zt3GIQaOYSTN4BP92D7yvlJBmqvORNM9aP3FeN6rVGQIt5FMZdOuQYCB4WreOKbIEOmwYEEdjFKEJyRPKvsPvTq\\/xIB+VADMJ7mfE\\/h9OuQJt3swygupvTVdpk46ePlMORMGWcTDLtzfM2ihyeY2xUGAITHFmuIRxAPmAPgT4HwGPaLk3M34Ai+3MUDg3Bdj94qruJu+g6QsbEN889Id+1aJ6y8kRgOYyuL4gdb8AYyfKxEYfOt+omm3DfZPw2rpn6S8wIldW4mbKkbefWF2JMtWT9RCCw7QhCW5uUuP7h42QPTMrHYVBsY\\/pN2kh9PDzEdgPvDtVu08iewg7RVFAY\\/+5sZ1HXExcE6+HQSrhVrELGzzDzKMZiSTz4gGWwbbNxs+BPvBm7vtOlVDkXLF8TbyoJhN1L01W8jmIA4F5GPDnMG8eYj1EsZ56zBm0zzAHhv+RA5euhA+wp5E1E4ax2M\\/GtRW4IPgF02F1YiqqqxPoZu1GdhgTdqOrf3RkJ6wMLAoyyHXhooauYABi5jwF8wsTj3h2L9Z5GHYxUFky9MNWWyfsWAfuAZXgo3rdMBKfZdmFMGKaIu68BCt8TBglwEzP2CLvxBGIwODRjVc4uc5gxmbj7cys3zMXcJ\\/WbQaAuGgzdYNtlbPNwkC+ogyKNyxCprE2KQ+bN3EYWD9oTVTruEOp6ehlqUJyOJyJ8NrqDUUN3wZsapsvFgwE2bhboY3YwwEza19DGPUw9SYCc9oPgj38VXF5OJQr7vTXDKGMpwy0D2HSFruE+Ag7xScCoLlUJn7P16+OPAjrDUDgDAMbSILcG6rrULZW6HzQEV3hOnszzx0mo4tBYqMr7SDY5gYKGzdxUo32wIFq6N8w5uypitdGfD1Lq4COSPURx2P7GaidSPeXyPpEa6P2bEOlqbhN495uUzaxU8GYvrRgKynoAcEy0BfmN8RAvy9YRrqm0URFUDHWCieks+BRSBy2I4WgQLjnlzPUylv1H3YRSx4E8odvmY3XpLYC6lEi78Kit7zHgRLHgLF8QHUKpkE48V2UoyWsmPpuQeSOngQK6keAY1crcDdg+G4eU+wivqhCWo8kQaOqq4I24\\/+zDdlTQImkQwI814jIWKnJ5uPmwI5sZzNTch2mliagKlabm7hHDH2YXD1Xnsb\\/wCZtb0MtD3EvMXddcxs0eO81E7\\/APIhPYxG6147lmzBNdoHLG5tNwsAbzApuv0iXwTB0QfqYv5Y+sQj5D9YvqPeUlesEA6zew+xhR3NzdpIfSXfv9yGBB4MbUfUP4Z5hCSceOLglnAgGSIDM1O0Iz1Ez4GgYrUSoNcRRqLvzZzBvrti5uIE2ERiRfYGNq6ZXNqLWMrMCcg1H\\/t7dJuddx5MbU0SrtSkx0di\\/jnwo32m8CYA7QgwgfPVQUNwIwIrcHwEDDIjDg49czUWdG\\/fERvSFG3CB7IuMwpsiHTa1MXVXcOeolAd7lwEX4N0Mq+3XwwfSbmvxEt8dJs0iOt4lov3Wmu4tZJ4i7sCbWbPhjwzMY4l2PC50MxDA2QOJuv9vFn3OwoVgQs6lxgiaupqbiALb6CI2m65G6v2gUAKMAUIHIKUkXSUDkg3cL6iBKCTYm37FGWPAabg3zNwsg+hit1EZLgK7TMXWO4hx5qjg8X7RTzj3gOR4jpY9o6gg1Cr2PpFYQ1Cp5qXXhXf6eA9IpgyTQlqAIegjVzGPWXcs+F6Y+6FyvAzy+HSYAlHwOehHhjwwRFIFtnrcB4MtTUpkWz0sHgxCzsbANYgHGp9ZqVgqYy5ZDAe8U9RB9qj4blIhAKfSMMVKrHSeYRyKNRGHIHpx4EdfrB2+kIum+sbqL9ohgM6jwJHeWbWKazNNyAB0uL2ml5sHE0im6jRNRZXBhND7ACGuuPClY+kww8NoBvqPt0CZua4QBcIJU8iAAqesCkVhalHwyBL1KMOmaPEI2nkUMzJHgLrwf8At1GPvRj9kP6UYcWpHs00St+amckQqQgCjy9eojYLOGsYriKcRh\\/cY46g+4l86YMT8LD2grGrXvNSrBVo4\\/7d\\/rB1RxEbgyjcsePR1vML2QkPm9BKBWhFICOImeovpioBgapH+4R6+UMPQxTg4951r6Qnr9Z7j2h7g++IOQCIQarEVuCIVbMrUWh5QvMxG8w+F07x\\/wD8crt\\/+N5goQ2ffwYjmHuZcrAmZWn7mU48AwYdRkTAH2sbRCzcYEyWrANz5GEo7l+U\\/tF1F2NAHIAlQucGjUJ1AKN9YAuRu7DvE0wDqGz+wgNsF5Ng+FiEiwCa5gZLVephVGNRmdVJq6m1FsMDYoNEH8S+6roAWMRCWUAACg1dD3Ef4n+AHPcw\\/ZAjDIYxvf3npF7SnBvxPIuxxBVEf\\/c7E1OuIVMHWxNM8kRekbo\\/6GA\\/Mg\\/4i7r3MP3EyK2n9amaKkQdaFwobExiBgMzNiKbiiJBRxQEBJMEAnoZTVU8zZ6wGoijYTmEV7y1BjG8CqlKPs1gc+FY63mYBvIgNknPvFAJu\\/QwBvKbEZnBJ4EQkkjmbGu+kEtge03OtXZhKLt\\/tEJUEfSK7VkShS1E0dBVPzdo+ryKE3EUBf7CDeMkgHFxt5Zebmr8QkvU+HuBDdhg1EJ5Aim6NwQfZuVKMvB8MTbtPrEGcZGbit0+huDv+0vFxlNEQiag6mMOQIOomm3Mx5WNTaAPKR6yron63CCSCP8AiMp4EHBE0z2iklduZwNg4g2gbcWeDECgdYPWCDtf6w7LGDUFUZSlr+WsRdQk0d3MINcTcolq2ektF9vsivWUfAdoOxn+Mog1KIo8QN79vECDmNv5wRiUcYBsmDehAz0MsWJp9WWKB5WW5pbSCwyc55ikgqR1MuEkzWXhjP4o4DEnsZqjkL9Iw\\/s+hInfdB+a49wDFqjqAnubEvkqfYwdjFvmBuCIJtOf0nQzFwudNe5mL78QzVJ8pM1ATZuo1W1fpGBaxA7CuKE81ek4A6jwIxcb420HBqMjCgMj2neaZicyluuon88RAvk5lqo\\/yMswQQhkI7iIwYQS9PUN9ptf3g+JfoIFFg3dYmDP5a\\/a5h7zPPXw9\\/p6VCDwfpGF+W4Vu8VxBVQMMGNuIIrtMGBgQOZgUfqZvRT1BmolkcHM1j1A9lE\\/iPxma\\/4r9xGH8O7kLZxxD10x+hIg\\/C\\/1iXy83m1N13BE3EseTKBgyvUsB4ES2qGrE1V\\/vb6zVvJ+ohFHyG+0Om1DOKIgoMDR7R1UErd5hUgisDiEgFhzADAgb8RAoQ7lH4SC02gAcmeUGbNIE9rMB0w0wXn93eEjeZTExtm43cozaSPSYSbQ3uIdzMaweYqACWlgZswkweGVsRVfUAHIMG0n1mxCL5FTcaE+JTXWABNm6s1AwHrK04sr7BzxCLys\\/wAv2n+Yn\\/k\\/adRrftOP5vTtGYWH3CdNpvuIcC6uDb1vrEYxNJmocxQWY1C21VwK5momGUEd4FTc0DJkZmxGZvSXor6tcTft+plCKA5IyKA94iUm4VX1M0mYKMkki\\/aCvcwF3f1oeOR0smAADwN3PKa56zA5MBOILf3AgbVbfVC6\\/SabICvEFAj1ijUZ24RRB5iD2hbcw64X2gdNH3grb+p9pv0f1gTT2r7CB9FQO9TZpqom8rUHxAvpPNqHsJZu+RCRVcEZhbAHWNvbsJvodj34lABhWZZvkCdiTieXjgzvwAJZ1DxBwcC7m2iOtiEkWKwMCELdnAMcvQPTMYWSJ5G9zCDzc9LMJzcYTBlQEgQAqPNk1xGJAUH3McdVjG8iOD+L2NQpYOOD3hDGjKoXZ6+8LZHzdR3gVc1cdSs834Q0raABxkw0AeCJnb0X\\/mGskZlsF6CVsTcRSw7j1n8qn56RLLGyKqpvIUBiTgYj6D7G0rcmvYQF6o0jH9oBpKRec5moz0oYKJpjTV2we0DHCYqfyxgb4uoitDZAagQYaBHJ4j7RYEAG4MPbrPhqh2mzE34NsTmJ8Iooo0b9IHSuqAgz4tMmmhQfj6mFdDVrBvpG3EVYqhGBVe1wsxvq37CHdXQtDqs2wEgYhUUT1m56Hep1PQVZNStVCGBBPIh+Gamp2EK\\/2nwcuS\\/TiDpY9oVIs2LlG\\/rDtPWpYFnJhBQ0QwGR3n8rnJgUkHJK0Ir6lgwjW3XakRhqIq8GMxBzQhDUcmswKXBNZnlLZ4nlsYuNQAF5hrcRXeCjF2ZGalOp9RFPI4Nzy\\/rNx4xCDg5HHrAwPTv4Aam6ukGzjJJNwZAAgvzDK5iEVg4gQg3YHE3EenEU2Cv9vEW2JNm4u5fIcGVZvJ4HvL1n+kCGcCUMVNushJURR8QjVWyBt9IxyaybMVUUHVBPXEdidlARnO5jZhH900\\/MdRbuqxNBAdisL9J\\/DsMDUiVYLXcNYYzJIqNjiywlsxU3yTKIo3CdNwQKlKBA2k47mAPyYPKbJhVyL6kxlRnvNialDcjUOKW428OA9GrBWgIN9EH5jEPxGCAleS2YzgMaGcACKQEsfL+8CNRBgYhgpvgRcmxdRhr9dtRr+U1XMLA\\/7oG9+om3Ivb1EHcYwIwolc8\\/TpFOoovtiKWTOOtSkLtVtWO0CvpEYm+s5HEO91PSDcuZkt2MXYvtCdNc9IeT6SzVSsdpeipHIH7Tc6g95\\/lC2LxCTzMUR4dDA9XB3l8OYNt3xi47DuFiqAo60TKAZuDLNbrPKkQspvuKltAdViOjV9JbN\\/uJ8DcIWjKbi4fiMAOtCZgBoq31mcEw9z4aYVQ00u\\/7RACQBftGcm5SQ95\\/NWmNWOYDyx5yIp1LU2J5eesyM9YQt3CTHQ2pqWbqMqWgF9D2n8Ran4hM1TpptYgi7g1PhucOTTV1io2qrZ3TT3J2zNuoTg5g1X3cGXVdIQbEJbeDV9onI7Sh0yTzNupvrEtBjJxcAQk3fIEDKoNfL9DAbJOQJvJbp2gZgSBYFCF9fB7RlDnAPpP5r9icTUwQtgZuBg4JxtigaY33fE\\/ljNTyNm8Tg36w7mloovuDP5gro4jlsQaeCciNeIBgwKAfA1ABFU8WB27wMarEOkSCPLzcGxWPDHjqPabPIPMORPNaip5QPW4N+eLEYWQazL1HoRobyaly9QduYS1mZjFoY1iZhppmPuyPaGjCVFRu0PxEsQk5wIA+DFAW2ilgLg+Hg8jwM9ZWO0CrUpG\\/23D8VBU2aj4lnTM8ze\\/iYBVzk30MPwga8ClkckYmsriyTC9MeST4bbgXUsxVtj0OI2aMB827NcTzaQJHXdUqyGs0YTt4xGXdbHBAMKOw3YzYiUPpAzEiDbR7mU5PqIVY29+YwlS+MCKwXg5H794j6irdHJMcDygGMDkEGYAgAqMKH9vaXwKjFFv2hprwOkLBnuqhY4PAuGNuGZWnOvrDPKbEMZTihCO0PIhhhvpDfgw7Ri14jHtCegnpChDAT0\\/eeb5Ye37wqQa\\/fvLqwYOxi1w0A6NF2mrswYswuqnTxaBWufIww20Azz98CCgOwnrB3M\\/y\\/af5T\\/P9pXDQ7SDMzrfELPRNLGoZGMQjmbSICynAhqo3aEGyOneHc3vPL+kCgWl98wMXDMQORCWJzG28GDbi4QDXYywD6R7IFzUqjuMcdDRm7YwJuamSG4jnpV5Im7JM\\/m7R3mDDV1CFrkdIzoCWquYoUhAeOohLACes2GyLiFCtdI8eNQAEePHrAzGrgx+xj9jHHIMfsY3YwxuxjdjDG7GN6xuxjX1h9YV4uGsmes8ozK6yzuDLmHuIxUfzBxGXIdW\\/WM5tq4mOIVFznE9BPSLztEQ15eO0U8qfpFv5Wi7ayCOJ\\/lFr57PapyCmDAurtrFiO1YgXBEWKSRQikk1DwBLsigbnlBvFZgPAgpsSusU2GIhrDCLd\\/EURfzF+sX8xfrNyqBqrj1moRW5T+s1B\\/cPrHQZODNrqVPJzAw5jC7PPSJdkZnxP4c3yhFGGuYdqsGE0+5mn+Jon42i\\/mGD82f+WdPiiV\\/fB+YYPzGi\\/mPE\\/G80jy7zR\\/G\\/1mn0c\\/WD8wz\\/AMpn\\/kh6av7RvzRCozqCvaXxqftD+Z+0\\/wDIYv5pi\\/mtFP8A3TAor4piILbVaaf5n7RPzB9Jo7FvVn8P+MxIn4P3hNBEFR+w+sf8E1fyzGAytfrF7fvF\\/DP8YRdD9oew+gikEFR9Jp92MT8JMPr9Z6yhhoe8JGDNQGwQT6yvmAuegn6Sj80HpEl2Kg7fvPT94+eanoYReCRAVuKy1uHiY1CgDGA1EIoc+1x\\/zB9ZSBTnE0Dw4P6GA\\/LUbuIx6w9zEHLETQc4bcRF6sZpfjmn3idzE9YvrB6wQCD7QiwQeB0lDBLzmDVUDbVHxUAAzTPLMP0n8N2P0mgeHr\\/4wdP4hfpU1Omun1muf+6v\\/vP4g9b\\/APlNf8Bmt+W01fy2+kfs30h6gzEEHpAevgPWDoJnMHaHoIYe3iOs9BBK8GHQw5uDsIhWiv0MGpjTDY7mav4Zq\\/gmr+AzV3ABTc10ZDVX5eY+jpl2ImOv1m35dNY\\/ZJqd0j\\/mgTdzqmA2AhMdAWcDcekHYQdhD2H0h7CH0h9PEw9\\/H0np4DtB6RfSL3EXvETTYGyWBAgnpB2MEHrB0Jh\\/FG\\/FG7xhiN2EbtGmoOp+s1fxN9Zq\\/jaav4zH7\\/sI3UL+qid0T\\/1iflac0\\/yk+pmj+UP\\/AGM0Pyz\\/AO00PwN9Zo9n+omj3f6CaX5jfSaX5p+k0\\/zh9In5iwX86fWNeCnvuEfsD+ompVfDM1iOJrjhDNbrpzV\\/KaPpvtOIe5j\\/AIjH\\/EZqDhzG1\\/4RmPzIb+kTV0E7MRCODGPUwz1ijlog9bh1DvOFDeBh7Q9o24DbjqfE+JhhjQ9zD3hhHaN+ER\\/wCP8Ahnxa3A4nYT1jdxH7iPNTtH\\/DH\\/BD+GHqIJ7z3nrPXwMPh6QdoPEeHrD+KN3hjRoYe0PaHtG9frHx52H6zU\\/OebzbahMH44fxCHvD3mpoggAEGM4XSIwuQY4GDG\\/FP8oO5g7GdxUdCFzs64mn1dh7qZpfnCA8aiH9Y3pG7QjpBBBF7wd\\/tjwHgPH2g9IvaL2iwQd4O4g7CL+BYnVBE\\/CYvrB3h6MI\\/cTUmpHj9jHHQ\\/SN2MMPgZ6fY9ftDtB2giwQd4O8plB62ICMCp\\/\\/xAAnEQACAQMEAgICAwEAAAAAAAAAARECECESIDFBMFEDYSJxMkKBQP\\/aAAgBAgEBPwD\\/AJ5JJs+2xiV42MjwzaSfBJJJN5JHkxdbnPXmknYids7YstsSZKmhVGpbZJJJJvOynvyT4ENDZS8eGbyTajh+BMm0ongVmK0okV6XBqRqXloWB73fuy80+NcD52I6tAmQPbm2LK681OWJFa2J27G5wKzgUnBOxZHZk2jwRto5k5gr42SJjtJJzZZFdoU2kZBnwztoWPtnMFXD3TdXjfBK4vF34k8HoZVy\\/AhsTE8ki3NbIGioWWNNb6V+Ms4SV6qefAhiEo2sS3Zs8CoSyhYbQ6KWP4n1kaa5V1lwUqYXpFOJXozAyEV0qnjenlEieSfM3gorwkNCs0mP4qXxgXxVKpeimhTUuyNNX0xrtcnV9DqRVQqfAheWG0aGQqGnbjbUuGfyQneLQmQvR8m5WW6lyhqGmTm\\/YrNTgplNJ8IaTE+nh2m\\/A12hcbWxpRuVp3IbZS752NSJucoaTJzGzkmLu7zCKuB82SItFk4JGxMkkjJVVKf0h0PSo5SEn3eSbtC2zlEyJNDmR9XXtrIyoQkOkd2ryyRDKklTC7aM7MXkfDt7srd37Hhr97WxFLHWTOxoiEIgSkaOa1ZLkxOBbVLqb6t7F79k5NSTg\\/tf+y\\/Q+VZnR0R3aSTi0QhDgbE4XAsoplJGSlJVuOkQRgSg0iRDEsjMnRDgjBldDT18ITuk1VLY+af2NvEEzfEHEWga4ESSVOEUoR0K3x5qqZnar52VcDaVUlLlr9bH0OIYubLgfDH0ckHStgxBU1BQsECQyfspSp4ZP2T9k\\/ZJJJJP2SSKpDqRVUiplDwJkocDgbFKfBInBq+h5JcyamYiJP8AT\\/RUjoRPA2UM\\/I0s0s0\\/fhmyIRpRpRpNJpNJBpIIZD9EP0Q\\/TvkyZG20QzJTCiCVd8eNYNTNTNRqNRqRKJRKJXigghDVv\\/\\/EACQRAAIBBAMBAAIDAQAAAAAAAAABEQIQICEwMUESQFEDYXFg\\/9oACAEDAQE\\/AP8Ai1Hv4b8\\/D0xEEfgPzF5xxvnq7WTygdlhH4dXeLynVnzLjfYusG\\/xo4npElLwavA7K3fDHPVanvFoRBBGU56IIEuOruy74XzpsTfG1uyF1wwNHnKihj0hNPN94J8bvBAieBDrb0PaTFW0L+RGng9SPClzwQNc6WyqnYh2TF\\/I0OtQOro7Qv0z28wxOeB8\\/wBon61bvFfo6eE3li65npnhF\\/Lpwxw1IpQ16se80iSMFwsRVmnA0o0JtEe4xOSF3Zkki2TZogVMplVNoPoVMCe3I4nWaY+FYIY3obJKOiBqyScM0Olb\\/s+IGlZNty+Fdq2tcC9uhHg0NMVDFpW3ZVNH19NDYnEja8qYmPVNm+hpqB4uFTSve3Z+D\\/X6I1AqXEkav4KyFZWcClEjcH02xtiliWzt9wPQ4m1TbSkm0yTacdSSdm\\/nvBtNdC9\\/wUe39FP1Zkokq7V6VLK9QSmTslWr0ka5KeyHBUu\\/9wXohrV0JEwPZ\\/Q1IlohyU62yty7qzc2gggggi0EXpQipbuhSJWghkClEaPk2btLPtkdkIqRFJJKJ4YItLJZLJJJJJJJJJJJJJJJRKFE3beCzkkkn8aSXf8A\\/9k=\\\"><\\/p><p>fdgdfdf<\\/p><p>dsf<img src=\\\"data:image\\/jpeg;base64,\\/9j\\/4AAQSkZJRgABAQAAAQABAAD\\/2wEEEAAbABsAGwAbABwAGwAeACEAIQAeACoALQAoAC0AKgA9ADgAMwAzADgAPQBdAEIARwBCAEcAQgBdAI0AWABnAFgAWABnAFgAjQB9AJcAewBzAHsAlwB9AOAAsACcAJwAsADgAQMA2QDOANkBAwE6ARkBGQE6AYsBdwGLAgQCBAK2EQAbABsAGwAbABwAGwAeACEAIQAeACoALQAoAC0AKgA9ADgAMwAzADgAPQBdAEIARwBCAEcAQgBdAI0AWABnAFgAWABnAFgAjQB9AJcAewBzAHsAlwB9AOAAsACcAJwAsADgAQMA2QDOANkBAwE6ARkBGQE6AYsBdwGLAgQCBAK2\\/8IAEQgBkAJYAwEiAAIRAQMRAf\\/EABsAAAMBAQEBAQAAAAAAAAAAAAACAwEEBQYH\\/9oACAEBAAAAAPoAPC3sDUlyzeNOjr9Q0w0AAAAABGAACZm00F4PD85VMzXRf0HQlw4aMsoWOJ\\/U9HQ57boAAAAASfQACfIXnevmeHxphmbuMmfoAHFyNumVydTzV9vrNzlboA0AAAAE1jADg5nlPY8XMuZm4goKfogHkpu7pTdw4M9Hv1fM6ulgNAAAABVoYBzeUktlzTzFNMFzFVT9EBPIA19yrZnBzX9OXXx16raGgAAAAoqjnN5exhCZhuzxMxcx+hK\\/agnkrgxRLUM4uPp1Gbs3tpugAAAAEuHaN5\\/Nk+dcwwXMUVssjxjn6GGeNmA783TVt4eTshm0xbXf0HDQAMDJvDjjfn54yVTMFFxSy9nFEEXf0IM8PQHaDdbHBFH3oIa2v6XUGgAGHP57WktOY40RFUUKPHd15Lzi2n96G+IGm0nSxvm84+NSbVe3T2BoABhDgmWMc4ebEGaVFbmVKm9CSzoRfp9rvhzlta25y\\/QeC1nkMbVzq9HQ0AzcOXjkaO5w84ivRUQg9OmXI6FTOX6NKX5OPeilKR28k8xn6+Qd6rTr6K6NoBgJx801YK5xYlw3nmslbNk0luuU5fpCLbBbUpSaXtHhLDFsa3SObu6BmYseeMsxileSOuImcheK9HLl+ZriZyep2rzdsJ0atcajpDAzB+ttau7u5oAiSjKSY4y1js5YNz50c7c10XG3QyXd1bFJWatsdm3i0ydLVo5RtMrhoCTlNEkmNonQ\\/JPDQDcANA3eO1LLyrR69EitRVNuwjM7QrTWM0Myec+LiKZqphuLmiqq4iiIujd1obVEGe1GZ06mA0jRmV8G3cAVJxRhYpNpLLBVUaKLuKgO+OL6rhs0V9raij9baaGMGm6aC6CpzTfHyUFUhMxcM1mdtzbCTQl1259qiLm7WttOsYYM0DdN3cUMVYJlLPGEolpytrCpJEwnOSYT3PcdyUBNNalrUsU3QGM3B9NRdFxc5J1vQxhJz5uXGxpoYiKi4Lmnv4nZyzIvy83TetrUa1G3YXYJ03QgBmYvNzNTNv1ThJJxhNS9NpmZqIsVSX0yYSzmc4ZG+h6qmG0bS7k6TtonM+qYunmF3CiMiITmkUFVqu9Yrm4XhKHZvQmeYB7vZigk2cfOi\\/L05QlLTBc3ZQWjbOSFxNERVhGOpm2tRheWlTktiW5lO70rPmY3Kjvy05n2t1fpDV3EYfilXXIovM\\/Xs9lm5DJc5IMK3+o5\\/k3OiHX00kdg12XG5INOKWdqPZOh9MwXR+fld9RkjKJ0dDzQJybOc5sixn13N8040\\/T9AJ0DbUw4eV+ZL9Du6dVjANxGxzj56amusuYTejrzndVk+ac0JEfsYfNorZf2nPL9HcNahOTR4r9NHbm6uhjDcxTdefCyJc2aSlPM6+kgZKZtGSHN9Vny857m+j6TeXL1NN3aCaZwdFabw9XVXMNzF3cZuOQj0nJtlzKLnfbEJYSlK1Pa3yednYZrHkHZ0PrNLpXDzLWs\\/E\\/XdkNwVXRnXipMMzcIpPIad1ZaOryIenGFS20p5\\/n+pTzuMs+L6\\/Qs5efW96Zw9HVXAMxWzK7xyTVfH1+SIk5It++3KiYrt0cvr0lbd3i8TfX6M5pZTutmQ46Rratufk6uiihhN9S+55ia+quWlPM54CYX77z1cWqejqty9W8\\/i8z+n6DD6BPzkeHRe9Dn5+u+qGLor1IcGnRHCW4mJSUIGHR6BBJ+2zPh5nZZfG45X7vUfd0TzuN06TpvUOROu6rhNaYWc8+O0pLNRJjSnzSYXN6vQdfQ5660uWnWvmcEDp6PQ6dSXHy1TXOvpqZnG3XRVVY0efRQXyR8bCBRERk52REMbr7+2d1Hxpt5\\/DyJTaXdVVd2rvTtoCrx9FKW1eQobQ3l4egiyqkHNmZSHOdXCD\\/T83bmJQxuLzOVHbR9fXpsa9PP6FTVXeWub6jeer4t9DzHosmVHjobArwNOJh9Zz3yeVYTj5+TlZ2YbbZRlK0frpEV\\/Kzo7H6XnFlxtJ+cNmO0p7kqqrSUmk0+sV8zCT+b6XB5kNo2sOM9cSj3r380w8\\/u7OduT2ieRSmKcRNk2ko4PfOOJlMpzZ9Jy9DTcjy8ZOUNq+6zbmUMajer18nKxfo3yvQ4uwSdCqIredlDEeepSaCxajy5V+m8r1dmhGEGXljtabulMjdMq6+n6NYefG\\/TLnjHOzoKbj4jcaKY2blefNIkJ9ECXsQnRTczNnySalRsypjsQ7Y+jTtq3m+dm6Tbo6RnnTQzzRNxXEXHVI9OL0ckPTzMzcmktgs2KO2GlHYlO3ee5i7y80ZYj36MHzXfF45ReWak8a2y5KZt+NvV3BEzN3E5eYbW3RmozLJbdHodbgS8x+Tox7gxl9JnBM1OTsRUVLriPonpouIuFMxJcYwDD674ib00rticJ7Relc6NYaHYPkZ8DVjHrlz1zk6oOq4rdWtiGC4pzCgabrUzMSzdfbOhzYcx09sYtc11em7PPN5jojRodcpAo4hzPu5qquGJq7oAzMybRursR2yCiXuJDb6tNl0sKi+YyoNs7cy4pV07eQFzcXBRJ6msaY7MdHTZnm7TjrJ0gc69IU1NvomcnC4Y6Q6N52TOhKGYoGGGTigusBu9ndtTGm5FG16YYkukN1U62BN8h86+PdknZsyCbHsww0BgJ8e9U4itXr6Wx1ZErGe7PpAMm1NCsrvm4c\\/DSFoxpm3g2S2tsDN0ZtOSdn6E11oZRWFbkm6bqN0GATTqYLJO+hu8EuRH6+ajPxracT1jQ003UnSN9R1GxsGzEhJ3xM6KgYTj0VGqQsNrEvE6dVGkljeZLQ\\/\\/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBP\\/aAAgBAhAAAADbOpnk599xYAFmSyVV0qSPP23jVICU4cW+lttrSyQ4Suu0AnHWfP02t1S3TUkPPlJr00HPPmmru1U6W6W5hfNiya9GwcuPPNabau9tOXP18ZrU84vbohlz588bdk03NWa809vLGtuMa62yGY5cdenGLqrbbfNPZjlelilhm5kYyaqrppfL09E4TW92BLzGTni61V0qvPvuxyl11udJpzhzWpkuqqq0mMSNXW6nNWMLNLJbq6oZzMjDMvTSl4qXSqqmpnlrOayDopXJtGtS2lszMLziyy56WlvOaoa1LS5iZzYjfMbtlrlbalurKiImFjfNZdpbc4qtU1UyIucqszWdbubXOqui1eYi2AzCdNZElVbSXBLNKSLrk1okIVdBMCOjSZSrnKNaEWgOYt1QZmrJmW0JosExKreoGLio2lpFLEqCtCXOJTTpMLYAFxQusW5wtV0MKJUlSsgucUq6HUxLUDKl\\/8QAGAEAAwEBAAAAAAAAAAAAAAAAAAECAwT\\/2gAIAQMQAAAAzdDvomueAAAAAChGlzKlQOm6e\\/LNwIYmABprdExMzKkdOh9EQspGIGFF7aWTETMpQN1QbpSpyAAbt6XVOZjOCZQ9KBdCUzOaAB2yrtsWUQTLpb1MveCZykAZTbLb0Fmpghi20mDdKMUmIpp0TetMlRKUgtdVm5UiTAVUlVU6oaiZmZpF9DlYSIAKGCelUxkwplCCtN3OeMuQTsBgnpejUTKmVNJ6a1DEs4SdCHY7bKFETCQ6qrEGqEkskBdF1UJEpKZCrspi0FMqEgT1bepnmkpkSd1TqmICHmpYjS1Q3MZkpIbb1dUQy4lxIAbjlCJzkQDKugHoVGdGYxLTWBEwKZTAbqqoqxLJ3MKiTZJKZJUgxjbqm2wgemWVMTpSklImmDKHTbbMNXMuG0UkhQIToBibbp0ojSylnKFSSSEBQxCbdBVRk7tqEkNApaB0AhJ0x0ANwEpBUiQ3IwEJjbdAmjOqlIAEDQqAAmgdggIRaSABiGAwBVSABA8goSBoZUsn\\/8QAOhAAAgIBAwIFAwQBAwIFBQEAAQIAEQMSITEEQRATIlFhIDJxFEJSgZEjMKEFQDNTYpLBJENEY7HR\\/9oACAEBAAE\\/APo67DlR9e7KzTo0bHbnuKH0VCIwuMJ3jY9WIMt3A21Vt3EBDGiKmF9D22ylSKnTHQUA+zWf+6d9Il\\/7JejVQ5V235jZQosbxWJ5+ivDP\\/1Lp8GwOtvYTqP+pdRm2vQsJ+oAmLiZiAOTNJ3+JX05SAtmE3uZr9pfgHrkzmER8dzSAQfmIhOPbmyRMmEZlDps8CMNZ5APPvNZtb3HadCoKl79V\\/S+Uq+moCN94P8As8gtfxAKH+zkVSNzUyJupXY6oDbuzb0dgJ56qN6h6tdqgzY\\/SNQswkAWTQmf\\/quDHYx+tpn63Pn+96HsJf1aZQlgcExMjowZTuIQSSSZsPpzvbV2EJ1b9oPGgZRXftORORDjUmyIBQgFMa4MzWmZh2I2Ex6UKnnedI7vjtkC\\/gfQCD3mbGWYHjcQIX3JI\\/7TICVNRRQH+xl6tVsd4eqyOoHYGL1S0Dq3nngZNjtzvMjAGwZrGmzG61UBCCzM3VZs\\/wB7k\\/EP06DChE3ltN5qmqXLH05Dd\\/PiPATVXPEUCoOSPHtOqrzcZPcR8mKl9JB9p0b4wNIJsxTY8C4up\\/qrm03sZiK5CDvYl1\\/2jVREosFIaq+qxM+QBKFEmFRdmNqGw4M001XvD3vaveNnUfYL+THdn+439VD3lgTUYaPMtRN5XuYdMuXAC3AJ+jI2nG5+Ib8L8LgvtL9xEOhgDweIe07+HBnWKLQ\\/BiDUfU9Qa8bIRsZ02QJjp2j9YR6RGfE682yiZGXI++20wUuSh3mRheP1V6oDyPb\\/ALNgCDFoKIciqCSYco2I4i5CxPtAZqX3nUdQEXbkwszGyYb5jkAepqhzUKUf2Yzsxsm\\/oqaR3MpOIUmmaYQZR95vLPgmHJk+0QdHX35AI+JcbBl9QHIMbql00m30ZBaMPgztD9AF8QNZo7NMxpA3zAbA\\/owG\\/BhtOr4Q\\/BiEDkCI7qKAq97gJZtJo7bRnBVRp3U8zGdm3goHc7CB1TSRu195kYGrbftUDKirZl\\/9mrigsyEayO0DARG53qNk0oWj9S78GOboCye8L0KMbOx42EJ8ammEe0poQZuIS0uapqMXDkbhYuIsxW6M0YMQ9XraB19RKrbf8Rm8oKFN2LMOXJXNQknkk\\/SeD+Po7QGEHmpWsTPZIHt9wikAEntE+2dvDqQp0huKMVVF8wBAlsbN8DtHSqIYG94q2G4uL9pozTaccxW087mFz7xX2FkmedlAFtPPcspI4iElRfP+8TQnmqbFwMDC4AIA7mMQGBM1lng2mbIG2FwkAUf8CHJ2G0Jh8NMKiUYQfeeqHVLI7QsZvApaeQgBJYk9gO80FStiFiAR8cxyTuQIed5phh8LAHG\\/0Hgw8neD\\/Am3iACN4EA5v8iZiBkBPOmh8xAWq+PAeHWABkaBi5LSjV8b7ywdK9+8by2rQDfe5iwI+ogkqpnUbPsRR9oKgX4hU9oCOTAGORQp5950+QsCCeP97KxNqP7M994uV8bRcgcHet+Iy2agQAz4j42Zh2Bj9KtekmNhN0DPL53jYyDNB9pR73KPa5v3Msieo7AQIzXQ4i4Q1eqz3HtCiBgqLqPvNN7CFQBd0YjHVZ2btMuq1JEOWhuLN8Ty2vUw3Pb2joZuv4jdvxK+Li4SY2FwxAF\\/S4Gs17z8y5Y8AYLjgFx6d6iqOSYKPB8KmZvMZlYUFmyjY8VtCSaMdWam7cXASBMeRlcAEzIRqNHaCA\\/MURaDWR3mTIpyalmAppvuYDf+7lvSdIhXtcbkzHsxneHaA7wQiZSA1zXuZq2l1vBAWBsDb2jf6qO1cMIQVG4295gX03EOnJkGmyeIVF0CTkPeKdL0ffmMaMBJN1Extm2omZMeXHQfjsYgIOt6uFGIF0J5dkrrFjkCDFhLslkkTEilqIvaFQAaExCsaywMrfgT9ThDEaxPPxc6oGBFg+GQKHJ43jZUU8FvxP1OQnbGIH6g\\/wARAMx5yf4EVG75GgU\\/yMynJ5hArjmLjJ5JiIVPO0EchVLewuHKWJJHJsw2dN7WNjMZ2rsYLUEAn8QmtpsDtCOPAKea8OJtwDOnYKaMFy\\/9zOSP3V8QmE7xTRMLUIuTsRNftFMOscRkLsSxhQjwuu0sXZgcLwLg0ujHhhxNTG1ba+8xu6bLvvxFyujs3cxMhtv5HvO8ZdxXEGElS4+25gZkam2GmxM2Vcg57xzkKgs20Y\\/6GFixsTHlHnlv58x2Iyu4Mxff\\/RmbOyOo07HkwP6AoW4+Q6jd7bRvI0hgd74mXLQIIXjtMWZwux2mLKAxLGZdyTGWYhtBBBBMrhX47RMitBQFkw9QB9qs0y5cpxkaB69hFFX+J5ZHfvEoN3rgzBoxOMjHa9hMrNqLMD6zYMCn+pVnYGLiyE7IZ5WUdhNLjlSImPI49KxOl29TRcONeB4i4PqHizgCZMmqN4bavADebj\\/MWZSwUaTCTzLMap5SlQa7TyxX2iBRXEImQdvftMVBjYjfc\\/5jciWVPFzWVAYTznYj1VULZSPUSYthhcct5Y5q55npArjiWT6vaY8WTMGyWANUZih53BMDnLYlOFDae8yuGfijMWh7JriHDSci4LQgHv2ikF7vcR7jUYmxIgMBgMBmV9LD0Ekz\\/VfgBYmIdySfmBROoTWALIjdIx4cQYcoFRcdKwK79jc8rtr2jYVcAFzQ4gxovcmA7bbTXU1b7iYgvFk+AdSaB\\/3KjNtHjCP4HmFvAB13gG7EQKBRLCZUtzo3nlsTBjY9rmNwcX4hygdocvxBkc5AK2jbkn27RiQZRJ5mLGPOS+DyJnwjDkIvbkTEA2zcAzOiY9tKAn2jMzMdN\\/FRix02OIcbNh0w4mxaSas8RMRyD7hUWunVsesG95kxYgCxferAmBcQFhmsj1TIRZoMRHNZAdMx9U16SkFkWLuOS4BFahPXjyEE7XG7xgsAog34CCCNuRBUB8MthR9eqY0LtZ4EZE21GUFS0FTHrJUnjeBFUk3zAfpv6zGhhjD2lT0zvcs62XtVxSfKoC2MCP32mpVG0fW63feYk06wG5EOMY9h32M0iv6EIAv+53\\/szRZ+4djNCs59hNKHKoqlinCGsBtoWRmYspYmawMZCppJjK7myJi8xVI4hxMYcLk7mNhyN3AiYNHeeWO7CMqNdtFXGoIB5lY5\\/p\\/xjE9jxFyEYrTkRACo94URjuI5dzS7CFAOWhUfyggi+FA8mAKICBNUZmCkgTUJrE1iHIsbOomMs42UwY2PMvQQKmXfT+JjyB0JXtMeTVYbmMtkRRQliE7RGJJB8DB9JhhnBjCz4BHYmhHR15E07UYQSbuBiOTcLy3btQmIoARC6DtMlsbBAE0H3\\/4hT3JmgXw00b3oM0H+E0P\\/AAnl5P4TysnsJ5WT4nkZPcTyH\\/nPIP8AOfpx3YzyF955CTyMc8jH\\/GeRj9p5SfwnlL\\/EQ49VComIqtciIdJ52MQ3rB947qgoczQW3Yw4xEFLUEUwR0YkVArRVgjNTKvvP0WPs7T9CP8AzTP0VfuBi9Cg5JMHT41+1Fmg+00n2gX12RMmLW9gjiY8QxhvUTcFLwIDdQM5Y78QrbAiUKgrt4j6SJUYCtqhS+WE0AfvjY7\\/AHQFUsB4xRuXlYv5z\\/R\\/lLwTXihyYZ52GHPh+TP1GL2M\\/U4vYz9Ti9jP1SdlM\\/Vj+Bg6oH9ph6pP4mHrEH7DP1qfwMPWjtjn63\\/9cPXN\\/AQ9bk\\/isPW5fZYesy\\/EPWZvcQ9XnP75+pynlzDnc1Tzz8m9tBlJH31\\/c5iMV2I2McBgQROmIAddRMIUS4TFO9S4pgMBuCC4BD\\/46Dws+F\\/EveXLEyBmrSL\\/ALmMEIoPPeG+3gEAN7+G\\/gPHv9BhMbaEX7zQPmBFA5MpP5RsSt3nkr3JjYk7WJoxg\\/fCOmojUbmgHjJGT5mjtqhwns3\\/ADDibsf+Z5OSHDl+Z5WX2MOPJ7NG1gAaWja\\/\\/VDqqzc1H3isTe8Or3hLdzLPvBfvBqOwswYM7cI0HR9Qe0\\/Q5\\/aJ0eZCCRD0WUz9DliizpHIjFtIBHMUKRZJuY8aqXIEMNCHiA+AaBopgMdXb7chEVCeXYzGKz17D6hfgDO8Phf1kfU3EbfvGscS1YbiFe4irChja4Se6Az\\/AEzypE0KeCv97Qow5xkj4jovNGUnzNI95oH8hNHyJpf3\\/wCYQ44v\\/MvJfLQPm7F4D1J41TT1Z\\/b\\/AJAgw9UeyQdNmPIxf4n6Q91xz9HX7Fg6euMSRVdeEUQs4\\/aIc4HND+4esxjvP12L+UPWY\\/5iN1JP25McXYxWGwaZCV1gWT7+0w5S9r2qFWhCDloWxfynmYh3gdSdjDAYrxWgM52szEpGU+1eF\\/WPpuXN\\/FjtLly5cuXvHGk88y4CO0WKZsRHEb8RluHHBjzDgEQDNwwBHzHxqu7Yv\\/bAmB+MlfBg6TGf3Ez9Jjn6bCP2CeThH7RP9BeSohydN\\/OHqMQ4zPD1g7Mx\\/qHrn7LP17\\/xE\\/Xk9oesyHh6\\/qHPlP8A+QYWyH\\/75mknl7\\/ueWPa\\/wC4ybbLvBjf2jLXAMqAEE3xCVIA7xcbHYwdIcdvrEf0jmaC25hxD2hxKORERd6oDvHYY6s7HiBgYDA0VorQNA\\/EJ3EHhcuEy4vB8O3jRviAHxEcy\\/C5cuExwHWGWbi2exiq4HECt7xj\\/KBQZoE0iH8wug5YQ5cVXqmQ9O\\/Km\\/gQgL9hcT9TmXbVcPU6tnT\\/AAZ\\/9O372U\\/M8gNwymHp27rDgYckT9O3vP07E7naHABuDc8p\\/aMtDg3KPtCJtNPhv7mW38jNT9mlEbuYuRPV6fxMeXKzrakCeo37R6B3hcngRnrYCzLLNpBtjyfaMKpFnWH7Filk4i5vfaB4rxXgaAwMRBl94MinvPxOIaAgenIizbxUuXe+Bx4Dx4jH1GDwJNeJinadQWT1AbGefkHFT9RlPeDNkK8zzW95qJ5MxEiWCN9oy\\/3GX4hA+IBY5m\\/AuMpXki42NjvUYVDwDAYmbIOHM\\/UuPuQGefhbkMINB+3ID8HaFMnt\\/YlV2hA5qUndR\\/cOPG37FqHBg73\\/AFDgw1QZhG6bcaTG6d1JFho+DIAvE8rJf2kzUu+1ygOBDRFEwZFGwMIDtZjMix8jPsooRECD5g5M6g3lPwKgG2\\/grEbgzpB5zGxsOYMaDhBNC+00DsZpaXLi5GE85p5hMHNwOn8pqU8ESwe8dypRQLs+DrkLKVah3+jIaScnwuMfG4I6h1KnvKKMV03NJPKVEVQCJ6ewhi7cTzJ5hHBnmq4ptoyd4RQ2Bmg1xUKnm1BlfzeFQTQQx8A+BDjKrsRAtczmEVz4DI68MRB1mUc0YOqxH7kgbA1U\\/wDTQYwRtRPuIUe9xULLZJB2nmZPTQNQ3dggf1DxV\\/kiPZoEVtsI\\/VKvLAQ9dhH7iY\\/\\/AFBD9uKDP1DGxSzDkrGdb7g8xKyMRquoECwmwYpoXCdRv3nMPsIB2nTY\\/Jxhe\\/Jgh+hwV3HE1jvAwPeAzzK5mpWHNTS\\/YgzEtWSRLHczFs7s53M8zGf3COWK+hhd+OY\\/aJt49\\/An6MqH7l5h+YGVeBzAZ\\/U\\/uMPaE9o0XJkXiebifbgwpW+m5e9aRcIexssCkEFm\\/oR1xk\\/\\/AAJYulAEvUKLATy0v7rmVFDfcTNLDfSQKhO8rbxDMODF6rMv7rg63+aCDN07d2WDGjGxlv4nlOsbSpGzbwf9L60\\/sH9mD\\/pHVe6RP+l1u2fGI\\/S4EQn9QHI7cRtDtpCKAIcT4bINdtomfJpI9uSYc7kECHJfTg92oRsWRCbUzeE2aE6LBZ81uBxLiH6RG9LFfBTGZDwYXdD7iL1CjvUORi5IYi55mT+ZgyP\\/ACi5Sebg1mtLg\\/BjZ8mNqIi9d73PMXLTD6Bx4GoD4DkwGZT621TUhO67QMlUCZekm4GFbCEj3jCMABtCwUcWYyk2d5j6h0+REfFk+DH1BaC3AzgVolZGHtGwnjWtw4By2QRVxDuWjZaW1SoWyvwpn6dv3ssfDpvSQLj42Xcm4OSCNwIdj4bzaWRwYufKnDGL1r9wGmkDlgJnyBMWQqpJC94ApO9\\/5gAHAibH+4+VnG\\/x\\/wAQiYOmVwGJ2MPTIFVaag1yiefxXxP04K6exMHTbLZ3HDQAKoUcAeANGK1\\/QJ1VWhgb3gYRivY1Dlo1zPuNxRAJUVYpszQrcw9N7GImhQJfeCMeZfgbnfw7+GdAwDVZE0qdzQiULszV8wkVc57zYcuJQ9xGIJh227Q8ziJ1DLsdxLx5Rs1QrpUKDSwY0FmzG0qtksRFOMjZYuSwyhao8TJky6qAP9Q4srHgzyDVPkoQjCvzU9DmhjqDFgvZDVbxkZeL+Lh2UatpcqVLhAaz8VOqDlCqnkaYBRhis3Fw5KhYmdE+sMNtSgTt4l6yqnwSZcEuBqi5Lmx8CQJ1QLaDAXEtyPtmQmyDW3tBEEAgEqAUJjMUweIPec0PoPI8RKj49BIAsQkkxUa7vaMOQDNyBXMAsUTHx2BQnlbbkR1YCgRGR7s94aHhZG4mPqWXZtxEdHGxmlUv0zzsaiwgg6iwaAjZco33EGRzZOog8RhkcbpBiavsHEGAcs0CY14WzGe+wjMje0y4wSu437CHEbpY3pUB+bhO\\/hnx61DXRQ3Mo05cg9mMYQGKRe8Iozps3k5LrnaK4I5B8XylepZvYxWDCwbEvaXDATA7TXLmUWFmmVM2HUNQO8HMSCCAQ8H8RDtEMU+B2nEH3H6CDUF+C+GVNQ\\/EsE2RctWHBEQk1YB7Xc1k0Nr4MUnSJZJM0mo4AG5iMpO8zaWOwoQqFF0Ze9Q\\/IgJU2DMfVkbNF8p9wBGpOcQj9TpJGiNnbTqFVFzE7k2KmpyxJJA9pWZlosYiZ7+wxenzHg0PmfplUE5HJijAgtFH5jZlHaalyBjXEy0fA0VI9xOoN58u1bw+FzV7QKx7TpXoaWNG+TB4dXjKZNXZpgzHE3weRNQYAg2PC4DLggjb1KqVBtOpQeS5qJAYsEb7W\\/EUxDFPgRc7xe5+huIDDASD45sdNt3mk3zRAmntp3qNjqze8UHTydhNWwFws2+4hQtuWJ\\/HEAxntxFRSTSzICe9QaQbG87kmKhfiMpBI9ojkbgxOqoANAuJ9wAb7GFEXY44cmLGACoAM89dqW79plz5PtX0mLmy2FvUajNmYKCGG8YtsCdopyO1IP6EbXvaGDB1LHjTfJi9EB973KgBPAnU9GcmZm8wCHohX\\/iNB0WIc2xg6TH\\/AAg6ZRwohwe9RenJbYi\\/kTK5xGnP9iI4aplxLlTSZkw5MR9Q294mR0PpMTqkOzioCrD0sDAPACM6oLY1MGTzcmQ9qFQiVD+ambfC6\\/EQzVFMBg3mRDjciI0QwHwOwMGw+hhYikETtLgYkQRhqBG81WTZO5hR6sDYe0U2DVEw0YBQ4hReTUVH5HECXcIB2reFAr2T\\/wAxsakE8XxK2EW7pTZ\\/\\/ke1uyNonO3EYxMrIdjMXVg7PHw48oOk8xelRSbO\\/YcRun1kaipnkKBRyf4gx4eSxP5nl9KP2QZMSn0gCN1Kg7D+4OoW61CPmJ4M\\/WY1+xCTH68n2gytmJ0qTtdQjMqlvKFAREd9BLUGF0BP0w1bs1ARMKq\\/2kgg3Z4ipjD6lWtECks+o2vYTrQSoJExZ9GoMSfaI4YD54MZAwoi5l6MjfH\\/AIhDKaYEQGLmyrw8\\/U5vcTzsp\\/eYNTHuTOmwnEm\\/J8KqMO3xMWQb487V\\/BjOGI9jBFgg5mZPNXbkcRTRivFaAxt\\/G\\/A8QGwIIRFI1VAfDqMV2y8waxv5vqhO5O0Ive6+IxIo20yZCaJER2Yn8f1LKm\\/LFVPRqBP\\/ALYyBySvPtGLV9plahW5gBBNVUJDcbxjQ5hPhZETOyTH1SuKbeFA+6NMhyYyfQCPmNqCAlNIjIVTWcnPYTJjrvbUDFBLaRzGw6+zQYc+nivzVx9KvgwDlSCxmdFHUMoba94gx4kXcBeAY4JxuF5KmdOT5CWIt1vzO8HeLzOqFrHFEzFmbEeTXtMGdco5go7xkVuRf5j9HjPAIh6I9nn6HJ\\/IROh\\/k0x4MePgeB8HOzH4iuy\\/I7qZowKoYk6G+0+0bRrOg2sWCLzOBMuDUNSn1RTEaKfrAotAfDggxarwZQZkXJjYrWpTxOPTQuKWAHEsgWTQ7VBTfuA9rgNG3N2O0d1JAs8bRTZ9b3GdddI9WN4+R7oMSD2MN7qf7qbkDTsb7xhRsn+4VDCyblMSVUSjUI8LiZ2WY+pVxTbwURtTD2j+V+7GIHQDbifqE4An6gDmHqRM\\/Tp6nF2ed4OnXNl176eHHexKBAFbV4KiqKF8mGZkyO2J1P2tBdvFmf1KZlXeGYsrYjsaB52mDOGrej3EUhhY8BKg+hzQ+Zkzk7DtzAbBMwnXrwn926\\/mDmJBMfMuzGPAEz4rGtee8RojQGH6e9+LTG1gAjwqZ1YoSORMrFRR7f8AE1fG5ilgPSLAgCNzUI0lq3+JeNhTLMeJAWbaxCeQV2va4uMtXrArtMgdGosDAzN7RlbVV38DeBSxIE0MBYAAuNvZ1jniMCRqOw7QnxsiJ1DLE6hMgpo2BXFodoQwf1egfi5Tub1+jvQlNw1D8Q+rAbvdTEC8\\/Ex6igvxux\\/c6vO2s40YihvMOQsiGqtLgO4FHeZRsRMq7xhDMWUIKrfUCT8TBnbe+S2w+IjhhfH1NkAmTPqLAXBYO87ETUVYMOQbmaiy5F4cX\\/feIYsWAQb3DyBcz4tNuv8AYiPEaAw\\/Qx0zWIDCIrBTzzBkU8GX4dUul9fIM2OxU3F9Js3CVPM+0VyPcRyo+6t+8sMDLUUD2jMN2WrnmH99HeM63eiJlIuht3iuAWAA9QHMd3NLwDGA0WoWO3upHgBCPEMRMfUspiZ0ceqiIMacgAieVgs2u8I2Ilqy4wDt3\\/qIXCLa2a7TXxseYKM1k5WTSRpAN+8z9O+V9eMDcTo0yp5vmjniCoy1YF1MwjiGCYH0sSWpRuYvU49fDD5idR7g1A6NwZrWHNXaHOt8gzLnYFRYBBsiKQr2CKmsQML0\\/wCIwmO3RsX9p+YhiRYTtBQl2Ya4mXH5Z1DiY3imAgwipvC1RkZxKK0YhJhhBg7eFR0DqVPea2WwykMNo2YhASLiMHHqGkVLfjTt+ZoXlGI9wY7rsDdR2uitgiUU3BERkckVXaEjGFUmzUYoMZJG\\/vG4D2aG4UiNlxPpoRkUVYu44QWNxDTHYTy9P74ykV7ntCK58D28Fcjg1MXUkc7RM6OPVCzPYQgD+X\\/+QEIik\\/IJ94t6RftBRMvix\\/cvaDse8PImuiRpaObFj3mYTINo0EEBI3Bi5XU3qu+bidSwuxcbqmN1feY8raH9VmxUXI6kgOd\\/8wjxKGojWIuxBHbiZhRDjht5ia4k5MJ2g2nJhomoynE3\\/pPERrEDQkspHuJgcMnHamEOBe3M0nipl77RBt4VEPK+0EuAzqEo+b\\/REGM2xD7HsJhwawdIUgHvD0\\/UKxVUsc2I4yXp3iP5Z9Qmt6J0G2viY2Tel457x0Ba1s\\/Aj4spoFaPYz1qADR27cxSxLXvD5TbESwfQFJ9jGB4oxUs0P8AM8plGqhYnF9z7yx7XAya1IWgCLEzvicJRBNQ+KOV4MUFdr2EvdlVhQeh+GnaUIVubAjGDVg7QUBp+J6q+6KGF21x+AZlGxmVwON74hUjdvAQXzB734CiB795RU8bg7yhksjZoPkbwKp5ECqOBCLhGl\\/yIO0x06tjP5Eo4zdcGYzqAiiE2ZqoGDiLyY6B1IMxkglWhFmxHykbAzETrBJNdyIHDAk8XCp4EzmjF2HjwQYPE0wIPBjIcTkadr7QF6paAivlW9D7e5mhf3Gzzue8ZDQNk\\/gwLlrYrdXud42+PUOe9TUrURq1CE1sRsYyKGXQBd73BmB4G\\/eNbj7VInlDuQo5EVgQQY2zgBbuMSSRfHvK6XSSMfq7ERsbX6ipv2iYFLlTzMqHGdl2+JR7yvHSI2EP1Iy\\/wWU38p6x8iY3yGw9WIbGRXK\\/tqxA11TAmKGBO5owNsY+XShof5j4uocnWVA9p5ARixJZpm8BN+JzxdQeo7mcnc1FPuJRG4gZWA33gN\\/kQH38GF0faLASKYciZvWnmr+HE6VrX8SwKv3mZVVxpFbRjtLpTE4gj5nDvR2uDK7HmY8TOZ5YxIzewnT5my2NIsTzQpILUfmWpABAIhTGb2o9iJ5TnuKgw+7QodwYhNUeRLvaoNptzMuNWFt2Bnm6aCqzHtMbZH4XjkDtCytRCEV83LIug6mJpZ2K9hvE+y7uN5yUxWxHykgntGBoc17ia8e3rH9jaFytsFr8b3GK3dsCe0xqWUkIaEZMgbUBXsOzRjrNMuh\\/ngwFAukCgI+PSoK5O18T\\/UB2o7RB1DesMB2EbHkFu1X8maTqOs8DtGWjV34EgcwH1nbtL35lien4hIBrtGQNyIzvjvbUo5HcRCGtgdm4mbz+oysiXoVhZlEIurmhOoyBB8mP3J8AYDAdu87SzVQj2gIY1sIGprNw70w2MDXRlWJpI4MJ088RW3A5uIayAXs2xigYcrD9rCxCWyGk7RwrVkb7aG0yZRfoAEcmt+8BjH0t+JhwsWIZYnTKJjWp1z6cap\\/IzoU04dXdjGfzuood2qAjien2EYC7EsCeYGO0v1\\/keBMs+0U2KviZ8eRX1AChxNbKul054NwKxsbD5i6xV8XzApawCBLZNiJYAu7FQm9juszKxVl2Knj3mN8ZxlHHPaBbUUbIm7oCcYruO8xdSgXRvY\\/4j51Keuye0yvktbYV3ELMdli5CNIJsx8pUgaRFJIpmuuwj72ABExlgCWo1W0CDGxs3fE1mztAQTxM+by3SmAJb\\/iNrHBEG43mQKFJqKqlRXEfIictVzzUJb4mXqqVgmNjUw9TkQZCEFubjdVnYgmEsxsmzMlgc+A5igk1ABvvVQVV3PSJ6aG+8KigdoVNe1zbYHaKw1ETUQIMpjOGFERGBWuD3PxDusZmYqWa6E6UBB7se041K24J3mXpwDqQWsNA0JcJ2iCDw6stmz6VBIXaOQmEoh300Jgw+S+stZqDMI3UKOWnnMeF\\/wAw2x9Zv47Rdo\\/FjkRa5h5jaCKIihE+xQBGHmKRHejuLN7wuhNkj43nneYNFgiIAD6WIjhtJvcAXzEv9v8Agx2yKRaGDGzDg\\/AiYcXmhror2rYzyXYH1AEm6i48wWuagZRq8wHUeRVRh+fi4cBO4a43Tkb2JSYzvye8CiuPTEK2FDwqQwNChGyemwI9sA0Wm5NTeuZ1jD9TgveuY2RRR1DmoXUDcwu5X7aPzFJKKHyiq7bTXgTdmBI\\/uHqMVllTf3qZMqsmkLV8wKKlQiZjwPARfc8d5QuzwYAO\\/wDUI9x2insQI2kcHj2mssPjgfEPcEQijAbHE0mVOnyjFl9X2nZoSpagdoO86XOppDswitWo9zAApoHYiZulVrKfdHVkNMKMZ6mPOvuJ56DuI3V4x+4RutQcBjD1jnjHD1Gc9gJeRuXMwLQJHipscTczEfSQeVNQfiFRKMFHYzOq4\\/V2Y0ZhxdOMladXwZlXCTqxpoo8xXJHIo9wYxZANO\\/5gzsQRYvsYpZmBO\\/aiYprVTCr371FcN6WH47R\\/QoZMZNc1zFz5CCFB3JjO9AtcGYkGhZl5f3KD8zXkOrj4lvTEc9xyI5ysNVbS2IDVR94BmZDqHaOMgpSBZj42xhdLWD7biEEHewYz5GB9dfgQooJY7n3MIDHayR7TU6k+uifaFnbYsxgX4lShDAfAunGoTKbfw7QbgADcxDfpY7CA9ieBtB83xtPtBscz8HmAXdA0JdqbO4htu1wMRsRLBhEYd5jOBsasdtPI7mE3uK5udDjWmfudo\\/VrjyFALA5mPJYVhxyLnm0G95QoVVnnaZ8QU3UcKeBUCAzR8SpUJEExFuO3hcUmDebI9\\/ygv3g3HPi6jIjKeDGxHGwYkXe2+8IVQSqVNFqNRjiqA3jrrQhRR7RNa0SAfi4+AEl8TG+6wkHcHva\\/E81xve\\/FgS+oYjQNI9zC+UBjkANTp01Bqeh\\/CPnQGhMCMAbFpM7UQoNhe0XINBLbpPQRs1qYcGNj6M77TQoWhuIcgQne5q3LHmaBfJhVfaaZpHtKgEMJjPW1TUxvcj+oVcg7\\/8AEGJwQTUyfd4HgQGXtA+qrPAga+SeNpfuLgJA\\/MvfYxT6oODArQLUMaKxBMDen+oM46bpcaKfW9t+AZ0XTDMdb\\/YD\\/kzaocY7QArR7Q7x+kxMb3EydM2NdQNjwyrY1D+5iaxpMdKcEDYwCYy112HgTFgMybrftvEcMoIHIgNdvAgQGdTix5CHq+zR0KqAhLS91J533lZCAzHftR5mvV6UBB9jBlXe9p5jVYcbd4rMpBDkR8lG77zzDyA5qalyV6yT3WO2JAoA0nvR5mnp3A9HbbeEviFIfT7R3OVrqYsmm1MQ40c7E79oWfzPRYEUv8Fu1TQ4Yhub3mgGhq7waiJ+TKlVCwHeE3wJpmgTQOamnwNTMvceI8LmozUfcwQS6qEre0CDkMZTjvcZoTFFxULGu0KIxthMWYIioq7ARc1\\/tMGcfxMOUEVU1TVM7gY2\\/E1TtDaPCwIgiEhh\\/wAy\\/EGaphvdf4mV8ztzNxxNTEmhCGYUYxdCVJ77GE69Q12eN+BAKFWGPxFTJqY5BUbGpyFqu+bjJ5eRi40iYnR8ep11e+1zJixuVZAFUCjAro40sKqZtQ0nhidzM6jQDsx95gyblG4PEY7ihNKvZ08zJiRgBw0DHDsN7jdSSlBdweKi9QpO9LHKtz+bhVPbwJPZZv3IhKQsO01E+8sexmo\\/xEu4alw\\/mMoMIFmjNM4BnIqcj6Ab5lQadHzcU\\/5nm+0LXCdpj5iY0fbgwYKOzmeVmXhhEz5xf+mDXzP1OX\\/yf+Z5+b\\/yv+Y\\/V9Qp\\/wDDWN1HVv8Av0\\/iKHJssT8mBjPMl6yNouOxKI2qEkG7imwDL8KgUR9SOGXuaI8B4GLdlTWxsX7TMmoA77QomXIQjcciLSZBY7Vt2gV3N6hHxtvaWgMLPjUmtani55WPQpXZqE0XuWsQh8b2lmp5iuNORNjMgDYmWIVvHrXaMKBmvIBZUEcGebjdZpxkGrNw4LopsfkxsbcbNERl5NiKwU+qBjxtcsnYsBNK+1n5h1HuBLrlpZ9pv7Q2O8JobtNa1901iawO8yZLNDiMFHBgrwAJB8Qa8QYhXV6rIMvc7zV4GYzo45g1FtIuzMWFz9zaZsBze3JiDa\\/feVKjjeVCBRlETS06fFvqPbwcQ8GYuD4gwR0DKRMThx894doDLj3yORxLJAMzIMWTj7+DC2UsRo4ivkPIK\\/NRmy+UN9QPfgzMNLUQe213Ea5yvpqjA\\/qG4BExLjQEjvzMmNWQlO+4Ex49KlitiPbcbDvcLJ5fpS27mLhTbUhE8mmOhtu1mDHkNjUu\\/eDEqfe3PeIrINtMYZMqL6LU8ET\\/AFEJ0NYgfIDuLM81\\/YzzG7L\\/AJhyPxW8pv5GEN3Yyq3smGzNE01NMIgh2mrapvXHgN\\/EeHEO5v44lEcyr5gRVFsNouZbpcUx4CWOQ1Z4HtFAHKzLQWgOYB4XH58KjqQRMKAeo+LcQzD38e8HgSUyD2b\\/AOIDtB+JUZbhNGidjDj1IRz3EbUrqSDvcBKYnf8AfUPUsyorrRAlN239zC43rmqnT49CkamszSiKSRq9zUJIOlQaMcoEUE71QEcO4CgxgxUqBcV2xLxVxuoctqBnnswo0vzMedgRekzK4ZKG5iOWDBR2nTXjTTq4E0zTNMIg2HhUImmVXeVKjDw5hgg8SPAN7wWarmbD8wLkb9pmPBW7RMe98zQpNkC5XABlsBxGFunxvB4OxA8RACz\\/AEGEcxGKtXv4jmDwyj02OV3iZL3qA2Jt4EX2gsczqUa1PYnf4+YHDvTKOY+O21Heu0Xpn8vXjs9inEVQjFGx\\/O8OFw+zbcj5E1rXG0IAQkdt6gyaiLBMRkJtauNqUWo2viFw5A0C5+lss3Yb0IuJSve7gRsPsL31AQZXJAUUDyQN5qIIuwe4AiZQjPer+zCBDKlSpU0wrNiKreaSZohSFTCCJe\\/gBZ+tbJ25mLDZvvKYCiKmkcRQwG3gACbE37mC9bn4A8OBHazUHgTQ3Mxj037+Ny40bsZyLrwrw1fMZrmMcqex2g2HMquPAw3W0oMhBHMOIplZaI9jActHdT7Cqhy5BjIAK7i5kxnLgF2G5B+I\\/T5NtGT8AxWxhdOTKxPsu4mQ4Appz6vcRXxcXNAVi62TMLKwpjUbpO6PzE2tW0zy0Y1q4Fcx1bi7EoDjYwszDYbxlynt\\/UrwqESptKlTTNM0TTCsYRjqalE8k3R5i4Qo2Fx+n1HYAQ9Nkn6bMN9E8jL\\/ABi9NnbhIOkyg+uJ06oKiYmUekTc8mBbMOpauXAtx2CDeYW1ID7knwd+wg8LhJYzgAS\\/oPEYjeY3J2JmoTfwCwKBHOl1b+jBvARxNPzKlH+U013nVYy6Wn3rMJIFE3vMiM6ijuOB7xc9GnckfPaeYWVlBGk\\/5g6cAn1mByTTDiGm2KbGalQgF7NbwEDhh\\/cx9Q2JgrEaTMrY8mYnHx3moj2hDIQ43B5nmXlfUNuIh0nc3GzhSPTKlXKlSpUqAQCaZU0zJ1ChiFGowJly7uaHsJoGMKFFGJj5PeW6jiEEmzFU3YEOrg7TSOIquo2nMAs2IdQG5lxUMIINGEjiVQs7TO3ov4MRilAewhyEw0BZMBnJhMxi2+s\\/MBF3AbHEuXF3naMARvMJ2I+eJxL95c1QG4TMmAAs6XZ7RCXv2mbpzbuNxE1hQSlgiB8w2oc9+0VMbISRbEcx6RCoO\\/adOuEqxPPcmPjwFqGwqFMFaVUTJgCZG8txXtNWk02xiZFDkE7ERsTPbIw3ml1IDKYXBG89JlCAShK+JUqVKlSo+MupF1E6REjUguoBZ3FnkxGK8LDkLcqYTe2kzzHA+wwuTvpMDNdhDcL5a3Qianr7IBkH2iE5L3EJfihAMvxLf4ls17iOj1esTPdBSbJIEr5MQUKvwJ71C0ExDYmV9IjbXCYjg0O\\/hcX3gO85ijRkYnfVKuVKuDHPwJQmQN5Z0fcNxD1OQ5CSKvkRMt\\/PaoAmkaW47Qql3UQEG7r4jBSd\\/wDEdF7Corc3xAMgX0VKGg+nfVyN5jx+YpXJjO\\/ciOi6dhVRMpxjSRFfzLFxcVsQW2E\\/\\/8QAJxEAAgEEAgICAgIDAAAAAAAAAAERAhAgIRIxMFEDQUBhIjJicYH\\/2gAIAQIBAT8AsqdzdqRqB0faNoonj+FU2hVCrpfTG4OXli1WqmUOaVaZ1Hn+X5I0hV1ez+VRTQl+DX\\/ZlLjoVbkpqlyxPb8b+bbRTXoq+WU4OLYqUs5JNkZO9f8AdkoSlwh9x6JaFVV7KXKzqrg5qpFUiE0clhKJJZ3GMq7qRyRN3tsSR0OybiCh6z+QYxEmrSxy0Q7IhPohH2jVm5TaFyTQx92VqphjTEohjpOKFQmL46V2JJdLGRsYx2VNXo4v0TSoFVSOGmLpIg4qGfdnGiFNq6eoFU21S7V2p7s9p4Kn7ZqbyMVnb6GipOSnjO3AqqEtNshNzJxOJFoIIw2NxplFM1p\\/u1S1ZO\\/Cn0cKfQoGQu4s1o+7Kzdos19tIUeqTk\\/Ryfo5MljqZLJZOT+pPjUVJzZjJEylonwvu7JOx0jRH6FSKhs4M4\\/sj\\/I17JRKJJJJOFTPiUdq2ipKBpokTJE17tLTu1N33gxNI5igbj6OTtL9k\\/oTRCIIIIeM2YxrBVP2cjmxS1d41qcOTFDtBBBFpJRrJuB1jqHjJLJfsVVS+xVtnKqN5VTOECbO+mQRZWgi0vCpSrK8kjEMi1N1g1oSvBGrJ+zvrwQSjkjkNCY1I08XdaEPJpEK8EEWT9kesFaRv9Wlj2NWk1hwkizQnkhqR237JymeyPE1OKRMDUO7QngnepZQK6NDXhdKZDRDFSiTsalEXagTEpZx9kQ8IIecYSvDBFovUiNXSEiRrBqT\\/uaXjV4t9jvEoczZK8krFEYSycZyXWLREkRsYjTKqYOTOTJfvw7yh+CRdXnB2TNEDSvH4E5rXgjR\\/pkslm7U0ztjXg3eMYtCx7WTGyRXgpp3Nn4pxRrGbJknNHJEodSO8UiYEou84tFkaJ8Mx0N3i0ZU7awYsleI93i0H\\/\\/EACkRAAICAQQDAAEEAgMAAAAAAAABAhEQEiAhMTBBUWETMkBxAyJScoH\\/2gAIAQMBAT8AxeYuhStGrnkqyf7v4SSY0U16FFvpC\\/xV2ykh4rNbk2sLpcE1Uniq588Ip8s0oUDQikhjHh+BZj+xElqHBUiS4oa4Xj0lEYfRRElljGMplIbXpGp7o9jxH9qKobpYdDS8CRQhCaE0LLwxlnplHGxQZoYo8jX5wlQ2PDw+96FlbO0NYk6ToTk0rRpPTKdYS5KER6y0iNWuCx8l8YfCHJvfWVhNFotisXKofBxVnfrDrF4TOhEMPrC7Wxu+Ec1mtiwxMsbKbOeqFhD59jr6htfUWvo2vrLj+S4fkuPwfY+hEHzhp4grb\\/CbNc\\/prl9LYmXi9qRQ8JFCiaV9FFfRQiaImhDghxQ0hpbfWEIoaFwp\\/wDV+JFbUxC\\/s1Guj9RGtfDU\\/wDiPV8Q1MakaSkUVlCbIN2JlDQ4Di16wouW5bOymaR2hKxRQlRpi\\/Rp+M\\/3G2ORqRaLQ6OM1iIhukJsvDgvgo10fpr6NUzTL48R7W1PNWzSimhclikxzG7GkOKHFnJe1JCQjsayuUmUNYYnT56JqHcdy6wlnQmNOPaLGxf0N\\/ksvD2rbpKE6ReHh713hFiYpfUdjgvQ7XZ\\/5h3uSYkyhPKz1iPTGstb4t4oRYmiyxx44P7OB4eK2LsTwmWjUkN2xF1eGRY0VtYnTEdHFdFCsbw2Ma+F+FCZWxIqztEsRfpkllDRWIPms8lvDY8vFl7lhMpMSQs3z\\/ZLKd8McR8I1L0drDwmmrHJdXi9lljZeK8NllliYxO0XzWXZKuhxaYpcVRazF0x9dHO5vF+BYWLE8K8t8kaa4xKbbIcyF3Jmlml+9idjG+dlLyrYmWXaoTJK26OU+CM77HBM0xKj8G9qY\\/t44HtteexFj6dHOFKRdFl7kxll7aX8GyzgpfC18xKQmPd2dZvbflW6yUuEsJ+P3m8c7qKxpZTORLwN+Ky8UNHJWL30Lxt0nsXhsWbz\\/\\/Z\\\"><\\/p>\",\"categories\":[\"2\",\"5\",\"9\",null],\"occasions\":[\"7\",\"10\",\"16\",null],\"amenities\":[\"6\",\"7\",\"29\",null],\"price_type\":\"per-day\",\"price\":\"500.00\",\"capacity\":\"554\",\"division_id\":\"6\",\"district_id\":\"41\",\"city_id\":\"317\",\"address\":\"reerer\",\"is_enabled\":\"off\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"LGfR6l08ALWOY1g1eWfqqDqmLPTPoJs3s60xM6Pg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-23 22:32:51', '2022-08-23 22:32:51'),
(1904, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-23 22:32:51', '2022-08-23 22:32:51'),
(1905, 1, 'admin/venues/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:32:55', '2022-08-23 22:32:55'),
(1906, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:33:13', '2022-08-23 22:33:13'),
(1907, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:33:16', '2022-08-23 22:33:16'),
(1908, 1, 'admin/users/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-23 22:34:38', '2022-08-23 22:34:38'),
(1909, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:34:50', '2022-08-23 22:34:50'),
(1910, 1, 'admin/venues/10/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:35:07', '2022-08-23 22:35:07'),
(1911, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:40:50', '2022-08-23 22:40:50'),
(1912, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-23 22:52:49', '2022-08-23 22:52:49'),
(1913, 1, 'admin/venues/11/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:52:58', '2022-08-23 22:52:58'),
(1914, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:53:21', '2022-08-23 22:53:21'),
(1915, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"11\",\"_model\":\"App_Models_Venue\",\"_token\":\"LGfR6l08ALWOY1g1eWfqqDqmLPTPoJs3s60xM6Pg\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-08-23 22:53:33', '2022-08-23 22:53:33'),
(1916, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:53:34', '2022-08-23 22:53:34'),
(1917, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"10\",\"_model\":\"App_Models_Venue\",\"_token\":\"LGfR6l08ALWOY1g1eWfqqDqmLPTPoJs3s60xM6Pg\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-08-23 22:53:49', '2022-08-23 22:53:49'),
(1918, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-23 22:53:50', '2022-08-23 22:53:50'),
(1919, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-24 00:56:40', '2022-08-24 00:56:40'),
(1920, 1, 'admin/venues/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-24 00:56:46', '2022-08-24 00:56:46'),
(1921, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-24 00:59:55', '2022-08-24 00:59:55'),
(1922, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-24 01:01:49', '2022-08-24 01:01:49'),
(1923, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-24 01:01:51', '2022-08-24 01:01:51'),
(1924, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-24 21:54:02', '2022-08-24 21:54:02'),
(1925, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-24 21:54:04', '2022-08-24 21:54:04'),
(1926, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-24 23:31:28', '2022-08-24 23:31:28'),
(1927, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-24 23:31:28', '2022-08-24 23:31:28'),
(1928, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:02', '2022-08-27 00:18:02'),
(1929, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:02', '2022-08-27 00:18:02'),
(1930, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 00:18:10', '2022-08-27 00:18:10'),
(1931, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:14', '2022-08-27 00:18:14'),
(1932, 1, 'admin/venues/2/edit', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:15', '2022-08-27 00:18:15'),
(1933, 1, 'admin/venues/3/edit', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:16', '2022-08-27 00:18:16'),
(1934, 1, 'admin/venues/4/edit', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:18', '2022-08-27 00:18:18'),
(1935, 1, 'admin/venues/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 00:18:23', '2022-08-27 00:18:23'),
(1936, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 00:18:51', '2022-08-27 00:18:51'),
(1937, 1, 'admin/venues/5/edit', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:56', '2022-08-27 00:18:56'),
(1938, 1, 'admin/venues/6/edit', 'GET', '127.0.0.1', '[]', '2022-08-27 00:18:58', '2022-08-27 00:18:58'),
(1939, 1, 'admin/venues/8/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 00:19:00', '2022-08-27 00:19:00'),
(1940, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-27 06:14:26', '2022-08-27 06:14:26'),
(1941, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-27 06:14:27', '2022-08-27 06:14:27'),
(1942, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 06:14:35', '2022-08-27 06:14:35'),
(1943, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-27 07:30:18', '2022-08-27 07:30:18'),
(1944, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-27 07:30:18', '2022-08-27 07:30:18'),
(1945, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 07:30:24', '2022-08-27 07:30:24'),
(1946, 1, 'admin/venues/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 07:30:35', '2022-08-27 07:30:35');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1947, 1, 'admin/venues/2', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Essel Tower Club\",\"star_rating\":\"5\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul><p class=\\\"ql-align-justify\\\"><br><\\/p><p><br><\\/p>\",\"categories\":[\"8\",null],\"occasions\":[\"3\",\"6\",\"9\",\"10\",\"14\",\"15\",\"16\",null],\"amenities\":[\"1\",\"6\",\"8\",\"10\",\"18\",\"29\",\"30\",\"31\",null],\"price_type\":\"per-night\",\"price\":\"30000.00\",\"capacity\":\"2000\",\"division_id\":\"6\",\"district_id\":\"41\",\"city_id\":\"318\",\"address\":null,\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"6gzN4JcmJ0IA1I70fQe8EriGM4DO6vSidpUJIZ6t\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-27 07:30:41', '2022-08-27 07:30:41'),
(1948, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-27 07:30:42', '2022-08-27 07:30:42'),
(1949, 1, 'admin/venues/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 07:30:50', '2022-08-27 07:30:50'),
(1950, 1, 'admin/venues/3', 'PUT', '127.0.0.1', '{\"organization_id\":\"1\",\"name\":\"Farm Aravalia Mangar\",\"star_rating\":\"3\",\"description\":\"<h4><strong>Approach<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Ambience<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Food and Service<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Known For<\\/strong><\\/h4><p><br><\\/p><p class=\\\"ql-align-justify\\\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.<\\/p><p class=\\\"ql-align-justify\\\"><br><\\/p><h4><strong>Best suited for<\\/strong><\\/h4><p><br><\\/p><ul><li>Anniversary<\\/li><li>Birthday Party<\\/li><li>Cocktail Party<\\/li><li>Conference<\\/li><li>Corporate Party<\\/li><li>Engagement<\\/li><li>First Birthday Party<\\/li><li>Meeting<\\/li><li>Party<\\/li><li>Pool Party<\\/li><li>Reception<\\/li><li>Social Gathering<\\/li><li>Team Building<\\/li><li>Wedding<\\/li><\\/ul><p><br><\\/p><h4><strong>Cuisines<\\/strong><\\/h4><p><br><\\/p><ul><li>Multi Cuisine<\\/li><li>Social Function Menu<\\/li><li>High Tea Menu<\\/li><\\/ul><p><br><\\/p><h4><strong>Terms and Conditions<\\/strong><\\/h4><p><br><\\/p><ul><li>All Government applicable taxes will be applied.<\\/li><li>All Venue Rules Apply.<\\/li><\\/ul>\",\"categories\":[\"6\",null],\"occasions\":[\"6\",\"7\",\"12\",\"15\",\"16\",null],\"amenities\":[\"1\",\"3\",\"4\",\"21\",\"30\",\"36\",null],\"price_type\":\"per-day\",\"price\":\"70000.00\",\"capacity\":\"10000\",\"division_id\":\"5\",\"district_id\":\"38\",\"city_id\":\"299\",\"address\":null,\"is_enabled\":\"on\",\"updater_type\":\"AdminUser\",\"updated_by\":\"1\",\"_token\":\"6gzN4JcmJ0IA1I70fQe8EriGM4DO6vSidpUJIZ6t\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/venues\"}', '2022-08-27 07:30:56', '2022-08-27 07:30:56'),
(1951, 1, 'admin/venues', 'GET', '127.0.0.1', '[]', '2022-08-27 07:30:56', '2022-08-27 07:30:56'),
(1952, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-27 07:51:00', '2022-08-27 07:51:00'),
(1953, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-27 07:51:00', '2022-08-27 07:51:00'),
(1954, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 07:51:09', '2022-08-27 07:51:09'),
(1955, 1, 'admin/venues/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-27 07:51:12', '2022-08-27 07:51:12'),
(1956, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-28 03:41:36', '2022-08-28 03:41:36'),
(1957, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-28 03:41:37', '2022-08-28 03:41:37'),
(1958, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:41:50', '2022-08-28 03:41:50'),
(1959, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:41:52', '2022-08-28 03:41:52'),
(1960, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:41:54', '2022-08-28 03:41:54'),
(1961, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:41:56', '2022-08-28 03:41:56'),
(1962, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:41:57', '2022-08-28 03:41:57'),
(1963, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:41:58', '2022-08-28 03:41:58'),
(1964, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:41:59', '2022-08-28 03:41:59'),
(1965, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:02', '2022-08-28 03:42:02'),
(1966, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:03', '2022-08-28 03:42:03'),
(1967, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:05', '2022-08-28 03:42:05'),
(1968, 1, 'admin/organizations', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:31', '2022-08-28 03:42:31'),
(1969, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:33', '2022-08-28 03:42:33'),
(1970, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:48', '2022-08-28 03:42:48'),
(1971, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:49', '2022-08-28 03:42:49'),
(1972, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:50', '2022-08-28 03:42:50'),
(1973, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:53', '2022-08-28 03:42:53'),
(1974, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:54', '2022-08-28 03:42:54'),
(1975, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:55', '2022-08-28 03:42:55'),
(1976, 1, 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:57', '2022-08-28 03:42:57'),
(1977, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:58', '2022-08-28 03:42:58'),
(1978, 1, 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:42:59', '2022-08-28 03:42:59'),
(1979, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-28 03:43:03', '2022-08-28 03:43:03'),
(1980, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-29 22:00:54', '2022-08-29 22:00:54'),
(1981, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-29 22:00:56', '2022-08-29 22:00:56'),
(1982, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 22:07:01', '2022-08-29 22:07:01'),
(1983, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Inbox\",\"icon\":\"fa-bell-o\",\"uri\":\"\\/inboxes\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\"}', '2022-08-29 22:07:25', '2022-08-29 22:07:25'),
(1984, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-29 22:07:26', '2022-08-29 22:07:26'),
(1985, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":16}]},{\\\"id\\\":18},{\\\"id\\\":8},{\\\"id\\\":17},{\\\"id\\\":21}]\"}', '2022-08-29 22:07:44', '2022-08-29 22:07:44'),
(1986, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 22:07:45', '2022-08-29 22:07:45'),
(1987, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-29 22:07:46', '2022-08-29 22:07:46'),
(1988, 1, 'admin/inboxes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 22:07:52', '2022-08-29 22:07:52'),
(1989, 1, 'admin/inboxes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 22:07:55', '2022-08-29 22:07:55'),
(1990, 1, 'admin/inboxes', 'GET', '127.0.0.1', '[]', '2022-08-29 22:09:55', '2022-08-29 22:09:55'),
(1991, 1, 'admin/inboxes', 'GET', '127.0.0.1', '[]', '2022-08-29 22:45:01', '2022-08-29 22:45:01'),
(1992, 1, 'admin/inboxes/1,2,3,4,5', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\"}', '2022-08-29 22:45:22', '2022-08-29 22:45:22'),
(1993, 1, 'admin/inboxes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 22:45:23', '2022-08-29 22:45:23'),
(1994, 1, 'admin/inboxes', 'GET', '127.0.0.1', '[]', '2022-08-29 22:45:31', '2022-08-29 22:45:31'),
(1995, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"6\",\"_model\":\"App_Models_Inbox\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2022-08-29 22:45:40', '2022-08-29 22:45:40'),
(1996, 1, 'admin/inboxes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 22:45:41', '2022-08-29 22:45:41'),
(1997, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-29 23:05:21', '2022-08-29 23:05:21'),
(1998, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-29 23:05:22', '2022-08-29 23:05:22'),
(1999, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:05:28', '2022-08-29 23:05:28'),
(2000, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Testmonials\",\"icon\":\"fa-paper-plane-o\",\"uri\":\"\\/testmonials\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\"}', '2022-08-29 23:07:35', '2022-08-29 23:07:35'),
(2001, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-29 23:07:35', '2022-08-29 23:07:35'),
(2002, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":16}]},{\\\"id\\\":18},{\\\"id\\\":8},{\\\"id\\\":17},{\\\"id\\\":21},{\\\"id\\\":22}]\"}', '2022-08-29 23:07:42', '2022-08-29 23:07:42'),
(2003, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:07:42', '2022-08-29 23:07:42'),
(2004, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-08-29 23:07:44', '2022-08-29 23:07:44'),
(2005, 1, 'admin/testmonials', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:07:50', '2022-08-29 23:07:50'),
(2006, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:07:52', '2022-08-29 23:07:52'),
(2007, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '[]', '2022-08-29 23:09:42', '2022-08-29 23:09:42'),
(2008, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '[]', '2022-08-29 23:10:07', '2022-08-29 23:10:07'),
(2009, 1, 'admin/testmonials', 'POST', '127.0.0.1', '{\"name\":\"ewew\",\"country_name\":\"ewew\",\"body\":\"ewewew\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\"}', '2022-08-29 23:10:25', '2022-08-29 23:10:25'),
(2010, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:10:25', '2022-08-29 23:10:25'),
(2011, 1, 'admin/testmonials/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:10:54', '2022-08-29 23:10:54'),
(2012, 1, 'admin/testmonials/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"thumbnail\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\"}', '2022-08-29 23:11:05', '2022-08-29 23:11:05'),
(2013, 1, 'admin/testmonials/1', 'PUT', '127.0.0.1', '{\"name\":\"q\",\"country_name\":\"q\",\"body\":\"q\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/testmonials\"}', '2022-08-29 23:11:14', '2022-08-29 23:11:14'),
(2014, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:11:14', '2022-08-29 23:11:14'),
(2015, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:12:08', '2022-08-29 23:12:08'),
(2016, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:12:30', '2022-08-29 23:12:30'),
(2017, 1, 'admin/testmonials/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:12:37', '2022-08-29 23:12:37'),
(2018, 1, 'admin/testmonials/1', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"thumbnail\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\"}', '2022-08-29 23:12:39', '2022-08-29 23:12:39'),
(2019, 1, 'admin/testmonials/1', 'PUT', '127.0.0.1', '{\"name\":\"q\",\"country_name\":\"q\",\"body\":\"q\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/testmonials\"}', '2022-08-29 23:12:41', '2022-08-29 23:12:41'),
(2020, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:12:42', '2022-08-29 23:12:42'),
(2021, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:12:54', '2022-08-29 23:12:54'),
(2022, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:13:00', '2022-08-29 23:13:00'),
(2023, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-29 23:13:08', '2022-08-29 23:13:08'),
(2024, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-29 23:13:09', '2022-08-29 23:13:09'),
(2025, 1, 'admin/testmonials', 'POST', '127.0.0.1', '{\"name\":\"Chulbul Panday\",\"country_name\":\"Italy\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/testmonials\"}', '2022-08-29 23:15:41', '2022-08-29 23:15:41'),
(2026, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '[]', '2022-08-29 23:15:41', '2022-08-29 23:15:41'),
(2027, 1, 'admin/testmonials', 'POST', '127.0.0.1', '{\"name\":\"Leroy Bell\",\"country_name\":\"United States\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"after-save\":\"2\"}', '2022-08-29 23:16:05', '2022-08-29 23:16:05'),
(2028, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '[]', '2022-08-29 23:16:06', '2022-08-29 23:16:06'),
(2029, 1, 'admin/testmonials', 'POST', '127.0.0.1', '{\"name\":\"Leroy Bell\",\"country_name\":\"United States\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"after-save\":\"2\"}', '2022-08-29 23:16:34', '2022-08-29 23:16:34'),
(2030, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '[]', '2022-08-29 23:16:34', '2022-08-29 23:16:34'),
(2031, 1, 'admin/testmonials', 'POST', '127.0.0.1', '{\"name\":\"Richard Pam\",\"country_name\":\"Canada\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"after-save\":\"2\"}', '2022-08-29 23:17:30', '2022-08-29 23:17:30'),
(2032, 1, 'admin/testmonials/create', 'GET', '127.0.0.1', '[]', '2022-08-29 23:17:31', '2022-08-29 23:17:31'),
(2033, 1, 'admin/testmonials', 'POST', '127.0.0.1', '{\"name\":\"Luke Jacobs\",\"country_name\":\"Australia\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\"}', '2022-08-29 23:18:07', '2022-08-29 23:18:07'),
(2034, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:18:07', '2022-08-29 23:18:07'),
(2035, 1, 'admin/testmonials/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:18:12', '2022-08-29 23:18:12'),
(2036, 1, 'admin/testmonials/2', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"thumbnail\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\"}', '2022-08-29 23:18:26', '2022-08-29 23:18:26'),
(2037, 1, 'admin/testmonials/2', 'PUT', '127.0.0.1', '{\"name\":\"Leroy Bell\",\"country_name\":\"United States\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/testmonials\"}', '2022-08-29 23:18:33', '2022-08-29 23:18:33'),
(2038, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:18:34', '2022-08-29 23:18:34'),
(2039, 1, 'admin/testmonials/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:18:57', '2022-08-29 23:18:57'),
(2040, 1, 'admin/testmonials/3', 'PUT', '127.0.0.1', '{\"key\":\"0\",\"thumbnail\":\"_file_del_\",\"_file_del_\":null,\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\"}', '2022-08-29 23:18:59', '2022-08-29 23:18:59'),
(2041, 1, 'admin/testmonials/3', 'PUT', '127.0.0.1', '{\"name\":\"Leroy Bell\",\"country_name\":\"United States\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/testmonials\"}', '2022-08-29 23:19:06', '2022-08-29 23:19:06'),
(2042, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:19:07', '2022-08-29 23:19:07'),
(2043, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:20:10', '2022-08-29 23:20:10'),
(2044, 1, 'admin/testmonials/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:30:55', '2022-08-29 23:30:55'),
(2045, 1, 'admin/testmonials/1', 'PUT', '127.0.0.1', '{\"name\":\"Chulbul Panday\",\"country_name\":\"Italy\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"is_enabled\":\"off\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/testmonials\"}', '2022-08-29 23:30:58', '2022-08-29 23:30:58'),
(2046, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:30:58', '2022-08-29 23:30:58'),
(2047, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-08-29 23:45:17', '2022-08-29 23:45:17'),
(2048, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-08-29 23:45:17', '2022-08-29 23:45:17'),
(2049, 1, 'admin/testmonials', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:45:30', '2022-08-29 23:45:30'),
(2050, 1, 'admin/testmonials/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-08-29 23:45:32', '2022-08-29 23:45:32'),
(2051, 1, 'admin/testmonials/1', 'PUT', '127.0.0.1', '{\"name\":\"Chulbul Panday\",\"country_name\":\"Italy\",\"body\":\"Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.\",\"is_enabled\":\"on\",\"_token\":\"raEJh0L9iT1BuViQ4oBhQyrgQeiG1tY4QqReohgY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/testmonials\"}', '2022-08-29 23:45:35', '2022-08-29 23:45:35'),
(2052, 1, 'admin/testmonials', 'GET', '127.0.0.1', '[]', '2022-08-29 23:45:36', '2022-08-29 23:45:36');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2022-06-24 23:30:05', '2022-06-24 23:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL),
(1, 14, NULL, NULL),
(1, 15, NULL, NULL),
(1, 16, NULL, NULL),
(1, 17, NULL, NULL),
(1, 18, NULL, NULL),
(1, 19, NULL, NULL),
(1, 20, NULL, NULL),
(1, 21, NULL, NULL),
(1, 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$q4kYyUrvB2vtgeqdNbVHyuOabPfe47uad1yBauFQ7JKtItVjzuS1m', 'Administrator', NULL, 'mDOUIXwLpg2QSVGEvQWKEVi4OKmOafk4sv3TRCtN35IMGW53BiTEIVZ5D6I9', '2022-06-24 23:30:05', '2022-06-24 23:30:05');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `slug`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Outside Decorator Allowed', 'outside-decorator-allowed', NULL, 1, 1, '2022-07-01 08:01:15', '2022-07-03 23:05:14'),
(2, 'Inhouse Decorator Available', 'inhouse-decorator-available', NULL, 1, NULL, '2022-07-01 11:10:50', '2022-07-03 23:05:14'),
(3, 'Swimming Pool', 'swimming-pool', NULL, 1, NULL, '2022-07-01 11:10:59', '2022-07-03 23:05:14'),
(4, 'Wheelchair Accessibility', 'wheelchair-accessibility', NULL, 1, NULL, '2022-07-01 11:11:09', '2022-07-03 23:05:14'),
(5, 'Inhouse Catering Available', 'inhouse-catering-available', NULL, 1, NULL, '2022-07-01 11:11:18', '2022-07-03 23:05:14'),
(6, 'Full Bar Available', 'full-bar-available', NULL, 1, NULL, '2022-07-01 11:11:31', '2022-07-03 23:05:14'),
(7, 'Dedicated Dance Floor', 'dedicated-dance-floor', NULL, 1, NULL, '2022-07-01 11:11:40', '2022-07-03 23:05:14'),
(8, 'A/V Equipment', 'av-equipment', NULL, 1, NULL, '2022-07-01 11:11:51', '2022-07-03 23:05:14'),
(9, 'Play Area', 'play-area', NULL, 1, NULL, '2022-07-01 11:12:04', '2022-07-03 23:05:14'),
(10, 'Rooms Available', 'rooms-available', NULL, 1, NULL, '2022-07-01 11:12:14', '2022-07-03 23:05:14'),
(11, 'Hawan', 'hawan', NULL, 1, NULL, '2022-07-01 11:12:28', '2022-07-03 23:05:14'),
(12, 'Mandap', 'mandap', NULL, 1, NULL, '2022-07-01 11:12:36', '2022-07-03 23:05:14'),
(13, 'Baraat Allowed', 'baraat-allowed', NULL, 1, NULL, '2022-07-01 11:12:47', '2022-07-03 23:05:14'),
(14, 'Outside Drinks Allowed', 'outside-drinks-allowed', NULL, 1, NULL, '2022-07-01 11:12:56', '2022-07-03 23:05:14'),
(15, 'Outside Catering Allowed', 'outside-catering-allowed', NULL, 1, NULL, '2022-07-01 11:13:06', '2022-07-03 23:05:14'),
(16, 'Games', 'games', NULL, 1, NULL, '2022-07-01 11:13:19', '2022-07-03 23:05:14'),
(17, 'Smoking Area', 'smoking-area', NULL, 1, NULL, '2022-07-01 11:13:27', '2022-07-03 23:05:14'),
(18, 'Live Music', 'live-music', NULL, 1, NULL, '2022-07-01 11:13:38', '2022-07-03 23:05:14'),
(19, 'Outdoor Space', 'outdoor-space', NULL, 1, NULL, '2022-07-01 11:13:46', '2022-07-03 23:05:14'),
(20, 'Roof Top', 'roof-top', NULL, 1, NULL, '2022-07-01 11:13:56', '2022-07-03 23:05:14'),
(21, 'Parking', 'parking', NULL, 1, NULL, '2022-07-01 11:14:08', '2022-07-03 23:05:14'),
(22, 'Lift', 'lift', NULL, 1, NULL, '2022-07-01 11:14:20', '2022-07-03 23:05:14'),
(23, 'DJ Available', 'dj-available', NULL, 1, NULL, '2022-07-01 11:14:31', '2022-07-03 23:05:14'),
(24, 'Outdoor Games', 'outdoor-games', NULL, 1, NULL, '2022-07-01 11:14:41', '2022-07-03 23:05:14'),
(25, 'Catering', 'catering', NULL, 1, NULL, '2022-07-01 11:14:51', '2022-07-03 23:05:14'),
(26, 'Power Backup', 'power-backup', NULL, 1, NULL, '2022-07-01 11:15:00', '2022-07-03 23:05:14'),
(27, 'Indoor Only', 'indoor-only', NULL, 1, NULL, '2022-07-01 11:15:09', '2022-07-03 23:05:14'),
(28, 'Kids Allowed', 'kids-allowed', NULL, 1, NULL, '2022-07-01 11:15:19', '2022-07-03 23:05:14'),
(29, 'Air Condition', 'air-condition', NULL, 1, NULL, '2022-07-01 11:15:32', '2022-07-03 23:05:14'),
(30, 'Wifi/Internet', 'wifiinternet', NULL, 1, NULL, '2022-07-01 11:15:44', '2022-07-03 23:05:14'),
(31, 'Indoor & Outdoor', 'indoor-outdoor', NULL, 1, NULL, '2022-07-01 11:15:52', '2022-07-03 23:05:14'),
(32, 'Live Sports Screening', 'live-sports-screening', NULL, 1, NULL, '2022-07-01 11:16:01', '2022-07-03 23:05:14'),
(33, 'Pool Table', 'pool-table', NULL, 1, NULL, '2022-07-01 11:16:10', '2022-07-03 23:05:14'),
(34, 'Live Screening', 'live-screening', NULL, 1, NULL, '2022-07-01 11:16:22', '2022-07-03 23:05:14'),
(35, 'Private Dining Room(s)', 'private-dining-rooms', NULL, 1, NULL, '2022-07-01 11:16:30', '2022-07-03 23:05:14'),
(36, 'Presentation Area/Stage', 'presentation-areastage', NULL, 1, NULL, '2022-07-01 11:16:39', '2022-07-03 23:05:14');

-- --------------------------------------------------------

--
-- Table structure for table `amenity_venue`
--

CREATE TABLE `amenity_venue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amenity_id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenity_venue`
--

INSERT INTO `amenity_venue` (`id`, `amenity_id`, `venue_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 4, 1, NULL, NULL),
(4, 7, 1, NULL, NULL),
(9, 1, 2, NULL, NULL),
(10, 6, 2, NULL, NULL),
(11, 8, 2, NULL, NULL),
(12, 10, 2, NULL, NULL),
(13, 18, 2, NULL, NULL),
(14, 29, 2, NULL, NULL),
(15, 30, 2, NULL, NULL),
(16, 31, 2, NULL, NULL),
(17, 1, 3, NULL, NULL),
(18, 3, 3, NULL, NULL),
(19, 4, 3, NULL, NULL),
(20, 21, 3, NULL, NULL),
(21, 30, 3, NULL, NULL),
(22, 36, 3, NULL, NULL),
(23, 1, 4, NULL, NULL),
(24, 2, 4, NULL, NULL),
(25, 3, 4, NULL, NULL),
(26, 4, 4, NULL, NULL),
(27, 5, 4, NULL, NULL),
(28, 6, 4, NULL, NULL),
(29, 7, 4, NULL, NULL),
(30, 12, 4, NULL, NULL),
(31, 17, 4, NULL, NULL),
(32, 19, 4, NULL, NULL),
(33, 20, 4, NULL, NULL),
(34, 21, 4, NULL, NULL),
(35, 22, 4, NULL, NULL),
(36, 23, 4, NULL, NULL),
(37, 24, 4, NULL, NULL),
(38, 25, 4, NULL, NULL),
(39, 26, 4, NULL, NULL),
(40, 27, 4, NULL, NULL),
(41, 28, 4, NULL, NULL),
(42, 32, 4, NULL, NULL),
(43, 35, 4, NULL, NULL),
(44, 36, 4, NULL, NULL),
(45, 1, 5, NULL, NULL),
(46, 3, 5, NULL, NULL),
(47, 5, 5, NULL, NULL),
(48, 12, 5, NULL, NULL),
(49, 13, 5, NULL, NULL),
(50, 15, 5, NULL, NULL),
(51, 16, 5, NULL, NULL),
(52, 17, 5, NULL, NULL),
(53, 18, 5, NULL, NULL),
(54, 19, 5, NULL, NULL),
(55, 21, 5, NULL, NULL),
(56, 22, 5, NULL, NULL),
(57, 2, 6, NULL, NULL),
(58, 3, 6, NULL, NULL),
(59, 4, 6, NULL, NULL),
(60, 5, 6, NULL, NULL),
(61, 6, 6, NULL, NULL),
(62, 13, 6, NULL, NULL),
(63, 20, 6, NULL, NULL),
(64, 2, 7, NULL, NULL),
(65, 3, 7, NULL, NULL),
(66, 4, 7, NULL, NULL),
(67, 5, 7, NULL, NULL),
(68, 6, 7, NULL, NULL),
(69, 9, 7, NULL, NULL),
(70, 11, 7, NULL, NULL),
(71, 2, 8, NULL, NULL),
(72, 3, 8, NULL, NULL),
(73, 7, 8, NULL, NULL),
(74, 17, 8, NULL, NULL),
(75, 20, 8, NULL, NULL),
(76, 21, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Restaurant', 'restaurant', NULL, 1, NULL, '2022-07-01 07:55:12', '2022-07-03 22:59:47'),
(2, 'Banquet Hall', 'banquet-hall', NULL, 1, NULL, '2022-07-01 11:00:10', '2022-07-03 23:03:56'),
(3, 'Banquet With Lawn', 'banquet-with-lawn', NULL, 1, NULL, '2022-07-01 11:00:24', '2022-07-03 23:03:56'),
(4, 'Farmhouse', 'farmhouse', NULL, 1, NULL, '2022-07-01 11:00:37', '2022-07-03 23:03:56'),
(5, 'Gaming Zone', 'gaming-zone', NULL, 1, NULL, '2022-07-01 11:00:55', '2022-07-03 23:03:56'),
(6, 'Resorts', 'resorts', NULL, 1, 1, '2022-07-01 11:01:09', '2022-07-05 22:26:01'),
(7, 'Lawn', 'lawn', NULL, 1, NULL, '2022-07-01 11:09:46', '2022-07-03 23:03:56'),
(8, 'Hotels', 'hotels', NULL, 1, 1, '2022-07-01 11:09:50', '2022-07-05 22:26:04'),
(9, 'Destination Weeding', 'destination-weeding', NULL, 1, NULL, '2022-07-05 22:26:11', '2022-07-05 22:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `category_venue`
--

CREATE TABLE `category_venue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_venue`
--

INSERT INTO `category_venue` (`id`, `category_id`, `venue_id`, `created_at`, `updated_at`) VALUES
(1, 9, 1, NULL, NULL),
(2, 8, 2, NULL, NULL),
(3, 6, 3, NULL, NULL),
(4, 4, 4, NULL, NULL),
(5, 6, 4, NULL, NULL),
(6, 8, 4, NULL, NULL),
(7, 9, 4, NULL, NULL),
(8, 8, 5, NULL, NULL),
(9, 9, 5, NULL, NULL),
(10, 5, 6, NULL, NULL),
(11, 8, 6, NULL, NULL),
(12, 1, 7, NULL, NULL),
(13, 8, 7, NULL, NULL),
(14, 8, 8, NULL, NULL),
(15, 2, 1, NULL, NULL),
(16, 3, 1, NULL, NULL),
(17, 4, 1, NULL, NULL),
(18, 8, 1, NULL, NULL),
(19, 7, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `district_id`, `name`, `slug`, `bn_name`, `url`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Debidwar', 'debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd', 1, 1, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(2, 1, 'Barura', 'barura', 'বরুড়া', 'barura.comilla.gov.bd', 1, 1, '2022-07-01 17:48:50', '2022-07-03 23:27:35'),
(3, 1, 'Brahmanpara', 'brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(4, 1, 'Chandina', 'chandina', 'চান্দিনা', 'chandina.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(5, 1, 'Chauddagram', 'chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(6, 1, 'Daudkandi', 'daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(7, 1, 'Homna', 'homna', 'হোমনা', 'homna.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(8, 1, 'Laksam', 'laksam', 'লাকসাম', 'laksam.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(9, 1, 'Muradnagar', 'muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(10, 1, 'Nangalkot', 'nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(11, 1, 'Comilla Sadar', 'comilla-sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(12, 1, 'Meghna', 'meghna', 'মেঘনা', 'meghna.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(13, 1, 'Monohargonj', 'monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(14, 1, 'Sadarsouth', 'sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(15, 1, 'Titas', 'titas', 'তিতাস', 'titas.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(16, 1, 'Burichang', 'burichang', 'বুড়িচং', 'burichang.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(17, 1, 'Lalmai', 'lalmai', 'লালমাই', 'lalmai.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(18, 2, 'Chhagalnaiya', 'chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(19, 2, 'Feni Sadar', 'feni-sadar', 'ফেনী সদর', 'sadar.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(20, 2, 'Sonagazi', 'sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(21, 2, 'Fulgazi', 'fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(22, 2, 'Parshuram', 'parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(23, 2, 'Daganbhuiyan', 'daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(24, 3, 'Brahmanbaria Sadar', 'brahmanbaria-sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(25, 3, 'Kasba', 'kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(26, 3, 'Nasirnagar', 'nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(27, 3, 'Sarail', 'sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(28, 3, 'Ashuganj', 'ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(29, 3, 'Akhaura', 'akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(30, 3, 'Nabinagar', 'nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(31, 3, 'Bancharampur', 'bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(32, 3, 'Bijoynagar', 'bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    ', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(33, 4, 'Rangamati Sadar', 'rangamati-sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(34, 4, 'Kaptai', 'kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(35, 4, 'Kawkhali', 'kawkhali-35', 'কাউখালী', 'kawkhali.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:10'),
(36, 4, 'Baghaichari', 'baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(37, 4, 'Barkal', 'barkal', 'বরকল', 'barkal.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(38, 4, 'Langadu', 'langadu', 'লংগদু', 'langadu.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(39, 4, 'Rajasthali', 'rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(40, 4, 'Belaichari', 'belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(41, 4, 'Juraichari', 'juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(42, 4, 'Naniarchar', 'naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(43, 5, 'Noakhali Sadar', 'noakhali-sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(44, 5, 'Companiganj', 'companiganj-44', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:10'),
(45, 5, 'Begumganj', 'begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(46, 5, 'Hatia', 'hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(47, 5, 'Subarnachar', 'subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(48, 5, 'Kabirhat', 'kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(49, 5, 'Senbug', 'senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(50, 5, 'Chatkhil', 'chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(51, 5, 'Sonaimori', 'sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(52, 6, 'Haimchar', 'haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(53, 6, 'Kachua', 'kachua-53', 'কচুয়া', 'kachua.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(54, 6, 'Shahrasti', 'shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(55, 6, 'Chandpur Sadar', 'chandpur-sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(56, 6, 'Matlab South', 'matlab-south', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(57, 6, 'Hajiganj', 'hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(58, 6, 'Matlab North', 'matlab-north', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(59, 6, 'Faridgonj', 'faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(60, 7, 'Lakshmipur Sadar', 'lakshmipur-sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(61, 7, 'Kamalnagar', 'kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(62, 7, 'Raipur', 'raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(63, 7, 'Ramgati', 'ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(64, 7, 'Ramganj', 'ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(65, 8, 'Rangunia', 'rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(66, 8, 'Sitakunda', 'sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(67, 8, 'Mirsharai', 'mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(68, 8, 'Patiya', 'patiya', 'পটিয়া', 'patiya.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(69, 8, 'Sandwip', 'sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(70, 8, 'Banshkhali', 'banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(71, 8, 'Boalkhali', 'boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(72, 8, 'Anwara', 'anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(73, 8, 'Chandanaish', 'chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(74, 8, 'Satkania', 'satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(75, 8, 'Lohagara', 'lohagara-75', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(76, 8, 'Hathazari', 'hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(77, 8, 'Fatikchhari', 'fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(78, 8, 'Raozan', 'raozan', 'রাউজান', 'raozan.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(79, 8, 'Karnafuli', 'karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(80, 9, 'Coxsbazar Sadar', 'coxsbazar-sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(81, 9, 'Chakaria', 'chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(82, 9, 'Kutubdia', 'kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(83, 9, 'Ukhiya', 'ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(84, 9, 'Moheshkhali', 'moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(85, 9, 'Pekua', 'pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(86, 9, 'Ramu', 'ramu', 'রামু', 'ramu.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(87, 9, 'Teknaf', 'teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(88, 10, 'Khagrachhari Sadar', 'khagrachhari-sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(89, 10, 'Dighinala', 'dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(90, 10, 'Panchari', 'panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(91, 10, 'Laxmichhari', 'laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(92, 10, 'Mohalchari', 'mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(93, 10, 'Manikchari', 'manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(94, 10, 'Ramgarh', 'ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(95, 10, 'Matiranga', 'matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(96, 10, 'Guimara', 'guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(97, 11, 'Bandarban Sadar', 'bandarban-sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(98, 11, 'Alikadam', 'alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(99, 11, 'Naikhongchhari', 'naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(100, 11, 'Rowangchhari', 'rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(101, 11, 'Lama', 'lama', 'লামা', 'lama.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(102, 11, 'Ruma', 'ruma', 'রুমা', 'ruma.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(103, 11, 'Thanchi', 'thanchi', 'থানচি', 'thanchi.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(104, 12, 'Belkuchi', 'belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(105, 12, 'Chauhali', 'chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(106, 12, 'Kamarkhand', 'kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(107, 12, 'Kazipur', 'kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(108, 12, 'Raigonj', 'raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(109, 12, 'Shahjadpur', 'shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(110, 12, 'Sirajganj Sadar', 'sirajganj-sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(111, 12, 'Tarash', 'tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(112, 12, 'Ullapara', 'ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(113, 13, 'Sujanagar', 'sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(114, 13, 'Ishurdi', 'ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(115, 13, 'Bhangura', 'bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(116, 13, 'Pabna Sadar', 'pabna-sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(117, 13, 'Bera', 'bera', 'বেড়া', 'bera.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(118, 13, 'Atghoria', 'atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(119, 13, 'Chatmohar', 'chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(120, 13, 'Santhia', 'santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(121, 13, 'Faridpur', 'faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(122, 14, 'Kahaloo', 'kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(123, 14, 'Bogra Sadar', 'bogra-sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(124, 14, 'Shariakandi', 'shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(125, 14, 'Shajahanpur', 'shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(126, 14, 'Dupchanchia', 'dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(127, 14, 'Adamdighi', 'adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(128, 14, 'Nondigram', 'nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(129, 14, 'Sonatala', 'sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(130, 14, 'Dhunot', 'dhunot', 'ধুনট', 'dhunot.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(131, 14, 'Gabtali', 'gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(132, 14, 'Sherpur', 'sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(133, 14, 'Shibganj', 'shibganj-133', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(134, 15, 'Paba', 'paba', 'পবা', 'paba.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(135, 15, 'Durgapur', 'durgapur-135', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(136, 15, 'Mohonpur', 'mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(137, 15, 'Charghat', 'charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(138, 15, 'Puthia', 'puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(139, 15, 'Bagha', 'bagha', 'বাঘা', 'bagha.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(140, 15, 'Godagari', 'godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(141, 15, 'Tanore', 'tanore', 'তানোর', 'tanore.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(142, 15, 'Bagmara', 'bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(143, 16, 'Natore Sadar', 'natore-sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(144, 16, 'Singra', 'singra', 'সিংড়া', 'singra.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(145, 16, 'Baraigram', 'baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(146, 16, 'Bagatipara', 'bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(147, 16, 'Lalpur', 'lalpur', 'লালপুর', 'lalpur.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(148, 16, 'Gurudaspur', 'gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(149, 16, 'Naldanga', 'naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(150, 17, 'Akkelpur', 'akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(151, 17, 'Kalai', 'kalai', 'কালাই', 'kalai.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(152, 17, 'Khetlal', 'khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(153, 17, 'Panchbibi', 'panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(154, 17, 'Joypurhat Sadar', 'joypurhat-sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(155, 18, 'Chapainawabganj Sadar', 'chapainawabganj-sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(156, 18, 'Gomostapur', 'gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(157, 18, 'Nachol', 'nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(158, 18, 'Bholahat', 'bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(159, 18, 'Shibganj', 'shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(160, 19, 'Mohadevpur', 'mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(161, 19, 'Badalgachi', 'badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(162, 19, 'Patnitala', 'patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(163, 19, 'Dhamoirhat', 'dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(164, 19, 'Niamatpur', 'niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(165, 19, 'Manda', 'manda', 'মান্দা', 'manda.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(166, 19, 'Atrai', 'atrai', 'আত্রাই', 'atrai.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(167, 19, 'Raninagar', 'raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(168, 19, 'Naogaon Sadar', 'naogaon-sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(169, 19, 'Porsha', 'porsha', 'পোরশা', 'porsha.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(170, 19, 'Sapahar', 'sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(171, 20, 'Manirampur', 'manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(172, 20, 'Abhaynagar', 'abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(173, 20, 'Bagherpara', 'bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(174, 20, 'Chougachha', 'chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(175, 20, 'Jhikargacha', 'jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(176, 20, 'Keshabpur', 'keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(177, 20, 'Jessore Sadar', 'jessore-sadar', 'যশোর সদর', 'sadar.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(178, 20, 'Sharsha', 'sharsha', 'শার্শা', 'sharsha.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(179, 21, 'Assasuni', 'assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(180, 21, 'Debhata', 'debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(181, 21, 'Kalaroa', 'kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(182, 21, 'Satkhira Sadar', 'satkhira-sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(183, 21, 'Shyamnagar', 'shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(184, 21, 'Tala', 'tala', 'তালা', 'tala.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(185, 21, 'Kaliganj', 'kaliganj-185', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(186, 22, 'Mujibnagar', 'mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(187, 22, 'Meherpur Sadar', 'meherpur-sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(188, 22, 'Gangni', 'gangni', 'গাংনী', 'gangni.meherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(189, 23, 'Narail Sadar', 'narail-sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(190, 23, 'Lohagara', 'lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(191, 23, 'Kalia', 'kalia', 'কালিয়া', 'kalia.narail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(192, 24, 'Chuadanga Sadar', 'chuadanga-sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(193, 24, 'Alamdanga', 'alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(194, 24, 'Damurhuda', 'damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(195, 24, 'Jibannagar', 'jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(196, 25, 'Kushtia Sadar', 'kushtia-sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(197, 25, 'Kumarkhali', 'kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(198, 25, 'Khoksa', 'khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(199, 25, 'Mirpur', 'mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(200, 25, 'Daulatpur', 'daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(201, 25, 'Bheramara', 'bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(202, 26, 'Shalikha', 'shalikha', 'শালিখা', 'shalikha.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(203, 26, 'Sreepur', 'sreepur-203', 'শ্রীপুর', 'sreepur.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(204, 26, 'Magura Sadar', 'magura-sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(205, 26, 'Mohammadpur', 'mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(206, 27, 'Paikgasa', 'paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(207, 27, 'Fultola', 'fultola', 'ফুলতলা', 'fultola.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(208, 27, 'Digholia', 'digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(209, 27, 'Rupsha', 'rupsha', 'রূপসা', 'rupsha.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(210, 27, 'Terokhada', 'terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(211, 27, 'Dumuria', 'dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(212, 27, 'Botiaghata', 'botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(213, 27, 'Dakop', 'dakop', 'দাকোপ', 'dakop.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(214, 27, 'Koyra', 'koyra', 'কয়রা', 'koyra.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(215, 28, 'Fakirhat', 'fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(216, 28, 'Bagerhat Sadar', 'bagerhat-sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(217, 28, 'Mollahat', 'mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(218, 28, 'Sarankhola', 'sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(219, 28, 'Rampal', 'rampal', 'রামপাল', 'rampal.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(220, 28, 'Morrelganj', 'morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(221, 28, 'Kachua', 'kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(222, 28, 'Mongla', 'mongla', 'মোংলা', 'mongla.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(223, 28, 'Chitalmari', 'chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(224, 29, 'Jhenaidah Sadar', 'jhenaidah-sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(225, 29, 'Shailkupa', 'shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(226, 29, 'Harinakundu', 'harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(227, 29, 'Kaliganj', 'kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(228, 29, 'Kotchandpur', 'kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(229, 29, 'Moheshpur', 'moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(230, 30, 'Jhalakathi Sadar', 'jhalakathi-sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(231, 30, 'Kathalia', 'kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(232, 30, 'Nalchity', 'nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(233, 30, 'Rajapur', 'rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(234, 31, 'Bauphal', 'bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(235, 31, 'Patuakhali Sadar', 'patuakhali-sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(236, 31, 'Dumki', 'dumki', 'দুমকি', 'dumki.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(237, 31, 'Dashmina', 'dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(238, 31, 'Kalapara', 'kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(239, 31, 'Mirzaganj', 'mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(240, 31, 'Galachipa', 'galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(241, 31, 'Rangabali', 'rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(242, 32, 'Pirojpur Sadar', 'pirojpur-sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(243, 32, 'Nazirpur', 'nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(244, 32, 'Kawkhali', 'kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(245, 32, 'Zianagar', 'zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(246, 32, 'Bhandaria', 'bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(247, 32, 'Mathbaria', 'mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(248, 32, 'Nesarabad', 'nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(249, 33, 'Barisal Sadar', 'barisal-sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(250, 33, 'Bakerganj', 'bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(251, 33, 'Babuganj', 'babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(252, 33, 'Wazirpur', 'wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(253, 33, 'Banaripara', 'banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(254, 33, 'Gournadi', 'gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(255, 33, 'Agailjhara', 'agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(256, 33, 'Mehendiganj', 'mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(257, 33, 'Muladi', 'muladi', 'মুলাদী', 'muladi.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:04'),
(258, 33, 'Hizla', 'hizla', 'হিজলা', 'hizla.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(259, 34, 'Bhola Sadar', 'bhola-sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(260, 34, 'Borhan Sddin', 'borhan-sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(261, 34, 'Charfesson', 'charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(262, 34, 'Doulatkhan', 'doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(263, 34, 'Monpura', 'monpura', 'মনপুরা', 'monpura.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(264, 34, 'Tazumuddin', 'tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(265, 34, 'Lalmohan', 'lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(266, 35, 'Amtali', 'amtali', 'আমতলী', 'amtali.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(267, 35, 'Barguna Sadar', 'barguna-sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(268, 35, 'Betagi', 'betagi', 'বেতাগী', 'betagi.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(269, 35, 'Bamna', 'bamna', 'বামনা', 'bamna.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(270, 35, 'Pathorghata', 'pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(271, 35, 'Taltali', 'taltali', 'তালতলি', 'taltali.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(272, 36, 'Balaganj', 'balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(273, 36, 'Beanibazar', 'beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(274, 36, 'Bishwanath', 'bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(275, 36, 'Companiganj', 'companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(276, 36, 'Fenchuganj', 'fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(277, 36, 'Golapganj', 'golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(278, 36, 'Gowainghat', 'gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(279, 36, 'Jaintiapur', 'jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(280, 36, 'Kanaighat', 'kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(281, 36, 'Sylhet Sadar', 'sylhet-sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(282, 36, 'Zakiganj', 'zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(283, 36, 'Dakshinsurma', 'dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(284, 36, 'Osmaninagar', 'osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(285, 37, 'Barlekha', 'barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(286, 37, 'Kamolganj', 'kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(287, 37, 'Kulaura', 'kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(288, 37, 'Moulvibazar Sadar', 'moulvibazar-sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(289, 37, 'Rajnagar', 'rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(290, 37, 'Sreemangal', 'sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(291, 37, 'Juri', 'juri', 'জুড়ী', 'juri.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(292, 38, 'Nabiganj', 'nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(293, 38, 'Bahubal', 'bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(294, 38, 'Ajmiriganj', 'ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(295, 38, 'Baniachong', 'baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(296, 38, 'Lakhai', 'lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(297, 38, 'Chunarughat', 'chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(298, 38, 'Habiganj Sadar', 'habiganj-sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(299, 38, 'Madhabpur', 'madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(300, 39, 'Sunamganj Sadar', 'sunamganj-sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(301, 39, 'South Sunamganj', 'south-sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(302, 39, 'Bishwambarpur', 'bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(303, 39, 'Chhatak', 'chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(304, 39, 'Jagannathpur', 'jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(305, 39, 'Dowarabazar', 'dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(306, 39, 'Tahirpur', 'tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(307, 39, 'Dharmapasha', 'dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(308, 39, 'Jamalganj', 'jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(309, 39, 'Shalla', 'shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(310, 39, 'Derai', 'derai', 'দিরাই', 'derai.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(311, 40, 'Belabo', 'belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(312, 40, 'Monohardi', 'monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(313, 40, 'Narsingdi Sadar', 'narsingdi-sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(314, 40, 'Palash', 'palash', 'পলাশ', 'palash.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(315, 40, 'Raipura', 'raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(316, 40, 'Shibpur', 'shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(317, 41, 'Kaliganj', 'kaliganj-317', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:25:05'),
(318, 41, 'Kaliakair', 'kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(319, 41, 'Kapasia', 'kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(320, 41, 'Gazipur Sadar', 'gazipur-sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(321, 41, 'Sreepur', 'sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(322, 42, 'Shariatpur Sadar', 'shariatpur-sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(323, 42, 'Naria', 'naria', 'নড়িয়া', 'naria.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(324, 42, 'Zajira', 'zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(325, 42, 'Gosairhat', 'gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(326, 42, 'Bhedarganj', 'bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(327, 42, 'Damudya', 'damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(328, 43, 'Araihazar', 'araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(329, 43, 'Bandar', 'bandar', 'বন্দর', 'bandar.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(330, 43, 'Narayanganj Sadar', 'narayanganj-sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(331, 43, 'Rupganj', 'rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(332, 43, 'Sonargaon', 'sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(333, 44, 'Basail', 'basail', 'বাসাইল', 'basail.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(334, 44, 'Bhuapur', 'bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(335, 44, 'Delduar', 'delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(336, 44, 'Ghatail', 'ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(337, 44, 'Gopalpur', 'gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(338, 44, 'Madhupur', 'madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(339, 44, 'Mirzapur', 'mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(340, 44, 'Nagarpur', 'nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(341, 44, 'Sakhipur', 'sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(342, 44, 'Tangail Sadar', 'tangail-sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(343, 44, 'Kalihati', 'kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(344, 44, 'Dhanbari', 'dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(345, 45, 'Itna', 'itna', 'ইটনা', 'itna.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(346, 45, 'Katiadi', 'katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(347, 45, 'Bhairab', 'bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(348, 45, 'Tarail', 'tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(349, 45, 'Hossainpur', 'hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(350, 45, 'Pakundia', 'pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(351, 45, 'Kuliarchar', 'kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(352, 45, 'Kishoreganj Sadar', 'kishoreganj-sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(353, 45, 'Karimgonj', 'karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(354, 45, 'Bajitpur', 'bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(355, 45, 'Austagram', 'austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(356, 45, 'Mithamoin', 'mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(357, 45, 'Nikli', 'nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(358, 46, 'Harirampur', 'harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(359, 46, 'Saturia', 'saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(360, 46, 'Manikganj Sadar', 'manikganj-sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(361, 46, 'Gior', 'gior', 'ঘিওর', 'gior.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(362, 46, 'Shibaloy', 'shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(363, 46, 'Doulatpur', 'doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(364, 46, 'Singiar', 'singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(365, 47, 'Savar', 'savar', 'সাভার', 'savar.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(366, 47, 'Dhamrai', 'dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(367, 47, 'Keraniganj', 'keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(368, 47, 'Nawabganj', 'nawabganj-368', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(369, 47, 'Dohar', 'dohar', 'দোহার', 'dohar.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(370, 48, 'Munshiganj Sadar', 'munshiganj-sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(371, 48, 'Sreenagar', 'sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(372, 48, 'Sirajdikhan', 'sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(373, 48, 'Louhajanj', 'louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(374, 48, 'Gajaria', 'gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(375, 48, 'Tongibari', 'tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(376, 49, 'Rajbari Sadar', 'rajbari-sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(377, 49, 'Goalanda', 'goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(378, 49, 'Pangsa', 'pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(379, 49, 'Baliakandi', 'baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(380, 49, 'Kalukhali', 'kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(381, 50, 'Madaripur Sadar', 'madaripur-sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(382, 50, 'Shibchar', 'shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(383, 50, 'Kalkini', 'kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(384, 50, 'Rajoir', 'rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05');
INSERT INTO `cities` (`id`, `district_id`, `name`, `slug`, `bn_name`, `url`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(385, 51, 'Gopalganj Sadar', 'gopalganj-sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(386, 51, 'Kashiani', 'kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(387, 51, 'Tungipara', 'tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(388, 51, 'Kotalipara', 'kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(389, 51, 'Muksudpur', 'muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(390, 52, 'Faridpur Sadar', 'faridpur-sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(391, 52, 'Alfadanga', 'alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(392, 52, 'Boalmari', 'boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(393, 52, 'Sadarpur', 'sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(394, 52, 'Nagarkanda', 'nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(395, 52, 'Bhanga', 'bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(396, 52, 'Charbhadrasan', 'charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(397, 52, 'Madhukhali', 'madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(398, 52, 'Saltha', 'saltha', 'সালথা', 'saltha.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(399, 53, 'Panchagarh Sadar', 'panchagarh-sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(400, 53, 'Debiganj', 'debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(401, 53, 'Boda', 'boda', 'বোদা', 'boda.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(402, 53, 'Atwari', 'atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(403, 53, 'Tetulia', 'tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(404, 54, 'Nawabganj', 'nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:11'),
(405, 54, 'Birganj', 'birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(406, 54, 'Ghoraghat', 'ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(407, 54, 'Birampur', 'birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(408, 54, 'Parbatipur', 'parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(409, 54, 'Bochaganj', 'bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(410, 54, 'Kaharol', 'kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(411, 54, 'Fulbari', 'fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(412, 54, 'Dinajpur Sadar', 'dinajpur-sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(413, 54, 'Hakimpur', 'hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(414, 54, 'Khansama', 'khansama', 'খানসামা', 'khansama.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(415, 54, 'Birol', 'birol', 'বিরল', 'birol.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(416, 54, 'Chirirbandar', 'chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(417, 55, 'Lalmonirhat Sadar', 'lalmonirhat-sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(418, 55, 'Kaliganj', 'kaliganj-418', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:25:05'),
(419, 55, 'Hatibandha', 'hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(420, 55, 'Patgram', 'patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(421, 55, 'Aditmari', 'aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(422, 56, 'Syedpur', 'syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(423, 56, 'Domar', 'domar', 'ডোমার', 'domar.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(424, 56, 'Dimla', 'dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(425, 56, 'Jaldhaka', 'jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(426, 56, 'Kishorganj', 'kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(427, 56, 'Nilphamari Sadar', 'nilphamari-sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(428, 57, 'Sadullapur', 'sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(429, 57, 'Gaibandha Sadar', 'gaibandha-sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(430, 57, 'Palashbari', 'palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(431, 57, 'Saghata', 'saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(432, 57, 'Gobindaganj', 'gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(433, 57, 'Sundarganj', 'sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(434, 57, 'Phulchari', 'phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(435, 58, 'Thakurgaon Sadar', 'thakurgaon-sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(436, 58, 'Pirganj', 'pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(437, 58, 'Ranisankail', 'ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(438, 58, 'Haripur', 'haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(439, 58, 'Baliadangi', 'baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(440, 59, 'Rangpur Sadar', 'rangpur-sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(441, 59, 'Gangachara', 'gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(442, 59, 'Taragonj', 'taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(443, 59, 'Badargonj', 'badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(444, 59, 'Mithapukur', 'mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(445, 59, 'Pirgonj', 'pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(446, 59, 'Kaunia', 'kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(447, 59, 'Pirgacha', 'pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(448, 60, 'Kurigram Sadar', 'kurigram-sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(449, 60, 'Nageshwari', 'nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(450, 60, 'Bhurungamari', 'bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(451, 60, 'Phulbari', 'phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(452, 60, 'Rajarhat', 'rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(453, 60, 'Ulipur', 'ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(454, 60, 'Chilmari', 'chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(455, 60, 'Rowmari', 'rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(456, 60, 'Charrajibpur', 'charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(457, 61, 'Sherpur Sadar', 'sherpur-sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(458, 61, 'Nalitabari', 'nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(459, 61, 'Sreebordi', 'sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(460, 61, 'Nokla', 'nokla', 'নকলা', 'nokla.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(461, 61, 'Jhenaigati', 'jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(462, 62, 'Fulbaria', 'fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(463, 62, 'Trishal', 'trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(464, 62, 'Bhaluka', 'bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(465, 62, 'Muktagacha', 'muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(466, 62, 'Mymensingh Sadar', 'mymensingh-sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(467, 62, 'Dhobaura', 'dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(468, 62, 'Phulpur', 'phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(469, 62, 'Haluaghat', 'haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(470, 62, 'Gouripur', 'gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(471, 62, 'Gafargaon', 'gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(472, 62, 'Iswarganj', 'iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(473, 62, 'Nandail', 'nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(474, 62, 'Tarakanda', 'tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(475, 63, 'Jamalpur Sadar', 'jamalpur-sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(476, 63, 'Melandah', 'melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(477, 63, 'Islampur', 'islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(478, 63, 'Dewangonj', 'dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(479, 63, 'Sarishabari', 'sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(480, 63, 'Madarganj', 'madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(481, 63, 'Bokshiganj', 'bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(482, 64, 'Barhatta', 'barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(483, 64, 'Durgapur', 'durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:26:12'),
(484, 64, 'Kendua', 'kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(485, 64, 'Atpara', 'atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(486, 64, 'Madan', 'madan', 'মদন', 'madan.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(487, 64, 'Khaliajuri', 'khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(488, 64, 'Kalmakanda', 'kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(489, 64, 'Mohongonj', 'mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(490, 64, 'Purbadhala', 'purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05'),
(491, 64, 'Netrokona Sadar', 'netrokona-sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', '2022-07-03 23:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `slug`, `division_id`, `bn_name`, `lat`, `lon`, `url`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Comilla', 'comilla', 1, 'কুমিল্লা', '23.4682747', '91.1788135', 'www.comilla.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(2, 'Feni', 'feni', 1, 'ফেনী', '23.023231', '91.3840844', 'www.feni.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(3, 'Brahmanbaria', 'brahmanbaria', 1, 'ব্রাহ্মণবাড়িয়া', '23.9570904', '91.1119286', 'www.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(4, 'Rangamati', 'rangamati', 1, 'রাঙ্গামাটি', '22.65561018', '92.17541121', 'www.rangamati.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(5, 'Noakhali', 'noakhali', 1, 'নোয়াখালী', '22.869563', '91.099398', 'www.noakhali.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(6, 'Chandpur', 'chandpur', 1, 'চাঁদপুর', '23.2332585', '90.6712912', 'www.chandpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(7, 'Lakshmipur', 'lakshmipur', 1, 'লক্ষ্মীপুর', '22.942477', '90.841184', 'www.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(8, 'Chattogram', 'chattogram', 1, 'চট্টগ্রাম', '22.335109', '91.834073', 'www.chittagong.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(9, 'Coxsbazar', 'coxsbazar', 1, 'কক্সবাজার', '21.44315751', '91.97381741', 'www.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(10, 'Khagrachhari', 'khagrachhari', 1, 'খাগড়াছড়ি', '23.119285', '91.984663', 'www.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(11, 'Bandarban', 'bandarban', 1, 'বান্দরবান', '22.1953275', '92.2183773', 'www.bandarban.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(12, 'Sirajganj', 'sirajganj', 2, 'সিরাজগঞ্জ', '24.4533978', '89.7006815', 'www.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(13, 'Pabna', 'pabna', 2, 'পাবনা', '23.998524', '89.233645', 'www.pabna.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(14, 'Bogura', 'bogura', 2, 'বগুড়া', '24.8465228', '89.377755', 'www.bogra.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(15, 'Rajshahi', 'rajshahi', 2, 'রাজশাহী', '24.37230298', '88.56307623', 'www.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(16, 'Natore', 'natore', 2, 'নাটোর', '24.420556', '89.000282', 'www.natore.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(17, 'Joypurhat', 'joypurhat', 2, 'জয়পুরহাট', '25.09636876', '89.04004280', 'www.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(18, 'Chapainawabganj', 'chapainawabganj', 2, 'চাঁপাইনবাবগঞ্জ', '24.5965034', '88.2775122', 'www.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(19, 'Naogaon', 'naogaon', 2, 'নওগাঁ', '24.83256191', '88.92485205', 'www.naogaon.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(20, 'Jashore', 'jashore', 3, 'যশোর', '23.16643', '89.2081126', 'www.jessore.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(21, 'Satkhira', 'satkhira', 3, 'সাতক্ষীরা', NULL, NULL, 'www.satkhira.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(22, 'Meherpur', 'meherpur', 3, 'মেহেরপুর', '23.762213', '88.631821', 'www.meherpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(23, 'Narail', 'narail', 3, 'নড়াইল', '23.172534', '89.512672', 'www.narail.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(24, 'Chuadanga', 'chuadanga', 3, 'চুয়াডাঙ্গা', '23.6401961', '88.841841', 'www.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(25, 'Kushtia', 'kushtia', 3, 'কুষ্টিয়া', '23.901258', '89.120482', 'www.kushtia.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(26, 'Magura', 'magura', 3, 'মাগুরা', '23.487337', '89.419956', 'www.magura.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(27, 'Khulna', 'khulna', 3, 'খুলনা', '22.815774', '89.568679', 'www.khulna.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(28, 'Bagerhat', 'bagerhat', 3, 'বাগেরহাট', '22.651568', '89.785938', 'www.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(29, 'Jhenaidah', 'jhenaidah', 3, 'ঝিনাইদহ', '23.5448176', '89.1539213', 'www.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(30, 'Jhalakathi', 'jhalakathi', 4, 'ঝালকাঠি', NULL, NULL, 'www.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(31, 'Patuakhali', 'patuakhali', 4, 'পটুয়াখালী', '22.3596316', '90.3298712', 'www.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(32, 'Pirojpur', 'pirojpur', 4, 'পিরোজপুর', NULL, NULL, 'www.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(33, 'Barisal', 'barisal', 4, 'বরিশাল', NULL, NULL, 'www.barisal.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(34, 'Bhola', 'bhola', 4, 'ভোলা', '22.685923', '90.648179', 'www.bhola.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(35, 'Barguna', 'barguna', 4, 'বরগুনা', NULL, NULL, 'www.barguna.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(36, 'Sylhet', 'sylhet', 5, 'সিলেট', '24.8897956', '91.8697894', 'www.sylhet.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(37, 'Moulvibazar', 'moulvibazar', 5, 'মৌলভীবাজার', '24.482934', '91.777417', 'www.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(38, 'Habiganj', 'habiganj', 5, 'হবিগঞ্জ', '24.374945', '91.41553', 'www.habiganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(39, 'Sunamganj', 'sunamganj', 5, 'সুনামগঞ্জ', '25.0658042', '91.3950115', 'www.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(40, 'Narsingdi', 'narsingdi', 6, 'নরসিংদী', '23.932233', '90.71541', 'www.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(41, 'Gazipur', 'gazipur', 6, 'গাজীপুর', '24.0022858', '90.4264283', 'www.gazipur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(42, 'Shariatpur', 'shariatpur', 6, 'শরীয়তপুর', NULL, NULL, 'www.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(43, 'Narayanganj', 'narayanganj', 6, 'নারায়ণগঞ্জ', '23.63366', '90.496482', 'www.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(44, 'Tangail', 'tangail', 6, 'টাঙ্গাইল', '24.26361358', '89.91794786', 'www.tangail.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(45, 'Kishoreganj', 'kishoreganj', 6, 'কিশোরগঞ্জ', '24.444937', '90.776575', 'www.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(46, 'Manikganj', 'manikganj', 6, 'মানিকগঞ্জ', NULL, NULL, 'www.manikganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(47, 'Dhaka', 'dhaka', 6, 'ঢাকা', '23.7115253', '90.4111451', 'www.dhaka.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(48, 'Munshiganj', 'munshiganj', 6, 'মুন্সিগঞ্জ', NULL, NULL, 'www.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(49, 'Rajbari', 'rajbari', 6, 'রাজবাড়ী', '23.7574305', '89.6444665', 'www.rajbari.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(50, 'Madaripur', 'madaripur', 6, 'মাদারীপুর', '23.164102', '90.1896805', 'www.madaripur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(51, 'Gopalganj', 'gopalganj', 6, 'গোপালগঞ্জ', '23.0050857', '89.8266059', 'www.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(52, 'Faridpur', 'faridpur', 6, 'ফরিদপুর', '23.6070822', '89.8429406', 'www.faridpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(53, 'Panchagarh', 'panchagarh', 7, 'পঞ্চগড়', '26.3411', '88.5541606', 'www.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(54, 'Dinajpur', 'dinajpur', 7, 'দিনাজপুর', '25.6217061', '88.6354504', 'www.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(55, 'Lalmonirhat', 'lalmonirhat', 7, 'লালমনিরহাট', NULL, NULL, 'www.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(56, 'Nilphamari', 'nilphamari', 7, 'নীলফামারী', '25.931794', '88.856006', 'www.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(57, 'Gaibandha', 'gaibandha', 7, 'গাইবান্ধা', '25.328751', '89.528088', 'www.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(58, 'Thakurgaon', 'thakurgaon', 7, 'ঠাকুরগাঁও', '26.0336945', '88.4616834', 'www.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(59, 'Rangpur', 'rangpur', 7, 'রংপুর', '25.7558096', '89.244462', 'www.rangpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(60, 'Kurigram', 'kurigram', 7, 'কুড়িগ্রাম', '25.805445', '89.636174', 'www.kurigram.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(61, 'Sherpur', 'sherpur', 8, 'শেরপুর', '25.0204933', '90.0152966', 'www.sherpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(62, 'Mymensingh', 'mymensingh', 8, 'ময়মনসিংহ', '24.7465670', '90.4072093', 'www.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(63, 'Jamalpur', 'jamalpur', 8, 'জামালপুর', '24.937533', '89.937775', 'www.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20'),
(64, 'Netrokona', 'netrokona', 8, 'নেত্রকোণা', '24.870955', '90.727887', 'www.netrokona.gov.bd', 1, NULL, '2022-07-01 17:50:07', '2022-07-03 23:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `slug`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Chattagram', 'chattagram', 1, NULL, '2022-07-01 08:01:31', '2022-07-03 23:32:29'),
(2, 'Rajshahi', 'rajshahi', 1, NULL, '2022-07-01 11:19:20', '2022-07-03 23:32:29'),
(3, 'Khulna', 'khulna', 1, NULL, '2022-07-01 11:19:30', '2022-07-03 23:32:29'),
(4, 'Barisal', 'barisal', 1, NULL, '2022-07-01 11:19:43', '2022-07-03 23:32:29'),
(5, 'Sylhet', 'sylhet', 1, NULL, '2022-07-01 11:19:55', '2022-07-03 23:32:29'),
(6, 'Dhaka', 'dhaka', 1, NULL, '2022-07-01 11:20:03', '2022-07-03 23:32:29'),
(7, 'Rangpur', 'rangpur', 1, NULL, '2022-07-01 11:20:21', '2022-07-03 23:32:29'),
(8, 'Mymensingh', 'mymensingh', 1, NULL, '2022-07-01 11:20:29', '2022-07-03 23:32:29');

-- --------------------------------------------------------

--
-- Table structure for table `event_calendars`
--

CREATE TABLE `event_calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `all_day_event` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('pending','approved','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_calendars`
--

INSERT INTO `event_calendars` (`id`, `venue_id`, `title`, `description`, `feedback`, `start_date`, `end_date`, `all_day_event`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Weeding', 'Available for any Weeding occasions', NULL, '2022-08-05', '2022-08-06', 1, 'approved', 2, 1, '2022-08-02 03:43:35', '2022-08-02 03:44:14'),
(2, 1, 'Weeding', 'Available for any Weeding occasions', NULL, '2022-08-10', '2022-08-12', 1, 'approved', 2, NULL, '2022-08-02 04:03:28', '2022-08-02 04:03:28'),
(5, 8, 'Party', 'Available for any perty', NULL, '2022-08-07', '2022-08-13', 1, 'approved', 2, NULL, '2022-08-02 04:26:07', '2022-08-02 04:26:07'),
(6, 8, 'Party', 'Available for any perty', NULL, '2022-08-18', '2022-08-19', 1, 'pending', 2, NULL, '2022-08-02 04:37:06', '2022-08-02 04:37:06'),
(7, 1, 'Weeding', 'Available', NULL, '2022-08-14', '2022-08-17', 1, 'pending', 2, NULL, '2022-08-02 04:39:13', '2022-08-02 04:39:13'),
(8, 1, 'Weeding', NULL, NULL, '2022-08-22', '2022-08-24', 1, 'pending', 2, NULL, '2022-08-02 04:39:25', '2022-08-02 04:39:25'),
(9, 2, 'weeding', NULL, NULL, '2022-08-02', '2022-08-03', 1, 'pending', 1, NULL, '2022-08-24 06:34:10', '2022-08-24 06:34:10');

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
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `linked_social_accounts`
--

CREATE TABLE `linked_social_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2022_07_01_113855_create_categories_table', 2),
(21, '2022_07_01_114026_create_occasions_table', 2),
(22, '2022_07_01_114334_create_amenities_table', 2),
(23, '2022_07_01_115303_create_divisions_table', 2),
(28, '2022_07_01_115351_create_districts_table', 4),
(30, '2022_07_01_115635_create_cities_table', 5),
(35, '2022_07_02_173603_create_category_venue_table', 7),
(36, '2022_07_02_173805_create_occasion_venue_table', 7),
(37, '2022_07_02_173843_create_amenity_venue_table', 7),
(40, '2022_07_15_050549_create_event_calendars_table', 10),
(42, '2022_08_20_055703_create_organizations_table', 12),
(43, '2022_07_01_115642_create_venues_table', 13),
(44, '2022_08_20_114821_create_user_venue_table', 14),
(46, '2022_08_20_130211_create_organization_user_table', 15),
(47, '2022_08_27_052225_create_linked_social_accounts_table', 16),
(48, '2022_08_30_040136_create_inboxes_table', 17),
(49, '2022_08_30_050052_create_testmonials_table', 18),
(52, '2022_07_27_125752_create_orders_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `occasions`
--

CREATE TABLE `occasions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `occasions`
--

INSERT INTO `occasions` (`id`, `name`, `slug`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Wedding', 'wedding', NULL, 1, 1, '2022-07-01 08:01:08', '2022-07-03 23:06:21'),
(2, 'Engagement', 'engagement', NULL, 1, NULL, '2022-07-01 11:02:38', '2022-07-03 23:06:21'),
(3, 'Reception', 'reception', NULL, 1, NULL, '2022-07-01 11:02:49', '2022-07-03 23:06:21'),
(4, 'Birthday Party', 'birthday-party', NULL, 1, NULL, '2022-07-01 11:02:56', '2022-07-03 23:06:21'),
(5, 'First Birthday Party', 'first-birthday-party', NULL, 1, NULL, '2022-07-01 11:03:04', '2022-07-03 23:06:21'),
(6, 'Social Gathering', 'social-gathering', NULL, 1, 1, '2022-07-01 11:05:21', '2022-07-03 23:06:21'),
(7, 'Corporate Party', 'corporate-party', NULL, 1, 1, '2022-07-01 11:06:25', '2022-07-03 23:06:21'),
(8, 'Anniversary', 'anniversary', NULL, 1, NULL, '2022-07-01 11:07:55', '2022-07-03 23:06:21'),
(9, 'Cocktail Party', 'cocktail-party', NULL, 1, NULL, '2022-07-01 11:08:03', '2022-07-03 23:06:21'),
(10, 'Bachelor Party', 'bachelor-party', NULL, 1, NULL, '2022-07-01 11:08:09', '2022-07-03 23:06:21'),
(11, 'Pool Party', 'pool-party', NULL, 1, NULL, '2022-07-01 11:08:16', '2022-07-03 23:06:21'),
(12, 'Party', 'party', NULL, 1, NULL, '2022-07-01 11:08:23', '2022-07-03 23:06:21'),
(13, 'Kids Party', 'kids-party', NULL, 1, NULL, '2022-07-01 11:08:28', '2022-07-03 23:06:21'),
(14, 'Team Building', 'team-building', NULL, 1, NULL, '2022-07-01 11:08:34', '2022-07-03 23:06:21'),
(15, 'Meeting', 'meeting', NULL, 1, NULL, '2022-07-01 11:08:39', '2022-07-03 23:06:21'),
(16, 'Conference', 'conference', NULL, 1, NULL, '2022-07-01 11:08:45', '2022-07-03 23:06:21'),
(17, 'Exhibition', 'exhibition', NULL, 1, NULL, '2022-07-01 11:08:51', '2022-07-03 23:06:21');

-- --------------------------------------------------------

--
-- Table structure for table `occasion_venue`
--

CREATE TABLE `occasion_venue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `occasion_id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `occasion_venue`
--

INSERT INTO `occasion_venue` (`id`, `occasion_id`, `venue_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 8, 1, NULL, NULL),
(4, 3, 2, NULL, NULL),
(5, 6, 2, NULL, NULL),
(6, 9, 2, NULL, NULL),
(7, 10, 2, NULL, NULL),
(8, 14, 2, NULL, NULL),
(9, 15, 2, NULL, NULL),
(10, 16, 2, NULL, NULL),
(11, 6, 3, NULL, NULL),
(12, 7, 3, NULL, NULL),
(13, 12, 3, NULL, NULL),
(14, 15, 3, NULL, NULL),
(15, 16, 3, NULL, NULL),
(16, 1, 4, NULL, NULL),
(17, 2, 4, NULL, NULL),
(18, 4, 4, NULL, NULL),
(19, 6, 4, NULL, NULL),
(20, 8, 4, NULL, NULL),
(21, 14, 4, NULL, NULL),
(22, 1, 5, NULL, NULL),
(23, 2, 5, NULL, NULL),
(24, 4, 5, NULL, NULL),
(25, 5, 5, NULL, NULL),
(26, 8, 5, NULL, NULL),
(27, 10, 5, NULL, NULL),
(28, 12, 5, NULL, NULL),
(29, 16, 5, NULL, NULL),
(30, 4, 6, NULL, NULL),
(31, 5, 6, NULL, NULL),
(32, 6, 6, NULL, NULL),
(33, 10, 6, NULL, NULL),
(34, 13, 6, NULL, NULL),
(35, 3, 7, NULL, NULL),
(36, 7, 7, NULL, NULL),
(37, 16, 7, NULL, NULL),
(38, 6, 8, NULL, NULL),
(39, 7, 8, NULL, NULL),
(40, 14, 8, NULL, NULL),
(41, 15, 8, NULL, NULL),
(42, 10, 1, NULL, NULL),
(43, 9, 1, NULL, NULL),
(44, 7, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `occasion_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` bigint(20) NOT NULL,
  `total_guests` bigint(20) DEFAULT NULL,
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_total_price` decimal(11,2) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `receive_promotional_offers` tinyint(1) NOT NULL DEFAULT '0',
  `agree` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('pending','approved','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('pending','canceled','complete','failed','processing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `venue_id`, `user_id`, `category_id`, `occasion_id`, `start_date`, `end_date`, `name`, `email`, `mobile_number`, `capacity`, `total_guests`, `price_type`, `net_total_price`, `address`, `receive_promotional_offers`, `agree`, `status`, `transaction_id`, `currency`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 2, '2022-08-05 00:00:00', '2022-08-05 00:00:00', 'Baker Edwards', 'kixyzigu@mailinator.com', '716', 6000, 1602, 'Per Night', '55000.00', 'Nobis lorem aute vol', 0, 1, 'approved', 'BO/1/631f4441b8c04', 'BDT', 'complete', '2022-09-12 08:37:53', '2022-09-12 08:38:08'),
(2, 1, 1, 1, 2, '2022-08-05 00:00:00', '2022-08-05 00:00:00', 'User', 'user@gmail.com', '01717293722', 6000, 1, 'Per Night', '55000.00', 'g', 0, 0, 'pending', 'BO/2/631f4466607e6', 'BDT', 'failed', '2022-09-12 08:38:29', '2022-09-12 08:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `multiple_properties` tinyint(1) NOT NULL DEFAULT '0',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updater_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `slug`, `email`, `description`, `contact_name`, `contact_number`, `address`, `multiple_properties`, `creator_type`, `updater_type`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Demo Organization', 'demo-organization', 'demoa@gmail.com', 'demo', 'demo', 'demo', 'demo', 1, 'AdminUser', 'User', 1, 1, '2022-08-20 00:38:53', '2022-08-28 22:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `organization_user`
--

CREATE TABLE `organization_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_user`
--

INSERT INTO `organization_user` (`id`, `organization_id`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 1, 1, NULL, NULL),
(10, 1, 2, NULL, NULL);

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'abdulawalbd121@gmail.com_Token', '2bd71dd75270b4615b5bb325ec256d4effa5ad0cb3f978d1334218f1efaa63a3', '[\"*\"]', NULL, '2022-08-25 06:46:36', '2022-08-25 06:46:36'),
(2, 'App\\Models\\User', 5, 'abdulawalbd121@gmail.com_Token', '37a8594c78435bf0b9350df3562887f30ff7c96f448640cecfcf5a01ab0470a4', '[\"*\"]', NULL, '2022-08-25 06:51:37', '2022-08-25 06:51:37'),
(3, 'App\\Models\\User', 6, 'abdulawalbd121@gmail.com_Token', '099722fe9aaae3482682a7fc942fe5c8ab3a6d94ff4104fd1e98ea0f90801a8a', '[\"*\"]', NULL, '2022-08-25 06:56:17', '2022-08-25 06:56:17'),
(4, 'App\\Models\\User', 7, 'abdulawalbd121@gmail.com_Token', '2946a4bdef12496aa51cbe60a921d675b115fa1d987b099f670e2a764e64298c', '[\"*\"]', NULL, '2022-08-25 07:02:42', '2022-08-25 07:02:42'),
(5, 'App\\Models\\User', 9, 'abdulawalbd121@gmail.com_Token', 'e8fbd69117d3174e97a896ae5db751829d6583491bf12ce6906a5318bf5efff0', '[\"*\"]', NULL, '2022-08-25 07:07:01', '2022-08-25 07:07:01'),
(14, 'App\\Models\\User', 15, '_Token', '879a6eaea2f90044a10b94cd030edb8538c8c13aa03614673b7ff74e8cd1badc', '[\"*\"]', NULL, '2022-08-26 23:57:07', '2022-08-26 23:57:07'),
(17, 'App\\Models\\User', 1, 'user@gmail.com_Token', '180925235da841ed4788148f677718a85e0a77da9a85c77ca66c0b618b258b7e', '[\"*\"]', '2022-09-12 08:38:29', '2022-08-27 00:20:51', '2022-09-12 08:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `testmonials`
--

CREATE TABLE `testmonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `rating` int(11) NOT NULL DEFAULT '5',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testmonials`
--

INSERT INTO `testmonials` (`id`, `thumbnail`, `name`, `country_name`, `body`, `rating`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 'images/3d93137dfb0c82616294a598ba6aabd4.jpg', 'Chulbul Panday', 'Italy', 'Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.', 5, 1, '2022-08-29 23:15:41', '2022-08-29 23:45:35'),
(2, 'images/69df666abadf2592a9331c02b70b671f.jpg', 'Leroy Bell', 'United States', 'Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.', 5, 1, '2022-08-29 23:16:05', '2022-08-29 23:18:33'),
(3, 'images/4d898facd17d581e03ecbc6977e8fae4.jpg', 'Leroy Bell', 'United States', 'Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.', 5, 1, '2022-08-29 23:16:34', '2022-08-29 23:19:07'),
(4, 'images/2f977463dbf38cc552b6c1fd10507e7b.jpg', 'Richard Pam', 'Canada', 'Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.', 5, 1, '2022-08-29 23:17:30', '2022-08-29 23:17:30'),
(5, 'images/78b4d95121d789891a91b8c018156e1d.jpg', 'Luke Jacobs', 'Australia', 'Excepteur sint occaecat cupidatat non proident sunt in culpa officia deserunt mollit anim laborum sint occaecat cupidatat non proident. Occaecat cupidatat non proident des.', 5, 1, '2022-08-29 23:18:07', '2022-08-29 23:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_socials_auth` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `has_socials_auth`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'User', 'user', 'user@gmail.com', '2022-08-01 21:19:26', '$2y$10$UzF1VUYzeLHjvV9Tm5UKgeJ5G5uUHsmwXg/I0e2b0/pWqbWjFzaMW', 0, NULL, '2022-07-30 23:09:46', '2022-08-27 00:21:07'),
(2, 'admin', 'admin', 'admin@gmail.com', '2022-08-01 21:19:39', '$2y$10$MxD/BxA13ZTpVfG.U8UJu.oyi0NuxxOLIl7UajNoGPpa6K18oZb9m', 0, NULL, '2022-08-01 21:20:17', '2022-08-01 21:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_venue`
--

CREATE TABLE `user_venue` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `venue_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_venue`
--

INSERT INTO `user_venue` (`id`, `user_id`, `venue_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` bigint(20) UNSIGNED NOT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star_rating` tinyint(1) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `additional_info` text COLLATE utf8mb4_unicode_ci,
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `capacity` bigint(20) NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `creator_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updater_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`id`, `organization_id`, `featured_image`, `images`, `name`, `slug`, `star_rating`, `description`, `additional_info`, `price_type`, `price`, `capacity`, `division_id`, `district_id`, `city_id`, `address`, `is_enabled`, `creator_type`, `updater_type`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'images/Su6K3abpVVMG6meWU1fNnftLx6nsRsl2VpgtX07n.jpeg', '[\"images\\/9207fcd26ab3f333e43fa2bb6a490822.jpg\",\"images\\/ccc3321c0876de924a201e3c7e99758e.jpg\",\"images\\/629c02c54c4ee7f15ac8e3b535f06d83.jpg\",\"images\\/4bc2319d8ad5023494962a6e860595cc.jpg\",\"images\\/8f63cfcb3140122620d4c0250698b493.jpg\",\"images\\/39f511b194694706ce3300fca2d3ceac.jpg\"]', 'Radisson', 'radisson', 5, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul><p class=\"ql-align-justify\"><br></p>', NULL, 'per-night', '55000.00', 6000, 6, 47, 365, 'Dhaka', 0, 'AdminUser', 'AdminUser', 1, 1, '2022-07-28 17:27:58', '2022-08-29 00:17:44'),
(2, 1, 'images/ecc1f5feaa3d04d18bb267a168ddde93.jpg', '[\"images\\/4261349ffd7c372a2e3aee32fe135432.jpg\",\"images\\/a28db48be398205b44e5ce93fc4a1d3d.jpg\",\"images\\/86a3be7307e5ccccbe8b0b107eeae690.jpg\",\"images\\/c9f29ee6a0277f895337185dd1762bcc.jpg\",\"images\\/2c19186ea5814cb7ab2f784b2c5d7a1f.jpg\"]', 'Essel Tower Club', 'essel-tower-club', 5, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul><p class=\"ql-align-justify\"><br></p><p><br></p>', NULL, 'per-night', '30000.00', 2000, 6, 41, 318, NULL, 1, 'AdminUser', 'AdminUser', 1, 1, '2022-07-28 17:35:39', '2022-08-27 07:30:41'),
(3, 1, 'images/7f3661339aa4b6985d4ad3fadb0d4381.jpg', '[\"images\\/ead5e126a0944278d00c5dacd405a3d3.jpg\",\"images\\/967ae11f4ab07961d3da3a8ef6e68d98.jpg\",\"images\\/dcf264d3d3250b129650fa0247297d3e.jpg\",\"images\\/d08989d96a004451912d046f3cf6c9b4.jpg\",\"images\\/718a2ac555c92843865ca941bbe12ef4.jpg\",\"images\\/9f7f002e1dabbfc66bb701403e0441d9.jpg\",\"images\\/72af8f89a50fe232a1ed1ebbab588cd5.jpg\",\"images\\/168b3db307fbff48e7aeaa4eb09ce789.jpg\",\"images\\/d6b22601040c367d309c0db961348a9c.jpg\",\"images\\/569f8b2e02160d10cbf1bf32a0a3ee61.jpg\"]', 'Farm Aravalia Mangar', 'farm-aravalia-mangar', 3, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul>', NULL, 'per-day', '70000.00', 10000, 5, 38, 299, NULL, 1, 'AdminUser', 'AdminUser', 1, 1, '2022-07-28 17:46:20', '2022-08-27 07:30:56'),
(4, 1, 'images/0c2c51ea4ab44383f29e5b1a815978d7.jpg', '[\"images\\/001bad455e66c40d6ee1688215d37121.jpg\",\"images\\/68e71848b990d2c04e265c538c326181.jpg\",\"images\\/59be9358e31f763ebf9d34c88b1dea10.jpg\",\"images\\/f2ecfc8c06540a1ff5f6ae34a0e8b325.jpg\",\"images\\/ffe12e10c5a5d402d78c0e973c04f710.jpg\",\"images\\/115086b41b2e2961f45b038b69f0c808.jpg\"]', 'Dreams Gardens', 'dreams-gardens', NULL, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul><p><br></p>', NULL, 'per-day', '80000.00', 20000, 8, 63, 479, NULL, 1, 'AdminUser', NULL, 1, NULL, '2022-07-28 17:52:38', '2022-07-28 17:52:38'),
(5, 1, 'images/79c55288e35ca7e4ea74c9c482918450.jpg', '[\"images\\/4b39601d950b2fa88fa787c85a6f6ecd.jpg\",\"images\\/a7b6fa160967264012da4a616e6bb1ca.jpg\",\"images\\/576345e0667936de4a9fe4154dac0925.jpg\",\"images\\/ebd00fea5753daeb20ed53c80c4d027f.jpg\",\"images\\/5a7dcd78be299fb2269ef163b84b2ab5.jpg\",\"images\\/5a00568dbc456b9d9ce4a9f7b074d792.jpg\"]', 'Casabella Banquet', 'casabella-banquet', NULL, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul><p class=\"ql-align-justify\"><br></p><p><br></p>', NULL, 'per-night', '150000.00', 25000, 1, 1, 1, NULL, 1, 'AdminUser', NULL, 1, NULL, '2022-07-28 18:02:15', '2022-07-28 18:02:15'),
(6, 1, 'images/11f8a891055f8d2cc24cb21be30d7652.jpg', '[\"images\\/a259743e73e261fc4f05a9ea1f63b68f.jpg\",\"images\\/feacfbc9ec1dda68caadc18660c2a2e5.jpg\",\"images\\/7ba562e690d18dc638ca96368b70d74b.jpg\",\"images\\/b6bbb1c924b203d7c1f8b83aad80e2d7.jpg\",\"images\\/c60616696f280e9193b11602a4420c43.jpg\",\"images\\/884ba6a98b2f9849068202a19eb7bef9.jpg\",\"images\\/a5b78d369191c227f5a98c79917c67a2.jpg\"]', 'Nirvana Patio Club', 'nirvana-patio-club', NULL, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul><p class=\"ql-align-justify\"><br></p><p><br></p>', NULL, 'per-day', '25000.00', 1200, 3, 21, 185, NULL, 1, 'AdminUser', NULL, 1, NULL, '2022-07-28 18:04:33', '2022-07-28 18:04:33'),
(7, 1, 'images/16e9395349e72b453e28222aa6ec3b86.jpg', '[\"images\\/af783a589d887cf9a755eeaae1b836e6.jpg\",\"images\\/4a953405322fa17db5d1d93e7c6b53df.jpg\",\"images\\/94cfb2325903ad872c2dfc26e8f72163.jpg\",\"images\\/ce6e509e2f1b6ea34deeaf13a911dc3a.jpg\",\"images\\/68b8df9c043086323a9661a95a0b2678.jpg\",\"images\\/a737649a03bbebde7fc0beb87173ade8.jpg\",\"images\\/cc9ea217a4804735d77681bc5d85b5bb.jpg\",\"images\\/895632426d1bf1904b6dac7bfb15a68f.jpg\",\"images\\/f32a06bc9ea3743a56acf10609e93a57.jpg\",\"images\\/98ee6ecc38f2aa5df04bc7ac68a2de1c.jpg\",\"images\\/af920a4d9adced7272dce36c2b66d55c.jpg\",\"images\\/b390c02af8ef3b06cd4c6387022deeb4.png\"]', 'Acura BMK', 'acura-bmk', NULL, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul><p class=\"ql-align-justify\"><br></p><p><br></p>', NULL, 'per-night', '85000.00', 15000, 5, 38, 296, NULL, 1, 'AdminUser', NULL, 1, NULL, '2022-07-28 18:10:00', '2022-07-28 18:10:00'),
(8, 1, 'images/795e67074cccb57fdbf6431abdb77dea.jpg', '[\"images\\/41c6e3defcad68bc83103ac133809cf5.jpg\",\"images\\/966efa28b6031e46ea0b3a8ea42f751e.jpg\",\"images\\/aed1538fd1e2ee827c34abc98a1cf163.jpg\",\"images\\/88358a785214bf612143dfea88604869.jpg\",\"images\\/4a9b56d9304920ba36b5528d5b6b85a3.jpg\",\"images\\/93a0a6799f7a0117cae852fc3d845222.jpg\",\"images\\/e34bc37575b21af820dc5ee575df7940.png\",\"images\\/b443e238ac8467010e9d0b2ee028e628.png\",\"images\\/52de172d39570165c548b8ff2322f0fa.png\",\"images\\/533f62a71c73166936de9c6d0f5e64e9.png\",\"images\\/cc9ab7dc3580d225d5f4c478a1ad01b0.png\",\"images\\/7ff319de28ccc0810d17760920042dfd.png\",\"images\\/39113d5c86b4364c44ed72a953eafb32.png\",\"images\\/c6da4c38cbbdf4eba49d797964f14c33.png\"]', 'Hotel Mizu', 'hotel-mizu', NULL, '<h4><strong>Approach</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson Gurgaon is an extremely beautiful property with all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyh all the necessary amenities. It is located near Delhi International Airport in Gurgaon, thus making it easily commutable. Radisson Gurgaon, Udyog Vihar III, stands for generosity and sophistication.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Ambience</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar has everything to organize your ceremonies easily and meet with all your party or banqueting needs &amp; demands to make your occasion an enjoyable experience for you and your famivent spaces like the beautiful banquet halls, smashing poolside venue, airy terrace space, and huge lawn space. The hotel is equipped to organize any kind of function, however, big or small it may be.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Food and Service</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson in Udyog Vihar offers you with its extravagant services to make your event a successful endeavor and make sure that you and your guests\' needs are fulfilled. Their in-house caterers offer an&nbsp;single aspect of your wedding will be taken care of. They put their best efforts to understand and fulfill all your expectations to deliver maximum customer satisfaction with their excellent services.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Known For</strong></h4><p><br></p><p class=\"ql-align-justify\">Radisson is well known for its great hospitality and services which is handled by efficient staff and management who would do everything catering to all your needs with the utmost care and courtesy. T&nbsp;do everything catering to all your needs with the utmost care and courtesy. They offer venue spaces to hold many events to celebrate various occasions and ensure that everyone has a great experience.</p><p class=\"ql-align-justify\"><br></p><h4><strong>Best suited for</strong></h4><p><br></p><ul><li>Anniversary</li><li>Birthday Party</li><li>Cocktail Party</li><li>Conference</li><li>Corporate Party</li><li>Engagement</li><li>First Birthday Party</li><li>Meeting</li><li>Party</li><li>Pool Party</li><li>Reception</li><li>Social Gathering</li><li>Team Building</li><li>Wedding</li></ul><p><br></p><h4><strong>Cuisines</strong></h4><p><br></p><ul><li>Multi Cuisine</li><li>Social Function Menu</li><li>High Tea Menu</li></ul><p><br></p><h4><strong>Terms and Conditions</strong></h4><p><br></p><ul><li>All Government applicable taxes will be applied.</li><li>All Venue Rules Apply.</li></ul><p class=\"ql-align-justify\"><br></p><p><br></p>', NULL, 'per-day', '25000.00', 1450, 7, 56, 426, NULL, 1, 'AdminUser', NULL, 1, NULL, '2022-07-28 18:13:09', '2022-07-28 18:13:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amenities_name_unique` (`name`),
  ADD UNIQUE KEY `amenities_slug_unique` (`slug`),
  ADD KEY `amenities_created_by_index` (`created_by`),
  ADD KEY `amenities_updated_by_index` (`updated_by`);

--
-- Indexes for table `amenity_venue`
--
ALTER TABLE `amenity_venue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amenity_venue_amenity_id_foreign` (`amenity_id`),
  ADD KEY `amenity_venue_venue_id_foreign` (`venue_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_created_by_index` (`created_by`),
  ADD KEY `categories_updated_by_index` (`updated_by`);

--
-- Indexes for table `category_venue`
--
ALTER TABLE `category_venue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_venue_category_id_foreign` (`category_id`),
  ADD KEY `category_venue_venue_id_foreign` (`venue_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_slug_unique` (`slug`),
  ADD KEY `cities_district_id_foreign` (`district_id`),
  ADD KEY `cities_created_by_index` (`created_by`),
  ADD KEY `cities_updated_by_index` (`updated_by`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `districts_name_unique` (`name`),
  ADD UNIQUE KEY `districts_slug_unique` (`slug`),
  ADD KEY `districts_division_id_foreign` (`division_id`),
  ADD KEY `districts_created_by_index` (`created_by`),
  ADD KEY `districts_updated_by_index` (`updated_by`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `divisions_name_unique` (`name`),
  ADD UNIQUE KEY `divisions_slug_unique` (`slug`),
  ADD KEY `divisions_created_by_index` (`created_by`),
  ADD KEY `divisions_updated_by_index` (`updated_by`);

--
-- Indexes for table `event_calendars`
--
ALTER TABLE `event_calendars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_calendars_venue_id_foreign` (`venue_id`),
  ADD KEY `event_calendars_created_by_foreign` (`created_by`),
  ADD KEY `event_calendars_start_date_index` (`start_date`),
  ADD KEY `event_calendars_end_date_index` (`end_date`),
  ADD KEY `event_calendars_all_day_event_index` (`all_day_event`),
  ADD KEY `event_calendars_updated_by_index` (`updated_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linked_social_accounts`
--
ALTER TABLE `linked_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linked_social_accounts_user_id_foreign` (`user_id`),
  ADD KEY `linked_social_accounts_provider_index` (`provider`),
  ADD KEY `linked_social_accounts_provider_id_index` (`provider_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occasions`
--
ALTER TABLE `occasions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `occasions_name_unique` (`name`),
  ADD UNIQUE KEY `occasions_slug_unique` (`slug`),
  ADD KEY `occasions_created_by_index` (`created_by`),
  ADD KEY `occasions_updated_by_index` (`updated_by`);

--
-- Indexes for table `occasion_venue`
--
ALTER TABLE `occasion_venue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasion_venue_occasion_id_foreign` (`occasion_id`),
  ADD KEY `occasion_venue_venue_id_foreign` (`venue_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_venue_id_foreign` (`venue_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_category_id_foreign` (`category_id`),
  ADD KEY `orders_occasion_id_foreign` (`occasion_id`),
  ADD KEY `orders_start_date_index` (`start_date`),
  ADD KEY `orders_end_date_index` (`end_date`),
  ADD KEY `orders_capacity_index` (`capacity`),
  ADD KEY `orders_price_type_index` (`price_type`),
  ADD KEY `orders_net_total_price_index` (`net_total_price`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_name_unique` (`name`),
  ADD UNIQUE KEY `organizations_email_unique` (`email`),
  ADD KEY `organizations_slug_index` (`slug`),
  ADD KEY `organizations_multiple_properties_index` (`multiple_properties`),
  ADD KEY `organizations_creator_type_index` (`creator_type`),
  ADD KEY `organizations_updater_type_index` (`updater_type`),
  ADD KEY `organizations_created_by_index` (`created_by`),
  ADD KEY `organizations_updated_by_index` (`updated_by`);

--
-- Indexes for table `organization_user`
--
ALTER TABLE `organization_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_user_organization_id_foreign` (`organization_id`),
  ADD KEY `organization_user_user_id_foreign` (`user_id`);

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
-- Indexes for table `testmonials`
--
ALTER TABLE `testmonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_venue`
--
ALTER TABLE `user_venue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_venue_user_id_foreign` (`user_id`),
  ADD KEY `user_venue_venue_id_foreign` (`venue_id`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venues_organization_id_foreign` (`organization_id`),
  ADD KEY `venues_division_id_foreign` (`division_id`),
  ADD KEY `venues_district_id_foreign` (`district_id`),
  ADD KEY `venues_city_id_foreign` (`city_id`),
  ADD KEY `venues_name_index` (`name`),
  ADD KEY `venues_slug_index` (`slug`),
  ADD KEY `venues_price_type_index` (`price_type`),
  ADD KEY `venues_price_index` (`price`),
  ADD KEY `venues_capacity_index` (`capacity`),
  ADD KEY `venues_is_enabled_index` (`is_enabled`),
  ADD KEY `venues_creator_type_index` (`creator_type`),
  ADD KEY `venues_updater_type_index` (`updater_type`),
  ADD KEY `venues_created_by_index` (`created_by`),
  ADD KEY `venues_updated_by_index` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2053;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `amenity_venue`
--
ALTER TABLE `amenity_venue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category_venue`
--
ALTER TABLE `category_venue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_calendars`
--
ALTER TABLE `event_calendars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `linked_social_accounts`
--
ALTER TABLE `linked_social_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `occasions`
--
ALTER TABLE `occasions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `occasion_venue`
--
ALTER TABLE `occasion_venue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `organization_user`
--
ALTER TABLE `organization_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `testmonials`
--
ALTER TABLE `testmonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_venue`
--
ALTER TABLE `user_venue`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amenities`
--
ALTER TABLE `amenities`
  ADD CONSTRAINT `amenities_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `amenities_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `amenity_venue`
--
ALTER TABLE `amenity_venue`
  ADD CONSTRAINT `amenity_venue_amenity_id_foreign` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `amenity_venue_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `category_venue`
--
ALTER TABLE `category_venue`
  ADD CONSTRAINT `category_venue_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_venue_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cities_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `cities_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `districts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `divisions`
--
ALTER TABLE `divisions`
  ADD CONSTRAINT `divisions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `divisions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `event_calendars`
--
ALTER TABLE `event_calendars`
  ADD CONSTRAINT `event_calendars_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_calendars_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `event_calendars_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `linked_social_accounts`
--
ALTER TABLE `linked_social_accounts`
  ADD CONSTRAINT `linked_social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `occasions`
--
ALTER TABLE `occasions`
  ADD CONSTRAINT `occasions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `occasions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `occasion_venue`
--
ALTER TABLE `occasion_venue`
  ADD CONSTRAINT `occasion_venue_occasion_id_foreign` FOREIGN KEY (`occasion_id`) REFERENCES `occasions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `occasion_venue_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `orders_occasion_id_foreign` FOREIGN KEY (`occasion_id`) REFERENCES `occasions` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `organization_user`
--
ALTER TABLE `organization_user`
  ADD CONSTRAINT `organization_user_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `organization_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_venue`
--
ALTER TABLE `user_venue`
  ADD CONSTRAINT `user_venue_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_venue_venue_id_foreign` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `venues`
--
ALTER TABLE `venues`
  ADD CONSTRAINT `venues_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `venues_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `venues_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `venues_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
