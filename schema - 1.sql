CREATE TABLE `Orders`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `product_id` INT NOT NULL,
    `number` INT NOT NULL,
    `status` VARCHAR(255) NOT NULL COMMENT 'new, in progress, completed',
    `buyers_id` INT NOT NULL
);
ALTER TABLE
    `Orders` ADD PRIMARY KEY `orders_id_primary`(`id`);
CREATE TABLE `Product`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `technical_parameters` LONGTEXT NOT NULL,
    `buyers_feedback_id` INT NULL,
    `rating` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Product` ADD PRIMARY KEY `product_id_primary`(`id`);
ALTER TABLE
    `Product` ADD UNIQUE `product_name_unique`(`name`);
ALTER TABLE
    `Product` ADD UNIQUE `product_description_unique`(`description`);
ALTER TABLE
    `Product` ADD UNIQUE `product_technical_parameters_unique`(`technical_parameters`);
CREATE TABLE `Buyers`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `last_name` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `phone_id` INT NOT NULL,
    `post_office_id` INT NOT NULL,
    `buyers_adress_id` INT NULL
);
ALTER TABLE
    `Buyers` ADD PRIMARY KEY `buyers_id_primary`(`id`);
CREATE TABLE `Post_office`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL COMMENT 'Nova_poshta, Ukr_poshta',
    `city` VARCHAR(255) NOT NULL,
    `department` VARCHAR(255) NOT NULL,
    `street` VARCHAR(255) NOT NULL,
    `house` VARCHAR(255) NOT NULL,
    `courier` TINYINT(1) NOT NULL
);
ALTER TABLE
    `Post_office` ADD PRIMARY KEY `post_office_id_primary`(`id`);
CREATE TABLE `Buyers_feedback`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `buyers_id` INT NOT NULL,
    `feedback` TEXT NOT NULL
);
ALTER TABLE
    `Buyers_feedback` ADD PRIMARY KEY `buyers_feedback_id_primary`(`id`);
CREATE TABLE `Buyers_adress`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `city` VARCHAR(255) NOT NULL,
    `street` VARCHAR(255) NOT NULL,
    `house` VARCHAR(255) NOT NULL,
    `flat` VARCHAR(255) NULL
);
ALTER TABLE
    `Buyers_adress` ADD PRIMARY KEY `buyers_adress_id_primary`(`id`);
CREATE TABLE `Orders_Product`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `orders_id` INT NOT NULL,
    `product_id` INT NOT NULL
);
ALTER TABLE
    `Orders_Product` ADD INDEX `orders_product_orders_id_product_id_index`(`orders_id`, `product_id`);
ALTER TABLE
    `Orders_Product` ADD PRIMARY KEY `orders_product_id_primary`(`id`);
CREATE TABLE `Phone`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `phone` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Phone` ADD PRIMARY KEY `phone_id_primary`(`id`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_buyers_id_foreign` FOREIGN KEY(`buyers_id`) REFERENCES `Buyers`(`id`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_buyers_feedback_id_foreign` FOREIGN KEY(`buyers_feedback_id`) REFERENCES `Buyers_feedback`(`id`);
ALTER TABLE
    `Buyers` ADD CONSTRAINT `buyers_phone_id_foreign` FOREIGN KEY(`phone_id`) REFERENCES `Phone`(`id`);
ALTER TABLE
    `Buyers` ADD CONSTRAINT `buyers_post_office_id_foreign` FOREIGN KEY(`post_office_id`) REFERENCES `Post_office`(`id`);
ALTER TABLE
    `Buyers` ADD CONSTRAINT `buyers_buyers_adress_id_foreign` FOREIGN KEY(`buyers_adress_id`) REFERENCES `Buyers_adress`(`id`);
ALTER TABLE
    `Buyers_feedback` ADD CONSTRAINT `buyers_feedback_buyers_id_foreign` FOREIGN KEY(`buyers_id`) REFERENCES `Buyers`(`id`);
ALTER TABLE
    `Orders_Product` ADD CONSTRAINT `orders_product_orders_id_foreign` FOREIGN KEY(`orders_id`) REFERENCES `Orders`(`id`);
ALTER TABLE
    `Orders_Product` ADD CONSTRAINT `orders_product_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Product`(`id`);