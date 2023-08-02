-- CreateTable
CREATE TABLE `api_request` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `request` JSON NOT NULL,
    `response` JSON NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `auth_user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(180) NOT NULL,
    `roles` JSON NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `username` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `UNIQ_A3B536FDE7927C74`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `banner_more_profitable` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `banner_id` INTEGER NULL,
    `slot_settings_id` INTEGER NULL,
    `banner_file_id` INTEGER NULL,
    `name` VARCHAR(50) NOT NULL,
    `game_url` VARCHAR(255) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `active` BOOLEAN NOT NULL,

    UNIQUE INDEX `UNIQ_377B3991684EC833`(`banner_id`),
    UNIQUE INDEX `UNIQ_377B3991C79650AF`(`banner_file_id`),
    INDEX `IDX_377B3991C126616D`(`slot_settings_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `banner_more_profitable_file` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `file` VARCHAR(255) NOT NULL,
    `upload_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `bet_operations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `slot_game_id` INTEGER NOT NULL,
    `bet_transaction_id` VARCHAR(100) NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `round_id` VARCHAR(100) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `IDX_A840F359A76ED395`(`user_id`),
    INDEX `IDX_A840F359A89BBA1`(`slot_game_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `casino_most_popular` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `qty_lines` INTEGER NOT NULL,
    `qty_columns` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `casino_most_popular_slot_games` (
    `casino_most_popular_id` INTEGER NOT NULL,
    `slot_games_id` INTEGER NOT NULL,

    INDEX `IDX_83E2A20846AAA7E0`(`slot_games_id`),
    INDEX `IDX_83E2A208BC698957`(`casino_most_popular_id`),
    PRIMARY KEY (`casino_most_popular_id`, `slot_games_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `settings_id` INTEGER NULL,
    `key_id_prod` VARCHAR(255) NULL,
    `key_secret_prod` VARCHAR(255) NULL,
    `key_id_stage` VARCHAR(255) NULL,
    `key_secret_stage` VARCHAR(255) NULL,
    `currency` VARCHAR(10) NULL,
    `language` VARCHAR(100) NULL,
    `url_return` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `name` VARCHAR(100) NULL,
    `prod_callback` VARCHAR(100) NULL,
    `stage_callback` VARCHAR(100) NULL,

    UNIQUE INDEX `UNIQ_C744045559949888`(`settings_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client_auth_user` (
    `client_id` INTEGER NOT NULL,
    `auth_user_id` INTEGER NOT NULL,

    INDEX `IDX_4895E6F219EB6921`(`client_id`),
    INDEX `IDX_4895E6F2E94AF366`(`auth_user_id`),
    PRIMARY KEY (`client_id`, `auth_user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `doctrine_migration_versions` (
    `version` VARCHAR(191) NOT NULL,
    `executed_at` DATETIME(0) NULL,
    `execution_time` INTEGER NULL,

    PRIMARY KEY (`version`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `file` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `file` VARCHAR(255) NOT NULL,
    `upload_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `layout_colors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `settings_id` INTEGER NULL,
    `name` VARCHAR(100) NOT NULL,
    `hexadecimal` VARCHAR(20) NOT NULL,

    INDEX `IDX_B986D45959949888`(`settings_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `live_casino_most_popular` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `qty_lines` INTEGER NOT NULL,
    `qty_columns` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `live_casino_most_popular_slot_games` (
    `live_casino_most_popular_id` INTEGER NOT NULL,
    `slot_games_id` INTEGER NOT NULL,

    INDEX `IDX_125C5FB730D65363`(`live_casino_most_popular_id`),
    INDEX `IDX_125C5FB746AAA7E0`(`slot_games_id`),
    PRIMARY KEY (`live_casino_most_popular_id`, `slot_games_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `messenger_messages` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `body` LONGTEXT NOT NULL,
    `headers` LONGTEXT NOT NULL,
    `queue_name` VARCHAR(190) NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `available_at` DATETIME(0) NOT NULL,
    `delivered_at` DATETIME(0) NULL,

    INDEX `IDX_75EA56E016BA31DB`(`delivered_at`),
    INDEX `IDX_75EA56E0E3BD61CE`(`available_at`),
    INDEX `IDX_75EA56E0FB7336F0`(`queue_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `operations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `active` BOOLEAN NOT NULL,
    `whithdraw_minimum` DOUBLE NOT NULL,
    `withdraw_maximum` DOUBLE NOT NULL,
    `withdraw_fee` DOUBLE NOT NULL,
    `deposit_minimum` DOUBLE NOT NULL,
    `deposit_maximum` DOUBLE NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `provider` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `client_percent` INTEGER NULL,
    `base_percent` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `referral_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `referral_id` INTEGER NOT NULL,
    `user_id` INTEGER NULL,
    `game` VARCHAR(100) NULL,
    `amount` DOUBLE NULL,
    `type` VARCHAR(100) NULL,
    `available` BOOLEAN NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    INDEX `IDX_7E9A2C6D3CCAA4B7`(`referral_id`),
    INDEX `IDX_7E9A2C6DA76ED395`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `referral_settings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cpa` INTEGER NULL,
    `rev_share_percent` INTEGER NULL,
    `referral_type` VARCHAR(10) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `operations_id` INTEGER NULL,
    `slot_settings_id` INTEGER NULL,
    `client_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `UNIQ_E545A0C59384C38A`(`operations_id`),
    UNIQUE INDEX `UNIQ_E545A0C5C126616D`(`slot_settings_id`),
    INDEX `IDX_E545A0C519EB6921`(`client_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `slot_games` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `provider_id` INTEGER NOT NULL,
    `uuid` VARCHAR(255) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `has_lobby` BOOLEAN NOT NULL,
    `is_mobile` BOOLEAN NOT NULL,
    `has_freespins` BOOLEAN NOT NULL,
    `has_tables` BOOLEAN NOT NULL,
    `freespin_valid_until_full_day` BOOLEAN NOT NULL,
    `slug` VARCHAR(100) NULL,

    INDEX `IDX_9196047CA53A8AA`(`provider_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `slot_settings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `casino_most_popular_id` INTEGER NULL,
    `live_casino_most_popular_id` INTEGER NULL,

    UNIQUE INDEX `UNIQ_3410C156BC698957`(`casino_most_popular_id`),
    UNIQUE INDEX `UNIQ_3410C15630D65363`(`live_casino_most_popular_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `wallet_id` INTEGER NOT NULL,
    `client_id` INTEGER NOT NULL,
    `referral_id` INTEGER NULL,
    `referral_settings_id` INTEGER NULL,
    `external_id` INTEGER NOT NULL,
    `username` VARCHAR(100) NOT NULL,
    `balance` DECIMAL(10, 2) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `session` VARCHAR(100) NULL,
    `cpa_collected` BOOLEAN NULL,
    `is_referrer` BOOLEAN NULL,

    UNIQUE INDEX `UNIQ_8D93D649712520F3`(`wallet_id`),
    UNIQUE INDEX `UNIQ_8D93D6493E58724C`(`referral_settings_id`),
    INDEX `IDX_8D93D64919EB6921`(`client_id`),
    INDEX `IDX_8D93D6493CCAA4B7`(`referral_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wallet` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `balance` DOUBLE NULL,
    `bonus` DOUBLE NULL,
    `bet` DOUBLE NULL,
    `withdraw` DOUBLE NULL,
    `deposit` DOUBLE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wallet_transaction` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `wallet_id` INTEGER NOT NULL,
    `amount` DOUBLE NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `deleted_at` DATETIME(0) NULL,
    `type` VARCHAR(50) NOT NULL,
    `api_collected` BOOLEAN NULL,
    `user_id` INTEGER NULL,
    `uuid` VARCHAR(255) NOT NULL,

    INDEX `IDX_7DAF972712520F3`(`wallet_id`),
    INDEX `IDX_7DAF972A76ED395`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `banner_more_profitable` ADD CONSTRAINT `FK_377B3991684EC833` FOREIGN KEY (`banner_id`) REFERENCES `banner_more_profitable_file`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `banner_more_profitable` ADD CONSTRAINT `FK_377B3991C126616D` FOREIGN KEY (`slot_settings_id`) REFERENCES `slot_settings`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `banner_more_profitable` ADD CONSTRAINT `FK_377B3991C79650AF` FOREIGN KEY (`banner_file_id`) REFERENCES `banner_more_profitable_file`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `bet_operations` ADD CONSTRAINT `FK_A840F359A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `bet_operations` ADD CONSTRAINT `FK_A840F359A89BBA1` FOREIGN KEY (`slot_game_id`) REFERENCES `slot_games`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `casino_most_popular_slot_games` ADD CONSTRAINT `FK_83E2A20846AAA7E0` FOREIGN KEY (`slot_games_id`) REFERENCES `slot_games`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `casino_most_popular_slot_games` ADD CONSTRAINT `FK_83E2A208BC698957` FOREIGN KEY (`casino_most_popular_id`) REFERENCES `casino_most_popular`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `FK_C744045559949888` FOREIGN KEY (`settings_id`) REFERENCES `settings`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client_auth_user` ADD CONSTRAINT `FK_4895E6F219EB6921` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `client_auth_user` ADD CONSTRAINT `FK_4895E6F2E94AF366` FOREIGN KEY (`auth_user_id`) REFERENCES `auth_user`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `layout_colors` ADD CONSTRAINT `FK_B986D45959949888` FOREIGN KEY (`settings_id`) REFERENCES `settings`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `live_casino_most_popular_slot_games` ADD CONSTRAINT `FK_125C5FB730D65363` FOREIGN KEY (`live_casino_most_popular_id`) REFERENCES `live_casino_most_popular`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `live_casino_most_popular_slot_games` ADD CONSTRAINT `FK_125C5FB746AAA7E0` FOREIGN KEY (`slot_games_id`) REFERENCES `slot_games`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `referral_history` ADD CONSTRAINT `FK_7E9A2C6D3CCAA4B7` FOREIGN KEY (`referral_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `referral_history` ADD CONSTRAINT `FK_7E9A2C6DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `settings` ADD CONSTRAINT `FK_E545A0C519EB6921` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `settings` ADD CONSTRAINT `FK_E545A0C59384C38A` FOREIGN KEY (`operations_id`) REFERENCES `operations`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `settings` ADD CONSTRAINT `FK_E545A0C5C126616D` FOREIGN KEY (`slot_settings_id`) REFERENCES `slot_settings`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `slot_games` ADD CONSTRAINT `FK_9196047CA53A8AA` FOREIGN KEY (`provider_id`) REFERENCES `provider`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `slot_settings` ADD CONSTRAINT `FK_3410C15630D65363` FOREIGN KEY (`live_casino_most_popular_id`) REFERENCES `live_casino_most_popular`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `slot_settings` ADD CONSTRAINT `FK_3410C156BC698957` FOREIGN KEY (`casino_most_popular_id`) REFERENCES `casino_most_popular`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `FK_8D93D64919EB6921` FOREIGN KEY (`client_id`) REFERENCES `client`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `FK_8D93D6493CCAA4B7` FOREIGN KEY (`referral_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `FK_8D93D6493E58724C` FOREIGN KEY (`referral_settings_id`) REFERENCES `referral_settings`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `FK_8D93D649712520F3` FOREIGN KEY (`wallet_id`) REFERENCES `wallet`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `wallet_transaction` ADD CONSTRAINT `FK_7DAF972712520F3` FOREIGN KEY (`wallet_id`) REFERENCES `wallet`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `wallet_transaction` ADD CONSTRAINT `FK_7DAF972A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
