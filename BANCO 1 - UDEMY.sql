create database livraria
character set utf8mb4
collate utf8mb4_0900_ai_ci;

DROP DATABASE banconovo;

SHOW CHARACTER SET;

ALTER TABLE banconovo
DEFAULT CHARACTER SET utf8mb4
default collate utf8mb4_vi_0900_as_cs;

 USE LIVRARIA;
 drop table autor;
 
CREATE TABLE `livraria`.`autor` (
  `idautor` int NOT NULL AUTO_INCREMENT,
  `nomeautor` varchar(45) DEFAULT NULL,
  `sobrenomeautor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livraria`.`editora` (
`ideditora` int NOT NULL AUTO_INCREMENT,
`nomeeditora` VARCHAR(45) NULL,
PRIMARY KEY (ideditora));

