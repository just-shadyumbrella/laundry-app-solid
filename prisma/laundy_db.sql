-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.6.2-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laundry_db
DROP DATABASE IF EXISTS `laundry_db`;
CREATE DATABASE IF NOT EXISTS `laundry_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `laundry_db`;

-- Dumping structure for table laundry_db.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `invoice` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `service` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL DEFAULT 'reguler',
  `ironed` tinyint(1) NOT NULL DEFAULT 0,
  `delivery` tinyint(1) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` enum('queued','process','finished','picked-up') CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL DEFAULT 'queued',
  `created_at` timestamp NOT NULL,
  `finished_at` timestamp NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci NOT NULL,
  PRIMARY KEY (`invoice`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `FK_orders_services` (`service`),
  CONSTRAINT `FK_orders_services` FOREIGN KEY (`service`) REFERENCES `services` (`service`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laundry_db.orders: ~0 rows (approximately)
DELETE FROM `orders`;

-- Dumping structure for table laundry_db.services
DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `service` varchar(16) NOT NULL,
  `estimated` tinyint(2) NOT NULL DEFAULT 0,
  `units` enum('kg','pcs') NOT NULL DEFAULT 'pcs',
  `fee` decimal(10,0) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`service`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table laundry_db.services: ~28 rows (approximately)
DELETE FROM `services`;
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('bedcover', 0, 'pcs', 25000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('bedcover-plus', 0, 'pcs', 35000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('blezzer', 0, 'pcs', 20000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('boneka-10–25', 0, 'pcs', 10000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('boneka-100+', 0, 'pcs', 100000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('boneka-30–50', 0, 'pcs', 30000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('boneka-60–100', 0, 'pcs', 70000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('express', 24, 'kg', 6000, 'Cuci kilat 24 jam selesai (Misal antar hari Sabtu selesai Minggu)');
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('gorden', 0, 'kg', 10000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('gorden-tipis', 0, 'kg', 15000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('helm', 0, 'pcs', 15000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('jaket-1', 0, 'pcs', 20000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('jaket-2', 0, 'pcs', 35000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('jas', 0, 'pcs', 20000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('karpet', 0, 'pcs', 15000, 'Harga per m²');
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('kebaya/gaun', 0, 'pcs', 20000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('kebaya/gaun+', 0, 'pcs', 40000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('pakaian-bayi', 0, 'kg', 10000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('reguler', 48, 'kg', 5000, 'Cuci biasa 2 hari selesai (Misal antar hari Jumat selesai Minggu)');
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('selimut', 0, 'pcs', 15000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('sepatu-1', 0, 'pcs', 15000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('sepatu-2', 0, 'pcs', 22500, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('sepatu-3', 0, 'pcs', 30000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('setelan-blezzer', 0, 'pcs', 40000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('setelan-jas', 0, 'pcs', 40000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('super-express', 12, 'kg', 9000, 'Cuci kilat 12 jam selesai (Antar Pagi selesai Sore/Malam)');
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('tas-1', 0, 'pcs', 15000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('tas-2', 0, 'pcs', 25000, NULL);
INSERT INTO `services` (`service`, `estimated`, `units`, `fee`, `description`) VALUES
	('tas-3', 0, 'pcs', 35000, NULL);

-- Dumping structure for table laundry_db.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` int(11) NOT NULL,
  `cost` decimal(10,0) NOT NULL,
  `picked_up` timestamp NOT NULL,
  `discount` decimal(2,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice` (`invoice`),
  CONSTRAINT `FK_transactions_orders` FOREIGN KEY (`invoice`) REFERENCES `orders` (`invoice`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table laundry_db.transactions: ~0 rows (approximately)
DELETE FROM `transactions`;

-- Dumping structure for table laundry_db.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT 'someone',
  `address` text NOT NULL DEFAULT 'street',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` enum('customer','employee','admin') NOT NULL DEFAULT 'customer',
  `registered_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Dumping data for table laundry_db.users: ~0 rows (approximately)
DELETE FROM `users`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
