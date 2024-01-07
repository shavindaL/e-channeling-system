CREATE TABLE `medic`.`patient` (
  `PID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NULL,
  `Email` VARCHAR(70) NULL,
  `Password` VARCHAR(10) NULL,
  `Gender` VARCHAR(8) NULL,
  `NIC` VARCHAR(12) NULL,
  PRIMARY KEY (`PID`));

ALTER TABLE `medic`.`patient` 
CHANGE COLUMN `Name` `Name` VARCHAR(60) NULL ,
CHANGE COLUMN `Email` `Email` VARCHAR(70) NULL ,
CHANGE COLUMN `Password` `Password` VARCHAR(10) NULL ,
ADD UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE;
;

CREATE TABLE `medic`.`hospital` (
  `HID` INT NOT NULL,
  `Name` VARCHAR(30) NULL,
  `Location` VARCHAR(45) NULL,
  `phone_number` CHAR(10) NULL,
  `user_name` VARCHAR(45) NULL,
  `password` VARCHAR(20) NULL,
  PRIMARY KEY (`HID`));

ALTER TABLE `medic`.`hospital` 
CHANGE COLUMN `user_name` `user_name` VARCHAR(10) NULL DEFAULT NULL ;

CREATE TABLE `medic`.`doctor` (
  `DID` VARCHAR(10) NOT NULL,
  `NIC` VARCHAR(12) NULL,
  `name` VARCHAR(70) NULL,
  `address` VARCHAR(100) NULL,
  `user_name` VARCHAR(10) NULL,
  `password` VARCHAR(45) NULL,
  `gender` VARCHAR(10) NULL,
  `phone_number` CHAR(10) NULL,
  `specialization` VARCHAR(45) NULL,
  PRIMARY KEY (`DID`));
  
  CREATE TABLE `medic`.`administrator` (
  `ADM_ID` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone_number` CHAR(10) NULL,
  `user_name` VARCHAR(10) NULL,
  `password` VARCHAR(20) NULL,
  `e-mail` VARCHAR(70) NULL,
  PRIMARY KEY (`ADM_ID`));

CREATE TABLE `medic`.`appointment` (
  `AID` INT NOT NULL,
  `Time` TIME NULL,
  `Date` DATE NULL,
  `PID` INT NULL,
  PRIMARY KEY (`AID`),
  INDEX `PID_idx` (`PID` ASC) VISIBLE,
  CONSTRAINT `PID`
    FOREIGN KEY (`PID`)
    REFERENCES `medic`.`patient` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `medic`.`hospital` 
CHANGE COLUMN `HID` `HID` VARCHAR(10) NOT NULL ;

ALTER TABLE `medic`.`appointment` 
ADD COLUMN `HID` VARCHAR(10) NULL AFTER `PID`,
ADD COLUMN `DID` VARCHAR(10) NULL AFTER `HID`,
ADD INDEX `HID_idx` (`HID` ASC) VISIBLE,
ADD INDEX `DID_idx` (`DID` ASC) VISIBLE;
;
ALTER TABLE `medic`.`appointment` 
ADD CONSTRAINT `HID`
  FOREIGN KEY (`HID`)
  REFERENCES `medic`.`hospital` (`HID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `DID`
  FOREIGN KEY (`DID`)
  REFERENCES `medic`.`doctor` (`DID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  
  CREATE TABLE `medic`.`reminder` (
  `RID` INT NOT NULL AUTO_INCREMENT,
  `DocID` VARCHAR(10) NULL,
  `Description` VARCHAR(150) NULL,
  PRIMARY KEY (`RID`),
  INDEX `DID_idx` (`DocID` ASC) VISIBLE,
  CONSTRAINT `DocID`
    FOREIGN KEY (`DocID`)
    REFERENCES `medic`.`doctor` (`DID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `medic`.`visit` (
  `Hospital_ID` VARCHAR(10) NOT NULL,
  `DocID` VARCHAR(10) NOT NULL,
  `room_number` INT NULL,
  `time` TIME NULL,
  `date` DATE NULL,
  PRIMARY KEY (`Hospital_ID`, `DocID`),
  INDEX `Doctor_ID_idx` (`DocID` ASC) VISIBLE,
  CONSTRAINT `Hospital_ID`
    FOREIGN KEY (`Hospital_ID`)
    REFERENCES `medic`.`hospital` (`HID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Doctor_ID`
    FOREIGN KEY (`DocID`)
    REFERENCES `medic`.`doctor` (`DID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `medic`.`payment` (
  `Pay_ID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `method` VARCHAR(15) NULL,
  `amount` FLOAT NULL,
  `PID` INT NULL,
  PRIMARY KEY (`Pay_ID`),
  INDEX `patient_ID_idx` (`PID` ASC) VISIBLE,
  CONSTRAINT `patient_ID`
    FOREIGN KEY (`PID`)
    REFERENCES `medic`.`patient` (`PID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


