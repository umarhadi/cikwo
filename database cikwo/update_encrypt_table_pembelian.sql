-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 02:09 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_cikwo`
--

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` varchar(255) NOT NULL,
  `jumlah_pembelian` varchar(255) NOT NULL,
  `ongkir` varchar(255) NOT NULL,
  `total_pembelian` varchar(255) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `tanggal_pembelian`, `jumlah_pembelian`, `ongkir`, `total_pembelian`, `id_pelanggan`) VALUES
(28, '01111000111000001101001101101111101001011110010011110110101000111101000101010100011000001011101010100011001100010011001111100010', '0010010011111110000011011010001111110111010000001100000101001011', '1000000001110101111110000111111110100101010011000101111110000111', '1111010111101001010000110111000001111100111010011100101000110110', 7),
(29, '01111000111000001101001101101111101001011110010011110110101000110101100000100111001111100011001100011100100110101111101010111010', '0010010011111110000011011010001111110111010000001100000101001011', '1000000001110101111110000111111110100101010011000101111110000111', '1111010111101001010000110111000001111100111010011100101000110110', 8),
(30, '01000101011010001010110100000111001001100000011101000111101110101010001010001010100000100011001101011011000111001100110001010111', '0010010011111110000011011010001111110111010000001100000101001011', '1000000001110101111110000111111110100101010011000101111110000111', '1111010111101001010000110111000001111100111010011100101000110110', 9),
(31, '11010101000101111001011011010010100001100011010001110111100010000010011101001001011111010001111010001100100111011101111111010111', '0010000011011000011000010010011000110101011100101101000010111000', '1000000001110101111110000111111110100101010011000101111110000111', '0001010100101110100010011100010010010001001111110100100010000100', 12),
(32, '11010101000101111001011011010010100001100011010001110111100010000010011101001001011111010001111010001100100111011101111111010111', '0010000011011000011000010010011000110101011100101101000010111000', '1000000001110101111110000111111110100101010011000101111110000111', '0001010100101110100010011100010010010001001111110100100010000100', 12),
(33, '11010101000101111001011011010010100001100011010001110111100010001111101100011010110001110011001001110001001110100101001000011100', '1100001111011110001100111000111000011101110100011100111110001011', '1000000001110101111110000111111110100101010011000101111110000111', '0000101100101111010010110010000110110101010100100011000110101110', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;