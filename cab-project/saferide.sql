-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2016 at 11:19 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saferide`
--

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(256) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `phoneNumber` varchar(16) NOT NULL,
  `vehicleNumber` varchar(128) NOT NULL,
  `vehicleType` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `password`, `name`, `gender`, `phoneNumber`, `vehicleNumber`, `vehicleType`) VALUES
(1, 'password', 'Bod', 'male', '8582326470', '123 AZ', 'SUV'),
(2, 'password', 'Janine', 'female', '8527419360', '343 OS', 'TY');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`) VALUES
(1, 'Walmart'),
(2, 'Mozingo Lake'),
(3, 'Horizons Apt'),
(4, 'Hyvee'),
(5, 'Kansas');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `studentId` varchar(128) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `destinationId` int(11) NOT NULL,
  `driverId` int(11) NOT NULL,
  `pickUpTime` datetime NOT NULL,
  `dropTime` datetime NOT NULL,
  `distance` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `passengers` int(11) NOT NULL,
  `status` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `studentId`, `sourceId`, `destinationId`, `driverId`, `pickUpTime`, `dropTime`, `distance`, `type`, `passengers`, `status`) VALUES
(1, '1', 1, 2, 1, '2016-04-17 22:00:00', '2016-04-17 23:00:00', 4, 'one', 2, ''),
(2, '1', 1, 3, 2, '2016-04-17 22:23:23', '2016-04-17 23:03:23', 4, 'one', 1, 'new'),
(3, '1', 1, 3, 1, '2016-04-17 22:23:23', '2016-04-17 23:03:23', 4, 'round', 1, 'new'),
(4, '1', 1, 3, 1, '2016-04-17 20:23:23', '2016-04-17 21:03:23', 4, 'one', 1, 'new'),
(5, '1', 3, 5, 1, '2016-04-17 23:23:23', '2016-04-18 00:43:23', 8, 'round', 3, 'new'),
(6, '1', 1, 4, 1, '2016-04-24 22:23:23', '2016-04-24 23:13:23', 5, 'one', 1, 'cancelled'),
(7, '1', 1, 5, 1, '2016-04-30 20:00:00', '2016-04-30 21:00:00', 6, 'round', 1, 'new'),
(8, '919531357', 1, 4, 2, '2016-04-30 20:00:00', '2016-04-30 20:50:00', 5, 'round', 1, 'new'),
(9, '919531357', 2, 4, 2, '2016-04-23 20:59:00', '2016-04-23 21:59:00', 6, 'one', 4, 'new');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` varchar(128) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(256) NOT NULL,
  `phoneNumber` varchar(16) NOT NULL,
  `gender` varchar(16) NOT NULL,
  `mail` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `password`, `name`, `phoneNumber`, `gender`, `mail`) VALUES
('1', 'nothing', 'NorthWest', '1234567890', 'male', 'some@gmail.com'),
('919531357', 'something', 'Swetha Gajam', '7852369410', 'female', 'swetha.gajam@gmail.com'),
('bearcat', 'bearcat', 'BearCat', '9191234567', 'female', 'bearcat@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sourceId` (`sourceId`),
  ADD KEY `destinationId` (`destinationId`),
  ADD KEY `driverId` (`driverId`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`sourceId`) REFERENCES `places` (`id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`destinationId`) REFERENCES `places` (`id`),
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`driverId`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `schedules_ibfk_4` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
