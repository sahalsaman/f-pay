-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 05:50 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fpay`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bank_reg`
--

CREATE TABLE `bank_reg` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(35) NOT NULL,
  `Ifsc_code` varchar(11) NOT NULL,
  `adress` varchar(40) NOT NULL,
  `Phone_no` varchar(15) NOT NULL,
  `E-mail` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank_reg`
--

INSERT INTO `bank_reg` (`id`, `bank_name`, `Ifsc_code`, `adress`, `Phone_no`, `E-mail`) VALUES
(1, 'SBI', 'SBI001475', 'mukkam', '985776225', 'sbimukkam@mail'),
(5, 'FEDERAL BANK', 'FDRL0001', '', '985642785', 'fdrlmkm@mail'),
(6, 'sbi mukkam', 'SBI001234', '', '741852963', 'sbimkm@mail');

-- --------------------------------------------------------

--
-- Table structure for table `bill_gen`
--

CREATE TABLE `bill_gen` (
  `bill_no` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(20) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `bill_amount` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_gen`
--

INSERT INTO `bill_gen` (`bill_no`, `shop_id`, `shop_name`, `user_name`, `bill_amount`) VALUES
(1, 0, 'kc', '', '100');

-- --------------------------------------------------------

--
-- Table structure for table `customer_bank`
--

CREATE TABLE `customer_bank` (
  `id` int(11) NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `mob_no` varchar(10) NOT NULL,
  `address` varchar(40) NOT NULL,
  `acc_no` varchar(30) NOT NULL,
  `upi_code` varchar(25) NOT NULL,
  `balance` decimal(15,0) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_bank`
--

INSERT INTO `customer_bank` (`id`, `full_name`, `mob_no`, `address`, `acc_no`, `upi_code`, `balance`, `bank_id`, `user_id`, `status`) VALUES
(1, 'sahal saman kc', '8547929822', 'cheruvadi', '999484645829', 'sahal@obu', '3900', 1, '3', ''),
(2, 'ashiq', '8281168310', 'kozhikode', '828116831000', 'ashiq@oby', '2400', 0, '1', ''),
(3, 'sarfras', '65465468', 'mukkam', '69864745654', 'sarafras@icic', '1490', 0, '2', ''),
(4, 'sajna', '9349740272', 'kunnamangalam', '852141452452', 'sajan@icici', '9170', 4, '4', ''),
(5, 'zakkiya', '655468568', 'mukkam', '989464565656', 'zakkiya@ab', '1050', 5, '6', ''),
(6, 'rohith krishna', '98465320', 'velliaduunn', '987465139', 'rohith@axis', '4990', 0, '5', '');

-- --------------------------------------------------------

--
-- Table structure for table `device_reg`
--

CREATE TABLE `device_reg` (
  `did` int(11) NOT NULL,
  `device_name` varchar(20) NOT NULL,
  `model_no` varchar(15) NOT NULL,
  `serial_no` varchar(15) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `device_reg`
--

INSERT INTO `device_reg` (`did`, `device_name`, `model_no`, `serial_no`, `status`) VALUES
(2, 'fpay with calculator', 'Fpay FC001', '001', 'approve'),
(3, 'fpay with billing', 'Fpay FB001', '001', 'approve'),
(5, 'fpay with atm', 'Fpay FA001', '001', 'approve'),
(7, 'fpay with UPI QR', 'Fpay QR001', '001', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `device_request`
--

CREATE TABLE `device_request` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(25) NOT NULL,
  `d_id` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `device_request`
--

INSERT INTO `device_request` (`id`, `shop_id`, `shop_name`, `d_id`, `status`) VALUES
(38, 10, 'kc', 1, 'reject'),
(39, 10, 'kt', 1, 'approved'),
(40, 10, 'kt', 5, 'approved'),
(41, 14, 'flipkart', 2, 'approved'),
(42, 14, 'flipkart', 7, 'reject'),
(43, 1, 'kc', 7, 'requested'),
(44, 1, 'kc', 3, 'approved'),
(45, 1, 'kc', 3, 'requested'),
(46, 15, 'freshly', 3, 'requested'),
(47, 15, 'freshly', 5, 'requested'),
(48, 16, 'lulu', 3, 'requested'),
(49, 1, 'kc', 2, 'requested');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-01-20 06:49:41.938653'),
(2, 'auth', '0001_initial', '2021-01-20 06:49:46.361219'),
(3, 'admin', '0001_initial', '2021-01-20 06:50:00.116796'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-20 06:50:03.899495'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-20 06:50:04.183834'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-20 06:50:06.175285'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-20 06:50:07.570900'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-01-20 06:50:07.777350'),
(9, 'auth', '0004_alter_user_username_opts', '2021-01-20 06:50:07.924153'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-01-20 06:50:09.365022'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-01-20 06:50:09.400925'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-20 06:50:09.460769'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-01-20 06:50:09.752027'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-20 06:50:09.969701'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-01-20 06:50:10.287886'),
(16, 'auth', '0011_update_proxy_permissions', '2021-01-20 06:50:10.350722'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-20 06:50:10.499127'),
(18, 'sessions', '0001_initial', '2021-01-20 06:50:11.518735');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9h5cu3hb6c8v7ohkru6dontyggbckda1', 'eyJ1c2VyX2lkIjowfQ:1lErBp:w1lVU8pb0pduy9wc7SK81rlR-geMk3jXKm4qUYJHsOc', '2021-03-10 10:14:41.834648'),
('gx26yrvxns5dmgxe0r0x1ery08h3t2ig', 'eyJ1c2VyX2lkIjo1fQ:1lXgZF:SG5IxH0FFz4lV2YLthgPFeQ3LqYkbYiEIxtLV3ARLEE', '2021-05-01 08:44:41.147579'),
('ki2facvswxub7m2s3out5y75kwjtjxs2', 'eyJ1c2VyX2lkIjoxfQ:1m3ZF9:GD7b6fQIVmZMDuFdr9AldAd25HGildjA8C_c_BNi69g', '2021-07-28 07:23:43.390583');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `log_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `user_name`, `password`, `type`, `user_id`) VALUES
(4, 'admin', 'admin', 'admin', 0),
(5, 'abcd', '0000', 'user', 3),
(6, 'abcd', '0000', 'bank', 4),
(8, 'kccvd', '1234', 'shop', 9),
(10, 'fdrlmkm', '9876', 'bank', 5),
(11, 'sajna', '123', 'user', 4),
(12, 'saran', '123', 'user', 6),
(16, 'flip', '123', 'shop', 14),
(17, 'kc', '12', 'shop', 1),
(18, '', '', 'user', 7),
(19, 'sasd', '1234', 'user', 8),
(20, 'kiran', '12345', 'user', 9),
(21, 'junaid', '123', 'user', 10),
(22, 'freshly', '6543', 'shop', 15),
(23, 'lulu', '1234', 'shop', 16),
(24, 'sbimkm', '9876', 'bank', 6);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `user_id` int(25) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `shop_id`, `user_name`, `amount`, `status`) VALUES
(1, 3, 1, 'sahal@obu', '1', 'Paid'),
(6, 3, 1, 'sahal@obu', '55', 'Paid'),
(7, 3, 1, 'sahal@obu', '150', 'Paid'),
(8, 3, 1, 'sahal@obu', '50', 'Paid'),
(9, 3, 1, 'sahal@obu', '12', 'Paid'),
(10, 3, 1, 'sahal@obu', '50', 'Paid'),
(11, 4, 1, 'sajan@icici', '500', 'Paid'),
(12, 0, 1, 'sahal@obu', '50', 'Paid'),
(13, 4, 1, 'sajan@icici', '60', 'Paid'),
(14, 3, 1, 'sahal@obu', '75', 'Paid'),
(15, 3, 1, 'sahal@obu', '25', 'Paid'),
(16, 3, 1, 'sahal@obu', '50', 'Paid'),
(17, 3, 1, 'sahal@obu', '50', 'Paid'),
(18, 3, 1, 'sahal@obu', '100', 'Paid'),
(19, 0, 1, 'rohith@axis', '10', 'Paid'),
(20, 4, 1, 'sajan@icici', '50', 'Paid'),
(21, 4, 1, 'sajan@icici', '120', 'Paid'),
(22, 4, 1, 'sajan@icici', '100', 'Paid'),
(23, 5, 1, 'zakkiya@ab', '50', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `shop_reg`
--

CREATE TABLE `shop_reg` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `shop_owner_name` varchar(20) NOT NULL,
  `mob_no` varchar(10) NOT NULL,
  `upi_code` varchar(20) NOT NULL,
  `amount` decimal(15,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_reg`
--

INSERT INTO `shop_reg` (`shop_id`, `shop_name`, `address`, `shop_owner_name`, `mob_no`, `upi_code`, `amount`) VALUES
(1, 'kc', 'cheruvadi', 'sahal', '8547929822', '8547929822@bbi', '1853'),
(2, 'mart', 'kozhikode', 'rohith', '985776225', 'rohith@obi', '540'),
(3, 'adnoc', 'mukkam', 'sarfras', '985473245', 'sarafu@icic', '50'),
(14, 'flipkart', 'kkd', 'sah', '84', 'iju', NULL),
(15, 'freshly', 'ckp', 'kcig', '321654987', '@freshly', NULL),
(16, 'lulu', 'mukkam', 'rohith', '852741963', 'lulumkm@sad', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_bank_details`
--

CREATE TABLE `user_bank_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_ifsc` varchar(25) NOT NULL,
  `upi_id` varchar(35) NOT NULL,
  `Finger_id` varchar(5) NOT NULL,
  `pin` varchar(10) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_bank_details`
--

INSERT INTO `user_bank_details` (`id`, `user_id`, `bank_ifsc`, `upi_id`, `Finger_id`, `pin`, `status`) VALUES
(1, 1, 'SBI004', 'ashiq@oby', '1', '1111', ''),
(2, 2, 'ICIC567', 'sarafras@icic', '2', '0000', ''),
(3, 3, 'FDRL001', 'sahal@obu', '3', '1234', ''),
(4, 4, 'FDRL008', 'sajan@icici', '4', '0000', ''),
(5, 6, 'FDRL001', 'zakkiya@ab', '5', '1111', ''),
(6, 5, 'SBI004', 'rohith@axis', '6', '9999', ''),
(7, 7, 'SBI004', 'abcd@123', '7', '9999', ''),
(8, 8, 'SBI004', 'abcd@123', '8', '9999', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_reg`
--

CREATE TABLE `user_reg` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `mob_no` varchar(10) NOT NULL,
  `address` text NOT NULL,
  `status` varchar(15) NOT NULL,
  `Fingerprint` varchar(50) NOT NULL,
  `pin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_reg`
--

INSERT INTO `user_reg` (`user_id`, `user_name`, `mob_no`, `address`, `status`, `Fingerprint`, `pin`) VALUES
(1, 'kc bazar', '656676435', 'mukkam', 'reject', '', ''),
(2, 'sarfras', '123456789', 'kerala', 'approve', '', '2233'),
(3, 'sahal saman', '854765154', 'kozhikode', 'approve', '', '1111'),
(4, 'sajna', '6544654654', 'kunnamangalam', 'approve', '', '123'),
(5, 'rohith', '987458421', 'vellimadukunn', 'approve', '', '123'),
(6, 'Zakkiya', '8574235478', 'mukkam', 'reject', '', '123'),
(9, 'kiran', '7510840046', '', 'pending', '', '12345'),
(10, 'junaid', '12345678', '', 'pending', '', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `bank_reg`
--
ALTER TABLE `bank_reg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_gen`
--
ALTER TABLE `bill_gen`
  ADD PRIMARY KEY (`bill_no`);

--
-- Indexes for table `customer_bank`
--
ALTER TABLE `customer_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_reg`
--
ALTER TABLE `device_reg`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `device_request`
--
ALTER TABLE `device_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_reg`
--
ALTER TABLE `shop_reg`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `user_bank_details`
--
ALTER TABLE `user_bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_reg`
--
ALTER TABLE `user_reg`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_reg`
--
ALTER TABLE `bank_reg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bill_gen`
--
ALTER TABLE `bill_gen`
  MODIFY `bill_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_bank`
--
ALTER TABLE `customer_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `device_reg`
--
ALTER TABLE `device_reg`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `device_request`
--
ALTER TABLE `device_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `shop_reg`
--
ALTER TABLE `shop_reg`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_bank_details`
--
ALTER TABLE `user_bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_reg`
--
ALTER TABLE `user_reg`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
