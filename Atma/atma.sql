-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2016 at 04:10 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atma`
--

-- --------------------------------------------------------

--
-- Table structure for table `aip`
--

CREATE TABLE IF NOT EXISTS `aip` (
  `strat_id` int(100) NOT NULL,
  `aip_id` int(100) NOT NULL,
  `annual_description` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `year_no` enum('y1','y2','y3','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE IF NOT EXISTS `goals` (
  `ngo_username` varchar(20) NOT NULL,
  `pm_username` varchar(20) NOT NULL,
  `goals_description` varchar(200) NOT NULL,
  `goals_id` int(100) NOT NULL,
  `priority_area` enum('Quality & Cost Efficiency','Successful Outcomes','External Recognition','Funding','Talent & Partner Acquisition and Retention') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `user_type` enum('volunteer_profile','manager_profile','ngo_profile') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manager_profile`
--

CREATE TABLE IF NOT EXISTS `manager_profile` (
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(16) NOT NULL,
  `country` varchar(30) NOT NULL,
  `mobile_no` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `date_of_joining` date NOT NULL,
  `date_of_termination` date NOT NULL,
  `hours_logged` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ngo_profile`
--

CREATE TABLE IF NOT EXISTS `ngo_profile` (
  `ngo_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `mobile_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `strategies`
--

CREATE TABLE IF NOT EXISTS `strategies` (
  `goal_id` int(100) NOT NULL,
  `strat_id` int(100) NOT NULL,
  `strat_description` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `aip_id` int(100) NOT NULL,
  `task_id` int(100) NOT NULL,
  `task_description` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `quarter_no` enum('q1','q2','q3','q4') NOT NULL,
  `volunteer_username` varchar(20) NOT NULL,
  `status` enum('Completed','Pending','Postponed','Aborted') NOT NULL,
  `resources` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_profile`
--

CREATE TABLE IF NOT EXISTS `volunteer_profile` (
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(16) NOT NULL,
  `country` varchar(30) NOT NULL,
  `mobile_no` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `gender` varchar(1) DEFAULT 'M',
  `date_of_joining` date NOT NULL,
  `date_of_termination` date NOT NULL,
  `hours_logged` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteer_profile`
--

INSERT INTO `volunteer_profile` (`first_name`, `middle_name`, `last_name`, `email`, `password`, `country`, `mobile_no`, `username`, `gender`, `date_of_joining`, `date_of_termination`, `hours_logged`) VALUES
('Shivangi', 'Haresh', 'Adhia', 'stg.4040@gmail.com', 'shivangi', 'India', 981922986, 'stg.4040@gmail.com', 'F', '2016-07-01', '0000-00-00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aip`
--
ALTER TABLE `aip`
  ADD PRIMARY KEY (`aip_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`goals_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `manager_profile`
--
ALTER TABLE `manager_profile`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ngo_profile`
--
ALTER TABLE `ngo_profile`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `strategies`
--
ALTER TABLE `strategies`
  ADD PRIMARY KEY (`strat_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `volunteer_profile`
--
ALTER TABLE `volunteer_profile`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `goals_id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `strategies`
--
ALTER TABLE `strategies`
  MODIFY `strat_id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(100) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
