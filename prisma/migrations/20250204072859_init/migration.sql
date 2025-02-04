-- CreateTable
CREATE TABLE `orders` (
    `invoice` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL DEFAULT 0,
    `service` VARCHAR(16) NOT NULL DEFAULT 'reguler',
    `ironed` BOOLEAN NOT NULL DEFAULT false,
    `delivery` BOOLEAN NOT NULL DEFAULT false,
    `amount` INTEGER NOT NULL DEFAULT 0,
    `status` ENUM('queued', 'process', 'finished', 'picked-up') NOT NULL DEFAULT 'queued',
    `created_at` TIMESTAMP(0) NOT NULL,
    `finished_at` TIMESTAMP(0) NOT NULL,
    `notes` TEXT NOT NULL,

    UNIQUE INDEX `user_id`(`user_id`),
    INDEX `FK_orders_services`(`service`),
    PRIMARY KEY (`invoice`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `services` (
    `service` VARCHAR(16) NOT NULL,
    `estimated` TINYINT NOT NULL DEFAULT 0,
    `units` ENUM('kg', 'pcs') NOT NULL DEFAULT 'pcs',
    `fee` DECIMAL(10, 0) NOT NULL DEFAULT 0,
    `description` TEXT NULL,

    PRIMARY KEY (`service`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactions` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `invoice` INTEGER NOT NULL,
    `cost` DECIMAL(10, 0) NOT NULL,
    `picked_up` TIMESTAMP(0) NOT NULL,
    `discount` DECIMAL(2, 2) NOT NULL DEFAULT 0.00,

    UNIQUE INDEX `invoice`(`invoice`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL DEFAULT 'someone',
    `address` TEXT NOT NULL DEFAULT 'street',
    `email` VARCHAR(255) NULL,
    `phone` VARCHAR(16) NULL,
    `password` VARCHAR(255) NULL,
    `type` ENUM('customer', 'employee', 'admin') NOT NULL DEFAULT 'customer',
    `registered_at` TIMESTAMP(0) NULL,
    `notes` TEXT NULL,

    UNIQUE INDEX `email`(`email`),
    UNIQUE INDEX `phone`(`phone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `FK_orders_services` FOREIGN KEY (`service`) REFERENCES `services`(`service`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `orders` ADD CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `transactions` ADD CONSTRAINT `FK_transactions_orders` FOREIGN KEY (`invoice`) REFERENCES `orders`(`invoice`) ON DELETE NO ACTION ON UPDATE NO ACTION;
