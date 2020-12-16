-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2020 at 04:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_roti_enak`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `nama_barang` text NOT NULL,
  `jenis_barang` text NOT NULL,
  `ukuran_barang` varchar(10) NOT NULL,
  `topping_barang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `jenis_id`, `nama_barang`, `jenis_barang`, `ukuran_barang`, `topping_barang`) VALUES
(2, 2, 'roti bolu', 'roti basah', '5cm', 'susu kental manis');

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'ROTI', 1, 1, 0, '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_roti`
--

CREATE TABLE `tb_jenis_roti` (
  `id_jenis` int(11) NOT NULL,
  `jenis_barang` text NOT NULL,
  `jenis_nama_barang` varchar(128) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis_roti`
--

INSERT INTO `tb_jenis_roti` (`id_jenis`, `jenis_barang`, `jenis_nama_barang`, `keterangan`) VALUES
(1, 'roti kering', 'roti gandum', 'roti gandum merupakan roti yang dibuat dari menggunakan tepung yang sebagian atau seluruhnya menggunakan biji-bijian dari gandum utuh, roti gandum tersebut memiliki warna coklat.'),
(2, 'roti basah', 'roti bolu', 'bolu adalah salah satu dari aneka roti basah yang populer. Bolu ini jenisnya ada dua macam yaitu bolu kukus atau bolu panggang. Untuk bisa mendapatkan kue bolu yang moist kebanyakan di kukus dikarenakan tidak ada bagian roti yang gosong. Membuat bolu kukus ini sangat mudah sekali, Anda hanya perlu menyiapkan tepung terigu, telur, air, gula pasir dan pengembang.'),
(3, 'roti kering', 'roti manis', 'roti ini merupakan salah satu roti yang sangat difavoritkan oleh warga Indonesia, selain memiliki rasa yang manis, terdapat tesktur yang sangat lembut pada roti tersebut.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `jenis_id` (`jenis_id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jenis_roti`
--
ALTER TABLE `tb_jenis_roti`
  ADD PRIMARY KEY (`id_jenis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_jenis_roti`
--
ALTER TABLE `tb_jenis_roti`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`jenis_id`) REFERENCES `tb_jenis_roti` (`id_jenis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
