-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2023 at 01:12 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cara`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Pantes'),
(2, 'Skirt'),
(3, 'Shorts'),
(4, 'Shirt');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `userID`) VALUES
(6, 10),
(8, 10),
(7, 13);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `imgPath` varchar(255) NOT NULL,
  `catID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `price`, `quantity`, `desc`, `imgPath`, `catID`) VALUES
(4, 'Nike', 360, 10, 'Skirt', '64df81eb0d6ed.jpg', 2),
(5, 'Adidas', 450, 10, 'Adidas Shorts', '64df820bc5638.jpg', 3),
(6, 'Puma', 440, 10, 'Shirt', '64df82bfe6ae4.jpg', 3),
(7, 'Puma', 500, 10, 'Shirt', '64df82ed619fe.jpg', 4),
(8, 'Puma', 500, 10, 'Shirt', '64df8303af4ff.jpg', 4),
(9, 'Adidas', 500, 10, 'Adidas Pantes', '64df8326b6619.jpg', 1),
(10, 'Adidas', 222, 10, 'Shirt', '64df8b945b37d.jpg', 4),
(11, 'Nike', 500, 10, 'Adidas Pantes', '64df8bb3d23c5.jpg', 3),
(12, 'Nike', 500, 10, 'amazing clothis', '64df8bd7b5814.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `invoiceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `itemID`, `userID`, `price`, `quantity`, `orderDateTime`, `invoiceID`) VALUES
(1, 5, 10, 450, 1, '2023-08-21 03:44:38', 6),
(2, 5, 13, 450, 1, '2023-08-21 03:58:19', 7),
(3, 7, 13, 500, 1, '2023-08-21 03:58:19', 7),
(4, 4, 10, 360, 2, '2023-08-21 14:24:56', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `admin` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `password`, `address`, `admin`) VALUES
(9, 'Mustafa', 'must@a.com', '09123456543', '$2y$10$b9ijLX9bNi5hd0Zp4CUgRubSSKyd8OB8014aai2JQF.WvuiSubOMm', 'cairoo', 1),
(10, 'Ahmed', 'Ahmed@a.com', '01234567890', '$2y$10$KATUHyWMKR11LDLYwsvoNON2S8wYr3EXqImoauZoLfD/KY0XFRKdW', 'cairoo', 0),
(13, 'Mustafa', 'mustafa@m.com', '09123456543', '$2y$10$CsvcQr1WDGmkqu4RkidVv.clWjzu8ZXAFMUIGsEv9iDzlZ78mBh4y', 'cairoo', 0),
(14, 'Mustafa', 'mh8733091@gmail.com', '0132345678', '$2y$10$rkFSVD44y0IhT6kr1ANdFOXlDIvmtH3x58vEYQs.6J1P2S42jmYV2', 'cairo', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_item` (`catID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `invoiceID` (`invoiceID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_item` FOREIGN KEY (`itemID`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `cart_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `cat_item` FOREIGN KEY (`catID`) REFERENCES `category` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_itme` FOREIGN KEY (`itemID`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`invoiceID`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
