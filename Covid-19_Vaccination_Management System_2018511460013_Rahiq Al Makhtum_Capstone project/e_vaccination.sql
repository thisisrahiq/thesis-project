-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2021 at 04:31 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_vaccination`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `gender` varchar(8) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `pass` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `lastname`, `gender`, `city`, `birth`, `email`, `pass`) VALUES
('Rahiq', 'Al Makhtum', 'Male', 'Ahmedabad', '1998-11-19', 'myemail@email.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `c_name` varchar(15) NOT NULL,
  `c_gender` varchar(8) DEFAULT NULL,
  `c_city` varchar(30) DEFAULT NULL,
  `c_birth` date DEFAULT NULL,
  `c_age` int(3) DEFAULT NULL,
  `c_weight` int(5) DEFAULT NULL,
  `c_height` int(5) DEFAULT NULL,
  `c_vaccine` varchar(100) DEFAULT NULL,
  `p_username` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`c_name`, `c_gender`, `c_city`, `c_birth`, `c_age`, `c_weight`, `c_height`, `c_vaccine`, `p_username`) VALUES
('demo', 'Male', 'Ahmadabad', '2015-01-01', 6, 34, 123, 'AstraZeneca', 'Rahiq'),
('1st child of Ra', 'Male', 'Ahmadabad', '2015-01-01', 7, 6, 123, 'Covaxin', 'Rahiq'),
('towhid', 'Male', 'Ahmadabad', '2015-01-01', 12, 12, 12, 'AstraZeneca', 'Rahiq');

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `p_username` varchar(15) NOT NULL,
  `p_lastname` varchar(15) DEFAULT NULL,
  `p_gender` varchar(8) NOT NULL,
  `p_city` varchar(30) DEFAULT NULL,
  `p_birth` date DEFAULT NULL,
  `p_email` varchar(30) DEFAULT NULL,
  `p_pass` varchar(25) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`p_username`, `p_lastname`, `p_gender`, `p_city`, `p_birth`, `p_email`, `p_pass`) VALUES
('Rahiq', 'Al Makhtum', '', 'Ahmedabad', '1998-11-19', 'myemail@email.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `name` varchar(50) NOT NULL,
  `timing` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`name`, `timing`) VALUES
('AstraZeneca', '+1 day'),
('Covaxin', '+6 month'),
('Sinovac', '+10 day'),
('Moderna', '+2 month');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_dates`
--

CREATE TABLE `vaccine_dates` (
  `name` varchar(50) NOT NULL,
  `v_date` date DEFAULT NULL,
  `timing` varchar(20) NOT NULL,
  `c_name` varchar(15) DEFAULT NULL,
  `p_username` varchar(15) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccine_dates`
--

INSERT INTO `vaccine_dates` (`name`, `v_date`, `timing`, `c_name`, `p_username`, `status`) VALUES
('AstraZeneca', '2021-11-21', '2021-11-22', 'demo', 'Rahiq', 'false'),
('Covaxin', '2021-11-21', '2022-05-21', '1st child of Ra', 'Rahiq', 'false'),
('AstraZeneca', '2021-11-21', '2021-11-22', 'towhid', 'Rahiq', 'false');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD KEY `p_username` (`p_username`);

--
-- Indexes for table `vaccine_dates`
--
ALTER TABLE `vaccine_dates`
  ADD KEY `p_username` (`p_username`),
  ADD KEY `c_name` (`c_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
