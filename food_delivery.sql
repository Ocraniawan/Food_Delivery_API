-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2020 at 04:56 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id_carts` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_checkout` int(11) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id_carts`, `item_id`, `user_id`, `quantity`, `is_checkout`, `created_on`, `updated_on`) VALUES
(15, 11, 18, 2, 1, '2020-01-13 03:15:52', '2020-01-27 04:49:26'),
(19, 11, 20, 2, 0, '2020-01-13 04:29:42', '2020-01-13 04:29:42'),
(20, 11, 20, 1, 0, '2020-01-13 04:37:59', '2020-01-13 04:37:59'),
(23, 7, 18, 1, 0, '2020-02-07 08:48:23', '2020-02-07 08:48:23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `categories_name` varchar(40) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_categories`, `categories_name`, `image`, `created_on`, `updated_on`) VALUES
(1, 'Duck', 'ducks.jpg', '2019-12-25 04:09:51', '2020-01-11 05:03:31'),
(2, 'Noodles', 'noodle.jpg', '2019-12-25 04:09:51', '2020-01-11 05:01:43'),
(3, 'Fish', 'fish.jpg', '2020-01-04 04:46:56', '2020-01-11 05:01:58'),
(4, 'Coffe', 'coffee.jpg', '2019-12-26 12:59:04', '2020-01-11 05:02:13'),
(5, 'Chicken', 'categorieschicken.jpg', '2019-12-26 13:36:16', '2020-01-11 05:02:43'),
(6, 'Rice', 'nasi.jpg', '2019-12-26 13:36:22', '2020-01-11 05:03:00'),
(7, 'Juice', 'juice.jpg', '2020-01-04 04:47:39', '2020-01-11 05:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `item_name` varchar(40) NOT NULL,
  `price` int(7) NOT NULL,
  `description` longtext NOT NULL,
  `rating` float NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id_item`, `categories_id`, `restaurant_id`, `item_name`, `price`, `description`, `rating`, `image`, `created_on`, `updated_on`) VALUES
(1, 1, 14, 'Bebek Bakar', 22000, 'Bebek dibakar', 2.6667, 'Bebek Bakar.jpg', '2020-01-04 05:00:52', '2020-01-04 13:00:52'),
(2, 1, 14, 'Bebek Bacem', 25000, 'Bebek bacem pake sambal', 4, 'Bebek Bacem.jpg', '2020-01-04 05:01:30', '2020-01-04 13:01:30'),
(3, 1, 14, 'Bebek Betutu', 35000, 'Bebek betutu khas Bali 1/4 ekor', 4, 'Betutu.jpg', '2020-01-04 05:02:03', '2020-01-04 13:02:03'),
(4, 1, 14, 'Bebek Betutu', 50000, 'Bebek betutu khas Bali 1/2 ekor', 3.5, 'Betutu.jpg', '2020-01-04 05:02:30', '2020-01-04 13:02:30'),
(5, 4, 10, 'Mix Coffe Tea', 20000, 'Kopi Campur Teh, cobain aja!', 4.2, 'coffe tea.jpg', '2019-12-26 05:53:35', '2020-01-06 04:20:26'),
(6, 1, 14, 'Bebek Rica', 28000, 'Bebek rica khas manado', 4, 'Bebek Rica.jpg', '2020-01-04 05:03:28', '2020-01-04 13:03:28'),
(7, 1, 14, 'Bebek Betutu 1 ekor', 85000, 'Bebek betutu khas Bali 1 ekor', 4, 'Betutu.jpg', '2020-01-04 05:03:00', '2020-01-04 13:03:00'),
(8, 4, 10, 'Toraja Coffe', 20000, 'Ngopi Kuyy..', 3, 'americano.jpg', '2019-12-26 13:30:47', '2020-01-06 04:16:25'),
(9, 4, 10, 'Java Coffe', 20000, 'You should try to taste this', 0, 'coffe.jpg', '2019-12-26 13:31:14', '2019-12-26 21:31:14'),
(10, 4, 10, 'Coffe Latte', 20000, 'Ngopi Kuyy..', 4, 'coffe latte.jpg', '2019-12-26 13:31:33', '2020-01-06 04:16:57'),
(11, 4, 10, 'Americano Caffe', 5000, 'You should try to taste this', 2.25, 'coffe.jpg', '2019-12-26 13:32:58', '2019-12-26 21:32:58'),
(12, 4, 10, 'Ice Coffe', 20000, 'Es Kopi dengan Sensasi Panas', 0, 'ice coffe.jpg', '2019-12-26 13:34:21', '2020-01-06 04:17:59'),
(13, 5, 13, 'Ayam Bakar', 17000, 'Ayam dibakar', 4, 'ayam bakar.jpg', '2019-12-26 13:38:55', '2020-01-04 12:51:48'),
(14, 5, 13, 'Ayam Geprek', 18000, 'Ayam digoreng lalu di geprek', 4.2, 'Ayam Geprek 2.jpg', '2019-12-26 13:39:37', '2020-01-04 12:52:35'),
(15, 5, 13, 'Ayam Penyet', 15000, 'Ayam goreng dipenyet', 4, 'ayam penyet 2.jpg', '2019-12-26 13:40:34', '2020-01-04 12:53:38'),
(16, 5, 13, 'Hot Chicken Mozarella', 22000, 'Ayam Crispy yang masih hot ditambah Keju Mozarella', 3.3333, 'mozarella.jpg', '2019-12-26 13:41:10', '2020-01-04 12:54:55'),
(17, 5, 13, 'Ceker Ayam', 7000, 'Kaki Ayam', 0, 'ceker.jpg', '2019-12-26 13:42:40', '2020-01-04 12:55:43'),
(18, 5, 13, 'Chicken Kampus', 25000, 'Ayam yang dijual dikantin kampus ya', 5, 'ayam bakar.jpg', '2019-12-26 13:43:17', '2020-01-04 12:56:34'),
(19, 1, 14, 'Bebek Kaleyo', 28000, 'Bebek Kaleyo pake sambal', 4.5, 'Bebek Kaleyo.jpg', '2020-01-04 05:04:03', '2020-01-04 13:04:03'),
(20, 6, 11, 'Coconut Milk Rice', 15000, 'Nasi uduk pake bahasa inggris', 5, 'nasi udukk.jpg', '2019-12-26 13:49:53', '2020-01-04 12:57:50'),
(21, 6, 11, 'Rice Box', 25000, 'Nasi pake ayam didalam Box', 3, 'rice box.jpg', '2019-12-26 13:55:05', '2020-01-04 12:58:29'),
(22, 6, 11, 'Rice Bowl', 25000, 'Nasi pake ayam didalam Mangkok', 0, 'rice bowl.jpg', '2019-12-26 13:57:48', '2020-01-04 12:59:31'),
(23, 3, 2, 'Nila Goreng Sambal', 16000, 'Ikan Nila Goreng Sambal cibiuk', 3, 'nila-goreng-sambal-cibiuk.jpg', '2020-01-04 05:14:04', '2020-01-04 13:14:04'),
(24, 3, 2, 'Pepes Kembung', 18000, 'Ikan Kembung Pepes', 4, 'Pepes Kembung.jpg', '2020-01-04 05:13:24', '2020-01-04 13:13:24'),
(25, 3, 2, 'Pecel Lele', 12000, 'Lele Pecel', 5, 'Pecel Lele.jpg', '2020-01-04 05:12:59', '2020-01-04 13:12:59'),
(26, 3, 2, 'Pepes Mujair', 16000, 'Ikan Mujair Pepes', 5, 'Pepes Mujair.jpg', '2020-01-04 05:12:25', '2020-01-04 13:12:25'),
(27, 3, 2, 'Tongkol Cabai Hijau', 14000, 'Ikan Tongkol Cabai Hijau', 5, 'Tongkol Cabai Hijau.jpg', '2020-01-04 05:11:56', '2020-01-04 13:11:56'),
(28, 3, 2, 'Gurame Acar Kuning', 17000, 'Ikan Gurame Acar Kuning', 4, 'Gurame Acar Kuning.jpg', '2020-01-04 05:11:29', '2020-01-04 13:11:29'),
(29, 3, 2, 'Tuna Bumbu Pedas', 25000, 'Ikan Tuna Goreng pedas', 5, 'Tuna Bumbu Pedas.jpg', '2020-01-04 05:11:01', '2020-01-04 13:11:01'),
(30, 3, 2, 'Ikan Sarden Balado', 14000, 'Ikan Sarden Balado', 4, 'Ikan Sarden Balado.jpg', '2020-01-04 05:07:41', '2020-01-04 13:07:41'),
(31, 3, 2, 'Bandeng Goreng Kering', 12000, 'Ikan bandeng Kering digoreng', 5, 'Bandeng Goreng Kering.png', '2020-01-04 05:08:13', '2020-01-04 13:08:13'),
(32, 3, 2, 'Bandeng Kuah Kuning', 16000, 'Ikan bandeng Kuah Kuning Khas', 4, 'Bandeng Kuah Kuning.jpg', '2020-01-04 05:08:36', '2020-01-04 13:08:36'),
(33, 3, 2, 'Gurame Bakar', 20000, 'Ikan Gurame bakar enak', 3.5, 'Gurame Bakar.jpg', '2020-01-04 05:09:03', '2020-01-04 13:09:03'),
(34, 3, 2, 'Lele Crizpy', 18000, 'Ikan Lele Goreng Crizpy', 3.5, 'Lele Crispy.jpg', '2020-01-04 05:09:33', '2020-01-04 13:09:33'),
(35, 3, 2, 'Kembung Asam Pedas', 22000, 'Ikan Kembung Asam Pedas', 0, 'ikan kembung asam pedas.jpg', '2020-01-04 05:10:07', '2020-01-04 13:10:07'),
(36, 3, 2, 'Sup Ikan Tuna', 25000, 'Sup Ikan Tuna Khas Manado', 0, 'Sup Ikan Tuna.jpg', '2020-01-04 05:10:32', '2020-01-04 13:10:32'),
(44, 2, 3, 'Bakmie Ayam', 20000, 'Bakmie pake ayam', 4, 'Bakmie Ayam.jpg', '2020-01-04 05:20:03', '2020-01-04 13:20:03'),
(45, 2, 3, 'Mie Rebus', 14000, 'Mie Rebus pake Sosis', 4, 'Mie Rebus.jpg', '2020-01-04 05:20:27', '2020-01-04 13:20:27'),
(46, 2, 3, 'Mie ayam', 17000, 'Mie Ayam pake Jamur', 3, 'Mie Ayam Jamur.jpg', '2020-01-04 05:21:03', '2020-01-04 13:21:03'),
(47, 2, 3, 'Pangsit Ayam', 20000, 'Mie Ayam pake pangsit', 4, 'Mie Pangsit Ayam.jpg', '2020-01-04 05:21:31', '2020-01-04 13:21:31'),
(48, 2, 3, 'Bakso', 10000, 'Bakso Pake Mie', 5, 'Bakso Mie.jpg', '2020-01-04 05:21:54', '2020-01-04 13:21:54'),
(49, 2, 3, 'Ramen', 23000, 'Ramen Pake Jamur', 4, 'Ramen.jpg', '2020-01-04 05:22:22', '2020-01-04 13:22:22'),
(50, 7, 4, 'Jus Jeruk', 10000, 'Juice Jeruk', 0, 'Jus Jeruk.jpg', '2020-01-04 05:23:52', '2020-01-04 13:23:52'),
(51, 7, 4, 'Jus Apel', 12000, 'Juice apel', 0, 'Jus Apel.jpeg', '2020-01-04 05:24:44', '2020-01-04 13:24:44'),
(52, 7, 4, 'Jus Alpukat', 12000, 'Juice Alpukat', 0, 'Jus Alpukat.jpg', '2020-01-04 05:25:00', '2020-01-04 13:25:00'),
(53, 7, 4, 'Jus Buah Naga', 13000, 'Juice Buah Naga', 0, 'Jus Buah Naga.jpg', '2020-01-04 05:25:23', '2020-01-04 13:25:23'),
(54, 7, 4, 'Jus Jambu', 12000, 'Juice Jambu', 0, 'Jus Jambu.jpg', '2020-01-04 06:03:16', '2020-01-04 14:03:16'),
(55, 7, 4, 'Jus Wortel', 12000, 'Juice Wortel', 0, 'Jus Wortel.jpg', '2020-01-04 06:04:35', '2020-01-04 14:04:35'),
(56, 7, 4, 'Jus Sirsak', 12000, 'Juice Sirsak', 0, 'Jus Sirsak.jpg', '2020-01-04 06:04:53', '2020-01-04 14:04:53'),
(57, 7, 4, 'Jus Markisa', 12000, 'Juice Markisa', 0, 'Jus Markisa.png', '2020-01-04 06:05:17', '2020-01-04 14:05:17'),
(58, 7, 4, 'Cendol Dawet', 15000, 'Cendol Dawet Khas', 0, 'Cendol Dawet.jpg', '2020-01-04 06:05:52', '2020-01-04 14:05:52'),
(59, 7, 4, 'Bir Pletok', 17000, 'Bir tanpa Alkohol', 0, 'bir-pletok.jpg', '2020-01-04 06:06:15', '2020-01-04 14:06:15'),
(60, 7, 4, 'Green Tea', 10000, 'Teh Hijau', 4.5, 'Green Thea.jpg', '2020-01-04 06:09:27', '2020-01-04 14:09:27'),
(61, 7, 4, 'Thai Tea', 10000, 'Teh Thailand', 0, 'Thai Tea.jpg', '2020-01-04 06:09:46', '2020-01-04 14:09:46'),
(62, 7, 4, 'Boba', 15000, 'Buble Tea', 0, 'Boba.jpg', '2020-01-04 06:10:36', '2020-01-04 14:10:36'),
(63, 7, 4, 'Es Pala', 10000, 'Es Pala Enak', 3.5, 'Es Pala.jpg', '2020-01-04 15:23:02', '2020-01-04 23:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `id_restaurant` int(11) NOT NULL,
  `restaurant_name` varchar(40) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id_restaurant`, `restaurant_name`, `description`, `image`, `longitude`, `latitude`, `user_id`, `created_on`, `updated_on`) VALUES
(1, 'Coffe Daily', 'Ayo Ngopi', 'coffe.png', 6.22401, 6.58275, 8, '2020-01-04 04:28:27', '2020-01-04 04:28:27'),
(2, 'Bogor Fish Foodie', 'Ikan bisa membuat anda lebih cerdas', 'ikan.jpg', 6.22401, 6.58275, 2, '2020-01-04 04:26:52', '2020-01-04 04:26:52'),
(3, 'My Mie Bogor', 'Kepuasan anda adalah kebahagiaan kami', 'mie.jpg', 6.22401, 6.58275, 4, '2020-01-04 04:21:03', '2020-01-04 04:21:03'),
(4, 'Fresh Juice Bogor', 'Start your day with a cup of Fresh Juice', 'jus.png', 6.22401, 6.58275, 12, '2020-01-04 04:19:08', '2020-01-04 04:19:08'),
(10, 'Arkademy Coffe Shop', 'Start your day with a cup of Coffe', 'Coffe Shop.jpg', 6.22401, 6.58275, 9, '2019-12-26 03:36:33', '2020-01-04 04:00:07'),
(11, 'Arkademy Restaurant', 'We Sell Everything You Want', 'nasi ayam.jpg', 6.22401, 6.58275, 9, '2019-12-26 04:18:31', '2020-01-04 03:57:29'),
(13, 'Bogor Chicken', 'Ayo Makan Ayam ayaman', 'ayam.jpg', 6.22401, 6.58275, 3, '2019-12-26 13:04:07', '2020-01-04 04:01:19'),
(14, 'Bebek Goyang', 'Makan bebek sambil Goyang goyang', 'bebek.jpg', 6.22401, 6.58275, 13, '2019-12-27 04:03:49', '2020-01-04 04:03:24');

-- --------------------------------------------------------

--
-- Table structure for table `revoked_token`
--

CREATE TABLE `revoked_token` (
  `id` int(11) NOT NULL,
  `token` varchar(200) NOT NULL,
  `is_revoked` varchar(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `revoked_token`
--

INSERT INTO `revoked_token` (`id`, `token`, `is_revoked`, `created_on`, `updated_on`) VALUES
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpYXQiOjE1Nzg0MTIzMzV9.wufhbg4dtA4xfBp4sVkYjev3d50DHhbVHc7s4SHg3Is', '1', '2020-01-07 15:52:15', '2020-01-07 15:52:15');
-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'restaurant'),
(3, 'client');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `role_id`, `created_on`, `updated_on`) VALUES
(1, 'admin', 'admin', '$2a$10$G0muo6G.EjKyi9ZLOmqXX.KbgdXWLzZcMSSz28d/mE57z55A3fZtC', 1, '2019-12-28 07:03:34', '2019-12-28 07:03:34'),
(22, 'ocraniawan', 'ocraniawan', '$2a$10$g.HPSNVRNNefhVlZocB4muvKGmmERh.77/vCGA8H4WSPZu97ISESa', 3, '2020-02-07 05:25:28', '2020-02-07 05:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `valuation`
--

CREATE TABLE `valuation` (
  `valuation_id` int(11) NOT NULL,
  `rating` int(5) NOT NULL,
  `review` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `valuation`
--

INSERT INTO `valuation` (`valuation_id`, `rating`, `review`, `user_id`, `item_id`, `created_on`, `updated_on`) VALUES
(1, 4, 'Bagus enak gurih lesat is the best', 6, 7, '2019-12-27 14:59:05', '2019-12-27 14:59:05'),
(2, 3, 'B aja', 3, 7, '2019-12-27 15:02:29', '2019-12-27 15:02:29'),
(3, 3, 'B aja', 3, 11, '2019-12-27 15:16:39', '2019-12-27 15:16:39'),
(4, 5, 'B aja', 3, 5, '2019-12-27 15:16:46', '2019-12-27 15:16:46'),
(5, 4, 'B aja', 3, 5, '2019-12-27 15:17:18', '2019-12-27 15:17:18'),
(6, 5, 'Enak', 3, 18, '2019-12-27 15:17:46', '2019-12-27 15:17:46'),
(7, 4, 'Sesuai Rating lah', 3, 5, '2019-12-27 15:18:48', '2019-12-27 15:18:48'),
(8, 5, 'Sesuai Rating lah', 3, 5, '2019-12-27 15:19:08', '2019-12-27 15:19:08'),
(9, 5, 'Biarkan Rating yang bicara', 5, 8, '2019-12-27 15:19:43', '2019-12-27 15:19:43'),
(10, 1, 'Biarkan Rating yang bicara', 5, 8, '2019-12-27 15:19:47', '2019-12-27 15:19:47'),
(11, 3, 'Biarkan Rating yang bicara', 5, 21, '2019-12-27 15:20:02', '2019-12-27 15:20:02'),
(12, 5, 'Biarkan Rating yang bicara', 5, 21, '2019-12-27 15:20:13', '2019-12-27 15:20:13'),
(13, 1, 'Biarkan Rating yang bicara', 5, 11, '2019-12-27 15:20:16', '2019-12-27 15:20:16'),
(14, 3, 'Biarkan Rating yang bicara', 6, 16, '2019-12-27 15:20:45', '2019-12-27 15:20:45'),
(15, 2, 'Biarkan Rating yang bicara', 5, 16, '2019-12-27 15:20:49', '2019-12-27 15:20:49'),
(16, 5, 'Biarkan Rating yang bicara', 5, 16, '2019-12-27 15:21:02', '2019-12-27 15:21:02'),
(17, 4, 'Mantap Joss Gandoss', 5, 16, '2020-02-06 09:46:21', '2020-02-06 09:46:21'),
(18, 4, 'Mantap Joss Gandoss', 5, 16, '2020-02-06 09:47:25', '2020-02-06 09:47:25'),
(19, 4, 'Mantap Joss Gandoss', 5, 16, '2020-02-06 09:47:35', '2020-02-06 09:47:35'),
(33, 4, 'Mantap Joss Gandoss', 1, 1, '2020-02-06 10:07:49', '2020-02-06 10:07:49'),
(34, 4, 'Mantap Joss Gandoss', 1, 1, '2020-02-06 10:10:06', '2020-02-06 10:10:06'),
(58, 5, 'joss su ko pi', 1, 11, '2020-02-07 17:10:49', '2020-02-07 17:10:49'),
(59, 0, 'kh', 1, 11, '2020-02-07 18:49:11', '2020-02-07 18:49:11'),
(60, 5, 'Enak Bangat', 1, 7, '2020-02-07 21:15:31', '2020-02-07 21:15:31'),
(62, 4, 'Enak, Sambalnya sangat gurih..', 1, 2, '2020-02-07 21:20:05', '2020-02-07 21:20:05'),
(63, 4, 'Ayam Bakarnya enak', 1, 13, '2020-02-07 21:20:19', '2020-02-07 21:20:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id_carts`),
  ADD KEY `carts_ibfk_3` (`user_id`),
  ADD KEY `carts_ibfk_4` (`item_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `categories_id` (`categories_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id_restaurant`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `revoked_token`
--
ALTER TABLE `revoked_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `valuation`
--
ALTER TABLE `valuation`
  ADD PRIMARY KEY (`valuation_id`),
  ADD KEY `valuation_ibfk_2` (`user_id`),
  ADD KEY `valuation_ibfk_3` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id_carts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `revoked_token`
--
ALTER TABLE `revoked_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `valuation`
--
ALTER TABLE `valuation`
  MODIFY `valuation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id_categories`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id_restaurant`);

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `valuation`
--
ALTER TABLE `valuation`
  ADD CONSTRAINT `valuation_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
