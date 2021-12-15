-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Juni 2021 pada 10.05
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundryku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `role` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `username`, `password`, `nama_admin`, `alamat`, `no_telp`, `jenis_kelamin`, `role`) VALUES
(1, 'adib', '1234', 'Sulthonul Adib', 'Lamongan', '085711110347', 'Laki - Laki', '1'),
(2, 'sulthonul', '1234', 'Sulthonul Adib Fahruddin Ali', 'Lamongan', '085649701341', 'Laki - Laki', '0'),
(3, 'rijal', '1234', 'Rijal Aldianysah', 'Banyuwangi', '086766666666', 'Laki - laki', '0'),
(4, 'pepeng', '1234', 'Alviery Bahrizal', 'Bondowoso', '083929382939', 'Laki - laki', '1'),
(5, 'bisma', '1234', 'Wian Adiyatma', 'Jember', '123123123123', 'Laki - laki', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `no` int(11) NOT NULL,
  `id_cust` varchar(10) NOT NULL,
  `nama_cust` varchar(30) NOT NULL,
  `alamat_cust` varchar(100) NOT NULL,
  `no_telp_cust` varchar(12) NOT NULL,
  `jenisKel_cust` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_customer`
--

INSERT INTO `tb_customer` (`no`, `id_cust`, `nama_cust`, `alamat_cust`, `no_telp_cust`, `jenisKel_cust`) VALUES
(1, 'CS001', 'adit', 'jember', '083744827728', 'Laki - Laki'),
(2, 'CS002', 'adib', 'jember', '083744837728', 'Laki - Laki'),
(3, 'CS003', 'tika', 'jember', '083933829931', 'Perempuan'),
(4, 'CS004', 'rijal', 'jember', '082188392282', 'Laki - Laki'),
(5, 'CS005', 'tiki', 'jember', '02288389928', 'Perempuan'),
(6, 'CS006', 'sisi', 'jember', '082299383392', 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `no` int(11) NOT NULL,
  `no_transaksi` varchar(10) NOT NULL,
  `id_cust` varchar(10) NOT NULL,
  `layanan` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `berat` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`no`, `no_transaksi`, `id_cust`, `layanan`, `status`, `tanggal_transaksi`, `berat`, `total`) VALUES
(1, 'TR001', 'CS002', 'Sameday', 'Lunas', '2021-05-15', 2.42, 24200),
(10, 'TR0010', 'CS001', 'Sameday', 'Lunas', '2021-06-16', 5, 50000),
(11, 'TR0011', 'CS006', 'Sameday', 'Lunas', '2021-06-16', 2.1, 21000),
(2, 'TR002', 'CS001', 'Oneday', 'Lunas', '2021-06-15', 4.3, 34400),
(3, 'TR003', 'CS003', 'Sameday', 'Lunas', '2021-06-15', 2.42, 24200),
(4, 'TR004', 'CS004', 'Sameday', 'Belum Lunas', '2021-06-15', 3.2, 32000),
(5, 'TR005', 'CS005', 'Oneday', 'Lunas', '2021-06-15', 3.7, 29600),
(6, 'TR006', 'CS003', 'Oneday', 'Belum Lunas', '2021-06-15', 2.4, 19200),
(7, 'TR007', 'CS006', 'Reguler', 'Lunas', '2021-06-16', 5, 30000),
(8, 'TR008', 'CS006', 'Reguler', 'Belum Lunas', '2021-06-16', 5, 30000),
(9, 'TR009', 'CS004', 'Reguler', 'Belum Lunas', '2021-06-16', 4, 24000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_cust`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`no_transaksi`),
  ADD KEY `tb_transaksi_cust_id_fk` (`id_cust`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_cust_id_fk` FOREIGN KEY (`id_cust`) REFERENCES `tb_customer` (`id_cust`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
