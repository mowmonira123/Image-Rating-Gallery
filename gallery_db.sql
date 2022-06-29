-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2022 at 06:23 PM
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
-- Database: `gallery_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `album_list`
--

CREATE TABLE `album_list` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(225) NOT NULL,
  `user_id` int(30) NOT NULL,
  `delete_f` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `album_list`
--

INSERT INTO `album_list` (`id`, `name`, `slug`, `user_id`, `delete_f`, `date_created`, `date_updated`) VALUES
(1, 'Avatars', '', 1, 0, '2021-08-09 10:23:50', '2021-08-09 13:09:06'),
(4, 'Album 104', '', 1, 0, '2021-08-09 11:16:33', NULL),
(9, 'rate', '', 1, 0, '2022-04-22 15:34:37', NULL),
(11, 'happy', '', 1, 0, '2022-06-29 21:36:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(30) NOT NULL,
  `album_id` int(30) NOT NULL,
  `original_name` text NOT NULL,
  `rate` tinyint(5) NOT NULL,
  `path_name` text NOT NULL,
  `delete_f` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `album_id`, `original_name`, `rate`, `path_name`, `delete_f`, `user_id`, `date_created`, `date_updated`) VALUES
(17, 1, 'kol.jpg', 4, 'uploads/user_1/album_1/1650122820.jpg', 0, 1, '2022-04-16 21:27:54', '2022-06-29 21:20:47'),
(20, 4, 'flower.jpg', 2, 'uploads/user_1/album_4/1650568020.jpg', 0, 1, '2022-04-22 01:07:16', '2022-05-10 00:18:03'),
(25, 1, 'img.jpg', 1, 'uploads/user_1/album_1/1650918060.jpg', 0, 1, '2022-04-26 02:21:37', '2022-05-10 01:30:31'),
(27, 9, 'self care', 4, 'uploads/user_1/album_9/1650918360.jpg', 0, 1, '2022-04-26 02:26:21', '2022-06-29 21:20:10'),
(28, 9, 'a', 1, 'uploads/user_1/album_9/1650918540.jpg', 0, 1, '2022-04-26 02:29:48', '2022-05-10 00:22:39'),
(32, 11, 'work.jpg', 0, 'uploads/user_1/album_11/1656517140.jpg', 0, 1, '2022-06-29 21:39:42', '2022-06-29 21:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `image_rating`
--

CREATE TABLE `image_rating` (
  `id` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Image Gallery'),
(6, 'short_name', 'Gallery'),
(11, 'logo', 'uploads/gallery.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'uploads/1624240500_avatar.png', NULL, 1, '2022-04-15 14:02:37', '2022-04-17 12:39:55'),
(10, 'Aaa', 'bb', 'aaa bb', '202cb962ac59075b964b07152d234b70', 'uploads/1650605700_flower.jpg', NULL, 0, '2022-04-22 11:35:33', '2022-04-22 11:42:59'),
(11, '', '', '', '', NULL, NULL, 0, '2022-04-26 21:26:19', NULL),
(12, 'binty', 'rahman', 'mow', '202cb962ac59075b964b07152d234b70', NULL, NULL, 0, '2022-04-26 21:30:36', NULL),
(13, '100', '00', '100', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, 0, '2022-05-10 00:23:41', NULL),
(14, 'monira', 'moww', 'm1', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 0, '2022-06-29 21:25:56', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album_list`
--
ALTER TABLE `album_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_rating`
--
ALTER TABLE `image_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album_list`
--
ALTER TABLE `album_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `image_rating`
--
ALTER TABLE `image_rating`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
