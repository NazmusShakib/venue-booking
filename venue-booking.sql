-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 01, 2022 at 02:06 PM
-- Server version: 5.7.33
-- PHP Version: 8.1.3

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
(8, 0, 16, 'Calendar', 'fa-calendar', 'calendar', '*', '2022-06-29 10:27:37', '2022-07-01 06:52:37'),
(9, 0, 8, 'Category', 'fa-briefcase', 'categories', '*', '2022-07-01 06:44:36', '2022-07-01 06:52:37'),
(10, 0, 9, 'Occasion', 'fa-flag-o', 'occasions', '*', '2022-07-01 06:45:17', '2022-07-01 06:52:37'),
(11, 0, 10, 'Amenity', 'fa-certificate', 'amenities', '*', '2022-07-01 06:45:54', '2022-07-01 06:52:37'),
(12, 0, 11, 'Location', 'fa-road', '#', '*', '2022-07-01 06:46:32', '2022-07-01 06:52:37'),
(13, 12, 12, 'Division', 'fa-map-o', 'divisions', '*', '2022-07-01 06:48:47', '2022-07-01 06:52:37'),
(14, 12, 13, 'District', 'fa-map-marker', 'districts', '*', '2022-07-01 06:50:27', '2022-07-01 06:52:37'),
(15, 12, 14, 'City', 'fa-map-pin', 'cities', '*', '2022-07-01 06:50:51', '2022-07-01 06:52:37'),
(16, 0, 15, 'Venue', 'fa-venus', 'venues', '*', '2022-07-01 06:51:55', '2022-07-01 06:52:37');

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
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-06-24 23:31:56', '2022-06-24 23:31:56'),
(2, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-24 23:32:52', '2022-06-24 23:32:52'),
(3, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-24 23:32:53', '2022-06-24 23:32:53'),
(4, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-24 23:32:55', '2022-06-24 23:32:55'),
(5, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-24 23:32:56', '2022-06-24 23:32:56'),
(6, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-24 23:33:02', '2022-06-24 23:33:02'),
(7, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-06-29 10:05:13', '2022-06-29 10:05:13'),
(8, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:27:14', '2022-06-29 10:27:14'),
(9, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:27:16', '2022-06-29 10:27:16'),
(10, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Calendar\",\"icon\":\"fa-calendar\",\"uri\":\"calendar\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"p4QsStF9HoPWqXLyVFYPVuZaGiJd5bIsjPJd6a8G\"}', '2022-06-29 10:27:37', '2022-06-29 10:27:37'),
(11, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-06-29 10:27:37', '2022-06-29 10:27:37'),
(12, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"p4QsStF9HoPWqXLyVFYPVuZaGiJd5bIsjPJd6a8G\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8}]\"}', '2022-06-29 10:27:46', '2022-06-29 10:27:46'),
(13, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:27:46', '2022-06-29 10:27:46'),
(14, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-06-29 10:27:48', '2022-06-29 10:27:48'),
(15, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:27:52', '2022-06-29 10:27:52'),
(16, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-06-29 10:27:53', '2022-06-29 10:27:53'),
(17, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-06-29 10:28:22', '2022-06-29 10:28:22'),
(18, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:28:25', '2022-06-29 10:28:25'),
(19, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:33:41', '2022-06-29 10:33:41'),
(20, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:35:19', '2022-06-29 10:35:19'),
(21, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:35:24', '2022-06-29 10:35:24'),
(22, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:35:28', '2022-06-29 10:35:28'),
(23, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:35:31', '2022-06-29 10:35:31'),
(24, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:35:53', '2022-06-29 10:35:53'),
(25, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:37:01', '2022-06-29 10:37:01'),
(26, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:37:14', '2022-06-29 10:37:14'),
(27, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-06-29 10:37:25', '2022-06-29 10:37:25'),
(28, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-06-29 10:37:30', '2022-06-29 10:37:30'),
(29, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:37:32', '2022-06-29 10:37:32'),
(30, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:48:34', '2022-06-29 10:48:34'),
(31, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:51:26', '2022-06-29 10:51:26'),
(32, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:52:07', '2022-06-29 10:52:07'),
(33, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-06-29 10:53:35', '2022-06-29 10:53:35'),
(34, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 06:43:50', '2022-07-01 06:43:50'),
(35, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:43:57', '2022-07-01 06:43:57'),
(36, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Category\",\"icon\":\"fa-briefcase\",\"uri\":\"categories\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:44:36', '2022-07-01 06:44:36'),
(37, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:44:36', '2022-07-01 06:44:36'),
(38, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Occasion\",\"icon\":\"fa-flag-o\",\"uri\":\"occasions\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:45:17', '2022-07-01 06:45:17'),
(39, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:45:17', '2022-07-01 06:45:17'),
(40, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Amenity\",\"icon\":\"fa-certificate\",\"uri\":\"amenities\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:45:54', '2022-07-01 06:45:54'),
(41, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:45:54', '2022-07-01 06:45:54'),
(42, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Location\",\"icon\":\"fa-road\",\"uri\":\"#\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:46:32', '2022-07-01 06:46:32'),
(43, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:46:33', '2022-07-01 06:46:33'),
(44, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"Division\",\"icon\":\"fa-map-marker\",\"uri\":\"divisions\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:48:47', '2022-07-01 06:48:47'),
(45, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:48:47', '2022-07-01 06:48:47'),
(46, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"District\",\"icon\":\"fa-map-marker\",\"uri\":\"districts\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:50:27', '2022-07-01 06:50:27'),
(47, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:50:27', '2022-07-01 06:50:27'),
(48, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"City\",\"icon\":\"fa-map-pin\",\"uri\":\"cities\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:50:51', '2022-07-01 06:50:51'),
(49, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:50:52', '2022-07-01 06:50:52'),
(50, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:50:56', '2022-07-01 06:50:56'),
(51, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"Division\",\"icon\":\"fa-map-o\",\"uri\":\"divisions\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}', '2022-07-01 06:51:07', '2022-07-01 06:51:07'),
(52, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:51:07', '2022-07-01 06:51:07'),
(53, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Venue\",\"icon\":\"fa-venus\",\"uri\":\"venues\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\"}', '2022-07-01 06:51:55', '2022-07-01 06:51:55'),
(54, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:51:55', '2022-07-01 06:51:55'),
(55, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":14},{\\\"id\\\":15}]},{\\\"id\\\":16},{\\\"id\\\":8}]\"}', '2022-07-01 06:52:37', '2022-07-01 06:52:37'),
(56, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:52:38', '2022-07-01 06:52:38'),
(57, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2022-07-01 06:52:41', '2022-07-01 06:52:41'),
(58, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:52:47', '2022-07-01 06:52:47'),
(59, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:52:49', '2022-07-01 06:52:49'),
(60, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:52:50', '2022-07-01 06:52:50'),
(61, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:52:53', '2022-07-01 06:52:53'),
(62, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:52:54', '2022-07-01 06:52:54'),
(63, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:52:55', '2022-07-01 06:52:55'),
(64, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:53:01', '2022-07-01 06:53:01'),
(65, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:53:01', '2022-07-01 06:53:01'),
(66, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:53:04', '2022-07-01 06:53:04'),
(67, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:53:05', '2022-07-01 06:53:05'),
(68, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:53:06', '2022-07-01 06:53:06'),
(69, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:53:08', '2022-07-01 06:53:08'),
(70, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:53:10', '2022-07-01 06:53:10'),
(71, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:55:10', '2022-07-01 06:55:10'),
(72, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:55:14', '2022-07-01 06:55:14'),
(73, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:55:15', '2022-07-01 06:55:15'),
(74, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:55:19', '2022-07-01 06:55:19'),
(75, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 06:55:28', '2022-07-01 06:55:28'),
(76, 1, 'admin/amenities', 'GET', '127.0.0.1', '[]', '2022-07-01 06:55:30', '2022-07-01 06:55:30'),
(77, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 07:02:53', '2022-07-01 07:02:53'),
(78, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 07:02:55', '2022-07-01 07:02:55'),
(79, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 07:54:16', '2022-07-01 07:54:16'),
(80, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 07:54:17', '2022-07-01 07:54:17'),
(81, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 07:54:18', '2022-07-01 07:54:18'),
(82, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 07:55:03', '2022-07-01 07:55:03'),
(83, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 07:55:08', '2022-07-01 07:55:08'),
(84, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"ffdfd\",\"remarks\":\"fdfddf\",\"created_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 07:55:12', '2022-07-01 07:55:12'),
(85, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 07:55:12', '2022-07-01 07:55:12'),
(86, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:00:57', '2022-07-01 08:00:57'),
(87, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"name\":\"ffdfddsdssd\",\"remarks\":\"fdfddfdssdsd\",\"updated_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 08:01:00', '2022-07-01 08:01:00'),
(88, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:01', '2022-07-01 08:01:01'),
(89, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:03', '2022-07-01 08:01:03'),
(90, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:05', '2022-07-01 08:01:05'),
(91, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"dsds\",\"remarks\":\"sddsds\",\"created_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 08:01:08', '2022-07-01 08:01:08'),
(92, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:08', '2022-07-01 08:01:08'),
(93, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:11', '2022-07-01 08:01:11'),
(94, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:12', '2022-07-01 08:01:12'),
(95, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"dsdsds\",\"remarks\":\"dsdssd\",\"created_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/amenities\"}', '2022-07-01 08:01:15', '2022-07-01 08:01:15'),
(96, 1, 'admin/amenities', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:15', '2022-07-01 08:01:15'),
(97, 1, 'admin/amenities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:17', '2022-07-01 08:01:17'),
(98, 1, 'admin/amenities/1', 'PUT', '127.0.0.1', '{\"name\":\"dsdsdsdsds\",\"remarks\":\"dsdssddsds\",\"updated_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/amenities\"}', '2022-07-01 08:01:20', '2022-07-01 08:01:20'),
(99, 1, 'admin/amenities', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:20', '2022-07-01 08:01:20'),
(100, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:26', '2022-07-01 08:01:26'),
(101, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:28', '2022-07-01 08:01:28'),
(102, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"dsds\",\"created_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 08:01:31', '2022-07-01 08:01:31'),
(103, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:31', '2022-07-01 08:01:31'),
(104, 1, 'admin/divisions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:34', '2022-07-01 08:01:34'),
(105, 1, 'admin/divisions/1', 'PUT', '127.0.0.1', '{\"name\":\"dsdsds\",\"updated_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 08:01:36', '2022-07-01 08:01:36'),
(106, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:36', '2022-07-01 08:01:36'),
(107, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:38', '2022-07-01 08:01:38'),
(108, 1, 'admin/districts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:40', '2022-07-01 08:01:40'),
(109, 1, 'admin/districts', 'POST', '127.0.0.1', '{\"name\":\"dssd\",\"created_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/districts\"}', '2022-07-01 08:01:42', '2022-07-01 08:01:42'),
(110, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:43', '2022-07-01 08:01:43'),
(111, 1, 'admin/districts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:43', '2022-07-01 08:01:43'),
(112, 1, 'admin/districts', 'POST', '127.0.0.1', '{\"name\":\"dsds\",\"created_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/districts\"}', '2022-07-01 08:01:46', '2022-07-01 08:01:46'),
(113, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:46', '2022-07-01 08:01:46'),
(114, 1, 'admin/districts/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:48', '2022-07-01 08:01:48'),
(115, 1, 'admin/districts/2', 'PUT', '127.0.0.1', '{\"name\":\"dsdsdsdsds\",\"updated_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/districts\"}', '2022-07-01 08:01:50', '2022-07-01 08:01:50'),
(116, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:50', '2022-07-01 08:01:50'),
(117, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:53', '2022-07-01 08:01:53'),
(118, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:01:55', '2022-07-01 08:01:55'),
(119, 1, 'admin/cities', 'POST', '127.0.0.1', '{\"name\":\"dsdsds\",\"created_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/cities\"}', '2022-07-01 08:01:57', '2022-07-01 08:01:57'),
(120, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2022-07-01 08:01:58', '2022-07-01 08:01:58'),
(121, 1, 'admin/cities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:02:00', '2022-07-01 08:02:00'),
(122, 1, 'admin/cities/1', 'PUT', '127.0.0.1', '{\"name\":\"dsdsdsdsds\",\"updated_by\":\"1\",\"_token\":\"acFbHs5G26D8NsCONjCzFfnS9Gx6ACeSvfxiIrzz\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/cities\"}', '2022-07-01 08:02:02', '2022-07-01 08:02:02'),
(123, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2022-07-01 08:02:02', '2022-07-01 08:02:02'),
(124, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:02:04', '2022-07-01 08:02:04'),
(125, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 08:03:12', '2022-07-01 08:03:12'),
(126, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 08:03:46', '2022-07-01 08:03:46'),
(127, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 08:04:05', '2022-07-01 08:04:05'),
(128, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 08:04:25', '2022-07-01 08:04:25'),
(129, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 08:04:33', '2022-07-01 08:04:33'),
(130, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 08:05:08', '2022-07-01 08:05:08'),
(131, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:05:15', '2022-07-01 08:05:15'),
(132, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:05:16', '2022-07-01 08:05:16'),
(133, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 08:05:27', '2022-07-01 08:05:27'),
(134, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 08:05:41', '2022-07-01 08:05:41'),
(135, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:05:48', '2022-07-01 08:05:48'),
(136, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:05:49', '2022-07-01 08:05:49'),
(137, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 08:05:50', '2022-07-01 08:05:50'),
(138, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-07-01 08:05:53', '2022-07-01 08:05:53');

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
(1, 16, NULL, NULL);

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
(1, 'admin', '$2y$10$q4kYyUrvB2vtgeqdNbVHyuOabPfe47uad1yBauFQ7JKtItVjzuS1m', 'Administrator', NULL, 'bmN8r9BWkH91W0wXgrHtbjOHi5CEAgSQJhHCXHORHqSJBKanOmmmFZtTNvOI', '2022-06-24 23:30:05', '2022-06-24 23:30:05');

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
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'dsdsdsdsds', 'dsdssddsds', 1, 1, '2022-07-01 08:01:15', '2022-07-01 08:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'ffdfddsdssd', 'fdfddfdssdsd', 1, 1, '2022-07-01 07:55:12', '2022-07-01 08:01:00');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'dsdsdsdsds', 1, 1, '2022-07-01 08:01:57', '2022-07-01 08:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'dssd', 1, NULL, '2022-07-01 08:01:42', '2022-07-01 08:01:42'),
(2, 'dsdsdsdsds', 1, 1, '2022-07-01 08:01:46', '2022-07-01 08:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'dsdsds', 1, 1, '2022-07-01 08:01:31', '2022-07-01 08:01:36');

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
(24, '2022_07_01_115351_create_districts_table', 2),
(25, '2022_07_01_115635_create_cities_table', 2),
(27, '2022_07_01_115642_create_venues_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `occasions`
--

CREATE TABLE `occasions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `occasions`
--

INSERT INTO `occasions` (`id`, `name`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'dsds', 'sddsds', 1, NULL, '2022-07-01 08:01:08', '2022-07-01 08:01:08');

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
(7, 'App\\Models\\User', 1, 'abdulawalbd121@gmail.com_Token', 'fcaac11b584bb3b1ce29634db5d496fa245e61cebc3679597a3e17098dc9acc2', '[\"*\"]', NULL, '2022-06-30 01:13:29', '2022-06-30 01:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'sasas', 'admin', 'abdulawalbd121@gmail.com', NULL, '$2y$10$VTsL3Mk.182VVXgEon6WMusPr/CvVWw8EML7W4Q3vnK12Cv76MbD6', NULL, '2022-06-27 23:19:30', '2022-06-27 23:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `featured_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `additional_info` text COLLATE utf8mb4_unicode_ci,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `occasion_id` bigint(20) UNSIGNED NOT NULL,
  `amenity_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD KEY `amenities_created_by_index` (`created_by`),
  ADD KEY `amenities_updated_by_index` (`updated_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD KEY `categories_created_by_index` (`created_by`),
  ADD KEY `categories_updated_by_index` (`updated_by`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_name_unique` (`name`),
  ADD KEY `cities_created_by_index` (`created_by`),
  ADD KEY `cities_updated_by_index` (`updated_by`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `districts_name_unique` (`name`),
  ADD KEY `districts_created_by_index` (`created_by`),
  ADD KEY `districts_updated_by_index` (`updated_by`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `divisions_name_unique` (`name`),
  ADD KEY `divisions_created_by_index` (`created_by`),
  ADD KEY `divisions_updated_by_index` (`updated_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
  ADD KEY `occasions_created_by_index` (`created_by`),
  ADD KEY `occasions_updated_by_index` (`updated_by`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venues_category_id_foreign` (`category_id`),
  ADD KEY `venues_occasion_id_foreign` (`occasion_id`),
  ADD KEY `venues_amenity_id_foreign` (`amenity_id`),
  ADD KEY `venues_division_id_foreign` (`division_id`),
  ADD KEY `venues_district_id_foreign` (`district_id`),
  ADD KEY `venues_city_id_foreign` (`city_id`),
  ADD KEY `venues_name_index` (`name`),
  ADD KEY `venues_slug_index` (`slug`),
  ADD KEY `venues_is_enabled_index` (`is_enabled`),
  ADD KEY `venues_created_by_index` (`created_by`),
  ADD KEY `venues_updated_by_index` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `occasions`
--
ALTER TABLE `occasions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cities_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `districts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `divisions`
--
ALTER TABLE `divisions`
  ADD CONSTRAINT `divisions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `divisions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `occasions`
--
ALTER TABLE `occasions`
  ADD CONSTRAINT `occasions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `occasions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `venues`
--
ALTER TABLE `venues`
  ADD CONSTRAINT `venues_amenity_id_foreign` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`),
  ADD CONSTRAINT `venues_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `venues_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `venues_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `venues_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `venues_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `venues_occasion_id_foreign` FOREIGN KEY (`occasion_id`) REFERENCES `occasions` (`id`),
  ADD CONSTRAINT `venues_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
