-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2021 at 11:06 PM
-- Server version: 10.3.31-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.3.29-1+focal

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rain_dating`
--

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_12_08_010825_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('tusar8145@gmail.com', '$2y$10$evznIV6TUhRIRD1lT6EbAenoXc1LmuixVyakfkr4qzIZ5Y0.odfLq', '2021-12-10 10:00:59');

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
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 7, 'test', '14406ae8a80d86de4661e90092a5771804b0ff946ae690688b8a5d4aff62245f', '[\"read\"]', NULL, '2021-12-11 14:12:07', '2021-12-11 14:12:07'),
(2, 'App\\Models\\User', 7, 'my-app-token', '14f62002fb6811ab7c56961d43b52dc3217c564e03c388b400f08bf878faf660', '[\"*\"]', NULL, '2021-12-11 16:03:39', '2021-12-11 16:03:39'),
(3, 'App\\Models\\User', 7, 'my-app-token', '2105fa1804ecda99f8a9beecc67c553620d415ea9f10fd9e6240e061ae770710', '[\"*\"]', NULL, '2021-12-11 16:03:42', '2021-12-11 16:03:42'),
(4, 'App\\Models\\User', 7, 'my-app-token', '71fc9f64af7adcd5a79f7b01d0f354376f0e4ab05d992aa15c1801827c140c62', '[\"*\"]', NULL, '2021-12-11 16:16:23', '2021-12-11 16:16:23'),
(5, 'App\\Models\\User', 7, 'my-app-token', 'a7014701f842737612339ca934566cc394a6c4571d1ab45ad3b279c9d60c26de', '[\"*\"]', NULL, '2021-12-11 16:16:33', '2021-12-11 16:16:33'),
(6, 'App\\Models\\User', 7, 'my-app-token', 'c84de9c6f95d33bb8ceb8fb3148d5bbd2495ce18b3ef81968028ae4d9d84f7e3', '[\"*\"]', NULL, '2021-12-11 16:18:10', '2021-12-11 16:18:10'),
(7, 'App\\Models\\User', 7, 'my-app-token', 'bb181bb710f4f07ba8e1c53de5b7b61036f6c7041febec112272bfe231b36950', '[\"*\"]', NULL, '2021-12-11 16:25:36', '2021-12-11 16:25:36'),
(8, 'App\\Models\\User', 7, 'my-app-token', '8eb78052406ac690bc30be13d62166f1cf115884c363427cec8fa63e5be9f92f', '[\"*\"]', NULL, '2021-12-11 16:25:58', '2021-12-11 16:25:58'),
(9, 'App\\Models\\User', 7, 'my-app-token', 'f54a2332ccaa48fcd9d7f022b06fd9b6a92e3f843c5a06d047bdb911a4ac1086', '[\"*\"]', NULL, '2021-12-11 16:26:27', '2021-12-11 16:26:27'),
(10, 'App\\Models\\User', 7, 'my-app-token', 'eb37c0abde110500140ddeda056c9068380b00878fbbc4e710df3d3b0965de95', '[\"*\"]', NULL, '2021-12-11 16:26:31', '2021-12-11 16:26:31'),
(11, 'App\\Models\\User', 7, 'my-app-token', 'f0a95dc94fb07d94c328c64ba671c25765d4eefb7c8a3e0707e0a13294d595cc', '[\"*\"]', NULL, '2021-12-11 16:30:12', '2021-12-11 16:30:12'),
(12, 'App\\Models\\User', 7, 'my-app-token', '4eaeeee0f33207ea7cf543c2c23e3a758d8d2b4966dd4e76d508ad594e31ad63', '[\"*\"]', NULL, '2021-12-11 16:30:34', '2021-12-11 16:30:34'),
(13, 'App\\Models\\User', 7, 'my-app-token', '6068107143c06fd5b54f519588ac79ab8653b2b9f72262a77d50859733c70ebd', '[\"*\"]', NULL, '2021-12-11 16:30:54', '2021-12-11 16:30:54'),
(14, 'App\\Models\\User', 7, 'my-app-token', 'fe3a4b71013da5ca0087c360c49be8c6257465340ee6828f9ccfb49b575cc26a', '[\"*\"]', NULL, '2021-12-11 16:32:16', '2021-12-11 16:32:16'),
(15, 'App\\Models\\User', 7, 'my-app-token', '4300e580ba291ee4a8350a117a6c4ce740c67f0310b864e1efbea9ce64652be5', '[\"*\"]', NULL, '2021-12-11 16:34:17', '2021-12-11 16:34:17'),
(16, 'App\\Models\\User', 7, 'my-app-token', '3908ba259c4e21ac4e4d1677c2588b03b73f1727746dfffb17be3d7f3f54314b', '[\"*\"]', NULL, '2021-12-11 16:34:29', '2021-12-11 16:34:29'),
(17, 'App\\Models\\User', 7, 'my-app-token', '80f0d5ce546f225bd1660679dbf494eb62414a5296b581c335ffa277c568cf01', '[\"*\"]', NULL, '2021-12-11 16:38:39', '2021-12-11 16:38:39'),
(18, 'App\\Models\\User', 7, 'my-app-token', '23a6e419842048164a00884763f3670911fdc307bbbb4ab2a7f418f82237c64f', '[\"*\"]', NULL, '2021-12-11 16:39:17', '2021-12-11 16:39:17'),
(19, 'App\\Models\\User', 7, 'my-app-token', '0072bb7a89e51b302f9d1606b1764941d923a3e9c14d3067718109b6bc4a9f05', '[\"*\"]', NULL, '2021-12-11 16:41:30', '2021-12-11 16:41:30'),
(20, 'App\\Models\\User', 7, 'my-app-token', '74b8267f7da2f658aee92b4bc817b9fffad2ed72afaba6af7fca3261bb7ca9c1', '[\"*\"]', NULL, '2021-12-11 16:42:41', '2021-12-11 16:42:41'),
(21, 'App\\Models\\User', 7, 'my-app-token', 'd88817ee0825605f58286ef8503288a6c3a11e1b4d321ce40228c4ded3815ce9', '[\"*\"]', NULL, '2021-12-11 16:43:46', '2021-12-11 16:43:46'),
(22, 'App\\Models\\User', 7, 'my-app-token', '0da71082ed5572b01e716203de9a7817f23d87efc97f28999e753131a155bf42', '[\"*\"]', NULL, '2021-12-11 16:44:41', '2021-12-11 16:44:41'),
(23, 'App\\Models\\User', 7, 'my-app-token', '9c0f5ce9729895112ecf1bccfeab0808e8c1616db0a37e99dca68886154b65b4', '[\"*\"]', NULL, '2021-12-11 16:44:47', '2021-12-11 16:44:47'),
(24, 'App\\Models\\User', 7, 'my-app-token', '7c9d3e539a02bdad560a3409dafef5af985bf22ce2cb1dfed4b7b10013ce7035', '[\"*\"]', NULL, '2021-12-11 16:45:12', '2021-12-11 16:45:12'),
(25, 'App\\Models\\User', 7, 'my-app-token', '09f831eeceed7f5b85a448eb7ec8460d53f827f82684387b8cfb2669b98a8004', '[\"*\"]', NULL, '2021-12-11 16:45:20', '2021-12-11 16:45:20'),
(26, 'App\\Models\\User', 7, 'my-app-token', '38c042bdc499c03126e0eabebaa87fdcb1f10b8b4c7490d0b9742b84c38ec4c8', '[\"*\"]', NULL, '2021-12-11 17:02:52', '2021-12-11 17:02:52'),
(27, 'App\\Models\\User', 7, 'my-app-token', 'fa2be313d6a6c615a9f4b12d4d042963a8df8e7ae96cb9475fcc59f5b9a9591e', '[\"*\"]', NULL, '2021-12-11 17:07:37', '2021-12-11 17:07:37'),
(28, 'App\\Models\\User', 7, 'my-app-token', '73e6bc3210bd570cc7d6184001bb77fcbe19f476269deec328934a356c864df3', '[\"*\"]', NULL, '2021-12-11 17:12:55', '2021-12-11 17:12:55'),
(29, 'App\\Models\\User', 7, 'my-app-token', '4a3d72e56ac6af851ecda9409d6a51013052d5a65b46609e9755880abd586381', '[\"*\"]', NULL, '2021-12-11 17:16:00', '2021-12-11 17:16:00'),
(30, 'App\\Models\\User', 7, 'my-app-token', '5f8a7aeab629c358de51c27dd9969ba106257b164c033250e9c34c14cbcff7e4', '[\"*\"]', NULL, '2021-12-11 17:23:29', '2021-12-11 17:23:29'),
(31, 'App\\Models\\User', 7, 'my-app-token', 'eacc9d7b2a9c593c6da25f2b89c904ed91943565f1f1a1fb23f24862dd42c2ee', '[\"*\"]', NULL, '2021-12-11 17:24:01', '2021-12-11 17:24:01'),
(32, 'App\\Models\\User', 7, 'my-app-token', '9146f8f3cda1311aff5b43661eaebae5e510c5741b4964ded3e4061d67393900', '[\"*\"]', NULL, '2021-12-11 17:24:39', '2021-12-11 17:24:39'),
(33, 'App\\Models\\User', 7, 'my-app-token', '2cb8389321e934ac8c71b7ae6ac8fa2b38fa5a147ceaba5ad07211f784004f2e', '[\"*\"]', NULL, '2021-12-11 17:28:07', '2021-12-11 17:28:07'),
(34, 'App\\Models\\User', 7, 'my-app-token', 'e5d245f9b3c2506483e92ce5e5a9e6cdbb210de95f8e7b7db82d87cd6c67aece', '[\"*\"]', NULL, '2021-12-11 17:28:37', '2021-12-11 17:28:37'),
(35, 'App\\Models\\User', 7, 'my-app-token', 'a96f1938cb3fe750eee4f868690522cbe5d62f1a0e6d1dde60475fb22e9abec2', '[\"*\"]', NULL, '2021-12-11 17:28:50', '2021-12-11 17:28:50'),
(36, 'App\\Models\\User', 7, 'my-app-token', 'd2d2a1730a42544b4fa9ad9fbf0c653033f7ce0f41285d52d25f3faa9165d768', '[\"*\"]', NULL, '2021-12-11 17:33:21', '2021-12-11 17:33:21'),
(37, 'App\\Models\\User', 7, 'my-app-token', '8ede2ccf52265adc3eff839ded2c346c60e210faa330bcdda3b8a4c7c0cd9cf1', '[\"*\"]', NULL, '2021-12-11 17:33:57', '2021-12-11 17:33:57'),
(38, 'App\\Models\\User', 7, 'my-app-token', '375fa68cdec8482a3dad7bd02c4761c67d095cdee0cfea996b6e4164006d5f6d', '[\"*\"]', NULL, '2021-12-11 17:34:14', '2021-12-11 17:34:14'),
(39, 'App\\Models\\User', 7, 'my-app-token', 'd449774166188f58ca427002e8e9a1da1066cc61556da0ab8b21464efbf10af7', '[\"*\"]', NULL, '2021-12-11 17:40:03', '2021-12-11 17:40:03'),
(40, 'App\\Models\\User', 7, 'my-app-token', 'a5672fbd2c8faaff45a52d9a896e59b074d73c122aaba4d86f581bd07e63ae41', '[\"*\"]', NULL, '2021-12-11 17:40:31', '2021-12-11 17:40:31'),
(41, 'App\\Models\\User', 7, 'my-app-token', '43335a3df3751d3f261fed1bc386dd3128d29c4faeda198b40c631c8d4bd59c3', '[\"*\"]', NULL, '2021-12-11 17:41:57', '2021-12-11 17:41:57'),
(42, 'App\\Models\\User', 7, 'my-app-token', '18ff05273f459d2ee57c949787be1c27871b1a62815751777c91ec0dd24ed08b', '[\"*\"]', NULL, '2021-12-11 17:42:43', '2021-12-11 17:42:43'),
(43, 'App\\Models\\User', 7, 'my-app-token', '07754a567b4d61c7fc2e469541a245105b84ee53a84a750862dc3d9b647d07b0', '[\"*\"]', NULL, '2021-12-11 17:43:15', '2021-12-11 17:43:15'),
(44, 'App\\Models\\User', 7, 'my-app-token', '8a8c6f45106b760aec9009f783d945b43df9cda1d7624a8b0fddfad85f4ee9d6', '[\"*\"]', NULL, '2021-12-11 17:45:21', '2021-12-11 17:45:21'),
(45, 'App\\Models\\User', 7, 'my-app-token', '86617a4ffcd3db838c89a0ef5c6873412e10d06ab17ed46fe9f430eafa0d8613', '[\"*\"]', NULL, '2021-12-11 17:45:36', '2021-12-11 17:45:36'),
(46, 'App\\Models\\User', 7, 'my-app-token', '22a79f85324c8d46a986f652373a7e3ac6ea4bdff5c6398a7484d0a22fa429be', '[\"*\"]', NULL, '2021-12-11 17:46:00', '2021-12-11 17:46:00'),
(47, 'App\\Models\\User', 7, 'my-app-token', '970310adf213ad1acc95f968915f288478eae2526751e81547e642c52679ff18', '[\"*\"]', NULL, '2021-12-11 17:46:20', '2021-12-11 17:46:20'),
(48, 'App\\Models\\User', 7, 'my-app-token', '3f6424d135a12974de6adebbae5c36cea0c43fbc138cec938d56a5d3df96e3b9', '[\"*\"]', NULL, '2021-12-11 17:46:49', '2021-12-11 17:46:49'),
(49, 'App\\Models\\User', 7, 'my-app-token', '0de0d93ce323036c52a9d02642519531f8db5a8247a576a5e179ec2bf4cfae76', '[\"*\"]', NULL, '2021-12-11 17:48:29', '2021-12-11 17:48:29'),
(50, 'App\\Models\\User', 7, 'my-app-token', '661a3467a5223c70256c1a6a1ad5eb31d6e14285a556688c5ae272a61a124bae', '[\"*\"]', NULL, '2021-12-11 17:49:10', '2021-12-11 17:49:10'),
(51, 'App\\Models\\User', 7, 'my-app-token', '53728cdb5f7dcd28e894df20e9b842e0037573a6223481962a6c34e1a1028f1e', '[\"*\"]', NULL, '2021-12-11 17:50:12', '2021-12-11 17:50:12'),
(52, 'App\\Models\\User', 7, 'my-app-token', '8e7addb71f9051ab0c746f89f592d509a0561a423f3c1a5b648093d04ae7b1f3', '[\"*\"]', NULL, '2021-12-11 17:50:57', '2021-12-11 17:50:57'),
(53, 'App\\Models\\User', 7, 'my-app-token', '54720b3a277dbcbecc24276c8e8cee2ea3738968e12443466e3f7f0cc5e211f6', '[\"*\"]', NULL, '2021-12-11 17:51:23', '2021-12-11 17:51:23'),
(54, 'App\\Models\\User', 7, 'my-app-token', '839aaa5a3b51557842bb2a4e9b56981a428b00231188adcf7ef5af8cf96e8c07', '[\"*\"]', NULL, '2021-12-11 17:54:21', '2021-12-11 17:54:21'),
(55, 'App\\Models\\User', 7, 'my-app-token', '356ac639b8ad8a2c3f745771452fd395c41cfcc57b9438b756cb8ca742bd116e', '[\"*\"]', NULL, '2021-12-11 17:57:58', '2021-12-11 17:57:58'),
(56, 'App\\Models\\User', 7, 'my-app-token', 'e2a5339caa1aea61763eae38ee5baa14bdb4b6522c190a3f1efd8031791da40b', '[\"*\"]', NULL, '2021-12-11 18:01:50', '2021-12-11 18:01:50'),
(57, 'App\\Models\\User', 7, 'my-app-token', '842788af556a57da8281545980c39d3d174b1494e44f49a8d37dc87efc2ee5e1', '[\"*\"]', NULL, '2021-12-11 18:04:02', '2021-12-11 18:04:02'),
(58, 'App\\Models\\User', 7, 'my-app-token', 'bda5ac571de5a64d05803ecc0d24a0618b5f0a34dcff6873648ccd656ba22da5', '[\"*\"]', NULL, '2021-12-11 18:06:58', '2021-12-11 18:06:58'),
(59, 'App\\Models\\User', 7, 'my-app-token', '6aa0f7da23e1780c46e27422a1262e83ae2ea64d4f8d87603e97d648609fd713', '[\"*\"]', NULL, '2021-12-11 18:08:13', '2021-12-11 18:08:13'),
(60, 'App\\Models\\User', 7, 'my-app-token', '980a70a042a1171c6026b32ad11b8e37ce97e2d0a7031109b16ba700a4ccb09d', '[\"*\"]', NULL, '2021-12-11 18:09:38', '2021-12-11 18:09:38'),
(61, 'App\\Models\\User', 7, 'my-app-token', '2ec8fe31c3611188579f791e79488247b7dace3214c5b3a64dbc05a9146544ee', '[\"*\"]', NULL, '2021-12-11 18:09:51', '2021-12-11 18:09:51'),
(62, 'App\\Models\\User', 7, 'my-app-token', '3f19fef081a08fa64569a2ce216d241581755a24c6405e74a42a457270dd4a9c', '[\"*\"]', NULL, '2021-12-11 18:10:16', '2021-12-11 18:10:16'),
(63, 'App\\Models\\User', 7, 'my-app-token', 'e369c0c8298bc22f515879e11e978e7208581d1abd187da93a78ca3175b34c9e', '[\"*\"]', NULL, '2021-12-11 18:10:39', '2021-12-11 18:10:39'),
(64, 'App\\Models\\User', 7, 'my-app-token', '82ef4cb81c8543b5b2bbbea34fa465945f33dfe05a5340b77c7d494aec4bd6e2', '[\"*\"]', NULL, '2021-12-11 18:10:54', '2021-12-11 18:10:54'),
(65, 'App\\Models\\User', 7, 'my-app-token', '12227ff65aef8070508a504eaf59eb0e978f170c7599881835241bb6600bbe05', '[\"*\"]', NULL, '2021-12-11 18:20:47', '2021-12-11 18:20:47'),
(66, 'App\\Models\\User', 7, 'my-app-token', '98d5eeb1cbdbf82a8dce5e5a34fc572e9974cd74babf2f29dcadc5caf0fd9dde', '[\"*\"]', NULL, '2021-12-11 18:21:04', '2021-12-11 18:21:04'),
(67, 'App\\Models\\User', 7, 'my-app-token', 'b8dd36242a9f87a4b0c869e86867dcafbd364e50640dc3db571fe701fae0f0bb', '[\"*\"]', NULL, '2021-12-11 18:21:21', '2021-12-11 18:21:21'),
(68, 'App\\Models\\User', 7, 'my-app-token', '3bc90adbbe66ce57adcde5c16fef7bcaf1d5b9a5f942d90cfcf7e6df1434785b', '[\"*\"]', NULL, '2021-12-11 18:23:23', '2021-12-11 18:23:23'),
(69, 'App\\Models\\User', 7, 'my-app-token', 'e436090f04947c9ccfc364d393eb2369e78bb1576d59000631c0ba331a2d9438', '[\"*\"]', NULL, '2021-12-11 18:26:40', '2021-12-11 18:26:40'),
(70, 'App\\Models\\User', 7, 'my-app-token', '9630a3736a9eebe1b16d6d294520ce98d02c6fff2aa95624fa67b17a1ef9a78e', '[\"*\"]', NULL, '2021-12-11 18:27:20', '2021-12-11 18:27:20'),
(71, 'App\\Models\\User', 7, 'my-app-token', '2ea009db1147fc938c0f93e8515addb460947f42adecf07ce20454be5e7b0640', '[\"*\"]', NULL, '2021-12-11 18:31:57', '2021-12-11 18:31:57'),
(72, 'App\\Models\\User', 7, 'my-app-token', '34e90cf97d43f66ebfbaa076ef6f3c09c79087aea07b9e45bcfa0daacd79c15c', '[\"*\"]', NULL, '2021-12-11 18:32:18', '2021-12-11 18:32:18'),
(73, 'App\\Models\\User', 7, 'my-app-token', 'fe5966644a2b01a923157b21cde84113451e159dee584361f214166587f2bdee', '[\"*\"]', NULL, '2021-12-11 18:32:37', '2021-12-11 18:32:37'),
(74, 'App\\Models\\User', 7, 'my-app-token', '07f3d5f2dc87f1ecf3c108227ace0a26bd44cf83589aabb8e220916e8a41e92f', '[\"*\"]', NULL, '2021-12-11 18:34:10', '2021-12-11 18:34:10'),
(75, 'App\\Models\\User', 7, 'my-app-token', 'eef0fc99768ee7df82794af3dac4510316fd0e962a7626a89b7d09252ca8b108', '[\"*\"]', NULL, '2021-12-11 18:34:22', '2021-12-11 18:34:22'),
(76, 'App\\Models\\User', 7, 'my-app-token', 'fddc7115106d9e7d6c16eaccf9403f23a076a1c5067efad2e4e886f6ad6b653e', '[\"*\"]', NULL, '2021-12-11 18:34:54', '2021-12-11 18:34:54'),
(77, 'App\\Models\\User', 7, 'my-app-token', '57352f3794f63ad22839e1d6f0a92c3971dd928f646b929319de893636e37bba', '[\"*\"]', NULL, '2021-12-11 18:35:35', '2021-12-11 18:35:35'),
(78, 'App\\Models\\User', 7, 'my-app-token', '8cb7aac10f76ec53e4fab7adb8e1e023cf0613e8a0fe4c0d4821637798ad586a', '[\"*\"]', NULL, '2021-12-11 18:36:18', '2021-12-11 18:36:18'),
(79, 'App\\Models\\User', 7, 'my-app-token', '594338d114de3cf46dbee67dafdb918f625719f7dd42056dc7dea8734692b6da', '[\"*\"]', NULL, '2021-12-11 19:44:08', '2021-12-11 19:44:08'),
(80, 'App\\Models\\User', 7, 'my-app-token', 'ed3b8d1ff37bdf03d55b9a5c289c97556f5f7977b03a5a67a04045a2da3a259a', '[\"*\"]', NULL, '2021-12-11 19:44:59', '2021-12-11 19:44:59'),
(81, 'App\\Models\\User', 7, 'my-app-token', '7bc6fd8ec2f73c2b8493d79666088e278643e4e8e9e5894ad75a21694a497180', '[\"*\"]', NULL, '2021-12-11 19:45:58', '2021-12-11 19:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('EsgYSJy2utbM89kpAQ8PxT9jBvWaPOyupd06t9Re', NULL, '27.147.207.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36 OPR/82.0.4227.23', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjhVZGJLVlViRmt2c2dIRW5LNUtSV2JJTUtCTmNJVG9ld1h3d1dVTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vcmFpbmVudGVycHJpc2ViZC5jb20iO319', 1639252034),
('mDk7iod6fJN5ius2lsrZqCGIOOs9Ic6AcFgJhjYh', NULL, '23.108.52.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTh3Z3hFaWZza3ZOSU50YTl2R1RIVllqMEExa2wzWEd5dWpSTjczYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vcmFpbmVudGVycHJpc2ViZC5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1639252547),
('O6JoQ6bijLxolxxRHXE7VSan53aDQLmTv5UcZ8oV', NULL, '27.147.207.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36 OPR/82.0.4227.23', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOVNRMnlFTzg2Q0NlSWRGWlpUMFZnZjRVd0lSQVFGM0tEejZFcVJNaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1639249815),
('xEryPtXS83TW0LkQMns3L6vOAGiBzYHfVScgjZpf', 8, '27.147.207.247', 'Mozilla/5.0 (Linux; Android 11; RMX2001) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.92 Mobile Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMERaRXV6OTdLR0xHekM2VTRZbzh4MnJJekJHNHJmWGsxY1NMZE1BSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vcmFpbmVudGVycHJpc2ViZC5jb20vZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDhRbmVmT2VmbHlkdmpsRS5Iak1YNU9WdVNDem1pL2Z4OWZmTXdtdkxvMUhmNWFXTng3eHAuIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQ4UW5lZk9lZmx5ZHZqbEUuSGpNWDVPVnVTQ3ptaS9meDlmZk13bXZMbzFIZjVhV054N3hwLiI7fQ==', 1639252440);

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
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT 'profile-photos/sample.png',
  `dob` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lng` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `dob`, `gender`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(7, 'Tusar', 'tusar8145@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/sYGofz0MTJRi2yxZFhBA5t6G71mnTdUg0ySC3RCM.jpg', '2015-12-01', 'Male', '24.458993', '89.7047073', '2021-12-10 09:21:55', '2021-12-11 19:47:02'),
(8, 'Sample user 1', 'sample1@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/591C8925FLP69aqxZgxAf8YkcZoauFAWSrby40X8.jpg', '2018-12-01', 'Male', '24.4574833', '89.7049557', '2021-12-10 09:21:55', '2021-12-11 19:38:36'),
(9, 'Sample user 2', 'sample2@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/6Nv2rIJFHPyAWjh4JbSwSYR0A4l9hOtuxzAsIy7K.png', '2015-12-01', 'Male', '24.451235796708914 ', '89.71246216141608 ', '2021-12-10 09:21:55', '2021-12-11 12:19:53'),
(10, 'Sample user 3', 'sample3@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/gn07IbEuzLrwJi9V08LVEw2ahNKfg7pFSxyBq714.png', '2001-12-01', 'Male', '24.442562880760523 ', '89.69781069372033 ', '2021-12-10 09:21:55', '2021-12-11 12:20:42'),
(11, 'Sample user 4', 'sample4@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/UNledALIjwjT002VopH0Gez0lafXOnwIDi6TAkx4.jpg', '2004-12-01', 'Male', '24.44446834523869 ', '89.66908515670107 ', '2021-12-10 09:21:55', '2021-12-11 12:21:16'),
(14, 'Sample user 6', 'sample6@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/1ZnvuEu4XqYBV3AjgeJ5mmj9kVpO0BP78Wpply3G.jpg', '2004-12-01', 'Male', '24.4622538', '89.6989439', '2021-12-10 09:21:55', '2021-12-11 12:32:49'),
(15, 'Sample user 7', 'sample7@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/fHnEoEuABjgmxctg6p0HMtKeUuRqerQ54snRXS5q.png', '2007-12-01', 'Male', '24.457253634660866 ', '89.7042654025285 ', '2021-12-10 09:21:55', '2021-12-11 12:23:08'),
(16, 'Sample user 8', 'sample8@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/9cEQEteN0fKAmJxCinDqfKktYbEJ2ZfWNIjtLk8S.jpg', '2006-12-01', 'Male', '24.460378761258664 ', '89.69980220685945 ', '2021-12-10 09:21:55', '2021-12-11 12:23:19'),
(17, 'Sample user 9', 'sample9@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/uBg9WuTH0M22oecpAzaeLSbCxFhl8EtrmK2h9P1W.png', '2004-12-01', 'Male', '24.460066252087923 ', '89.6937940588434 ', '2021-12-10 09:21:55', '2021-12-11 12:25:11'),
(18, 'Sample user 10', 'sample10@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/cVbGhsDspoHX8Z6Axb8sKMR45ejvelvyAV5YBecp.png', '2011-12-01', 'Male', '24.4574851', '89.7049503', '2021-12-10 09:21:55', '2021-12-11 12:42:04'),
(19, 'Sample user 11', 'sample11@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/9cEQEteN0fKAmJxCinDqfKktYbEJ2ZfWNIjtLk8S.jpg', '2012-12-01', 'Male', '23.789615351040336 ', '90.4017501183653 ', '2021-12-10 09:21:55', '2021-12-11 11:01:21'),
(20, 'Sample user 12', 'sample12@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/qFzS9clCemn3dbGwoVIyGWvB2uih7k1YGLqKUEPL.jpg', '2000-12-01', 'Male', '23.79063503183958 ', '90.40084889616287 ', '2021-12-10 09:21:55', '2021-12-11 12:26:31'),
(21, 'Sample user 13', 'sample13@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/9INlEr0eMMLVTY8s0A2peZlguk4afIEOr2IQQF3E.jpg', '2004-12-01', 'Male', '23.79246101070148 ', '90.39953997820226 ', '2021-12-10 09:21:55', '2021-12-11 12:26:56'),
(22, 'Sample user 14', 'sample14@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/9cEQEteN0fKAmJxCinDqfKktYbEJ2ZfWNIjtLk8S.jpg', '2004-12-01', 'Male', '23.79195052457108 ', '90.40411046222874 ', '2021-12-10 09:21:55', '2021-12-11 11:01:21'),
(23, 'Sample user 15', 'sample15@gmail.com', '2021-12-10 09:22:26', '$2y$10$8QnefOeflydvjlE.HjMX5OVuSCzmi/fx9ffMwmvLo1Hf5aWNx7xp.', NULL, NULL, NULL, NULL, 'profile-photos/4HsaQdAo8RyBWOdoTUOfmh5s5nfbpiNrPrDZvBg0.jpg', '2011-12-01', 'Male', '23.789615351040336 ', '90.40747107569386 ', '2021-12-10 09:21:55', '2021-12-11 12:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `users_chat`
--

CREATE TABLE `users_chat` (
  `id` int(250) NOT NULL,
  `from_users_id` varchar(250) DEFAULT NULL,
  `to_users_id` varchar(250) DEFAULT NULL,
  `sms` varchar(2500) DEFAULT NULL,
  `seen` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_chat`
--

INSERT INTO `users_chat` (`id`, `from_users_id`, `to_users_id`, `sms`, `seen`, `created_at`, `updated_at`) VALUES
(1, '8', '7', 'Hi', 1, '2021-12-11 19:39:52', '2021-12-11 19:41:19'),
(2, '7', '8', 'hlw', 1, '2021-12-11 19:40:00', '2021-12-11 19:41:19'),
(3, '8', '7', 'How r you?', 1, '2021-12-11 19:40:27', '2021-12-11 19:41:19'),
(4, '7', '8', 'f9', 1, '2021-12-11 19:40:36', '2021-12-11 19:41:19'),
(5, '7', '8', 'u?', 1, '2021-12-11 19:40:39', '2021-12-11 19:41:19'),
(6, '7', '8', 'hey?', 1, '2021-12-11 19:40:46', '2021-12-11 19:41:19'),
(7, '7', '17', 'hi', 0, '2021-12-11 19:40:56', '2021-12-11 19:40:56'),
(8, '8', '7', 'Ok', 1, '2021-12-11 19:41:19', '2021-12-11 19:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `users_likes`
--

CREATE TABLE `users_likes` (
  `id` int(250) NOT NULL,
  `from_users_id` varchar(250) DEFAULT NULL,
  `to_users_id` varchar(250) DEFAULT NULL,
  `likes` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_likes`
--

INSERT INTO `users_likes` (`id`, `from_users_id`, `to_users_id`, `likes`, `created_at`, `updated_at`) VALUES
(1, '1', '4', '1', '2021-12-08 16:26:06', '2021-12-09 21:08:25'),
(2, '4', '3', '1', '2021-12-09 03:03:57', '2021-12-09 19:17:23'),
(6, '1', '3', '1', '2021-12-09 14:52:44', '2021-12-10 08:37:20'),
(7, '3', '1', '1', '2021-12-09 21:14:00', '2021-12-09 21:14:05'),
(8, '7', '3', '1', '2021-12-10 09:29:38', '2021-12-10 10:51:57'),
(9, '7', '4', '1', '2021-12-10 09:29:41', '2021-12-10 10:51:58'),
(10, '7', '8', '0', '2021-12-11 11:56:12', '2021-12-11 19:42:05'),
(11, '7', '10', '1', '2021-12-11 11:56:15', '2021-12-11 11:56:15'),
(12, '7', '17', '1', '2021-12-11 11:56:21', '2021-12-11 13:55:19'),
(13, '7', '18', '0', '2021-12-11 11:56:23', '2021-12-11 12:40:53'),
(14, '7', '23', '1', '2021-12-11 11:56:34', '2021-12-11 11:56:34'),
(15, '7', '15', '1', '2021-12-11 11:56:46', '2021-12-11 11:56:46'),
(16, '8', '7', '1', '2021-12-11 12:18:10', '2021-12-11 12:45:28'),
(17, '8', '11', '1', '2021-12-11 12:18:18', '2021-12-11 12:18:18'),
(18, '8', '14', '1', '2021-12-11 12:18:19', '2021-12-11 12:18:19'),
(19, '8', '17', '1', '2021-12-11 12:18:40', '2021-12-11 12:18:40'),
(20, '8', '18', '1', '2021-12-11 12:18:42', '2021-12-11 12:18:42'),
(21, '10', '8', '1', '2021-12-11 12:20:21', '2021-12-11 12:20:21'),
(22, '10', '11', '1', '2021-12-11 12:20:22', '2021-12-11 12:20:22'),
(23, '10', '14', '1', '2021-12-11 12:20:23', '2021-12-11 12:20:23'),
(24, '10', '16', '1', '2021-12-11 12:20:24', '2021-12-11 12:20:24'),
(25, '10', '18', '1', '2021-12-11 12:20:26', '2021-12-11 12:20:26'),
(26, '11', '7', '1', '2021-12-11 12:20:57', '2021-12-11 12:20:57'),
(27, '11', '9', '1', '2021-12-11 12:20:59', '2021-12-11 12:20:59'),
(28, '11', '14', '1', '2021-12-11 12:21:00', '2021-12-11 12:21:00'),
(29, '11', '16', '1', '2021-12-11 12:21:01', '2021-12-11 12:21:01'),
(30, '11', '17', '1', '2021-12-11 12:21:02', '2021-12-11 12:21:02'),
(31, '14', '7', '1', '2021-12-11 12:22:12', '2021-12-11 12:22:12'),
(32, '14', '9', '1', '2021-12-11 12:22:13', '2021-12-11 12:22:13'),
(33, '14', '11', '1', '2021-12-11 12:22:14', '2021-12-11 12:22:14'),
(34, '14', '10', '1', '2021-12-11 12:22:18', '2021-12-11 12:22:18'),
(35, '15', '7', '1', '2021-12-11 12:22:47', '2021-12-11 12:22:47'),
(36, '15', '10', '1', '2021-12-11 12:22:50', '2021-12-11 12:22:50'),
(37, '15', '9', '1', '2021-12-11 12:22:51', '2021-12-11 12:22:51'),
(38, '15', '14', '1', '2021-12-11 12:22:52', '2021-12-11 12:22:52'),
(39, '15', '17', '1', '2021-12-11 12:22:53', '2021-12-11 12:22:53'),
(40, '16', '7', '1', '2021-12-11 12:23:23', '2021-12-11 12:23:23'),
(41, '16', '9', '1', '2021-12-11 12:23:25', '2021-12-11 12:23:25'),
(42, '16', '10', '1', '2021-12-11 12:23:26', '2021-12-11 12:23:26'),
(43, '16', '11', '1', '2021-12-11 12:23:27', '2021-12-11 12:23:27'),
(44, '16', '15', '1', '2021-12-11 12:23:28', '2021-12-11 12:23:28'),
(45, '17', '7', '1', '2021-12-11 12:23:41', '2021-12-11 12:23:41'),
(46, '17', '9', '1', '2021-12-11 12:23:42', '2021-12-11 12:23:42'),
(47, '17', '11', '0', '2021-12-11 12:23:43', '2021-12-11 12:23:49'),
(48, '17', '15', '0', '2021-12-11 12:23:45', '2021-12-11 12:23:46'),
(49, '18', '7', '1', '2021-12-11 12:25:24', '2021-12-11 12:25:24'),
(50, '18', '10', '1', '2021-12-11 12:25:27', '2021-12-11 12:25:27'),
(51, '23', '7', '1', '2021-12-11 12:27:31', '2021-12-11 12:27:31'),
(52, '7', '14', '1', '2021-12-11 19:34:54', '2021-12-11 19:34:54'),
(53, '7', '11', '1', '2021-12-11 19:35:43', '2021-12-11 19:35:44');

--
-- Indexes for dumped tables
--

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_likes`
--
ALTER TABLE `users_likes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users_chat`
--
ALTER TABLE `users_chat`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_likes`
--
ALTER TABLE `users_likes`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
