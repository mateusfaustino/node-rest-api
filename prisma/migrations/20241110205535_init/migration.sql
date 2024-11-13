-- CreateTable
CREATE TABLE `User` (
    `user_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cargo` (
    `cargo_id` INTEGER NOT NULL AUTO_INCREMENT,
    `cargo_nome` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Cargo_cargo_nome_key`(`cargo_nome`),
    PRIMARY KEY (`cargo_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserCargo` (
    `user_id` VARCHAR(191) NOT NULL,
    `cargo_id` INTEGER NOT NULL,

    PRIMARY KEY (`user_id`, `cargo_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TipoEvento` (
    `tipo_evento_id` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `TipoEvento_descricao_key`(`descricao`),
    PRIMARY KEY (`tipo_evento_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Evento` (
    `evento_id` INTEGER NOT NULL AUTO_INCREMENT,
    `data_do_evento` DATETIME(3) NOT NULL,
    `local` VARCHAR(191) NOT NULL,
    `tipo_evento_id` INTEGER NOT NULL,
    `organizador_id` VARCHAR(191) NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`evento_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventoUsersConfirmados` (
    `evento_id` INTEGER NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`evento_id`, `user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UserCargo` ADD CONSTRAINT `UserCargo_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserCargo` ADD CONSTRAINT `UserCargo_cargo_id_fkey` FOREIGN KEY (`cargo_id`) REFERENCES `Cargo`(`cargo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Evento` ADD CONSTRAINT `Evento_organizador_id_fkey` FOREIGN KEY (`organizador_id`) REFERENCES `User`(`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Evento` ADD CONSTRAINT `Evento_tipo_evento_id_fkey` FOREIGN KEY (`tipo_evento_id`) REFERENCES `TipoEvento`(`tipo_evento_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventoUsersConfirmados` ADD CONSTRAINT `EventoUsersConfirmados_evento_id_fkey` FOREIGN KEY (`evento_id`) REFERENCES `Evento`(`evento_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventoUsersConfirmados` ADD CONSTRAINT `EventoUsersConfirmados_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
