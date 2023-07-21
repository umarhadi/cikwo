-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2023 pada 15.19
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cikwo`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `id_likes` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) DEFAULT NULL,
  `password_pelanggan` varchar(50) DEFAULT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `telepon_pelanggan` varchar(15) DEFAULT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `foto_profil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`, `foto_profil`) VALUES
(7, 'dendi@gmail.com', '15eef7c37a8d9c91355b3b4198be17b2', 'dendi', '08121212121', 'jauh sekali', ''),
(8, 'dendipradana@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'dendi', '08121212121', 'jauh', ''),
(9, 'andiapriansah46@gmail.com', '03339dc0dff443f15c254baccde9bece', 'andi', '085158799719', 'wates', ''),
(10, 'arsenhs99@gmail.com', '03339dc0dff443f15c254baccde9bece', 'andi', '088816171771', 'penataran', ''),
(11, 'siswanto123@gmail.com', 'f8c6e75242df258467104a15f113f425', 'siswanto', '088816171771', 'penataran', ''),
(12, 'dadang@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'dadang', '085151885612', 'palembang', ''),
(13, 'rikoaja12@gmail.com', '0e80b773de5a2275f2d3b68465377eee', 'hariko', '082122314412', 'kabupaten', ''),
(14, 'ikoiko@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'iko', '12134', 'jj', ''),
(15, 'agung@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '@@@@@@', '1083224', 'jogja', ''),
(16, 'andiapriansah97@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'andi apriansah', '085788563651', 'lampung', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` varchar(255) NOT NULL,
  `jumlah_pembelian` varchar(255) NOT NULL,
  `ongkir` varchar(255) NOT NULL,
  `total_pembelian` varchar(255) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `status` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `tanggal_pembelian`, `jumlah_pembelian`, `ongkir`, `total_pembelian`, `id_pelanggan`, `status`) VALUES
(28, '01111000111000001101001101101111101001011110010011110110101000111101000101010100011000001011101010100011001100010011001111100010', '0010010011111110000011011010001111110111010000001100000101001011', '1000000001110101111110000111111110100101010011000101111110000111', '1111010111101001010000110111000001111100111010011100101000110110', 7, 'batal'),
(29, '01111000111000001101001101101111101001011110010011110110101000110101100000100111001111100011001100011100100110101111101010111010', '0010010011111110000011011010001111110111010000001100000101001011', '1000000001110101111110000111111110100101010011000101111110000111', '1111010111101001010000110111000001111100111010011100101000110110', 8, 'dibayar'),
(30, '01000101011010001010110100000111001001100000011101000111101110101010001010001010100000100011001101011011000111001100110001010111', '0010010011111110000011011010001111110111010000001100000101001011', '1000000001110101111110000111111110100101010011000101111110000111', '1111010111101001010000110111000001111100111010011100101000110110', 9, 'dibayar'),
(31, '11010101000101111001011011010010100001100011010001110111100010000010011101001001011111010001111010001100100111011101111111010111', '0010000011011000011000010010011000110101011100101101000010111000', '1000000001110101111110000111111110100101010011000101111110000111', '0001010100101110100010011100010010010001001111110100100010000100', 12, ''),
(32, '11010101000101111001011011010010100001100011010001110111100010000010011101001001011111010001111010001100100111011101111111010111', '0010000011011000011000010010011000110101011100101101000010111000', '1000000001110101111110000111111110100101010011000101111110000111', '0001010100101110100010011100010010010001001111110100100010000100', 12, ''),
(33, '11010101000101111001011011010010100001100011010001110111100010001111101100011010110001110011001001110001001110100101001000011100', '1100001111011110001100111000111000011101110100011100111110001011', '1000000001110101111110000111111110100101010011000101111110000111', '0000101100101111010010110010000110110101010100100011000110101110', 12, ''),
(35, '00100100110101011000101110101100111011111000110110111111000100100001100100111001110001101111011100010110100010111100010000101111', '0000100000000001100001111100101001010011011101101111010100000001', '0111101100101011011000111001000100110101010000011000101101100101', '0100000110000001110111001110000100110110001011001011100111111010', 12, ''),
(36, '10111001011111011100011011110110110001011101001011000100110001001010001000000010100101111110110111000100010110010100100110000110', '1100001111011110001100111000111000011101110100011100111110001011', '1000000001110101111110000111111110100101010011000101111110000111', '0000101100101111010010110010000110110101010100100011000110101110', 14, 'dibayar'),
(37, '10111001011111011100011011110110110001011101001011000100110001001010001000000010100101111110110111000100010110010100100110000110', '0101111101010100110010100011001000000100000000111111010100001001', '1000000001110101111110000111111110100101010011000101111110000111', '1000011100101110011100100000000010111011000110101111010000011110', 14, 'dibayar'),
(38, '10111001011111011100011011110110110001011101001011000100110001001110001101100011010100111111100010110100111001100000011111101011', '0010010011111110000011011010001111110111010000001100000101001011', '1000000001110101111110000111111110100101010011000101111110000111', '1111010111101001010000110111000001111100111010011100101000110110', 14, 'belum bayar'),
(39, '10111001011111011100011011110110110001011101001011000100110001001110001101100011010100111111100010110100111001100000011111101011', '1100111110100010000111000101101100110010110111001110001011100001', '1000000001110101111110000111111110100101010011000101111110000111', '0100110101100000010001101111100101110111100000100001101100110101', 14, 'belum bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `jumlah`, `id_pembelian`, `id_produk`) VALUES
(33, 1, 28, 1),
(34, 1, 29, 1),
(35, 1, 30, 1),
(36, 1, 31, 1),
(37, 1, 32, 1),
(38, 1, 33, 13),
(39, 1, 35, 1),
(40, 1, 35, 18),
(41, 1, 0, 13),
(42, 1, 0, 13),
(43, 1, 0, 13),
(44, 1, 0, 13),
(45, 1, 36, 13),
(46, 1, 37, 1),
(47, 1, 38, 19),
(48, 2, 39, 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga_produk` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `foto_produk` varchar(100) DEFAULT NULL,
  `deskripsi_produk` text DEFAULT NULL,
  `likes` int(11) NOT NULL,
  `id_warung` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `stok`, `foto_produk`, `deskripsi_produk`, `likes`, `id_warung`) VALUES
(1, 'biji kopi 1/5 kg', 25000, 18, 'kopi sangrai biji.jpg', '																								berat bersih perbungkus 1/5 kg															', 2, 1),
(13, 'kopi bubuk 1/5 kg', 35000, 13, 'kopi bubuk.jpg', '																berat bersih perbungkus (1/5 kg bungkus)														', 0, 1),
(17, 'buak tat', 20000, 20, 'f6bd474a1fc3d1a8114a2cc8cc965c0f.jpg', '						isi 1 ukuran sedang				', 0, 1),
(18, 'kue engkak', 15000, 18, 'kue engkak.jpeg', '						isi bersih 1 paket setengah  (1/5kg)				', 0, 1),
(19, 'buak tat kecil', 15000, 49, 'kue tat kecil.jpg', '						isi perpaket empat buah kue tat 				', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `warung`
--

CREATE TABLE `warung` (
  `id_warung` int(11) NOT NULL,
  `nama_warung` varchar(50) DEFAULT NULL,
  `alamat_warung` varchar(100) NOT NULL,
  `telepon_warung` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `warung`
--

INSERT INTO `warung` (`id_warung`, `nama_warung`, `alamat_warung`, `telepon_warung`) VALUES
(1, 'Oleh - oleh', 'Oleh - oleh khas lampung di Cikwo Coffe', '085158799719'),
(2, 'Minuman', 'Menu belum tersedia saat ini', ''),
(3, 'Makanan ', 'Menu belum tersedia saat ini', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_likes`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_warung` (`id_warung`);

--
-- Indeks untuk tabel `warung`
--
ALTER TABLE `warung`
  ADD PRIMARY KEY (`id_warung`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id_likes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `warung`
--
ALTER TABLE `warung`
  MODIFY `id_warung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
