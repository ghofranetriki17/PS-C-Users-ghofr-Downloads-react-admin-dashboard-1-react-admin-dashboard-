-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2025 at 06:07 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anaspluspfaete`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `address`, `city`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Anas Plus Bouzayen', 'Bouzayen klm 4', 'Sfaxx', '+216 25141113', 'bouzayen@anasplus.tn', '2025-07-10 08:57:38', '2025-08-14 11:45:56'),
(2, 'Anas Plus Gremda', 'Rue de gremda klm 6', 'Sfax', '+216 25141113', 'gremda@anasplus.tn', '2025-07-10 08:58:30', '2025-07-10 08:58:30'),
(3, 'Anas Plus Mahdia', 'Route Mahdia km 2', 'Mahdia', '+216 25141113', 'mahdia@anasplus.tn', '2025-07-17 13:25:33', '2025-07-17 13:25:33'),
(5, 'atheleticaa', 'win iji', 'sfax', '25141113', 'ghof@gmail.com', '2025-08-08 09:20:56', '2025-08-08 09:21:03'),
(6, 'test', 'nhjcbsj', 'sfax', '2514113', 'ghofghof@gmail.com', '2025-08-14 11:42:25', '2025-08-14 11:42:25');

-- --------------------------------------------------------

--
-- Table structure for table `branch_availabilities`
--

CREATE TABLE `branch_availabilities` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `day_of_week` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_hour` time DEFAULT NULL,
  `closing_hour` time DEFAULT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_availabilities`
--

INSERT INTO `branch_availabilities` (`id`, `branch_id`, `day_of_week`, `opening_hour`, `closing_hour`, `is_closed`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monday', '08:00:00', '17:00:00', 0, '2025-07-10 08:59:17', '2025-07-10 08:59:17'),
(2, 2, 'Monday', '08:00:00', '17:00:00', 0, '2025-07-10 08:59:25', '2025-07-10 08:59:25'),
(3, 2, 'Tuesday', '08:00:00', '17:00:00', 0, '2025-07-10 08:59:38', '2025-07-10 08:59:38'),
(4, 1, 'Tuesday', '08:00:00', '17:00:00', 0, '2025-07-10 08:59:44', '2025-07-10 08:59:44'),
(5, 1, 'Sunday', NULL, NULL, 1, '2025-07-10 09:00:15', '2025-07-10 09:00:15'),
(6, 2, 'Sunday', NULL, NULL, 1, '2025-07-10 09:00:23', '2025-07-10 09:00:23'),
(7, 3, 'Wednesday', '09:00:00', '18:00:00', 0, '2025-07-17 13:27:55', '2025-07-17 13:27:55'),
(8, 3, 'Friday', '09:00:00', '18:00:00', 0, '2025-07-17 13:27:55', '2025-07-17 13:27:55'),
(9, 3, 'Sunday', NULL, NULL, 1, '2025-07-17 13:27:55', '2025-07-17 13:27:55'),
(10, 1, 'Wednesday', '08:00:00', '17:00:00', 0, '2025-07-17 13:29:32', '2025-07-17 13:29:32'),
(11, 1, 'Thursday', '08:00:00', '17:00:00', 0, '2025-07-17 13:29:32', '2025-07-17 13:29:32'),
(12, 1, 'Friday', '08:00:00', '14:00:00', 0, '2025-07-17 13:29:32', '2025-07-17 13:29:32'),
(13, 1, 'Saturday', NULL, NULL, 1, '2025-07-17 13:29:32', '2025-07-17 13:29:32'),
(14, 2, 'Wednesday', '09:00:00', '18:00:00', 0, '2025-07-17 13:29:44', '2025-07-17 13:29:44'),
(15, 2, 'Thursday', '09:00:00', '18:00:00', 0, '2025-07-17 13:29:44', '2025-07-17 13:29:44'),
(16, 2, 'Friday', '09:00:00', '13:00:00', 0, '2025-07-17 13:29:44', '2025-07-17 13:29:44'),
(17, 2, 'Saturday', '10:00:00', '14:00:00', 0, '2025-07-17 13:29:44', '2025-07-17 13:29:44');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Biceps', 'Machines ciblant les muscles biceps', '2025-07-10 09:04:03', '2025-07-10 09:04:03'),
(2, 'Triceps', 'Équipements pour entraîner les triceps', '2025-07-10 09:04:09', '2025-07-10 09:04:09'),
(3, 'Abdominaux', 'Machines pour travailler les abdos', '2025-07-10 09:04:35', '2025-07-10 09:04:35'),
(4, 'Pectoraux', 'Muscles de la poitrine pour les mouvements de poussée', '2025-07-10 09:07:28', '2025-07-10 09:07:28'),
(5, 'Cardio Equipment', 'All cardio machines for cardiovascular exercise', '2025-07-10 11:45:01', '2025-07-10 11:45:01'),
(6, 'Jambes', 'Machines pour entraîner les muscles des jambes', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(7, 'Dos', 'Équipements pour muscler le dos et dorsaux', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(8, 'Épaules', 'Machines ciblant les muscles des épaules', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(9, 'Fessiers', 'Équipements pour travailler les fessiers', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(10, 'Mollets', 'Machines spécialisées pour les mollets', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(11, 'Core/Gainage', 'Équipements pour le gainage et stabilité', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(12, 'jdida', NULL, '2025-10-02 09:56:54', '2025-10-02 09:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` bigint UNSIGNED NOT NULL,
  `weight` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`id`, `weight`, `created_at`, `updated_at`) VALUES
(1, 2.50, '2025-07-10 09:10:27', '2025-07-10 09:10:27'),
(2, 4.00, '2025-07-10 09:10:31', '2025-07-10 09:10:31'),
(3, 5.00, '2025-07-10 09:10:37', '2025-07-10 09:10:37'),
(5, 10.00, '2025-07-10 11:46:28', '2025-07-10 11:46:28'),
(6, 1.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(7, 1.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(8, 3.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(9, 6.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(10, 7.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(11, 8.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(12, 9.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(13, 12.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(14, 15.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(15, 17.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(16, 20.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(17, 22.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(18, 25.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(19, 27.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(20, 30.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(21, 32.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(22, 35.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(23, 37.50, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(24, 40.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(25, 45.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(26, 50.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(27, 55.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(28, 60.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(29, 65.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(30, 70.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(31, 75.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(32, 80.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(33, 85.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(34, 90.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(35, 95.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(36, 100.00, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(37, 32.50, '2025-08-12 11:24:12', '2025-08-12 11:24:12'),
(38, 33.00, '2025-10-02 09:56:32', '2025-10-02 09:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hourly_rate_online` decimal(8,2) NOT NULL,
  `hourly_rate_presential` decimal(8,2) NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `certifications` text COLLATE utf8mb4_unicode_ci,
  `rating` decimal(3,2) NOT NULL DEFAULT '0.00',
  `total_sessions` int NOT NULL DEFAULT '0',
  `total_earnings` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `branch_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`id`, `name`, `photo_url`, `email`, `phone`, `hourly_rate_online`, `hourly_rate_presential`, `bio`, `certifications`, `rating`, `total_sessions`, `total_earnings`, `is_available`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'Rami Trabelsi', 'gym-banner.jpg', 'rami@anasplus.tn', '+216 55511234', 50.00, 60.00, 'Coach certifié en fitness et musculation', 'IFBB Certified', 4.50, 100, 5000.00, 1, 1, '2025-07-24 12:51:35', '2025-07-24 12:51:35'),
(2, 'Amal Bouzid', NULL, 'amal@anasplus.tn', '+216 98765432', 30.00, 45.00, 'Coach certifiée Pilates et Yoga', 'Certifiée Yoga Alliance, Formée en Pilates Reformer', 0.00, 0, 0.00, 1, 1, '2025-07-31 08:52:11', '2025-08-12 08:11:17'),
(3, 'Ahmed', 'image1', 'HH@GMAIL.COM', '25141112', 20.00, 30.00, 'DHDHHD', 'HDHDHHDHD', 0.00, 0, 0.00, 1, 1, '2025-08-08 10:09:24', '2025-08-12 08:11:28');

-- --------------------------------------------------------

--
-- Table structure for table `coach_availabilities`
--

CREATE TABLE `coach_availabilities` (
  `id` bigint UNSIGNED NOT NULL,
  `coach_id` bigint UNSIGNED NOT NULL,
  `day_of_week` enum('monday','tuesday','wednesday','thursday','friday','saturday','sunday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coach_availabilities`
--

INSERT INTO `coach_availabilities` (`id`, `coach_id`, `day_of_week`, `start_time`, `end_time`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 1, 'monday', '09:00:00', '12:00:00', 1, '2025-07-24 12:52:05', '2025-07-24 12:52:05'),
(2, 1, 'wednesday', '14:00:00', '18:00:00', 1, '2025-07-24 12:52:05', '2025-07-24 12:52:05'),
(3, 1, 'friday', '10:00:00', '13:00:00', 1, '2025-07-24 12:52:05', '2025-07-24 12:52:05'),
(4, 2, 'tuesday', '08:00:00', '12:00:00', 1, '2025-07-31 08:53:13', '2025-07-31 08:53:13'),
(5, 2, 'thursday', '10:00:00', '18:00:00', 1, '2025-07-31 08:53:13', '2025-07-31 08:53:13'),
(6, 1, 'saturday', '15:04:00', '17:04:00', 1, '2025-08-18 09:04:14', '2025-08-18 09:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `coach_specialities`
--

CREATE TABLE `coach_specialities` (
  `id` bigint UNSIGNED NOT NULL,
  `coach_id` bigint UNSIGNED NOT NULL,
  `speciality_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coach_specialities`
--

INSERT INTO `coach_specialities` (`id`, `coach_id`, `speciality_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-07-24 12:51:50', '2025-07-24 12:51:50'),
(2, 1, 2, '2025-07-24 12:51:50', '2025-07-24 12:51:50'),
(3, 2, 1, '2025-07-31 08:52:53', '2025-07-31 08:52:53'),
(4, 2, 3, '2025-07-31 08:52:53', '2025-07-31 08:52:53'),
(5, 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Zumba', 'Cours de danse cardio', '2025-07-24 12:51:00', '2025-07-24 12:51:00'),
(2, 'CrossFit', 'Entraînement fonctionnel intensif', '2025-07-24 12:51:00', '2025-07-24 12:51:00'),
(3, 'Yoga', 'Cours de yoga relaxant', '2025-07-24 12:51:00', '2025-07-24 12:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint UNSIGNED NOT NULL,
  `movement_id` bigint UNSIGNED DEFAULT NULL,
  `machine_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sets` int NOT NULL DEFAULT '1',
  `reps` int NOT NULL DEFAULT '1',
  `charge_id` bigint UNSIGNED DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `movement_id`, `machine_id`, `name`, `title`, `sets`, `reps`, `charge_id`, `instructions`, `created_at`, `updated_at`) VALUES
(99, 1, 39, 'Leg Press', 'Leg Press Machine', 4, 12, NULL, 'Push with both legs evenly', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(100, 2, 1, 'Barbell Squat', 'Barbell Back Squat', 4, 10, NULL, 'Maintain straight posture', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(101, 3, 38, 'Seated Calf Raise', 'Seated Calf Raise Machine', 4, 15, NULL, 'Lift heels under control', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(102, 4, 40, 'Push-Ups', 'No Machine Push-Ups', 3, 20, NULL, 'Keep your body aligned', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(103, 5, 22, 'Cable Crossover', 'Cable Crossover Machine', 3, 15, NULL, 'Control both cables', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(104, 6, 21, 'Incline Chest Press', 'Incline Chest Press Machine', 4, 10, NULL, 'Push upward with control', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(105, 7, 36, 'Glute Kickback', 'Glute Kickback Machine', 4, 12, NULL, 'Extend leg backward', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(106, 8, 30, 'T-Bar Row', 'T-Bar Row Machine', 4, 10, NULL, 'Pull bar toward chest', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(107, 9, 19, 'Captain\'s Chair', 'Captain\'s Chair Leg Raise', 3, 15, NULL, 'Raise legs slowly', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(108, 10, 31, 'Back Extension', 'Hyperextension Bench', 3, 15, NULL, 'Extend spine gently', '2025-07-22 15:38:00', '2025-07-22 15:38:00'),
(109, 1, 1, 'test', 'Test', 8, 5, 1, 'Vv', '2025-07-22 14:47:54', '2025-07-22 14:47:54'),
(110, 2, 5, 'alternative leg eleva', NULL, 4, 12, 11, NULL, '2025-07-22 16:03:33', '2025-07-22 16:03:33'),
(111, 13, 8, 'leg press', NULL, 2, 8, 19, 'Aa', '2025-07-22 16:11:57', '2025-07-22 16:11:57'),
(112, 9, 5, 'latpull down', 'Biceps', 3, 12, 3, 'Matatlakch ydik', '2025-07-22 16:34:08', '2025-07-22 16:34:08'),
(113, 1, 1, 'g f', 'Cf', 8, 25, 2, 'Hh', '2025-07-22 16:36:04', '2025-07-22 16:36:04'),
(114, 5, 1, 'barbell press', 'Gg', 4, 15, 1, 'Ff', '2025-07-22 16:43:28', '2025-07-22 16:43:28'),
(115, 4, 1, 'Ex 1', 'Chest', 3, 10, 1, NULL, '2025-07-25 09:50:37', '2025-07-25 09:50:37'),
(116, 1, 2, 'squats', 'BH', 4, 12, 3, 'Itlakthahrek', '2025-07-31 11:24:49', '2025-07-31 11:24:49'),
(117, 24, 8, 'leg curls', 'yassin', 4, 12, 2, 'Itlak thahrek', '2025-08-08 08:54:00', '2025-08-08 08:54:00'),
(118, 25, 8, 'leg curls', 'Super set', 4, 12, 10, 'Keep back straight', '2025-09-18 09:08:14', '2025-09-18 09:08:14'),
(119, 35, 1, 'hhvfg', 'Hhnj', 4, 12, 2, 'Hhn', '2025-10-02 08:03:45', '2025-10-02 08:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_session_bookings`
--

CREATE TABLE `group_session_bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `group_training_session_id` bigint UNSIGNED NOT NULL,
  `booked_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_session_bookings`
--

INSERT INTO `group_session_bookings` (`id`, `user_id`, `group_training_session_id`, `booked_at`, `created_at`, `updated_at`) VALUES
(9, 1, 5, '2025-08-14 10:42:44', '2025-08-14 10:42:44', '2025-08-14 10:42:44'),
(11, 1, 3, '2025-09-18 09:12:00', '2025-09-18 09:12:00', '2025-09-18 09:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `group_session_user`
--

CREATE TABLE `group_session_user` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `group_training_session_id` bigint UNSIGNED NOT NULL,
  `booked_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_training_sessions`
--

CREATE TABLE `group_training_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `coach_id` bigint UNSIGNED NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `session_date` datetime NOT NULL,
  `duration` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_for_women` tinyint(1) NOT NULL DEFAULT '0',
  `is_free` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_kids` tinyint(1) NOT NULL DEFAULT '0',
  `max_participants` int DEFAULT NULL,
  `current_participants` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_training_sessions`
--

INSERT INTO `group_training_sessions` (`id`, `branch_id`, `coach_id`, `course_id`, `session_date`, `duration`, `title`, `is_for_women`, `is_free`, `is_for_kids`, `max_participants`, `current_participants`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2025-07-30 10:00:00', 60, 'Zumba du matin', 1, 1, 1, 20, 5, '2025-07-24 12:52:37', '2025-07-24 12:52:37'),
(2, 1, 1, 2, '2025-08-30 17:00:00', 45, 'CrossFit Intermédiaire', 0, 0, 1, 15, 0, '2025-07-24 12:52:37', '2025-08-08 08:57:47'),
(3, 1, 2, 3, '2025-09-18 16:00:00', 60, 'Pilates Spécial Femme', 1, 0, 0, 25, 1, '2025-07-31 10:45:05', '2025-09-18 09:12:00'),
(5, 1, 3, 1, '2025-08-14 12:43:00', 65, 'DDD', 0, 0, 1, 12, 1, '2025-08-14 09:43:28', '2025-08-14 10:42:44'),
(6, 1, 1, 1, '2025-10-02 09:55:00', 60, 'zumba afro', 1, 0, 0, 5, 0, '2025-10-02 07:56:14', '2025-10-02 07:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`id`, `branch_id`, `name`, `type`, `description`, `image_url`, `video_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Barbell', 'Strength', 'Heavy-duty leg press machine', 'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630', NULL, '2025-07-10 10:23:46', '2025-10-02 07:58:42'),
(2, 1, 'Dumbbell', 'Strength', 'Heavy-duty leg press machine', 'https://example.com/legpress.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(3, 1, 'Treadmill', 'Cardio', 'High quality treadmill', 'https://example.com/treadmill.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(4, 1, 'Rowing Machine', 'Cardio', 'Rowing machine for full body workout', 'https://example.com/rowing.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(5, 1, 'Bicep Curl Machine', 'Strength', 'Machine for biceps curls', 'https://example.com/bicepcurl.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(6, 1, 'Elliptical Trainer', 'Cardio', 'Elliptical for cardio and legs', 'https://example.com/elliptical.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(7, 1, 'Chest Press Machine', 'Strength', 'Chest press for pectorals', 'https://example.com/chestpress.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(8, 1, 'Leg Curl Machine', 'Strength', 'Machine to train hamstrings', 'https://example.com/legcurl.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(9, 1, 'Stationary Bike', 'Cardio', 'Indoor bike for cardio', 'https://example.com/bike.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(10, 1, 'Lat Pulldown Machine', 'Strength', 'For back and lat muscles', 'https://example.com/latpulldown.jpg', NULL, '2025-07-17 13:34:22', '2025-07-17 13:34:22'),
(11, 1, 'Preacher Curl Machine', 'Strength', 'Machine à curl concentré sur pupitre pour biceps', 'https://example.com/preacher-curl.jpg', 'https://www.youtube.com/watch?v=fIWP-FRFNU0', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(12, 1, 'Cable Bicep Curl Station', 'Strength', 'Poste de curl biceps à câbles réglables', 'https://example.com/cable-bicep.jpg', 'https://www.youtube.com/watch?v=kwG2ipFRgfo', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(13, 1, 'Hammer Curl Machine', 'Strength', 'Machine pour curl marteau ciblant biceps et avant-bras', 'https://example.com/hammer-curl.jpg', 'https://www.youtube.com/watch?v=TwD-YGVP4Bk', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(14, 1, 'Tricep Extension Machine', 'Strength', 'Machine à extension triceps assistée', 'https://example.com/tricep-extension.jpg', 'https://www.youtube.com/watch?v=popGXI-qs98', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(15, 1, 'Tricep Dip Machine', 'Strength', 'Machine à dips assistés pour triceps', 'https://example.com/tricep-dip.jpg', 'https://www.youtube.com/watch?v=6kALZikXxLc', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(16, 1, 'Cable Tricep Station', 'Strength', 'Poste à câbles pour extensions triceps', 'https://example.com/cable-tricep.jpg', 'https://www.youtube.com/watch?v=vB5OHsJ3EME', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(17, 1, 'Ab Crunch Machine', 'Strength', 'Machine à crunch abdominaux avec résistance', 'https://example.com/ab-crunch.jpg', 'https://www.youtube.com/watch?v=8jVR6_WlsQQ', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(18, 1, 'Rotary Torso Machine', 'Strength', 'Machine de rotation du torse pour obliques', 'https://example.com/rotary-torso.jpg', 'https://www.youtube.com/watch?v=W3NNn9c6NJ4', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(19, 1, 'Captain\'s Chair', 'Strength', 'Chaise du capitaine pour élévations de jambes', 'https://example.com/captains-chair.jpg', 'https://www.youtube.com/watch?v=xKq7HaTbJnE', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(20, 1, 'Pec Deck Machine', 'Strength', 'Machine à écartés pour isolation pectoraux', 'https://example.com/pec-deck.jpg', 'https://www.youtube.com/watch?v=Z5m68tYgCzY', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(21, 1, 'Incline Chest Press', 'Strength', 'Développé incliné pour pectoraux supérieurs', 'https://example.com/incline-press.jpg', 'https://www.youtube.com/watch?v=6PZWdsn1dkI', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(22, 1, 'Cable Crossover Machine', 'Strength', 'Vis-à-vis à câbles pour pectoraux', 'https://example.com/cable-crossover.jpg', 'https://www.youtube.com/watch?v=taI4XduLpTk', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(23, 1, 'Stair Climber', 'Cardio', 'Simulateur d\'escaliers pour cardio intense', 'https://example.com/stair-climber.jpg', 'https://www.youtube.com/watch?v=cZzGOBLjGt0', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(24, 1, 'Arc Trainer', 'Cardio', 'Machine cardio à mouvement elliptique adaptatif', 'https://example.com/arc-trainer.jpg', 'https://www.youtube.com/watch?v=9pztHTOWrJ4', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(25, 1, 'Assault Bike', 'Cardio', 'Vélo d\'assaut avec résistance air pour HIIT', 'https://example.com/assault-bike.jpg', 'https://www.youtube.com/watch?v=Z8Wuy8dJBQM', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(26, 1, 'Leg Extension Machine', 'Strength', 'Extension de jambes pour quadriceps', 'https://example.com/leg-extension.jpg', 'https://www.youtube.com/watch?v=YyvSfVjQeL0', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(27, 1, 'Smith Machine', 'Strength', 'Barre guidée pour squats sécurisés', 'https://example.com/smith-machine.jpg', 'https://www.youtube.com/watch?v=rrkY0gCYnns', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(28, 1, 'Hack Squat Machine', 'Strength', 'Machine à hack squat pour jambes complètes', 'https://example.com/hack-squat.jpg', 'https://www.youtube.com/watch?v=EdtaJRBqEYI', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(29, 1, 'Seated Row Machine', 'Strength', 'Rameur assis pour dorsaux et rhomboïdes', 'https://example.com/seated-row.jpg', 'https://www.youtube.com/watch?v=GZbfZ033f74', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(30, 1, 'T-Bar Row Machine', 'Strength', 'Rameur en T pour épaisseur du dos', 'https://example.com/t-bar-row.jpg', 'https://www.youtube.com/watch?v=j3Igk5nyZE4', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(31, 1, 'Hyperextension Bench', 'Strength', 'Banc à hyperextensions lombaires', 'https://example.com/hyperextension.jpg', 'https://www.youtube.com/watch?v=qtdyyTNhQaY', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(32, 1, 'Shoulder Press Machine', 'Strength', 'Développé épaules assis guidé', 'https://example.com/shoulder-press-machine.jpg', 'https://www.youtube.com/watch?v=M2rwvNhTOu0', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(33, 1, 'Lateral Raise Machine', 'Strength', 'Élévations latérales pour deltoïdes', 'https://example.com/lateral-raise.jpg', 'https://www.youtube.com/watch?v=3VcKaas9EaU', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(34, 1, 'Rear Delt Machine', 'Strength', 'Oiseau pour deltoïdes postérieurs', 'https://example.com/rear-delt.jpg', 'https://www.youtube.com/watch?v=EA7u4Q_8HQ0', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(35, 1, 'Hip Thrust Machine', 'Strength', 'Machine à poussée de hanches pour fessiers', 'https://example.com/hip-thrust-machine.jpg', 'https://www.youtube.com/watch?v=SEdqd1n0cvg', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(36, 1, 'Glute Kickback Machine', 'Strength', 'Machine à extensions fessiers', 'https://example.com/glute-kickback.jpg', 'https://www.youtube.com/watch?v=umWS45SWkuA', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(37, 1, 'Standing Calf Raise Machine', 'Strength', 'Élévations mollets debout avec charge', 'https://example.com/standing-calf.jpg', 'https://www.youtube.com/watch?v=gwLzBJYoWlI', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(38, 1, 'Seated Calf Raise Machine', 'Strength', 'Élévations mollets assis pour soléaires', 'https://example.com/seated-calf.jpg', 'https://www.youtube.com/watch?v=JmVRBbz8BdY', '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(39, 1, 'Leg Press Machine', 'Strength', 'Heavy-duty leg press machine', 'https://example.com/legpress.jpg', NULL, '2025-07-22 15:30:00', '2025-07-22 15:30:00'),
(40, 1, 'No Machine', 'None', 'This exercise requires no machine', NULL, NULL, '2025-07-22 15:30:00', '2025-07-22 15:30:00'),
(41, 2, 'test', 'tesy', 'xcxadxraz', NULL, NULL, '2025-08-12 11:03:05', '2025-08-12 11:03:05'),
(42, 1, 'test', 'tesy', 'xcxadxraz', NULL, NULL, '2025-08-12 11:07:27', '2025-08-12 11:07:27'),
(44, 2, 'ccc', 'ccc', ';;;', NULL, NULL, '2025-08-28 09:06:57', '2025-08-28 09:06:57'),
(45, 3, 'xxx', 'xx', NULL, 'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630', NULL, '2025-08-28 09:07:33', '2025-08-28 09:21:11'),
(46, 6, 'xxxxxxxxxxxxxxxxxxxxxx', 'ww', 'www', 'https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630', NULL, '2025-08-28 09:10:00', '2025-08-28 09:10:00'),
(48, 3, 'test33', 'Strength', 'xxxx', NULL, NULL, '2025-10-02 09:57:46', '2025-10-02 09:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `machine_categories`
--

CREATE TABLE `machine_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `machine_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_categories`
--

INSERT INTO `machine_categories` (`id`, `machine_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 5, 1, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(3, 11, 1, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(4, 12, 1, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(5, 13, 1, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(9, 14, 2, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(10, 15, 2, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(11, 16, 2, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(12, 17, 3, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(13, 18, 3, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(14, 19, 3, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(15, 7, 4, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(16, 20, 4, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(17, 21, 4, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(18, 22, 4, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(22, 3, 5, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(23, 4, 5, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(24, 6, 5, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(25, 9, 5, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(26, 23, 5, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(27, 24, 5, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(28, 25, 5, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(29, 1, 6, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(30, 2, 6, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(31, 8, 6, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(32, 26, 6, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(33, 27, 6, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(34, 28, 6, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(36, 10, 7, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(37, 29, 7, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(38, 30, 7, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(39, 31, 7, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(43, 32, 8, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(44, 33, 8, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(45, 34, 8, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(46, 35, 9, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(47, 36, 9, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(49, 37, 10, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(50, 38, 10, '2025-07-22 14:48:14', '2025-07-22 14:48:14'),
(51, 41, 1, NULL, NULL),
(52, 42, 1, NULL, NULL),
(53, 42, 2, NULL, NULL),
(55, 41, 10, NULL, NULL),
(56, 44, 4, NULL, NULL),
(57, 45, 3, NULL, NULL),
(58, 46, 3, NULL, NULL),
(63, 48, 1, '2025-10-02 09:57:46', '2025-10-02 09:57:46'),
(64, 48, 3, '2025-10-02 09:57:46', '2025-10-02 09:57:46'),
(65, 48, 8, '2025-10-02 09:57:46', '2025-10-02 09:57:46'),
(66, 48, 12, '2025-10-02 09:57:46', '2025-10-02 09:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `machine_charges`
--

CREATE TABLE `machine_charges` (
  `id` bigint UNSIGNED NOT NULL,
  `machine_id` bigint UNSIGNED NOT NULL,
  `charge_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_charges`
--

INSERT INTO `machine_charges` (`id`, `machine_id`, `charge_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 30, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(4, 29, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(5, 28, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(6, 27, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(7, 10, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(8, 2, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(9, 1, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(10, 30, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(11, 29, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(12, 28, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(13, 27, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(14, 10, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(15, 2, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(16, 1, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(17, 30, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(18, 29, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(19, 28, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(20, 27, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(21, 10, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(22, 2, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(23, 1, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(24, 30, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(25, 29, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(26, 28, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(27, 27, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(28, 10, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(29, 2, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(30, 1, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(31, 30, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(32, 29, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(33, 28, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(34, 27, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(35, 10, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(36, 2, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(37, 1, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(38, 30, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(39, 29, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(40, 28, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(41, 27, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(42, 10, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(43, 2, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(44, 1, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(45, 30, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(46, 29, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(47, 28, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(48, 27, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(49, 10, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(50, 2, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(51, 1, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(52, 30, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(53, 29, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(54, 28, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(55, 27, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(56, 10, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(57, 2, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(58, 1, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(59, 30, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(60, 29, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(61, 28, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(62, 27, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(63, 10, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(64, 2, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(65, 1, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(66, 30, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(67, 29, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(68, 28, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(69, 27, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(70, 10, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(71, 2, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(72, 1, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(73, 30, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(74, 29, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(75, 28, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(76, 27, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(77, 10, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(78, 2, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(79, 1, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(80, 30, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(81, 29, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(82, 28, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(83, 27, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(84, 10, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(85, 2, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(86, 1, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(87, 30, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(88, 29, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(89, 28, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(90, 27, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(91, 10, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(92, 2, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(93, 1, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(94, 30, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(95, 29, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(96, 28, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(97, 27, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(98, 10, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(99, 2, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(100, 1, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(101, 30, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(102, 29, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(103, 28, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(104, 27, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(105, 10, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(106, 2, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(107, 1, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(108, 30, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(109, 29, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(110, 28, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(111, 27, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(112, 10, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(113, 2, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(114, 1, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(115, 30, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(116, 29, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(117, 28, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(118, 27, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(119, 10, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(120, 2, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(121, 1, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(122, 30, 33, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(123, 29, 33, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(124, 28, 33, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(125, 27, 33, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(126, 10, 33, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(127, 2, 33, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(128, 1, 33, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(129, 30, 34, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(130, 29, 34, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(131, 28, 34, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(132, 27, 34, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(133, 10, 34, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(134, 2, 34, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(135, 1, 34, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(136, 30, 35, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(137, 29, 35, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(138, 28, 35, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(139, 27, 35, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(140, 10, 35, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(141, 2, 35, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(142, 1, 35, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(143, 30, 36, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(144, 29, 36, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(145, 28, 36, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(146, 27, 36, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(147, 10, 36, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(148, 2, 36, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(149, 1, 36, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(258, 34, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(259, 33, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(260, 26, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(261, 16, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(262, 15, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(263, 14, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(264, 13, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(265, 12, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(266, 11, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(267, 8, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(268, 5, 3, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(269, 34, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(270, 33, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(271, 26, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(272, 16, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(273, 15, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(274, 14, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(275, 13, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(276, 12, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(277, 11, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(278, 8, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(279, 5, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(280, 34, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(281, 33, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(282, 26, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(283, 16, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(284, 15, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(285, 14, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(286, 13, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(287, 12, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(288, 11, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(289, 8, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(290, 5, 9, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(291, 34, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(292, 33, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(293, 26, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(294, 16, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(295, 15, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(296, 14, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(297, 13, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(298, 12, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(299, 11, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(300, 8, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(301, 5, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(302, 34, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(303, 33, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(304, 26, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(305, 16, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(306, 15, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(307, 14, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(308, 13, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(309, 12, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(310, 11, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(311, 8, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(312, 5, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(313, 34, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(314, 33, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(315, 26, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(316, 16, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(317, 15, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(318, 14, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(319, 13, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(320, 12, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(321, 11, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(322, 8, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(323, 5, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(324, 34, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(325, 33, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(326, 26, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(327, 16, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(328, 15, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(329, 14, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(330, 13, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(331, 12, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(332, 11, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(333, 8, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(334, 5, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(335, 34, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(336, 33, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(337, 26, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(338, 16, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(339, 15, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(340, 14, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(341, 13, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(342, 12, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(343, 11, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(344, 8, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(345, 5, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(346, 34, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(347, 33, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(348, 26, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(349, 16, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(350, 15, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(351, 14, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(352, 13, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(353, 12, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(354, 11, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(355, 8, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(356, 5, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(357, 34, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(358, 33, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(359, 26, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(360, 16, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(361, 15, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(362, 14, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(363, 13, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(364, 12, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(365, 11, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(366, 8, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(367, 5, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(368, 34, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(369, 33, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(370, 26, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(371, 16, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(372, 15, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(373, 14, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(374, 13, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(375, 12, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(376, 11, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(377, 8, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(378, 5, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(379, 34, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(380, 33, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(381, 26, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(382, 16, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(383, 15, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(384, 14, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(385, 13, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(386, 12, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(387, 11, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(388, 8, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(389, 5, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(390, 34, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(391, 33, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(392, 26, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(393, 16, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(394, 15, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(395, 14, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(396, 13, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(397, 12, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(398, 11, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(399, 8, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(400, 5, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(401, 34, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(402, 33, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(403, 26, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(404, 16, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(405, 15, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(406, 14, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(407, 13, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(408, 12, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(409, 11, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(410, 8, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(411, 5, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(412, 34, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(413, 33, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(414, 26, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(415, 16, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(416, 15, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(417, 14, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(418, 13, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(419, 12, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(420, 11, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(421, 8, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(422, 5, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(423, 34, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(424, 33, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(425, 26, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(426, 16, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(427, 15, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(428, 14, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(429, 13, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(430, 12, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(431, 11, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(432, 8, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(433, 5, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(434, 34, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(435, 33, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(436, 26, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(437, 16, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(438, 15, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(439, 14, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(440, 13, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(441, 12, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(442, 11, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(443, 8, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(444, 5, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(445, 34, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(446, 33, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(447, 26, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(448, 16, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(449, 15, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(450, 14, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(451, 13, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(452, 12, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(453, 11, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(454, 8, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(455, 5, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(456, 34, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(457, 33, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(458, 26, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(459, 16, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(460, 15, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(461, 14, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(462, 13, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(463, 12, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(464, 11, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(465, 8, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(466, 5, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(467, 34, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(468, 33, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(469, 26, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(470, 16, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(471, 15, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(472, 14, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(473, 13, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(474, 12, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(475, 11, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(476, 8, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(477, 5, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(513, 22, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(514, 21, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(515, 20, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(516, 7, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(517, 22, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(518, 21, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(519, 20, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(520, 7, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(521, 22, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(522, 21, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(523, 20, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(524, 7, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(525, 22, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(526, 21, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(527, 20, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(528, 7, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(529, 22, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(530, 21, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(531, 20, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(532, 7, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(533, 22, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(534, 21, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(535, 20, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(536, 7, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(537, 22, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(538, 21, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(539, 20, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(540, 7, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(541, 22, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(542, 21, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(543, 20, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(544, 7, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(545, 22, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(546, 21, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(547, 20, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(548, 7, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(549, 22, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(550, 21, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(551, 20, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(552, 7, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(553, 22, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(554, 21, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(555, 20, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(556, 7, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(557, 22, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(558, 21, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(559, 20, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(560, 7, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(561, 22, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(562, 21, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(563, 20, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(564, 7, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(565, 22, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(566, 21, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(567, 20, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(568, 7, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(569, 22, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(570, 21, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(571, 20, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(572, 7, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(573, 22, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(574, 21, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(575, 20, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(576, 7, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(577, 22, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(578, 21, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(579, 20, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(580, 7, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(581, 22, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(582, 21, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(583, 20, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(584, 7, 29, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(585, 22, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(586, 21, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(587, 20, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(588, 7, 30, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(589, 22, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(590, 21, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(591, 20, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(592, 7, 31, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(593, 22, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(594, 21, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(595, 20, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(596, 7, 32, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(640, 32, 5, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(641, 32, 10, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(642, 32, 11, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(643, 32, 12, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(644, 32, 13, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(645, 32, 14, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(646, 32, 15, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(647, 32, 16, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(648, 32, 17, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(649, 32, 18, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(650, 32, 19, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(651, 32, 20, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(652, 32, 21, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(653, 32, 22, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(654, 32, 23, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(655, 32, 24, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(656, 32, 25, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(657, 32, 26, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(658, 32, 27, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(659, 32, 28, '2025-07-22 14:52:16', '2025-07-22 14:52:16'),
(671, 19, 1, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(672, 18, 1, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(673, 17, 1, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(674, 19, 2, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(675, 18, 2, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(676, 17, 2, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(677, 19, 3, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(678, 18, 3, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(679, 17, 3, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(680, 19, 5, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(681, 18, 5, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(682, 17, 5, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(683, 19, 8, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(684, 18, 8, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(685, 17, 8, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(686, 19, 9, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(687, 18, 9, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(688, 17, 9, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(689, 19, 10, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(690, 18, 10, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(691, 17, 10, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(692, 19, 11, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(693, 18, 11, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(694, 17, 11, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(695, 19, 12, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(696, 18, 12, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(697, 17, 12, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(698, 19, 13, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(699, 18, 13, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(700, 17, 13, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(701, 19, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(702, 18, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(703, 17, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(704, 19, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(705, 18, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(706, 17, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(707, 19, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(708, 18, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(709, 17, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(710, 19, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(711, 18, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(712, 17, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(713, 19, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(714, 18, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(715, 17, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(716, 19, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(717, 18, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(718, 17, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(719, 19, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(720, 18, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(721, 17, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(734, 36, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(735, 35, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(736, 36, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(737, 35, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(738, 36, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(739, 35, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(740, 36, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(741, 35, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(742, 36, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(743, 35, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(744, 36, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(745, 35, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(746, 36, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(747, 35, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(748, 36, 21, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(749, 35, 21, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(750, 36, 22, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(751, 35, 22, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(752, 36, 23, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(753, 35, 23, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(754, 36, 24, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(755, 35, 24, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(756, 36, 25, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(757, 35, 25, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(758, 36, 26, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(759, 35, 26, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(760, 36, 27, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(761, 35, 27, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(762, 36, 28, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(763, 35, 28, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(764, 36, 29, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(765, 35, 29, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(766, 36, 30, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(767, 35, 30, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(768, 36, 31, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(769, 35, 31, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(770, 36, 32, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(771, 35, 32, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(797, 38, 5, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(798, 37, 5, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(799, 38, 13, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(800, 37, 13, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(801, 38, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(802, 37, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(803, 38, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(804, 37, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(805, 38, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(806, 37, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(807, 38, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(808, 37, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(809, 38, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(810, 37, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(811, 38, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(812, 37, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(813, 38, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(814, 37, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(815, 38, 21, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(816, 37, 21, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(817, 38, 22, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(818, 37, 22, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(819, 38, 23, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(820, 37, 23, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(821, 38, 24, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(822, 37, 24, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(823, 38, 25, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(824, 37, 25, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(825, 38, 26, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(826, 37, 26, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(827, 38, 27, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(828, 37, 27, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(829, 38, 28, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(830, 37, 28, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(831, 38, 29, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(832, 37, 29, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(833, 38, 30, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(834, 37, 30, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(860, 31, 3, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(861, 31, 5, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(862, 31, 9, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(863, 31, 10, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(864, 31, 11, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(865, 31, 12, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(866, 31, 13, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(867, 31, 14, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(868, 31, 15, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(869, 31, 16, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(870, 31, 17, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(871, 31, 18, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(872, 31, 19, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(873, 31, 20, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(874, 31, 21, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(875, 31, 22, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(876, 31, 23, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(877, 31, 24, '2025-07-22 14:52:17', '2025-07-22 14:52:17'),
(891, 38, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(892, 37, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(893, 36, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(894, 35, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(895, 34, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(896, 33, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(897, 32, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(898, 31, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(899, 30, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(900, 29, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(901, 28, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(902, 27, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(903, 26, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(904, 22, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(905, 21, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(906, 20, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(907, 16, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(908, 15, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(909, 14, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(910, 13, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(911, 12, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(912, 11, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(913, 10, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(914, 8, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(915, 7, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(916, 5, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(917, 2, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(918, 1, 1, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(919, 38, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(920, 37, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(921, 36, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(922, 35, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(923, 34, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(924, 33, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(925, 32, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(926, 31, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(927, 30, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(928, 29, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(929, 28, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(930, 27, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(931, 26, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(932, 22, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(933, 21, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(934, 20, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(935, 16, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(936, 15, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(937, 14, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(938, 13, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(939, 12, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(940, 11, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(941, 10, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(942, 8, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(943, 7, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(944, 5, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(945, 2, 2, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(946, 38, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(947, 37, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(948, 36, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(949, 35, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(950, 32, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(951, 30, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(952, 29, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(953, 28, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(954, 27, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(955, 22, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(956, 21, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(957, 20, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(958, 10, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(959, 7, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(960, 2, 3, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(961, 36, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(962, 35, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(963, 30, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(964, 29, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(965, 28, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(966, 27, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(967, 10, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(968, 2, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(969, 1, 5, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(970, 38, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(971, 37, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(972, 36, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(973, 35, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(974, 34, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(975, 33, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(976, 32, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(977, 31, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(978, 30, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(979, 29, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(980, 28, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(981, 27, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(982, 26, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(983, 22, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(984, 21, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(985, 20, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(986, 19, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(987, 18, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(988, 17, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(989, 16, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(990, 15, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(991, 14, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(992, 13, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(993, 12, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(994, 11, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(995, 10, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(996, 8, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(997, 7, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(998, 5, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(999, 2, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1000, 1, 6, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1001, 38, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1002, 37, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1003, 36, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1004, 35, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1005, 34, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1006, 33, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1007, 32, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1008, 31, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1009, 30, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1010, 29, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1011, 28, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1012, 27, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1013, 26, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1014, 22, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1015, 21, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1016, 20, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1017, 19, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1018, 18, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1019, 17, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1020, 16, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1021, 15, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1022, 14, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1023, 13, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1024, 12, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1025, 11, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1026, 10, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1027, 8, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1028, 7, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1029, 5, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1030, 2, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1031, 1, 7, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1032, 38, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1033, 37, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1034, 36, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1035, 35, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1036, 34, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1037, 33, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1038, 32, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1039, 31, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1040, 30, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1041, 29, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1042, 28, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1043, 27, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1044, 26, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1045, 22, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1046, 21, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1047, 20, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1048, 16, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1049, 15, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1050, 14, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1051, 13, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1052, 12, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1053, 11, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1054, 10, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1055, 8, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1056, 7, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1057, 5, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1058, 2, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1059, 1, 8, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1060, 38, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1061, 37, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1062, 36, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1063, 35, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1064, 32, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1065, 30, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1066, 29, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1067, 28, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1068, 27, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1069, 22, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1070, 21, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1071, 20, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1072, 10, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1073, 7, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1074, 2, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1075, 1, 9, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1076, 38, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1077, 37, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1078, 36, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1079, 35, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1080, 30, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1081, 29, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1082, 28, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1083, 27, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1084, 22, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1085, 21, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1086, 20, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1087, 10, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1088, 7, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1089, 2, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1090, 1, 10, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1091, 38, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1092, 37, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1093, 36, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1094, 35, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1095, 30, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1096, 29, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1097, 28, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1098, 27, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1099, 22, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1100, 21, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1101, 20, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1102, 10, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1103, 7, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1104, 2, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1105, 1, 11, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1106, 38, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1107, 37, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1108, 36, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1109, 35, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1110, 30, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1111, 29, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1112, 28, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1113, 27, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1114, 22, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1115, 21, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1116, 20, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1117, 10, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1118, 7, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1119, 2, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1120, 1, 12, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1121, 36, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1122, 35, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1123, 30, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1124, 29, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1125, 28, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17');
INSERT INTO `machine_charges` (`id`, `machine_id`, `charge_id`, `created_at`, `updated_at`) VALUES
(1126, 27, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1127, 10, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1128, 2, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1129, 1, 13, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1130, 30, 14, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1131, 29, 14, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1132, 28, 14, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1133, 27, 14, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1134, 10, 14, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1135, 2, 14, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1136, 1, 14, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1137, 30, 15, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1138, 29, 15, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1139, 28, 15, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1140, 27, 15, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1141, 10, 15, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1142, 2, 15, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1143, 1, 15, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1144, 19, 21, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1145, 18, 21, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1146, 17, 21, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1147, 19, 22, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1148, 18, 22, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1149, 17, 22, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1150, 19, 23, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1151, 18, 23, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1152, 17, 23, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1153, 19, 24, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1154, 18, 24, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1155, 17, 24, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1156, 31, 25, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1157, 19, 25, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1158, 18, 25, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1159, 17, 25, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1160, 31, 26, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1161, 19, 26, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1162, 18, 26, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1163, 17, 26, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1164, 34, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1165, 33, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1166, 31, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1167, 26, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1168, 19, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1169, 18, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1170, 17, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1171, 16, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1172, 15, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1173, 14, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1174, 13, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1175, 12, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1176, 11, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1177, 8, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1178, 5, 27, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1179, 34, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1180, 33, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1181, 31, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1182, 26, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1183, 19, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1184, 18, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1185, 17, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1186, 16, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1187, 15, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1188, 14, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1189, 13, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1190, 12, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1191, 11, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1192, 8, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1193, 5, 28, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1194, 34, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1195, 33, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1196, 32, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1197, 31, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1198, 26, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1199, 19, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1200, 18, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1201, 17, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1202, 16, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1203, 15, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1204, 14, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1205, 13, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1206, 12, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1207, 11, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1208, 8, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1209, 5, 29, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1210, 34, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1211, 33, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1212, 32, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1213, 31, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1214, 26, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1215, 19, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1216, 18, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1217, 17, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1218, 16, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1219, 15, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1220, 14, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1221, 13, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1222, 12, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1223, 11, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1224, 8, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1225, 5, 30, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1226, 38, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1227, 37, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1228, 34, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1229, 33, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1230, 32, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1231, 31, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1232, 26, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1233, 19, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1234, 18, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1235, 17, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1236, 16, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1237, 15, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1238, 14, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1239, 13, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1240, 12, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1241, 11, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1242, 8, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1243, 5, 31, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1244, 38, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1245, 37, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1246, 34, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1247, 33, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1248, 32, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1249, 31, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1250, 26, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1251, 19, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1252, 18, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1253, 17, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1254, 16, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1255, 15, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1256, 14, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1257, 13, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1258, 12, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1259, 11, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1260, 8, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1261, 5, 32, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1262, 38, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1263, 37, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1264, 36, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1265, 35, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1266, 34, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1267, 33, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1268, 32, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1269, 31, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1270, 26, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1271, 22, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1272, 21, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1273, 20, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1274, 19, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1275, 18, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1276, 17, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1277, 16, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1278, 15, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1279, 14, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1280, 13, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1281, 12, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1282, 11, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1283, 8, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1284, 7, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1285, 5, 33, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1286, 38, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1287, 37, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1288, 36, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1289, 35, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1290, 34, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1291, 33, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1292, 32, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1293, 31, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1294, 26, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1295, 22, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1296, 21, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1297, 20, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1298, 19, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1299, 18, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1300, 17, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1301, 16, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1302, 15, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1303, 14, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1304, 13, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1305, 12, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1306, 11, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1307, 8, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1308, 7, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1309, 5, 34, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1310, 38, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1311, 37, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1312, 36, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1313, 35, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1314, 34, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1315, 33, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1316, 32, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1317, 31, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1318, 26, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1319, 22, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1320, 21, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1321, 20, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1322, 19, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1323, 18, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1324, 17, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1325, 16, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1326, 15, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1327, 14, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1328, 13, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1329, 12, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1330, 11, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1331, 8, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1332, 7, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1333, 5, 35, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1334, 38, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1335, 37, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1336, 36, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1337, 35, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1338, 34, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1339, 33, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1340, 32, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1341, 31, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1342, 26, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1343, 22, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1344, 21, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1345, 20, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1346, 19, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1347, 18, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1348, 17, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1349, 16, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1350, 15, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1351, 14, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1352, 13, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1353, 12, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1354, 11, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1355, 8, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1356, 7, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1357, 5, 36, '2025-07-22 15:08:17', '2025-07-22 15:08:17'),
(1361, 48, 17, '2025-10-02 09:57:46', '2025-10-02 09:57:46'),
(1362, 48, 18, '2025-10-02 09:57:46', '2025-10-02 09:57:46'),
(1363, 48, 38, '2025-10-02 09:57:46', '2025-10-02 09:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '0001_01_01_000000_create_users_table', 1),
(27, '0001_01_01_000001_create_cache_table', 1),
(28, '0001_01_01_000002_create_jobs_table', 1),
(29, '2025_07_09_095917_create_personal_access_tokens_table', 1),
(30, '2025_07_09_101445_add_role_to_users_table', 1),
(31, '2025_07_09_111940_create_branches_table', 1),
(32, '2025_07_09_111942_create_branch_availabilities_table', 1),
(33, '2025_07_10_002511_create_machines_table', 1),
(34, '2025_07_10_091432_create_charges_table', 1),
(35, '2025_07_10_091611_create_categories_table', 1),
(36, '2025_07_10_091708_create_machine_charges_table', 1),
(37, '2025_07_10_091717_create_machine_categories_table', 1),
(38, '2025_07_11_083422_create_movements_table', 2),
(39, '2025_07_11_083806_create_exercises_table', 2),
(40, '2025_07_11_083807_create_programmes_table', 2),
(41, '2025_07_11_083807_create_workout_exercises_table', 2),
(42, '2025_07_11_083807_create_workouts_table', 2),
(43, '2025_07_11_083808_create_programme_workouts_table', 2),
(44, '2025_07_11_114203_create_user_progresses_table', 3),
(45, '2025_07_24_123332_create_coaches_table', 4),
(46, '2025_07_24_123333_create_coach_availabilities_table', 4),
(47, '2025_07_24_123333_create_courses_table', 4),
(48, '2025_07_24_123334_create_group_training_sessions_table', 4),
(49, '2025_07_24_123334_create_specialities_table', 4),
(50, '2025_07_24_123335_create_coach_specialities_table', 4),
(51, '2025_07_31_083927_add_photo_to_coaches_table', 5),
(52, '2025_07_31_124059_create_group_session_user_table', 6),
(53, '2025_08_01_175051_create_videos_table', 7),
(54, '2025_08_06_100259_create_bookingtable', 8),
(55, '2025_08_12_083636_add_media_to_movements_table', 9),
(56, '2025_10_02_093338_create_parametres_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `movements`
--

CREATE TABLE `movements` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movements`
--

INSERT INTO `movements` (`id`, `name`, `description`, `video_url`, `media_url`, `media_type`, `created_at`, `updated_at`) VALUES
(1, 'Squat', 'A compound lower body exercise targeting quads, hamstrings, and glutes', 'https://www.youtube.com/watch?v=example', 'https://www.youtube.com/watch?v=example', 'video', '2025-07-11 08:22:52', '2025-07-11 08:22:52'),
(2, 'Squatjump', 'A compound lower body exercise', NULL, NULL, NULL, '2025-07-11 08:33:16', '2025-07-11 08:33:16'),
(3, 'Push-up', 'Exercice de base pour pectoraux, triceps et épaules', 'https://www.youtube.com/watch?v=IODxDxX7oi4', 'https://www.youtube.com/watch?v=IODxDxX7oi4', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(4, 'Pull-up', 'Exercice de traction pour dorsaux et biceps', 'https://www.youtube.com/watch?v=eGo4IYlbE5g', 'https://www.youtube.com/watch?v=eGo4IYlbE5g', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(5, 'Bench Press', 'Développé couché pour pectoraux et triceps', 'https://www.youtube.com/watch?v=rT7DgCr-3pg', 'https://www.youtube.com/watch?v=rT7DgCr-3pg', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(6, 'Shoulder Press', 'Développé militaire pour épaules et triceps', 'https://www.youtube.com/watch?v=qEwKCR5JCog', 'https://www.youtube.com/watch?v=qEwKCR5JCog', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(7, 'Bicep Curl', 'Curl biceps avec haltères ou barre', 'https://www.youtube.com/watch?v=ykJmrZ5v0Oo', 'https://www.youtube.com/watch?v=ykJmrZ5v0Oo', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(8, 'Tricep Dips', 'Extension triceps sur chaise ou barres parallèles', 'https://www.youtube.com/watch?v=6kALZikXxLc', 'https://www.youtube.com/watch?v=6kALZikXxLc', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(9, 'Lat Pulldown', 'Tirage vertical pour les dorsaux', 'https://www.youtube.com/watch?v=CAwf7n6Luuc', 'https://www.youtube.com/watch?v=CAwf7n6Luuc', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(10, 'Deadlift', 'Soulevé de terre pour chaîne postérieure complète', 'https://www.youtube.com/watch?v=op9kVnSso6Q', 'https://www.youtube.com/watch?v=op9kVnSso6Q', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(11, 'Lunges', 'Fentes avant pour quadriceps et fessiers', 'https://www.youtube.com/watch?v=QOVaHwm-Q6U', 'https://www.youtube.com/watch?v=QOVaHwm-Q6U', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(12, 'Bulgarian Split Squat', 'Squat bulgare pour jambes et fessiers', 'https://www.youtube.com/watch?v=2C-uNgKwPLE', 'https://www.youtube.com/watch?v=2C-uNgKwPLE', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(13, 'Calf Raises', 'Élévations mollets debout ou assis', 'https://www.youtube.com/watch?v=gwLzBJYoWlI', 'https://www.youtube.com/watch?v=gwLzBJYoWlI', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(14, 'Hip Thrust', 'Poussée de hanches pour fessiers', 'https://www.youtube.com/watch?v=SEdqd1n0cvg', 'https://www.youtube.com/watch?v=SEdqd1n0cvg', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(15, 'Leg Press', 'Presse à cuisses pour quadriceps et fessiers', 'https://www.youtube.com/watch?v=IZxyjW7MPJQ', 'https://www.youtube.com/watch?v=IZxyjW7MPJQ', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(16, 'Burpees', 'Exercice complet cardio-musculaire', 'https://www.youtube.com/watch?v=auBLPXO8Fww', 'https://www.youtube.com/watch?v=auBLPXO8Fww', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(17, 'Mountain Climbers', 'Grimpeur pour cardio et gainage', 'https://www.youtube.com/watch?v=wQq3ybaLp8U', 'https://www.youtube.com/watch?v=wQq3ybaLp8U', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(18, 'Jumping Jacks', 'Écartés sautés pour cardio', 'https://www.youtube.com/watch?v=iSSAk4XCsRA', 'https://www.youtube.com/watch?v=iSSAk4XCsRA', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(19, 'Clean and Press', 'Épaulé-jeté complet', 'https://www.youtube.com/watch?v=KwYJTpQ_x5A', 'https://www.youtube.com/watch?v=KwYJTpQ_x5A', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(20, 'Thrusters', 'Squat + développé en un mouvement', 'https://www.youtube.com/watch?v=L219ltL15zk', 'https://www.youtube.com/watch?v=L219ltL15zk', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(21, 'Plank', 'Gainage statique pour abdominaux', 'https://www.youtube.com/watch?v=pSHjTRCQxIw', 'https://www.youtube.com/watch?v=pSHjTRCQxIw', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(22, 'Russian Twists', 'Rotations russes pour obliques', 'https://www.youtube.com/watch?v=wkD8rjkodUI', 'https://www.youtube.com/watch?v=wkD8rjkodUI', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(23, 'Dead Bug', 'Insecte mort pour stabilité du core', 'https://www.youtube.com/watch?v=g_BYB0R-4Ws', 'https://www.youtube.com/watch?v=g_BYB0R-4Ws', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(24, 'Bicycle Crunches', 'Pédalage pour abdominaux', 'https://www.youtube.com/watch?v=9FGilxCbdz8', 'https://www.youtube.com/watch?v=9FGilxCbdz8', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(25, 'Leg Raises', 'Élévations de jambes pour abdos inférieurs', 'https://www.youtube.com/watch?v=JB2oyawG9KI', 'https://www.youtube.com/watch?v=JB2oyawG9KI', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(26, 'High Knees', 'Montées de genoux sur place', 'https://www.youtube.com/watch?v=8opcQdC-V-U', 'https://www.youtube.com/watch?v=8opcQdC-V-U', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(27, 'Box Jumps', 'Sauts sur box pour explosivité', 'https://www.youtube.com/watch?v=NBY9-kTuHEk', 'https://www.youtube.com/watch?v=NBY9-kTuHEk', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(28, 'Battle Ropes', 'Cordes ondulatoires pour cardio intense', 'https://www.youtube.com/watch?v=w6jODhJNB3s', 'https://www.youtube.com/watch?v=w6jODhJNB3s', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(29, 'Kettlebell Swings', 'Balanciers kettlebell pour puissance', 'https://www.youtube.com/watch?v=YSxHifyI6s8', 'https://www.youtube.com/watch?v=YSxHifyI6s8', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(30, 'Cat-Cow Stretch', 'Étirement chat-vache pour colonne', 'https://www.youtube.com/watch?v=K9bK0BwKFjs', 'https://www.youtube.com/watch?v=K9bK0BwKFjs', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(31, 'Downward Dog', 'Chien tête en bas - yoga', 'https://www.youtube.com/watch?v=Rnzz32W6nCg', 'https://www.youtube.com/watch?v=Rnzz32W6nCg', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(32, 'Pigeon Pose', 'Posture du pigeon pour hanches', 'https://www.youtube.com/watch?v=0_zPqA65Nok', 'https://www.youtube.com/watch?v=0_zPqA65Nok', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(33, 'Cobra Stretch', 'Étirement cobra pour dos', 'https://www.youtube.com/watch?v=z21CSjnWmP0', 'https://www.youtube.com/watch?v=z21CSjnWmP0', 'video', '2025-07-22 14:42:41', '2025-07-22 14:42:41'),
(34, 'Bicycle Crunche', 'Pédalage pour abdominaux', 'https://www.youtube.com/watch?v=9FGilxCbdz8', 'https://www.youtube.com/watch?v=9FGilxCbdz8', 'video', '2025-08-12 07:41:53', '2025-08-12 07:41:53'),
(35, 'Bicycle Crunches', 'Pédalage pour abdominaux', 'https://www.youtube.com/watch?v=9FGilxCbdz8', 'https://www.youtube.com/watch?v=9FGilxCbdz8', 'video', '2025-08-12 07:42:27', '2025-08-12 07:42:27');

-- --------------------------------------------------------

--
-- Table structure for table `parametres`
--

CREATE TABLE `parametres` (
  `id` bigint UNSIGNED NOT NULL,
  `cle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Clé unique du paramètre',
  `valeur` text COLLATE utf8mb4_unicode_ci COMMENT 'Valeur du paramètre',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text' COMMENT 'Type: text, textarea, image, file, json, boolean',
  `groupe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Groupe de paramètres (ex: contact, social, seo)',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Description du paramètre',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parametres`
--

INSERT INTO `parametres` (`id`, `cle`, `valeur`, `type`, `groupe`, `description`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'GymProo', 'text', 'site', 'Nom de l\'application', '2025-10-02 09:02:40', '2025-10-02 09:59:10'),
(5, 'welcome_message', 'Find Your Perfect Gymy', 'text', 'site', 'Message de bienvenue sur la page d\'accueil', '2025-10-02 11:15:05', '2025-10-02 10:42:12'),
(6, 'site_description', 'Premium Fitness Experience', 'text', 'site', 'Description du site', '2025-10-02 11:15:05', '2025-10-02 11:15:05'),
(7, 'contact_phone', '+212 6 12 34 56 78', 'text', 'contact', 'Numéro de téléphone de contact', '2025-10-02 11:15:24', '2025-10-02 11:15:24'),
(8, 'contact_email', 'contact@gympro.com', 'text', 'contact', 'Adresse email de contact', '2025-10-02 11:15:24', '2025-10-02 11:15:24'),
(9, 'contact_address', '123 Fitness Street, Casablanca', 'text', 'contact', 'Adresse physique du siège', '2025-10-02 11:15:24', '2025-10-02 11:15:24'),
(10, 'facebook_url', 'https://facebook.com/gympro', 'text', 'social', 'Lien vers la page Facebook', '2025-10-02 11:15:44', '2025-10-02 11:15:44'),
(11, 'instagram_url', 'https://instagram.com/gympro', 'text', 'social', 'Lien vers la page Instagram', '2025-10-02 11:15:44', '2025-10-02 11:15:44'),
(12, 'twitter_url', 'https://twitter.com/gympro', 'text', 'social', 'Lien vers la page Twitter', '2025-10-02 11:15:44', '2025-10-02 11:15:44'),
(13, 'promo_title_1', 'Summer Special', 'text', 'promotions', 'Titre de la première promotion', '2025-10-02 11:16:04', '2025-10-02 11:16:04'),
(14, 'promo_subtitle_1', 'Get 20% off on all memberships', 'text', 'promotions', 'Sous-titre de la première promotion', '2025-10-02 11:16:04', '2025-10-02 11:16:04'),
(15, 'promo_title_2', 'New Member Offer', 'text', 'promotions', 'Titre de la deuxième promotion', '2025-10-02 11:16:04', '2025-10-02 11:16:04'),
(16, 'promo_subtitle_2', 'First month free for new users', 'text', 'promotions', 'Sous-titre de la deuxième promotion', '2025-10-02 11:16:04', '2025-10-02 11:16:04'),
(17, 'meta_title', 'GymPro - Premium Fitness Club', 'text', 'seo', 'Titre meta pour le SEO', '2025-10-02 11:16:20', '2025-10-02 11:16:20'),
(18, 'meta_description', 'Join GymPro for the best fitness experience with professional trainers and modern equipment', 'text', 'seo', 'Description meta pour le SEO', '2025-10-02 11:16:20', '2025-10-02 11:16:20'),
(19, 'meta_keywords', 'gym, fitness, workout, training, health, exercise', 'text', 'seo', 'Mots-clés pour le SEO', '2025-10-02 11:16:20', '2025-10-02 11:16:20'),
(20, 'opening_hours', '06:00-22:00', 'text', 'general', 'Heures d\'ouverture', '2025-10-02 11:16:34', '2025-10-02 11:16:34'),
(21, 'maintenance_mode', 'false', 'boolean', 'general', 'Mode maintenance du site', '2025-10-02 11:16:34', '2025-12-03 17:06:30'),
(22, 'currency', 'DH', 'text', 'general', 'Devise utilisée', '2025-10-02 11:16:34', '2025-10-02 11:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(128, 'App\\Models\\User', 1, 'auth_token', '752eca24eb7d2d8e2b05e573a219122c0550d0636b3f1b0bd5ef0b8a5edfb54a', '[\"*\"]', '2025-07-22 09:05:51', NULL, '2025-07-22 08:34:48', '2025-07-22 09:05:51'),
(129, 'App\\Models\\User', 1, 'auth_token', '23167a1f714907e0e28282f2d52a524d3516cc0f3e119ffefbf9518f2f4aff47', '[\"*\"]', '2025-07-22 09:45:38', NULL, '2025-07-22 09:06:59', '2025-07-22 09:45:38'),
(130, 'App\\Models\\User', 1, 'auth_token', '2365aa6abcdfae58882c6ec0e2d2484bb029b20cb49bdc5bfef7111a9daca219', '[\"*\"]', '2025-07-22 09:51:13', NULL, '2025-07-22 09:47:47', '2025-07-22 09:51:13'),
(131, 'App\\Models\\User', 1, 'auth_token', '1964dc1d7daf3c861725b84e115d496188a3081504152036c249501cd54cac39', '[\"*\"]', '2025-07-22 09:52:57', NULL, '2025-07-22 09:52:55', '2025-07-22 09:52:57'),
(132, 'App\\Models\\User', 2, 'auth_token', '1ea25576802a6b7171a6e3724fe0517c28feaa893963965e7ddfc756fbb12493', '[\"*\"]', '2025-07-22 09:53:37', NULL, '2025-07-22 09:53:33', '2025-07-22 09:53:37'),
(133, 'App\\Models\\User', 1, 'auth_token', '7f9202bd7fff775b387ba951d2fe0efad5c6256a768dcd80b1ecd2c2bf9dc416', '[\"*\"]', '2025-07-22 10:13:31', NULL, '2025-07-22 09:53:51', '2025-07-22 10:13:31'),
(134, 'App\\Models\\User', 1, 'auth_token', '9c34de875d6ecb1272a4485e235cae99f0c6e7ff3f507fb9f28c3c6c2eae2a17', '[\"*\"]', '2025-07-22 10:35:35', NULL, '2025-07-22 10:21:23', '2025-07-22 10:35:35'),
(135, 'App\\Models\\User', 1, 'auth_token', '4686b3141371a2291690c4f9b7770c547cbdcd71fbcd26b5366c99bd909868f7', '[\"*\"]', '2025-07-22 10:45:33', NULL, '2025-07-22 10:39:52', '2025-07-22 10:45:33'),
(136, 'App\\Models\\User', 1, 'auth_token', 'eba2886a1cfc1caf566052b0ff80e3440b36ef873423d5eccbb6f6542e61803b', '[\"*\"]', '2025-07-22 10:46:01', NULL, '2025-07-22 10:45:59', '2025-07-22 10:46:01'),
(137, 'App\\Models\\User', 1, 'auth_token', 'b0dbb867d76e7cfd6b90421883554cf9770e0895e58f0348a1e93e9965383c5c', '[\"*\"]', '2025-07-22 11:07:23', NULL, '2025-07-22 10:46:47', '2025-07-22 11:07:23'),
(138, 'App\\Models\\User', 1, 'auth_token', 'bd483af84e86d276b5acfeeec5bca1a138f0eb7ba1991fee5afdc6c624d89b4b', '[\"*\"]', '2025-07-22 11:23:27', NULL, '2025-07-22 11:09:03', '2025-07-22 11:23:27'),
(139, 'App\\Models\\User', 1, 'auth_token', '61695696f60fa8cd1081412128ab7d5b9e50697044466f3ccec60f9908c7f276', '[\"*\"]', '2025-07-22 11:44:30', NULL, '2025-07-22 11:31:36', '2025-07-22 11:44:30'),
(140, 'App\\Models\\User', 1, 'auth_token', '17b255cc900183ae44d8e37933505a35d02ae1b569d57449d35f9d5816662a32', '[\"*\"]', '2025-07-22 11:58:34', NULL, '2025-07-22 11:55:37', '2025-07-22 11:58:34'),
(141, 'App\\Models\\User', 1, 'auth_token', 'dc14751b20617bb227bf27226f748e0442d8a3b468232c241d1a2bbf38e4e80b', '[\"*\"]', '2025-07-22 12:01:42', NULL, '2025-07-22 12:00:16', '2025-07-22 12:01:42'),
(142, 'App\\Models\\User', 1, 'auth_token', '18d9d0e7d38fd9448bdc7d7dc060ec38de26490a39ab3395a6564663b11cd1c3', '[\"*\"]', '2025-07-22 12:12:21', NULL, '2025-07-22 12:09:32', '2025-07-22 12:12:21'),
(143, 'App\\Models\\User', 1, 'auth_token', 'e491b9e54ddd93b0a37a60225a21fe465f77957db43d65dee5649dc3a9ade678', '[\"*\"]', '2025-07-22 12:19:48', NULL, '2025-07-22 12:16:13', '2025-07-22 12:19:48'),
(144, 'App\\Models\\User', 1, 'auth_token', '88d43a7c81ab64c3534a8b2cccf650213d106e1b5783bb5ab6ebc7999141ecb6', '[\"*\"]', NULL, NULL, '2025-07-22 13:39:35', '2025-07-22 13:39:35'),
(145, 'App\\Models\\User', 1, 'auth_token', '16c75bca556b30ad647a42c97b8609a4f2cbfd5216e052a8d7a7e13ee840e6b7', '[\"*\"]', '2025-07-22 14:22:20', NULL, '2025-07-22 13:40:16', '2025-07-22 14:22:20'),
(146, 'App\\Models\\User', 1, 'auth_token', '11e2c15f1ac0388441644b8bf68210b0841c153763ccbbf4fcca4b1b2fc74f3f', '[\"*\"]', '2025-07-22 14:54:04', NULL, '2025-07-22 14:27:29', '2025-07-22 14:54:04'),
(147, 'App\\Models\\User', 1, 'auth_token', '78edfa1d828c2080f28eae634e8f56552aface1734f9baa2fceb8306fe6219e8', '[\"*\"]', '2025-07-22 16:03:34', NULL, '2025-07-22 16:01:36', '2025-07-22 16:03:34'),
(148, 'App\\Models\\User', 1, 'auth_token', 'ff0c42628e588b318ae2c78769d8d13d13920805a1cfbbfe6e5cec880d907924', '[\"*\"]', '2025-07-22 16:13:34', NULL, '2025-07-22 16:05:40', '2025-07-22 16:13:34'),
(149, 'App\\Models\\User', 1, 'auth_token', 'a9b40082d557e61fbe9f4645229cf0cd04de679688a9c428b7610a93111bd14a', '[\"*\"]', '2025-07-22 16:36:05', NULL, '2025-07-22 16:26:37', '2025-07-22 16:36:05'),
(150, 'App\\Models\\User', 1, 'auth_token', 'e293bd6ef1c578f9df237952f292ffc378a26a36213bb211d9d43f15f3dab079', '[\"*\"]', '2025-07-22 16:44:59', NULL, '2025-07-22 16:40:10', '2025-07-22 16:44:59'),
(151, 'App\\Models\\User', 1, 'auth_token', 'f48981bd8a4e62f60b9e9937799c110be0c0d010ca36eb533487dfa13abe85a8', '[\"*\"]', '2025-07-24 11:31:18', NULL, '2025-07-24 11:31:09', '2025-07-24 11:31:18'),
(152, 'App\\Models\\User', 3, 'auth_token', '5efa00e627ec0673b1097e8a55751d8d3d8af4f2456b37649b5d0887d08c83dc', '[\"*\"]', '2025-07-25 09:36:49', NULL, '2025-07-25 09:31:19', '2025-07-25 09:36:49'),
(153, 'App\\Models\\User', 3, 'auth_token', '1bcf975867102666d011c16fa2820fd0727b7b35a2f15a1b353619a507e4d551', '[\"*\"]', '2025-07-25 09:50:38', NULL, '2025-07-25 09:46:21', '2025-07-25 09:50:38'),
(154, 'App\\Models\\User', 1, 'auth_token', 'd0b68ea631d9eaab5f475807f1fe637026bdb8d8d4c3d452e183ea4d56ac5e0c', '[\"*\"]', '2025-07-31 07:34:37', NULL, '2025-07-31 07:28:56', '2025-07-31 07:34:37'),
(155, 'App\\Models\\User', 1, 'auth_token', '98fa32808b8d42b76fe3e4e084afee3f59aa2a21fb36a90fe4952f09dd000758', '[\"*\"]', NULL, NULL, '2025-07-31 07:47:42', '2025-07-31 07:47:42'),
(156, 'App\\Models\\User', 1, 'auth_token', 'ab7723eddd272a3c49c081eb2b1e6ee7642146619df49bc0a8cf00f1b35ee244', '[\"*\"]', NULL, NULL, '2025-07-31 07:49:41', '2025-07-31 07:49:41'),
(157, 'App\\Models\\User', 1, 'auth_token', '0f32ae52d0b8745649aed8bb49ffbebc2a0b889248e8858127328c3b167b1aed', '[\"*\"]', NULL, NULL, '2025-07-31 08:19:13', '2025-07-31 08:19:13'),
(158, 'App\\Models\\User', 1, 'auth_token', '1ddbfcaf51b2314027ea8421a641f84e2906ebee0b32a8e10cca788cb732165f', '[\"*\"]', NULL, NULL, '2025-07-31 08:26:46', '2025-07-31 08:26:46'),
(159, 'App\\Models\\User', 1, 'auth_token', '9e3363279f4c62701fa2617dbb5a23d277fc146cd24e2fdaef874e4e907062a3', '[\"*\"]', NULL, NULL, '2025-07-31 08:34:24', '2025-07-31 08:34:24'),
(160, 'App\\Models\\User', 1, 'auth_token', '3e84f1190d56bc1a325f183d96cb06e939f4369263cfbd9671fafac19ccc6b2c', '[\"*\"]', NULL, NULL, '2025-07-31 08:44:32', '2025-07-31 08:44:32'),
(161, 'App\\Models\\User', 1, 'auth_token', 'aaac0b10ccb69856d37ad54e939ceb5f59d6850707dd8c0c4d22476013107fdd', '[\"*\"]', NULL, NULL, '2025-07-31 08:44:53', '2025-07-31 08:44:53'),
(162, 'App\\Models\\User', 1, 'auth_token', '1b6e98a479cc4ec21730031598600869240dfec70bf8e4ec8932f4943054f633', '[\"*\"]', NULL, NULL, '2025-07-31 09:17:37', '2025-07-31 09:17:37'),
(163, 'App\\Models\\User', 1, 'auth_token', '8e91e3a8ed2c90e5dfa0ef3f34f2ff7f49c1f7118ffce92790236c6f31adb0fc', '[\"*\"]', NULL, NULL, '2025-07-31 09:23:46', '2025-07-31 09:23:46'),
(164, 'App\\Models\\User', 1, 'auth_token', '140eee90a3dfbc438cb27bd6871db1effe29817c0d6505e4211421852f26cff0', '[\"*\"]', NULL, NULL, '2025-07-31 09:29:10', '2025-07-31 09:29:10'),
(165, 'App\\Models\\User', 1, 'auth_token', '95a3dc6ffcf17c477d56cf7ddb7ab3640a73f31050a814d3647ebcfea7f2e2f1', '[\"*\"]', NULL, NULL, '2025-07-31 10:17:32', '2025-07-31 10:17:32'),
(166, 'App\\Models\\User', 1, 'auth_token', 'cd727834dacccada8062efd129d19d2255bab338e4549a5b2b61e758c3c98a3e', '[\"*\"]', NULL, NULL, '2025-07-31 10:34:24', '2025-07-31 10:34:24'),
(167, 'App\\Models\\User', 1, 'auth_token', 'b21c75247c79e1e266a83ff86ce18f59880b192fb6046fefa19d4873c36c0430', '[\"*\"]', NULL, NULL, '2025-07-31 10:43:15', '2025-07-31 10:43:15'),
(168, 'App\\Models\\User', 1, 'auth_token', 'a25aabf4d6edbfb1e1d159b3cb3d9a8f5cbc00fd104bcb5b16a00f58d849f644', '[\"*\"]', '2025-07-31 11:26:30', NULL, '2025-07-31 11:18:16', '2025-07-31 11:26:30'),
(169, 'App\\Models\\User', 1, 'auth_token', 'aa1e6738f97e12672c946aa418f0ca88161bb2ea402977f5f310675d9a81e9d5', '[\"*\"]', NULL, NULL, '2025-07-31 12:15:53', '2025-07-31 12:15:53'),
(170, 'App\\Models\\User', 1, 'auth_token', 'c0e68552260f0d91326eee6d369544bba29f84d75c8c3088c29cf3e190c2c12f', '[\"*\"]', NULL, NULL, '2025-08-01 10:10:01', '2025-08-01 10:10:01'),
(171, 'App\\Models\\User', 1, 'auth_token', '067353843e2f7167f3bb58a2bda25f9a7a4e72f8b3293f7a908477898b017215', '[\"*\"]', NULL, NULL, '2025-08-01 17:47:14', '2025-08-01 17:47:14'),
(172, 'App\\Models\\User', 1, 'auth_token', '6e8554700d96d5bf3cd53266b5703ac9ff303b4cff44f61e2071bd344658972a', '[\"*\"]', NULL, NULL, '2025-08-01 18:04:37', '2025-08-01 18:04:37'),
(173, 'App\\Models\\User', 1, 'auth_token', '53f17c60401bf437f5b4e0d7cfb639cf6787d0a6425c84205b00654dd357159f', '[\"*\"]', NULL, NULL, '2025-08-01 18:11:20', '2025-08-01 18:11:20'),
(174, 'App\\Models\\User', 1, 'auth_token', '71ca122feb58867ac22e4b0a42039cb386533c8752e90d2579327fb55acb01ac', '[\"*\"]', NULL, NULL, '2025-08-01 18:14:45', '2025-08-01 18:14:45'),
(175, 'App\\Models\\User', 1, 'auth_token', '1b714f8db91823c7e9cd9339bc28c040e45d810311fc4bc4e0eed50d97a395c5', '[\"*\"]', NULL, NULL, '2025-08-01 18:16:19', '2025-08-01 18:16:19'),
(176, 'App\\Models\\User', 1, 'auth_token', 'bf962d8ee09103469ea31f8555f2a4efda00051a746d4b9a2477cf81a13f30dc', '[\"*\"]', NULL, NULL, '2025-08-01 18:20:09', '2025-08-01 18:20:09'),
(177, 'App\\Models\\User', 1, 'auth_token', '5729d029619d0ff4b2de88266926e1398a6a823620e95c44ec98df9e9217e793', '[\"*\"]', NULL, NULL, '2025-08-01 18:23:16', '2025-08-01 18:23:16'),
(178, 'App\\Models\\User', 1, 'auth_token', '19053213de31e09d07c4d8e224c37dd21572654329f1cb069e4ed1821ab8e133', '[\"*\"]', NULL, NULL, '2025-08-01 18:26:22', '2025-08-01 18:26:22'),
(179, 'App\\Models\\User', 1, 'auth_token', '3a16f28a826cce91849a76122a6f3a2a69017a60b834b8db837a6aef166dab89', '[\"*\"]', NULL, NULL, '2025-08-01 18:28:37', '2025-08-01 18:28:37'),
(180, 'App\\Models\\User', 1, 'auth_token', '711d7f2d6ece5df4e68443b93e7921cf600915f181e8537b9ca3d9b5c3cc5f4c', '[\"*\"]', NULL, NULL, '2025-08-01 18:31:50', '2025-08-01 18:31:50'),
(181, 'App\\Models\\User', 1, 'auth_token', '6d081c14951f22176ca98123a310b39c04fdd01586334f0fed1dfbc94d542aad', '[\"*\"]', NULL, NULL, '2025-08-01 18:34:42', '2025-08-01 18:34:42'),
(182, 'App\\Models\\User', 1, 'auth_token', '3ce57dbf2224223779406e495eaf32e4ed7aac0ca74c9ef9cc1b263144fcc2ed', '[\"*\"]', '2025-08-01 18:43:35', NULL, '2025-08-01 18:36:35', '2025-08-01 18:43:35'),
(183, 'App\\Models\\User', 1, 'auth_token', '7647f9018cb34402cf6344248c6f9137a2a77729d2d887d733653f55c9a8709f', '[\"*\"]', NULL, NULL, '2025-08-01 18:46:27', '2025-08-01 18:46:27'),
(184, 'App\\Models\\User', 1, 'auth_token', 'dcbafc3d8c58149a0c7b9bfc38957c4ab4da117f5a9d2dbb42a6033fdcb707b1', '[\"*\"]', NULL, NULL, '2025-08-01 18:59:14', '2025-08-01 18:59:14'),
(185, 'App\\Models\\User', 1, 'auth_token', 'a2dd9914e15858e74f95a5f1e6d4e9350d26be8a1786ac7c135da0f543fec0bb', '[\"*\"]', NULL, NULL, '2025-08-04 08:09:53', '2025-08-04 08:09:53'),
(186, 'App\\Models\\User', 1, 'auth_token', 'b6c32c019e11fb9a8663346ca02fa779033cff00fc1641e64ace1d07cbbd4c62', '[\"*\"]', '2025-08-06 08:48:41', NULL, '2025-08-06 08:48:34', '2025-08-06 08:48:41'),
(187, 'App\\Models\\User', 1, 'auth_token', 'd55270e92b2ba57f8d2ec10cf081221b333e829879457c53f7ae2b4a15845f5e', '[\"*\"]', '2025-08-06 09:42:03', NULL, '2025-08-06 08:57:34', '2025-08-06 09:42:03'),
(188, 'App\\Models\\User', 1, 'auth_token', '129f559244ec7dc2a4cac0e61f3ab528baf0fecb8664d61ce68b22300ca95ba5', '[\"*\"]', '2025-08-06 09:45:57', NULL, '2025-08-06 09:42:54', '2025-08-06 09:45:57'),
(189, 'App\\Models\\User', 1, 'auth_token', '1c86d43e1f2b0fde4722c118f2d234cae6efba17659f90a9925ecd4e37838358', '[\"*\"]', '2025-08-06 10:19:31', NULL, '2025-08-06 09:47:10', '2025-08-06 10:19:31'),
(190, 'App\\Models\\User', 1, 'auth_token', '02275c37685e11695e2fee9b502803b1a556284763b1c70a98ba6791f10ab995', '[\"*\"]', '2025-08-06 10:32:43', NULL, '2025-08-06 10:23:30', '2025-08-06 10:32:43'),
(191, 'App\\Models\\User', 1, 'auth_token', 'e1d0cd3ecb7f5d9d4e197924fbbcaae013d732d4c09f5f77a9107641eddbacbf', '[\"*\"]', '2025-08-06 10:39:28', NULL, '2025-08-06 10:35:39', '2025-08-06 10:39:28'),
(192, 'App\\Models\\User', 1, 'auth_token', 'd0d993543e68931a2312b3055b2cc1c8ab274db7f6627b92b6740f50df1d77b9', '[\"*\"]', '2025-08-06 10:56:15', NULL, '2025-08-06 10:55:17', '2025-08-06 10:56:15'),
(193, 'App\\Models\\User', 1, 'auth_token', 'e158a4731991eecaa2acb9d30e8e7095a618e428d77a720cdb659a8203ceee4d', '[\"*\"]', '2025-08-06 11:39:45', NULL, '2025-08-06 11:13:26', '2025-08-06 11:39:45'),
(194, 'App\\Models\\User', 1, 'auth_token', 'a3e0d52106d63e9c2b6424a44dcb3550be3b5ae3600ac07a9192d4cb5d261ff1', '[\"*\"]', '2025-08-06 11:42:43', NULL, '2025-08-06 11:40:02', '2025-08-06 11:42:43'),
(195, 'App\\Models\\User', 1, 'auth_token', '6c6513652236427285b542a466d675cadb8618f544a10c87c6ce3afafc2e1421', '[\"*\"]', '2025-08-06 11:45:16', NULL, '2025-08-06 11:43:05', '2025-08-06 11:45:16'),
(196, 'App\\Models\\User', 1, 'auth_token', '9174395e061f9375ccee16c13d6ef8eb6a05a3a28b829d84bbc2fe832395ab42', '[\"*\"]', '2025-08-06 11:46:40', NULL, '2025-08-06 11:45:36', '2025-08-06 11:46:40'),
(197, 'App\\Models\\User', 1, 'auth_token', 'c4d95ea235371abbf0723664db94d97c044b7199bc7260931d5004600701e1a3', '[\"*\"]', '2025-08-06 11:50:02', NULL, '2025-08-06 11:48:42', '2025-08-06 11:50:02'),
(198, 'App\\Models\\User', 1, 'auth_token', 'd7e561220295490b5c85d502c54763a559e3fc428ea03b7e6230d9c1d76ef786', '[\"*\"]', '2025-08-06 11:51:32', NULL, '2025-08-06 11:50:38', '2025-08-06 11:51:32'),
(199, 'App\\Models\\User', 1, 'auth_token', '92edc2c5b4a5c34339e5da6da370612db0256e023de3755516d487de90b0f3be', '[\"*\"]', '2025-08-06 12:02:25', NULL, '2025-08-06 12:02:24', '2025-08-06 12:02:25'),
(200, 'App\\Models\\User', 1, 'auth_token', 'b0ea5a194ea7e77f34548f86fc4882dc6098934ce0bdbb30d5c6c17640cf0177', '[\"*\"]', '2025-08-06 12:28:17', NULL, '2025-08-06 12:02:52', '2025-08-06 12:28:17'),
(201, 'App\\Models\\User', 1, 'auth_token', 'e720716f1169eb2f1a756dfa3e0681aedc1508e36e34f7f0a5d7ffb7fad2baf9', '[\"*\"]', '2025-08-06 12:36:10', NULL, '2025-08-06 12:28:36', '2025-08-06 12:36:10'),
(202, 'App\\Models\\User', 1, 'auth_token', '520b3adcd8342954841efbfc18194891fa5a8dc8ce707cd6dd59afbb398e92ff', '[\"*\"]', '2025-08-07 09:44:01', NULL, '2025-08-07 09:36:52', '2025-08-07 09:44:01'),
(203, 'App\\Models\\User', 1, 'auth_token', '23213127d627c2b3ca5f80c0e94dc7e10b92ba6f327df38e94fffa4c3041c142', '[\"*\"]', '2025-08-07 09:47:44', NULL, '2025-08-07 09:47:43', '2025-08-07 09:47:44'),
(204, 'App\\Models\\User', 1, 'auth_token', 'ce32a0a94546ecd661ee3cae7c56964b10ccaac9cf3c67c835cb28d5dca111ab', '[\"*\"]', '2025-08-08 07:49:44', NULL, '2025-08-08 07:49:42', '2025-08-08 07:49:44'),
(205, 'App\\Models\\User', 1, 'auth_token', '85af814311512290d5553f0d76a7cf66a9584b49a15dc5349447bb46965b68b2', '[\"*\"]', '2025-08-08 08:19:32', NULL, '2025-08-08 08:19:31', '2025-08-08 08:19:32'),
(207, 'App\\Models\\User', 1, 'auth_token', 'ea5d6b638b4d47bec934f68996caac556d0a0771df7f4b12431b51d20f1578f2', '[\"*\"]', '2025-08-08 09:54:27', NULL, '2025-08-08 08:25:49', '2025-08-08 09:54:27'),
(208, 'App\\Models\\User', 1, 'auth_token', 'f156970a2262b865fa52c7e2f5ce764c3f5d0b6c45f4884f97439e5307788648', '[\"*\"]', '2025-08-08 08:29:03', NULL, '2025-08-08 08:29:02', '2025-08-08 08:29:03'),
(209, 'App\\Models\\User', 1, 'auth_token', 'd5cfdc3fcdf354eb765507f1957c2dcbdb47e52f737fa1c5bb320d11133464e7', '[\"*\"]', '2025-08-08 09:33:47', NULL, '2025-08-08 08:50:27', '2025-08-08 09:33:47'),
(210, 'App\\Models\\User', 1, 'auth_token', '9a75af5cace5eb6b86b706c2d3dfdf07be06dc1af8c296826534164768f91028', '[\"*\"]', NULL, NULL, '2025-08-08 09:54:16', '2025-08-08 09:54:16'),
(211, 'App\\Models\\User', 1, 'auth_token', 'b06b923309894aea37115730e47c9c2bfc19c0c877ce7f51edc307303a449afc', '[\"*\"]', '2025-08-12 12:30:07', NULL, '2025-08-08 09:54:29', '2025-08-12 12:30:07'),
(212, 'App\\Models\\User', 1, 'auth_token', 'ce032f91477d1bf9b9125ae28420085089f8232cf8013cade17183da6353784d', '[\"*\"]', '2025-08-08 10:10:44', NULL, '2025-08-08 10:10:03', '2025-08-08 10:10:44'),
(213, 'App\\Models\\User', 1, 'auth_token', '63760263c5f557ed85361a6bd22414fd7d3225043f376829794a9d4d37cb070a', '[\"*\"]', '2025-08-12 08:03:53', NULL, '2025-08-12 07:23:08', '2025-08-12 08:03:53'),
(214, 'App\\Models\\User', 1, 'auth_token', 'fca54f7d9c005f543eb4900d04507b6c404be17ec81af00b5de69555076f89e6', '[\"*\"]', '2025-08-12 08:17:04', NULL, '2025-08-12 08:09:28', '2025-08-12 08:17:04'),
(215, 'App\\Models\\User', 1, 'auth_token', '9bdebaadc6c117ac9fd018e028254ab68e36fce7670a0c26deed6f8eb515806f', '[\"*\"]', '2025-08-12 09:02:55', NULL, '2025-08-12 09:01:52', '2025-08-12 09:02:55'),
(216, 'App\\Models\\User', 1, 'auth_token', '6cc51cd180de9d4c95ac89f7118bb49a0174df66fe87e32e80e4ef067e6f30e9', '[\"*\"]', '2025-08-12 09:35:54', NULL, '2025-08-12 09:35:53', '2025-08-12 09:35:54'),
(217, 'App\\Models\\User', 1, 'auth_token', 'a7cb2333e9a3187625ee38a323da2707336e7b455aa988701e6cb5b86496f04b', '[\"*\"]', '2025-08-14 10:42:44', NULL, '2025-08-14 08:13:12', '2025-08-14 10:42:44'),
(218, 'App\\Models\\User', 1, 'auth_token', '128697e127cadf0f6b4c5f3f0dcda61236bb2b35a2fb8fd7e0bae01638d7d113', '[\"*\"]', '2025-08-18 11:08:49', NULL, '2025-08-14 08:35:19', '2025-08-18 11:08:49'),
(219, 'App\\Models\\User', 1, 'auth_token', '2919a2ac0ea9177348c1b0c58ae20d00cea97fd480668b1e33ddf13a298a0de0', '[\"*\"]', '2025-08-18 09:04:36', NULL, '2025-08-18 08:13:36', '2025-08-18 09:04:36'),
(220, 'App\\Models\\User', 1, 'auth_token', '0179991e035569945a2c72241b1bda2d95aa01071cb71da70ecc33719276a85e', '[\"*\"]', '2025-08-28 09:27:25', NULL, '2025-08-28 08:22:04', '2025-08-28 09:27:25'),
(221, 'App\\Models\\User', 1, 'auth_token', 'a5bcb3b66a915ed926dea41fc34f95abea7f1962816bb358f8c69cf3bc66b66f', '[\"*\"]', '2025-08-28 09:22:15', NULL, '2025-08-28 09:13:59', '2025-08-28 09:22:15'),
(222, 'App\\Models\\User', 1, 'auth_token', '650eae1faeb6ae08c7de3324793022878562034df6799496c25f0999f71724b4', '[\"*\"]', '2025-09-18 09:12:53', NULL, '2025-09-18 08:25:23', '2025-09-18 09:12:53'),
(223, 'App\\Models\\User', 1, 'auth_token', 'd5c11b13840cf67e465f15234ed45afd08c9c7c79d5addad767e799ca577b079', '[\"*\"]', '2025-09-18 08:50:01', NULL, '2025-09-18 08:48:01', '2025-09-18 08:50:01'),
(224, 'App\\Models\\User', 1, 'auth_token', 'f526c088ffde605d1a0cd3883d9ce6f48a99bf06f6bc32f4ee85d1544da177cc', '[\"*\"]', '2025-09-18 09:12:19', NULL, '2025-09-18 08:51:05', '2025-09-18 09:12:19'),
(225, 'App\\Models\\User', 1, 'auth_token', '73774e115450281682e8e31a11233257e32c7ff964e8e351bd086d5e803d9581', '[\"*\"]', '2025-09-29 06:13:30', NULL, '2025-09-29 06:13:28', '2025-09-29 06:13:30'),
(226, 'App\\Models\\User', 1, 'auth_token', 'dafe1b898d6d5751fb2684f7a4458bc58b964af9923a4745ea8db526ead610fc', '[\"*\"]', '2025-10-02 09:32:45', NULL, '2025-09-29 06:14:51', '2025-10-02 09:32:45'),
(227, 'App\\Models\\User', 1, 'auth_token', 'f7096c8153d8218c3c050c090ccdb32bbdfd377cf0b2e9efe9992efe9415c80b', '[\"*\"]', '2025-09-29 07:03:12', NULL, '2025-09-29 07:03:09', '2025-09-29 07:03:12'),
(228, 'App\\Models\\User', 1, 'auth_token', '4f1d089ead45072ec934a340403b3e48bcc983f49bc10459c31a701208d0a5fe', '[\"*\"]', '2025-10-02 09:09:07', NULL, '2025-10-02 07:55:17', '2025-10-02 09:09:07'),
(229, 'App\\Models\\User', 1, 'auth_token', '0beed99a1eb5ce5843800ac75bb55b7ce2a6910fd90b67b92bbef50dd402d369', '[\"*\"]', '2025-10-02 09:21:28', NULL, '2025-10-02 09:19:39', '2025-10-02 09:21:28'),
(230, 'App\\Models\\User', 1, 'auth_token', '6382139759e5dc3e9fea72b34c52739de61784fc007fbd57a4585f48f99214c3', '[\"*\"]', '2025-10-02 11:39:26', NULL, '2025-10-02 09:54:01', '2025-10-02 11:39:26'),
(231, 'App\\Models\\User', 1, 'auth_token', 'abb95acbe8986372f03482b99c4a437237e5160d221d8d867023dad7e1ac84dc', '[\"*\"]', '2025-10-02 10:28:07', NULL, '2025-10-02 09:54:30', '2025-10-02 10:28:07'),
(232, 'App\\Models\\User', 1, 'auth_token', '7629d1c834a023cadbc7d265990d2ae9d8a646f6b556b19e5f149104fab3e500', '[\"*\"]', '2025-10-02 10:28:45', NULL, '2025-10-02 10:28:44', '2025-10-02 10:28:45'),
(233, 'App\\Models\\User', 1, 'auth_token', 'c7785097c041327c3eeda8682a458b0fac37e13d086591c3144069c4a4a8682f', '[\"*\"]', '2025-10-02 10:33:48', NULL, '2025-10-02 10:29:38', '2025-10-02 10:33:48'),
(234, 'App\\Models\\User', 1, 'auth_token', 'c2d95927bdb8151d63409a2e82877b04261d2252a959625ca892f80e17aeece4', '[\"*\"]', '2025-10-02 10:39:19', NULL, '2025-10-02 10:39:18', '2025-10-02 10:39:19'),
(235, 'App\\Models\\User', 1, 'auth_token', '650fb4835df07fcfee8be7d985049a9b99451dc143d216331fe192bea0e81305', '[\"*\"]', '2025-10-02 10:53:49', NULL, '2025-10-02 10:40:26', '2025-10-02 10:53:49'),
(236, 'App\\Models\\User', 1, 'auth_token', '45be64dae64e695174fe72b79ff59dbf925e1edc75757f00e36dfe5ce0fcb778', '[\"*\"]', '2025-10-02 11:41:34', NULL, '2025-10-02 11:36:27', '2025-10-02 11:41:34'),
(237, 'App\\Models\\User', 1, 'auth_token', 'c0bf944f86636fea2fc32e7836f525fc7a0ed1c41e2fae32a565c911a2e7d09f', '[\"*\"]', '2025-10-02 12:22:43', NULL, '2025-10-02 12:20:32', '2025-10-02 12:22:43'),
(238, 'App\\Models\\User', 1, 'auth_token', '43d1d96fe9c85d25fca817e5299c210e77a9f61a955110c9989759a30b5dd622', '[\"*\"]', '2025-11-13 07:09:20', NULL, '2025-11-13 07:09:17', '2025-11-13 07:09:20'),
(239, 'App\\Models\\User', 1, 'auth_token', '7badbddc5d0b2af0f497afb82af3192c4965212130ad321f9f109657e8fece6f', '[\"*\"]', '2025-11-13 07:22:17', NULL, '2025-11-13 07:20:29', '2025-11-13 07:22:17'),
(240, 'App\\Models\\User', 1, 'auth_token', 'adcbfa3fadddf5ec4d07dd28b54638ed22240d45224fba73f725c52771241d3f', '[\"*\"]', '2025-11-13 08:00:34', NULL, '2025-11-13 08:00:28', '2025-11-13 08:00:34'),
(241, 'App\\Models\\User', 1, 'auth_token', 'fc8cd606f757637e1bfbcab4d66a515a283f535e2a6bf894a383acf2af5d0ce8', '[\"*\"]', '2025-11-13 09:40:08', NULL, '2025-11-13 09:40:05', '2025-11-13 09:40:08'),
(242, 'App\\Models\\User', 1, 'auth_token', '18c7d7d98d7dda6951d9acdee0d14691c6831b64809f9554576d2d8bf909a045', '[\"*\"]', '2025-11-21 13:33:44', NULL, '2025-11-21 13:33:37', '2025-11-21 13:33:44'),
(243, 'App\\Models\\User', 1, 'auth_token', 'a15a59ffaafe21a918b9f5d357a57431cfa1c91ca6e35a8b67c4704e9128ff75', '[\"*\"]', '2025-11-21 13:42:28', NULL, '2025-11-21 13:41:35', '2025-11-21 13:42:28'),
(244, 'App\\Models\\User', 1, 'auth_token', 'a0a6a2cd003fbeaebc24695d19c058bd3890c686bb0cd5347f33e86f8c540027', '[\"*\"]', NULL, NULL, '2025-11-26 10:06:43', '2025-11-26 10:06:43'),
(245, 'App\\Models\\User', 1, 'auth_token', 'c4f27bbe640147bb9c881cc3ad5ad796ff0f4698833d25357b36ea51fd53909b', '[\"*\"]', '2025-11-26 10:11:10', NULL, '2025-11-26 10:07:35', '2025-11-26 10:11:10'),
(246, 'App\\Models\\User', 1, 'auth_token', 'eae2145dc9470e3e5f9378adb83183f04a5b75829d0f971ee70b5f1f5c8614c9', '[\"*\"]', '2025-11-26 10:11:49', NULL, '2025-11-26 10:11:43', '2025-11-26 10:11:49'),
(247, 'App\\Models\\User', 1, 'auth_token', 'b8d87e9b94082cb1c78bf12eb2e9dc029a0782ee9fcdc21374acffac11598dfb', '[\"*\"]', '2025-12-03 15:20:40', NULL, '2025-12-03 15:20:26', '2025-12-03 15:20:40'),
(248, 'App\\Models\\User', 1, 'auth_token', '5cd007acf280eb4aead5309cf6649e363b1165e1c7360a389be7f34972a406fc', '[\"*\"]', '2025-12-03 17:07:45', NULL, '2025-12-03 15:58:39', '2025-12-03 17:07:45'),
(249, 'App\\Models\\User', 1, 'auth_token', 'c7224c8682f85021cc7ffb1b62b6dac5a38fb550a716bd9f5a00601eb727a17d', '[\"*\"]', '2025-12-03 16:49:22', NULL, '2025-12-03 16:33:38', '2025-12-03 16:49:22'),
(250, 'App\\Models\\User', 1, 'auth_token', '1a412d768aa129d26a9caef3a0fe09279972bd0ec5748e52ef00197d998e5640', '[\"*\"]', '2025-12-03 16:49:33', NULL, '2025-12-03 16:49:32', '2025-12-03 16:49:33'),
(251, 'App\\Models\\User', 1, 'auth_token', '25f490eafdf44945460fee857ab7e2b7aabb240ad03daf745a7cba65b8f2b70f', '[\"*\"]', '2025-12-03 16:50:04', NULL, '2025-12-03 16:50:03', '2025-12-03 16:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `programmes`
--

CREATE TABLE `programmes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration_weeks` int NOT NULL DEFAULT '4',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programmes`
--

INSERT INTO `programmes` (`id`, `user_id`, `title`, `objectif`, `description`, `duration_weeks`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Beginner Strength Training', 'Build muscle and strength', 'A 4-week program for beginners', 4, 1, '2025-07-11 08:59:12', '2025-07-11 08:59:12');

-- --------------------------------------------------------

--
-- Table structure for table `programme_workouts`
--

CREATE TABLE `programme_workouts` (
  `id` bigint UNSIGNED NOT NULL,
  `programme_id` bigint UNSIGNED NOT NULL,
  `workout_id` bigint UNSIGNED NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `week_day` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3Hv8Xdv3G0gaLW6kni6uzLJA6Nwq8qITAH5jVPZ7', NULL, '192.168.50.105', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 [FBAN/FBIOS;FBAV/516.0.0.33.107;FBBV/763132254;FBDV/iPhone12,1;FBMD/iPhone;FBSN/iOS;FBSV/16.6.1;FBSS/2;FBCR/;FBID/phone;FBLC/fr_FR;FBOP/80]', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianF3R2IwbW9BdGt5Nmx6eEZ0em9haVRkYXI2ekNBYnpXNThxbXhwSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjUwLjEwNzo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1752745113),
('5AyD8xB0piS20L8RIe7OwJl1q7Ur7LgTaCHsCJTB', NULL, '192.168.50.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidVhSYUNZOGI5RWZ5MlZwMEFHdFZLNUJwN3R3bVljM3BvWGRkS0p1biI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1754565900),
('7JZGUrWcoi2FKWGrY2jiUiRK4ggzT5odiolxrjBO', NULL, '172.20.10.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWRVaENudk9YNFdoaTlLSTNSS1pSbU5lNTAyOHo3eHJCVnM0TmFkMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly8xNzIuMjAuMTAuMjo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1764778819),
('XQFttiatxWUFSEPD08SPqEbQq0zPgPftIwCe5tBO', NULL, '192.168.50.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR3FzY1diRmtqNlNPMW1VRHkza3hodU5pZXlydFluM3NEMk1PUnlWTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1754565694);

-- --------------------------------------------------------

--
-- Table structure for table `specialities`
--

CREATE TABLE `specialities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specialities`
--

INSERT INTO `specialities` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Fitness', 'Entraînement général pour la forme', '2025-07-24 12:50:21', '2025-07-24 12:50:21'),
(2, 'Musculation', 'Développement musculaire', '2025-07-24 12:50:21', '2025-07-24 12:50:21'),
(3, 'Cardio', 'Entraînement cardio-vasculaire', '2025-07-24 12:50:21', '2025-07-24 12:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'Triki Ghofrane', 'admin@anas.com', NULL, '$2y$12$kx3dMbD/wZfzXiLrcPR3ceTh6bxz82WZTqNEB02lE69IuJnsT8xIe', NULL, '2025-07-10 08:53:48', '2025-07-10 08:53:48', 'admin'),
(2, 'Maram', 'ghoftriki@gmail.com', NULL, '$2y$12$daPTRIEnvuyorNZiwgo3ju0RQR/gorKr8R9YMYKNbSY.DMwkRS.bS', NULL, '2025-07-18 07:48:50', '2025-07-18 07:48:50', 'user'),
(3, 'Mariam Triki', 'mariomette@jmail.com', NULL, '$2y$12$pbAjnWN4OIxWRHwRfBIgk.iP88qL/z0FpW1KOM3poCJj.SXpVZWju', NULL, '2025-07-25 09:31:18', '2025-07-25 09:31:18', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_progresses`
--

CREATE TABLE `user_progresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `body_fat` decimal(5,2) DEFAULT NULL,
  `muscle_mass` decimal(5,2) DEFAULT NULL,
  `imc` decimal(5,2) DEFAULT NULL,
  `recorded_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_progresses`
--

INSERT INTO `user_progresses` (`id`, `user_id`, `weight`, `height`, `body_fat`, `muscle_mass`, `imc`, `recorded_at`, `created_at`, `updated_at`) VALUES
(1, 1, 75.50, 180.00, 15.20, 38.50, 23.30, '2023-07-15 07:00:00', '2025-07-11 11:35:25', '2025-07-11 11:35:25'),
(2, 1, 69.50, 180.00, 15.20, 38.50, 21.45, '2025-07-15 07:00:00', '2025-07-11 11:35:46', '2025-07-11 11:35:46'),
(3, 1, 72.00, 165.00, NULL, NULL, 26.45, '2025-07-19 23:00:00', '2025-07-17 11:51:49', '2025-07-17 11:51:49'),
(4, 2, 56.00, 165.00, 50.00, 50.00, 20.57, '2025-07-17 23:00:00', '2025-07-18 08:38:36', '2025-07-18 08:38:36'),
(5, 2, 50.00, 165.00, 50.00, 50.00, 18.37, '2025-07-17 23:00:00', '2025-07-18 08:39:22', '2025-07-18 08:39:22'),
(6, 1, 70.00, 165.00, 50.00, 50.00, 25.71, '2025-07-20 23:00:00', '2025-07-21 14:29:35', '2025-07-21 14:29:35'),
(7, 1, 98.00, 150.00, 85.00, 5.00, 43.56, '2025-07-20 23:00:00', '2025-07-21 16:32:26', '2025-07-21 16:32:26'),
(8, 1, 85.00, 158.00, 5.00, 5.00, 34.05, '2025-07-20 23:00:00', '2025-07-21 16:33:45', '2025-07-21 16:33:45'),
(11, 1, 75.00, 175.00, NULL, NULL, 24.49, '2025-07-21 23:00:00', '2025-07-22 16:07:40', '2025-07-22 16:07:40'),
(12, 3, 65.00, 164.00, 50.00, 50.00, 24.17, '2025-07-24 23:00:00', '2025-07-25 09:36:49', '2025-07-25 09:36:49'),
(13, 3, 63.00, 164.00, 50.00, 50.00, 23.42, '2025-04-02 23:00:00', '2025-07-25 09:47:48', '2025-07-25 09:47:48'),
(14, 3, 63.00, 164.00, 50.00, 50.00, 23.42, '2025-04-02 23:00:00', '2025-07-25 09:47:48', '2025-07-25 09:47:48'),
(15, 3, 63.00, 164.00, 50.00, 50.00, 23.42, '2025-04-02 23:00:00', '2025-07-25 09:47:49', '2025-07-25 09:47:49'),
(17, 1, 64.00, 164.00, 30.00, 70.00, 23.80, '2025-09-17 23:00:00', '2025-09-18 09:05:05', '2025-09-18 09:05:05'),
(18, 1, 63.00, 156.00, 55.00, 45.00, 25.89, '2025-10-01 23:00:00', '2025-10-02 08:08:10', '2025-10-02 08:08:10');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint UNSIGNED NOT NULL,
  `coach_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `coach_id`, `title`, `description`, `video_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Séance Cardio Intense', '20 minutes pour transpirer !', 'https://www.tiktok.com/@makayla_thomas_fit/video/7255395498763324715?q=CARDIO&t=1754076749021', '2025-08-01 17:55:33', '2025-08-01 17:55:33'),
(4, 1, 'TTT', 'KKK', 'https://www.tiktok.com/@makayla_thomas_fit/video/7255395498763324715?q=CARDIO&t=1754076749021', '2025-10-02 11:38:01', '2025-10-02 11:38:01'),
(5, 1, 'SSSSSSS', 'CCCC', 'https://www.tiktok.com/@makayla_thomas_fit/video/7255395498763324715?q=CARDIO&t=1754076749021', '2025-10-02 11:38:58', '2025-10-02 11:38:58');

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `water_consumption` decimal(8,2) NOT NULL DEFAULT '0.00',
  `duration` int DEFAULT NULL,
  `is_rest_day` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `user_id`, `title`, `notes`, `water_consumption`, `duration`, `is_rest_day`, `created_at`, `updated_at`) VALUES
(12, 1, 'Leg Day', 'Focus on quads, hamstrings, and calves', 1.50, 60, 0, '2025-07-22 15:37:20', '2025-07-22 15:37:20'),
(13, 1, 'Push Day', 'Chest, shoulders, and triceps workout', 2.00, 55, 0, '2025-07-22 15:37:20', '2025-07-22 15:37:20'),
(14, 1, 'Pull Day', 'Back and biceps session', 1.80, 50, 0, '2025-07-22 15:37:20', '2025-07-22 15:37:20'),
(15, 1, 'Zumbaa', 'chaque mardi', 1.00, 60, 0, '2025-07-22 14:42:30', '2025-07-22 14:42:30'),
(16, 1, 'cardio', 'Itlak thahhrek', 1.00, 60, 0, '2025-07-22 16:02:07', '2025-07-22 16:02:07'),
(17, 1, 'leg day', 'Hamdi', 1.20, 90, 0, '2025-07-22 16:09:23', '2025-07-22 16:09:23'),
(18, 1, 'upper body', 'Khali dhahrek matlouk', 1.50, 60, 0, '2025-07-22 16:32:04', '2025-07-22 16:32:04'),
(19, 1, 'push day', 'Hdh', 2.00, 45, 0, '2025-07-22 16:42:13', '2025-07-22 16:42:13'),
(20, 3, 'Chest', 'Nesra9 app ghof', 1.00, 20, 0, '2025-07-25 09:48:59', '2025-07-25 09:48:59'),
(21, 1, 'sakin', 'BHh', 1.00, 60, 0, '2025-07-31 11:23:43', '2025-07-31 11:23:43'),
(22, 1, 'nhar lethom sakin', 'hajajak', 1.00, 60, 0, '2025-08-08 08:52:10', '2025-08-08 08:52:10'),
(23, 1, 'monday legs', 'Coach yessin instructions', 1.00, 30, 0, '2025-09-18 09:06:56', '2025-09-18 09:06:56'),
(24, 1, 'legs fay', 'Renini', 1.00, 60, 0, '2025-10-02 08:01:56', '2025-10-02 08:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `workout_exercises`
--

CREATE TABLE `workout_exercises` (
  `id` bigint UNSIGNED NOT NULL,
  `workout_id` bigint UNSIGNED NOT NULL,
  `exercise_id` bigint UNSIGNED NOT NULL,
  `achievement` decimal(5,2) NOT NULL DEFAULT '0.00',
  `is_done` tinyint(1) NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workout_exercises`
--

INSERT INTO `workout_exercises` (`id`, `workout_id`, `exercise_id`, `achievement`, `is_done`, `order`, `created_at`, `updated_at`) VALUES
(13, 12, 99, 100.00, 1, 1, '2025-07-22 15:39:56', '2025-07-22 14:41:26'),
(14, 12, 100, 0.00, 0, 2, '2025-07-22 15:39:56', '2025-07-22 15:39:56'),
(15, 12, 101, 0.00, 0, 3, '2025-07-22 15:39:56', '2025-07-22 15:39:56'),
(16, 12, 105, 0.00, 0, 4, '2025-07-22 15:39:56', '2025-07-22 15:39:56'),
(21, 13, 103, 0.00, 0, 1, '2025-07-22 15:40:34', '2025-07-22 15:40:34'),
(22, 13, 104, 0.00, 0, 2, '2025-07-22 15:40:34', '2025-07-22 15:40:34'),
(23, 13, 102, 0.00, 0, 3, '2025-07-22 15:40:34', '2025-07-22 15:40:34'),
(24, 14, 106, 0.00, 0, 1, '2025-07-22 15:40:54', '2025-07-22 15:40:54'),
(25, 14, 107, 0.00, 0, 2, '2025-07-22 15:40:54', '2025-07-22 15:40:54'),
(26, 14, 108, 0.00, 0, 3, '2025-07-22 15:40:54', '2025-07-22 15:40:54'),
(27, 15, 109, 100.00, 1, 2, '2025-07-22 14:47:54', '2025-07-22 14:53:52'),
(28, 16, 110, 0.00, 1, 0, '2025-07-22 16:03:34', '2025-07-22 16:04:31'),
(29, 17, 111, 90.00, 0, 1, '2025-07-22 16:11:58', '2025-07-22 16:13:24'),
(30, 18, 112, 90.00, 1, 2, '2025-07-22 16:34:09', '2025-07-22 16:35:33'),
(31, 18, 113, 0.00, 0, 0, '2025-07-22 16:36:05', '2025-07-22 16:36:05'),
(32, 19, 114, 90.00, 1, 2, '2025-07-22 16:43:28', '2025-07-22 16:44:53'),
(33, 20, 115, 0.00, 1, 0, '2025-07-25 09:50:37', '2025-07-25 09:50:54'),
(34, 21, 116, 95.00, 0, 6, '2025-07-31 11:24:50', '2025-08-12 07:56:56'),
(35, 22, 117, 90.00, 0, 5, '2025-08-08 08:54:00', '2025-08-12 08:13:01'),
(36, 23, 118, 0.00, 0, 1, '2025-09-18 09:08:15', '2025-09-18 09:08:40'),
(37, 24, 119, 0.00, 1, 5, '2025-10-02 08:03:45', '2025-10-02 08:04:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch_availabilities`
--
ALTER TABLE `branch_availabilities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branch_availabilities_branch_id_day_of_week_unique` (`branch_id`,`day_of_week`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coaches_email_unique` (`email`),
  ADD KEY `coaches_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `coach_availabilities`
--
ALTER TABLE `coach_availabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coach_availabilities_coach_id_foreign` (`coach_id`);

--
-- Indexes for table `coach_specialities`
--
ALTER TABLE `coach_specialities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coach_specialities_coach_id_speciality_id_unique` (`coach_id`,`speciality_id`),
  ADD KEY `coach_specialities_speciality_id_foreign` (`speciality_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercises_movement_id_foreign` (`movement_id`),
  ADD KEY `exercises_machine_id_foreign` (`machine_id`),
  ADD KEY `exercises_charge_id_foreign` (`charge_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `group_session_bookings`
--
ALTER TABLE `group_session_bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_session_bookings_user_id_group_training_session_id_unique` (`user_id`,`group_training_session_id`),
  ADD KEY `group_session_bookings_user_id_booked_at_index` (`user_id`,`booked_at`),
  ADD KEY `group_session_bookings_group_training_session_id_booked_at_index` (`group_training_session_id`,`booked_at`);

--
-- Indexes for table `group_session_user`
--
ALTER TABLE `group_session_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_session_user_user_id_group_training_session_id_unique` (`user_id`,`group_training_session_id`),
  ADD KEY `group_session_user_group_training_session_id_foreign` (`group_training_session_id`);

--
-- Indexes for table `group_training_sessions`
--
ALTER TABLE `group_training_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_training_sessions_branch_id_foreign` (`branch_id`),
  ADD KEY `group_training_sessions_coach_id_foreign` (`coach_id`),
  ADD KEY `group_training_sessions_course_id_foreign` (`course_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machines_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `machine_categories`
--
ALTER TABLE `machine_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `machine_categories_machine_id_category_id_unique` (`machine_id`,`category_id`),
  ADD KEY `machine_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `machine_charges`
--
ALTER TABLE `machine_charges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `machine_charges_machine_id_charge_id_unique` (`machine_id`,`charge_id`),
  ADD KEY `machine_charges_charge_id_foreign` (`charge_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movements`
--
ALTER TABLE `movements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parametres`
--
ALTER TABLE `parametres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parametres_cle_unique` (`cle`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `programmes`
--
ALTER TABLE `programmes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programmes_user_id_foreign` (`user_id`);

--
-- Indexes for table `programme_workouts`
--
ALTER TABLE `programme_workouts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `programme_workouts_programme_id_workout_id_unique` (`programme_id`,`workout_id`),
  ADD KEY `programme_workouts_workout_id_foreign` (`workout_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `specialities`
--
ALTER TABLE `specialities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_progresses`
--
ALTER TABLE `user_progresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_progresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `videos_coach_id_foreign` (`coach_id`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workouts_user_id_foreign` (`user_id`);

--
-- Indexes for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `workout_exercises_workout_id_exercise_id_unique` (`workout_id`,`exercise_id`),
  ADD KEY `workout_exercises_exercise_id_foreign` (`exercise_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `branch_availabilities`
--
ALTER TABLE `branch_availabilities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coach_availabilities`
--
ALTER TABLE `coach_availabilities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coach_specialities`
--
ALTER TABLE `coach_specialities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_session_bookings`
--
ALTER TABLE `group_session_bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `group_session_user`
--
ALTER TABLE `group_session_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_training_sessions`
--
ALTER TABLE `group_training_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `machine_categories`
--
ALTER TABLE `machine_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `machine_charges`
--
ALTER TABLE `machine_charges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1364;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `movements`
--
ALTER TABLE `movements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `parametres`
--
ALTER TABLE `parametres`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `programmes`
--
ALTER TABLE `programmes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `programme_workouts`
--
ALTER TABLE `programme_workouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `specialities`
--
ALTER TABLE `specialities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_progresses`
--
ALTER TABLE `user_progresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch_availabilities`
--
ALTER TABLE `branch_availabilities`
  ADD CONSTRAINT `branch_availabilities_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coaches`
--
ALTER TABLE `coaches`
  ADD CONSTRAINT `coaches_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coach_availabilities`
--
ALTER TABLE `coach_availabilities`
  ADD CONSTRAINT `coach_availabilities_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coach_specialities`
--
ALTER TABLE `coach_specialities`
  ADD CONSTRAINT `coach_specialities_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coach_specialities_speciality_id_foreign` FOREIGN KEY (`speciality_id`) REFERENCES `specialities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exercises`
--
ALTER TABLE `exercises`
  ADD CONSTRAINT `exercises_charge_id_foreign` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `exercises_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `exercises_movement_id_foreign` FOREIGN KEY (`movement_id`) REFERENCES `movements` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `group_session_bookings`
--
ALTER TABLE `group_session_bookings`
  ADD CONSTRAINT `group_session_bookings_group_training_session_id_foreign` FOREIGN KEY (`group_training_session_id`) REFERENCES `group_training_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_session_bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_session_user`
--
ALTER TABLE `group_session_user`
  ADD CONSTRAINT `group_session_user_group_training_session_id_foreign` FOREIGN KEY (`group_training_session_id`) REFERENCES `group_training_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_session_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_training_sessions`
--
ALTER TABLE `group_training_sessions`
  ADD CONSTRAINT `group_training_sessions_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_training_sessions_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_training_sessions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `machines`
--
ALTER TABLE `machines`
  ADD CONSTRAINT `machines_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `machine_categories`
--
ALTER TABLE `machine_categories`
  ADD CONSTRAINT `machine_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `machine_categories_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `machine_charges`
--
ALTER TABLE `machine_charges`
  ADD CONSTRAINT `machine_charges_charge_id_foreign` FOREIGN KEY (`charge_id`) REFERENCES `charges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `machine_charges_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `programmes`
--
ALTER TABLE `programmes`
  ADD CONSTRAINT `programmes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `programme_workouts`
--
ALTER TABLE `programme_workouts`
  ADD CONSTRAINT `programme_workouts_programme_id_foreign` FOREIGN KEY (`programme_id`) REFERENCES `programmes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `programme_workouts_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_progresses`
--
ALTER TABLE `user_progresses`
  ADD CONSTRAINT `user_progresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_coach_id_foreign` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workouts`
--
ALTER TABLE `workouts`
  ADD CONSTRAINT `workouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workout_exercises`
--
ALTER TABLE `workout_exercises`
  ADD CONSTRAINT `workout_exercises_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workout_exercises_workout_id_foreign` FOREIGN KEY (`workout_id`) REFERENCES `workouts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
