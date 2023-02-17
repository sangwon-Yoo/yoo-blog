-- CreateTable
CREATE TABLE `ContentCategory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `order` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ContentSummary` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `order` INTEGER NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `registrationDate` DATETIME(3) NOT NULL,
    `modificationDate` DATETIME(3) NULL,
    `representativeImageURI` VARCHAR(191) NULL,
    `firstParagraph` VARCHAR(400) NULL,
    `categoryId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ContentData` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contentText` TEXT NOT NULL,
    `contentSummaryId` INTEGER NOT NULL,

    UNIQUE INDEX `ContentData_contentSummaryId_key`(`contentSummaryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ContentSummary` ADD CONSTRAINT `ContentSummary_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `ContentCategory`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ContentData` ADD CONSTRAINT `ContentData_contentSummaryId_fkey` FOREIGN KEY (`contentSummaryId`) REFERENCES `ContentSummary`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
