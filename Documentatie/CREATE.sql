DROP DATABASE IF EXISTS `ProefexamenDag3`;
Create database `ProefexamenDag3`;
USE `ProefexamenDag3`;


CREATE TABLE `TypePersoon` (
	`Id` 			INT PRIMARY KEY AUTO_INCREMENT,
    `Naam` 			VARCHAR(50)		NOT NULL,
    `isActief` 				BIT(1) 			NOT NULL DEFAULT 1,
	`beschrijving` 			VARCHAR(255)	NULL,
	`aangemaaktOp` 			DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 			DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW()
)ENGINE=INNODB;

CREATE TABLE `PakketOptie` (
	`Id` 			INT PRIMARY KEY AUTO_INCREMENT,
    `Naam` 			VARCHAR(50)		NOT NULL,
    `isActief` 				BIT(1) 			NOT NULL DEFAULT 1,
	`beschrijving` 			VARCHAR(255)	NULL,
	`aangemaaktOp` 			DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 			DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW()
)ENGINE=INNODB;

CREATE TABLE `ReserveringStatus` (
	`Id` 			INT PRIMARY KEY AUTO_INCREMENT,
    `Naam` 			VARCHAR(75)		NOT NULL,
    `isActief` 				BIT(1) 			NOT NULL DEFAULT 1,
	`beschrijving` 			VARCHAR(255)	NULL,
	`aangemaaktOp` 			DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 			DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW()
)ENGINE=INNODB;

CREATE TABLE `Tarief` (
	`Id` 			INT PRIMARY KEY AUTO_INCREMENT,
    `Eenheid` 		VARCHAR(20)		NOT NULL,
    `Prijs` 		DECIMAL(6,2)	NOT NULL,
    `isActief` 			BIT(1) 		NOT NULL DEFAULT 1,
	`beschrijving` 		VARCHAR(255)	NULL,
	`aangemaaktOp` 		DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 		DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW()
)ENGINE=INNODB;

CREATE TABLE `Baan` (
	`Id` 			INT PRIMARY KEY AUTO_INCREMENT,
    `Nummer` 		INT				NOT NULL,
    `HeeftHek` 		BIT				NOT NULL,
    `isActief` 			BIT(1) 		NOT NULL DEFAULT 1,
	`beschrijving` 		VARCHAR(255)	NULL,
	`aangemaaktOp` 		DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 		DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW()
)ENGINE=INNODB;

CREATE TABLE `Openingstijd` (
	`Id` 			INT PRIMARY KEY AUTO_INCREMENT,
    `DagNaam` 		VARCHAR(25)				NOT NULL,
    `BeginTijd` 	TIME			NOT NULL,
    `EindTijd`		TIME			NOT NULL,
    `isActief` 			BIT(1) 		NOT NULL DEFAULT 1,
	`beschrijving` 		VARCHAR(255)	NULL,
	`aangemaaktOp` 		DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 		DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW()
)ENGINE=INNODB;
CREATE TABLE `Persoon` (
	`id` 				INT PRIMARY KEY AUTO_INCREMENT,
    `TypePersoonId`		INT			NOT NULL,
	`Voornaam` 			VARCHAR(50) NOT NULL,
	`Tussenvoegsel` 	VARCHAR(10)		NULL,
	`Achternaam` 		VARCHAR(50) NOT NULL,
    `Roepnaam`			VARCHAR(30)	NOT NULL,
    `IsVolwassen`		BIT			NOT NULL,
	`isActief` 			BIT(1) 		NOT NULL DEFAULT 1,
	`beschrijving` 		VARCHAR(255)	NULL,
	`aangemaaktOp` 		DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 		DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW(),
	CONSTRAINT `FK_TypePersoonPersoon` FOREIGN KEY (`TypePersoonId`) REFERENCES `TypePersoon` (`id`)
)ENGINE=INNODB;

CREATE TABLE `Reservering` (
    `Id`                 	INT 			PRIMARY KEY AUTO_INCREMENT,
    `PersoonId`         	INT 			NOT NULL,
    `OpeningstijdId`    	INT 			NOT NULL,
    `TariefId`          	INT 			NOT NULL,
    `BaanId`             	INT 			NOT NULL,
    `PakketOptieId`     	INT				NULL,
    `ReserveringStatusId`	INT				NOT NULL,
    `Reserveringsnummer`	BIGINT 			NOT NULL,
    `Datum`                	DATE 			NOT NULL,
    `AantalUren`        	INT 			NOT NULL,
    `BeginTijd`            	TIME 			NOT NULL,
    `EindTijd`            	TIME 			NOT NULL,
    `AantalVolwassen`   	INT 			NOT NULL,
    `AantalKinderen`    	INT 			NULL,
    `isActief` 				BIT(1) 			NOT NULL DEFAULT 1,
	`beschrijving` 			VARCHAR(255)	NULL,
	`aangemaaktOp` 			DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 			DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW(),
    CONSTRAINT `FK_ReserveringOpeningstijd` FOREIGN KEY (`OpeningstijdId`) REFERENCES `Openingstijd` (`id`),
    CONSTRAINT `FK_ReserveringTarief` FOREIGN KEY (`TariefId`) REFERENCES `Tarief` (`id`),
    CONSTRAINT `FK_ReserveringBaan` FOREIGN KEY (`BaanId`) REFERENCES `Baan` (`id`),
    CONSTRAINT `FK_ReserveringPakketOptie` FOREIGN KEY (`PakketOptieId`) REFERENCES `PakketOptie` (`id`),
    CONSTRAINT `FK_ReserveringReserveringStatus` FOREIGN KEY (`ReserveringStatusId`) REFERENCES `ReserveringStatus` (`id`),
    CONSTRAINT `FK_ReserveringPersoon` FOREIGN KEY (`PersoonId`) REFERENCES `Persoon` (`id`)
)ENGINE=INNODB;





CREATE TABLE `Spel` (
	`Id`				INT PRIMARY KEY AUTO_INCREMENT,
    `PersoonId`			INT			NOT NULL,
    `ReserveringId`		int			NOT NULL,
    `isActief` 				BIT(1) 			NOT NULL DEFAULT 1,
	`beschrijving` 			VARCHAR(255)	NULL,
	`aangemaaktOp` 			DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 			DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW(),
    CONSTRAINT `FK_SpelPersoon` FOREIGN KEY (`PersoonId`) REFERENCES `Persoon` (`id`),
    CONSTRAINT `FK_SpelReservering` FOREIGN KEY (`ReserveringId`) REFERENCES `Reservering` (`id`)
)ENGINE=INNODB;

CREATE TABLE `Uitslag` (
	`Id`				INT PRIMARY KEY AUTO_INCREMENT,
    `SpelId`			INT			NOT NULL,
    `Aantalpunten`		INT			NOT NULL,
    `isActief` 				BIT(1) 			NOT NULL DEFAULT 1,
	`beschrijving` 			VARCHAR(255)	NULL,
	`aangemaaktOp` 			DATETIME 		NOT NULL 	DEFAULT NOW(),
	`gewijzigdOp` 			DATETIME 		NOT NULL 	DEFAULT NOW() ON UPDATE NOW(),
    CONSTRAINT `FK_UitslagSpel` FOREIGN KEY (`SpelId`) REFERENCES `Spel` (`id`)
)ENGINE=INNODB;

