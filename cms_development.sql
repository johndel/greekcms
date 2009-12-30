-- phpMyAdmin SQL Dump
-- version 3.2.2
-- http://www.phpmyadmin.net
--
-- Σύστημα: localhost
-- Χρόνος δημιουργίας: 19 Δεκ 2009, στις 12:43 AM
-- Έκδοση Διακομιστή: 5.1.39
-- Έκδοση PHP: 5.2.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Βάση: `cms_development`
--

-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `assets`
--

CREATE TABLE IF NOT EXISTS `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_type_assetable` (`assetable_id`,`assetable_type`,`type`),
  KEY `fk_assets` (`assetable_id`,`assetable_type`),
  KEY `fk_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- 'Αδειασμα δεδομένων του πίνακα `assets`
--

INSERT INTO `assets` (`id`, `data_file_name`, `data_content_type`, `data_file_size`, `assetable_id`, `assetable_type`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Winter.jpg', 'image/jpeg', 105542, NULL, NULL, 'Picture', NULL, '2009-12-17 15:51:50', '2009-12-17 15:51:50'),
(2, '3.jpg', 'application/octet-stream', 63257, NULL, NULL, 'Picture', NULL, '2009-12-17 15:52:27', '2009-12-17 15:52:27'),
(3, '7.jpg', 'image/jpeg', 63376, NULL, NULL, 'Picture', NULL, '2009-12-17 15:52:52', '2009-12-17 15:52:52'),
(4, '3.jpg', 'image/jpeg', 63257, NULL, NULL, 'Picture', NULL, '2009-12-17 15:54:07', '2009-12-17 15:54:07');

-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- 'Αδειασμα δεδομένων του πίνακα `contact`
--


-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- 'Αδειασμα δεδομένων του πίνακα `pages`
--

INSERT INTO `pages` (`id`, `name`, `title`, `meta_description`, `meta_keywords`, `permalink`, `description`, `position`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Προκαθορισμένες ρυθμίσεις', 'Ελληνικό CMS | Οpen Source, Φτιαγμένο σε Rails', 'Το ελληνικό CMS είναι ένα open source project, φτιαγμένο σε rails, με σκοπό τη βοήθεια όσων πρωτοξεκινούν στην rails, να γνωρίσουν και να μάθουν γι'' αυτήν.', 'Open source Ελληνικό CMS, Rails', NULL, NULL, 1, 1, '2009-12-14 19:40:46', '2009-12-18 10:33:10'),
(2, 'Αναζήτηση', 'Αναζήτηση Ελληνικού CMS', 'Σελίδα αναζήτησης για το Ελληνικό CMS', '', NULL, '', 2, 1, '2009-12-14 19:40:46', '2009-12-18 10:27:42'),
(3, '<img src="/images/content/home.png" alt="Αρχική Σελίδα Ελληνικού CMS"  />Αρχική Σελίδα', 'Ελληνικό CMS | Οpen Source Project σε Rails', 'Το ελληνικό CMS, είναι μια εύκολη web εφαρμογή για την γρήγορη ανανέωση και διαχείριση του περιεχομένου των ιστοσελίδων σας.', 'Ελληνικό CMS, διαχείριση ιστοσελίδας, rails, web εφαρμογή, τι είναι το ελληνικό CMS, εύκολη διαχείριση ιστοσελίδων', NULL, '<div class="h1-start">\r\n	 </div>\r\n<h1>\r\n	Αρχική Σελίδα - Τι είναι το Ελληνικό CMS;</h1>\r\n<div class="h1-end">\r\n	 </div>\r\n<p>\r\n	test test test test test test test test test test test test test test test test test test test test test test test test test tes', 1, 1, '2009-12-14 19:40:46', '2009-12-18 10:45:22'),
(4, '<img src="/images/content/contact.png" alt="Φόρμα επικοινωνίας Ελληνικού CMS"  />Eπικοινωνία', 'Ελληνικό CMS :: Επικοινωνία', 'Στείλτε μήνυμα για το Ελληνικό CMS', '', 'contact', '<p>\r\n	test γρβε</p>\r\n', 4, 1, '2009-12-14 19:40:46', '2009-12-18 10:23:40'),
(9, '<img src="/images/content/download.png" alt="Κατεβάστε το Ελληνικό CMS"  />Κατεβάστε το', 'Κατεβάστε δωρεάν το Ελληνικό CMS', 'Κατεβάστε δωρεάν το Ελληνικό CMS', 'Open source Ελληνικό CMS', 'download', NULL, 2, 1, '2009-12-18 10:24:58', '2009-12-18 10:26:58'),
(10, '<img src="/images/content/documentation.png" alt="Documentation Ελληνικού CMS"  />Οδηγίες', 'Οδηγίες και manuals για το Ελληνικό CMS', 'Οδηγίες, manuals, εγκατάσταση και άλλες πληροφορίες για απλούς χρήστες και προγραμματιστές του Ελληνικού CMS', '', 'documentation', NULL, 3, 1, '2009-12-18 10:29:21', '2009-12-18 10:30:06');

-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 'Αδειασμα δεδομένων του πίνακα `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20091124193649'),
('20091208094135'),
('20091208094140'),
('20091208094145'),
('20091216180850'),
('20091216183958'),
('20091216183960');

-- --------------------------------------------------------

--
-- Δομή Πίνακα για τον Πίνακα `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- 'Αδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `password_salt`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'istoselidas@gmail.com', '5cd172d7b2027c7ca337e21ee05acfa6a709fabe', '951af16fc713cfc9e6417f014f16bb2de79d78f4', '2009-12-14 19:40:46', '2009-12-18 10:57:13'),
(19, 'test', NULL, 'a0d36cf574024ffe6c35563b5dc5d8672703b7ae', '2d998b29a93d8fbee35cc846097315dbd234c378', '2009-12-18 22:38:58', '2009-12-18 22:38:58');
