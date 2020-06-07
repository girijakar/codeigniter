-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2019 at 03:46 PM
-- Server version: 5.7.22
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ciblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `create_date`) VALUES
(1, 1, 'Bussiness', '2018-10-13 11:52:16'),
(3, 3, 'Physics', '2018-10-13 19:56:23'),
(4, 4, 'Maths', '2018-10-14 06:30:44'),
(5, 2, 'food', '2018-10-14 13:27:49'),
(6, 2, 'technology', '2018-10-14 13:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `email`, `body`, `created_at`) VALUES
(1, 23, 'Girija Nandan', 'abc@.com', 'This is test', '2018-10-13 21:31:56'),
(2, 23, 'Ram Kar', 'kargirijanandan@gmail.com', 'Thank you', '2018-10-13 21:39:59'),
(3, 24, 'Girija Nandan', 'abc@.com', 'tettetqtqt', '2018-10-14 06:32:19'),
(4, 28, 'Girija Nandan', 'kargirijanandan@gmail.com', 'Wonderful Post', '2018-12-04 16:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `post_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `body`, `post_image`, `created_at`) VALUES
(1, 1, 0, 'LearnMantra', 'post-I', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '', '2018-10-12 17:24:52'),
(20, 2, 0, 'POST three', 'POST-three', '<p>i</p>\r\n', 'noimage.jpg', '2018-10-13 14:15:19'),
(23, 2, 1, 'girija kar', 'girija-kar', '<p>lkjdfkjglkjjg</p>\r\n', 'IMG-20180221-WA0003.jpg', '2018-10-13 14:52:49'),
(24, 4, 0, 'math111', 'math111', '<p>chajrkjwhrkhjwkrhwhkrkwjebrkj</p>\r\n', 'Capture12.PNG', '2018-10-14 06:31:26'),
(25, 1, 1, 'Mantra -II', 'Mantra-II', 'fhbnv', 'IMG_20180114_211322_018.png', '2018-10-14 09:55:04'),
(26, 1, 2, 'Shyam', 'Shyam', 'sdasd', 'IMG_20180114_211322_018.png', '2018-10-14 09:58:43'),
(27, 2, 2, 'Shyam', 'Shyam', '<p>test</p>\r\n', 'IMG-20170605-WA0004.jpg', '2018-10-14 10:04:52'),
(28, 1, 2, 'Mantra-III', 'Mantra-III', '<p>Lorem Ipsum</p>\r\n', 'noimage.jpg', '2018-10-14 13:08:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `zipcode`, `email`, `username`, `password`, `register_date`) VALUES
(1, 'GNK', '14453453', 'sassd@sdf.com', 'Girija', 'e10adc3949ba59abbe56e057f20f883e', '2018-10-14 07:54:36'),
(2, 'Girija Nandan', '757001', 'girijagone@gmail.com', 'Shyam', '827ccb0eea8a706c4c34a16891f84e7b', '2018-10-14 09:28:58'),
(3, 'Girija Nandan', '757001', 'kargirijanandan@gmail.com', 'ShyamKar', '252a02a884a5fe1f9ac9328df605a27b', '2018-12-04 16:00:15'),
(4, '1234', '757001', 'abcd@gmail.com', 'Gand', '5a4cd850fc787d454416aa3a47580468', '2019-02-01 12:24:39'),
(5, 'Gkajd', '757001', 'fghj@gmail.com', 'B170087', 'ef709d35c4e0fa99ef459ba1f6d5ce48', '2019-07-25 13:45:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
