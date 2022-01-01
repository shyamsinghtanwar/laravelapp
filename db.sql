-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 01, 2022 at 11:46 AM
-- Server version: 8.0.22
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `betting`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `admin_access` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login_time` datetime DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `mobile`, `image`, `status`, `admin_access`, `login_time`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '6546 56746545', 'admin_1579275461.jpg', 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"21\",\"22\",\"23\",\"24\"]', '2021-12-30 18:38:15', '$2y$10$DmXhIijeqfVdlMLtQlxbMuwhtWkhCNCyUp5Ksi3UuKcQ1FOTBKbGe', 'WZ8x0Z5A9xTfm6m3EH4HTKxAnlTk5PmwsGnBmeHNs7Kmh4LqNzEI3ijggLyu', '2018-03-26 06:08:23', '2021-12-30 13:08:15'),
(2, 'Alex Tom', 'alextom', 'alextom@alextom.com', '091 000 00 000', 'admin_1578429133.jpg', 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"21\",\"22\",\"23\",\"24\"]', '2020-04-06 11:17:56', '$2y$10$DmXhIijeqfVdlMLtQlxbMuwhtWkhCNCyUp5Ksi3UuKcQ1FOTBKbGe', 'pflWYrdegMVsuET9RBv0tKII5a374HolrXMH5woh6zyBJwequMEZoQ68IYBS', '2018-03-31 00:35:52', '2020-04-06 15:17:56');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logins`
--

CREATE TABLE `admin_logins` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `user_ip` varchar(191) DEFAULT NULL,
  `browser` varchar(191) DEFAULT NULL,
  `os` varchar(191) DEFAULT NULL,
  `long` varchar(191) DEFAULT NULL,
  `lat` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_logins`
--

INSERT INTO `admin_logins` (`id`, `user_id`, `user_ip`, `browser`, `os`, `long`, `lat`, `country`, `country_code`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', 'Chrome', 'Windows 10', '', '', '', '', ' - -  -  ', '2020-09-15 07:56:47', '2020-09-15 07:56:47'),
(2, 1, '::1', 'Chrome', 'Windows 10', '', '', '', '', ' - -  -  ', '2020-09-30 10:02:26', '2020-09-30 10:02:26'),
(3, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-08 12:01:24', '2021-12-08 12:01:24'),
(4, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-13 11:48:14', '2021-12-13 11:48:14'),
(5, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-14 00:13:34', '2021-12-14 00:13:34'),
(6, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-14 09:52:51', '2021-12-14 09:52:51'),
(7, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-14 21:36:08', '2021-12-14 21:36:08'),
(8, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-15 02:54:02', '2021-12-15 02:54:02'),
(9, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-15 21:14:31', '2021-12-15 21:14:31'),
(10, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-16 00:28:57', '2021-12-16 00:28:57'),
(11, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-19 02:33:38', '2021-12-19 02:33:38'),
(12, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-20 06:55:17', '2021-12-20 06:55:17'),
(13, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-21 02:06:31', '2021-12-21 02:06:31'),
(14, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-21 06:00:32', '2021-12-21 06:00:32'),
(15, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-21 07:03:52', '2021-12-21 07:03:52'),
(16, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-27 00:35:23', '2021-12-27 00:35:23'),
(17, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-27 08:18:25', '2021-12-27 08:18:25'),
(18, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-28 01:55:48', '2021-12-28 01:55:48'),
(19, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-28 10:40:16', '2021-12-28 10:40:16'),
(20, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-28 11:40:57', '2021-12-28 11:40:57'),
(21, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-29 06:55:00', '2021-12-29 06:55:00'),
(22, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-29 11:14:02', '2021-12-29 11:14:02'),
(23, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-30 10:18:49', '2021-12-30 10:18:49'),
(24, 1, '127.0.0.1', 'Firefox', 'Windows 10', '', '', '', '', ' - -  -  ', '2021-12-30 13:08:16', '2021-12-30 13:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic_settings`
--

CREATE TABLE `basic_settings` (
  `id` int UNSIGNED NOT NULL,
  `sitename` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_sym` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `sms_verification` tinyint(1) NOT NULL DEFAULT '0',
  `email_notification` tinyint(1) NOT NULL DEFAULT '0',
  `sms_notification` tinyint NOT NULL DEFAULT '0',
  `withdraw_status` tinyint(1) NOT NULL DEFAULT '0',
  `win_charge` decimal(11,2) DEFAULT '2.00',
  `max_transfer` decimal(11,2) DEFAULT NULL,
  `min_transfer` decimal(11,2) DEFAULT NULL,
  `transfer_charge` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT 'transfer charge (%)',
  `captcha` tinyint NOT NULL DEFAULT '0',
  `decimal` int NOT NULL,
  `about` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `policy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `chat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chat_status` tinyint NOT NULL DEFAULT '0',
  `testimonial_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `testimonial_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_from` varchar(91) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_settings`
--

INSERT INTO `basic_settings` (`id`, `sitename`, `prefix`, `phone`, `email`, `address`, `currency`, `currency_sym`, `registration`, `email_verification`, `sms_verification`, `email_notification`, `sms_notification`, `withdraw_status`, `win_charge`, `max_transfer`, `min_transfer`, `transfer_charge`, `captcha`, `decimal`, `about`, `policy`, `terms`, `chat`, `admin_id`, `created_at`, `updated_at`, `chat_status`, `testimonial_title`, `testimonial_subtitle`, `blog_title`, `blog_subtitle`, `footer_about`, `meta_keywords`, `meta_description`, `sms_from`, `sid`, `api_token`) VALUES
(1, 'prophecy', 'admin', '+919024915733', 'hello@admin.com', 'castle road 517 , kiyev port South Korea', 'INR', '₹', 1, 0, 0, 1, 1, 1, '0.00', '100000.00', '10.00', '0.00', 0, 2, 'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\norem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n', 'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\norem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\norem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\norem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n', 'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\norem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\norem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\norem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5c04002940105007f37a9f4c/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>', 1, '2019-04-26 04:03:19', '2019-04-26 04:03:19', 0, 'TESTIMONIAL', 'WHAT THEY SAY ABOUT US', 'LATEST BLOG', 'INSIDE THE NEWS', 'Our commitment to you is to provide honest, friendly, and on-time service. Visit a locally owned and operated business that has been serving the community since 1992.', 'Prophecy, rophecy, prediction, prognosis, prognostic, vaticination,  revelation, oracle, evelation, manifestation, illumination, radiancy, radiance,	bet, betting, casino, gambling, game, jackpot, lottery, online bet, Online Betting, online game, prediction, prophecy, soccer, sports, sports bet', 'Prophecy, rophecy, prediction, prognosis, prognostic, vaticination,  revelation, oracle, evelation, manifestation, illumination, radiancy, radiance	bet, betting, casino, gambling, game, jackpot, lottery, online bet, Online Betting, online game, prediction, prophecy, soccer, sports, sports bet', '+14155238886', 'ACd0b699ca23460cc6b3e9fe739d12bf14', 'db15bb4592ed8d6bdd99f25910f17f8e');

-- --------------------------------------------------------

--
-- Table structure for table `bet_invests`
--

CREATE TABLE `bet_invests` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `match_id` int DEFAULT NULL,
  `betquestion_id` int DEFAULT NULL,
  `betoption_id` int DEFAULT NULL,
  `invest_amount` decimal(11,2) DEFAULT '0.00',
  `return_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `charge` decimal(11,2) DEFAULT '0.00',
  `remaining_balance` decimal(11,2) DEFAULT '0.00',
  `ratio` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'default 0, win 1, lose -1, refund 2',
  `admin_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bet_options`
--

CREATE TABLE `bet_options` (
  `id` int UNSIGNED NOT NULL,
  `question_id` int NOT NULL,
  `match_id` int NOT NULL,
  `option_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `invest_amount` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0.001',
  `return_amount` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0.001',
  `min_amo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0.001',
  `ratio1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ratio2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bet_limit` decimal(8,2) DEFAULT '2000.00',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'pending 1,win 2, deactive 0, refunded 3',
  `admin_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bet_questions`
--

CREATE TABLE `bet_questions` (
  `id` int UNSIGNED NOT NULL,
  `match_id` int DEFAULT NULL,
  `question` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `result` tinyint NOT NULL DEFAULT '0',
  `limit` int NOT NULL DEFAULT '5',
  `admin_id` int DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total_read` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `method_code` int DEFAULT NULL,
  `amount` decimal(11,8) DEFAULT '0.00000000',
  `method_currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(18,8) DEFAULT '0.00000000',
  `rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `final_amo` decimal(18,8) DEFAULT '0.00000000',
  `btc_amo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `trx` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int NOT NULL DEFAULT '0',
  `verify_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=> confirm , 2 => pending, -2 => rejected	',
  `admin_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `btc_amo`, `btc_wallet`, `detail`, `trx`, `try`, `verify_image`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 1, 105, '102.00000000', 'INR', '8.05000000', '1.00000000', '110.05000000', '0', '', NULL, '57FW261ARSDR', 0, NULL, 0, NULL, '2021-12-08 12:10:44', '2021-12-08 12:10:44'),
(2, 1, 101, '999.99999999', 'USD', '5.00000000', '1.00000000', '9005.00000000', '0', '', NULL, 'GV2RQ38AZHA7', 0, NULL, 0, NULL, '2021-12-16 00:27:37', '2021-12-16 00:27:37'),
(3, 1, 1001, '999.99999999', 'INR', '0.00000000', '1.00000000', '1000.00000000', '0', '', NULL, 'ETGYPAENWTEQ', 0, NULL, 1, NULL, '2021-12-16 00:28:31', '2021-12-16 00:29:16'),
(4, 1, 1001, '999.99999999', 'INR', '0.00000000', '1.00000000', '1000.00000000', '0', '', NULL, '7QZ6BS49FERR', 0, NULL, 1, NULL, '2021-12-21 07:01:44', '2021-12-21 10:51:38'),
(5, 1, 1001, '250.00000000', 'INR', '0.00000000', '1.00000000', '250.00000000', '0', '', 'By Payment Withdraw', 'By Payment Withdraw', 0, 'Null', 1, 0, NULL, NULL),
(6, 1, 1001, '350.00000000', 'INR', '0.00000000', '1.00000000', '350.00000000', '0', '', 'By Payment Withdraw', 'By Payment Withdraw', 0, 'Null', 1, 0, NULL, NULL),
(7, 2, 1001, '999.99999999', 'INR', '0.00000000', '1.00000000', '1000.00000000', '0', '', NULL, 'SDYKBYF9HVVA', 0, NULL, 1, NULL, '2021-12-21 10:51:24', '2021-12-21 10:51:51'),
(8, 3, 1001, '999.99999999', 'INR', '0.00000000', '1.00000000', '1000.00000000', '0', '', NULL, '9KMR88QX5QZP', 0, NULL, 1, NULL, '2021-12-21 11:01:54', '2021-12-21 11:02:20'),
(9, 3, 1001, '100.00000000', 'INR', '0.00000000', '1.00000000', '100.00000000', '0', '', 'By Payment Withdraw', 'By Payment Withdraw', 0, 'Null', 1, 0, NULL, NULL),
(10, 3, 1001, '100.00000000', 'INR', '0.00000000', '1.00000000', '100.00000000', '0', '', 'By Payment Withdraw', 'By Payment Withdraw', 0, 'Null', 1, 0, NULL, NULL),
(11, 3, 1001, '50.00000000', 'INR', '0.00000000', '1.00000000', '50.00000000', '0', '', 'By Payment Withdraw', 'By Payment Withdraw', 0, 'Null', 1, 0, NULL, NULL),
(12, 3, 1001, '100.00000000', 'INR', '0.00000000', '1.00000000', '100.00000000', '0', '', 'By Payment Withdraw', 'By Payment Withdraw', 0, 'Null', 1, 0, NULL, NULL),
(13, 20, 1001, '999.99999999', 'INR', '0.00000000', '1.00000000', '1000.00000000', '0', '', NULL, '1KS9H8XT1CF6', 0, NULL, 2, NULL, '2021-12-28 11:43:15', '2021-12-28 11:43:21'),
(14, 20, 1001, '999.99999999', 'INR', '0.00000000', '1.00000000', '1000.00000000', '0', '', NULL, '7YDEJZE5A75X', 0, NULL, 2, NULL, '2021-12-28 11:46:06', '2021-12-28 11:46:12'),
(15, 20, 1001, '600.00000000', 'INR', '0.00000000', '1.00000000', '600.00000000', '0', '', NULL, 'KJRRYVWP3AJE', 0, NULL, 2, NULL, '2021-12-28 11:46:53', '2021-12-28 11:46:58'),
(16, 3, 1001, '100.00000000', 'INR', '0.00000000', '1.00000000', '100.00000000', '0', '', NULL, '7OXOG8NB4V38', 0, NULL, 2, NULL, '2021-12-29 10:45:44', '2021-12-29 10:49:31'),
(17, 3, 1001, '200.00000000', 'INR', '0.00000000', '1.00000000', '200.00000000', '0', '', NULL, 'CD73BVEGTJ6X', 0, NULL, 2, NULL, '2021-12-29 10:50:57', '2021-12-29 10:51:00'),
(18, 3, 1001, '100.00000000', 'INR', '0.00000000', '1.00000000', '100.00000000', '0', '', NULL, 'PJ81X8AK74S5', 0, NULL, 2, NULL, '2021-12-29 11:13:09', '2021-12-29 11:13:13');

-- --------------------------------------------------------

--
-- Table structure for table `etemplates`
--

CREATE TABLE `etemplates` (
  `id` int UNSIGNED NOT NULL,
  `esender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emessage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smsapi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `etemplates`
--

INSERT INTO `etemplates` (`id`, `esender`, `mobile`, `emessage`, `smsapi`, `created_at`, `updated_at`) VALUES
(1, 'noreply-bugfinder.me@gmail.com', '+01234567890', '<div class=\"wrapper\" style=\"background-color: #f2f2f2;\"><br></div><div class=\"wrapper\" style=\"background-color: #f2f2f2;\"><br><table class=\"layout layout--no-gutter\" style=\"border-collapse: collapse; table-layout: fixed; margin-left: auto; margin-right: auto; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; background-color: #ffffff;\" align=\"center\"><tbody><tr><td class=\"column\" style=\"padding: 0px; text-align: left; vertical-align: top; line-height: 21px; width: 600px;\"><br><div style=\"margin-left: 20px; margin-right: 20px;\"><font size=\"4\" style=\"color: rgb(96, 102, 109); font-family: sans-serif; font-size: 14px;\">Hi </font><font style=\"\" color=\"#0000ff\" face=\"Courier New\"><b>[[name]]</b></font><span style=\"color: rgb(96, 102, 109); font-family: sans-serif; font-size: large; font-weight: initial;\">,</span></div><div style=\"color: rgb(96, 102, 109); font-family: sans-serif; font-size: 14px; margin-left: 20px; margin-right: 20px;\"><p><b>[[message]]</b></p></div><div style=\"color: rgb(96, 102, 109); font-family: sans-serif; font-size: 14px; margin-left: 20px; margin-right: 20px; margin-bottom: 24px;\"><br><p class=\"size-14\" style=\"margin-top: 0; margin-bottom: 0; font-size: 14px; line-height: 21px;\">Thanks,<br> <strong>BugFinder TEAM</strong></p><br></div><br></td></tr></tbody></table><br></div>', 'http://dash.univasms.com/smsapi?api_key=C20039115cef801f66b168.60739508&type=text&contacts=[[number]]&senderid=8804445629107&msg=[[message]]', '2018-01-09 23:45:09', '2020-01-17 10:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `websitename` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `slug`, `websitename`, `url`, `event`, `images`, `special`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ASD', 'asd', '', 'http://www.Website1.com', '', 'public/images/website_images/website.jpg', '50 Rs More', 1, '2021-12-08 12:16:34', '2021-12-08 12:16:34'),
(2, 'Test', 'test', '', 'http://www.Website2.com', '', 'public/images/website_images/website.jpg', '', 1, '2021-12-13 11:48:35', '2021-12-13 11:48:35'),
(3, 'Test Again', 'test-again', 'Test Again', 'http://www.Website3.com', 'Test1', 'public/images/website_images/website.jpg', '', 1, '2021-12-13 12:16:47', '2021-12-13 12:16:47'),
(4, 'Website 4', 'website-4', 'Website 4', 'http://www.Website4.com', 'Website 4', 'public/images/website_images/website.jpg', '', 1, '2021-12-20 06:55:48', '2021-12-20 06:55:48'),
(8, 'website5', 'website5', 'website5', 'website5', 'website5', 'public/images/website_images/website.jpg', '100%', 1, '2021-12-29 07:29:50', '2021-12-29 07:29:50');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `how_it_works`
--

CREATE TABLE `how_it_works` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int UNSIGNED NOT NULL,
  `event_id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `admin_id` int DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_01_06_152714_create_testimonials_table', 2),
(5, '2020_01_07_154248_create_blogs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int UNSIGNED NOT NULL,
  `sender_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `charge` decimal(11,2) DEFAULT NULL,
  `trx` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_code` int UNSIGNED NOT NULL,
  `min_amount` decimal(18,8) NOT NULL,
  `max_amount` decimal(18,8) NOT NULL,
  `percent_charge` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(18,8) NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `supported_currencies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `input_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateway`
--

INSERT INTO `payment_gateway` (`id`, `name`, `alias`, `currency`, `symbol`, `method_code`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `parameter`, `status`, `supported_currencies`, `extra`, `input_form`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Paypal', NULL, 'USD', '$', 101, '1.00000000', '9000.00000000', '0.0500', '0.50000000', '1.00000000', 'Paypal_1585115584.jpg', '{\"paypal_email\":\"paypal@pay.com\"}', 0, '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', NULL, NULL, NULL, '2019-12-17 05:54:04', '2021-12-28 11:39:06'),
(2, 'Perfect Money', NULL, 'USD', '$', 102, '50.00000000', '53000.00000000', '0.0300', '2.00000000', '1.00000000', 'Perfect Money_1585115592.jpg', '{\"passphrase\":\"6451561651551\",\"wallet_id\":\"54554\"}', 0, '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', NULL, NULL, NULL, '2019-12-17 10:59:14', '2020-03-24 23:53:12'),
(3, 'Skrill', NULL, 'USD', '$', 104, '7.00000000', '7000.00000000', '0.0500', '6.00000000', '1.00000000', 'Skrill_1585115602.jpg', '{\"pay_to_email\":\"merchant@merchant.com\",\"secret_key\":\"SECRETKEY\"}', 0, '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', NULL, NULL, NULL, '2019-12-17 05:55:09', '2020-03-24 23:53:22'),
(4, 'Stripe ', NULL, 'USD', '$', 111, '9.00000000', '58000.00000000', '0.0500', '8.00000000', '1.00000000', 'Stripe _1578853320.jpg', '{\"secret_key\":\"sk_test_aat3tzBCCXXBkS4sxY3M8A1B\",\"publishable_key\":\"pk_test_AU3G7doZ1sbdpJLj0NaozPBu\"}', 0, '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', NULL, NULL, NULL, '2019-12-17 05:59:12', '2020-01-15 11:52:00'),
(5, 'PayStack ', NULL, 'USD', '$', 107, '9.00000000', '58000.00000000', '0.0500', '8.00000000', '1.00000000', 'PayStack _1585124796.jpg', '{\"public_key\":\"pk_test_3c9c87f51b13c15d99eb367ca6ebc52cc9eb1f33\",\"secret_key\":\"sk_test_2a3f97a146ab5694801f993b60fcb81cd7254f12\"}', 0, '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"g107\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"g107\"}}\r\n', NULL, NULL, '2019-12-17 05:59:12', '2020-03-25 02:26:36'),
(6, 'PayTM\r\n', NULL, 'INR', '$', 105, '9.00000000', '58000.00000000', '0.0500', '8.00000000', '1.00000000', 'paytm_1585124867.jpg', '{\"MID\":\"DIY12386817555501617\",\"merchant_key\":\"bKMfNxPPf_QdZppa\",\"WEBSITE\":\"DIYtestingweb\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\",\"transaction_url\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\",\"transaction_status_url\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}', 0, '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', NULL, NULL, NULL, '2019-12-17 05:59:12', '2020-03-25 02:35:12'),
(7, 'Mtn B', 'mtn_b', 'ngn', 'ngn', 1000, '1.00000000', '1000.00000000', '0.0300', '1.00000000', '3150.00000000', '5f0c789fb52be1594652831.png', '{\"bank_slip\":{\"field_name\":\"bank_slip\",\"field_level\":\"Bank Slip\",\"type\":\"file\",\"validation\":\"required\"},\"bank_name\":{\"field_name\":\"bank_name\",\"field_level\":\"Bank Name\",\"type\":\"text\",\"validation\":\"required\"}}', 0, '[]', '{\"delay\":\"1-5\"}', '{\"bank_slip\":{\"field_name\":\"bank_slip\",\"field_level\":\"Bank Slip\",\"type\":\"file\",\"validation\":\"required\"},\"bank_name\":{\"field_name\":\"bank_name\",\"field_level\":\"Bank Name\",\"type\":\"text\",\"validation\":\"required\"}}', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><div><br></div>', '2020-07-13 09:07:11', '2021-12-15 22:46:06'),
(8, 'Mollie', NULL, 'USD', '$', 115, '1.00000000', '9000.00000000', '0.0500', '0.50000000', '1.00000000', 'mollie_1595342248.jpg', '{\"api_key\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}', 0, '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', NULL, NULL, NULL, '2019-12-17 05:54:04', '2020-07-21 08:37:28'),
(9, 'INR', 'inr', 'INR', 'INR', 1001, '10.00000000', '1000.00000000', '0.0000', '0.00000000', '1.00000000', '', '[]', 1, '[]', '{\"delay\":\"0\"}', '[]', 'Currency INR <br>', '2021-12-15 22:45:37', '2021-12-15 22:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `sub_title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(3, 'SAFE, 100% Risk Free Website', '', '', 'slider_1578311257.jpg', '2020-01-06 05:47:37', '2020-01-06 05:47:37'),
(7, 'NEXT-GEN ONLINE GAMING & SPORTS', '', '', 'slider_1579797496.jpg', '2020-01-23 21:38:16', '2020-01-23 21:38:16'),
(8, 'Predict Now, Earn Money, Be Happy', '', '', 'slider_1579797574.jpg', '2020-01-23 21:39:35', '2020-01-23 21:39:35'),
(9, 'Predict Now, Earn Money, Be Happy', '', '', 'slider_1579797615.jpg', '2020-01-23 21:40:16', '2020-01-23 21:40:16'),
(10, 'SAFE, 100% Risk Free Website', '', '', 'slider_1579797794.jpg', '2020-01-23 21:43:14', '2020-01-23 21:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `designation`, `details`, `image`, `created_at`, `updated_at`) VALUES
(1, 'ALex', 'CSO, TESTHUNT', 'I would drive out of my way to have them service my vehicle any day of the week because I know I am getting service the way it should be!!', 'testimonial_1579204186.jpg', '2020-01-06 12:29:09', '2020-01-16 13:49:46'),
(2, 'Lian Dawson', 'CSO, CoderX', 'I would drive out of my way to have them service my vehicle any day of the week because I know I am getting service the way it should be!!', 'testimonial_1579204197.jpg', '2020-01-06 12:29:09', '2020-01-16 13:49:57'),
(3, 'Piasah', 'CEO, HUNTer', 'I would drive out of my way to have them service my vehicle any day of the week because I know I am getting service the way it should be!!', 'testimonial_1579204510.jpg', '2020-01-06 12:29:09', '2020-01-16 13:55:10'),
(4, 'Kethy Kelly', 'CMO, CoderX', 'I would drive out of my way to have them service my vehicle any day of the week because I know I am getting service the way it should be!!', 'testimonial_1579204519.jpg', '2020-01-06 12:29:09', '2020-01-16 13:55:19');

-- --------------------------------------------------------

--
-- Table structure for table `trxes`
--

CREATE TABLE `trxes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `refer_id` int NOT NULL DEFAULT '0',
  `amount` decimal(11,2) DEFAULT '0.00',
  `main_amo` decimal(11,2) DEFAULT '0.00',
  `charge` decimal(11,2) DEFAULT '0.00',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trxes`
--

INSERT INTO `trxes` (`id`, `user_id`, `refer_id`, `amount`, `main_amo`, `charge`, `type`, `title`, `trx`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '1000.00', '1000.00', '0.00', '+', 'Deposit Via INR', 'ETGYPAENWTEQ', '2021-12-16 00:29:16', '2021-12-16 00:29:16'),
(2, 1, 0, '500.00', '493.50', '6.50', '-', 'Withdraw Via Neteller', 'VNR7X4MVTXJH', '2021-12-16 00:36:25', '2021-12-16 00:36:25'),
(3, 1, 0, '1000.00', '1437.50', '0.00', '+', 'Deposit Via INR', '7QZ6BS49FERR', '2021-12-21 10:51:38', '2021-12-21 10:51:38'),
(4, 2, 0, '1000.00', '1000.00', '0.00', '+', 'Deposit Via INR', 'SDYKBYF9HVVA', '2021-12-21 10:51:51', '2021-12-21 10:51:51'),
(5, 3, 0, '1000.00', '1000.00', '0.00', '+', 'Deposit Via INR', '9KMR88QX5QZP', '2021-12-21 11:02:20', '2021-12-21 11:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_code_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verify` tinyint NOT NULL DEFAULT '0',
  `email_verify` tinyint NOT NULL DEFAULT '0',
  `email_time` datetime DEFAULT NULL,
  `phone_time` datetime DEFAULT NULL,
  `balance` decimal(11,2) DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '1',
  `login_time` datetime DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `phone`, `image`, `password`, `verification_code`, `sms_code`, `sms_code_token`, `phone_verify`, `email_verify`, `email_time`, `phone_time`, `balance`, `status`, `login_time`, `city`, `zip_code`, `address`, `country`, `country_code`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'User', 'testuser', 'testuser@gmail.com', '+355254545', NULL, '$2y$10$rG.6vmNhaWDo6IDlKmP9jedWwSt2.a0qc8y1U1OnhDrO5C2NU3tr6', '519283', '289011', NULL, 1, 1, '2020-09-15 14:02:15', '2020-09-15 14:02:15', '1337.50', 1, NULL, NULL, NULL, NULL, 'Albania', NULL, NULL, '2020-09-15 08:00:15', '2021-12-29 02:28:15'),
(3, 'shashank', 'bhatnagar', 'testuser2', 'shashank.bhatnagar13@gmail.com', '+918003800456', NULL, '$2y$10$U2QQM5UsgAmo3ug0O5LOtOwcVO0.C54xLRwr05wom7OogsoXnq2Fq', '130288', '605175', NULL, 1, 1, '2021-12-21 16:33:39', '2021-12-21 16:33:39', '170.00', 1, NULL, NULL, NULL, NULL, 'Afghanistan', NULL, NULL, '2021-12-21 11:01:39', '2021-12-29 10:42:42'),
(39, 'shashank', 'bhatnagar', 'usr1646151009', 'a@a.com', '+917894561230', NULL, '$2y$10$/3bN6Mk8E6Aub5izMV6noe1FhmkspSEhdYRy8TfSjQ6or4AKfnQ4G', '126962', '592144', NULL, 1, 1, '2022-01-01 07:10:41', '2022-01-01 07:10:41', '0.00', 1, NULL, NULL, NULL, NULL, 'India', NULL, NULL, '2022-01-01 01:38:41', '2022-01-01 01:38:41'),
(40, 'shashank', 'bhatnagar', 'usr1706982778', 'shashank@carriesdsrhost.com', '+917770000931', NULL, '$2y$10$Y/av7xIn24yGL9/vNYyWieQD3sQvrJnADHROfoqQxaX6ys2EgpbNG', '334703', '300381', NULL, 1, 1, '2022-01-01 11:27:30', '2022-01-01 11:27:30', '0.00', 1, NULL, NULL, NULL, NULL, 'India', NULL, NULL, '2022-01-01 05:55:30', '2022-01-01 05:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `user_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `browser` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `location`, `browser`, `os`, `long`, `lat`, `country`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 1, '::1', ' - -  -  ', 'Chrome', 'Windows 10', '', '', '', '', '2020-09-15 08:00:16', '2020-09-15 08:00:16'),
(2, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-08 12:09:30', '2021-12-08 12:09:30'),
(3, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-16 00:27:07', '2021-12-16 00:27:07'),
(4, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-18 04:20:57', '2021-12-18 04:20:57'),
(5, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-18 07:23:32', '2021-12-18 07:23:32'),
(6, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-18 07:36:40', '2021-12-18 07:36:40'),
(7, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-20 05:17:20', '2021-12-20 05:17:20'),
(8, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-21 01:02:39', '2021-12-21 01:02:39'),
(9, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-21 06:58:36', '2021-12-21 06:58:36'),
(10, 2, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-21 10:51:00', '2021-12-21 10:51:00'),
(11, 3, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-21 11:01:39', '2021-12-21 11:01:39'),
(12, 6, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-27 01:56:51', '2021-12-27 01:56:51'),
(13, 8, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-27 07:35:49', '2021-12-27 07:35:49'),
(14, 9, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 03:57:56', '2021-12-28 03:57:56'),
(15, 15, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:18:45', '2021-12-28 11:18:45'),
(16, 16, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:20:48', '2021-12-28 11:20:48'),
(17, 17, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:31:19', '2021-12-28 11:31:19'),
(18, 18, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:32:37', '2021-12-28 11:32:37'),
(19, 19, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:33:54', '2021-12-28 11:33:54'),
(20, 20, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:35:15', '2021-12-28 11:35:15'),
(21, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:48:05', '2021-12-28 11:48:05'),
(22, 3, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:52:15', '2021-12-28 11:52:15'),
(23, 21, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:57:05', '2021-12-28 11:57:05'),
(24, 22, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:57:48', '2021-12-28 11:57:48'),
(25, 23, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-28 11:59:36', '2021-12-28 11:59:36'),
(26, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-29 02:27:39', '2021-12-29 02:27:39'),
(27, 3, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-29 07:30:55', '2021-12-29 07:30:55'),
(28, 3, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-29 10:03:41', '2021-12-29 10:03:41'),
(29, 3, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-30 06:02:53', '2021-12-30 06:02:53'),
(30, 1, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-30 12:14:00', '2021-12-30 12:14:00'),
(31, 24, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-30 13:55:15', '2021-12-30 13:55:15'),
(32, 25, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-30 13:55:58', '2021-12-30 13:55:58'),
(33, 26, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2021-12-30 14:08:48', '2021-12-30 14:08:48'),
(34, 40, '127.0.0.1', ' - -  -  ', 'Firefox', 'Windows 10', '', '', '', '', '2022-01-01 05:55:30', '2022-01-01 05:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `web_user_match`
--

CREATE TABLE `web_user_match` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `website_id` int NOT NULL,
  `website_user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website_user_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_user_match`
--

INSERT INTO `web_user_match` (`id`, `user_id`, `website_id`, `website_user_name`, `website_user_password`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'testuser', 'testpassword', 2000, 1, '2021-12-23 11:36:49', '2021-12-21 11:49:46'),
(2, 1, 1, 'Flopv_user', 'Flopv_Password', 100, 1, '2021-12-16 08:05:26', '2021-12-16 08:05:26'),
(3, 1, 2, 'NullUser', 'NullPassword', 50, 1, '2021-12-16 08:16:11', '2021-12-16 08:16:36'),
(4, 1, 2, 'NullUser', 'NullPassword', 13, 0, '2021-12-18 12:31:34', '2021-12-18 12:31:34'),
(5, 1, 2, 'NullUser', 'NullPassword', 13, 0, '2021-12-18 12:33:08', '2021-12-18 12:33:08'),
(7, 1, 3, 'Withdraw_Request', 'Withdraw_Request', 350, 1, '2021-12-21 07:35:18', '2021-12-21 13:16:26'),
(9, 1, 2, 'NullUser', 'NullPassword', 130, 0, '2021-12-21 15:20:52', '2021-12-21 15:20:52'),
(10, 3, 4, 'Shashank', '123456', 0, 1, '2021-12-21 16:32:57', '2021-12-21 16:33:05'),
(11, 3, 4, 'Shashank', '123456', 100, 1, '2021-12-21 16:44:38', '2021-12-21 16:50:08'),
(12, 3, 1, 'Shashank2', '123456789', 0, 1, '2021-12-21 16:44:58', '2021-12-21 16:47:54'),
(13, 3, 1, 'Shashank2', '123456789', 50, 1, '2021-12-21 16:48:18', '2021-12-21 16:48:28'),
(14, 3, 1, 'Withdraw_Request', 'Withdraw_Request', 100, 1, '2021-12-21 16:50:37', '2021-12-21 16:50:46'),
(15, 3, 4, 'Withdraw_Request', 'Withdraw_Request', 100, 1, '2021-12-21 17:07:03', '2021-12-21 17:14:04'),
(16, 3, 1, 'Withdraw_Request', 'Withdraw_Request', 50, 1, '2021-12-21 17:19:07', '2021-12-21 17:19:14'),
(17, 3, 1, 'Withdraw_Request', 'Withdraw_Request', 100, 1, '2021-12-21 17:20:37', '2021-12-21 17:20:56'),
(18, 1, 2, 'Withdraw_Request', 'Withdraw_Request', 500, 0, '2021-12-28 17:18:25', '2021-12-28 17:18:25'),
(19, 1, 4, 'Null', 'Null', 0, 0, '2021-12-28 17:20:37', '2021-12-28 17:20:37'),
(20, 3, 2, 'Null', 'Null', 0, 0, '2021-12-28 17:22:24', '2021-12-28 17:22:24'),
(21, 3, 3, 'Null', 'Null', 0, 0, '2021-12-28 17:22:44', '2021-12-28 17:22:44'),
(22, 1, 1, 'Flopv_user', 'Flopv_Password', 100, 0, '2021-12-29 07:58:15', '2021-12-29 07:58:15'),
(23, 3, 1, 'Shashank2', '123456789', 100, 0, '2021-12-29 15:36:24', '2021-12-29 15:36:24'),
(24, 3, 1, 'Shashank2', '123456789', 100, 0, '2021-12-29 15:38:55', '2021-12-29 15:38:55'),
(25, 3, 1, 'Shashank2', '123456789', 100, 0, '2021-12-29 15:41:00', '2021-12-29 15:41:00'),
(26, 3, 1, 'Shashank2', '123456789', 200, 0, '2021-12-29 15:44:22', '2021-12-29 15:44:22'),
(27, 3, 1, 'Shashank2', '123456789', 130, 0, '2021-12-29 15:50:50', '2021-12-29 15:50:50'),
(28, 3, 1, 'Shashank2', '123456789', 10, 0, '2021-12-29 15:59:43', '2021-12-29 15:59:43'),
(29, 3, 1, 'Shashank2', '123456789', 20, 0, '2021-12-29 16:09:46', '2021-12-29 16:09:46'),
(30, 3, 1, 'Shashank2', '123456789', 20, 0, '2021-12-29 16:10:20', '2021-12-29 16:10:20'),
(31, 3, 1, 'Shashank2', '123456789', 50, 0, '2021-12-29 16:10:30', '2021-12-29 16:10:30'),
(32, 3, 1, 'Shashank2', '123456789', 50, 0, '2021-12-29 16:10:53', '2021-12-29 16:10:53'),
(33, 3, 4, 'Shashank', '123456', 50, 0, '2021-12-29 16:12:42', '2021-12-29 16:12:42'),
(34, 3, 8, 'Null', 'Null', 0, 0, '2021-12-29 16:36:56', '2021-12-29 16:36:56');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_logs`
--

CREATE TABLE `withdraw_logs` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `method_id` int DEFAULT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `charge` decimal(11,2) DEFAULT '0.00',
  `net_amount` decimal(11,2) DEFAULT '0.00',
  `withdraw_information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 =>pending, 2=>confirm, -2 =>rejected',
  `admin_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_logs`
--

INSERT INTO `withdraw_logs` (`id`, `user_id`, `method_id`, `transaction_id`, `amount`, `charge`, `net_amount`, `withdraw_information`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'VNR7X4MVTXJH', '500.00', '6.50', '506.50', '{\"name\":{\"field_name\":\"Test Again\",\"type\":\"text\"},\"account_number\":{\"field_name\":\"231342354234234234\",\"type\":\"text\"},\"screenshot\":{\"field_name\":\"163963478561bad76134e08.jpg\",\"type\":\"file\"},\"electricity_bill\":{\"field_name\":\"163963478561bad7614ad45.jpg\",\"type\":\"file\"}}', 1, NULL, '2021-12-16 00:35:53', '2021-12-16 00:36:25'),
(2, 3, 1, 'GVKM9YDEKZ7Q', '100.00', '5.30', '105.30', NULL, 0, NULL, '2021-12-29 10:52:26', '2021-12-29 10:52:26');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_min` decimal(11,2) DEFAULT '0.00',
  `withdraw_max` decimal(11,2) DEFAULT '0.00',
  `fix` decimal(11,2) DEFAULT '0.00',
  `percent` decimal(11,2) DEFAULT '0.00',
  `duration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `input_form` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `admin_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `image`, `withdraw_min`, `withdraw_max`, `fix`, `percent`, `duration`, `status`, `input_form`, `admin_id`, `created_at`, `updated_at`, `type`) VALUES
(1, 'Neteller', 'Neteller_1594654291.jpg', '50.00', '2000.00', '5.00', '0.30', '1-2 Hours', 1, '{\"name\":{\"field_name\":\"name\",\"field_level\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"field_name\":\"account_number\",\"field_level\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"screenshot\":{\"field_name\":\"screenshot\",\"field_level\":\"Screenshot\",\"type\":\"file\",\"validation\":\"required\"},\"electricity_bill\":{\"field_name\":\"electricity_bill\",\"field_level\":\"Electricity Bill\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, '2019-11-23 05:39:40', '2020-07-13 09:31:31', NULL),
(2, 'Payoneer', 'Payoneer_1594654301.jpg', '100.00', '3200.00', '10.00', '0.15', '1-2 Hours', 1, '{\"mobile_number\":{\"field_name\":\"mobile_number\",\"field_level\":\"Mobile Number\",\"type\":\"text\",\"validation\":\"required\"},\"account_number\":{\"field_name\":\"account_number\",\"field_level\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"screenshot\":{\"field_name\":\"screenshot\",\"field_level\":\"Screenshot\",\"type\":\"file\",\"validation\":\"required\"}}', NULL, '2020-01-12 13:43:36', '2020-07-13 09:31:41', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_logins`
--
ALTER TABLE `admin_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `basic_settings`
--
ALTER TABLE `basic_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_invests`
--
ALTER TABLE `bet_invests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_options`
--
ALTER TABLE `bet_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bet_questions`
--
ALTER TABLE `bet_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etemplates`
--
ALTER TABLE `etemplates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `how_it_works`
--
ALTER TABLE `how_it_works`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gateway_currencies_method_code_index` (`method_code`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trxes`
--
ALTER TABLE `trxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_user_match`
--
ALTER TABLE `web_user_match`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_logs`
--
ALTER TABLE `withdraw_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_logins`
--
ALTER TABLE `admin_logins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `basic_settings`
--
ALTER TABLE `basic_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bet_invests`
--
ALTER TABLE `bet_invests`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bet_options`
--
ALTER TABLE `bet_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bet_questions`
--
ALTER TABLE `bet_questions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `etemplates`
--
ALTER TABLE `etemplates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `how_it_works`
--
ALTER TABLE `how_it_works`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trxes`
--
ALTER TABLE `trxes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `web_user_match`
--
ALTER TABLE `web_user_match`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `withdraw_logs`
--
ALTER TABLE `withdraw_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
