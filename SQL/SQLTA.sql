-- MySQL Workbench Synchronization
-- Generated: 2025-04-19 21:54
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Yu An Lee

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `mydb`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `mydb`.`Usuario` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `estado`;

ALTER TABLE `mydb`.`Administrador` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`Denuncia` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `id_administrador`;

ALTER TABLE `mydb`.`Publicacion` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `fechaPublicacion`;

ALTER TABLE `mydb`.`Notificacion` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `id_usuario`;

ALTER TABLE `mydb`.`Comentario` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `id_usuario`;

ALTER TABLE `mydb`.`Curso` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `nombre`;

ALTER TABLE `mydb`.`Especialidad` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `nombre`;

ALTER TABLE `mydb`.`Facultad` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NOT NULL AFTER `nombre`;

ALTER TABLE `mydb`.`Publicacion_Curso` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NULL DEFAULT NULL AFTER `Curso_id_curso`;

ALTER TABLE `mydb`.`Publicacion_Especialidad` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NULL DEFAULT NULL AFTER `Especialidad_id_especialidad`;

ALTER TABLE `mydb`.`Publicacion_Facultad` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `activo` TINYINT(4) NULL DEFAULT NULL AFTER `Facultad_id_facultad`;

ALTER TABLE `mydb`.`Administrador` 
ADD CONSTRAINT `fk_Administrador_Usuario1`
  FOREIGN KEY (`id_Administrador`)
  REFERENCES `mydb`.`Usuario` (`idUsuario`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
