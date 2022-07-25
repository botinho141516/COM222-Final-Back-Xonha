-- CreateTable
CREATE TABLE `ASSOCIADO` (
    `Codigo` INTEGER NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(35) NOT NULL,
    `Endereco` VARCHAR(45) NOT NULL,
    `Email` VARCHAR(20) NOT NULL,
    `Status` ENUM('Grad', 'Posgrad', 'Prof') NOT NULL,

    PRIMARY KEY (`Codigo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EMPRESTIMO` (
    `Codigo` INTEGER NOT NULL AUTO_INCREMENT,
    `Nro_Exemplar` INTEGER NOT NULL,
    `ISBN` VARCHAR(12) NOT NULL,
    `Codigo_Assoc` INTEGER NOT NULL,
    `Data_Emp` DATE NOT NULL,
    `Data_Devol` DATE NULL,

    INDEX `Codigo_Assoc`(`Codigo_Assoc`),
    INDEX `Nro_Exemplar`(`Nro_Exemplar`, `ISBN`),
    PRIMARY KEY (`Codigo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EXEMPLAR` (
    `Numero` INTEGER NOT NULL,
    `ISBN` VARCHAR(12) NOT NULL,
    `Preco` FLOAT NULL,

    INDEX `ISBN`(`ISBN`),
    PRIMARY KEY (`Numero`, `ISBN`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FUNCIONARIO` (
    `Codigo` INTEGER NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(35) NOT NULL,
    `Funcao` ENUM('gerente', 'funcionario') NOT NULL,
    `Email` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`Codigo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PUBLICACAO` (
    `ISBN` VARCHAR(12) NOT NULL,
    `Titulo` VARCHAR(40) NOT NULL,
    `Autor` VARCHAR(35) NOT NULL,
    `Editora` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`ISBN`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RESERVA` (
    `Codigo` INTEGER NOT NULL AUTO_INCREMENT,
    `ISBN` VARCHAR(12) NOT NULL,
    `Codigo_Assoc` INTEGER NOT NULL,
    `Data` DATE NOT NULL,
    `Status` ENUM('Iniciado', 'Avisado', 'Anulado') NOT NULL,

    INDEX `Codigo_Assoc`(`Codigo_Assoc`),
    INDEX `ISBN`(`ISBN`),
    PRIMARY KEY (`Codigo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `EMPRESTIMO` ADD CONSTRAINT `EMPRESTIMO_ibfk_1` FOREIGN KEY (`Codigo_Assoc`) REFERENCES `ASSOCIADO`(`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `EXEMPLAR` ADD CONSTRAINT `EXEMPLAR_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `PUBLICACAO`(`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `RESERVA` ADD CONSTRAINT `RESERVA_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `PUBLICACAO`(`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `RESERVA` ADD CONSTRAINT `RESERVA_ibfk_2` FOREIGN KEY (`Codigo_Assoc`) REFERENCES `ASSOCIADO`(`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;