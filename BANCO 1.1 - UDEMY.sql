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
 drop table editora;
 drop table livro;
 
CREATE TABLE `livraria`.`autor` (
  `idautor` int NOT NULL AUTO_INCREMENT,
  `nomeautor` varchar(45) DEFAULT NULL,
  `sobrenomeautor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idautor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livraria`.`editora` (
`ideditora` int NOT NULL AUTO_INCREMENT,
`nomeeditora` VARCHAR(45) NOT NULL,
PRIMARY KEY (ideditora));


CREATE TABLE `livraria`.`livro` (
`idlivro` INT NOT NULL AUTO_INCREMENT,
`nomelivro` VARCHAR(45) NOT NULL,
`autor` INT NOT NULL, 
`editora` INT NOT NULL,
PRIMARY KEY (`idlivro`),
INDEX `fkautor_idx`(`autor` ASC) VISIBLE,
INDEX `fkeditora_idx`(`editora` ASC) VISIBLE,
CONSTRAINT `fkautor`
	FOREIGN KEY(`autor`)
    REFERENCES `livraria`.`autor`(`idautor`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
CONSTRAINT `fkeditora`
	FOREIGN KEY(`editora`)
    REFERENCES `livraria`.`editora`(`ideditora`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
    );
    
    