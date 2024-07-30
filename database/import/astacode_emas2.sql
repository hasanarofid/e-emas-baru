-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 23, 2024 at 08:34 PM
-- Server version: 10.6.17-MariaDB-cll-lve
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astacode_emas2`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi_t`
--

CREATE TABLE `absensi_t` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `id_create_pegawai` int(11) NOT NULL,
  `status_absen` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `absensi_t`
--

INSERT INTO `absensi_t` (`id`, `employee_id`, `id_toko`, `id_create_pegawai`, `status_absen`, `keterangan`, `tanggal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Hadir', '', '0000-00-00', '2024-05-16 21:21:34', '2024-05-16 21:21:34'),
(2, 6, 1, 2, 'Izin', 'ada keperluan keluarga', '0000-00-00', '2024-05-17 02:57:27', '2024-05-17 02:57:27'),
(3, 7, 1, 2, 'Tidak Hadir', 'tanpa keterangan', '0000-00-00', '2024-05-17 03:00:18', '2024-05-17 03:00:18'),
(4, 1, 1, 2, 'Hadir', '', '0000-00-00', '2024-05-20 19:19:12', '2024-05-20 19:19:12'),
(5, 6, 1, 2, 'Hadir', '', '0000-00-00', '2024-05-20 19:19:20', '2024-05-20 19:19:20'),
(6, 7, 1, 2, 'Hadir', '', '0000-00-00', '2024-05-20 19:19:26', '2024-05-20 19:19:26'),
(7, 1, 1, 2, 'Hadir', '', '0000-00-00', '2024-05-30 09:40:06', '2024-05-30 09:40:06'),
(8, 6, 1, 2, 'Tidak Hadir', 'males', '0000-00-00', '2024-05-30 09:40:22', '2024-05-30 09:40:22'),
(9, 7, 1, 2, 'Izin', 'bala bala', '0000-00-00', '2024-05-30 09:40:37', '2024-05-30 09:40:37'),
(10, 1, 1, 2, 'Hadir', '', '2024-05-31', '2024-06-03 14:05:20', '2024-06-03 14:05:20'),
(11, 6, 1, 2, 'Tidak Hadir', 'sakit', '2024-06-03', '2024-06-03 14:06:24', '2024-06-03 14:06:24'),
(12, 7, 1, 2, 'Izin', 'ada keperluan keluarga', '2024-06-03', '2024-06-03 14:06:41', '2024-06-03 14:06:41'),
(13, 1, 1, 2, 'Tidak Hadir', 'Tidak Ijin', '2024-06-30', '2024-06-30 05:19:30', '2024-06-30 05:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cincin', 'cincin', NULL, NULL),
(2, 1, 'Kalung', 'kalung', NULL, NULL),
(3, 1, 'Anting', 'anting', NULL, NULL),
(5, 1, 'Liontin', 'lionting', NULL, NULL),
(9, 2, 'Gelang Tangan', 'gelang-tangan', '2024-06-30 05:03:35', '2024-06-30 05:03:35');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `uuid`, `user_id`, `name`, `email`, `phone`, `address`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`) VALUES
(1, '603e921d-c9c6-452d-aa73-f165f73c8767', 1, 'Aliza Reinger DVM', 'erath@example.net', '609.792.6379', '2386 Feil Vista\nLake Sophie, IL 30850', NULL, 'Oleta Lesch', '24972180', 'BRI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(2, '0609a1e9-fa56-49a4-84cc-8d52555e031d', 1, 'Mr. Coty Kunde IV', 'phyllis.conn@example.com', '+1 (276) 631-5926', '19476 Dee Plaza\nEast Darryl, OK 59527', NULL, 'Xavier Gutmann', '33503663', 'BNI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(3, '804d869f-ef12-4752-8009-4a5f10fc5296', 1, 'Edmund Jakubowski I', 'paxton.conn@example.com', '+1 (319) 867-7045', '1307 Kirlin Brooks\nNorth Tiffany, KS 45913', NULL, 'Grayce Cremin', '71163330', 'BSI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(4, '9d0b3eb9-a99d-48ac-8de6-340b5d1e410d', 1, 'Kristian Anderson', 'oconnell.domingo@example.net', '+1-757-874-2649', '6357 Deven Rapids\nLake Lenoramouth, NY 76154-5186', NULL, 'Elvie Rau DDS', '32582626', 'BNI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(5, '25844ad7-f280-41d4-9fb6-31800095b63b', 1, 'Angelina Hyatt', 'streich.wendy@example.net', '818.954.9451', '550 Dasia Greens Apt. 002\nEast Alysonville, NM 71476-9435', NULL, 'Ariel Waelchi', '56770047', 'BSI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(6, '69064d2b-44ef-4c63-96a7-83968adf0a87', 1, 'Jakob Okuneva', 'lisandro.fay@example.net', '812.735.2943', '2494 Roderick Stream\nVitoview, OH 26672-1395', NULL, 'Dr. Loren Beatty IV', '84894209', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(7, 'fcb90a3b-f80f-4b0b-a067-64aecedbb31c', 1, 'Emilie Ledner', 'cthompson@example.net', '+17855187164', '93488 Shanie Course\nWest Caseyberg, DC 38872', NULL, 'Kari Schroeder MD', '70063310', 'BCA', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(8, 'fc39c6f6-b238-44bc-9226-ed19be2793bf', 1, 'Felipe Dickinson IV', 'zgraham@example.net', '248.384.4837', '6340 Everardo Flat\nEast Ford, NM 89667-6462', NULL, 'Wyman Gerlach V', '57270678', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(9, 'dbec0aea-42af-4861-9b7b-0d0215d67db1', 1, 'Dr. Sydni Rice', 'glegros@example.net', '(463) 570-0355', '192 Tillman Loop Apt. 940\nCarystad, WI 53178', NULL, 'Mertie Bode DVM', '35659626', 'BRI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(10, '955fc6fe-6dbe-4fc8-8617-e825e373c8fc', 1, 'Franco Torp', 'carroll99@example.org', '+1-936-528-1905', '145 Alexis Rapid Apt. 265\nEffertzshire, VA 53678', NULL, 'Hector Towne', '21925558', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(11, '8a48dd28-ebde-48ed-a589-686a3351af5d', 1, 'Mr. Emmanuel Goyette', 'zking@example.com', '1-678-864-6512', '7552 Buckridge Course\nPort Korbinshire, ND 38216', NULL, 'Jaiden Nitzsche', '89161430', 'BSI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(12, 'b16aff5e-9b97-4e7d-b800-cbb949042d98', 1, 'Mrs. Brionna Terry Sr.', 'vicente.abshire@example.com', '+1-813-251-8729', '250 Sawayn Villages\nPrestonburgh, NE 99047-8284', NULL, 'Prof. Queenie Hoeger', '34838205', 'BSI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(13, '8db2aafa-91ac-49cb-a7d2-d9d75411b2ab', 1, 'Domenic Conroy', 'carmel.schuppe@example.net', '+1-863-659-0889', '91502 Labadie Prairie\nLarkinport, WY 83294-4552', NULL, 'Prof. Destiney Lynch V', '12329313', 'BNI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(14, 'e765f196-8b8a-42e9-b371-9b9df0fd4c7a', 1, 'Willy Torphy III', 'zboncak.danika@example.net', '+14073592143', '5513 Lindgren Harbor Suite 384\nLadariuschester, IL 48905-0447', NULL, 'Mrs. Kelsi Shields', '15275070', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(15, 'd332f417-46e7-48f3-b42c-a3ebfaab9a24', 1, 'Dr. Justice Franecki', 'jorge17@example.org', '1-743-507-4045', '57721 Friesen Cove\nNew Brandyn, VA 30267-6207', NULL, 'Maximillian Leuschke', '56374623', 'BRI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(16, 'f8fa6e6b-f296-4bd8-b1ab-2a58f2704d76', 2, 'customer 1', 'customer1@gmail.com', '08121313', 'jl jakarta', '1798854726070755.png', '12', '13', 'BCA', '2024-05-08 06:31:05', '2024-05-12 06:45:51'),
(17, '3768ce7c-9f53-4b4e-8a3d-df865e9b42c0', 2, 'icems', 'icem@emas.com', '9809003', 'Jl.  Harupat', '1798854696156441.jpeg', '879', '8i7979', 'BCA', '2024-05-10 22:48:10', '2024-05-12 06:45:22'),
(22, '2b5650af-a606-4eae-ab28-7fb1d7de452d', 2, 'ABE', 'abe@gmail.com', '08123468787', 'Jln Abcd Patimura', '1803261625323220.png', '45678911212', '654884840', 'BCA', '2024-06-30 05:11:37', '2024-06-30 05:11:37');

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `tipe_cuti` enum('Tahunan','Besar','Bersama','Hamil','Sakit','Penting') NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `ket` text NOT NULL,
  `status` enum('Disetujui HRD','Ditolak HRD','Disetujui Atasan','Ditolak Atasan','Diproses') NOT NULL,
  `tgl_disetujui_atasan` date DEFAULT NULL,
  `tgl_disetujui_hrd` date DEFAULT NULL,
  `tgl_ditolak_atasan` date DEFAULT NULL,
  `tgl_ditolak_hrd` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nm_divisi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id`, `nm_divisi`, `created_at`, `updated_at`) VALUES
(1, 'Non-Divisi', NULL, NULL),
(2, 'Business Development', NULL, NULL),
(3, 'Finance', NULL, NULL),
(4, 'Technology Officer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_toko` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `no_identitas` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `id_toko`, `user_id`, `name`, `no_identitas`, `address`, `tgl_lahir`, `jabatan`, `foto`, `email`, `phone`, `hire_date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Al-Barra Baihaqi', '3124569823234592', 'Jl. Pahlawan No. 123, Surabaya', '1990-10-10', 'Supervisor', NULL, NULL, NULL, '2020-10-01', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(2, 2, 3, 'Qiana Sybillah', '3124569823234590', 'Jl. Pahlawan No. 123, Jakarta', '1996-10-10', 'Supervisor', NULL, NULL, NULL, '2020-09-02', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(4, 2, NULL, 'Reny Kusnia', '3124569823234581', 'Jl. Semeru No. 12, Depok', '1997-07-02', 'Staff', NULL, NULL, NULL, '2023-10-12', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(6, 1, NULL, 'Abdul Goni', '81213131313131', 'Jl Jawa', '1989-05-20', 'Staf', NULL, NULL, NULL, '2020-03-01', '2024-05-17 02:52:26', '2024-05-17 02:52:26'),
(7, 1, NULL, 'siti munarah', '81291313413', 'jl bandung', '1990-09-08', 'Staf', NULL, NULL, NULL, '2023-05-20', '2024-05-17 02:58:16', '2024-05-17 02:58:16'),
(8, 1, NULL, 'Adi Rizki Yudita', '32756758986786', 'Jl. Tajur Indah no 121 Indihiang kota Tasikmalaya. Dekat razel decoration', '2024-05-31', 'Staf', NULL, NULL, NULL, '2024-05-31', '2024-05-30 21:02:49', '2024-05-30 21:02:49'),
(9, 1, NULL, 'Pegawai 1', '123', 'jln Pattimura', '1990-06-01', 'Staf', NULL, NULL, NULL, '2023-05-08', '2024-06-30 05:02:25', '2024-06-30 05:02:25');

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
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `gaji_pokok` int(10) UNSIGNED DEFAULT NULL,
  `jml_tunjangan` int(10) UNSIGNED DEFAULT NULL,
  `jml_potongan` int(10) UNSIGNED DEFAULT NULL,
  `tot_gaji_diterima` int(10) UNSIGNED DEFAULT NULL,
  `dikirim_tgl` date DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT 0,
  `path` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hakakses_m`
--

CREATE TABLE `hakakses_m` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hakakses_m`
--

INSERT INTO `hakakses_m` (`id`, `user_id`, `role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 15, 3, 1, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(2, 15, 3, 6, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(3, 15, 3, 2, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(4, 15, 3, 19, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(5, 15, 3, 68, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(6, 15, 3, 20, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(7, 15, 3, 72, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(8, 15, 3, 21, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(9, 15, 3, 76, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(10, 15, 3, 22, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(11, 15, 3, 81, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(12, 15, 3, 3, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(13, 15, 3, 23, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(14, 15, 3, 24, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(15, 15, 3, 25, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(16, 15, 3, 26, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(17, 15, 3, 4, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(18, 15, 3, 27, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(19, 15, 3, 28, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(20, 15, 3, 29, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(21, 15, 3, 30, '2024-06-14 06:20:15', '2024-06-14 06:20:15'),
(22, 15, 3, 31, '2024-06-14 06:20:15', '2024-06-14 06:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'icon-home', NULL, NULL),
(2, 'icon-home2', NULL, NULL),
(3, 'icon-home5', NULL, NULL),
(4, 'icon-home7', NULL, NULL),
(5, 'icon-home8', NULL, NULL),
(6, 'icon-home9', NULL, NULL),
(7, 'icon-office', NULL, NULL),
(8, 'icon-city', NULL, NULL),
(9, 'icon-newspaper', NULL, NULL),
(10, 'icon-magazine', NULL, NULL),
(11, 'icon-design', NULL, NULL),
(12, 'icon-pencil', NULL, NULL),
(13, 'icon-pencil3', NULL, NULL),
(14, 'icon-pencil4', NULL, NULL),
(15, 'icon-pencil5', NULL, NULL),
(16, 'icon-pencil6', NULL, NULL),
(17, 'icon-pencil7', NULL, NULL),
(18, 'icon-eraser', NULL, NULL),
(19, 'icon-eraser2', NULL, NULL),
(20, 'icon-eraser3', NULL, NULL),
(21, 'icon-quill2', NULL, NULL),
(22, 'icon-quill4', NULL, NULL),
(23, 'icon-pen', NULL, NULL),
(24, 'icon-pen-plus', NULL, NULL),
(25, 'icon-pen-minus', NULL, NULL),
(26, 'icon-pen2', NULL, NULL),
(27, 'icon-blog', NULL, NULL),
(28, 'icon-pen6', NULL, NULL),
(29, 'icon-brush', NULL, NULL),
(30, 'icon-spray', NULL, NULL),
(31, 'icon-color-sampler', NULL, NULL),
(32, 'icon-toggle', NULL, NULL),
(33, 'icon-bucket', NULL, NULL),
(34, 'icon-gradient', NULL, NULL),
(35, 'icon-eyedropper', NULL, NULL),
(36, 'icon-eyedropper2', NULL, NULL),
(37, 'icon-eyedropper3', NULL, NULL),
(38, 'icon-droplet', NULL, NULL),
(39, 'icon-droplet2', NULL, NULL),
(40, 'icon-color-clear', NULL, NULL),
(41, 'icon-paint-format', NULL, NULL),
(42, 'icon-stamp', NULL, NULL),
(43, 'icon-image2', NULL, NULL),
(44, 'icon-image-compare', NULL, NULL),
(45, 'icon-images2', NULL, NULL),
(46, 'icon-image3', NULL, NULL),
(47, 'icon-images3', NULL, NULL),
(48, 'icon-image4', NULL, NULL),
(49, 'icon-image5', NULL, NULL),
(50, 'icon-camera', NULL, NULL),
(51, 'icon-shutter', NULL, NULL),
(52, 'icon-headphones', NULL, NULL),
(53, 'icon-headset', NULL, NULL),
(54, 'icon-music', NULL, NULL),
(55, 'icon-album', NULL, NULL),
(56, 'icon-tape', NULL, NULL),
(57, 'icon-piano', NULL, NULL),
(58, 'icon-speakers', NULL, NULL),
(59, 'icon-play', NULL, NULL),
(60, 'icon-clapboard-play', NULL, NULL),
(61, 'icon-clapboard', NULL, NULL),
(62, 'icon-media', NULL, NULL),
(63, 'icon-presentation', NULL, NULL),
(64, 'icon-movie', NULL, NULL),
(65, 'icon-film', NULL, NULL),
(66, 'icon-film2', NULL, NULL),
(67, 'icon-film3', NULL, NULL),
(68, 'icon-film4', NULL, NULL),
(69, 'icon-video-camera', NULL, NULL),
(70, 'icon-video-camera2', NULL, NULL),
(71, 'icon-video-camera-slash', NULL, NULL),
(72, 'icon-video-camera3', NULL, NULL),
(73, 'icon-dice', NULL, NULL),
(74, 'icon-chess-king', NULL, NULL),
(75, 'icon-chess-queen', NULL, NULL),
(76, 'icon-chess', NULL, NULL),
(77, 'icon-megaphone', NULL, NULL),
(78, 'icon-new', NULL, NULL),
(79, 'icon-connection', NULL, NULL),
(80, 'icon-station', NULL, NULL),
(81, 'icon-satellite-dish2', NULL, NULL),
(82, 'icon-feed', NULL, NULL),
(83, 'icon-mic2', NULL, NULL),
(84, 'icon-mic-off2', NULL, NULL),
(85, 'icon-book', NULL, NULL),
(86, 'icon-book2', NULL, NULL),
(87, 'icon-book-play', NULL, NULL),
(88, 'icon-book3', NULL, NULL),
(89, 'icon-bookmark', NULL, NULL),
(90, 'icon-books', NULL, NULL),
(91, 'icon-archive', NULL, NULL),
(92, 'icon-reading', NULL, NULL),
(93, 'icon-library2', NULL, NULL),
(94, 'icon-graduation2', NULL, NULL),
(95, 'icon-file-text', NULL, NULL),
(96, 'icon-profile', NULL, NULL),
(97, 'icon-file-empty', NULL, NULL),
(98, 'icon-file-empty2', NULL, NULL),
(99, 'icon-files-empty', NULL, NULL),
(100, 'icon-files-empty2', NULL, NULL),
(101, 'icon-file-plus', NULL, NULL),
(102, 'icon-file-plus2', NULL, NULL),
(103, 'icon-file-minus', NULL, NULL),
(104, 'icon-file-minus2', NULL, NULL),
(105, 'icon-file-download', NULL, NULL),
(106, 'icon-file-download2', NULL, NULL),
(107, 'icon-file-upload', NULL, NULL),
(108, 'icon-file-upload2', NULL, NULL),
(109, 'icon-file-check', NULL, NULL),
(110, 'icon-file-check2', NULL, NULL),
(111, 'icon-file-eye', NULL, NULL),
(112, 'icon-file-eye2', NULL, NULL),
(113, 'icon-file-text2', NULL, NULL),
(114, 'icon-file-text3', NULL, NULL),
(115, 'icon-file-picture', NULL, NULL),
(116, 'icon-file-picture2', NULL, NULL),
(117, 'icon-file-music', NULL, NULL),
(118, 'icon-file-music2', NULL, NULL),
(119, 'icon-file-play', NULL, NULL),
(120, 'icon-file-play2', NULL, NULL),
(121, 'icon-file-video', NULL, NULL),
(122, 'icon-file-video2', NULL, NULL),
(123, 'icon-copy', NULL, NULL),
(124, 'icon-copy2', NULL, NULL),
(125, 'icon-file-zip', NULL, NULL),
(126, 'icon-file-zip2', NULL, NULL),
(127, 'icon-file-xml', NULL, NULL),
(128, 'icon-file-xml2', NULL, NULL),
(129, 'icon-file-css', NULL, NULL),
(130, 'icon-file-css2', NULL, NULL),
(131, 'icon-file-presentation', NULL, NULL),
(132, 'icon-file-presentation2', NULL, NULL),
(133, 'icon-file-stats', NULL, NULL),
(134, 'icon-file-stats2', NULL, NULL),
(135, 'icon-file-locked', NULL, NULL),
(136, 'icon-file-locked2', NULL, NULL),
(137, 'icon-file-spreadsheet', NULL, NULL),
(138, 'icon-file-spreadsheet2', NULL, NULL),
(139, 'icon-copy3', NULL, NULL),
(140, 'icon-copy4', NULL, NULL),
(141, 'icon-paste', NULL, NULL),
(142, 'icon-paste2', NULL, NULL),
(143, 'icon-paste3', NULL, NULL),
(144, 'icon-paste4', NULL, NULL),
(145, 'icon-stack', NULL, NULL),
(146, 'icon-stack2', NULL, NULL),
(147, 'icon-stack3', NULL, NULL),
(148, 'icon-folder', NULL, NULL),
(149, 'icon-folder-search', NULL, NULL),
(150, 'icon-folder-download', NULL, NULL),
(151, 'icon-folder-upload', NULL, NULL),
(152, 'icon-folder-plus', NULL, NULL),
(153, 'icon-folder-plus2', NULL, NULL),
(154, 'icon-folder-minus', NULL, NULL),
(155, 'icon-folder-minus2', NULL, NULL),
(156, 'icon-folder-check', NULL, NULL),
(157, 'icon-folder-heart', NULL, NULL),
(158, 'icon-folder-remove', NULL, NULL),
(159, 'icon-folder2', NULL, NULL),
(160, 'icon-folder-open', NULL, NULL),
(161, 'icon-folder3', NULL, NULL),
(162, 'icon-folder4', NULL, NULL),
(163, 'icon-folder-plus3', NULL, NULL),
(164, 'icon-folder-minus3', NULL, NULL),
(165, 'icon-folder-plus4', NULL, NULL),
(166, 'icon-folder-minus4', NULL, NULL),
(167, 'icon-folder-download2', NULL, NULL),
(168, 'icon-folder-upload2', NULL, NULL),
(169, 'icon-folder-download3', NULL, NULL),
(170, 'icon-folder-upload3', NULL, NULL),
(171, 'icon-folder5', NULL, NULL),
(172, 'icon-folder-open2', NULL, NULL),
(173, 'icon-folder6', NULL, NULL),
(174, 'icon-folder-open3', NULL, NULL),
(175, 'icon-certificate', NULL, NULL),
(176, 'icon-cc', NULL, NULL),
(177, 'icon-price-tag', NULL, NULL),
(178, 'icon-price-tag2', NULL, NULL),
(179, 'icon-price-tags', NULL, NULL),
(180, 'icon-price-tag3', NULL, NULL),
(181, 'icon-price-tags2', NULL, NULL),
(182, 'icon-barcode2', NULL, NULL),
(183, 'icon-qrcode', NULL, NULL),
(184, 'icon-ticket', NULL, NULL),
(185, 'icon-theater', NULL, NULL),
(186, 'icon-store', NULL, NULL),
(187, 'icon-store2', NULL, NULL),
(188, 'icon-cart', NULL, NULL),
(189, 'icon-cart2', NULL, NULL),
(190, 'icon-cart4', NULL, NULL),
(191, 'icon-cart5', NULL, NULL),
(192, 'icon-cart-add', NULL, NULL),
(193, 'icon-cart-add2', NULL, NULL),
(194, 'icon-cart-remove', NULL, NULL),
(195, 'icon-basket', NULL, NULL),
(196, 'icon-bag', NULL, NULL),
(197, 'icon-percent', NULL, NULL),
(198, 'icon-coins', NULL, NULL),
(199, 'icon-coin-dollar', NULL, NULL),
(200, 'icon-coin-euro', NULL, NULL),
(201, 'icon-coin-pound', NULL, NULL),
(202, 'icon-coin-yen', NULL, NULL),
(203, 'icon-piggy-bank', NULL, NULL),
(204, 'icon-wallet', NULL, NULL),
(205, 'icon-cash', NULL, NULL),
(206, 'icon-cash2', NULL, NULL),
(207, 'icon-cash3', NULL, NULL),
(208, 'icon-cash4', NULL, NULL),
(209, 'icon-credit-card', NULL, NULL),
(210, 'icon-credit-card2', NULL, NULL),
(211, 'icon-calculator4', NULL, NULL),
(212, 'icon-calculator2', NULL, NULL),
(213, 'icon-calculator3', NULL, NULL),
(214, 'icon-chip', NULL, NULL),
(215, 'icon-lifebuoy', NULL, NULL),
(216, 'icon-phone', NULL, NULL),
(217, 'icon-phone2', NULL, NULL),
(218, 'icon-phone-slash', NULL, NULL),
(219, 'icon-phone-wave', NULL, NULL),
(220, 'icon-phone-plus', NULL, NULL),
(221, 'icon-phone-minus', NULL, NULL),
(222, 'icon-phone-plus2', NULL, NULL),
(223, 'icon-phone-minus2', NULL, NULL),
(224, 'icon-phone-incoming', NULL, NULL),
(225, 'icon-phone-outgoing', NULL, NULL),
(226, 'icon-phone-hang-up', NULL, NULL),
(227, 'icon-address-book', NULL, NULL),
(228, 'icon-address-book2', NULL, NULL),
(229, 'icon-address-book3', NULL, NULL),
(230, 'icon-notebook', NULL, NULL),
(231, 'icon-envelop', NULL, NULL),
(232, 'icon-envelop2', NULL, NULL),
(233, 'icon-envelop3', NULL, NULL),
(234, 'icon-envelop4', NULL, NULL),
(235, 'icon-envelop5', NULL, NULL),
(236, 'icon-mailbox', NULL, NULL),
(237, 'icon-pushpin', NULL, NULL),
(238, 'icon-location3', NULL, NULL),
(239, 'icon-location4', NULL, NULL),
(240, 'icon-compass4', NULL, NULL),
(241, 'icon-map', NULL, NULL),
(242, 'icon-map4', NULL, NULL),
(243, 'icon-map5', NULL, NULL),
(244, 'icon-direction', NULL, NULL),
(245, 'icon-reset', NULL, NULL),
(246, 'icon-history', NULL, NULL),
(247, 'icon-watch', NULL, NULL),
(248, 'icon-watch2', NULL, NULL),
(249, 'icon-alarm', NULL, NULL),
(250, 'icon-alarm-add', NULL, NULL),
(251, 'icon-alarm-check', NULL, NULL),
(252, 'icon-alarm-cancel', NULL, NULL),
(253, 'icon-bell2', NULL, NULL),
(254, 'icon-bell3', NULL, NULL),
(255, 'icon-bell-plus', NULL, NULL),
(256, 'icon-bell-minus', NULL, NULL),
(257, 'icon-bell-check', NULL, NULL),
(258, 'icon-bell-cross', NULL, NULL),
(259, 'icon-calendar', NULL, NULL),
(260, 'icon-calendar2', NULL, NULL),
(261, 'icon-calendar3', NULL, NULL),
(262, 'icon-calendar52', NULL, NULL),
(263, 'icon-printer', NULL, NULL),
(264, 'icon-printer2', NULL, NULL),
(265, 'icon-printer4', NULL, NULL),
(266, 'icon-shredder', NULL, NULL),
(267, 'icon-mouse', NULL, NULL),
(268, 'icon-mouse-left', NULL, NULL),
(269, 'icon-mouse-right', NULL, NULL),
(270, 'icon-keyboard', NULL, NULL),
(271, 'icon-typewriter', NULL, NULL),
(272, 'icon-display', NULL, NULL),
(273, 'icon-display4', NULL, NULL),
(274, 'icon-laptop', NULL, NULL),
(275, 'icon-mobile', NULL, NULL),
(276, 'icon-mobile2', NULL, NULL),
(277, 'icon-tablet', NULL, NULL),
(278, 'icon-mobile3', NULL, NULL),
(279, 'icon-tv', NULL, NULL),
(280, 'icon-radio', NULL, NULL),
(281, 'icon-cabinet', NULL, NULL),
(282, 'icon-drawer', NULL, NULL),
(283, 'icon-drawer2', NULL, NULL),
(284, 'icon-drawer-out', NULL, NULL),
(285, 'icon-drawer-in', NULL, NULL),
(286, 'icon-drawer3', NULL, NULL),
(287, 'icon-box', NULL, NULL),
(288, 'icon-box-add', NULL, NULL),
(289, 'icon-box-remove', NULL, NULL),
(290, 'icon-download', NULL, NULL),
(291, 'icon-upload', NULL, NULL),
(292, 'icon-floppy-disk', NULL, NULL),
(293, 'icon-floppy-disks', NULL, NULL),
(294, 'icon-usb-stick', NULL, NULL),
(295, 'icon-drive', NULL, NULL),
(296, 'icon-server', NULL, NULL),
(297, 'icon-database', NULL, NULL),
(298, 'icon-database2', NULL, NULL),
(299, 'icon-database4', NULL, NULL),
(300, 'icon-database-menu', NULL, NULL),
(301, 'icon-database-add', NULL, NULL),
(302, 'icon-database-remove', NULL, NULL),
(303, 'icon-database-insert', NULL, NULL),
(304, 'icon-database-export', NULL, NULL),
(305, 'icon-database-upload', NULL, NULL),
(306, 'icon-database-refresh', NULL, NULL),
(307, 'icon-database-diff', NULL, NULL),
(308, 'icon-database-edit2', NULL, NULL),
(309, 'icon-database-check', NULL, NULL),
(310, 'icon-database-arrow', NULL, NULL),
(311, 'icon-database-time2', NULL, NULL),
(312, 'icon-undo', NULL, NULL),
(313, 'icon-redo', NULL, NULL),
(314, 'icon-rotate-ccw', NULL, NULL),
(315, 'icon-rotate-cw', NULL, NULL),
(316, 'icon-rotate-ccw2', NULL, NULL),
(317, 'icon-rotate-cw2', NULL, NULL),
(318, 'icon-rotate-ccw3', NULL, NULL),
(319, 'icon-rotate-cw3', NULL, NULL),
(320, 'icon-flip-vertical2', NULL, NULL),
(321, 'icon-flip-horizontal2', NULL, NULL),
(322, 'icon-flip-vertical3', NULL, NULL),
(323, 'icon-flip-vertical4', NULL, NULL),
(324, 'icon-angle', NULL, NULL),
(325, 'icon-shear', NULL, NULL),
(326, 'icon-align-left', NULL, NULL),
(327, 'icon-align-center-horizontal', NULL, NULL),
(328, 'icon-align-right', NULL, NULL),
(329, 'icon-align-top', NULL, NULL),
(330, 'icon-align-center-vertical', NULL, NULL),
(331, 'icon-align-bottom', NULL, NULL),
(332, 'icon-undo2', NULL, NULL),
(333, 'icon-redo2', NULL, NULL),
(334, 'icon-forward', NULL, NULL),
(335, 'icon-reply', NULL, NULL),
(336, 'icon-reply-all', NULL, NULL),
(337, 'icon-bubble', NULL, NULL),
(338, 'icon-bubbles', NULL, NULL),
(339, 'icon-bubbles2', NULL, NULL),
(340, 'icon-bubble2', NULL, NULL),
(341, 'icon-bubbles3', NULL, NULL),
(342, 'icon-bubbles4', NULL, NULL),
(343, 'icon-bubble-notification', NULL, NULL),
(344, 'icon-bubbles5', NULL, NULL),
(345, 'icon-bubbles6', NULL, NULL),
(346, 'icon-bubble6', NULL, NULL),
(347, 'icon-bubbles7', NULL, NULL),
(348, 'icon-bubble7', NULL, NULL),
(349, 'icon-bubbles8', NULL, NULL),
(350, 'icon-bubble8', NULL, NULL),
(351, 'icon-bubble-dots3', NULL, NULL),
(352, 'icon-bubble-lines3', NULL, NULL),
(353, 'icon-bubble9', NULL, NULL),
(354, 'icon-bubble-dots4', NULL, NULL),
(355, 'icon-bubble-lines4', NULL, NULL),
(356, 'icon-bubbles9', NULL, NULL),
(357, 'icon-bubbles10', NULL, NULL),
(358, 'icon-user', NULL, NULL),
(359, 'icon-users', NULL, NULL),
(360, 'icon-user-plus', NULL, NULL),
(361, 'icon-user-minus', NULL, NULL),
(362, 'icon-user-cancel', NULL, NULL),
(363, 'icon-user-block', NULL, NULL),
(364, 'icon-user-lock', NULL, NULL),
(365, 'icon-user-check', NULL, NULL),
(366, 'icon-users2', NULL, NULL),
(367, 'icon-users4', NULL, NULL),
(368, 'icon-user-tie', NULL, NULL),
(369, 'icon-collaboration', NULL, NULL),
(370, 'icon-vcard', NULL, NULL),
(371, 'icon-hat', NULL, NULL),
(372, 'icon-bowtie', NULL, NULL),
(373, 'icon-quotes-left', NULL, NULL),
(374, 'icon-quotes-right', NULL, NULL),
(375, 'icon-quotes-left2', NULL, NULL),
(376, 'icon-quotes-right2', NULL, NULL),
(377, 'icon-hour-glass', NULL, NULL),
(378, 'icon-hour-glass2', NULL, NULL),
(379, 'icon-hour-glass3', NULL, NULL),
(380, 'icon-spinner', NULL, NULL),
(381, 'icon-spinner2', NULL, NULL),
(382, 'icon-spinner3', NULL, NULL),
(383, 'icon-spinner4', NULL, NULL),
(384, 'icon-spinner6', NULL, NULL),
(385, 'icon-spinner9', NULL, NULL),
(386, 'icon-spinner10', NULL, NULL),
(387, 'icon-spinner11', NULL, NULL),
(388, 'icon-microscope', NULL, NULL),
(389, 'icon-enlarge', NULL, NULL),
(390, 'icon-shrink', NULL, NULL),
(391, 'icon-enlarge3', NULL, NULL),
(392, 'icon-shrink3', NULL, NULL),
(393, 'icon-enlarge5', NULL, NULL),
(394, 'icon-shrink5', NULL, NULL),
(395, 'icon-enlarge6', NULL, NULL),
(396, 'icon-shrink6', NULL, NULL),
(397, 'icon-enlarge7', NULL, NULL),
(398, 'icon-shrink7', NULL, NULL),
(399, 'icon-key', NULL, NULL),
(400, 'icon-lock', NULL, NULL),
(401, 'icon-lock2', NULL, NULL),
(402, 'icon-lock4', NULL, NULL),
(403, 'icon-unlocked', NULL, NULL),
(404, 'icon-lock5', NULL, NULL),
(405, 'icon-unlocked2', NULL, NULL),
(406, 'icon-safe', NULL, NULL),
(407, 'icon-wrench', NULL, NULL),
(408, 'icon-wrench2', NULL, NULL),
(409, 'icon-wrench3', NULL, NULL),
(410, 'icon-equalizer', NULL, NULL),
(411, 'icon-equalizer2', NULL, NULL),
(412, 'icon-equalizer3', NULL, NULL),
(413, 'icon-equalizer4', NULL, NULL),
(414, 'icon-cog', NULL, NULL),
(415, 'icon-cogs', NULL, NULL),
(416, 'icon-cog2', NULL, NULL),
(417, 'icon-cog3', NULL, NULL),
(418, 'icon-cog4', NULL, NULL),
(419, 'icon-cog52', NULL, NULL),
(420, 'icon-cog6', NULL, NULL),
(421, 'icon-cog7', NULL, NULL),
(422, 'icon-hammer', NULL, NULL),
(423, 'icon-hammer-wrench', NULL, NULL),
(424, 'icon-magic-wand', NULL, NULL),
(425, 'icon-magic-wand2', NULL, NULL),
(426, 'icon-pulse2', NULL, NULL),
(427, 'icon-aid-kit', NULL, NULL),
(428, 'icon-bug2', NULL, NULL),
(429, 'icon-construction', NULL, NULL),
(430, 'icon-traffic-cone', NULL, NULL),
(431, 'icon-traffic-lights', NULL, NULL),
(432, 'icon-pie-chart', NULL, NULL),
(433, 'icon-pie-chart2', NULL, NULL),
(434, 'icon-pie-chart3', NULL, NULL),
(435, 'icon-pie-chart4', NULL, NULL),
(436, 'icon-pie-chart5', NULL, NULL),
(437, 'icon-pie-chart6', NULL, NULL),
(438, 'icon-pie-chart7', NULL, NULL),
(439, 'icon-stats-dots', NULL, NULL),
(440, 'icon-stats-bars', NULL, NULL),
(441, 'icon-pie-chart8', NULL, NULL),
(442, 'icon-stats-bars2', NULL, NULL),
(443, 'icon-stats-bars3', NULL, NULL),
(444, 'icon-stats-bars4', NULL, NULL),
(445, 'icon-chart', NULL, NULL),
(446, 'icon-stats-growth', NULL, NULL),
(447, 'icon-stats-decline', NULL, NULL),
(448, 'icon-stats-growth2', NULL, NULL),
(449, 'icon-stats-decline2', NULL, NULL),
(450, 'icon-stairs-up', NULL, NULL),
(451, 'icon-stairs-down', NULL, NULL),
(452, 'icon-stairs', NULL, NULL),
(453, 'icon-ladder', NULL, NULL),
(454, 'icon-rating', NULL, NULL),
(455, 'icon-rating2', NULL, NULL),
(456, 'icon-rating3', NULL, NULL),
(457, 'icon-podium', NULL, NULL),
(458, 'icon-stars', NULL, NULL),
(459, 'icon-medal-star', NULL, NULL),
(460, 'icon-medal', NULL, NULL),
(461, 'icon-medal2', NULL, NULL),
(462, 'icon-medal-first', NULL, NULL),
(463, 'icon-medal-second', NULL, NULL),
(464, 'icon-medal-third', NULL, NULL),
(465, 'icon-crown', NULL, NULL),
(466, 'icon-trophy2', NULL, NULL),
(467, 'icon-trophy3', NULL, NULL),
(468, 'icon-diamond', NULL, NULL),
(469, 'icon-trophy4', NULL, NULL),
(470, 'icon-gift', NULL, NULL),
(471, 'icon-pipe', NULL, NULL),
(472, 'icon-mustache', NULL, NULL),
(473, 'icon-cup2', NULL, NULL),
(474, 'icon-coffee', NULL, NULL),
(475, 'icon-paw', NULL, NULL),
(476, 'icon-footprint', NULL, NULL),
(477, 'icon-rocket', NULL, NULL),
(478, 'icon-meter2', NULL, NULL),
(479, 'icon-meter-slow', NULL, NULL),
(480, 'icon-meter-fast', NULL, NULL),
(481, 'icon-hammer2', NULL, NULL),
(482, 'icon-balance', NULL, NULL),
(483, 'icon-fire', NULL, NULL),
(484, 'icon-fire2', NULL, NULL),
(485, 'icon-lab', NULL, NULL),
(486, 'icon-atom', NULL, NULL),
(487, 'icon-atom2', NULL, NULL),
(488, 'icon-bin', NULL, NULL),
(489, 'icon-bin2', NULL, NULL),
(490, 'icon-briefcase', NULL, NULL),
(491, 'icon-briefcase3', NULL, NULL),
(492, 'icon-airplane2', NULL, NULL),
(493, 'icon-airplane3', NULL, NULL),
(494, 'icon-airplane4', NULL, NULL),
(495, 'icon-paperplane', NULL, NULL),
(496, 'icon-car', NULL, NULL),
(497, 'icon-steering-wheel', NULL, NULL),
(498, 'icon-car2', NULL, NULL),
(499, 'icon-gas', NULL, NULL),
(500, 'icon-bus', NULL, NULL),
(501, 'icon-truck', NULL, NULL),
(502, 'icon-bike', NULL, NULL),
(503, 'icon-road', NULL, NULL),
(504, 'icon-train', NULL, NULL),
(505, 'icon-train2', NULL, NULL),
(506, 'icon-ship', NULL, NULL),
(507, 'icon-boat', NULL, NULL),
(508, 'icon-chopper', NULL, NULL),
(509, 'icon-cube', NULL, NULL),
(510, 'icon-cube2', NULL, NULL),
(511, 'icon-cube3', NULL, NULL),
(512, 'icon-cube4', NULL, NULL),
(513, 'icon-pyramid', NULL, NULL),
(514, 'icon-pyramid2', NULL, NULL),
(515, 'icon-package', NULL, NULL),
(516, 'icon-puzzle', NULL, NULL),
(517, 'icon-puzzle2', NULL, NULL),
(518, 'icon-puzzle3', NULL, NULL),
(519, 'icon-puzzle4', NULL, NULL),
(520, 'icon-glasses-3d2', NULL, NULL),
(521, 'icon-brain', NULL, NULL),
(522, 'icon-accessibility', NULL, NULL),
(523, 'icon-accessibility2', NULL, NULL),
(524, 'icon-strategy', NULL, NULL),
(525, 'icon-target', NULL, NULL),
(526, 'icon-target2', NULL, NULL),
(527, 'icon-shield-check', NULL, NULL),
(528, 'icon-shield-notice', NULL, NULL),
(529, 'icon-shield2', NULL, NULL),
(530, 'icon-racing', NULL, NULL),
(531, 'icon-finish', NULL, NULL),
(532, 'icon-power2', NULL, NULL),
(533, 'icon-power3', NULL, NULL),
(534, 'icon-switch', NULL, NULL),
(535, 'icon-switch22', NULL, NULL),
(536, 'icon-power-cord', NULL, NULL),
(537, 'icon-clipboard', NULL, NULL),
(538, 'icon-clipboard2', NULL, NULL),
(539, 'icon-clipboard3', NULL, NULL),
(540, 'icon-clipboard4', NULL, NULL),
(541, 'icon-clipboard5', NULL, NULL),
(542, 'icon-clipboard6', NULL, NULL),
(543, 'icon-playlist', NULL, NULL),
(544, 'icon-playlist-add', NULL, NULL),
(545, 'icon-list-numbered', NULL, NULL),
(546, 'icon-list', NULL, NULL),
(547, 'icon-list2', NULL, NULL),
(548, 'icon-more', NULL, NULL),
(549, 'icon-more2', NULL, NULL),
(550, 'icon-grid', NULL, NULL),
(551, 'icon-grid2', NULL, NULL),
(552, 'icon-grid3', NULL, NULL),
(553, 'icon-grid4', NULL, NULL),
(554, 'icon-grid52', NULL, NULL),
(555, 'icon-grid6', NULL, NULL),
(556, 'icon-grid7', NULL, NULL),
(557, 'icon-tree5', NULL, NULL),
(558, 'icon-tree6', NULL, NULL),
(559, 'icon-tree7', NULL, NULL),
(560, 'icon-lan', NULL, NULL),
(561, 'icon-lan2', NULL, NULL),
(562, 'icon-lan3', NULL, NULL),
(563, 'icon-menu', NULL, NULL),
(564, 'icon-circle-small', NULL, NULL),
(565, 'icon-menu2', NULL, NULL),
(566, 'icon-menu3', NULL, NULL),
(567, 'icon-menu4', NULL, NULL),
(568, 'icon-menu5', NULL, NULL),
(569, 'icon-menu62', NULL, NULL),
(570, 'icon-menu7', NULL, NULL),
(571, 'icon-menu8', NULL, NULL),
(572, 'icon-menu9', NULL, NULL),
(573, 'icon-menu10', NULL, NULL),
(574, 'icon-cloud', NULL, NULL),
(575, 'icon-cloud-download', NULL, NULL),
(576, 'icon-cloud-upload', NULL, NULL),
(577, 'icon-cloud-check', NULL, NULL),
(578, 'icon-cloud2', NULL, NULL),
(579, 'icon-cloud-download2', NULL, NULL),
(580, 'icon-cloud-upload2', NULL, NULL),
(581, 'icon-cloud-check2', NULL, NULL),
(582, 'icon-import', NULL, NULL),
(583, 'icon-download4', NULL, NULL),
(584, 'icon-upload4', NULL, NULL),
(585, 'icon-download7', NULL, NULL),
(586, 'icon-upload7', NULL, NULL),
(587, 'icon-download10', NULL, NULL),
(588, 'icon-upload10', NULL, NULL),
(589, 'icon-sphere', NULL, NULL),
(590, 'icon-sphere3', NULL, NULL),
(591, 'icon-earth', NULL, NULL),
(592, 'icon-link', NULL, NULL),
(593, 'icon-unlink', NULL, NULL),
(594, 'icon-link2', NULL, NULL),
(595, 'icon-unlink2', NULL, NULL),
(596, 'icon-anchor', NULL, NULL),
(597, 'icon-flag3', NULL, NULL),
(598, 'icon-flag4', NULL, NULL),
(599, 'icon-flag7', NULL, NULL),
(600, 'icon-flag8', NULL, NULL),
(601, 'icon-attachment', NULL, NULL),
(602, 'icon-attachment2', NULL, NULL),
(603, 'icon-eye', NULL, NULL),
(604, 'icon-eye-plus', NULL, NULL),
(605, 'icon-eye-minus', NULL, NULL),
(606, 'icon-eye-blocked', NULL, NULL),
(607, 'icon-eye2', NULL, NULL),
(608, 'icon-eye-blocked2', NULL, NULL),
(609, 'icon-eye4', NULL, NULL),
(610, 'icon-bookmark2', NULL, NULL),
(611, 'icon-bookmark3', NULL, NULL),
(612, 'icon-bookmarks', NULL, NULL),
(613, 'icon-bookmark4', NULL, NULL),
(614, 'icon-spotlight2', NULL, NULL),
(615, 'icon-starburst', NULL, NULL),
(616, 'icon-snowflake', NULL, NULL),
(617, 'icon-weather-windy', NULL, NULL),
(618, 'icon-fan', NULL, NULL),
(619, 'icon-umbrella', NULL, NULL),
(620, 'icon-sun3', NULL, NULL),
(621, 'icon-contrast', NULL, NULL),
(622, 'icon-bed2', NULL, NULL),
(623, 'icon-furniture', NULL, NULL),
(624, 'icon-chair', NULL, NULL),
(625, 'icon-star-empty3', NULL, NULL),
(626, 'icon-star-half', NULL, NULL),
(627, 'icon-star-full2', NULL, NULL),
(628, 'icon-heart5', NULL, NULL),
(629, 'icon-heart6', NULL, NULL),
(630, 'icon-heart-broken2', NULL, NULL),
(631, 'icon-thumbs-up2', NULL, NULL),
(632, 'icon-thumbs-down2', NULL, NULL),
(633, 'icon-thumbs-up3', NULL, NULL),
(634, 'icon-thumbs-down3', NULL, NULL),
(635, 'icon-height', NULL, NULL),
(636, 'icon-man', NULL, NULL),
(637, 'icon-woman', NULL, NULL),
(638, 'icon-man-woman', NULL, NULL),
(639, 'icon-yin-yang', NULL, NULL),
(640, 'icon-cursor', NULL, NULL),
(641, 'icon-cursor2', NULL, NULL),
(642, 'icon-lasso2', NULL, NULL),
(643, 'icon-select2', NULL, NULL),
(644, 'icon-point-up', NULL, NULL),
(645, 'icon-point-right', NULL, NULL),
(646, 'icon-point-down', NULL, NULL),
(647, 'icon-point-left', NULL, NULL),
(648, 'icon-pointer', NULL, NULL),
(649, 'icon-reminder', NULL, NULL),
(650, 'icon-drag-left-right', NULL, NULL),
(651, 'icon-drag-left', NULL, NULL),
(652, 'icon-drag-right', NULL, NULL),
(653, 'icon-touch', NULL, NULL),
(654, 'icon-multitouch', NULL, NULL),
(655, 'icon-touch-zoom', NULL, NULL),
(656, 'icon-touch-pinch', NULL, NULL),
(657, 'icon-hand', NULL, NULL),
(658, 'icon-grab', NULL, NULL),
(659, 'icon-stack-empty', NULL, NULL),
(660, 'icon-stack-plus', NULL, NULL),
(661, 'icon-stack-minus', NULL, NULL),
(662, 'icon-stack-star', NULL, NULL),
(663, 'icon-stack-picture', NULL, NULL),
(664, 'icon-stack-down', NULL, NULL),
(665, 'icon-stack-up', NULL, NULL),
(666, 'icon-stack-cancel', NULL, NULL),
(667, 'icon-stack-check', NULL, NULL),
(668, 'icon-stack-text', NULL, NULL),
(669, 'icon-stack4', NULL, NULL),
(670, 'icon-stack-music', NULL, NULL),
(671, 'icon-stack-play', NULL, NULL),
(672, 'icon-move', NULL, NULL),
(673, 'icon-dots', NULL, NULL),
(674, 'icon-warning', NULL, NULL),
(675, 'icon-warning22', NULL, NULL),
(676, 'icon-notification2', NULL, NULL),
(677, 'icon-question3', NULL, NULL),
(678, 'icon-question4', NULL, NULL),
(679, 'icon-plus3', NULL, NULL),
(680, 'icon-minus3', NULL, NULL),
(681, 'icon-plus-circle2', NULL, NULL),
(682, 'icon-minus-circle2', NULL, NULL),
(683, 'icon-cancel-circle2', NULL, NULL),
(684, 'icon-blocked', NULL, NULL),
(685, 'icon-cancel-square', NULL, NULL),
(686, 'icon-cancel-square2', NULL, NULL),
(687, 'icon-spam', NULL, NULL),
(688, 'icon-cross2', NULL, NULL),
(689, 'icon-cross3', NULL, NULL),
(690, 'icon-checkmark', NULL, NULL),
(691, 'icon-checkmark3', NULL, NULL),
(692, 'icon-checkmark2', NULL, NULL),
(693, 'icon-checkmark4', NULL, NULL),
(694, 'icon-spell-check', NULL, NULL),
(695, 'icon-spell-check2', NULL, NULL),
(696, 'icon-enter', NULL, NULL),
(697, 'icon-exit', NULL, NULL),
(698, 'icon-enter2', NULL, NULL),
(699, 'icon-exit2', NULL, NULL),
(700, 'icon-enter3', NULL, NULL),
(701, 'icon-exit3', NULL, NULL),
(702, 'icon-wall', NULL, NULL),
(703, 'icon-fence', NULL, NULL),
(704, 'icon-play3', NULL, NULL),
(705, 'icon-pause', NULL, NULL),
(706, 'icon-stop', NULL, NULL),
(707, 'icon-previous', NULL, NULL),
(708, 'icon-next', NULL, NULL),
(709, 'icon-backward', NULL, NULL),
(710, 'icon-forward2', NULL, NULL),
(711, 'icon-play4', NULL, NULL),
(712, 'icon-pause2', NULL, NULL),
(713, 'icon-stop2', NULL, NULL),
(714, 'icon-backward2', NULL, NULL),
(715, 'icon-forward3', NULL, NULL),
(716, 'icon-first', NULL, NULL),
(717, 'icon-last', NULL, NULL),
(718, 'icon-previous2', NULL, NULL),
(719, 'icon-next2', NULL, NULL),
(720, 'icon-eject', NULL, NULL),
(721, 'icon-volume-high', NULL, NULL),
(722, 'icon-volume-medium', NULL, NULL),
(723, 'icon-volume-low', NULL, NULL),
(724, 'icon-volume-mute', NULL, NULL),
(725, 'icon-speaker-left', NULL, NULL),
(726, 'icon-speaker-right', NULL, NULL),
(727, 'icon-volume-mute2', NULL, NULL),
(728, 'icon-volume-increase', NULL, NULL),
(729, 'icon-volume-decrease', NULL, NULL),
(730, 'icon-volume-mute5', NULL, NULL),
(731, 'icon-loop', NULL, NULL),
(732, 'icon-loop3', NULL, NULL),
(733, 'icon-infinite-square', NULL, NULL),
(734, 'icon-infinite', NULL, NULL),
(735, 'icon-loop4', NULL, NULL),
(736, 'icon-shuffle', NULL, NULL),
(737, 'icon-wave', NULL, NULL),
(738, 'icon-wave2', NULL, NULL),
(739, 'icon-split', NULL, NULL),
(740, 'icon-merge', NULL, NULL),
(741, 'icon-arrow-up5', NULL, NULL),
(742, 'icon-arrow-right5', NULL, NULL),
(743, 'icon-arrow-down5', NULL, NULL),
(744, 'icon-arrow-left5', NULL, NULL),
(745, 'icon-arrow-up-left2', NULL, NULL),
(746, 'icon-arrow-up7', NULL, NULL),
(747, 'icon-arrow-up-right2', NULL, NULL),
(748, 'icon-arrow-right7', NULL, NULL),
(749, 'icon-arrow-down-right2', NULL, NULL),
(750, 'icon-arrow-down7', NULL, NULL),
(751, 'icon-arrow-down-left2', NULL, NULL),
(752, 'icon-arrow-left7', NULL, NULL),
(753, 'icon-arrow-up-left3', NULL, NULL),
(754, 'icon-arrow-up8', NULL, NULL),
(755, 'icon-arrow-up-right3', NULL, NULL),
(756, 'icon-arrow-right8', NULL, NULL),
(757, 'icon-arrow-down-right3', NULL, NULL),
(758, 'icon-arrow-down8', NULL, NULL),
(759, 'icon-arrow-down-left3', NULL, NULL),
(760, 'icon-arrow-left8', NULL, NULL),
(761, 'icon-circle-up2', NULL, NULL),
(762, 'icon-circle-right2', NULL, NULL),
(763, 'icon-circle-down2', NULL, NULL),
(764, 'icon-circle-left2', NULL, NULL),
(765, 'icon-arrow-resize7', NULL, NULL),
(766, 'icon-arrow-resize8', NULL, NULL),
(767, 'icon-square-up-left', NULL, NULL),
(768, 'icon-square-up', NULL, NULL),
(769, 'icon-square-up-right', NULL, NULL),
(770, 'icon-square-right', NULL, NULL),
(771, 'icon-square-down-right', NULL, NULL),
(772, 'icon-square-down', NULL, NULL),
(773, 'icon-square-down-left', NULL, NULL),
(774, 'icon-square-left', NULL, NULL),
(775, 'icon-arrow-up15', NULL, NULL),
(776, 'icon-arrow-right15', NULL, NULL),
(777, 'icon-arrow-down15', NULL, NULL),
(778, 'icon-arrow-left15', NULL, NULL),
(779, 'icon-arrow-up16', NULL, NULL),
(780, 'icon-arrow-right16', NULL, NULL),
(781, 'icon-arrow-down16', NULL, NULL),
(782, 'icon-arrow-left16', NULL, NULL),
(783, 'icon-menu-open', NULL, NULL),
(784, 'icon-menu-open2', NULL, NULL),
(785, 'icon-menu-close', NULL, NULL),
(786, 'icon-menu-close2', NULL, NULL),
(787, 'icon-enter5', NULL, NULL),
(788, 'icon-esc', NULL, NULL),
(789, 'icon-enter6', NULL, NULL),
(790, 'icon-backspace', NULL, NULL),
(791, 'icon-backspace2', NULL, NULL),
(792, 'icon-tab', NULL, NULL),
(793, 'icon-transmission', NULL, NULL),
(794, 'icon-sort', NULL, NULL),
(795, 'icon-move-up2', NULL, NULL),
(796, 'icon-move-down2', NULL, NULL),
(797, 'icon-sort-alpha-asc', NULL, NULL),
(798, 'icon-sort-alpha-desc', NULL, NULL),
(799, 'icon-sort-numeric-asc', NULL, NULL),
(800, 'icon-sort-numberic-desc', NULL, NULL),
(801, 'icon-sort-amount-asc', NULL, NULL),
(802, 'icon-sort-amount-desc', NULL, NULL),
(803, 'icon-sort-time-asc', NULL, NULL),
(804, 'icon-sort-time-desc', NULL, NULL),
(805, 'icon-battery-6', NULL, NULL),
(806, 'icon-battery-0', NULL, NULL),
(807, 'icon-battery-charging', NULL, NULL),
(808, 'icon-command', NULL, NULL),
(809, 'icon-shift', NULL, NULL),
(810, 'icon-ctrl', NULL, NULL),
(811, 'icon-opt', NULL, NULL),
(812, 'icon-checkbox-checked', NULL, NULL),
(813, 'icon-checkbox-unchecked', NULL, NULL),
(814, 'icon-checkbox-partial', NULL, NULL),
(815, 'icon-square', NULL, NULL),
(816, 'icon-triangle', NULL, NULL),
(817, 'icon-triangle2', NULL, NULL),
(818, 'icon-diamond3', NULL, NULL),
(819, 'icon-diamond4', NULL, NULL),
(820, 'icon-checkbox-checked2', NULL, NULL),
(821, 'icon-checkbox-unchecked2', NULL, NULL),
(822, 'icon-checkbox-partial2', NULL, NULL),
(823, 'icon-radio-checked', NULL, NULL),
(824, 'icon-radio-checked2', NULL, NULL),
(825, 'icon-radio-unchecked', NULL, NULL),
(826, 'icon-checkmark-circle', NULL, NULL),
(827, 'icon-circle', NULL, NULL),
(828, 'icon-circle2', NULL, NULL),
(829, 'icon-circles', NULL, NULL),
(830, 'icon-circles2', NULL, NULL),
(831, 'icon-crop', NULL, NULL),
(832, 'icon-crop2', NULL, NULL),
(833, 'icon-make-group', NULL, NULL),
(834, 'icon-ungroup', NULL, NULL),
(835, 'icon-vector', NULL, NULL),
(836, 'icon-vector2', NULL, NULL),
(837, 'icon-rulers', NULL, NULL),
(838, 'icon-pencil-ruler', NULL, NULL),
(839, 'icon-scissors', NULL, NULL),
(840, 'icon-filter3', NULL, NULL),
(841, 'icon-filter4', NULL, NULL),
(842, 'icon-font', NULL, NULL),
(843, 'icon-ampersand2', NULL, NULL),
(844, 'icon-ligature', NULL, NULL),
(845, 'icon-font-size', NULL, NULL),
(846, 'icon-typography', NULL, NULL),
(847, 'icon-text-height', NULL, NULL),
(848, 'icon-text-width', NULL, NULL),
(849, 'icon-height2', NULL, NULL),
(850, 'icon-width', NULL, NULL),
(851, 'icon-strikethrough2', NULL, NULL),
(852, 'icon-font-size2', NULL, NULL),
(853, 'icon-bold2', NULL, NULL),
(854, 'icon-underline2', NULL, NULL),
(855, 'icon-italic2', NULL, NULL),
(856, 'icon-strikethrough3', NULL, NULL),
(857, 'icon-omega', NULL, NULL),
(858, 'icon-sigma', NULL, NULL),
(859, 'icon-nbsp', NULL, NULL),
(860, 'icon-page-break', NULL, NULL),
(861, 'icon-page-break2', NULL, NULL),
(862, 'icon-superscript', NULL, NULL),
(863, 'icon-subscript', NULL, NULL),
(864, 'icon-superscript2', NULL, NULL),
(865, 'icon-subscript2', NULL, NULL),
(866, 'icon-text-color', NULL, NULL),
(867, 'icon-highlight', NULL, NULL),
(868, 'icon-pagebreak', NULL, NULL),
(869, 'icon-clear-formatting', NULL, NULL),
(870, 'icon-table', NULL, NULL),
(871, 'icon-table2', NULL, NULL),
(872, 'icon-insert-template', NULL, NULL),
(873, 'icon-pilcrow', NULL, NULL),
(874, 'icon-ltr', NULL, NULL),
(875, 'icon-rtl', NULL, NULL),
(876, 'icon-ltr2', NULL, NULL),
(877, 'icon-rtl2', NULL, NULL),
(878, 'icon-section', NULL, NULL),
(879, 'icon-paragraph-left2', NULL, NULL),
(880, 'icon-paragraph-center2', NULL, NULL),
(881, 'icon-paragraph-right2', NULL, NULL),
(882, 'icon-paragraph-justify2', NULL, NULL),
(883, 'icon-indent-increase', NULL, NULL),
(884, 'icon-indent-decrease', NULL, NULL),
(885, 'icon-paragraph-left3', NULL, NULL),
(886, 'icon-paragraph-center3', NULL, NULL),
(887, 'icon-paragraph-right3', NULL, NULL),
(888, 'icon-paragraph-justify3', NULL, NULL),
(889, 'icon-indent-increase2', NULL, NULL),
(890, 'icon-indent-decrease2', NULL, NULL),
(891, 'icon-share', NULL, NULL),
(892, 'icon-share2', NULL, NULL),
(893, 'icon-new-tab', NULL, NULL),
(894, 'icon-new-tab2', NULL, NULL),
(895, 'icon-popout', NULL, NULL),
(896, 'icon-embed', NULL, NULL),
(897, 'icon-embed2', NULL, NULL),
(898, 'icon-markup', NULL, NULL),
(899, 'icon-regexp', NULL, NULL),
(900, 'icon-regexp2', NULL, NULL),
(901, 'icon-code', NULL, NULL),
(902, 'icon-circle-css', NULL, NULL),
(903, 'icon-circle-code', NULL, NULL),
(904, 'icon-terminal', NULL, NULL),
(905, 'icon-unicode', NULL, NULL),
(906, 'icon-seven-segment-0', NULL, NULL),
(907, 'icon-seven-segment-1', NULL, NULL),
(908, 'icon-seven-segment-2', NULL, NULL),
(909, 'icon-seven-segment-3', NULL, NULL),
(910, 'icon-seven-segment-4', NULL, NULL),
(911, 'icon-seven-segment-5', NULL, NULL),
(912, 'icon-seven-segment-6', NULL, NULL),
(913, 'icon-seven-segment-7', NULL, NULL),
(914, 'icon-seven-segment-8', NULL, NULL),
(915, 'icon-seven-segment-9', NULL, NULL),
(916, 'icon-share3', NULL, NULL),
(917, 'icon-share4', NULL, NULL),
(918, 'icon-google', NULL, NULL),
(919, 'icon-google-plus', NULL, NULL),
(920, 'icon-google-plus2', NULL, NULL),
(921, 'icon-google-drive', NULL, NULL),
(922, 'icon-facebook', NULL, NULL),
(923, 'icon-facebook2', NULL, NULL),
(924, 'icon-instagram', NULL, NULL),
(925, 'icon-twitter', NULL, NULL),
(926, 'icon-twitter2', NULL, NULL),
(927, 'icon-feed2', NULL, NULL),
(928, 'icon-feed3', NULL, NULL),
(929, 'icon-youtube', NULL, NULL),
(930, 'icon-youtube2', NULL, NULL),
(931, 'icon-youtube3', NULL, NULL),
(932, 'icon-vimeo', NULL, NULL),
(933, 'icon-vimeo2', NULL, NULL),
(934, 'icon-lanyrd', NULL, NULL),
(935, 'icon-flickr', NULL, NULL),
(936, 'icon-flickr2', NULL, NULL),
(937, 'icon-flickr3', NULL, NULL),
(938, 'icon-picassa', NULL, NULL),
(939, 'icon-picassa2', NULL, NULL),
(940, 'icon-dribbble', NULL, NULL),
(941, 'icon-dribbble2', NULL, NULL),
(942, 'icon-dribbble3', NULL, NULL),
(943, 'icon-forrst', NULL, NULL),
(944, 'icon-forrst2', NULL, NULL),
(945, 'icon-deviantart', NULL, NULL),
(946, 'icon-deviantart2', NULL, NULL),
(947, 'icon-steam', NULL, NULL),
(948, 'icon-steam2', NULL, NULL),
(949, 'icon-dropbox', NULL, NULL),
(950, 'icon-onedrive', NULL, NULL),
(951, 'icon-github', NULL, NULL),
(952, 'icon-github4', NULL, NULL),
(953, 'icon-github5', NULL, NULL),
(954, 'icon-wordpress', NULL, NULL),
(955, 'icon-wordpress2', NULL, NULL),
(956, 'icon-joomla', NULL, NULL),
(957, 'icon-blogger', NULL, NULL),
(958, 'icon-blogger2', NULL, NULL),
(959, 'icon-tumblr', NULL, NULL),
(960, 'icon-tumblr2', NULL, NULL),
(961, 'icon-yahoo', NULL, NULL),
(962, 'icon-tux', NULL, NULL),
(963, 'icon-apple2', NULL, NULL),
(964, 'icon-finder', NULL, NULL),
(965, 'icon-android', NULL, NULL),
(966, 'icon-windows', NULL, NULL),
(967, 'icon-windows8', NULL, NULL),
(968, 'icon-soundcloud', NULL, NULL),
(969, 'icon-soundcloud2', NULL, NULL),
(970, 'icon-skype', NULL, NULL),
(971, 'icon-reddit', NULL, NULL),
(972, 'icon-linkedin', NULL, NULL),
(973, 'icon-linkedin2', NULL, NULL),
(974, 'icon-lastfm', NULL, NULL),
(975, 'icon-lastfm2', NULL, NULL),
(976, 'icon-delicious', NULL, NULL),
(977, 'icon-stumbleupon', NULL, NULL),
(978, 'icon-stumbleupon2', NULL, NULL),
(979, 'icon-stackoverflow', NULL, NULL),
(980, 'icon-pinterest2', NULL, NULL),
(981, 'icon-xing', NULL, NULL),
(982, 'icon-flattr', NULL, NULL),
(983, 'icon-foursquare', NULL, NULL),
(984, 'icon-paypal', NULL, NULL),
(985, 'icon-paypal2', NULL, NULL),
(986, 'icon-yelp', NULL, NULL),
(987, 'icon-file-pdf', NULL, NULL),
(988, 'icon-file-openoffice', NULL, NULL),
(989, 'icon-file-word', NULL, NULL),
(990, 'icon-file-excel', NULL, NULL),
(991, 'icon-libreoffice', NULL, NULL),
(992, 'icon-html5', NULL, NULL),
(993, 'icon-html52', NULL, NULL),
(994, 'icon-css3', NULL, NULL),
(995, 'icon-git', NULL, NULL),
(996, 'icon-svg', NULL, NULL),
(997, 'icon-codepen', NULL, NULL),
(998, 'icon-chrome', NULL, NULL),
(999, 'icon-firefox', NULL, NULL),
(1000, 'icon-IE', NULL, NULL),
(1001, 'icon-opera', NULL, NULL),
(1002, 'icon-safari', NULL, NULL),
(1003, 'icon-check2', NULL, NULL),
(1004, 'icon-home4', NULL, NULL),
(1005, 'icon-people', NULL, NULL),
(1006, 'icon-checkmark-circle2', NULL, NULL),
(1007, 'icon-arrow-up-left32', NULL, NULL),
(1008, 'icon-arrow-up52', NULL, NULL),
(1009, 'icon-arrow-up-right32', NULL, NULL),
(1010, 'icon-arrow-right6', NULL, NULL),
(1011, 'icon-arrow-down-right32', NULL, NULL),
(1012, 'icon-arrow-down52', NULL, NULL),
(1013, 'icon-arrow-down-left32', NULL, NULL),
(1014, 'icon-arrow-left52', NULL, NULL),
(1015, 'icon-calendar5', NULL, NULL),
(1016, 'icon-move-alt1', NULL, NULL),
(1017, 'icon-reload-alt', NULL, NULL),
(1018, 'icon-move-vertical', NULL, NULL),
(1019, 'icon-move-horizontal', NULL, NULL),
(1020, 'icon-hash', NULL, NULL),
(1021, 'icon-bars-alt', NULL, NULL),
(1022, 'icon-eye8', NULL, NULL),
(1023, 'icon-search4', NULL, NULL),
(1024, 'icon-zoomin3', NULL, NULL),
(1025, 'icon-zoomout3', NULL, NULL),
(1026, 'icon-add', NULL, NULL),
(1027, 'icon-subtract', NULL, NULL),
(1028, 'icon-exclamation', NULL, NULL),
(1029, 'icon-question6', NULL, NULL),
(1030, 'icon-close2', NULL, NULL),
(1031, 'icon-task', NULL, NULL),
(1032, 'icon-inbox', NULL, NULL),
(1033, 'icon-inbox-alt', NULL, NULL),
(1034, 'icon-envelope', NULL, NULL),
(1035, 'icon-compose', NULL, NULL),
(1036, 'icon-newspaper2', NULL, NULL),
(1037, 'icon-calendar22', NULL, NULL),
(1038, 'icon-hyperlink', NULL, NULL),
(1039, 'icon-trash', NULL, NULL),
(1040, 'icon-trash-alt', NULL, NULL),
(1041, 'icon-grid5', NULL, NULL),
(1042, 'icon-grid-alt', NULL, NULL),
(1043, 'icon-menu6', NULL, NULL),
(1044, 'icon-list3', NULL, NULL),
(1045, 'icon-gallery', NULL, NULL),
(1046, 'icon-calculator', NULL, NULL),
(1047, 'icon-windows2', NULL, NULL),
(1048, 'icon-browser', NULL, NULL),
(1049, 'icon-portfolio', NULL, NULL),
(1050, 'icon-comments', NULL, NULL),
(1051, 'icon-screen3', NULL, NULL),
(1052, 'icon-iphone', NULL, NULL),
(1053, 'icon-ipad', NULL, NULL),
(1054, 'icon-googleplus5', NULL, NULL),
(1055, 'icon-pin', NULL, NULL),
(1056, 'icon-pin-alt', NULL, NULL),
(1057, 'icon-cog5', NULL, NULL),
(1058, 'icon-graduation', NULL, NULL),
(1059, 'icon-air', NULL, NULL),
(1060, 'icon-droplets', NULL, NULL),
(1061, 'icon-statistics', NULL, NULL),
(1062, 'icon-pie5', NULL, NULL),
(1063, 'icon-cross', NULL, NULL),
(1064, 'icon-minus2', NULL, NULL),
(1065, 'icon-plus2', NULL, NULL),
(1066, 'icon-info3', NULL, NULL),
(1067, 'icon-info22', NULL, NULL),
(1068, 'icon-question7', NULL, NULL),
(1069, 'icon-help', NULL, NULL),
(1070, 'icon-warning2', NULL, NULL),
(1071, 'icon-add-to-list', NULL, NULL),
(1072, 'icon-arrow-left12', NULL, NULL),
(1073, 'icon-arrow-down12', NULL, NULL),
(1074, 'icon-arrow-up12', NULL, NULL),
(1075, 'icon-arrow-right13', NULL, NULL),
(1076, 'icon-arrow-left22', NULL, NULL),
(1077, 'icon-arrow-down22', NULL, NULL),
(1078, 'icon-arrow-up22', NULL, NULL),
(1079, 'icon-arrow-right22', NULL, NULL),
(1080, 'icon-arrow-left32', NULL, NULL),
(1081, 'icon-arrow-down32', NULL, NULL),
(1082, 'icon-arrow-up32', NULL, NULL),
(1083, 'icon-arrow-right32', NULL, NULL),
(1084, 'icon-switch2', NULL, NULL),
(1085, 'icon-checkmark5', NULL, NULL),
(1086, 'icon-ampersand', NULL, NULL),
(1087, 'icon-alert', NULL, NULL),
(1088, 'icon-alignment-align', NULL, NULL),
(1089, 'icon-alignment-aligned-to', NULL, NULL),
(1090, 'icon-alignment-unalign', NULL, NULL),
(1091, 'icon-arrow-down132', NULL, NULL),
(1092, 'icon-arrow-up13', NULL, NULL),
(1093, 'icon-arrow-left13', NULL, NULL),
(1094, 'icon-arrow-right14', NULL, NULL),
(1095, 'icon-arrow-small-down', NULL, NULL),
(1096, 'icon-arrow-small-left', NULL, NULL),
(1097, 'icon-arrow-small-right', NULL, NULL),
(1098, 'icon-arrow-small-up', NULL, NULL),
(1099, 'icon-check', NULL, NULL),
(1100, 'icon-chevron-down', NULL, NULL),
(1101, 'icon-chevron-left', NULL, NULL),
(1102, 'icon-chevron-right', NULL, NULL),
(1103, 'icon-chevron-up', NULL, NULL),
(1104, 'icon-clippy', NULL, NULL),
(1105, 'icon-comment', NULL, NULL),
(1106, 'icon-comment-discussion', NULL, NULL),
(1107, 'icon-dash', NULL, NULL),
(1108, 'icon-diff', NULL, NULL),
(1109, 'icon-diff-added', NULL, NULL),
(1110, 'icon-diff-ignored', NULL, NULL),
(1111, 'icon-diff-modified', NULL, NULL),
(1112, 'icon-diff-removed', NULL, NULL),
(1113, 'icon-diff-renamed', NULL, NULL),
(1114, 'icon-file-media', NULL, NULL),
(1115, 'icon-fold', NULL, NULL),
(1116, 'icon-gear', NULL, NULL),
(1117, 'icon-git-branch', NULL, NULL),
(1118, 'icon-git-commit', NULL, NULL),
(1119, 'icon-git-compare', NULL, NULL),
(1120, 'icon-git-merge', NULL, NULL),
(1121, 'icon-git-pull-request', NULL, NULL),
(1122, 'icon-graph', NULL, NULL),
(1123, 'icon-law', NULL, NULL),
(1124, 'icon-list-ordered', NULL, NULL),
(1125, 'icon-list-unordered', NULL, NULL),
(1126, 'icon-mail5', NULL, NULL),
(1127, 'icon-mail-read', NULL, NULL),
(1128, 'icon-mention', NULL, NULL),
(1129, 'icon-mirror', NULL, NULL),
(1130, 'icon-move-down', NULL, NULL),
(1131, 'icon-move-left', NULL, NULL),
(1132, 'icon-move-right', NULL, NULL),
(1133, 'icon-move-up', NULL, NULL),
(1134, 'icon-person', NULL, NULL),
(1135, 'icon-plus22', NULL, NULL),
(1136, 'icon-primitive-dot', NULL, NULL),
(1137, 'icon-primitive-square', NULL, NULL),
(1138, 'icon-repo-forked', NULL, NULL),
(1139, 'icon-screen-full', NULL, NULL),
(1140, 'icon-screen-normal', NULL, NULL),
(1141, 'icon-sync', NULL, NULL),
(1142, 'icon-three-bars', NULL, NULL),
(1143, 'icon-unfold', NULL, NULL),
(1144, 'icon-versions', NULL, NULL),
(1145, 'icon-x', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nm_jabatan` varchar(255) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nm_jabatan`, `gaji_pokok`, `created_at`, `updated_at`) VALUES
(1, 'Chief Executive Officer', 20000000, NULL, NULL),
(2, 'Head of Business Development', 10000000, NULL, NULL),
(3, 'Chief Technology Officer', 10000000, NULL, NULL),
(4, 'Head of Finance', 10000000, NULL, NULL),
(5, 'Finance Staff', 9000000, NULL, NULL),
(6, 'FE Manager', 7000000, NULL, NULL),
(7, 'BE Manager', 7000000, NULL, NULL),
(8, 'Mobile Manager', 7000000, NULL, NULL),
(9, 'DevOps Manager', 7000000, NULL, NULL),
(10, 'Elite Engineer ', 7000000, NULL, NULL),
(11, 'Engineer Staff ', 7000000, NULL, NULL),
(12, 'R & D Director', 5000000, NULL, NULL),
(13, 'Engineer Platform', 9000000, NULL, NULL),
(14, 'Training Director', 9000000, NULL, NULL),
(15, 'Training Manager', 9000000, NULL, NULL),
(16, 'Training Staff', 9000000, NULL, NULL),
(17, 'PM', 9000000, NULL, NULL),
(18, 'QA Coord.', 9000000, NULL, NULL),
(19, 'QA Staff', 9000000, NULL, NULL),
(20, 'Marketing & Admin Coord.', 9000000, NULL, NULL),
(21, 'Admin Staff', 9000000, NULL, NULL),
(22, 'Content Coord.', 9000000, NULL, NULL),
(23, 'Content Staff', 9000000, NULL, NULL),
(24, 'HRD Coord.', 9000000, NULL, NULL),
(25, 'HR Staff', 9000000, NULL, NULL),
(26, 'Operasional', 9000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `karat`
--

CREATE TABLE `karat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karat`
--

INSERT INTO `karat` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '24 Karat', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(2, '17 Karat', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(3, '14 Karat', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(4, '9 Karat', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(8, '2 Karat', '2024-06-30 05:05:37', '2024-06-30 05:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `konfigsystem_k`
--

CREATE TABLE `konfigsystem_k` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_perusahan` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `diskon` varchar(255) DEFAULT NULL,
  `pajak` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_diskon` tinyint(1) NOT NULL DEFAULT 1,
  `is_pajak` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `konfigsystem_k`
--

INSERT INTO `konfigsystem_k` (`id`, `nama_perusahan`, `alamat`, `email`, `no_telp`, `diskon`, `pajak`, `created_at`, `updated_at`, `is_diskon`, `is_pajak`) VALUES
(1, 'Toko Emas Indah 123', 'Jl. Pahlawan No. 123456', 'tokoemasindah@gmail.com', '081213131 1', '5', '12', '2024-05-14 00:28:38', '2024-06-30 05:23:23', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_t`
--

CREATE TABLE `laporan_harian_t` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `barang` varchar(255) NOT NULL,
  `kegiatan` varchar(255) NOT NULL,
  `dokumentasi` varchar(255) NOT NULL,
  `jumlah_pekerjaan` varchar(255) NOT NULL,
  `alat_digunakan` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_harian_t`
--

INSERT INTO `laporan_harian_t` (`id`, `tanggal`, `barang`, `kegiatan`, `dokumentasi`, `jumlah_pekerjaan`, `alat_digunakan`, `id_user`, `keterangan`, `created_at`, `updated_at`) VALUES
(24060001, '2024-06-30', 'barang 1', 'kegiatan q', 'barang 1_3006241425.jpg', '12', '12', 24060001, 'aktif', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT 'Indonesia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`, `city`, `province`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Toko Emas Indah', 'Jl. Pahlawan No. 123', 'Jakarta', 'DKI Jakarta', 'Indonesia', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(2, 'Toko Emas Mayjen Sungkono', 'Jl. Mayjen Sungkono No. 12', 'Surabaya', 'Jawa Timur', 'Indonesia', '2024-04-10 20:20:25', '2024-04-10 20:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `master_dokumen`
--

CREATE TABLE `master_dokumen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `file` varchar(255) NOT NULL,
  `id_user_create` int(11) NOT NULL,
  `id_user_update` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_dokumen`
--

INSERT INTO `master_dokumen` (`id`, `type`, `nama`, `tanggal`, `file`, `id_user_create`, `id_user_update`, `created_at`, `updated_at`) VALUES
(2, 'laporanUmum', 'Laporan Umum 1', '2024-06-26', 'Laporan Umum 1_3006241456.docx', 24060001, NULL, '2024-06-30 07:56:14', '2024-06-30 07:56:14');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_parent` bigint(20) UNSIGNED DEFAULT NULL,
  `judul` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `id_hak_akses` bigint(20) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `id_parent`, `judul`, `url`, `icon`, `id_hak_akses`, `order`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Dashboard Admin', 'superAdmin', 'icon-rocket', 1, 0, NULL, NULL),
(2, NULL, 'Dashboard HRD', 'hrd', 'icon-rocket', 2, 1, NULL, NULL),
(3, NULL, 'Menu Staff', NULL, 'icon-user', 3, 2, NULL, NULL),
(4, 3, 'Dashboard Staff', 'staff', NULL, 3, 3, NULL, NULL),
(5, 3, 'Riwayat Pengajuan Cuti', 'staffCuti', NULL, 3, 4, NULL, NULL),
(6, 3, 'Buat Pengajuan Cuti', 'staffCuti/create', NULL, 3, 5, NULL, NULL),
(7, 3, 'Pengajuan Cuti (Tahap Atasan)', 'staffPengajuanCuti', NULL, 3, 6, NULL, NULL),
(8, NULL, 'Manajemen Role & Menu', 'manajemen', 'icon-key', 4, 7, NULL, NULL),
(9, NULL, 'Manajemen Perusahaan', 'perusahaan', ' icon-highlight', 14, 8, NULL, NULL),
(10, NULL, 'Kebijakan Cuti & Jam Kantor', 'peraturan', 'icon-info3', 5, 9, NULL, NULL),
(11, NULL, 'Data Pegawai', 'pegawai', 'icon-users4', 6, 10, NULL, NULL),
(12, NULL, 'Data Jabatan', NULL, 'icon-user-tie', 7, 11, NULL, NULL),
(13, 12, 'List Data Jabatan', 'jabatan', NULL, 7, 12, NULL, NULL),
(14, 12, 'Data Riwayat Jabatan', 'riwayatJabatan', NULL, 7, 13, NULL, NULL),
(15, NULL, 'Data Divisi', NULL, 'icon-hat', 8, 14, NULL, NULL),
(16, 15, 'List Data Divisi', 'divisi', NULL, 8, 15, NULL, NULL),
(17, 15, 'Data Riwayat Divisi', 'riwayatDivisi', NULL, 8, 16, NULL, NULL),
(18, NULL, 'Data Presensi', NULL, 'icon-notebook', 3, 17, NULL, NULL),
(19, 18, 'List Data Presensi', 'presensi', NULL, 3, 18, NULL, NULL),
(20, 18, 'Rekapan Data Presensi Pegawai', 'rekapPresensi', NULL, 3, 19, NULL, NULL),
(21, NULL, 'Data Cuti', NULL, 'icon-furniture', 10, 20, NULL, NULL),
(22, 21, 'List Data Cuti', 'cuti', NULL, 10, 21, NULL, NULL),
(23, 21, 'Atur Tanggal Cuti Bersama', 'cuti/cutiBersama', NULL, 10, 22, NULL, NULL),
(24, 21, 'Pengajuan Cuti (Tahap HRD)', 'hrdPengajuanCuti', NULL, 10, 23, NULL, NULL),
(25, 21, 'Rekapan Data Cuti Pegawai', 'rekapCuti', NULL, 10, 24, NULL, NULL),
(26, NULL, 'Data Gaji', NULL, 'icon-cash3', 11, 25, NULL, NULL),
(27, 26, 'Data Tunjangan', 'tunjangan', NULL, 11, 26, NULL, NULL),
(28, 26, 'Data Potongan', 'potongan', NULL, 11, 27, NULL, NULL),
(29, 26, 'Data Slip Gaji ', 'gaji', NULL, 11, 28, NULL, NULL),
(30, NULL, 'Surat Peringatan', 'suratPeringatan', ' icon-file-text2', 12, 29, NULL, NULL),
(31, NULL, 'Export Kinerja Pegawai', 'report', 'icon-magazine', 13, 30, NULL, NULL),
(32, 3, 'Penilaian Karyawan', 'penilaian', NULL, 3, 31, NULL, NULL),
(33, NULL, 'Laporan Harian', 'laporanHarian', 'icon-archive', 16, 8, NULL, NULL),
(34, NULL, 'Surat Kontak', NULL, 'icon-books', 16, 9, NULL, NULL),
(35, 34, 'Perencanaan', 'perencanaan', NULL, 16, 10, NULL, NULL),
(36, 34, 'Pengawas', 'pengawas', NULL, 16, 11, NULL, NULL),
(37, 34, 'Pelaksana', 'pelaksana', NULL, 16, 12, NULL, NULL),
(38, NULL, 'Dokumen Gambar', 'dokumenGambar', 'icon-image-compare', 16, 13, NULL, NULL),
(39, NULL, 'Time shedule', 'timeShedule', 'icon-table2', 16, 6, NULL, NULL),
(40, NULL, 'Laporan Umum', 'laporanUmum', 'icon-bookmark', 16, 7, NULL, NULL),
(41, NULL, 'Laporan Progres', 'laporanProgres', 'icon-file-check2', 16, 5, NULL, NULL),
(42, NULL, 'Kerangka Acuan Kerja', 'kerangkaAcuanKerja', 'icon-color-sampler', 16, 14, NULL, NULL),
(43, NULL, 'Surat Surat', NULL, 'icon-files-empty', 16, 15, NULL, NULL),
(45, 43, 'Surat Ijin Pekerjaan', 'suratIjinPekerjaan', NULL, 16, 16, NULL, NULL),
(46, 43, 'Surat Undangan Rapat', 'suratUndanganRapat', NULL, 3, 44, NULL, NULL),
(47, 43, 'Surat Pemberitahuan', 'suratPemberitahuan', NULL, 3, 45, NULL, NULL),
(48, NULL, 'Memo Lapangan', 'memoLapangan', 'icon-file-eye2', 16, 20, NULL, NULL),
(50, NULL, 'Dashboard Pengawas', 'pengawasDashboard', 'icon-home', 16, 1, NULL, NULL),
(51, NULL, 'Data Presensi', NULL, 'icon-notebook', 16, 2, NULL, NULL),
(52, 51, 'List Data Presensi', 'presensi', NULL, 16, 3, NULL, NULL),
(53, 51, 'Rekapan Data Presensi Pegawai', 'rekapPresensi', NULL, 16, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_m`
--

CREATE TABLE `menu_m` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_menu` varchar(255) NOT NULL,
  `route` varchar(255) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `route_active` varchar(255) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT 1,
  `any_child` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_aksi` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_m`
--

INSERT INTO `menu_m` (`id`, `nama_menu`, `route`, `icon`, `route_active`, `parent`, `id_user`, `any_child`, `status`, `is_aksi`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', '#navbar-base', '<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"icon\" width=\"24\"\n                            height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\"\n                            stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\"\n                            stroke-linejoin=\"round\">\n                            <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\" />\n                            <path d=\"M5 12l-2 0l9 -9l9 9l-2 0\" />\n                            <path d=\"M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7\" />\n                            <path d=\"M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6\" />\n                        </svg>', '\'dashboard*\'', 0, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(2, 'Data Master Toko/Cabang', '#navbar-base', '<svg xmlns=\"http://www.w3.org/2000/svg\"\n                            class=\"icon icon-tabler icon-tabler-packages\" width=\"24\"\n                            height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\"\n                            stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\"\n                            stroke-linejoin=\"round\">\n                            <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\" />\n                            <path d=\"M7 16.5l-5 -3l5 -3l5 3v5.5l-5 3z\" />\n                            <path d=\"M2 13.5v5.5l5 3\" />\n                            <path d=\"M7 16.545l5 -3.03\" />\n                            <path d=\"M17 16.5l-5 -3l5 -3l5 3v5.5l-5 3z\" />\n                            <path d=\"M12 19l5 3\" />\n                            <path d=\"M17 16.5l5 -3\" />\n                            <path d=\"M12 13.5v-5.5l-5 -3l5 -3l5 3v5.5\" />\n                            <path d=\"M7 5.03v5.455\" />\n                            <path d=\"M12 8l5 -3\" />\n                        </svg>', '\'karat*\',\'master*\',\'type*\', \'products*\',\'customers*\',\'suppliers*\', \'categories*\', \'units*\',\'locations*\',\'rack*\',\'employee*\'', 0, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(3, 'Transaksi', '#navbar-base', '<svg xmlns=\"http://www.w3.org/2000/svg\"\n                        class=\"icon icon-tabler icon-tabler-package-export\" width=\"24\"\n                        height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\"\n                        stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\"\n                        stroke-linejoin=\"round\">\n                        <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\" />\n                        <path d=\"M12 21l-8 -4.5v-9l8 -4.5l8 4.5v4.5\" />\n                        <path d=\"M12 12l8 -4.5\" />\n                        <path d=\"M12 12v9\" />\n                        <path d=\"M12 12l-8 -4.5\" />\n                        <path d=\"M15 18h7\" />\n                        <path d=\"M19 15l3 3l-3 3\" />\n                    </svg>', '\'transaction*\',\'orders*\',\'purchases*\',\'pos*\'', 0, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(4, 'Laporan', '#navbar-base', '<svg xmlns=\"http://www.w3.org/2000/svg\"\n                        class=\"icon icon-tabler icon-tabler-layers-subtract\" width=\"24\"\n                        height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\"\n                        stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\"\n                        stroke-linejoin=\"round\">\n                        <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\" />\n                        <path\n                            d=\"M8 4m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z\" />\n                        <path d=\"M16 16v2a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2v-8a2 2 0 0 1 2 -2h2\" />\n                    </svg>', '\'report*\'', 0, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(5, 'Setting', 'setting.index', '<svg xmlns=\"http://www.w3.org/2000/svg\"\n                        class=\"icon icon-tabler icon-tabler-layers-subtract\" width=\"24\"\n                        height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\"\n                        stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\"\n                        stroke-linejoin=\"round\">\n                        <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\" />\n                        <path\n                            d=\"M8 4m0 2a2 2 0 0 1 2 -2h8a2 2 0 0 1 2 2v8a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2z\" />\n                        <path d=\"M16 16v2a2 2 0 0 1 -2 2h-8a2 2 0 0 1 -2 -2v-8a2 2 0 0 1 2 -2h2\" />\n                    </svg>', '\'report*\'', 0, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(6, 'Ringkasan Penjualan', 'dashboard', '', NULL, 1, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(7, 'Ringkasan Ekspres', 'dashboard.summary-express', '', NULL, 1, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(8, 'Laba rugi', 'dashboard.profit-loss', '', NULL, 1, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(9, 'Grafik Penjualan', 'dashboard.sales-graph', '', NULL, 1, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(10, 'Stok Produk Rendah', 'dashboard.product-low-stock', '', NULL, 1, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(11, 'User', 'master.user', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(12, 'Role', 'master.role', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(13, 'Location Toko/Cabang', 'locations.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(14, 'Pegawai', 'employee.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(15, 'Kategori', 'categories.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(16, 'Satuan', 'units.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(17, 'Karat', 'karat.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(18, 'Tipe', 'type.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(19, 'Produk', 'products.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(20, 'Rak', 'rack.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(21, 'Pelanggan', 'customers.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(22, 'Supplier', 'suppliers.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(23, 'Order Penjualan', 'orders.create', '', NULL, 3, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(24, 'Pesanan Pembelian', 'purchases.create', '', NULL, 3, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(25, 'Absensi Kehadiran', 'transaction.presence', '', NULL, 3, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(26, 'Stok Opname', 'transaction.stock-opname', '', NULL, 3, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(27, 'Penjualan', 'report.sales', '', NULL, 4, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(28, 'Pembelian', 'report.purchase', '', NULL, 4, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(29, 'Pengeluaran', 'report.expend', '', NULL, 4, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(30, 'Stok', 'report.stock', '', NULL, 4, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(31, 'Absensi', 'report.presence', '', NULL, 4, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(32, 'Tambah', 'master.user.create', '', NULL, 11, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(33, 'View', 'master.user.create', '', NULL, 11, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(34, 'Edit', 'master.user.create', '', NULL, 11, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(35, 'Hapus', 'master.user.create', '', NULL, 11, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(37, 'Hak Akses', 'master.user.create', '', NULL, 11, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(38, 'Menu', 'menu.index', '', NULL, 2, 1, 1, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(39, 'Tambah', 'menu.create', '', NULL, 38, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(40, 'View', 'menu.create', '', NULL, 38, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(41, 'Edit', 'menu.create', '', NULL, 38, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(42, 'Hapus', 'menu.create', '', NULL, 38, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(43, 'Tambah', 'role.create', '', NULL, 12, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(44, 'View', 'role.create', '', NULL, 12, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(45, 'Edit', 'role.create', '', NULL, 12, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(46, 'Hapus', 'role.create', '', NULL, 12, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(47, 'Tambah', 'pegawai.create', '', NULL, 14, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(48, 'View', 'pegawai.create', '', NULL, 14, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(49, 'Edit', 'pegawai.create', '', NULL, 14, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(50, 'Hapus', 'pegawai.create', '', NULL, 14, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(51, 'Tambah', 'kategori.create', '', NULL, 15, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(52, 'View', 'kategori.create', '', NULL, 15, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(53, 'Edit', 'kategori.create', '', NULL, 15, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(54, 'Hapus', 'kategori.create', '', NULL, 15, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(55, 'Tambah', 'satuan.create', '', NULL, 16, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(56, 'View', 'satuan.create', '', NULL, 16, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(57, 'Edit', 'satuan.create', '', NULL, 16, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(58, 'Hapus', 'satuan.create', '', NULL, 16, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(59, 'Tambah', 'karat.create', '', NULL, 17, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(60, 'View', 'karat.create', '', NULL, 17, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(61, 'Edit', 'karat.create', '', NULL, 17, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(62, 'Hapus', 'karat.create', '', NULL, 17, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(63, 'Tambah', 'tipe.create', '', NULL, 18, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(64, 'View', 'tipe.create', '', NULL, 18, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(65, 'Edit', 'tipe.create', '', NULL, 18, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(66, 'Hapus', 'tipe.create', '', NULL, 18, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(67, 'Tambah', 'produk.create', '', NULL, 19, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(68, 'View', 'produk.create', '', NULL, 19, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(69, 'Edit', 'produk.create', '', NULL, 19, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(70, 'Hapus', 'produk.create', '', NULL, 19, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(71, 'Tambah', 'rak.create', '', NULL, 20, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(72, 'View', 'rak.create', '', NULL, 20, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(73, 'Edit', 'rak.create', '', NULL, 20, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(74, 'Hapus', 'rak.create', '', NULL, 20, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(75, 'Tambah', 'pelanggan.create', '', NULL, 21, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(76, 'View', 'pelanggan.create', '', NULL, 21, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(77, 'Edit', 'pelanggan.create', '', NULL, 21, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(78, 'Hapus', 'pelanggan.create', '', NULL, 21, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(79, 'Tambah', 'supplier.create', '', NULL, 22, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(81, 'View', 'supplier.create', '', NULL, 22, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(82, 'Edit', 'supplier.create', '', NULL, 22, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(83, 'Hapus', 'supplier.create', '', NULL, 22, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(84, 'Tambah', 'locations.create', '', NULL, 13, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(85, 'View', 'locations.create', '', NULL, 13, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(86, 'Edit', 'locations.create', '', NULL, 13, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24'),
(87, 'Hapus', 'locations.create', '', NULL, 13, 1, 0, 1, 0, '2024-06-15 15:08:24', '2024-06-15 15:08:24');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_01_09_133758_create_permission_tables', 1),
(5, '2021_02_27_143833_create_jabatans_table', 1),
(6, '2021_02_27_144019_create_divisis_table', 1),
(7, '2021_02_27_181740_create_pegawais_table', 1),
(8, '2021_02_28_021611_create_cutis_table', 1),
(9, '2021_02_28_021828_create_presensi_harians_table', 1),
(10, '2021_02_28_022252_create_riwayat_jabatans_table', 1),
(11, '2021_02_28_022637_create_riwayat_divisis_table', 1),
(12, '2021_03_15_232901_create_peraturans_table', 1),
(13, '2021_05_11_100655_create_menus_table', 1),
(14, '2021_05_17_115302_create_tunjangans_table', 1),
(15, '2021_05_17_115713_create_potongans_table', 1),
(16, '2021_05_18_070004_create_gajis_table', 1),
(17, '2021_05_25_055722_create_surat_peringatans_table', 1),
(18, '2021_05_29_094121_create_pegawai_potongans_table', 1),
(19, '2021_05_29_095550_create_pegawai_tunjangans_table', 1),
(20, '2021_06_03_050657_create_icons_table', 1),
(21, '2021_06_15_063430_create_perusahaans_table', 1),
(22, '2021_07_15_063302_create_penilaian_pegawais_table', 1),
(23, '2024_06_17_132425_create_laporan_harian_t_table', 2),
(24, '2024_06_30_125949_add_dashboard_pengawas_permission', 3),
(25, '2024_06_30_133547_create_master_dokumen_table', 4),
(26, '2024_06_30_141413_create_master_dokumen_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Pegawai', 24060001),
(2, 'App\\Models\\Pegawai', 24060002),
(5, 'App\\Models\\Pegawai', 24060003);

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
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_status` tinyint(4) NOT NULL COMMENT '0 - Pending / 1 - Complete',
  `total_products` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pay` int(11) NOT NULL,
  `due` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uuid`, `user_id`, `customer_id`, `order_date`, `order_status`, `total_products`, `sub_total`, `vat`, `diskon`, `total`, `invoice_no`, `payment_type`, `pay`, `due`, `id_toko`, `created_at`, `updated_at`) VALUES
(2, '9b217ecf-e6cc-4f4c-8794-9918fd5338e8', 2, 16, '2024-05-11 00:00:00', 1, 6, 8400, 24, 0, 10416, 'INV-000002', 'cash', 10416, 0, 1, '2024-05-11 00:29:26', '2024-05-11 00:31:42'),
(3, '45a35f3e-df6c-4dff-a928-2d9bdd5f69e4', 2, 17, '2024-05-11 00:00:00', 1, 14, 19600, 24, 0, 24304, 'INV-000003', 'cash', 24304, 0, 1, '2024-05-11 00:41:54', '2024-05-27 00:19:45'),
(4, 'c70f05b5-3e13-403c-bb84-0af3ef3cb1ea', 2, 17, '2024-05-11 00:00:00', 1, 2, 2800, 24, 0, 3472, 'INV-000004', 'cash', 3472, 0, 1, '2024-05-11 01:07:33', '2024-05-27 00:19:33'),
(5, '7327ad6f-9f91-4078-a1c2-8b7a90b68f86', 2, 16, '2024-05-11 00:00:00', 1, 10, 14000, 24, 0, 17360, 'INV-000005', 'Cash', 17360, 0, 1, '2024-05-11 02:22:36', '2024-05-27 00:19:29'),
(6, '6a0b9e34-d8d6-4768-b36b-1e50aecc58b5', 2, 17, '2024-05-14 00:00:00', 1, 2, 2800, 24, 0, 3472, 'INV-000006', 'Cash', 3472, 0, 1, '2024-05-13 21:19:39', '2024-05-27 00:18:55'),
(7, '3f5fe10e-e947-4072-8034-da9a977810d2', 2, 17, '2024-05-14 00:00:00', 1, 12, 16800, 24, 0, 20832, 'INV-000007', 'Cash', 20832, 0, 1, '2024-05-13 21:25:46', '2024-05-13 21:25:54'),
(8, '8b801a8a-4b4a-4eaf-b32c-24cc10abe0c5', 2, 16, '2024-05-15 00:00:00', 1, 2, 1200000, 11, 0, 1212000, 'INV-000008', 'Cash', 1212000, 0, 1, '2024-05-14 23:21:42', '2024-05-14 23:29:17'),
(9, '94001d5a-95d4-4de2-832c-ba5e991739af', 2, 17, '2024-05-15 00:00:00', 1, 2, 2800, 11, 10, 2828, 'INV-000009', 'Cash', 2828, 0, 1, '2024-05-15 01:59:03', '2024-05-15 01:59:28'),
(10, 'a31119db-9691-47bb-9ceb-5364637a92b5', 2, 16, '2024-05-20 00:00:00', 1, 2, 2800, 11, 10, 2828, 'INV-000010', 'Cash', 2828, 0, 1, '2024-05-19 18:31:24', '2024-05-27 00:18:25'),
(11, 'd9f5cb78-4bf4-41b8-92a6-aeec7aee591a', 2, 17, '2024-05-21 00:00:00', 1, 10, 14000, 11, 10, 14140, 'INV-000011', 'Cash', 14140, 0, 1, '2024-05-20 23:23:16', '2024-05-20 23:23:34'),
(12, '71d79df8-44c7-4683-a90c-67c11219e95b', 2, 16, '2024-05-27 00:00:00', 1, 2, 1200000, 11, 10, 1212000, 'INV-000012', 'Cash', 1212000, 0, 1, '2024-05-27 00:15:12', '2024-05-27 00:18:03'),
(13, 'cef34d60-3504-459d-bbb4-fe9b8412f311', 2, 16, '2024-05-27 00:00:00', 1, 5, 1802800, 11, 10, 1820828, 'INV-000013', 'Cash', 2000000, 1820828, 1, '2024-05-27 00:17:48', '2024-05-27 00:17:48'),
(14, 'e23440fa-bf36-48ab-b417-d540369ddd02', 2, 16, '2024-05-30 00:00:00', 1, 13, 7201400, 11, 10, 7273414, 'INV-000014', 'Cash', 7300000, 7273414, 1, '2024-05-29 22:34:04', '2024-05-29 22:34:04'),
(18, 'd9ed5ab0-38b9-4797-a2ac-28f9500d1e8c', 2, 16, '2024-05-30 00:00:00', 1, 1, 11400000, 11, 10, 11514000, 'INV-000015', 'Cash', 12000000, 11514000, 1, '2024-05-30 07:27:58', '2024-05-30 07:27:58'),
(19, '88312b05-6d35-4134-abfe-e449c598b52b', 2, 16, '2024-05-30 00:00:00', 1, 18, 10800000, 11, 10, 10908000, 'INV-000016', 'Cash', 11000000, 10908000, 1, '2024-05-30 07:30:17', '2024-05-30 07:30:17'),
(20, '7c32786b-fbc2-4c12-9a48-f9e3064a3157', 2, 16, '2024-05-30 00:00:00', 1, 18, 10800000, 11, 10, 10908000, 'INV-000017', 'Cash', 11000000, 10908000, 1, '2024-05-30 07:33:33', '2024-05-30 07:33:33'),
(21, 'f40adac1-63da-4385-b756-a9fa79f2a483', 2, 16, '2024-05-30 00:00:00', 1, 18, 10800000, 11, 10, 10908000, 'INV-000018', 'Cash', 11000000, 10908000, 1, '2024-05-30 07:35:28', '2024-05-30 07:35:28'),
(22, 'a54f0202-5e45-4cb0-a24b-48a353887a51', 2, 16, '2024-05-30 00:00:00', 1, 18, 10800000, 11, 10, 10908000, 'INV-000019', 'Cash', 11000000, 10908000, 1, '2024-05-30 07:43:31', '2024-05-30 07:43:31'),
(23, 'c35e5d9b-c02a-42f8-aeb7-9d9fd623afb6', 2, 16, '2024-05-30 00:00:00', 1, 18, 10800000, 11, 10, 10908000, 'INV-000020', 'Cash', 11000000, 10908000, 1, '2024-05-30 07:44:00', '2024-05-30 07:44:00'),
(24, '37521123-d9e4-4991-9799-12ce9458e8ba', 2, 16, '2024-05-30 00:00:00', 1, 3, 4200, 11, 10, 4242, 'INV-000021', 'Cash', 4300, 4242, 1, '2024-05-30 09:33:31', '2024-05-30 09:33:31'),
(25, '4c7b4bcb-43f0-4d1e-8de0-6886227c8f14', 2, 16, '2024-05-30 00:00:00', 1, 0, 1400, 11, 10, 1414, 'INV-000022', 'Cash', 1414, 1414, 1, '2024-05-30 09:35:11', '2024-05-30 09:35:11'),
(26, '991d5992-7c09-48e1-9679-57971198933c', 2, 16, '2024-05-31 00:00:00', 1, 3, 4200, 112, 102, 4620, 'INV-000023', 'Cash', 4620, 4620, 1, '2024-05-31 07:58:07', '2024-05-31 07:58:07'),
(27, 'b81be872-2cdd-4166-bfa0-95d730d68ede', 2, 16, '2024-05-31 00:00:00', 1, 0, 1400, 112, 102, 1540, 'INV-000024', 'Cash', 1540, 1540, 1, '2024-05-31 10:44:52', '2024-05-31 10:44:52'),
(28, 'f0f3516a-1586-46f8-bd7f-eeef69f12473', 2, 16, '2024-06-03 00:00:00', 1, 7, 9800, 12, 0, 10976, 'INV-000025', 'Cash', 11000, 10976, 1, '2024-06-03 16:33:15', '2024-06-03 16:33:15'),
(29, '15c2778d-2d52-4c7c-9440-dce0d879c2ad', 2, 16, '2024-06-30 00:00:00', 1, 0, 1400, 12, 0, 1568, 'INV-000026', 'Cash', 2000, 1568, 1, '2024-06-30 04:40:14', '2024-06-30 04:40:14'),
(30, '417075f4-0c11-496b-a725-f804e8233d26', 2, 22, '2024-06-30 00:00:00', 1, 1, 766400, 12, 0, 858368, 'INV-000027', 'Cash', 900000, 858368, 1, '2024-06-30 05:15:28', '2024-06-30 05:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitcost` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unitcost`, `total`, `created_at`, `updated_at`) VALUES
(1, 2, 4, -17, 1400, 2800, '2024-05-11 00:29:26', '2024-05-30 07:12:21'),
(2, 2, 2, -3, 1400, 5600, '2024-05-11 00:29:26', '2024-05-30 07:12:21'),
(3, 3, 1, 14, 1400, 19600, '2024-05-11 00:41:54', NULL),
(4, 4, 4, -13, 1400, 1400, '2024-05-11 01:07:33', '2024-05-30 07:12:21'),
(5, 4, 1, -11, 1400, 1400, '2024-05-11 01:07:33', '2024-05-30 07:18:53'),
(6, 5, 1, 10, 1400, 14000, '2024-05-11 02:22:36', NULL),
(7, 6, 2, 2, 1400, 2800, '2024-05-13 21:19:39', NULL),
(8, 7, 1, 12, 1400, 16800, '2024-05-13 21:25:46', NULL),
(9, 8, 5, 2, 600000, 1200000, '2024-05-14 23:21:42', NULL),
(10, 9, 4, 2, 1400, 2800, '2024-05-15 01:59:03', NULL),
(11, 10, 1, 2, 1400, 2800, '2024-05-19 18:31:24', NULL),
(12, 11, 2, 10, 1400, 14000, '2024-05-20 23:23:16', NULL),
(13, 12, 5, 1, 600000, 600000, '2024-05-27 00:15:12', NULL),
(14, 13, 5, 2, 600000, 600000, '2024-05-27 00:17:48', NULL),
(15, 13, 1, 1, 1400, 1400, '2024-05-27 00:17:48', NULL),
(16, 14, 4, 19, 1400, 1400, '2024-05-29 22:34:04', NULL),
(17, 14, 5, 1, 600000, 600000, '2024-05-29 22:34:04', NULL),
(24, 18, 5, 1, 600000, 600000, '2024-05-30 07:27:58', NULL),
(25, 23, 5, 18, 600000, 600000, '2024-05-30 07:44:00', NULL),
(26, 24, 1, 3, 1400, 1400, '2024-05-30 09:33:31', NULL),
(27, 25, 1, 1, 1400, 1400, '2024-05-30 09:35:11', NULL),
(28, 26, 2, 3, 1400, 1400, '2024-05-31 07:58:07', NULL),
(29, 27, 2, 1, 1400, 1400, '2024-05-31 10:44:52', NULL),
(30, 28, 4, 7, 1400, 1400, '2024-06-03 16:33:15', NULL),
(31, 29, 1, 1, 1400, 1400, '2024-06-30 04:40:14', NULL),
(32, 30, 2, 1, 1400, 1400, '2024-06-30 05:15:28', NULL),
(33, 30, 9, 1, 765000, 765000, '2024-06-30 05:15:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_role` bigint(20) UNSIGNED DEFAULT NULL,
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jk` enum('Pria','Wanita') NOT NULL,
  `agama` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat_ktp` varchar(255) NOT NULL,
  `alamat_dom` varchar(255) NOT NULL,
  `status` enum('Menikah','Lajang') NOT NULL,
  `jml_anak` int(11) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `tgl_masuk` date NOT NULL,
  `id_atasan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_jabatan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_divisi` bigint(20) UNSIGNED DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `id_role`, `nik`, `nama`, `jk`, `agama`, `tempat_lahir`, `tgl_lahir`, `alamat_ktp`, `alamat_dom`, `status`, `jml_anak`, `no_hp`, `email`, `password`, `tgl_masuk`, `id_atasan`, `id_jabatan`, `id_divisi`, `path`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(24060001, 1, '3307800512068339', 'Bangbang Bimantoro', 'Pria', 'Islam', 'Lubuklinggau', '2002-07-28', 'Ds. Bappenas No. 399', 'Jr. Ters. Buah Batu No. 238', 'Menikah', 5, '0519 5509 859', 'admin@gmail.com', '$2y$10$1t3oAJOTP/bIIUTuPgeQsO2WhGwGfYKTyD5zm43quC50.YOGbBU7O', '1997-01-17', NULL, 8, 3, 'foto.jpg', NULL, '2024-06-17 05:17:01', '2024-06-17 05:17:01', NULL),
(24060002, 2, '6571334808151579', 'Bangbang Bimantoro', 'Pria', 'Islam', 'Singkawang', '2011-01-10', 'Jln. Thamrin No. 471', 'Kpg. Taman No. 54', 'Menikah', 2, '(+62) 437 8458 279', 'hrd@gmail.com', '$2y$10$IA9WBPRaAojOIu.5Hlq89eqB.64irU4zoQT5U4Tu6PApA129TgVbm', '1993-03-28', NULL, 1, 3, 'foto.jpg', NULL, '2024-06-17 05:17:01', '2024-06-17 05:17:01', NULL),
(24060003, 5, '3207886810135213', 'Hasan Arofid', 'Pria', 'Islam', 'Pagar Alam', '1982-06-24', 'Gg. Dipatiukur No. 886', 'Jln. B.Agam Dlm No. 354', 'Menikah', 4, '(+62) 383 6456 4419', 'admin1@gmail.com', '$2y$10$M.1C5c/aXNgg7QwdbrZsoeirDHGYfGs66B/DH7g9PS.j9Rv6tj9Y.', '2019-01-31', NULL, 5, 3, 'foto.jpg', NULL, '2024-06-17 05:17:02', '2024-07-10 19:53:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_potongan`
--

CREATE TABLE `pegawai_potongan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pegawai_id` bigint(20) UNSIGNED NOT NULL,
  `potongan_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_tunjangan`
--

CREATE TABLE `pegawai_tunjangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pegawai_id` bigint(20) UNSIGNED NOT NULL,
  `tunjangan_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_pegawai`
--

CREATE TABLE `penilaian_pegawai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `responsible` int(11) NOT NULL,
  `initiate` int(11) NOT NULL,
  `teamwork` int(11) NOT NULL,
  `discipline` int(11) NOT NULL,
  `work_performance` int(11) NOT NULL,
  `final_value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peraturan`
--

CREATE TABLE `peraturan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_plg` time DEFAULT NULL,
  `jml_cuti_tahunan` int(10) UNSIGNED DEFAULT 12,
  `jml_cuti_besar` int(10) UNSIGNED DEFAULT 12,
  `jml_cuti_bersama` int(10) UNSIGNED DEFAULT 12,
  `jml_cuti_hamil` int(10) UNSIGNED DEFAULT 12,
  `jml_cuti_sakit` int(10) UNSIGNED DEFAULT 12,
  `jml_cuti_penting` int(10) UNSIGNED DEFAULT 12,
  `syarat_bulan_cuti_tahunan` int(10) UNSIGNED DEFAULT 0,
  `syarat_bulan_cuti_besar` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peraturan`
--

INSERT INTO `peraturan` (`id`, `jam_masuk`, `jam_plg`, `jml_cuti_tahunan`, `jml_cuti_besar`, `jml_cuti_bersama`, `jml_cuti_hamil`, `jml_cuti_sakit`, `jml_cuti_penting`, `syarat_bulan_cuti_tahunan`, `syarat_bulan_cuti_besar`, `created_at`, `updated_at`) VALUES
(1, '08:30:00', '16:30:00', 12, 30, 12, 45, 99, 15, 12, 60, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard-admin', 'web', '2024-06-17 05:17:00', '2024-06-17 05:17:00'),
(2, 'dashboard-hrd', 'web', '2024-06-17 05:17:00', '2024-06-17 05:17:00'),
(3, 'menu-staff', 'web', '2024-06-17 05:17:00', '2024-06-17 05:17:00'),
(4, 'manajemen-role', 'web', '2024-06-17 05:17:00', '2024-06-17 05:17:00'),
(5, 'menu-kebijakan-kantor', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(6, 'menu-pegawai', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(7, 'menu-jabatan', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(8, 'menu-divisi', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(9, 'menu-presensi', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(10, 'menu-cuti', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(11, 'menu-gaji', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(12, 'menu-surat-peringatan', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(13, 'menu-export-kinerja', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(14, 'manajemen-perusahaan', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(16, 'dashboard-admin-emas', 'web', '2024-06-30 06:00:37', '2024-06-30 06:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `no_telp` varchar(100) DEFAULT NULL,
  `email_public` varchar(255) NOT NULL,
  `path_logo` varchar(100) DEFAULT NULL,
  `email_private` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id`, `nama`, `alamat`, `kota`, `no_telp`, `email_public`, `path_logo`, `email_private`, `password`, `created_at`, `updated_at`) VALUES
(1, 'PT. PRABU CIPTA TEHNIK', 'Jl. Otto Iskandar Dinata No. 392 Graha LDA lt.2 Suite 06 RT. 001 RW. 001 Kel. Nyengseret Kec. Astana Anyar KotanBandung 40242 Nomor Induk Berusaha ', 'Bandung', '0220204122324', 'info@prabucipta.com', 'path/to/logo.png', 'admin@prabucipta.com', '$2y$10$IS8P0I.LqhEAXVLYKVc4WeXOY.iNfsLfAHVbdGaqUn2KgllPGjC2i', '2024-06-17 05:17:03', '2024-06-17 05:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `potongan`
--

CREATE TABLE `potongan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_shown` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `potongan`
--

INSERT INTO `potongan` (`id`, `nama`, `jumlah`, `is_active`, `is_shown`, `created_at`, `updated_at`) VALUES
(1, 'Potongan Keterlambatan (per Hari)', 50000, 1, 0, NULL, NULL),
(2, 'Potongan Membolos Kerja (per Hari)', 150000, 1, 0, NULL, NULL),
(3, 'Potongan BPJS Kesehatan', 0, 1, 0, NULL, NULL),
(4, 'Potongan BPJS Ketenagakerjaan', 0, 1, 0, NULL, NULL),
(5, 'Potongan PPH 21', 0, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `presensi_harian`
--

CREATE TABLE `presensi_harian` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `ket` enum('Hadir','Cuti','Alpha') NOT NULL,
  `jam_dtg` time DEFAULT NULL,
  `jam_plg` time DEFAULT NULL,
  `is_wfh` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presensi_harian`
--

INSERT INTO `presensi_harian` (`id`, `id_pegawai`, `tanggal`, `ket`, `jam_dtg`, `jam_plg`, `is_wfh`, `created_at`, `updated_at`) VALUES
(1, 24060003, '2024-07-10', 'Hadir', '08:00:00', '15:00:00', 0, '2024-07-09 18:46:00', '2024-07-09 18:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `buying_price` int(11) NOT NULL COMMENT 'Buying Price',
  `selling_price` int(11) NOT NULL COMMENT 'Selling Price',
  `quantity_alert` int(11) NOT NULL,
  `tax` int(11) DEFAULT NULL,
  `tax_type` tinyint(4) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_toko` bigint(20) UNSIGNED DEFAULT NULL,
  `id_karat` int(11) NOT NULL,
  `id_tipe` int(11) NOT NULL,
  `id_rak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `uuid`, `user_id`, `name`, `slug`, `code`, `quantity`, `buying_price`, `selling_price`, `quantity_alert`, `tax`, `tax_type`, `notes`, `product_image`, `category_id`, `unit_id`, `created_at`, `updated_at`, `id_toko`, `id_karat`, `id_tipe`, `id_rak`) VALUES
(1, '96846dcd-2039-4d7b-be67-934402e1dc08', 1, 'Cicin 10K', 'cicin-10k', '1', 276, 90000, 140000, 10, 24, 0, NULL, '1799533392466881.jpeg', 3, 1, '2024-04-10 20:20:25', '2024-06-30 04:40:14', 1, 1, 1, 1),
(2, '611ad075-71ba-49cd-95db-f9b6c38dd761', 1, 'Gelang 15K', 'gelang-15k', '2', 10, 90000, 140000, 10, 24, 0, NULL, '1799533446938585.jpeg', 1, 1, '2024-04-10 20:20:25', '2024-06-30 05:18:39', 1, 2, 2, 6),
(4, 'ea23cd7e-5896-4497-8697-85ad0b525876', 1, 'Liontin 10k', 'liontin-10k', '4', 0, 90000, 140000, 10, 24, 0, 'test', '1799013584444978.jpeg', 5, 1, '2024-04-10 20:20:25', '2024-06-03 16:33:15', 1, 4, 4, 4),
(5, '7cdd6a05-ead6-4a62-94ce-957184b22c12', 2, 'cincin 12', 'cincin-12', 'PC01', 0, 55000000, 60000000, 10, 10, 0, NULL, '1798946563938306.jpg', 1, 1, '2024-05-13 01:07:18', '2024-05-30 07:44:00', 1, 1, 1, 1),
(6, 'f2d2a9f4-d911-4123-a3b2-2669f7d29cad', 2, 'Kalung', 'kalung', 'PC02', 20, 9000000, 9500000, 20, 10, 0, NULL, '1800940360764000.jpg', 2, 1, '2024-06-04 14:16:07', '2024-06-04 14:16:07', 1, 3, 4, 5),
(7, 'a372e120-0bd7-453c-a0d1-2a98a7f08bfb', 2, 'kalung 2', 'kalung-2', 'PC03', 10, 70000000, 80000000, 10, NULL, 0, NULL, '1800940922140453.jpg', 2, 1, '2024-06-04 14:25:02', '2024-06-04 14:25:02', 1, 2, 2, 5),
(8, '2ba1bb93-eac2-48bf-94f9-76f12600efb1', 2, 'anting emas', 'anting-emas', 'PC04', 10, 4500000, 5000000, 10, NULL, 0, NULL, '1800941066450740.jpg', 3, 1, '2024-06-04 14:27:20', '2024-06-04 14:27:20', 1, 2, 1, 5),
(9, '75b1db4e-296e-4739-b87c-8680a4d66353', 2, 'Gelang Emas Tangan Hello Kitty', 'gelang-emas-tangan-hello-kitty', 'PC05', 9, 75000000, 76500000, 5, 7650, 0, 'Ini adalah gelang tanggan dengan motif hello Kitty', '1803261453949188.png', 9, 6, '2024-06-30 05:08:54', '2024-06-30 05:15:28', 1, 4, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) NOT NULL,
  `purchase_no` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Approved',
  `total_amount` int(11) NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `id_toko` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `date`, `purchase_no`, `status`, `total_amount`, `created_by`, `updated_by`, `uuid`, `user_id`, `id_toko`, `created_at`, `updated_at`) VALUES
(1, 20, '2024-05-14 00:00:00', 'PRS-000001', 1, 5500000, 2, 2, '97100bec-f292-475b-8872-211e682aa1cf', 2, 1, '2024-05-13 21:21:24', '2024-05-13 21:22:37'),
(2, 16, '2024-05-14 00:00:00', 'PRS-000002', 1, 1210000, 2, 2, 'bf58750e-c896-4b8b-8179-73cf6eeea753', 2, 1, '2024-05-14 05:29:23', '2024-05-14 05:30:10'),
(6, 16, '2024-05-17 00:00:00', 'PRS-000003', 1, 15540, 2, 2, 'c5fde618-6031-4a4e-a831-975037c2bae1', 2, 1, '2024-05-16 19:12:32', '2024-05-16 19:31:31'),
(7, 16, '2024-05-20 00:00:00', 'PRS-000004', 1, 31080, 2, 2, '649a37d6-3d83-47d6-8354-19c15b2a8da3', 2, 1, '2024-05-19 18:41:41', '2024-05-19 18:42:00'),
(8, 20, '2024-05-20 00:00:00', 'PRS-000005', 1, 3108, 2, 2, '657bc956-8f06-40f6-8a3b-15b3acf2a838', 2, 1, '2024-05-19 18:49:14', '2024-05-19 18:49:45'),
(19, 16, '2024-05-30 00:00:00', 'PRS-000006', 1, 466200, 2, NULL, '75d82e59-4798-46e4-b30f-c467414e5181', 2, 1, '2024-05-30 07:06:12', '2024-05-30 07:06:12'),
(20, 21, '2024-06-30 00:00:00', 'PRS-000007', 1, 1568, 2, NULL, '1caf4969-f552-4208-ae31-b30b9bed0848', 2, 1, '2024-06-30 05:18:39', '2024-06-30 05:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitcost` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`id`, `purchase_id`, `product_id`, `quantity`, `unitcost`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 10, 550, 5500000, '2024-05-13 21:21:24', NULL),
(2, 2, 5, 2, 550, 1100000, '2024-05-14 05:29:23', NULL),
(3, 6, 1, 10, 1400, 14000, '2024-05-16 19:12:32', '2024-05-16 19:12:32'),
(4, 7, 2, 20, 1400, 28000, '2024-05-19 18:41:41', '2024-05-19 18:41:41'),
(5, 8, 4, 2, 1400, 2800, '2024-05-19 18:49:14', '2024-05-19 18:49:14'),
(15, 19, 1, 300, 1400, 420000, '2024-05-30 07:06:12', '2024-05-30 07:06:12'),
(16, 20, 2, 1, 1400, 1400, '2024-06-30 05:18:39', '2024-06-30 05:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT 0,
  `tax_amount` int(11) NOT NULL DEFAULT 0,
  `discount_percentage` int(11) NOT NULL DEFAULT 0,
  `discount_amount` int(11) NOT NULL DEFAULT 0,
  `shipping_amount` int(11) NOT NULL DEFAULT 0,
  `total_amount` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 - Pending / 1 - Complete / 2 - Cancel',
  `note` text DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

CREATE TABLE `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(255) NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rack`
--

CREATE TABLE `rack` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_toko` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rack`
--

INSERT INTO `rack` (`id`, `code`, `name`, `created_at`, `updated_at`, `id_toko`) VALUES
(1, 'R001', 'Rak Emas 1', '2024-04-10 20:20:25', '2024-04-10 20:20:25', 1),
(3, 'R001', 'Rak Emas 1', '2024-04-10 20:20:25', '2024-04-10 20:20:25', 2),
(4, 'R002', 'Rak Emas 2', '2024-04-10 20:20:25', '2024-04-10 20:20:25', 1),
(5, 'R003', 'R09', '2024-05-10 22:45:20', '2024-05-10 22:45:20', 1),
(6, 'R004', 'Rak emas 2', '2024-05-12 03:17:50', '2024-05-12 03:17:50', 1),
(10, 'R005', 'Rak gelang tangan', '2024-06-30 05:09:53', '2024-06-30 05:09:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_divisi`
--

CREATE TABLE `riwayat_divisi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `id_divisi` bigint(20) UNSIGNED NOT NULL,
  `tgl_mulai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `riwayat_divisi`
--

INSERT INTO `riwayat_divisi` (`id`, `id_pegawai`, `id_divisi`, `tgl_mulai`, `created_at`, `updated_at`) VALUES
(1, 24060003, 3, '2024-07-11', '2024-07-10 19:53:12', '2024-07-10 19:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_jabatan`
--

CREATE TABLE `riwayat_jabatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `id_jabatan` bigint(20) UNSIGNED NOT NULL,
  `tgl_mulai` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `riwayat_jabatan`
--

INSERT INTO `riwayat_jabatan` (`id`, `id_pegawai`, `id_jabatan`, `tgl_mulai`, `created_at`, `updated_at`) VALUES
(1, 24060003, 5, '2024-07-11', '2024-07-10 19:53:12', '2024-07-10 19:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(2, 'Admin', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(3, 'Moderator', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(4, 'User', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(7, 'pegawai', '2024-05-14 00:38:55', '2024-05-14 00:38:55'),
(8, 'CUSTOMER', '2024-06-30 04:58:16', '2024-06-30 04:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(2, 'HRD', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(3, 'STAFF', 'web', '2024-06-17 05:17:01', '2024-06-17 05:17:01'),
(5, 'ADMIN-EMAS', 'web', '2024-07-10 19:46:42', '2024-07-10 19:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(8, 1),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(16, 5);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stockopnamedetail_t`
--

CREATE TABLE `stockopnamedetail_t` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_stockopname` int(11) NOT NULL,
  `stock_system` int(11) NOT NULL,
  `stock_real` int(11) NOT NULL,
  `keadaan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stockopnamedetail_t`
--

INSERT INTO `stockopnamedetail_t` (`id`, `id_product`, `id_stockopname`, `stock_system`, `stock_real`, `keadaan`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 20, 20, 'Baik', 'baik', '2024-05-19 20:36:13', '2024-05-19 20:36:13'),
(2, 4, 3, 8, 7, 'Baik', 'baik', '2024-05-19 20:36:13', '2024-05-19 20:36:13'),
(3, 2, 3, 26, 26, 'Baik', 'baik', '2024-05-19 20:36:13', '2024-05-19 20:36:13'),
(4, 1, 3, 8, 7, 'Baik', 'baik', '2024-05-19 20:36:13', '2024-05-19 20:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `stockopname_t`
--

CREATE TABLE `stockopname_t` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_toko` int(11) NOT NULL,
  `id_create_pegawai` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `stockopname_no` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stockopname_t`
--

INSERT INTO `stockopname_t` (`id`, `id_toko`, `id_create_pegawai`, `date`, `stockopname_no`, `created_at`, `updated_at`) VALUES
(3, 1, 2, '2024-05-20', 'STK-000001', '2024-05-19 20:36:13', '2024-05-19 20:36:13');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `shopname` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `uuid`, `user_id`, `name`, `email`, `phone`, `address`, `shopname`, `type`, `photo`, `account_holder`, `account_number`, `bank_name`, `created_at`, `updated_at`) VALUES
(1, '9aeb27c4-f4da-4abb-b3db-c45e757184f3', 1, 'Prof. Hilbert Wiza', 'gnolan@example.com', '(747) 639-8322', '157 Oberbrunner Garden\nMaxineview, AK 28886', 'Herman Inc', 'producer', NULL, 'Kattie Macejkovic', '94278540', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(2, '56cdab54-e58a-4cd3-9c19-9940af6096b7', 1, 'Richard Skiles', 'usporer@example.net', '+1-757-487-4349', '69195 Terrill Walk Suite 560\nSouth Salmaland, ME 52135-0283', 'Durgan LLC', 'wholesaler', NULL, 'Devon Grant', '66081919', 'BRI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(3, 'f853cb4c-ab53-4a2d-b02b-5a3201f47b1d', 1, 'Fletcher Powlowski', 'mmaggio@example.org', '1-628-500-0524', '77017 Anissa Glens\nJohnsfort, AR 45697', 'Klocko, Rutherford and Powlowski', 'producer', NULL, 'Elwin Grimes', '36529862', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(4, '214f0fc8-dd4b-47fe-a0cc-efe49baee176', 1, 'Adelle Funk', 'jessy.shields@example.com', '870.246.0333', '14342 Wilderman Streets Apt. 690\nNienowtown, CO 87018-2692', 'Hamill-Hill', 'distributor', NULL, 'Verlie Rodriguez', '62137094', 'BRI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(5, '23923670-562f-44db-bb84-152e24487dda', 1, 'Preston Smitham', 'bins.cierra@example.org', '+15865647624', '230 Ward Club\nNorth Isac, VT 21625-0824', 'Von, Gorczany and Ernser', 'distributor', NULL, 'Richmond Muller', '80153688', 'BNI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(6, '24ef3b6d-b496-4c00-b9f7-9e6cde867b53', 1, 'Elnora Gaylord', 'tfeil@example.net', '1-310-380-5869', '5022 Braun Neck Apt. 954\nReedmouth, TN 79343-2953', 'Schuster-Armstrong', 'producer', NULL, 'Mr. Rodrigo Fisher V', '14431182', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(7, '5a67c834-8618-43d2-8a6d-77e709808c52', 1, 'Estel Nienow', 'zprosacco@example.net', '1-770-880-3586', '18994 Rubie Coves Suite 152\nJoneshaven, NC 36900-7026', 'Jacobs LLC', 'producer', NULL, 'Prof. Christina Fritsch', '98229020', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(8, '75a9d5cd-d9f9-432f-9c12-ad6107b05eb0', 1, 'Ms. Libby Terry', 'metz.reilly@example.com', '+1 (956) 352-4391', '578 Grant Gateway Apt. 649\nTaraview, FL 86803-2791', 'Veum-Pouros', 'wholesaler', NULL, 'Dr. Junior Carroll MD', '85544284', 'BRI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(9, 'c6f38106-4169-4231-bb51-64e28abd2796', 1, 'Miss Kathryne Cole', 'lottie37@example.com', '+15675602951', '4994 Keanu Ridges\nLake Kassandra, KY 64569', 'Ankunding, Yost and Dicki', 'distributor', NULL, 'Muriel O\'Conner I', '52027020', 'BCA', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(10, 'f7f5cce1-1a7c-4285-8bf2-f0eafc1ab1bc', 1, 'Jayda Langworth', 'zstokes@example.net', '(805) 922-0857', '13115 Bode Ridges\nSouth Ines, CT 34122', 'Weimann-Parker', 'producer', NULL, 'Rowena Yundt', '63271503', 'BSI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(11, 'a1515b7d-9ce4-45c4-8840-34b7816a06a6', 1, 'Eldridge Dare', 'abshire.newell@example.net', '(843) 705-3391', '439 Mertz Ports Suite 933\nValentinatown, FL 17492-8592', 'Schaefer, Effertz and Goyette', 'producer', NULL, 'Logan Kris', '23612515', 'BCA', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(12, 'f1be09d1-f9c3-4432-9b17-acd529b0f0ea', 1, 'Dr. Matteo Block', 'nico69@example.net', '985.209.0200', '53666 Abe Forest\nGreenfelderville, KY 89191', 'Boehm-Becker', 'wholesaler', NULL, 'Prof. Emelie Welch', '62553563', 'BRI', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(13, '6f485487-d85b-41a1-84a1-7f0ddd5c1303', 1, 'Frances Lindgren', 'garrison.hane@example.org', '618.426.4345', '64602 Wintheiser Extension\nLake Leonieton, WV 32700-6812', 'Towne, Trantow and Runolfsson', 'producer', NULL, 'Adeline Hamill', '69819133', 'BCA', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(14, '6f46f375-5485-46a4-9b85-7f4fe68540ea', 1, 'Prof. Easton Greenfelder III', 'pdavis@example.com', '+1-820-507-3631', '715 Giovanny Ports Suite 249\nWest Golda, MT 45469-3539', 'Farrell-Emard', 'wholesaler', NULL, 'Rosanna Hagenes', '27572443', 'Mandiri', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(15, 'a78220d7-2efb-46bd-89ce-45da356bae2b', 1, 'Virgil Emmerich', 'hmuller@example.com', '+1-843-317-7823', '850 Ricky Harbor\nEast Skylar, FL 95259-7092', 'Paucek, Pouros and Lang', 'wholesaler', NULL, 'Keaton Lakin', '66392602', 'BCA', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(16, '24c36f4f-bad1-406c-b496-96cf5bfe2e0b', 2, 'supplier 1', 'supplier@gmail.com', '08121313', '121', 'da', 'distributor', '', '12', '12', 'BRI', '2024-05-08 18:53:43', '2024-05-08 18:53:43'),
(20, '55cbb5b6-2f3f-4657-9374-d80c8aa68591', 2, 'Icim', 'icim@emas.com', '08278344', 'Jl. Selakaso', 'cams jewelry', 'wholesaler', '1799000095106941.png', NULL, NULL, 'Mandiri', '2024-05-13 21:16:25', '2024-05-13 21:16:25'),
(21, '58173fb4-d838-4fec-b090-11809379b3fc', 2, 'Supplier 1', 'sup1@gmail.com', '0845454787', 'JL MAS INDONESIA', 'PT MAS INDONESIA', 'distributor', '', '78979451313', '4545458787', 'BCA', '2024-06-30 05:13:23', '2024-06-30 05:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `surat_peringatan`
--

CREATE TABLE `surat_peringatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pegawai` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `tingkat` enum('I','II','III') DEFAULT NULL,
  `pelanggaran` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`pelanggaran`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surat_peringatan`
--

INSERT INTO `surat_peringatan` (`id`, `id_pegawai`, `tanggal`, `tingkat`, `pelanggaran`, `created_at`, `updated_at`) VALUES
(1, 24060001, '2024-06-30', 'I', '[\"sd\"]', '2024-06-30 07:25:44', '2024-06-30 07:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan`
--

CREATE TABLE `tunjangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_shown` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tunjangan`
--

INSERT INTO `tunjangan` (`id`, `nama`, `jumlah`, `is_active`, `is_shown`, `created_at`, `updated_at`) VALUES
(1, 'Tunjangan Makan', 200000, 1, 1, NULL, NULL),
(2, 'Tunjangan Anak (Per Anak)', 2, 1, 0, NULL, NULL),
(3, 'Tunjangan Keluarga', 10, 1, 0, NULL, NULL),
(4, 'Tunjangan Kinerja', 300000, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cincin A123', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(2, 'Cincin A124', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(3, 'Cincin A125', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(4, 'Cincin A126', '2024-04-10 20:20:25', '2024-04-10 20:20:25'),
(7, 'Gelang Tangan 1', '2024-06-30 05:06:22', '2024-06-30 05:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `user_id`, `name`, `slug`, `short_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Grams', 'grams', 'g', NULL, NULL),
(6, 2, 'Kilograms', 'kilograms', 'Kg', '2024-06-30 05:04:57', '2024-06-30 05:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi_t`
--
ALTER TABLE `absensi_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cuti_id_pegawai_index` (`id_pegawai`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gaji_id_pegawai_index` (`id_pegawai`);

--
-- Indexes for table `hakakses_m`
--
ALTER TABLE `hakakses_m`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karat`
--
ALTER TABLE `karat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konfigsystem_k`
--
ALTER TABLE `konfigsystem_k`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laporan_harian_t`
--
ALTER TABLE `laporan_harian_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_dokumen`
--
ALTER TABLE `master_dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_id_parent_index` (`id_parent`),
  ADD KEY `menus_id_hak_akses_index` (`id_hak_akses`);

--
-- Indexes for table `menu_m`
--
ALTER TABLE `menu_m`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pegawai_nik_unique` (`nik`),
  ADD UNIQUE KEY `pegawai_email_unique` (`email`),
  ADD KEY `pegawai_id_jabatan_index` (`id_jabatan`),
  ADD KEY `pegawai_id_divisi_index` (`id_divisi`),
  ADD KEY `pegawai_id_role_index` (`id_role`),
  ADD KEY `pegawai_id_atasan_foreign` (`id_atasan`);

--
-- Indexes for table `pegawai_potongan`
--
ALTER TABLE `pegawai_potongan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawai_potongan_potongan_id_index` (`potongan_id`),
  ADD KEY `pegawai_potongan_pegawai_id_index` (`pegawai_id`);

--
-- Indexes for table `pegawai_tunjangan`
--
ALTER TABLE `pegawai_tunjangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawai_tunjangan_tunjangan_id_index` (`tunjangan_id`),
  ADD KEY `pegawai_tunjangan_pegawai_id_index` (`pegawai_id`);

--
-- Indexes for table `penilaian_pegawai`
--
ALTER TABLE `penilaian_pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penilaian_pegawai_id_pegawai_index` (`id_pegawai`);

--
-- Indexes for table `peraturan`
--
ALTER TABLE `peraturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `perusahaan_email_public_unique` (`email_public`),
  ADD UNIQUE KEY `perusahaan_email_private_unique` (`email_private`);

--
-- Indexes for table `potongan`
--
ALTER TABLE `potongan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi_harian`
--
ALTER TABLE `presensi_harian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `presensi_harian_id_pegawai_index` (`id_pegawai`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_customer_id_foreign` (`customer_id`),
  ADD KEY `quotations_user_id_foreign` (`user_id`);

--
-- Indexes for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `rack`
--
ALTER TABLE `rack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `riwayat_divisi`
--
ALTER TABLE `riwayat_divisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `riwayat_divisi_id_pegawai_index` (`id_pegawai`),
  ADD KEY `riwayat_divisi_id_divisi_index` (`id_divisi`);

--
-- Indexes for table `riwayat_jabatan`
--
ALTER TABLE `riwayat_jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `riwayat_jabatan_id_pegawai_index` (`id_pegawai`),
  ADD KEY `riwayat_jabatan_id_jabatan_index` (`id_jabatan`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `stockopnamedetail_t`
--
ALTER TABLE `stockopnamedetail_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockopname_t`
--
ALTER TABLE `stockopname_t`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_email_unique` (`email`),
  ADD UNIQUE KEY `suppliers_phone_unique` (`phone`),
  ADD KEY `suppliers_user_id_foreign` (`user_id`);

--
-- Indexes for table `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_peringatan_id_pegawai_index` (`id_pegawai`);

--
-- Indexes for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi_t`
--
ALTER TABLE `absensi_t`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cuti`
--
ALTER TABLE `cuti`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gaji`
--
ALTER TABLE `gaji`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hakakses_m`
--
ALTER TABLE `hakakses_m`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1146;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `karat`
--
ALTER TABLE `karat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `konfigsystem_k`
--
ALTER TABLE `konfigsystem_k`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `laporan_harian_t`
--
ALTER TABLE `laporan_harian_t`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24060002;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_dokumen`
--
ALTER TABLE `master_dokumen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `menu_m`
--
ALTER TABLE `menu_m`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24060004;

--
-- AUTO_INCREMENT for table `pegawai_potongan`
--
ALTER TABLE `pegawai_potongan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_tunjangan`
--
ALTER TABLE `pegawai_tunjangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penilaian_pegawai`
--
ALTER TABLE `penilaian_pegawai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peraturan`
--
ALTER TABLE `peraturan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `potongan`
--
ALTER TABLE `potongan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `presensi_harian`
--
ALTER TABLE `presensi_harian`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_details`
--
ALTER TABLE `quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rack`
--
ALTER TABLE `rack`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `riwayat_divisi`
--
ALTER TABLE `riwayat_divisi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `riwayat_jabatan`
--
ALTER TABLE `riwayat_jabatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stockopnamedetail_t`
--
ALTER TABLE `stockopnamedetail_t`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stockopname_t`
--
ALTER TABLE `stockopname_t`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tunjangan`
--
ALTER TABLE `tunjangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cuti`
--
ALTER TABLE `cuti`
  ADD CONSTRAINT `cuti_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_id_hak_akses_foreign` FOREIGN KEY (`id_hak_akses`) REFERENCES `permissions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `menus_id_parent_foreign` FOREIGN KEY (`id_parent`) REFERENCES `menus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_id_atasan_foreign` FOREIGN KEY (`id_atasan`) REFERENCES `pegawai` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_id_divisi_foreign` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pegawai_potongan`
--
ALTER TABLE `pegawai_potongan`
  ADD CONSTRAINT `pegawai_potongan_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_potongan_potongan_id_foreign` FOREIGN KEY (`potongan_id`) REFERENCES `potongan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pegawai_tunjangan`
--
ALTER TABLE `pegawai_tunjangan`
  ADD CONSTRAINT `pegawai_tunjangan_pegawai_id_foreign` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pegawai_tunjangan_tunjangan_id_foreign` FOREIGN KEY (`tunjangan_id`) REFERENCES `tunjangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penilaian_pegawai`
--
ALTER TABLE `penilaian_pegawai`
  ADD CONSTRAINT `penilaian_pegawai_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `presensi_harian`
--
ALTER TABLE `presensi_harian`
  ADD CONSTRAINT `presensi_harian_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `purchase_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_details_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `quotations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotation_details`
--
ALTER TABLE `quotation_details`
  ADD CONSTRAINT `quotation_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `quotation_details_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `riwayat_divisi`
--
ALTER TABLE `riwayat_divisi`
  ADD CONSTRAINT `riwayat_divisi_id_divisi_foreign` FOREIGN KEY (`id_divisi`) REFERENCES `divisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_divisi_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `riwayat_jabatan`
--
ALTER TABLE `riwayat_jabatan`
  ADD CONSTRAINT `riwayat_jabatan_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `riwayat_jabatan_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `surat_peringatan`
--
ALTER TABLE `surat_peringatan`
  ADD CONSTRAINT `surat_peringatan_id_pegawai_foreign` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
