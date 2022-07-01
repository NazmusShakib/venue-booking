-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 01, 2022 at 06:24 PM
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
(138, 1, 'admin/calendar', 'GET', '127.0.0.1', '[]', '2022-07-01 08:05:53', '2022-07-01 08:05:53'),
(139, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2022-07-01 10:57:16', '2022-07-01 10:57:16'),
(140, 1, 'admin', 'GET', '127.0.0.1', '[]', '2022-07-01 10:57:17', '2022-07-01 10:57:17'),
(141, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 10:57:27', '2022-07-01 10:57:27'),
(142, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 10:57:33', '2022-07-01 10:57:33'),
(143, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"name\":\"Restaurant\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 10:58:24', '2022-07-01 10:58:24'),
(144, 1, 'admin/categories/1/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 10:58:25', '2022-07-01 10:58:25'),
(145, 1, 'admin/categories/1', 'PUT', '127.0.0.1', '{\"name\":\"Restaurant\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\"}', '2022-07-01 10:59:55', '2022-07-01 10:59:55'),
(146, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 10:59:55', '2022-07-01 10:59:55'),
(147, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 10:59:58', '2022-07-01 10:59:58'),
(148, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Banquet Hall\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 11:00:10', '2022-07-01 11:00:10'),
(149, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 11:00:10', '2022-07-01 11:00:10'),
(150, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:00:12', '2022-07-01 11:00:12'),
(151, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Banquet With Lawn\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 11:00:24', '2022-07-01 11:00:24'),
(152, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:00:24', '2022-07-01 11:00:24'),
(153, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Farmhouse\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\"}', '2022-07-01 11:00:37', '2022-07-01 11:00:37'),
(154, 1, 'admin/categories/4/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:00:37', '2022-07-01 11:00:37'),
(155, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:00:49', '2022-07-01 11:00:49'),
(156, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:00:53', '2022-07-01 11:00:53'),
(157, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Gaming Zone\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 11:00:55', '2022-07-01 11:00:55'),
(158, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 11:00:56', '2022-07-01 11:00:56'),
(159, 1, 'admin/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:00:57', '2022-07-01 11:00:57'),
(160, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Resort\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 11:01:08', '2022-07-01 11:01:08'),
(161, 1, 'admin/categories/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:01:09', '2022-07-01 11:01:09'),
(162, 1, 'admin/categories/6', 'PUT', '127.0.0.1', '{\"name\":\"Lawn\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\\/create\"}', '2022-07-01 11:01:18', '2022-07-01 11:01:18'),
(163, 1, 'admin/categories/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:01:19', '2022-07-01 11:01:19'),
(164, 1, 'admin/categories/6', 'PUT', '127.0.0.1', '{\"name\":\"Hotel\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\"}', '2022-07-01 11:01:30', '2022-07-01 11:01:30'),
(165, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 11:01:31', '2022-07-01 11:01:31'),
(166, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:02:21', '2022-07-01 11:02:21'),
(167, 1, 'admin/occasions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:02:23', '2022-07-01 11:02:23'),
(168, 1, 'admin/occasions/1', 'PUT', '127.0.0.1', '{\"name\":\"Wedding\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:02:27', '2022-07-01 11:02:27'),
(169, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:02:27', '2022-07-01 11:02:27'),
(170, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:02:29', '2022-07-01 11:02:29'),
(171, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Engagement\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:02:38', '2022-07-01 11:02:38'),
(172, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:02:38', '2022-07-01 11:02:38'),
(173, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:02:45', '2022-07-01 11:02:45'),
(174, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Reception\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:02:48', '2022-07-01 11:02:48'),
(175, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:02:49', '2022-07-01 11:02:49'),
(176, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:02:53', '2022-07-01 11:02:53'),
(177, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Birthday Party\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:02:56', '2022-07-01 11:02:56'),
(178, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:02:56', '2022-07-01 11:02:56'),
(179, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:03:01', '2022-07-01 11:03:01'),
(180, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"First Birthday Party\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:03:04', '2022-07-01 11:03:04'),
(181, 1, 'admin/occasions/5/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:03:04', '2022-07-01 11:03:04'),
(182, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:05:12', '2022-07-01 11:05:12'),
(183, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:05:14', '2022-07-01 11:05:14'),
(184, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Social Gathering\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:05:21', '2022-07-01 11:05:21'),
(185, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:05:21', '2022-07-01 11:05:21'),
(186, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Corporate Party\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\\/create\"}', '2022-07-01 11:05:28', '2022-07-01 11:05:28'),
(187, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:05:28', '2022-07-01 11:05:28'),
(188, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Anniversary\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-07-01 11:05:33', '2022-07-01 11:05:33'),
(189, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:05:34', '2022-07-01 11:05:34'),
(190, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Cocktail Party\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-07-01 11:05:39', '2022-07-01 11:05:39'),
(191, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:05:40', '2022-07-01 11:05:40'),
(192, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Bachelor Party\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-07-01 11:05:46', '2022-07-01 11:05:46'),
(193, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:05:46', '2022-07-01 11:05:46'),
(194, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Pool Party\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-07-01 11:05:52', '2022-07-01 11:05:52'),
(195, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:05:52', '2022-07-01 11:05:52'),
(196, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Party\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-07-01 11:05:59', '2022-07-01 11:05:59'),
(197, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:05:59', '2022-07-01 11:05:59'),
(198, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Kids Party\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-07-01 11:06:05', '2022-07-01 11:06:05'),
(199, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:06:06', '2022-07-01 11:06:06'),
(200, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Team Building\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2022-07-01 11:06:11', '2022-07-01 11:06:11'),
(201, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:06:11', '2022-07-01 11:06:11'),
(202, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Meeting\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\"}', '2022-07-01 11:06:16', '2022-07-01 11:06:16'),
(203, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:06:16', '2022-07-01 11:06:16'),
(204, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:06:20', '2022-07-01 11:06:20'),
(205, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Conference\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:06:25', '2022-07-01 11:06:25'),
(206, 1, 'admin/occasions/7/edit', 'GET', '127.0.0.1', '[]', '2022-07-01 11:06:26', '2022-07-01 11:06:26'),
(207, 1, 'admin/occasions/7', 'PUT', '127.0.0.1', '{\"name\":\"Exhibition\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\\/create\"}', '2022-07-01 11:06:31', '2022-07-01 11:06:31'),
(208, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:06:31', '2022-07-01 11:06:31'),
(209, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:06:37', '2022-07-01 11:06:37'),
(210, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:06:40', '2022-07-01 11:06:40'),
(211, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:06:48', '2022-07-01 11:06:48'),
(212, 1, 'admin/occasions/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:07:27', '2022-07-01 11:07:27'),
(213, 1, 'admin/occasions/6', 'PUT', '127.0.0.1', '{\"name\":\"Social Gathering\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:07:30', '2022-07-01 11:07:30'),
(214, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:07:30', '2022-07-01 11:07:30'),
(215, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:07:32', '2022-07-01 11:07:32'),
(216, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:07:35', '2022-07-01 11:07:35'),
(217, 1, 'admin/occasions/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:07:42', '2022-07-01 11:07:42'),
(218, 1, 'admin/occasions/7', 'PUT', '127.0.0.1', '{\"name\":\"Corporate Party\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:07:45', '2022-07-01 11:07:45'),
(219, 1, 'admin/occasions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:07:46', '2022-07-01 11:07:46'),
(220, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:07:47', '2022-07-01 11:07:47'),
(221, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Anniversary\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/occasions\"}', '2022-07-01 11:07:55', '2022-07-01 11:07:55'),
(222, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:07:56', '2022-07-01 11:07:56'),
(223, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Cocktail Party\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:03', '2022-07-01 11:08:03'),
(224, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:03', '2022-07-01 11:08:03'),
(225, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Bachelor Party\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:09', '2022-07-01 11:08:09'),
(226, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:10', '2022-07-01 11:08:10'),
(227, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Pool Party\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:16', '2022-07-01 11:08:16'),
(228, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:16', '2022-07-01 11:08:16'),
(229, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Party\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:23', '2022-07-01 11:08:23'),
(230, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:23', '2022-07-01 11:08:23'),
(231, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Kids Party\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:28', '2022-07-01 11:08:28'),
(232, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:29', '2022-07-01 11:08:29'),
(233, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Team Building\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:34', '2022-07-01 11:08:34'),
(234, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:35', '2022-07-01 11:08:35'),
(235, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Meeting\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:39', '2022-07-01 11:08:39'),
(236, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:40', '2022-07-01 11:08:40'),
(237, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Conference\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:45', '2022-07-01 11:08:45'),
(238, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:45', '2022-07-01 11:08:45'),
(239, 1, 'admin/occasions', 'POST', '127.0.0.1', '{\"name\":\"Exhibition\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:08:51', '2022-07-01 11:08:51'),
(240, 1, 'admin/occasions/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:08:52', '2022-07-01 11:08:52'),
(241, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:08:53', '2022-07-01 11:08:53'),
(242, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:09:13', '2022-07-01 11:09:13'),
(243, 1, 'admin/categories/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:09:33', '2022-07-01 11:09:33'),
(244, 1, 'admin/categories/6', 'PUT', '127.0.0.1', '{\"name\":\"Resort\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\"}', '2022-07-01 11:09:41', '2022-07-01 11:09:41'),
(245, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:09:41', '2022-07-01 11:09:41'),
(246, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Lawn\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/categories\\/6\\/edit\"}', '2022-07-01 11:09:46', '2022-07-01 11:09:46'),
(247, 1, 'admin/categories/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:09:46', '2022-07-01 11:09:46'),
(248, 1, 'admin/categories', 'POST', '127.0.0.1', '{\"name\":\"Hotel\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\"}', '2022-07-01 11:09:50', '2022-07-01 11:09:50'),
(249, 1, 'admin/categories', 'GET', '127.0.0.1', '[]', '2022-07-01 11:09:51', '2022-07-01 11:09:51'),
(250, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:09:56', '2022-07-01 11:09:56'),
(251, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:09:57', '2022-07-01 11:09:57'),
(252, 1, 'admin/amenities/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:10:00', '2022-07-01 11:10:00'),
(253, 1, 'admin/amenities/1', 'PUT', '127.0.0.1', '{\"name\":\"Outside Decorator Allowed\",\"remarks\":null,\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/amenities\"}', '2022-07-01 11:10:33', '2022-07-01 11:10:33'),
(254, 1, 'admin/amenities', 'GET', '127.0.0.1', '[]', '2022-07-01 11:10:34', '2022-07-01 11:10:34'),
(255, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:10:36', '2022-07-01 11:10:36'),
(256, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Inhouse Decorator Available\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/amenities\"}', '2022-07-01 11:10:50', '2022-07-01 11:10:50'),
(257, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:10:51', '2022-07-01 11:10:51'),
(258, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Swimming Pool\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:10:59', '2022-07-01 11:10:59'),
(259, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:11:00', '2022-07-01 11:11:00'),
(260, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Wheelchair Accessibility\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:11:09', '2022-07-01 11:11:09'),
(261, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:11:10', '2022-07-01 11:11:10'),
(262, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Inhouse Catering Available\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:11:18', '2022-07-01 11:11:18'),
(263, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:11:18', '2022-07-01 11:11:18'),
(264, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Full Bar Available\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:11:31', '2022-07-01 11:11:31'),
(265, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:11:31', '2022-07-01 11:11:31'),
(266, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Dedicated Dance Floor\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:11:40', '2022-07-01 11:11:40'),
(267, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:11:41', '2022-07-01 11:11:41'),
(268, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"A\\/V Equipment\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:11:51', '2022-07-01 11:11:51'),
(269, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:11:51', '2022-07-01 11:11:51'),
(270, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Play Area\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:12:04', '2022-07-01 11:12:04'),
(271, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:12:04', '2022-07-01 11:12:04'),
(272, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Rooms Available\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:12:14', '2022-07-01 11:12:14'),
(273, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:12:15', '2022-07-01 11:12:15'),
(274, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Hawan\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:12:28', '2022-07-01 11:12:28'),
(275, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:12:28', '2022-07-01 11:12:28'),
(276, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Mandap\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:12:36', '2022-07-01 11:12:36'),
(277, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:12:37', '2022-07-01 11:12:37'),
(278, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Baraat Allowed\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:12:47', '2022-07-01 11:12:47'),
(279, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:12:47', '2022-07-01 11:12:47'),
(280, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Outside Drinks Allowed\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:12:56', '2022-07-01 11:12:56'),
(281, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:12:56', '2022-07-01 11:12:56'),
(282, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Outside Catering Allowed\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:13:06', '2022-07-01 11:13:06'),
(283, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:13:06', '2022-07-01 11:13:06'),
(284, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Games\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:13:19', '2022-07-01 11:13:19'),
(285, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:13:19', '2022-07-01 11:13:19'),
(286, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Smoking Area\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:13:27', '2022-07-01 11:13:27'),
(287, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:13:28', '2022-07-01 11:13:28'),
(288, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Live Music\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:13:38', '2022-07-01 11:13:38'),
(289, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:13:38', '2022-07-01 11:13:38'),
(290, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Outdoor Space\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:13:46', '2022-07-01 11:13:46'),
(291, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:13:47', '2022-07-01 11:13:47'),
(292, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Roof Top\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:13:56', '2022-07-01 11:13:56'),
(293, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:13:57', '2022-07-01 11:13:57'),
(294, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Parking\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:14:08', '2022-07-01 11:14:08'),
(295, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:14:08', '2022-07-01 11:14:08'),
(296, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Lift\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:14:20', '2022-07-01 11:14:20'),
(297, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:14:20', '2022-07-01 11:14:20'),
(298, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"DJ Available\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:14:31', '2022-07-01 11:14:31'),
(299, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:14:32', '2022-07-01 11:14:32'),
(300, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Outdoor Games\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:14:41', '2022-07-01 11:14:41'),
(301, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:14:41', '2022-07-01 11:14:41'),
(302, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Catering\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:14:51', '2022-07-01 11:14:51'),
(303, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:14:52', '2022-07-01 11:14:52'),
(304, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Power Backup\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:15:00', '2022-07-01 11:15:00'),
(305, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:15:01', '2022-07-01 11:15:01'),
(306, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Indoor Only\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:15:09', '2022-07-01 11:15:09'),
(307, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:15:10', '2022-07-01 11:15:10'),
(308, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Kids Allowed\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:15:19', '2022-07-01 11:15:19'),
(309, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:15:19', '2022-07-01 11:15:19');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(310, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Air Condition\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:15:32', '2022-07-01 11:15:32'),
(311, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:15:33', '2022-07-01 11:15:33'),
(312, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Wifi\\/Internet\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:15:44', '2022-07-01 11:15:44'),
(313, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:15:45', '2022-07-01 11:15:45'),
(314, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Indoor & Outdoor\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:15:51', '2022-07-01 11:15:51'),
(315, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:15:52', '2022-07-01 11:15:52'),
(316, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Live Sports Screening\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:16:01', '2022-07-01 11:16:01'),
(317, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:16:01', '2022-07-01 11:16:01'),
(318, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Pool Table\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:16:10', '2022-07-01 11:16:10'),
(319, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:16:11', '2022-07-01 11:16:11'),
(320, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Live Screening\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:16:22', '2022-07-01 11:16:22'),
(321, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:16:22', '2022-07-01 11:16:22'),
(322, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Private Dining Room(s)\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"after-save\":\"2\"}', '2022-07-01 11:16:30', '2022-07-01 11:16:30'),
(323, 1, 'admin/amenities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 11:16:31', '2022-07-01 11:16:31'),
(324, 1, 'admin/amenities', 'POST', '127.0.0.1', '{\"name\":\"Presentation Area\\/Stage\",\"remarks\":null,\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\"}', '2022-07-01 11:16:39', '2022-07-01 11:16:39'),
(325, 1, 'admin/amenities', 'GET', '127.0.0.1', '[]', '2022-07-01 11:16:40', '2022-07-01 11:16:40'),
(326, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:17:12', '2022-07-01 11:17:12'),
(327, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:17:14', '2022-07-01 11:17:14'),
(328, 1, 'admin/divisions/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:17:19', '2022-07-01 11:17:19'),
(329, 1, 'admin/divisions/1', 'PUT', '127.0.0.1', '{\"name\":\"Dhaka\",\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:17:24', '2022-07-01 11:17:24'),
(330, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:17:25', '2022-07-01 11:17:25'),
(331, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:17:57', '2022-07-01 11:17:57'),
(332, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:18:11', '2022-07-01 11:18:11'),
(333, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:18:14', '2022-07-01 11:18:14'),
(334, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"Rajshahi\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:19:20', '2022-07-01 11:19:20'),
(335, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:19:20', '2022-07-01 11:19:20'),
(336, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:19:22', '2022-07-01 11:19:22'),
(337, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"Chittagong\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:19:30', '2022-07-01 11:19:30'),
(338, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:19:30', '2022-07-01 11:19:30'),
(339, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:19:38', '2022-07-01 11:19:38'),
(340, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"Sylhet\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:19:43', '2022-07-01 11:19:43'),
(341, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:19:43', '2022-07-01 11:19:43'),
(342, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:19:46', '2022-07-01 11:19:46'),
(343, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"Khulna\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:19:55', '2022-07-01 11:19:55'),
(344, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:19:55', '2022-07-01 11:19:55'),
(345, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:00', '2022-07-01 11:20:00'),
(346, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"Barisal\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:20:03', '2022-07-01 11:20:03'),
(347, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:20:03', '2022-07-01 11:20:03'),
(348, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:18', '2022-07-01 11:20:18'),
(349, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"Mymensingh\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:20:21', '2022-07-01 11:20:21'),
(350, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:20:21', '2022-07-01 11:20:21'),
(351, 1, 'admin/divisions/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:26', '2022-07-01 11:20:26'),
(352, 1, 'admin/divisions', 'POST', '127.0.0.1', '{\"name\":\"Rangpur\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/divisions\"}', '2022-07-01 11:20:29', '2022-07-01 11:20:29'),
(353, 1, 'admin/divisions', 'GET', '127.0.0.1', '[]', '2022-07-01 11:20:29', '2022-07-01 11:20:29'),
(354, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:32', '2022-07-01 11:20:32'),
(355, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:33', '2022-07-01 11:20:33'),
(356, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:34', '2022-07-01 11:20:34'),
(357, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:35', '2022-07-01 11:20:35'),
(358, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:35', '2022-07-01 11:20:35'),
(359, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:36', '2022-07-01 11:20:36'),
(360, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:36', '2022-07-01 11:20:36'),
(361, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:37', '2022-07-01 11:20:37'),
(362, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:38', '2022-07-01 11:20:38'),
(363, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:38', '2022-07-01 11:20:38'),
(364, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:43', '2022-07-01 11:20:43'),
(365, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:43', '2022-07-01 11:20:43'),
(366, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:20:44', '2022-07-01 11:20:44'),
(367, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:21:02', '2022-07-01 11:21:02'),
(368, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:21:03', '2022-07-01 11:21:03'),
(369, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:26:53', '2022-07-01 11:26:53'),
(370, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:26:54', '2022-07-01 11:26:54'),
(371, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:26:55', '2022-07-01 11:26:55'),
(372, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:27:59', '2022-07-01 11:27:59'),
(373, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:28:07', '2022-07-01 11:28:07'),
(374, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:28:08', '2022-07-01 11:28:08'),
(375, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:28:10', '2022-07-01 11:28:10'),
(376, 1, 'admin/districts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:31:52', '2022-07-01 11:31:52'),
(377, 1, 'admin/districts', 'POST', '127.0.0.1', '{\"division_id\":\"1\",\"name\":\"Dhaka\",\"created_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/districts\"}', '2022-07-01 11:32:00', '2022-07-01 11:32:00'),
(378, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 11:32:01', '2022-07-01 11:32:01'),
(379, 1, 'admin/districts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:32:41', '2022-07-01 11:32:41'),
(380, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:50:51', '2022-07-01 11:50:51'),
(381, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:50:52', '2022-07-01 11:50:52'),
(382, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:50:55', '2022-07-01 11:50:55'),
(383, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:50:58', '2022-07-01 11:50:58'),
(384, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:00', '2022-07-01 11:51:00'),
(385, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:01', '2022-07-01 11:51:01'),
(386, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:03', '2022-07-01 11:51:03'),
(387, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:04', '2022-07-01 11:51:04'),
(388, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:06', '2022-07-01 11:51:06'),
(389, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:10', '2022-07-01 11:51:10'),
(390, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:11', '2022-07-01 11:51:11'),
(391, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:12', '2022-07-01 11:51:12'),
(392, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:14', '2022-07-01 11:51:14'),
(393, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:14', '2022-07-01 11:51:14'),
(394, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:16', '2022-07-01 11:51:16'),
(395, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:35', '2022-07-01 11:51:35'),
(396, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:51:36', '2022-07-01 11:51:36'),
(397, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:55:29', '2022-07-01 11:55:29'),
(398, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:55:30', '2022-07-01 11:55:30'),
(399, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:56:08', '2022-07-01 11:56:08'),
(400, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:56:09', '2022-07-01 11:56:09'),
(401, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:34', '2022-07-01 11:57:34'),
(402, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:36', '2022-07-01 11:57:36'),
(403, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:38', '2022-07-01 11:57:38'),
(404, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:39', '2022-07-01 11:57:39'),
(405, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:41', '2022-07-01 11:57:41'),
(406, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:43', '2022-07-01 11:57:43'),
(407, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:46', '2022-07-01 11:57:46'),
(408, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:52', '2022-07-01 11:57:52'),
(409, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:55', '2022-07-01 11:57:55'),
(410, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:56', '2022-07-01 11:57:56'),
(411, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:57:57', '2022-07-01 11:57:57'),
(412, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:58:04', '2022-07-01 11:58:04'),
(413, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:58:06', '2022-07-01 11:58:06'),
(414, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 11:58:06', '2022-07-01 11:58:06'),
(415, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:05:54', '2022-07-01 12:05:54'),
(416, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:07:12', '2022-07-01 12:07:12'),
(417, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:07:17', '2022-07-01 12:07:17'),
(418, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 12:07:36', '2022-07-01 12:07:36'),
(419, 1, 'admin/districts', 'GET', '127.0.0.1', '[]', '2022-07-01 12:08:10', '2022-07-01 12:08:10'),
(420, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:08:57', '2022-07-01 12:08:57'),
(421, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2022-07-01 12:10:22', '2022-07-01 12:10:22'),
(422, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"district_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:10:27', '2022-07-01 12:10:27'),
(423, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"district_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:10:29', '2022-07-01 12:10:29'),
(424, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"district_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:10:31', '2022-07-01 12:10:31'),
(425, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"district_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:10:32', '2022-07-01 12:10:32'),
(426, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:10:34', '2022-07-01 12:10:34'),
(427, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:10:36', '2022-07-01 12:10:36'),
(428, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:11:02', '2022-07-01 12:11:02'),
(429, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:12:29', '2022-07-01 12:12:29'),
(430, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:12:30', '2022-07-01 12:12:30'),
(431, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:12:32', '2022-07-01 12:12:32'),
(432, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:15:17', '2022-07-01 12:15:17'),
(433, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"dsds\",\"division_id\":\"Chattagram\"}', '2022-07-01 12:15:23', '2022-07-01 12:15:23'),
(434, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"dsds\",\"division_id\":\"Rajshahi\"}', '2022-07-01 12:15:27', '2022-07-01 12:15:27'),
(435, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"name\":\"dsds\",\"division_id\":\"Rajshahi\"}', '2022-07-01 12:16:36', '2022-07-01 12:16:36'),
(436, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"name\":\"dsds\",\"division_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:16:44', '2022-07-01 12:16:44'),
(437, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":\"dsds\",\"division_id\":\"1\"}', '2022-07-01 12:16:45', '2022-07-01 12:16:45'),
(438, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"division_id\":\"1\"}', '2022-07-01 12:16:48', '2022-07-01 12:16:48'),
(439, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"division_id\":\"2\"}', '2022-07-01 12:16:52', '2022-07-01 12:16:52'),
(440, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:17:56', '2022-07-01 12:17:56'),
(441, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"name\":null,\"division_id\":\"2\"}', '2022-07-01 12:17:57', '2022-07-01 12:17:57'),
(442, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"name\":null,\"division_id\":\"2\"}', '2022-07-01 12:18:13', '2022-07-01 12:18:13'),
(443, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:18:19', '2022-07-01 12:18:19'),
(444, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"name\":null,\"district_id\":\"16\"}', '2022-07-01 12:18:29', '2022-07-01 12:18:29'),
(445, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:18:38', '2022-07-01 12:18:38'),
(446, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:18:48', '2022-07-01 12:18:48'),
(447, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:18:51', '2022-07-01 12:18:51'),
(448, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:18:55', '2022-07-01 12:18:55'),
(449, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:18:58', '2022-07-01 12:18:58'),
(450, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:19:00', '2022-07-01 12:19:00'),
(451, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:19:01', '2022-07-01 12:19:01'),
(452, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:19:28', '2022-07-01 12:19:28'),
(453, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:19:39', '2022-07-01 12:19:39'),
(454, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:19:40', '2022-07-01 12:19:40'),
(455, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:21:00', '2022-07-01 12:21:00'),
(456, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:21:24', '2022-07-01 12:21:24'),
(457, 1, 'admin/districts/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:21:26', '2022-07-01 12:21:26'),
(458, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:21:36', '2022-07-01 12:21:36'),
(459, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:21:38', '2022-07-01 12:21:38'),
(460, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:22:26', '2022-07-01 12:22:26'),
(461, 1, 'admin/cities/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:22:28', '2022-07-01 12:22:28'),
(462, 1, 'admin/cities/create', 'GET', '127.0.0.1', '[]', '2022-07-01 12:22:52', '2022-07-01 12:22:52'),
(463, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:17', '2022-07-01 12:23:17'),
(464, 1, 'admin/cities/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:20', '2022-07-01 12:23:20'),
(465, 1, 'admin/cities/2', 'PUT', '127.0.0.1', '{\"district_id\":\"1\",\"name\":\"Barura\",\"updated_by\":\"1\",\"_token\":\"PyLi8KIKgigDmMHNWUUC8mtSVpD4fXHIk4eKNcYr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/cities\"}', '2022-07-01 12:23:23', '2022-07-01 12:23:23'),
(466, 1, 'admin/cities', 'GET', '127.0.0.1', '[]', '2022-07-01 12:23:23', '2022-07-01 12:23:23'),
(467, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:29', '2022-07-01 12:23:29'),
(468, 1, 'admin/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:31', '2022-07-01 12:23:31'),
(469, 1, 'admin/occasions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:32', '2022-07-01 12:23:32'),
(470, 1, 'admin/amenities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:33', '2022-07-01 12:23:33'),
(471, 1, 'admin/divisions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:34', '2022-07-01 12:23:34'),
(472, 1, 'admin/districts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:35', '2022-07-01 12:23:35'),
(473, 1, 'admin/cities', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:36', '2022-07-01 12:23:36'),
(474, 1, 'admin/venues', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:41', '2022-07-01 12:23:41'),
(475, 1, 'admin/calendar', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:43', '2022-07-01 12:23:43'),
(476, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:45', '2022-07-01 12:23:45'),
(477, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:46', '2022-07-01 12:23:46'),
(478, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:47', '2022-07-01 12:23:47'),
(479, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2022-07-01 12:23:47', '2022-07-01 12:23:47');

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
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Outside Decorator Allowed', NULL, 1, 1, '2022-07-01 08:01:15', '2022-07-01 11:10:33'),
(2, 'Inhouse Decorator Available', NULL, 1, NULL, '2022-07-01 11:10:50', '2022-07-01 11:10:50'),
(3, 'Swimming Pool', NULL, 1, NULL, '2022-07-01 11:10:59', '2022-07-01 11:10:59'),
(4, 'Wheelchair Accessibility', NULL, 1, NULL, '2022-07-01 11:11:09', '2022-07-01 11:11:09'),
(5, 'Inhouse Catering Available', NULL, 1, NULL, '2022-07-01 11:11:18', '2022-07-01 11:11:18'),
(6, 'Full Bar Available', NULL, 1, NULL, '2022-07-01 11:11:31', '2022-07-01 11:11:31'),
(7, 'Dedicated Dance Floor', NULL, 1, NULL, '2022-07-01 11:11:40', '2022-07-01 11:11:40'),
(8, 'A/V Equipment', NULL, 1, NULL, '2022-07-01 11:11:51', '2022-07-01 11:11:51'),
(9, 'Play Area', NULL, 1, NULL, '2022-07-01 11:12:04', '2022-07-01 11:12:04'),
(10, 'Rooms Available', NULL, 1, NULL, '2022-07-01 11:12:14', '2022-07-01 11:12:14'),
(11, 'Hawan', NULL, 1, NULL, '2022-07-01 11:12:28', '2022-07-01 11:12:28'),
(12, 'Mandap', NULL, 1, NULL, '2022-07-01 11:12:36', '2022-07-01 11:12:36'),
(13, 'Baraat Allowed', NULL, 1, NULL, '2022-07-01 11:12:47', '2022-07-01 11:12:47'),
(14, 'Outside Drinks Allowed', NULL, 1, NULL, '2022-07-01 11:12:56', '2022-07-01 11:12:56'),
(15, 'Outside Catering Allowed', NULL, 1, NULL, '2022-07-01 11:13:06', '2022-07-01 11:13:06'),
(16, 'Games', NULL, 1, NULL, '2022-07-01 11:13:19', '2022-07-01 11:13:19'),
(17, 'Smoking Area', NULL, 1, NULL, '2022-07-01 11:13:27', '2022-07-01 11:13:27'),
(18, 'Live Music', NULL, 1, NULL, '2022-07-01 11:13:38', '2022-07-01 11:13:38'),
(19, 'Outdoor Space', NULL, 1, NULL, '2022-07-01 11:13:46', '2022-07-01 11:13:46'),
(20, 'Roof Top', NULL, 1, NULL, '2022-07-01 11:13:56', '2022-07-01 11:13:56'),
(21, 'Parking', NULL, 1, NULL, '2022-07-01 11:14:08', '2022-07-01 11:14:08'),
(22, 'Lift', NULL, 1, NULL, '2022-07-01 11:14:20', '2022-07-01 11:14:20'),
(23, 'DJ Available', NULL, 1, NULL, '2022-07-01 11:14:31', '2022-07-01 11:14:31'),
(24, 'Outdoor Games', NULL, 1, NULL, '2022-07-01 11:14:41', '2022-07-01 11:14:41'),
(25, 'Catering', NULL, 1, NULL, '2022-07-01 11:14:51', '2022-07-01 11:14:51'),
(26, 'Power Backup', NULL, 1, NULL, '2022-07-01 11:15:00', '2022-07-01 11:15:00'),
(27, 'Indoor Only', NULL, 1, NULL, '2022-07-01 11:15:09', '2022-07-01 11:15:09'),
(28, 'Kids Allowed', NULL, 1, NULL, '2022-07-01 11:15:19', '2022-07-01 11:15:19'),
(29, 'Air Condition', NULL, 1, NULL, '2022-07-01 11:15:32', '2022-07-01 11:15:32'),
(30, 'Wifi/Internet', NULL, 1, NULL, '2022-07-01 11:15:44', '2022-07-01 11:15:44'),
(31, 'Indoor & Outdoor', NULL, 1, NULL, '2022-07-01 11:15:52', '2022-07-01 11:15:52'),
(32, 'Live Sports Screening', NULL, 1, NULL, '2022-07-01 11:16:01', '2022-07-01 11:16:01'),
(33, 'Pool Table', NULL, 1, NULL, '2022-07-01 11:16:10', '2022-07-01 11:16:10'),
(34, 'Live Screening', NULL, 1, NULL, '2022-07-01 11:16:22', '2022-07-01 11:16:22'),
(35, 'Private Dining Room(s)', NULL, 1, NULL, '2022-07-01 11:16:30', '2022-07-01 11:16:30'),
(36, 'Presentation Area/Stage', NULL, 1, NULL, '2022-07-01 11:16:39', '2022-07-01 11:16:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Restaurant', NULL, 1, 1, '2022-07-01 07:55:12', '2022-07-01 10:59:55'),
(2, 'Banquet Hall', NULL, 1, NULL, '2022-07-01 11:00:10', '2022-07-01 11:00:10'),
(3, 'Banquet With Lawn', NULL, 1, NULL, '2022-07-01 11:00:24', '2022-07-01 11:00:24'),
(4, 'Farmhouse', NULL, 1, NULL, '2022-07-01 11:00:37', '2022-07-01 11:00:37'),
(5, 'Gaming Zone', NULL, 1, NULL, '2022-07-01 11:00:55', '2022-07-01 11:00:55'),
(6, 'Resort', NULL, 1, 1, '2022-07-01 11:01:09', '2022-07-01 11:09:41'),
(7, 'Lawn', NULL, 1, NULL, '2022-07-01 11:09:46', '2022-07-01 11:09:46'),
(8, 'Hotel', NULL, 1, NULL, '2022-07-01 11:09:50', '2022-07-01 11:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

INSERT INTO `cities` (`id`, `district_id`, `name`, `bn_name`, `url`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd', 1, 1, '2022-07-01 17:48:50', '2022-07-01 12:23:23'),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(12, 1, 'Meghna', 'মেঘনা', 'meghna.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(13, 1, 'Monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(15, 1, 'Titas', 'তিতাস', 'titas.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(21, 2, 'Fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(22, 2, 'Parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    ', 1, NULL, '2022-07-01 17:48:50', NULL),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(35, 4, 'Kawkhali', 'কাউখালী', 'kawkhali.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(37, 4, 'Barkal', 'বরকল', 'barkal.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(38, 4, 'Langadu', 'লংগদু', 'langadu.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(41, 4, 'Juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(42, 4, 'Naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(44, 5, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(47, 5, 'Subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(48, 5, 'Kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(49, 5, 'Senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(51, 5, 'Sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(70, 8, 'Banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(72, 8, 'Anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(74, 8, 'Satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(75, 8, 'Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(79, 8, 'Karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(80, 9, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(83, 9, 'Ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(85, 9, 'Pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(88, 10, 'Khagrachhari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(90, 10, 'Panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(91, 10, 'Laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(92, 10, 'Mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(93, 10, 'Manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(94, 10, 'Ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(105, 12, 'Chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(106, 12, 'Kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(108, 12, 'Raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(114, 13, 'Ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(120, 13, 'Santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(141, 15, 'Tanore', 'তানোর', 'tanore.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(148, 16, 'Gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(149, 16, 'Naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(160, 19, 'Mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(161, 19, 'Badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(162, 19, 'Patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(163, 19, 'Dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(164, 19, 'Niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(167, 19, 'Raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(171, 20, 'Manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(172, 20, 'Abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(173, 20, 'Bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(174, 20, 'Chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(175, 20, 'Jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(178, 20, 'Sharsha', 'শার্শা', 'sharsha.jessore.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(179, 21, 'Assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(180, 21, 'Debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(183, 21, 'Shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(184, 21, 'Tala', 'তালা', 'tala.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(190, 23, 'Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(195, 24, 'Jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(198, 25, 'Khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(199, 25, 'Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(206, 27, 'Paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(212, 27, 'Botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(213, 27, 'Dakop', 'দাকোপ', 'dakop.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(225, 29, 'Shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(227, 29, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(229, 29, 'Moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(230, 30, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(231, 30, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(232, 30, 'Nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(233, 30, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(234, 31, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(235, 31, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(236, 31, 'Dumki', 'দুমকি', 'dumki.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(237, 31, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(238, 31, 'Kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(239, 31, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(240, 31, 'Galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(241, 31, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(242, 32, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(243, 32, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(244, 32, 'Kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(245, 32, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(246, 32, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(247, 32, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(248, 32, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(249, 33, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(250, 33, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(251, 33, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(252, 33, 'Wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(253, 33, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(254, 33, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(255, 33, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(256, 33, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(257, 33, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(258, 33, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(275, 36, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(279, 36, 'Jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(283, 36, 'Dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(284, 36, 'Osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(285, 37, 'Barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(286, 37, 'Kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(288, 37, 'Moulvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(294, 38, 'Ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(302, 39, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(304, 39, 'Jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(309, 39, 'Shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(311, 40, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(312, 40, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(313, 40, 'Narsingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(314, 40, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(315, 40, 'Raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(316, 40, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(317, 41, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(318, 41, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(319, 41, 'Kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(320, 41, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(321, 41, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(322, 42, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(323, 42, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(324, 42, 'Zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(325, 42, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(326, 42, 'Bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(327, 42, 'Damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(328, 43, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(329, 43, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(330, 43, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(331, 43, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(332, 43, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(333, 44, 'Basail', 'বাসাইল', 'basail.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(334, 44, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(335, 44, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(336, 44, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(337, 44, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(338, 44, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(339, 44, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(340, 44, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(341, 44, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(342, 44, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(343, 44, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(344, 44, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(345, 45, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(346, 45, 'Katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(347, 45, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(348, 45, 'Tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(349, 45, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(350, 45, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(351, 45, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(352, 45, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(353, 45, 'Karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(354, 45, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(355, 45, 'Austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(356, 45, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(357, 45, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(358, 46, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(359, 46, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(360, 46, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(361, 46, 'Gior', 'ঘিওর', 'gior.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(362, 46, 'Shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(363, 46, 'Doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(364, 46, 'Singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(365, 47, 'Savar', 'সাভার', 'savar.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(366, 47, 'Dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(367, 47, 'Keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(368, 47, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(369, 47, 'Dohar', 'দোহার', 'dohar.dhaka.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(370, 48, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(371, 48, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(372, 48, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(373, 48, 'Louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(374, 48, 'Gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(375, 48, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(376, 49, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(377, 49, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(378, 49, 'Pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(379, 49, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(380, 49, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(381, 50, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(382, 50, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(383, 50, 'Kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(384, 50, 'Rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(385, 51, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(386, 51, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(387, 51, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(388, 51, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(389, 51, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(390, 52, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(391, 52, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(392, 52, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(393, 52, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(394, 52, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(395, 52, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(396, 52, 'Charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(397, 52, 'Madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(398, 52, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(399, 53, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(400, 53, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(401, 53, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(402, 53, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(403, 53, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(404, 54, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(405, 54, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(406, 54, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(407, 54, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(408, 54, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(409, 54, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(410, 54, 'Kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(411, 54, 'Fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(412, 54, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(413, 54, 'Hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(414, 54, 'Khansama', 'খানসামা', 'khansama.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(415, 54, 'Birol', 'বিরল', 'birol.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(416, 54, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(417, 55, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(418, 55, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(419, 55, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(420, 55, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(421, 55, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(422, 56, 'Syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(423, 56, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(424, 56, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(425, 56, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(426, 56, 'Kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(427, 56, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(428, 57, 'Sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(429, 57, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(430, 57, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(431, 57, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(432, 57, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(433, 57, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(434, 57, 'Phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(435, 58, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(436, 58, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(437, 58, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(438, 58, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(439, 58, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(440, 59, 'Rangpur Sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(441, 59, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(442, 59, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(443, 59, 'Badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(444, 59, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(445, 59, 'Pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(446, 59, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(447, 59, 'Pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(448, 60, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(449, 60, 'Nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(450, 60, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(451, 60, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(452, 60, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(453, 60, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(454, 60, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(455, 60, 'Rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(456, 60, 'Charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(457, 61, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(458, 61, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(459, 61, 'Sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(460, 61, 'Nokla', 'নকলা', 'nokla.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(461, 61, 'Jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(462, 62, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(463, 62, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(464, 62, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(465, 62, 'Muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(466, 62, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(467, 62, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(468, 62, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(469, 62, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(470, 62, 'Gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(471, 62, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(472, 62, 'Iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(473, 62, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(474, 62, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(475, 63, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(476, 63, 'Melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(477, 63, 'Islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(478, 63, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(479, 63, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(480, 63, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(481, 63, 'Bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(482, 64, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(483, 64, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(484, 64, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(485, 64, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(486, 64, 'Madan', 'মদন', 'madan.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(487, 64, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(488, 64, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(489, 64, 'Mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(490, 64, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL),
(491, 64, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd', 1, NULL, '2022-07-01 17:48:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `districts` (`id`, `name`, `division_id`, `bn_name`, `lat`, `lon`, `url`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Comilla', 1, 'কুমিল্লা', '23.4682747', '91.1788135', 'www.comilla.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(2, 'Feni', 1, 'ফেনী', '23.023231', '91.3840844', 'www.feni.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(3, 'Brahmanbaria', 1, 'ব্রাহ্মণবাড়িয়া', '23.9570904', '91.1119286', 'www.brahmanbaria.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(4, 'Rangamati', 1, 'রাঙ্গামাটি', '22.65561018', '92.17541121', 'www.rangamati.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(5, 'Noakhali', 1, 'নোয়াখালী', '22.869563', '91.099398', 'www.noakhali.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(6, 'Chandpur', 1, 'চাঁদপুর', '23.2332585', '90.6712912', 'www.chandpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(7, 'Lakshmipur', 1, 'লক্ষ্মীপুর', '22.942477', '90.841184', 'www.lakshmipur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(8, 'Chattogram', 1, 'চট্টগ্রাম', '22.335109', '91.834073', 'www.chittagong.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(9, 'Coxsbazar', 1, 'কক্সবাজার', '21.44315751', '91.97381741', 'www.coxsbazar.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(10, 'Khagrachhari', 1, 'খাগড়াছড়ি', '23.119285', '91.984663', 'www.khagrachhari.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(11, 'Bandarban', 1, 'বান্দরবান', '22.1953275', '92.2183773', 'www.bandarban.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(12, 'Sirajganj', 2, 'সিরাজগঞ্জ', '24.4533978', '89.7006815', 'www.sirajganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(13, 'Pabna', 2, 'পাবনা', '23.998524', '89.233645', 'www.pabna.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(14, 'Bogura', 2, 'বগুড়া', '24.8465228', '89.377755', 'www.bogra.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(15, 'Rajshahi', 2, 'রাজশাহী', '24.37230298', '88.56307623', 'www.rajshahi.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(16, 'Natore', 2, 'নাটোর', '24.420556', '89.000282', 'www.natore.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(17, 'Joypurhat', 2, 'জয়পুরহাট', '25.09636876', '89.04004280', 'www.joypurhat.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(18, 'Chapainawabganj', 2, 'চাঁপাইনবাবগঞ্জ', '24.5965034', '88.2775122', 'www.chapainawabganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(19, 'Naogaon', 2, 'নওগাঁ', '24.83256191', '88.92485205', 'www.naogaon.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(20, 'Jashore', 3, 'যশোর', '23.16643', '89.2081126', 'www.jessore.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(21, 'Satkhira', 3, 'সাতক্ষীরা', NULL, NULL, 'www.satkhira.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(22, 'Meherpur', 3, 'মেহেরপুর', '23.762213', '88.631821', 'www.meherpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(23, 'Narail', 3, 'নড়াইল', '23.172534', '89.512672', 'www.narail.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(24, 'Chuadanga', 3, 'চুয়াডাঙ্গা', '23.6401961', '88.841841', 'www.chuadanga.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(25, 'Kushtia', 3, 'কুষ্টিয়া', '23.901258', '89.120482', 'www.kushtia.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(26, 'Magura', 3, 'মাগুরা', '23.487337', '89.419956', 'www.magura.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(27, 'Khulna', 3, 'খুলনা', '22.815774', '89.568679', 'www.khulna.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(28, 'Bagerhat', 3, 'বাগেরহাট', '22.651568', '89.785938', 'www.bagerhat.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(29, 'Jhenaidah', 3, 'ঝিনাইদহ', '23.5448176', '89.1539213', 'www.jhenaidah.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(30, 'Jhalakathi', 4, 'ঝালকাঠি', NULL, NULL, 'www.jhalakathi.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(31, 'Patuakhali', 4, 'পটুয়াখালী', '22.3596316', '90.3298712', 'www.patuakhali.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(32, 'Pirojpur', 4, 'পিরোজপুর', NULL, NULL, 'www.pirojpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(33, 'Barisal', 4, 'বরিশাল', NULL, NULL, 'www.barisal.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(34, 'Bhola', 4, 'ভোলা', '22.685923', '90.648179', 'www.bhola.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(35, 'Barguna', 4, 'বরগুনা', NULL, NULL, 'www.barguna.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(36, 'Sylhet', 5, 'সিলেট', '24.8897956', '91.8697894', 'www.sylhet.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(37, 'Moulvibazar', 5, 'মৌলভীবাজার', '24.482934', '91.777417', 'www.moulvibazar.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(38, 'Habiganj', 5, 'হবিগঞ্জ', '24.374945', '91.41553', 'www.habiganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(39, 'Sunamganj', 5, 'সুনামগঞ্জ', '25.0658042', '91.3950115', 'www.sunamganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(40, 'Narsingdi', 6, 'নরসিংদী', '23.932233', '90.71541', 'www.narsingdi.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(41, 'Gazipur', 6, 'গাজীপুর', '24.0022858', '90.4264283', 'www.gazipur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(42, 'Shariatpur', 6, 'শরীয়তপুর', NULL, NULL, 'www.shariatpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(43, 'Narayanganj', 6, 'নারায়ণগঞ্জ', '23.63366', '90.496482', 'www.narayanganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(44, 'Tangail', 6, 'টাঙ্গাইল', '24.26361358', '89.91794786', 'www.tangail.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(45, 'Kishoreganj', 6, 'কিশোরগঞ্জ', '24.444937', '90.776575', 'www.kishoreganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(46, 'Manikganj', 6, 'মানিকগঞ্জ', NULL, NULL, 'www.manikganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(47, 'Dhaka', 6, 'ঢাকা', '23.7115253', '90.4111451', 'www.dhaka.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(48, 'Munshiganj', 6, 'মুন্সিগঞ্জ', NULL, NULL, 'www.munshiganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(49, 'Rajbari', 6, 'রাজবাড়ী', '23.7574305', '89.6444665', 'www.rajbari.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(50, 'Madaripur', 6, 'মাদারীপুর', '23.164102', '90.1896805', 'www.madaripur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(51, 'Gopalganj', 6, 'গোপালগঞ্জ', '23.0050857', '89.8266059', 'www.gopalganj.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(52, 'Faridpur', 6, 'ফরিদপুর', '23.6070822', '89.8429406', 'www.faridpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(53, 'Panchagarh', 7, 'পঞ্চগড়', '26.3411', '88.5541606', 'www.panchagarh.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(54, 'Dinajpur', 7, 'দিনাজপুর', '25.6217061', '88.6354504', 'www.dinajpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(55, 'Lalmonirhat', 7, 'লালমনিরহাট', NULL, NULL, 'www.lalmonirhat.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(56, 'Nilphamari', 7, 'নীলফামারী', '25.931794', '88.856006', 'www.nilphamari.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(57, 'Gaibandha', 7, 'গাইবান্ধা', '25.328751', '89.528088', 'www.gaibandha.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(58, 'Thakurgaon', 7, 'ঠাকুরগাঁও', '26.0336945', '88.4616834', 'www.thakurgaon.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(59, 'Rangpur', 7, 'রংপুর', '25.7558096', '89.244462', 'www.rangpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(60, 'Kurigram', 7, 'কুড়িগ্রাম', '25.805445', '89.636174', 'www.kurigram.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(61, 'Sherpur', 8, 'শেরপুর', '25.0204933', '90.0152966', 'www.sherpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(62, 'Mymensingh', 8, 'ময়মনসিংহ', '24.7465670', '90.4072093', 'www.mymensingh.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(63, 'Jamalpur', 8, 'জামালপুর', '24.937533', '89.937775', 'www.jamalpur.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL),
(64, 'Netrokona', 8, 'নেত্রকোণা', '24.870955', '90.727887', 'www.netrokona.gov.bd', 1, NULL, '2022-07-01 17:50:07', NULL);

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
(1, 'Chattagram', 1, NULL, '2022-07-01 08:01:31', '2022-07-01 11:17:24'),
(2, 'Rajshahi', 1, NULL, '2022-07-01 11:19:20', '2022-07-01 11:19:20'),
(3, 'Khulna', 1, NULL, '2022-07-01 11:19:30', '2022-07-01 11:19:30'),
(4, 'Barisal', 1, NULL, '2022-07-01 11:19:43', '2022-07-01 11:19:43'),
(5, 'Sylhet', 1, NULL, '2022-07-01 11:19:55', '2022-07-01 11:19:55'),
(6, 'Dhaka', 1, NULL, '2022-07-01 11:20:03', '2022-07-01 11:20:03'),
(7, 'Rangpur', 1, NULL, '2022-07-01 11:20:21', '2022-07-01 11:20:21'),
(8, 'Mymensingh', 1, NULL, '2022-07-01 11:20:29', '2022-07-01 11:20:29');

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
(27, '2022_07_01_115642_create_venues_table', 3),
(28, '2022_07_01_115351_create_districts_table', 4),
(30, '2022_07_01_115635_create_cities_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `occasions`
--

CREATE TABLE `occasions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `occasions`
--

INSERT INTO `occasions` (`id`, `name`, `remarks`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Wedding', NULL, 1, 1, '2022-07-01 08:01:08', '2022-07-01 11:02:27'),
(2, 'Engagement', NULL, 1, NULL, '2022-07-01 11:02:38', '2022-07-01 11:02:38'),
(3, 'Reception', NULL, 1, NULL, '2022-07-01 11:02:49', '2022-07-01 11:02:49'),
(4, 'Birthday Party', NULL, 1, NULL, '2022-07-01 11:02:56', '2022-07-01 11:02:56'),
(5, 'First Birthday Party', NULL, 1, NULL, '2022-07-01 11:03:04', '2022-07-01 11:03:04'),
(6, 'Social Gathering', NULL, 1, 1, '2022-07-01 11:05:21', '2022-07-01 11:07:30'),
(7, 'Corporate Party', NULL, 1, 1, '2022-07-01 11:06:25', '2022-07-01 11:07:45'),
(8, 'Anniversary', NULL, 1, NULL, '2022-07-01 11:07:55', '2022-07-01 11:07:55'),
(9, 'Cocktail Party', NULL, 1, NULL, '2022-07-01 11:08:03', '2022-07-01 11:08:03'),
(10, 'Bachelor Party', NULL, 1, NULL, '2022-07-01 11:08:09', '2022-07-01 11:08:09'),
(11, 'Pool Party', NULL, 1, NULL, '2022-07-01 11:08:16', '2022-07-01 11:08:16'),
(12, 'Party', NULL, 1, NULL, '2022-07-01 11:08:23', '2022-07-01 11:08:23'),
(13, 'Kids Party', NULL, 1, NULL, '2022-07-01 11:08:28', '2022-07-01 11:08:28'),
(14, 'Team Building', NULL, 1, NULL, '2022-07-01 11:08:34', '2022-07-01 11:08:34'),
(15, 'Meeting', NULL, 1, NULL, '2022-07-01 11:08:39', '2022-07-01 11:08:39'),
(16, 'Conference', NULL, 1, NULL, '2022-07-01 11:08:45', '2022-07-01 11:08:45'),
(17, 'Exhibition', NULL, 1, NULL, '2022-07-01 11:08:51', '2022-07-01 11:08:51');

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
  ADD KEY `districts_division_id_foreign` (`division_id`),
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `occasions`
--
ALTER TABLE `occasions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
