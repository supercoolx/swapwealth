-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2021 at 09:07 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `localcoins`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '6167d3250939e1634194213.jpg', '$2y$10$2qcOUKrDIUqyyCklvHp7IO8fGNcJ1gAXtxouTn1isZPHu6H8CfHPq', NULL, '2021-10-14 06:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL COMMENT 'Buy:1, Sell:2',
  `crypto_id` int(10) UNSIGNED NOT NULL,
  `fiat_gateway_id` int(10) UNSIGNED NOT NULL,
  `fiat_id` int(10) UNSIGNED NOT NULL,
  `margin` decimal(5,2) NOT NULL DEFAULT 0.00,
  `window` int(10) UNSIGNED NOT NULL,
  `min` decimal(28,8) NOT NULL,
  `max` decimal(28,8) NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trade_request_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cryptos`
--

CREATE TABLE `cryptos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(28,8) NOT NULL,
  `dc_fixed` decimal(18,8) NOT NULL,
  `dc_percent` decimal(5,2) NOT NULL,
  `wc_fixed` decimal(18,8) NOT NULL,
  `wc_percent` decimal(5,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Active:1, Deactive:0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `crypto_id` int(10) UNSIGNED NOT NULL,
  `wallet_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `cp_trx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_logs`
--

CREATE TABLE `email_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `mail_sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-06 00:49:06'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-07 10:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address.<br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 23:04:05', '2021-01-03 23:35:10'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 23:04:05', '2020-03-08 01:28:52'),
(5, '2FA_ENABLE', 'Google Two Factor - Enable', 'Google Two Factor Authentication is now  Enabled for Your Account', '<div>You just enabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Enabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Your verification code is: {{code}}', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:42:59'),
(6, '2FA_DISABLE', 'Google Two Factor Disable', 'Google Two Factor Authentication is now  Disabled for Your Account', '<div>You just Disabled Google Two Factor Authentication for Your Account.</div><div><br></div><div>Disabled at <b>{{time}} </b>From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div>', 'Google two factor verification is disabled', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 23:04:05', '2020-03-08 01:43:46'),
(16, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-08 18:00:00', '2020-05-04 02:24:40'),
(206, 'DEPOSIT_COMPLETE', 'Automated Deposit - Successful', 'Deposit Completed Successfully', '<div>Your deposit of <b>{{amount}} {{currency}}</b><b>&nbsp;</b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your Deposit :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Payable : {{payable}} {{currency}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><b><br></b></font></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br></div>', 'Your deposit of {{amount}} {{currency}} has been completed Successfully.\r\n\r\nDetails of your Deposit :\r\n\r\nAmount : {{amount}} {{currency}}\r\nCharge: {{charge}} {{currency}}\r\n\r\nPayable : {{payable}} {{currency}}\r\n\r\nTransaction Number : {{trx}}\r\n\r\nYour current Balance is {{post_balance}} {{currency}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Crypto Currency\",\"payable\":\"Amount After Charge\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-24 18:00:00', '2021-10-21 04:12:15'),
(210, 'WITHDRAW_REQUEST', 'Withdraw  - User Requested', 'Withdraw Request Submitted Successfully', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp;has been submitted Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>You will get: {{payable}} {{currency}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><font size=\"5\">Your current Balance is <b>{{post_balance}} {{currency}}</b></font></div><div><br></div><div><br><br><br><br></div>', 'Your withdraw request of {{amount}} {{currency}} has been submitted Successfully.\r\n\r\nDetails of your withdraw:\r\n\r\nAmount : {{amount}} {{currency}}\r\nCharge: {{charge}} {{currency}}\r\n\r\nYou will get: {{payable}} {{currency}}\r\n\r\nTransaction Number : {{trx}}\r\n\r\nYour current Balance is {{post_balance}} {{currency}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Crypto Currency\",\"payable\":\"Amount After Charge\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2020-06-07 18:00:00', '2021-10-20 08:53:11'),
(211, 'WITHDRAW_REJECT', 'Withdraw - Admin Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp;<b>&nbsp;</b>has been Rejected.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>You should get:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">{{payable}} {{currency}}</span></div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div>----</div><div><font size=\"3\"><br></font></div><div><font size=\"3\"> {{amount}} {{currency}} has been <b>refunded </b>to your account and your current Balance is <b>{{post_balance}}</b><b> {{currency}}</b></font></div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Rejection :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br><br></div>', 'Your withdraw request of {{amount}} {{currency}}  has been Rejected.\r\n\r\nDetails of your withdraw:\r\n\r\nAmount : {{amount}} {{currency}}\r\nCharge: {{charge}} {{currency}}\r\n\r\nYou should get: {{payable}} {{currency}}\r\n\r\nTransaction Number : {{trx}}\r\n\r\n{{amount}} {{currency}} has been refunded to your account and your current Balance is {{post_balance}} {{currency}}\r\n\r\nDetails of Rejection :\r\n{{admin_details}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Crypto Currency\",\"payable\":\"Amount After Charge\",\"post_balance\":\"Current Balance After This Operation\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-09 18:00:00', '2021-10-20 10:57:03'),
(212, 'WITHDRAW_APPROVE', 'Withdraw - Admin  Approved', 'Withdraw Request has been Processed and your money is sent', '<div>Your withdraw request of <b>{{amount}} {{currency}}</b>&nbsp;<b>&nbsp;</b>has been Processed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of your withdraw:<br></b></div><div><br></div><div><div>Amount : {{amount}} {{currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>You will get: {{payable}} {{currency}}</div><div><br></div><div>Transaction Number : {{trx}}</div></div><div><br></div><div>-----</div><div><br></div><div><font size=\"4\">Details of Processed Payment :</font></div><div><font size=\"4\"><b>{{admin_details}}</b></font></div><div><br></div><div><br><br><br><br><br></div>', 'Your withdraw request of {{amount}} {{currency}}  has been Processed Successfully.\r\n\r\nDetails of your withdraw:\r\n\r\nAmount : {{amount}} {{currency}}\r\nCharge: {{charge}} {{currency}}\r\n\r\nYou will get: {{payable}} {{currency}}\r\n\r\nTransaction Number : {{trx}}\r\n\r\nDetails of Processed Payment :\r\n{{admin_details}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Crypto Currency\",\"payable\":\"Amount After Charge\", \"admin_details\":\"Details Provided By Admin\"}', 1, 1, '2020-06-10 18:00:00', '2021-10-20 10:22:30'),
(215, 'BAL_ADD', 'Balance Add by Admin', 'Your Account has been Credited', '<div>{{amount}} {{currency}} has been added to your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}&nbsp;</b></font>', '{{amount}} {{currency}} credited in your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2021-01-06 00:46:18'),
(216, 'BAL_SUB', 'Balance Subtracted by Admin', 'Your Account has been Debited', '<div>{{amount}} {{currency}} has been subtracted from your account .</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div>Your Current Balance is : <font size=\"3\"><b>{{post_balance}}&nbsp; {{currency}}</b></font>', '{{amount}} {{currency}} debited from your account. Your Current Balance {{remaining_balance}} {{currency}} . Transaction: #{{trx}}', '{\"trx\":\"Transaction Number\",\"amount\":\"Request Amount By Admin\",\"currency\":\"Site Currency\", \"post_balance\":\"Users Balance After this operation\"}', 1, 1, '2019-09-14 19:14:22', '2019-11-10 09:07:12'),
(217, 'NEW_TRADE', 'New Trade Request', 'You Have A New Trade Request', '<div>You have a new trade request<span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">.</span></div><div><br></div><font size=\"3\"><b>Trade Information :</b></font><div><font size=\"3\"><b><br></b></font></div><div><span style=\"color: rgb(33, 37, 41);\">Buyer : {{buyer}}</span><font size=\"3\"><b><br></b></font></div><div><span style=\"color: rgb(33, 37, 41);\">Seller : {{seller}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Amount : {{fiat_amount}} {{fiat_currency}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">{{crypto_currency}} : {{crypto_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Payment Window : {{window}} Minutes</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div>', 'You have a new trade request.\r\n\r\nTrade Information :\r\n\r\nBuyer : {{buyer}}\r\nSeller : {{seller}}\r\nAmount : {{fiat_amount}} {{fiat_currency}}\r\n{{crypto_currency}} : {{crypto_amount}}\r\nPayment Window : {{window}} Minutes', '{\"buyer\":\"Buyer Name\",\"seller\":\"Seller Name\",\"fiat_amount\":\"Amount In Fiat Currency\",\"fiat_currency\":\"Fiat Currency\",\"crypto_amount\":\"Amount In Crypto Currency\", \"crypto_currency\":\"Crypto Currency\",\"window\":\"Payment Window\"}', 1, 1, '2019-09-14 19:14:22', '2021-10-17 05:51:56'),
(218, 'BUYER_PAID', 'Your Buyer Has Paid', 'Your Buyer Has Already Paid', '<div>Your buyer has paid you {{fiat_amount}} {{fiat_currency}}.</div><div><br></div><div><span style=\"font-weight: bolder;\">Trade Information :</span><div><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Buyer : {{buyer}}</span><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Seller : {{seller}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Amount : {{fiat_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">{{crypto_currency}} : {{crypto_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Payment Window : {{window}} Minutes</span></div></div><div><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div>If you got this then release this trade.</div>', 'Your buyer has paid you {{fiat_amount}} {{fiat_currency}}.\r\n\r\nTrade Information :\r\n\r\nBuyer : {{buyer}}\r\nSeller : {{seller}}\r\nAmount : {{fiat_amount}}\r\n{{crypto_currency}} : {{crypto_amount}}\r\nPayment Window : {{window}} Minutes\r\n\r\nIf you got this then release this trade.', '{\"buyer\":\"Buyer Name\",\"seller\":\"Seller Name\",\"fiat_amount\":\"Amount In Fiat Currency\",\"crypto_amount\":\"Amount In Crypto Currency\", \"crypto_currency\":\"Crypto Currency\",\"window\":\"Payment Window\"}', 1, 1, '2019-09-14 19:14:22', '2021-10-17 05:53:30'),
(219, 'TRADE_REPORTED', 'Trade Is Reported', 'Your Trade Request Is Reported', '<div>Your trade request is reported by&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: bolder;\">{{name}}</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">&nbsp;.</span></div><div><br></div><div>Wait for the system response.&nbsp;</div><div><br></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">Trade Information :</span><br><div><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Buyer : {{buyer}}</span><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Seller : {{seller}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Amount : {{fiat_amount}} {{fiat_currency}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">{{crypto_currency}} : {{crypto_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Payment Window : {{window}} Minutes</span></div></div>', 'Your trade request is reported by {{name}} .\r\n\r\nWait for the system response. \r\n\r\nTrade Information :\r\n\r\nBuyer : {{buyer}}\r\nSeller : {{seller}}\r\nAmount : {{fiat_amount}} {{fiat_currency}}\r\n{{crypto_currency}} : {{crypto_amount}}\r\nPayment Window : {{window}} Minutes', '{\"name\":\"Reporter Name\",\"buyer\":\"Buyer Name\",\"seller\":\"Seller Name\",\"fiat_amount\":\"Amount In Fiat Currency\",\"fiat_currency\":\"Fiat Currency\",\"crypto_amount\":\"Amount In Crypto Currency\", \"crypto_currency\":\"Crypto Currency\",\"window\":\"Payment Window\"}', 1, 1, '2019-09-14 19:14:22', '2021-10-17 06:15:18'),
(220, 'TRADE_CANCELED', 'Trade Is Canceled', 'Your Trade Request Is Canceled', '<div>This trade is canceled by <span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: bolder;\">{{name}}</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">.</span></div><div><br></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{crypto_amount}} {{crypto_currency}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">returned to the seller wallet.</span></div><div><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">Trade Information :</span><br><div><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Buyer : {{buyer}}</span><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Seller : {{seller}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Amount : {{fiat_amount}} {{fiat_currency}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">{{crypto_currency}} : {{crypto_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Payment Window : {{window}} Minutes</span></div></div>', 'This trade is canceled by {{name}}.\r\n\r\n{{crypto_amount}} {{crypto_currency}} returned to the seller wallet.\r\n\r\nTrade Information :\r\n\r\nBuyer : {{buyer}}\r\nSeller : {{seller}}\r\nAmount : {{fiat_amount}} {{fiat_currency}}\r\n{{crypto_currency}} : {{crypto_amount}}\r\nPayment Window : {{window}} Minutes', '{\"name\":\"Canceller Name\",\"buyer\":\"Buyer Name\",\"seller\":\"Seller Name\",\"fiat_amount\":\"Amount In Fiat Currency\",\"fiat_currency\":\"Fiat Currency\",\"crypto_amount\":\"Amount In Crypto Currency\", \"crypto_currency\":\"Crypto Currency\",\"window\":\"Payment Window\"}', 1, 1, '2019-09-14 19:14:22', '2021-10-17 05:59:38'),
(221, 'TRADE_COMPLETED', 'Trade Is Completed', 'Your Trade Request Is Completed', '<div>Trade request is completed.</div><div><br></div><div><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">Buyer named </span><span style=\"font-weight: bolder; color: rgb(33, 37, 41); font-size: medium;\">{{name}}</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">&nbsp;received&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{crypto_amount}} {{crypto_currency}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">successfully.</span><br></div><div><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">Trade Information :</span><br><div><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Buyer : {{buyer}}</span><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Seller : {{seller}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Amount : {{fiat_amount}} {{fiat_currency}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">{{crypto_currency}} : {{crypto_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Payment Window : {{window}} Minutes</span></div></div><div><br></div>', 'Trade request is completed.\r\n\r\nBuyer named {{name}} received {{crypto_amount}} {{crypto_currency}} successfully.\r\n\r\nTrade Information :\r\n\r\nBuyer : {{buyer}}\r\nSeller : {{seller}}\r\nAmount : {{fiat_amount}} {{fiat_currency}}\r\n{{crypto_currency}} : {{crypto_amount}}\r\nPayment Window : {{window}} Minutes', '{\"name\":\"Buyer Name\",\"buyer\":\"Buyer Name\",\"seller\":\"Seller Name\",\"fiat_amount\":\"Amount In Fiat Currency\",\"fiat_currency\":\"Fiat Currency\",\"crypto_amount\":\"Amount In Crypto Currency\", \"crypto_currency\":\"Crypto Currency\",\"window\":\"Payment Window\"}', 1, 1, '2019-09-14 19:14:22', '2021-10-17 06:01:56'),
(222, 'TRADE_SETTLED', 'Trade Is Settled By System', 'Your Reported Trade Request Is Settled By System', '<div>This reported trade is reviewed by system.</div><div><br></div><div><span style=\"font-weight: bolder; color: rgb(33, 37, 41); font-size: medium;\">{{name}}&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">received&nbsp;</span><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">{{crypto_amount}} {{crypto_currency}}.</span></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\"><br></span></div><div><span style=\"color: rgb(33, 37, 41); font-size: medium; font-weight: 700;\">Trade Information :</span><br><div><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Buyer : {{buyer}}</span><font size=\"3\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><span style=\"color: rgb(33, 37, 41);\">Seller : {{seller}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Amount : {{fiat_amount}} {{fiat_currency}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">{{crypto_currency}} : {{crypto_amount}}</span><span style=\"color: rgb(33, 37, 41);\"><br></span></div><div><span style=\"color: rgb(33, 37, 41);\">Payment Window : {{window}} Minutes</span></div></div>', 'This reported trade is reviewed by system.\r\n\r\n{{name}} received {{crypto_amount}} {{crypto_currency}}.\r\n\r\nTrade Information :\r\n\r\nBuyer : {{buyer}}\r\nSeller : {{seller}}\r\nAmount : {{fiat_amount}} {{fiat_currency}}\r\n{{crypto_currency}} : {{crypto_amount}}\r\nPayment Window : {{window}} Minutes', '{\"name\":\"Winner Name\",\"buyer\":\"Buyer Name\",\"seller\":\"Seller Name\",\"fiat_amount\":\"Amount In Fiat Currency\",\"fiat_currency\":\"Fiat Currency\",\"crypto_amount\":\"Amount In Crypto Currency\", \"crypto_currency\":\"Crypto Currency\",\"window\":\"Payment Window\"}', 1, 1, '2019-09-14 19:14:22', '2021-10-17 06:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2021-10-02 10:10:27'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"sitekey\":{\"title\":\"Site Key\",\"value\":\"6Lfpm3cUAAAAAGIjbEJKhJNKS4X1Gns9ANjh8MfH\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2021-10-28 06:29:40'),
(3, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 1, NULL, '2019-10-18 23:16:05', '2021-10-02 10:03:47'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, NULL, '2021-05-04 10:19:12');

-- --------------------------------------------------------

--
-- Table structure for table `fiats`
--

CREATE TABLE `fiats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(28,8) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiat_gateways`
--

CREATE TABLE `fiat_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"crypto\",\"cryptocurrency\",\"crytocurrencies\",\"exchange\",\"cryptoexchange\",\"bitcoin\",\"etherium\"],\"description\":\"Localcoins is a p2p crypto exchange marketplace where people can trade crypto directly with each other.\",\"social_title\":\"Localcoins\",\"social_description\":\"Localcoins is a p2p crypto exchange marketplace where people can trade crypto directly with each other.\",\"image\":\"618a21e06e1781636442592.png\"}', '2020-07-04 23:42:52', '2021-11-09 07:33:34'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"lab la-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', '2020-11-12 04:07:30', '2021-10-02 09:08:13'),
(39, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Exchange your cryptocurrencies\",\"sub_heading\":\"Localcoins is a p2p crypto exchange marketplace where people can trade crypto directly with each other.\",\"button_one_text\":\"Login\",\"button_one_url\":\"login\",\"button_two_text\":\"Register\",\"button_two_url\":\"register\",\"form_header\":\"Find Your Offers\",\"form_button_text\":\"Find Offers\",\"image\":\"617a7adc156e21635416796.jpg\"}', '2021-05-02 06:09:30', '2021-11-09 06:52:54'),
(41, 'cookie.data', '{\"link\":\"\\/localcoins-final\\/policy\\/privacy-policy\\/42\",\"description\":\"<font face=\\\"Exo, sans-serif\\\"><font color=\\\"#000033\\\"><span style=\\\"font-size: 18px;\\\">We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.<\\/span><\\/font><\\/font><br>\",\"status\":1}', '2020-07-04 23:42:52', '2021-11-03 12:50:56'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How do we protect your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">All provided delicate\\/credit data is sent through Stripe.<br \\/>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Do we disclose any information to outside parties?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Children\'s Online Privacy Protection Act Compliance<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Changes to our Privacy Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">How long we retain your information?<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">What we don\\u2019t do with your data<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/p><\\/div>\"}', '2021-06-09 08:50:42', '2021-06-09 08:50:42'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We claim all authority to dismiss, end, or handicap any help with or without cause per administrator discretion. This is a Complete independent facilitating, on the off chance that you misuse our ticket or Livechat or emotionally supportive network by submitting solicitations or protests we will impair your record. The solitary time you should reach us about the seaward facilitating is if there is an issue with the worker. We have not many substance limitations and everything is as per laws and guidelines. Try not to join on the off chance that you intend to do anything contrary to the guidelines, we do check these things and we will know, don\'t burn through our own and your time by joining on the off chance that you figure you will have the option to sneak by us and break the terms.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Configuration requests - If you have a fully managed dedicated server with us then we offer custom PHP\\/MySQL configurations, firewalls for dedicated IPs, DNS, and httpd configurations.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Software requests - Cpanel Extension Installation will be granted as long as it does not interfere with the security, stability, and performance of other users on the server.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Emergency Support - We do not provide emergency support \\/ Phone Support \\/ LiveChat Support. Support may take some hours sometimes.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Webmaster help - We do not offer any support for webmaster related issues and difficulty including coding, &amp; installs, Error solving. if there is an issue where a library or configuration of the server then we can help you if it\'s possible from our end.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Backups - We keep backups but we are not responsible for data loss, you are fully responsible for all backups.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">We Don\'t support any child porn or such material.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No spam-related sites or material, such as email lists, mass mail programs, and scripts, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No harassing material that may cause people to retaliate against you.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No phishing pages.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">You may not run any exploitation script from the server. reason can be terminated immediately.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">If Anyone attempting to hack or exploit the server by using your script or hosting, we will terminate your account to keep safe other users.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious Botnets are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Spam, mass mailing, or email marketing in any way are strictly forbidden here.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Malicious hacking materials, trojans, viruses, &amp; malicious bots running or for download are forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Resource and cronjob abuse is forbidden and will result in suspension or termination.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Php\\/CGI proxies are strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">CGI-IRC is strictly forbidden.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">No fake or disposal mailers, mass mailing, mail bombers, SMS bombers, etc.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">NO CREDIT OR REFUND will be granted for interruptions of service, due to User Agreement violations.<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Terms &amp; Conditions for Users<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Before getting to this site, you are consenting to be limited by these site Terms and Conditions of Use, every single appropriate law, and guidelines, and concur that you are answerable for consistency with any material neighborhood laws. If you disagree with any of these terms, you are restricted from utilizing or getting to this site.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Support<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">Whenever you have downloaded our item, you may get in touch with us for help through email and we will give a valiant effort to determine your issue. We will attempt to answer using the Email for more modest bug fixes, after which we will refresh the center bundle. Content help is offered to confirmed clients by Tickets as it were. Backing demands made by email and Livechat.<\\/p><p class=\\\"my-3 font-18 font-weight-bold\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">On the off chance that your help requires extra adjustment of the System, at that point, you have two alternatives:<\\/p><ul class=\\\"font-18\\\" style=\\\"padding-left:15px;list-style-type:disc;font-size:18px;\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Hang tight for additional update discharge.<\\/li><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;\\\">Or on the other hand, enlist a specialist (We offer customization for extra charges).<\\/li><\\/ul><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Ownership<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not guarantee scholarly or selective possession of any of our items, altered or unmodified. All items are property, we created them. Our items are given \\\"with no guarantees\\\" without guarantee of any sort, either communicated or suggested. On no occasion will our juridical individual be subject to any harms including, however not restricted to, immediate, roundabout, extraordinary, accidental, or significant harms or different misfortunes emerging out of the utilization of or powerlessness to utilize our items.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Warranty<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We don\'t offer any guarantee or assurance of these Services in any way. When our Services have been modified we can\'t ensure they will work with all outsider plugins, modules, or internet browsers. Program similarity ought to be tried against the show formats on the demo worker. If you don\'t mind guarantee that the programs you use will work with the component, as we can not ensure that our systems will work with all program mixes.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Unauthorized\\/Illegal Usage<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">You may not utilize our things for any illicit or unapproved reason or may you, in the utilization of the stage, disregard any laws in your locale (counting yet not restricted to copyright laws) just as the laws of your nation and International law. Specifically, it is disallowed to utilize the things on our foundation for pages that advance: brutality, illegal intimidation, hard sexual entertainment, bigotry, obscenity content or warez programming joins.<br \\/><br \\/>You can\'t imitate, copy, duplicate, sell, exchange or adventure any of our segment, utilization of the offered on our things, or admittance to the administration without the express composed consent by us or item proprietor.<br \\/><br \\/>Our Members are liable for all substance posted on the discussion and demo and movement that happens under your record.<br \\/><br \\/>We hold the chance of hindering your participation account quickly if we will think about a particularly not allowed conduct.<br \\/><br \\/>If you make a record on our site, you are liable for keeping up the security of your record, and you are completely answerable for all exercises that happen under the record and some other activities taken regarding the record. You should quickly inform us, of any unapproved employments of your record or some other penetrates of security.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Fiverr, Seoclerks Sellers Or Affiliates<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We do NOT ensure full SEO campaign conveyance within 24 hours. We make no assurance for conveyance time by any means. We give our best assessment to orders during the putting in of requests, anyway, these are gauges. We won\'t be considered liable for loss of assets, negative surveys or you being prohibited for late conveyance. If you are selling on a site that requires time touchy outcomes, utilize Our SEO Services at your own risk.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Payment\\/Refund Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">No refund or cash back will be made. After a deposit has been finished, it is extremely unlikely to invert it. You should utilize your equilibrium on requests our administrations, Hosting, SEO campaign. You concur that once you complete a deposit, you won\'t document a debate or a chargeback against us in any way, shape, or form.<br \\/><br \\/>If you document a debate or chargeback against us after a deposit, we claim all authority to end every single future request, prohibit you from our site. False action, for example, utilizing unapproved or taken charge cards will prompt the end of your record. There are no special cases.<\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"color:rgb(111,111,111);font-family:Nunito, sans-serif;margin-bottom:3rem;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight:600;line-height:1.3;font-size:24px;font-family:Exo, sans-serif;color:rgb(54,54,54);\\\">Free Balance \\/ Coupon Policy<\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right:0px;margin-left:0px;font-size:18px;\\\">We offer numerous approaches to get FREE Balance, Coupons and Deposit offers yet we generally reserve the privilege to audit it and deduct it from your record offset with any explanation we may it is a sort of misuse. If we choose to deduct a few or all of free Balance from your record balance, and your record balance becomes negative, at that point the record will naturally be suspended. If your record is suspended because of a negative Balance you can request to make a custom payment to settle your equilibrium to actuate your record.<\\/p><\\/div>\"}', '2021-06-09 08:51:18', '2021-06-09 08:51:18'),
(44, 'overview.element', '{\"details\":\"Best Bitcoin Platform\",\"icon\":\"<i class=\\\"las la-award\\\"><\\/i>\"}', '2021-10-02 05:36:31', '2021-10-02 05:36:31'),
(45, 'overview.element', '{\"details\":\"3M Happy Users\",\"icon\":\"<i class=\\\"las la-users\\\"><\\/i>\"}', '2021-10-02 05:37:16', '2021-10-02 05:37:16'),
(46, 'overview.element', '{\"details\":\"100% Secured\",\"icon\":\"<i class=\\\"las la-user-shield\\\"><\\/i>\"}', '2021-10-02 05:37:46', '2021-10-02 05:37:46'),
(47, 'overview.element', '{\"details\":\"24\\/7 Support\",\"icon\":\"<i class=\\\"las la-headset\\\"><\\/i>\"}', '2021-10-02 05:38:39', '2021-10-02 05:38:39'),
(48, 'buy.content', '{\"has_image\":\"1\",\"heading\":\"Buy Crypto Currencies\",\"sub_heading\":\"With a proven track record and a mature approach to the industry, we provide a reliable buying platform for cryptocurrencies.\",\"image\":\"61893c6b95ad61636383851.jpg\"}', '2021-10-02 06:01:45', '2021-11-09 06:07:11'),
(49, 'sell.content', '{\"heading\":\"Sell Crypto Currency\",\"sub_heading\":\"With a proven track record and a mature approach to the industry, we provide a reliable selling platform for cryptocurrency.\"}', '2021-10-02 06:02:06', '2021-11-09 06:36:04'),
(50, 'choose_us.content', '{\"has_image\":\"1\",\"heading\":\"Why People Choose Us\",\"sub_heading\":\"Earning the trust of our clients has always been our highest priority. We earn that trust through the best security in the business. Our platform provides world-class financial stability and the highest standards of legal compliance.\",\"image\":\"61893c87b050e1636383879.jpg\"}', '2021-10-02 06:03:29', '2021-11-09 05:55:55'),
(51, 'choose_us.element', '{\"has_image\":\"1\",\"heading\":\"Easy Access\",\"details\":\"It\'s a most reliable site and easy to access. We maintain a very simple login process and easy configuration for all the users.\",\"image\":\"6157fdd77d9c11633156567.png\"}', '2021-10-02 06:06:07', '2021-10-02 06:06:07'),
(52, 'choose_us.element', '{\"has_image\":\"1\",\"heading\":\"Buy Bitcoin Online\",\"details\":\"The buying process is so simple with this site. Just log in to the account and buy any of the bitcoin package based on demand.\",\"image\":\"6157fdf463b681633156596.png\"}', '2021-10-02 06:06:36', '2021-10-02 06:06:36'),
(53, 'choose_us.element', '{\"has_image\":\"1\",\"heading\":\"Sell Bitcoin online\",\"details\":\"The selling process is also simple! Sell your Bitcoin at your chosen rate, and get paid in one of the numerous payment methods.\",\"image\":\"6157fe0b43a471633156619.png\"}', '2021-10-02 06:06:59', '2021-10-02 06:06:59'),
(54, 'choose_us.element', '{\"has_image\":\"1\",\"heading\":\"Earn extra income\",\"details\":\"Buy and Sell your Bitcoin at your chosen rate and it is a great opportunity for all the uses to get more profit from this site.\",\"image\":\"6157fee5d33df1633156837.png\"}', '2021-10-02 06:10:37', '2021-10-02 06:10:37'),
(55, 'choose_us.element', '{\"has_image\":\"1\",\"heading\":\"High reliability\",\"details\":\"We are trusted by a huge number of people. We are working hard constantly to improve the level of our security system and minimize possible risks.\",\"image\":\"6157fefea9bf81633156862.png\"}', '2021-10-02 06:11:02', '2021-10-02 06:11:02'),
(56, 'choose_us.element', '{\"has_image\":\"1\",\"heading\":\"Legal Company\",\"details\":\"Our company conducts absolutely legal activities. We are certified to operate this business, we are legal and safe.\",\"image\":\"6157ff1163ec41633156881.png\"}', '2021-10-02 06:11:21', '2021-10-02 06:11:21'),
(57, 'faq.content', '{\"heading\":\"Frequently Asked Questions.\",\"sub_heading\":\"We answer some of your Frequently Asked Questions regarding our platform. If you have a query that is not answered here, Please contact us via mail.\"}', '2021-10-02 06:34:11', '2021-10-02 06:34:11'),
(58, 'faq.element', '{\"question\":\"Can I make money with Bitcoin ?\",\"answer\":\"You should never expect to get rich with Bitcoin or any emerging technology. It is always important to be wary of anything that sounds too good to be true or disobeys basic economic rules.\"}', '2021-10-02 06:35:16', '2021-10-02 06:36:21'),
(59, 'faq.element', '{\"question\":\"What is Bitcoin ?\",\"answer\":\"Bitcoin is a consensus network that enables a new payment system and completely digital money. It is the first decentralized peer-to-peer payment network that is powered by its users with no central authority or middlemen. From a user perspective, Bitcoin is pretty much like cash for the Internet. Bitcoin can also be seen as the most prominent triple entry bookkeeping system in existence.\"}', '2021-10-02 06:35:36', '2021-10-02 06:36:17'),
(60, 'faq.element', '{\"question\":\"What is escrow ?\",\"answer\":\"If you\\u2019re buying, send payment directly to the seller; if you\\u2019re selling, send Bitcoin Cash to our blind escrow. Once payment is received by the seller, the BCH is released to the buyer.\"}', '2021-10-02 06:35:49', '2021-10-02 06:35:49'),
(61, 'faq.element', '{\"question\":\"How to sell bitcoin ?\",\"answer\":\"It\\u2019s now easy to sell Bitcoin as a BITCCA vendor. You have the freedom to set your own rates, and also the luxury of over 20 payment options to get paid for the Bitcoin you sell. As BITCCA is a peer-to-peer marketplace, you can sell your Bitcoin directly to over 3 million users worldwide.\"}', '2021-10-02 06:36:11', '2021-10-02 06:36:11'),
(62, 'faq.element', '{\"question\":\"How to buy bitcoin ?\",\"answer\":\"It\\u2019s now easy to buy Bitcoin as a BITCCA vendor. You have the freedom to choose your own rates. As BITCCA is a peer-to-peer marketplace, you can buy your Bitcoin directly from over 3 million users worldwide.\"}', '2021-10-02 06:36:56', '2021-10-02 06:36:56'),
(63, 'faq.element', '{\"question\":\"What is online money  exchanging ?\",\"answer\":\"An online currency exchange, or electronic forex exchange, is an internet-based platform that facilitates the exchange of currencies between countries. Like their physical counterparts, online currency exchanges make money by charging a nominal fee and\\/or through the bid-ask spread in a currency.\"}', '2021-10-02 06:38:01', '2021-10-02 06:38:01'),
(64, 'testimonial.content', '{\"has_image\":\"1\",\"heading\":\"What Our Client Say About Us\",\"sub_heading\":\"We have done some awesome works and we always care for our clients, lets see what\'s their opinion about us.\",\"image\":\"61893dd6d84911636384214.jpg\"}', '2021-10-02 06:58:35', '2021-11-09 06:36:50'),
(65, 'testimonial.element', '{\"has_image\":[\"1\"],\"author_name\":\"Lucee\",\"quote\":\"This is best for crypto exchange among other features. This is best for crypto exchange among other features.\",\"image\":\"615812c601e821633161926.jpg\"}', '2021-10-02 07:00:11', '2021-11-09 06:37:09'),
(66, 'testimonial.element', '{\"has_image\":[\"1\"],\"author_name\":\"Clark\",\"quote\":\"The website provides a variety of related services.  This is best for crypto exchange among other features.\",\"image\":\"615812d22f3531633161938.jpg\"}', '2021-10-02 07:00:54', '2021-11-09 06:38:17'),
(67, 'testimonial.element', '{\"has_image\":[\"1\"],\"author_name\":\"Mr. Pop\",\"quote\":\"BITCCA is a company and website dedicated to the bitcoin cash and bitcoin selling platform. The website provides a variety of related services.\",\"image\":\"615812dc8892d1633161948.jpg\"}', '2021-10-02 07:01:23', '2021-10-02 07:35:48'),
(68, 'testimonial.element', '{\"has_image\":[\"1\"],\"author_name\":\"Mark\",\"quote\":\"Localcoins is the best website for selling bitcoin and making cash. They provide authentic services.  This is best for the crypto exchange platforms.\",\"image\":\"615812e679ef21633161958.jpg\"}', '2021-10-02 07:01:59', '2021-11-09 06:37:57'),
(69, 'testimonial.element', '{\"has_image\":[\"1\"],\"author_name\":\"Danniel\",\"quote\":\"I do business here for a long time. They give fast service and I feel trusted here. This is best for crypto exchange among other features.\",\"image\":\"615812f58b7eb1633161973.jpg\"}', '2021-10-02 07:02:42', '2021-10-02 07:36:13'),
(70, 'testimonial.element', '{\"has_image\":[\"1\"],\"author_name\":\"Hopper\",\"quote\":\"The website provides a variety of related services.  This is best for crypto exchange among other features. This is best site for all\",\"image\":\"61581300b57ab1633161984.jpg\"}', '2021-10-02 07:25:13', '2021-10-02 07:36:24'),
(71, 'footer.content', '{\"has_image\":\"1\",\"footer_text\":\"Lorem ipsum dolor sit amet consectet adipisicing elit. Dignissimos, dolore. Sit amet consectet adipisicing elit\",\"copyright_text\":\"Copyright \\u00a9 2020 | All Right Reserved\",\"image\":\"61893d4381a941636384067.jpg\"}', '2021-10-02 07:43:25', '2021-11-08 14:37:47'),
(72, 'offer.content', '{\"has_image\":\"1\",\"heading\":\"Welcome to the peer-to-peer finance revolution!\",\"sub_heading\":\"Trade cryptocurrency globally. Multiple payment methods. Free bitcoin wallet. And much more right here!\",\"button_text\":\"Get Started\",\"button_url\":\"https:\\/\\/www.google.com\\/\",\"image\":\"6171470d1e4581634813709.jpg\"}', '2021-10-02 08:26:58', '2021-10-21 10:25:09'),
(73, 'social_icon.element', '{\"title\":\"twitter\",\"social_icon\":\"<i class=\\\"lab la-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/\"}', '2021-10-02 09:09:02', '2021-10-02 09:09:02'),
(74, 'social_icon.element', '{\"title\":\"linkedin\",\"social_icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\\/\"}', '2021-10-02 09:09:33', '2021-10-02 09:09:33'),
(75, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"lab la-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/instagram.com\"}', '2021-10-02 09:10:20', '2021-10-02 09:10:20'),
(76, 'login.content', '{\"has_image\":\"1\",\"heading\":\"Welcome Back!!\",\"sub_heading\":\"Login with Bitcoinvio helps you with trade bitcoin more easy and secure way throughout the world.\",\"image\":\"61893d85eee811636384133.jpg\"}', '2021-10-02 09:43:52', '2021-11-08 14:38:54'),
(77, 'registration.content', '{\"has_image\":\"1\",\"heading\":\"Registration\",\"sub_heading\":\"Get Started Trade With Us.  We hope for your happy trading!\",\"image\":\"61893da49e2c51636384164.jpg\"}', '2021-10-02 09:44:17', '2021-11-08 14:39:24'),
(78, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"61813ef33dc721635860211.jpg\"}', '2021-10-02 09:48:25', '2021-11-02 13:06:51'),
(79, 'contact.element', '{\"icon\":\"<i class=\\\"lar la-envelope\\\"><\\/i>\",\"heading\":\"Email Address\",\"details\":\"support@demoemail.com\"}', '2021-10-28 08:44:48', '2021-10-28 08:44:48'),
(80, 'contact.element', '{\"icon\":\"<i class=\\\"las la-phone-volume\\\"><\\/i>\",\"heading\":\"Phone Number\",\"details\":\"+0123 456789\"}', '2021-10-28 08:45:19', '2021-10-28 08:45:19'),
(81, 'contact.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"heading\":\"Office Address\",\"details\":\"College Road, Uttar Horin Singha, Gaibandha-5700\"}', '2021-10-28 08:45:52', '2021-10-28 08:45:52'),
(82, 'contact.content', '{\"latitude\":\"23.7925\",\"longitude\":\"90.4078\"}', '2021-10-28 08:52:28', '2021-11-09 06:45:36'),
(83, 'trade_info.content', '{\"i_want_to\":\"What kind of advertisement do you wish to create? If you wish to sell bitcoins make sure you have bitcoins in your wallet.\",\"crypto_currency\":\"Which cryptocurrency do you wish to buy or sell?\",\"fiat_payment_method\":\"Which payment method will be used to pay the fiat currency?\",\"currency\":\"Which fiat currency needs exchange from cryptocurrency?\",\"margin\":\"The margin you want over the bitcoin market price. Use a negative value for buying or selling under the market price to attract more contacts. For more complex pricing edit the price equation directly.\",\"payment_window\":\"For Buyer: Within how many minutes do you promise to initiate the payment. For Seller: Within how many minutes you want to get paid.\",\"minimum_limit\":\"Minimum transaction limit in one trade.\",\"maximum_limit\":\"Maximum transaction limit in one trade.\",\"price_equation\":\"Please note that the advertiser is always responsible for all payment processing fees\",\"payment_details\":\"If necessary, please provide details on how to transfer money.\",\"terms_of_trades\":\"Provide the terms of trades for this advertisement.\"}', '2021-11-08 12:51:03', '2021-11-08 12:51:03'),
(84, 'widget_bg.content', '{\"has_image\":\"1\",\"image\":\"61893dec566901636384236.jpg\"}', '2021-11-08 14:40:36', '2021-11-08 14:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fiat_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `crypto_api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `public_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_cron` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `fiat_api_key`, `crypto_api_key`, `public_key`, `private_key`, `merchant_id`, `email_from`, `email_template`, `sms_api`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `secure_password`, `agree`, `registration`, `active_template`, `sys_version`, `last_cron`, `created_at`, `updated_at`) VALUES
(1, 'Localcoins', NULL, NULL, 'ce79947ee778f6be3fecff3806a89a1379fd48b56e35b8d735fdb15edcf44177', 'cA524cd6Cf6B54a6d5E77e3EadaCe877e34F302c7Bc8989D7202E3f8f37D7ab8', '8a9752a6dc465c016a4961260a61bb62', 'info@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">Website Name</a> . All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{name}}, {{message}}', 'fca120', '1c629d', '{\"name\":\"php\"}', '{\"clickatell_api_key\":\"----------------------------\",\"infobip_username\":\"--------------\",\"infobip_password\":\"----------------------\",\"message_bird_api_key\":\"-------------------\",\"account_sid\":\"AC67afdacf2dacff5f163134883db92c24\",\"auth_token\":\"77726b242830fb28f52fb08c648dd7a6\",\"from\":\"+17739011523\",\"apiv2_key\":\"dfsfgdfgh\",\"name\":\"clickatell\"}', 1, 1, 0, 0, 0, 0, 1, 1, 'basic', NULL, '2021-11-08 14:08:12', NULL, '2021-11-09 06:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 0, '2020-07-06 03:47:55', '2021-05-18 05:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_trade` int(10) UNSIGNED NOT NULL,
  `ad_limit` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', 'home', 'templates.basic.', '[\"overview\",\"buy\",\"sell\",\"choose_us\",\"faq\",\"testimonial\",\"offer\"]', 1, '2020-07-11 06:23:58', '2021-10-28 11:42:24'),
(5, 'Contact', 'contact', 'templates.basic.', '[\"buy\",\"faq\"]', 1, '2020-10-22 01:14:53', '2021-11-09 05:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supportticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trade_requests`
--

CREATE TABLE `trade_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `advertisement_id` int(10) UNSIGNED NOT NULL,
  `seller_id` int(10) UNSIGNED NOT NULL,
  `buyer_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL,
  `crypto_amount` decimal(28,8) NOT NULL,
  `crypto_id` int(10) UNSIGNED NOT NULL,
  `fiat_gateway_id` int(10) UNSIGNED NOT NULL,
  `fiat_id` int(10) UNSIGNED NOT NULL,
  `exchange_rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `window` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Escrow Funded:0, Completed:1, Buyer sent:2, Reported:8, Canceled:9',
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `crypto_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `crypto_id` int(10) UNSIGNED NOT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_cryptos`
--

CREATE TABLE `wallet_cryptos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `crypto_id` int(10) UNSIGNED NOT NULL,
  `wallet_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `windows`
--

CREATE TABLE `windows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `minute` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `crypto_id` int(10) UNSIGNED NOT NULL,
  `wallet_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cryptos`
--
ALTER TABLE `cryptos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_logs`
--
ALTER TABLE `email_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiats`
--
ALTER TABLE `fiats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiat_gateways`
--
ALTER TABLE `fiat_gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_requests`
--
ALTER TABLE `trade_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_cryptos`
--
ALTER TABLE `wallet_cryptos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `windows`
--
ALTER TABLE `windows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cryptos`
--
ALTER TABLE `cryptos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_logs`
--
ALTER TABLE `email_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fiats`
--
ALTER TABLE `fiats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fiat_gateways`
--
ALTER TABLE `fiat_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trade_requests`
--
ALTER TABLE `trade_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_cryptos`
--
ALTER TABLE `wallet_cryptos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `windows`
--
ALTER TABLE `windows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
