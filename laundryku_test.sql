-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: laundryku_test
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `role` varchar(1) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` VALUES (1,'yasimaru','1234','Yasimaru','Kalitidu','085711110347','Laki - Laki','1'),(2,'galiley','1234','Galiley','Bojonegoro','085649701341','Laki - Laki','0'),(3,'rijal','1234','Rijal Aldianysah','Banyuwangi','086766666666','Laki - laki','0'),(4,'pepeng','1234','Alviery Bahrizal','Bondowoso','083929382939','Laki - laki','1'),(5,'bisma','1234','Wian Adiyatma','Jember','123123123123','Laki - laki','1'),(6,'singgang','123456','Singgang','Malang','085111000111','Laki - laki','0');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customer` (
  `no` int(11) NOT NULL,
  `id_cust` varchar(10) NOT NULL,
  `nama_cust` varchar(30) NOT NULL,
  `alamat_cust` varchar(100) NOT NULL,
  `no_telp_cust` varchar(12) NOT NULL,
  `jenisKel_cust` varchar(15) NOT NULL,
  PRIMARY KEY (`id_cust`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer`
--

LOCK TABLES `tb_customer` WRITE;
/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` VALUES (1,'CS001','adit','jember','083744827728','Laki - Laki'),(2,'CS002','adib','jember','083744837728','Laki - Laki'),(3,'CS003','tika','jember','083933829931','Perempuan'),(4,'CS004','rijal','jember','082188392282','Laki - Laki'),(5,'CS005','tiki','jember','02288389928','Perempuan'),(6,'CS006','sisi','jember','082299383392','Perempuan');
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_transaksi`
--

DROP TABLE IF EXISTS `tb_transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_transaksi` (
  `no` int(11) NOT NULL,
  `no_transaksi` varchar(10) NOT NULL,
  `id_cust` varchar(10) NOT NULL,
  `layanan` varchar(15) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `berat` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`no_transaksi`),
  KEY `tb_transaksi_cust_id_fk` (`id_cust`),
  CONSTRAINT `tb_transaksi_cust_id_fk` FOREIGN KEY (`id_cust`) REFERENCES `tb_customer` (`id_cust`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_transaksi`
--

LOCK TABLES `tb_transaksi` WRITE;
/*!40000 ALTER TABLE `tb_transaksi` DISABLE KEYS */;
INSERT INTO `tb_transaksi` VALUES (1,'TR001','CS002','Sameday','Lunas','2021-05-15',2.42,24200),(10,'TR0010','CS001','Sameday','Lunas','2021-06-16',5,50000),(11,'TR0011','CS006','Sameday','Lunas','2021-06-16',2.1,21000),(2,'TR002','CS001','Oneday','Lunas','2021-06-15',4.3,34400),(3,'TR003','CS003','Sameday','Lunas','2021-06-15',2.42,24200),(4,'TR004','CS004','Sameday','Belum Lunas','2021-06-15',3.2,32000),(5,'TR005','CS005','Oneday','Lunas','2021-06-15',3.7,29600),(6,'TR006','CS003','Oneday','Belum Lunas','2021-06-15',2.4,19200),(7,'TR007','CS006','Reguler','Lunas','2021-06-16',5,30000),(8,'TR008','CS006','Reguler','Belum Lunas','2021-06-16',5,30000),(9,'TR009','CS004','Reguler','Belum Lunas','2021-06-16',4,24000);
/*!40000 ALTER TABLE `tb_transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'laundryku_test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-16  0:13:07
