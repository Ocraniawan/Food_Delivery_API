-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2020 at 12:44 PM
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
(20, 11, 20, 1, 0, '2020-01-13 04:37:59', '2020-01-13 04:37:59');

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
(1, 1, 14, 'Bebek Bakar', 22000, 'Bebek dibakar', 4, 'Bebek Bakar.jpg', '2020-01-04 05:00:52', '2020-01-04 13:00:52'),
(2, 1, 14, 'Bebek Bacem', 25000, 'Bebek bacem pake sambal', 4, 'Bebek Bacem.jpg', '2020-01-04 05:01:30', '2020-01-04 13:01:30'),
(3, 1, 14, 'Bebek Betutu', 35000, 'Bebek betutu khas Bali 1/4 ekor', 4, 'Betutu.jpg', '2020-01-04 05:02:03', '2020-01-04 13:02:03'),
(4, 1, 14, 'Bebek Betutu', 50000, 'Bebek betutu khas Bali 1/2 ekor', 3.5, 'Betutu.jpg', '2020-01-04 05:02:30', '2020-01-04 13:02:30'),
(5, 4, 10, 'Mix Coffe Tea', 20000, 'Kopi Campur Teh, cobain aja!', 4.2, 'coffe tea.jpg', '2019-12-26 05:53:35', '2020-01-06 04:20:26'),
(6, 1, 14, 'Bebek Rica', 28000, 'Bebek rica khas manado', 4, 'Bebek Rica.jpg', '2020-01-04 05:03:28', '2020-01-04 13:03:28'),
(7, 1, 14, 'Bebek Betutu 1 ekor', 85000, 'Bebek betutu khas Bali 1 ekor', 5, 'Betutu.jpg', '2020-01-04 05:03:00', '2020-01-04 13:03:00'),
(8, 4, 10, 'Toraja Coffe', 20000, 'Ngopi Kuyy..', 3, 'americano.jpg', '2019-12-26 13:30:47', '2020-01-06 04:16:25'),
(9, 4, 10, 'Java Coffe', 20000, 'You should try to taste this', 0, 'coffe.jpg', '2019-12-26 13:31:14', '2019-12-26 21:31:14'),
(10, 4, 10, 'Coffe Latte', 20000, 'Ngopi Kuyy..', 4, 'coffe latte.jpg', '2019-12-26 13:31:33', '2020-01-06 04:16:57'),
(11, 4, 10, 'Americano Caffe', 5000, 'You should try to taste this', 5, 'coffe.jpg', '2019-12-26 13:32:58', '2019-12-26 21:32:58'),
(12, 4, 10, 'Ice Coffe', 20000, 'Es Kopi dengan Sensasi Panas', 0, 'ice coffe.jpg', '2019-12-26 13:34:21', '2020-01-06 04:17:59'),
(13, 5, 13, 'Ayam Bakar', 17000, 'Ayam dibakar', 4.5, 'ayam bakar.jpg', '2019-12-26 13:38:55', '2020-01-04 12:51:48'),
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
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpYXQiOjE1Nzg0MTIzMzV9.wufhbg4dtA4xfBp4sVkYjev3d50DHhbVHc7s4SHg3Is', '1', '2020-01-07 15:52:15', '2020-01-07 15:52:15'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpYXQiOjE1Nzg0MTI1MjV9.tweU7yNg6jBecD3CoGXsgpIxbzjonwW7_Vn0Evq5GP4', '1', '2020-01-07 15:55:25', '2020-01-07 15:55:25'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpYXQiOjE1Nzg0MTI4MTR9.tVZGBeqSX-m1x9ZxgQg0lFIJn-C_ZiWEaWbIROh2Alo', '1', '2020-01-07 16:00:14', '2020-01-07 16:00:14'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpYXQiOjE1Nzg0ODcwMzd9.aLV0gd0SVN9p31z-Qt0Hff2OlZS3YXzV5PDjNlzcK3A', '0', '2020-01-08 12:37:17', '2020-01-08 12:37:17'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpYXQiOjE1Nzg0ODg4NDl9.e0p-fJedR-l2RDsZPvhEvAl_67JPr6fjf-89Q0to4_A', '0', '2020-01-08 13:07:29', '2020-01-08 13:07:29'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpYXQiOjE1Nzg1MzY1NzF9.9IWVMyRpX_td2UFOmbp7D07-vNh0aHFUbxDeNH1vZSE', '1', '2020-01-09 02:22:51', '2020-01-09 02:22:51'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODUzODg3Mn0.1sGGtR5o06b_MGH5jYY2d42TzilTZAkhPH7eOrSRNlA', '0', '2020-01-09 03:01:12', '2020-01-09 03:01:12'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODU4MzEwOX0.gOgQOAlpbH4VaTXO0ZyoY3VWbwkvvQ-OMI5IVEAJs6o', '1', '2020-01-09 15:18:29', '2020-01-09 15:18:29'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODU4NDA5MX0.45edugIBlyaQPOe4i1aY-OtIuyF_CcN9AojAgIsPfcI', '0', '2020-01-09 15:34:51', '2020-01-09 15:34:51'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODYyMDg1M30.lelFGvokhlFYthse-G7JPGVXvPDvjdfdpD0Z3CbExCU', '0', '2020-01-10 01:47:33', '2020-01-10 01:47:33'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODcyMjk5N30.5pRV0-xQ1spBpBVHmmSrHP3fJH4IlcdNqCLug9FXxY8', '0', '2020-01-11 06:09:57', '2020-01-11 06:09:57'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODc3NjEwMX0.KruvyZ-5R2JsiLlg4qmNoWojywrxNxDc_dB9jc8EZjI', '1', '2020-01-11 20:55:01', '2020-01-11 20:55:01'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODgxMDU1N30.N2LbW3q7VX4LuqctSk__1PmJ2U9sS3TWwhVRI7ktnS0', '1', '2020-01-12 06:29:17', '2020-01-12 06:29:17'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNjUzMH0.RG5fdQRQNh8c1regEUkdqlq6jiYl1T8GFYx1usxLFjg', '0', '2020-01-12 08:08:50', '2020-01-12 08:08:50'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNjYyOX0.WdB-UDB6CTR2ZsGKCfU98MuoBczcHmFvJ5FspoDJ13o', '0', '2020-01-12 08:10:29', '2020-01-12 08:10:29'),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNjY3Nn0.KGEdFPyYCyS4HvXK-PG2cfoUB0GPS_BiOFdCkRxThm0', '0', '2020-01-12 08:11:16', '2020-01-12 08:11:16'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNjY5NH0.AdHXFLqobZRt5nuoQeEVzMIlpuO2mTxot3aFZEBVwaw', '0', '2020-01-12 08:11:34', '2020-01-12 08:11:34'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNjc1MX0.Kyc4py0o5HEz-gq9xkgSLeOW-BHkoHPZ6a-ly_SGimc', '0', '2020-01-12 08:12:31', '2020-01-12 08:12:31'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNjgxM30.hdBKdfl6T_Wy7T_doAVfrUNRoeF9RUlMnTfioaXhngo', '0', '2020-01-12 08:13:33', '2020-01-12 08:13:33'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNjk2OH0.ib9IiXThG4BNa1J4jV3NHWWhcUXkmXzRP6ura3qjpaI', '0', '2020-01-12 08:16:08', '2020-01-12 08:16:08'),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNzEzNH0.ku9hrXGJ9DYyo-3-1qogG_qGGfb_fKOLJ4sztek2E_0', '0', '2020-01-12 08:18:54', '2020-01-12 08:18:54'),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNzI2NX0.aXdJ7dZZMYfQfOM7Fwy4obMhNNQZWKWHQSdjOId1shY', '0', '2020-01-12 08:21:05', '2020-01-12 08:21:05'),
(37, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNzUxM30.ELeUTLvLPs9YoR7NpkCaD2pukhIF2czfB9K-bcCKNsk', '0', '2020-01-12 08:25:13', '2020-01-12 08:25:13'),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxNzcyM30.UkujaUXX3Vgp3ZURcTuqGXCleteS0YnJk1NG8BwINKE', '0', '2020-01-12 08:28:43', '2020-01-12 08:28:43'),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxODE5NX0.CgEnjoW8llTAafwJEZCYRVFJMvAa6lj7J33TMqkU4Aw', '0', '2020-01-12 08:36:35', '2020-01-12 08:36:35'),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFiY2QiLCJpZF91c2VyIjoxOSwicm9sZXMiOjMsImlhdCI6MTU3ODgxODI2OX0.LUa9aJh7qtP-GyVj7eZmXg6pS_0BLWuVR11d1s_LT-c', '1', '2020-01-12 08:37:49', '2020-01-12 08:37:49'),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODg0NTU0M30.VLK20vzHC2PZmzruk7lNZIFIoxJC_DvP2i-r7s6fISQ', '1', '2020-01-12 16:12:23', '2020-01-12 16:12:23'),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3ODg4NTMyMX0.U0kLSW8WEPKzfOaocW2I4Chtw289e4vwunBsdjEf79Y', '1', '2020-01-13 03:15:21', '2020-01-13 03:15:21'),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im9jcmEiLCJpZF91c2VyIjoyMCwicm9sZXMiOjMsImlhdCI6MTU3ODg4OTU3NH0.sUvH4Kgew8PO2J1STKf52jb4QH6AmslPFg0odJ9dopY', '0', '2020-01-13 04:26:14', '2020-01-13 04:26:14'),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0NTQ4OTF9.gI-s3QdLRNzdSPjVj1Leltf-e2ohXVDfSFe4XPZ4IVk', '0', '2020-01-19 17:28:11', '2020-01-19 17:28:11'),
(45, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ1NTA4NH0.hiMO_P_c0RyK6qpkwniP3x2aj0CySBvBINBmY-0kTvQ', '0', '2020-01-19 17:31:24', '2020-01-19 17:31:24'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ1NTEzMn0.1i5hNepthicrMBLVzV2par0E6dxdP3yEM_SffPrgwYs', '0', '2020-01-19 17:32:12', '2020-01-19 17:32:12'),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0NTU2NjB9.YXXpavOcVxutIbbYNTDFmCbjQ7w4IwS9XnHMcyw8BII', '0', '2020-01-19 17:41:00', '2020-01-19 17:41:00'),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0NTU4MDN9.YywlIOC_EJVmWlNbobdgBYdepTgGF5OdkNiimfbtOQ4', '0', '2020-01-19 17:43:23', '2020-01-19 17:43:23'),
(49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0NTU5MjN9.qrSOePKyu7ojZ__w0t-ozNTcjSb93uKqOjbS83aQ0Mw', '0', '2020-01-19 17:45:23', '2020-01-19 17:45:23'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0NTYwODB9.DEkgprdpBlzBxRgwNLwd9dFgfOgQuvV-4KZR7kqAel8', '0', '2020-01-19 17:48:00', '2020-01-19 17:48:00'),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0NTYyNDl9.m3VsDMlIe_XYxPFEah0KRhOnGTbN3jGkhearEpfp8BQ', '0', '2020-01-19 17:50:49', '2020-01-19 17:50:49'),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0NjEyNjB9.EE1X3lIhKjMth6GPESORTWBTqrwSwFnoBJLFsJMzhWY', '0', '2020-01-19 19:14:20', '2020-01-19 19:14:20'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ5MTc1M30.unRO9tdCuT1h1U--zOC-y5r8maOv1uUQMp5lLxdhdaw', '0', '2020-01-20 03:42:33', '2020-01-20 03:42:33'),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ5Mjk5Nn0.sQPDg81FU8lD4ZaIXLhm2DMTEuOeGNzLcQmpqZILL4M', '0', '2020-01-20 04:03:16', '2020-01-20 04:03:16'),
(55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ5MzIxNH0.1Ze3ZCPTVO7oY9DCFuJAFWvM66JYpHQy5U-7g3ZF1L8', '0', '2020-01-20 04:06:54', '2020-01-20 04:06:54'),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ5NDcyOX0.dmpC0NoDIMqZkIJzHOgWt4y0gzullYGAqb7WAkWtdsQ', '0', '2020-01-20 04:32:09', '2020-01-20 04:32:09'),
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk0OTQ4NjN9.pwn9UwcriB9hd27-34pmqXKFeoXBwkgrHpofjcUQAN0', '0', '2020-01-20 04:34:23', '2020-01-20 04:34:23'),
(58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ5NTAxMX0.70aB3MX1kf-ldPzPMWmjfqs-87JqvZPc0DJ4g66Rxiw', '0', '2020-01-20 04:36:51', '2020-01-20 04:36:51'),
(59, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTQ5NTA1OH0.zUNDDjTB00nxWsSwZho_j6BncZ2bYPG8mnMTe6JH4FU', '0', '2020-01-20 04:37:38', '2020-01-20 04:37:38'),
(60, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk1MDEyNjF9.p3H4jg1i79bjBJ4KkYZoNl2p8wGTPlGE8aF4wHzwdXE', '0', '2020-01-20 06:21:01', '2020-01-20 06:21:01'),
(61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4gIiwiaWRfdXNlciI6MTgsInJvbGVzIjozLCJpYXQiOjE1Nzk1MDM2MjN9.dpBRMQdrsiQgpEKJ4uVOy5HgiSK5iyW_ZIM99kfsbKA', '0', '2020-01-20 07:00:23', '2020-01-20 07:00:23'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFya2FkZW1pYW4iLCJpZF91c2VyIjoxOCwicm9sZXMiOjMsImlhdCI6MTU3OTUwMzkxMn0.fHHVoBqd6g_0Kpaj58LgjbNb32cVt3SZczwIajJhbSs', '0', '2020-01-20 07:05:12', '2020-01-20 07:05:12'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im9jcmFuaWF3YW5wIiwiaWRfdXNlciI6MjEsInJvbGVzIjozLCJpYXQiOjE1ODA5NzEzODF9.hRsFcQY_sRL0tIaaeX8PrATxnia_t48PVaSS0TebOcE', '0', '2020-02-06 06:43:01', '2020-02-06 06:43:01');

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
(2, 'Ikan Darat', 'ikandarat', '$2a$10$3zZz2q2Rb8AZ94x15ztG/uxH29LQ1aApg84xsdNMzLdoAu9099Wr2', 2, '2020-01-04 04:10:05', '2020-01-04 04:10:05'),
(3, 'myrestaurant', 'myresto', '$2a$10$U0YEv7TOmLwIfDwshZmjHebzOu8L0Y/a00GPe.uZ.sI9xs9WO5lbe', 2, '2019-12-24 12:00:32', '2019-12-30 02:35:27'),
(4, 'Mie Mie', 'mymie', '$2a$10$2uYJvxlQDrz4FOCkZm7Auuig5XnQN/LkoxrZRKovSC7P8bAwfy95y', 2, '2020-01-04 04:10:53', '2020-01-04 04:10:53'),
(5, 'arkademy', 'arkademy', '$2a$10$mlMktd3hdronWFlGpQ9vgeKvYI6MXaIA5EmaDh8Ed9xU5E15Ug.vy', 3, '2019-12-24 13:54:38', '2019-12-24 13:54:38'),
(6, 'arka', 'demy', '$2a$10$GgU9mswchqdbPiUvh9DakeLfiBE8Bx79rzFYrbmmBfAzm7Vvv7uRe', 3, '2019-12-24 14:11:20', '2019-12-24 14:36:35'),
(7, 'admin', 'admina', '$2a$10$g/m0SY1qfFEZ9LeRhbvbZuZCsxuUTVsXkHJ/DFyv11.7wefGfb40y', 1, '2019-12-25 05:24:04', '2019-12-25 05:24:04'),
(8, 'My Coffe', 'coffeku', '$2a$10$AfLfDnI00PJ8Mho8/eHJ6OU2hALvhQZC.TqkStSMabXL2H0wxarRC', 2, '2020-01-04 04:11:55', '2020-01-04 04:11:55'),
(9, 'arkademy', 'arkaresto', '$2a$10$XXi.ehBZQbNdfna5IGXlLe/PZi5aN4QlDzWlBdQxB9uYT8.bWDLoy', 2, '2019-12-28 07:00:59', '2019-12-28 07:00:59'),
(10, 'client', 'client', '$2a$10$/UvO0L69ymqdueAr1Gy72OtyM84f7aIomV91NjJaTGX6Twl94SVmG', 3, '2019-12-30 02:42:19', '2019-12-30 02:42:19'),
(12, 'Jus Segar', 'myjuice', '$2a$10$7p3QRJD7TgNFNXL8wTvnJ.Hit4eaftwKZFSP7WG68wRy8ba2xO1j.', 2, '2020-01-04 04:12:55', '2020-01-04 04:12:55'),
(13, 'Bebekta', 'bebeb', '$2a$10$FeQv7zANy2JEnkfHf1o9He8RJ7pIUSlL6LLIAG.aXRPEO343ttXqC', 2, '2020-01-04 04:16:27', '2020-01-04 04:16:27'),
(17, 'FFF', 'FFF', '$2a$10$WI3A5VMBucuBwaUpU92gguZX6Ilz0/rx0SFj/U48x2xWVuckpCh02', 3, '2020-01-05 18:30:04', '2020-01-05 18:30:04'),
(18, 'arkademian', 'arkademian', '$2a$10$vs3cN4x0ukJ12D9vjv0Kuu.uhNzFVg4X3nPqrgg.PisRCkjzZHXo.', 3, '2020-01-06 03:42:39', '2020-01-06 03:42:39'),
(19, 'abcd', 'abcd', '$2a$10$65myrVjxI7Ic5EuRAHHyCeuZFyb1kpn3LJoc4liz1ZpjOn9E.DunO', 3, '2020-01-12 08:01:53', '2020-01-12 08:01:53'),
(20, 'Ocraniawan', 'ocra', '$2a$10$R1EsBtCq2XeqDidWHsOFa.aWwgRyk3u/hBJdOyvP3J4beiXydyI1q', 3, '2020-01-13 04:25:49', '2020-01-13 04:25:49'),
(21, 'Ocraniawan Patattan', 'ocraniawanp', '$2a$10$sRGhTNlZj7yH53S1m2lLI.yBOfq5KrLIqO6YHqOQen3UHQ/x1WnRq', 3, '2020-02-06 06:42:43', '2020-02-06 06:42:43');

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
(24, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 09:52:09', '2020-02-06 09:52:09'),
(25, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 09:54:39', '2020-02-06 09:54:39'),
(26, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 09:55:10', '2020-02-06 09:55:10'),
(27, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 09:57:29', '2020-02-06 09:57:29'),
(28, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 09:58:22', '2020-02-06 09:58:22'),
(29, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 09:58:50', '2020-02-06 09:58:50'),
(30, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 10:03:22', '2020-02-06 10:03:22'),
(31, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 10:03:49', '2020-02-06 10:03:49'),
(32, 4, 'Mantap Joss Gandoss', 1, 2, '2020-02-06 10:06:14', '2020-02-06 10:06:14'),
(33, 4, 'Mantap Joss Gandoss', 1, 1, '2020-02-06 10:07:49', '2020-02-06 10:07:49'),
(34, 4, 'Mantap Joss Gandoss', 1, 1, '2020-02-06 10:10:06', '2020-02-06 10:10:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id_carts`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id_carts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `valuation`
--
ALTER TABLE `valuation`
  MODIFY `valuation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `carts_ibfk_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`);

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
  ADD CONSTRAINT `valuation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `valuation_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`id_item`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
