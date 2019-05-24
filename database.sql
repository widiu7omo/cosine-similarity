-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2019 at 11:09 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `poltek`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbcache`
--

CREATE TABLE IF NOT EXISTS `tbcache` (
`id` int(11) NOT NULL,
  `query` varchar(100) NOT NULL,
  `docid` int(11) NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbcosine`
--

CREATE TABLE IF NOT EXISTS `tbcosine` (
`docid` int(11) NOT NULL,
  `panjang` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbjudul`
--

CREATE TABLE IF NOT EXISTS `tbjudul` (
`id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `judul` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbjudul`
--

INSERT INTO `tbjudul` (`id`, `nama`, `judul`) VALUES
(1, 'xs', 'sistem informasi menghitung cepat dan membaca'),
(2, 'dsdf', 'membaca menulis cepat'),
(3, 'si', 'sistem informasi kepegawaian'),
(4, 'siti', 'alas mengapa ngoding itu susah'),
(5, 'nur', 'sistem informasi tahu tempe'),
(6, 'sis', 'sistem informasi tahu bacem'),
(7, 'sis', 'sistem informasi tempe gembos'),
(8, 'jht', 'fghjk'),
(9, 'ddtrft', 'sistem managemen ayam penyet'),
(10, 'dfdgf', 'managemen');

-- --------------------------------------------------------

--
-- Table structure for table `tbtoken`
--

CREATE TABLE IF NOT EXISTS `tbtoken` (
`id` int(11) NOT NULL,
  `term` varchar(30) NOT NULL,
  `count` int(11) NOT NULL,
  `bobot` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tfdf`
--

CREATE TABLE IF NOT EXISTS `tfdf` (
`id` int(11) NOT NULL,
  `idtoken` int(11) NOT NULL,
  `idjudul` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbcache`
--
ALTER TABLE `tbcache`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbcosine`
--
ALTER TABLE `tbcosine`
 ADD PRIMARY KEY (`docid`);

--
-- Indexes for table `tbjudul`
--
ALTER TABLE `tbjudul`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbtoken`
--
ALTER TABLE `tbtoken`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tfdf`
--
ALTER TABLE `tfdf`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbcache`
--
ALTER TABLE `tbcache`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbcosine`
--
ALTER TABLE `tbcosine`
MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbjudul`
--
ALTER TABLE `tbjudul`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbtoken`
--
ALTER TABLE `tbtoken`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tfdf`
--
ALTER TABLE `tfdf`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
