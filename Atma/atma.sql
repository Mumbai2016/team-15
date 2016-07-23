-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2016 at 10:18 PM
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
  `year_no` enum('y1','y2','y3','') NOT NULL,
  `ngo_username` varchar(20) NOT NULL,
  `goals_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aip`
--

INSERT INTO `aip` (`strat_id`, `aip_id`, `annual_description`, `start_date`, `end_date`, `year_no`, `ngo_username`, `goals_id`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', '2016-06-01', '2017-06-01', 'y1', 'katalyst', 1),
(1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', '2017-06-01', '2018-06-01', 'y2', 'katalyst', 1),
(1, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2018-06-01', '2019-06-01', 'y3', 'katalyst', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`ngo_username`, `pm_username`, `goals_description`, `goals_id`, `priority_area`) VALUES
('katalyst', 'prachi', 'Increase teachers from 10 to 100', 1, 'Talent & Partner Acquisition and Retention'),
('katalyst', 'prachi', 'Bring funds of Rs. 50,000/-', 2, 'Funding'),
('katalyst', 'prachi', 'Expand to Chennai and Kerela', 3, 'External Recognition');

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

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `email`, `user_type`) VALUES
('katalyst', 'katu', 'katalyst@gmail.com', 'ngo_profile'),
('prachi', 'prachi', 'prachis1795@gmail.com', 'manager_profile'),
('sac', 'spark', 'sac@yahoo.com', 'ngo_profile'),
('stg.4040', 'shivangi', 'stg.4040@gmail.com', 'volunteer_profile');

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
  `mobile_no` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `gender` varchar(1) NOT NULL DEFAULT 'M',
  `date_of_joining` date NOT NULL,
  `date_of_termination` date NOT NULL,
  `hours_logged` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager_profile`
--

INSERT INTO `manager_profile` (`first_name`, `middle_name`, `last_name`, `email`, `password`, `country`, `mobile_no`, `username`, `gender`, `date_of_joining`, `date_of_termination`, `hours_logged`) VALUES
('Prachi', 'Jaydeep', 'Shah', 'prachis1795@gmail.com', 'prachi', 'India', 809747819, 'prachi', 'F', '2016-05-23', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ngo_profile`
--

CREATE TABLE IF NOT EXISTS `ngo_profile` (
  `ngo_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `mobile_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ngo_profile`
--

INSERT INTO `ngo_profile` (`ngo_name`, `email`, `username`, `password`, `mobile_no`) VALUES
('katalyst', 'katalyst@gmail.com', 'katalyst', 'katu', 981922986),
('spark a change', 'sac@yahoo.com', 'sac', 'spark', 0);

-- --------------------------------------------------------

--
-- Table structure for table `strategies`
--

CREATE TABLE IF NOT EXISTS `strategies` (
  `goal_id` int(100) NOT NULL,
  `strat_id` int(100) NOT NULL,
  `strat_description` varchar(200) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `ngo_username` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `strategies`
--

INSERT INTO `strategies` (`goal_id`, `strat_id`, `strat_description`, `start_date`, `end_date`, `ngo_username`) VALUES
(1, 1, 'Increase the incentives', '2016-06-01', '2019-06-01', 'katalyst'),
(2, 2, 'Organize events to gain funds', '2016-07-04', '2019-07-04', 'katalyst'),
(3, 3, 'Create offices in Chennai and Kerela', '2014-01-05', '2019-01-05', 'katalyst');

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
  `resources` varchar(500) NOT NULL,
  `ngo_username` varchar(20) NOT NULL,
  `goals_id` int(100) NOT NULL,
  `strat_id` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`aip_id`, `task_id`, `task_description`, `start_date`, `end_date`, `quarter_no`, `volunteer_username`, `status`, `resources`, `ngo_username`, `goals_id`, `strat_id`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2016-06-01', '2016-07-01', 'q1', 'stg4040', 'Completed', 'Lorem', 'katalyst', 1, 1),
(1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2016-10-01', '2016-10-01', 'q2', 'stg4040', 'Pending', 'Lorem', 'katalyst', 1, 1);

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
('Shivangi', 'Haresh', 'Adhia', 'stg.4040@gmail.com', 'shivangi', 'India', 981922986, 'stg.4040', 'F', '2016-07-01', '0000-00-00', 0);

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
  MODIFY `goals_id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `strategies`
--
ALTER TABLE `strategies`
  MODIFY `strat_id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
