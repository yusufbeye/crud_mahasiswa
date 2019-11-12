-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2019 at 04:28 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts_mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nrp` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nomor_hp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `nrp`, `email`, `jurusan`, `jenis_kelamin`, `alamat`, `nomor_hp`) VALUES
(17, 'Muhammad Bahrudin Yusuf', '161240000582', 'ubeye46@gmail.com', 'Teknik Informatika', 'Laki Laki', 'Srobyong', '0895365461613'),
(18, 'Bima', '161240000471', 'bima2@gmail.com', 'Teknik Informatika', 'Teknik Informatika', 'suwawal', '089123456341'),
(19, 'khusni', '161240000444', 'khusni@gmail.com', 'Teknik Informatika', 'Teknik Informatika', 'pengkol', '089123451234'),
(20, 'heri', '161240000581', 'heri@gmail.com', 'Teknik Informatika', 'Teknik Informatika', 'mayong', '089987123789'),
(21, 'endah', '161240000322', 'endah@gmail.com', 'Teknik Informatika', 'Teknik Sipil', 'bucu', '081224367128');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `log_perubahan` BEFORE UPDATE ON `mahasiswa` FOR EACH ROW insert into tgl_perubahan
set nrp=old.nrp,
nomor_hp_lama =old.nomor_hp,
nomor_hp_baru=new.nomor_hp,
tgl_perubahan=now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tgl_perubahan`
--

CREATE TABLE `tgl_perubahan` (
  `id` int(11) NOT NULL,
  `nrp` varchar(255) NOT NULL,
  `nomor_hp_lama` varchar(255) NOT NULL,
  `nomor_hp_baru` varchar(255) NOT NULL,
  `tgl_perubahan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tgl_perubahan`
--

INSERT INTO `tgl_perubahan` (`id`, `nrp`, `nomor_hp_lama`, `nomor_hp_baru`, `tgl_perubahan`) VALUES
(2, '161240000582', '0895365461613', '0895365461613', '2019-11-11 15:01:25'),
(3, '161240000582', '0895365461613', '0895365461613', '2019-11-11 15:14:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tgl_perubahan`
--
ALTER TABLE `tgl_perubahan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tgl_perubahan`
--
ALTER TABLE `tgl_perubahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
