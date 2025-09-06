-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2025 at 12:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `bug_reports`
--

CREATE TABLE `bug_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED DEFAULT NULL,
  `developer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','assigned','resolved') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bug_reports`
--

INSERT INTO `bug_reports` (`id`, `user_id`, `game_id`, `developer_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 11, NULL, 'Price', 'Why is it so high???', 'resolved', '2025-09-05 15:50:51', '2025-09-05 16:34:22'),
(2, 1, 9, 2, 'Test', 'bug test', 'resolved', '2025-09-05 17:09:33', '2025-09-06 13:48:45'),
(3, 1, 7, NULL, 'test', 'bug test', 'resolved', '2025-09-05 17:10:29', '2025-09-06 13:48:49');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `discount_percent` tinyint(3) UNSIGNED DEFAULT NULL,
  `sale_ends_at` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `developer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_requirements` text DEFAULT NULL,
  `recommended_requirements` text DEFAULT NULL,
  `screenshots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`screenshots`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`, `description`, `is_featured`, `price`, `sale_price`, `discount_percent`, `sale_ends_at`, `image`, `developer_id`, `created_at`, `updated_at`, `is_free`, `minimum_requirements`, `recommended_requirements`, `screenshots`) VALUES
(6, 'Dota 2', 'Every day, millions of players worldwide enter battle as one of over a hundred Dota heroes. And no matter if it\'s their 10th hour of play or 1,000th, there\'s always something new to discover. With regular updates that ensure a constant evolution of gameplay, features, and heroes, Dota 2 has taken on a life of its own.', 1, 0.00, NULL, NULL, NULL, 'games/ro3Nhs2kLyNz2IATbbWm8WXNu5tSmmBRYDlur0NG.jpg', 2, '2025-09-05 02:58:32', '2025-09-05 04:38:47', 0, NULL, NULL, NULL),
(7, 'Marvel Rivals', 'Marvel Rivals is a Super Hero Team-Based PVP Shooter! Assemble an all-star Marvel squad, devise countless strategies by combining powers to form unique Team-Up skills and fight in destructible, ever-changing battlefields across the continually evolving Marvel universe!', 0, 9.99, 7.99, 20, '2025-09-13 13:54:57', 'games/H5uAuqxCMtPgAY3UfTx7cA1vrweYIfU8h9M1qsRp.jpg', 2, '2025-09-05 03:01:39', '2025-09-06 15:29:54', 0, NULL, NULL, NULL),
(8, 'Red Dead Redemption 2', 'Winner of over 175 Game of the Year Awards and recipient of over 250 perfect scores, RDR2 is the epic tale of outlaw Arthur Morgan and the infamous Van der Linde gang, on the run across America at the dawn of the modern age. Also includes access to the shared living world of Red Dead Online.', 1, 59.99, 47.99, 20, '2025-09-13 13:56:45', 'games/sSl2IKEwOG1ju10DFbwPc2W7nku8VOuNj2pGMi7p.jpg', 2, '2025-09-05 03:03:11', '2025-09-06 07:56:45', 0, NULL, NULL, NULL),
(9, 'Red Dead Redemption', 'Experience the story of former outlaw John Marston as he tracks down the last remaining members of the notorious Van der Linde Gang in the PC debut of the critically acclaimed predecessor to Red Dead Redemption 2.', 0, 49.99, NULL, NULL, NULL, 'games/EVzgithgNK7xQxvGWBB46nnXV2jIqHyUDeoZ1CWL.jpg', 2, '2025-09-05 04:20:19', '2025-09-05 04:20:19', 0, NULL, NULL, NULL),
(10, 'Counter-Strike 2', 'For over two decades, Counter-Strike has offered an elite competitive experience, one shaped by millions of players from across the globe. And now the next chapter in the CS story is about to begin. This is Counter-Strike 2.', 0, 0.00, NULL, NULL, NULL, 'games/0EJvDvSyK4KbX8k8fU2BREcTG2tVCPHzFjN1sjhS.jpg', 2, '2025-09-05 04:41:50', '2025-09-05 04:41:50', 0, NULL, NULL, NULL),
(11, 'F1® 25', 'Leave your mark on the world of racing in F1® 25, the official video game of the 2025 FIA Formula One World Championship™, featuring a revamped My Team mode, the thrilling third chapter of Braking Point, and more!', 1, 59.99, NULL, NULL, NULL, 'games/nDgNkry4oJtZ57uIhJ1k1icEt7NMuX9OFDM8RZd3.jpg', 2, '2025-09-05 13:04:20', '2025-09-06 11:12:47', 0, 'Requires a 64-bit processor and operating system\r\nOS: Windows 10 64-bit Version 21H1 or newer\r\nProcessor: Intel Core i5-6400 | Core i5-9600k (VR) or AMD Ryzen 3 1200 | Ryzen 5 2600X (VR)\r\nMemory: 8 GB RAM\r\nGraphics: NVIDIA GTX 1060 (6GB) | GTX 1660Ti (VR) | RTX 2060 (RT) // AMD RX 570 (8GB) | RX 590 (VR) | 6700XT (RT) // Intel Arc A380 (VR/RT)\r\nDirectX: Version 12\r\nNetwork: Broadband Internet connection\r\nStorage: 100 GB available space\r\nSound Card: DirectX Compatible\r\nVR Support: Meta Quest 3 + Link // Meta Quest 2 + Link // Oculus Rift S // HTC Cosmos // HTC Vive Pro // Valve Index // HP Reverb G2\r\nAdditional Notes: CPU: AVX2, 4 cores @ 2.2Ghz or greater // GPU: Shader Model 6.6 or newer // Network: 1Mbps up with < 60ms ping', 'Requires a 64-bit processor and operating system\r\nOS: Windows 10 64-bit Version 21H1 or newer\r\nProcessor: Intel Core i5-9600k or AMD Ryzen 5 2600X\r\nMemory: 16 GB RAM\r\nGraphics: NVIDIA RTX 2070 (+VR) | RTX 3070 (RT) // AMD RX 6600XT | RX 6700XT (VR) | RX 6800 (RT) // Intel Arc A580 (VR/RT)\r\nDirectX: Version 12\r\nNetwork: Broadband Internet connection\r\nStorage: 100 GB available space\r\nSound Card: DirectX Compatible\r\nVR Support: Meta Quest 3 + Link // Meta Quest 2 + Link // Oculus Rift S // HTC Cosmos // HTC Vive Pro // Valve Index // HP Reverb G2\r\nAdditional Notes: CPU: AVX2, 4 cores @ 2.2Ghz or greater // GPU: Shader Model 6.6 or newer // Network: 3Mbps up with < 30ms ping', '[\"screenshots\\/84TxYrzPiSO4AQzeDrobMtRrWbKnxhjq7ey5UxLM.jpg\",\"screenshots\\/rBKWPB2AadxfXaMKx9A0roTeCl2WvteK9NylnVOW.webp\",\"screenshots\\/GX1HkN2jgQWsaB9bephwbA7cjonGihnDU9TRM3my.jpg\",\"screenshots\\/NCbTef8t4fbHE3Ucblp6EG7rDOcIrGu1abdFnIGZ.jpg\"]'),
(12, 'Detroit: Become Human', 'Detroit: Become Human puts the destiny of both mankind and androids in your hands, taking you to a near future where machines have become more intelligent than humans. Every choice you make affects the outcome of the game, with one of the most intricately branching narratives ever created.', 1, 29.99, NULL, NULL, NULL, 'games/9LaqyvhOg21CZiTXJGpoehoBnVFQCYISjFpzoRsz.jpg', 2, '2025-09-06 00:29:31', '2025-09-06 14:10:08', 0, NULL, NULL, NULL),
(13, 'The Witcher 3: Wild Hunt', 'You are Geralt of Rivia, mercenary monster slayer. Before you stands a war-torn, monster-infested continent you can explore at will. Your current contract? Tracking down Ciri — the Child of Prophecy, a living weapon that can alter the shape of the world.', 0, 39.99, NULL, NULL, NULL, 'games/Z7LcfVGzJ915L2UFJLu4uYrIyNq3jj4gbKWCcVmN.jpg', 2, '2025-09-06 00:36:34', '2025-09-06 00:36:34', 0, NULL, NULL, NULL),
(14, 'PUBG: BATTLEGROUNDS', 'PUBG: BATTLEGROUNDS, the high-stakes winner-take-all shooter that started the Battle Royale craze, is free-to-play! Drop into diverse maps, loot unique weapons and supplies, and survive in an ever-shrinking zone where every turn could be your last.', 0, 0.00, NULL, NULL, NULL, 'games/O5kkAPsl4yQJQot6GOMNuz5QvS72SahmK5um2kyQ.jpg', 5, '2025-09-06 06:37:03', '2025-09-06 06:37:03', 1, NULL, NULL, NULL),
(15, 'Need for Speed™ Heat', 'Hustle by day and risk it all at night in Need for Speed™ Heat Deluxe Edition, a white-knuckle street racer, where the lines of the law fade as the sun starts to set.', 0, 69.99, 35.00, 50, '2025-09-11 22:42:03', 'games/usOw3ypLDKAocA4tpIXPP7tpYB83hGw5ddLTML2s.jpg', 5, '2025-09-06 06:51:18', '2025-09-06 16:42:03', 0, NULL, NULL, '[]'),
(16, 'Hollow Knight: Silksong', 'Discover a vast, haunted kingdom in Hollow Knight: Silksong! Explore, fight and survive as you ascend to the peak of a land ruled by silk and song.', 0, 8.19, 7.78, 5, '2025-09-07 16:12:15', 'games/L1WyhsRjFuPRMEsxptncEYqkh7h3szkAnuOZT6xS.jpg', 5, '2025-09-06 10:06:52', '2025-09-06 15:29:57', 0, NULL, NULL, NULL),
(17, 'Baldur\'s Gate 3', 'Baldur’s Gate 3 is a story-rich, party-based RPG set in the universe of Dungeons & Dragons, where your choices shape a tale of fellowship and betrayal, survival and sacrifice, and the lure of absolute power.', 0, 29.98, 28.48, 5, '2025-09-13 22:41:48', 'games/92jZc14XcmPRDAP886XsovkVY6TS85O7W4GYxLAA.jpg', 5, '2025-09-06 15:32:42', '2025-09-06 16:41:48', 0, 'Requires a 64-bit processor and operating system\r\nOS: Windows 10 64-bit\r\nProcessor: Intel I5 4690 / AMD FX 8350\r\nMemory: 8 GB RAM\r\nGraphics: Nvidia GTX 970 / RX 480 (4GB+ of VRAM)\r\nDirectX: Version 11\r\nStorage: 150 GB available space\r\nAdditional Notes: SSD required', 'Requires a 64-bit processor and operating system\r\nOS: Windows 10 64-bit\r\nProcessor: Intel i7 8700K / AMD r5 3600\r\nMemory: 16 GB RAM\r\nGraphics: Nvidia 2060 Super / RX 5700 XT (8GB+ of VRAM)\r\nDirectX: Version 11\r\nStorage: 150 GB available space\r\nAdditional Notes: SSD required', '[\"screenshots\\/vdJgfXgcOMDCa615WFjBdDZozIODQmFBcPk7IfsF.webp\",\"screenshots\\/HTi09M9IknIpdYYzi9WTq6mtT0IY8SCsQXSe8Gnt.jpg\",\"screenshots\\/5aazl87g5xiiKTaMWQufxzYNqAcfqP2xQQx3MfJa.webp\",\"screenshots\\/0TaUlrWGHJgtRjJn0rJZ8ghIK8ZAHngCOGt8H2Wj.jpg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_01_092323_add_role_to_users_table', 1),
(5, '2025_09_01_140606_create_games_table', 2),
(6, '2025_09_01_155833_add_description_to_games_table', 3),
(7, '2025_09_01_160929_add_featured_to_games_table', 4),
(8, '2025_09_05_101021_add_is_free_to_games_table', 5),
(9, '2025_09_05_132649_create_wishlists_table', 6),
(10, '2025_09_05_200546_create_reviews_table', 7),
(11, '2025_09_06_075812_create_notifications_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('riaz.km767@gmail.com', '$2y$12$qOmLmQIEuONUGl2Wf.cJ8.NLLcApNVNf.1.XSym6Yfy3nqx7xTR1C', '2025-09-06 14:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) DEFAULT 0.00,
  `status` varchar(50) DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `game_id`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 59.99, 'paid', '2025-09-05 17:28:59', '2025-09-05 17:28:59'),
(2, 1, 11, 59.99, 'paid', '2025-09-05 17:29:38', '2025-09-05 17:29:38'),
(3, 1, 9, 49.99, 'paid', '2025-09-05 17:52:03', '2025-09-05 17:52:03'),
(4, 1, 6, 0.00, 'paid', '2025-09-05 17:59:30', '2025-09-05 17:59:30'),
(5, 1, 7, 9.99, 'paid', '2025-09-05 18:09:27', '2025-09-05 18:09:27'),
(6, 1, 10, 0.00, 'paid', '2025-09-05 18:11:52', '2025-09-05 18:11:52'),
(7, 1, 12, 29.99, 'paid', '2025-09-06 00:33:46', '2025-09-06 00:33:46'),
(18, 1, 16, 8.19, 'paid', '2025-09-06 10:26:09', '2025-09-06 10:26:09'),
(20, 9, 17, 29.98, 'paid', '2025-09-06 15:35:02', '2025-09-06 15:35:02'),
(21, 9, 11, 59.99, 'paid', '2025-09-06 16:15:27', '2025-09-06 16:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `review` text DEFAULT NULL,
  `is_positive` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `game_id`, `rating`, `review`, `is_positive`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 5, 'Goated', 1, '2025-09-05 14:21:40', '2025-09-05 14:21:40'),
(2, 1, 11, 5, 'I wanna play it.', 1, '2025-09-05 14:28:00', '2025-09-05 14:32:59'),
(3, 1, 6, 5, 'Cancer', 1, '2025-09-05 14:33:15', '2025-09-05 14:33:15'),
(4, 1, 8, 5, 'Goated', 1, '2025-09-05 14:33:30', '2025-09-05 14:33:30'),
(5, 1, 10, 4, 'Full of Russians', 1, '2025-09-05 15:07:01', '2025-09-05 15:07:01'),
(7, 9, 17, 5, 'Ohho', 1, '2025-09-06 15:35:15', '2025-09-06 15:35:28'),
(8, 9, 16, 5, 'New game', 1, '2025-09-06 16:02:40', '2025-09-06 16:03:23'),
(9, 9, 11, 5, 'Forza Ferrari', 1, '2025-09-06 16:15:16', '2025-09-06 16:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('i25l2qiO8bNY4uepB70WTgVhfLS7jVivU5QPM3ju', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOG1xVDRIa3d3Q1FxVFZyWWZIa2phcm5PRllCQWlrTzc4RjVWcUdvSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC91c2VyL25vdGlmaWNhdGlvbnMiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjQwOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXNlci9ub3RpZmljYXRpb25zIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mzt9', 1757198613);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `avatar`, `phone`, `address`, `blood_group`, `location`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Yurnero', 'riaz.km767@gmail.com', 'Yurnero', NULL, '90428329847', 'BracU', 'O+', 'Dhaka,Bangladesh', NULL, '$2y$12$ix0M3mNjAG6l1c8QqOuMfutu/hdTFQrEgK4ntLkqtwFGfenp7MPxi', 'user', 'BpfD8tWMxjNr8dpIbFmITdGrTrkbjhFcVT8dZhNZLujcESKc3a6uaNnYwDH7', '2025-09-01 03:59:40', '2025-09-05 14:38:06'),
(2, 'Mortred', 'riaz.km767@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$a9VG3z3i2RIsyHujWMYdP.LdeXp0/hx9Hde9OQ7aQKUDoLsvIAYXS', 'developer', '31i7dwKEm4g0KSDGhWjMDOzj8N2Yy3nKQNqBA3C3hXuTjKY6tCPg3dgGqHJt', '2025-09-01 07:55:46', '2025-09-01 07:55:46'),
(3, 'Kael', 'invoker@gmail.com', 'Invoker', 'avatars/EdlvmroTHYUsC24NfRZxe5Ru1yZZUrdTh8GyrmI3.png', '424774048', 'BracU', 'O+', 'Dhaka,Bangladesh', NULL, '$2y$12$eJTPe6PGznXnZfRpnyFAp.p6KMdI9MxLIUdjj.Iq/1uyJP3xcMzlq', 'admin', 'rUlu2OLhzvuunTCviGcsxtdIJTqCY6at2FvI7FpsU1ajP2X54ylxlNFqAsBl', '2025-09-01 08:55:12', '2025-09-06 14:06:55'),
(5, 'Doom', 'doom@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$9TH0S5.aeDdg9USTHJmDz.U1rVXnhI0aIW7jJ/3lq31ZOPv5L/M1u', 'developer', '8py83aSNiIOM0NmeQb72IPlp4i2vvfs5a5pgdOlOFYtrsUHw3XGtjyfc8ZQd', '2025-09-06 02:10:32', '2025-09-06 02:10:32'),
(7, 'Lycan', 'lycan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$YyrIVBbaUREi.apEmuZfn.Zxjb9VN6D6iLOTuyPNdGjwjk1KG.5Ky', 'user', NULL, '2025-09-06 14:45:01', '2025-09-06 14:45:01'),
(9, 'Riki', 'riki@gmail.com', 'Riki', NULL, '09353963037', 'BracU', 'O+', 'Dhaka,Bangladesh', NULL, '$2y$12$xpjEkX6V8Dt0VWv3JpFRwuxbmOBeFppWSEGgmGO78a8ps6fnPDZ.u', 'user', NULL, '2025-09-06 15:34:13', '2025-09-06 15:50:39');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `game_id`, `created_at`, `updated_at`) VALUES
(42, 9, 15, '2025-09-06 15:36:17', '2025-09-06 15:36:17'),
(49, 9, 16, '2025-09-06 16:20:03', '2025-09-06 16:20:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bug_reports`
--
ALTER TABLE `bug_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `developer_id` (`developer_id`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_developer_id_foreign` (`developer_id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_purchases_user` (`user_id`),
  ADD KEY `fk_purchases_game` (`game_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_user_id_game_id_unique` (`user_id`,`game_id`),
  ADD KEY `reviews_game_id_foreign` (`game_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_game_id_unique` (`user_id`,`game_id`),
  ADD KEY `wishlists_game_id_foreign` (`game_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bug_reports`
--
ALTER TABLE `bug_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bug_reports`
--
ALTER TABLE `bug_reports`
  ADD CONSTRAINT `bug_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bug_reports_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bug_reports_ibfk_3` FOREIGN KEY (`developer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_developer_id_foreign` FOREIGN KEY (`developer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `fk_purchases_game` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_purchases_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_game_id_foreign` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
