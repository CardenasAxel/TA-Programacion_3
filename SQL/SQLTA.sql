-- MySQL Workbench Synchronization
-- Generated: 2025-04-19 21:38
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Yu An Lee

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `codigoPUCP` INT(11) NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `estado` ENUM('HABILITADO', 'DESHABILITADO') NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `id_Administrador` INT(11) NOT NULL AUTO_INCREMENT,
  `clave_Maestra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Administrador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Denuncia` (
  `id_reporte` INT(11) NOT NULL AUTO_INCREMENT,
  `autor` INT(11) NOT NULL,
  `reportante` INT(11) NOT NULL,
  `motivo` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_reporte` DATE NOT NULL,
  `id_administrador` INT(11) NOT NULL,
  PRIMARY KEY (`id_reporte`, `id_administrador`),
  INDEX `fk_Denuncia_Publicacion1_idx` (`autor` ASC) VISIBLE,
  INDEX `fk_Denuncia_Usuario1_idx` (`reportante` ASC) VISIBLE,
  INDEX `fk_Denuncia_Administrador1_idx` (`id_administrador` ASC) VISIBLE,
  CONSTRAINT `fk_Denuncia_Publicacion1`
    FOREIGN KEY (`autor`)
    REFERENCES `mydb`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Denuncia_Usuario1`
    FOREIGN KEY (`reportante`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Denuncia_Administrador1`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `mydb`.`Administrador` (`id_Administrador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion` (
  `idPublicacion` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `estado` ENUM('VISIBLE', 'GUARDADO', 'RESTRINGIDO', 'OCULTO') NOT NULL,
  `fechaPublicacion` DATE NOT NULL,
  PRIMARY KEY (`idPublicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Notificacion` (
  `id_notificacion` INT(11) NOT NULL AUTO_INCREMENT,
  `mensaje` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_notificacion` VARCHAR(45) NOT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `fecha` DATE NOT NULL,
  `id_publicacion` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_notificacion`, `id_publicacion`, `id_usuario`),
  INDEX `fk_Notificacion_Publicacion1_idx` (`id_publicacion` ASC) VISIBLE,
  INDEX `fk_Notificacion_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Notificacion_Publicacion1`
    FOREIGN KEY (`id_publicacion`)
    REFERENCES `mydb`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Notificacion_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Comentario` (
  `id_comentario` INT(11) NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(45) NOT NULL,
  `valoracion` INT(11) NULL DEFAULT NULL,
  `fecha` DATE NOT NULL,
  `id_publicacion` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id_comentario`, `id_publicacion`, `id_usuario`),
  INDEX `fk_Comentario_Publicacion1_idx` (`id_publicacion` ASC) VISIBLE,
  INDEX `fk_Comentario_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Publicacion1`
    FOREIGN KEY (`id_publicacion`)
    REFERENCES `mydb`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `id_curso` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Especialidad` (
  `id_especialidad` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_especialidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Facultad` (
  `id_facultad` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_facultad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion_Curso` (
  `Publicacion_idPublicacion` INT(11) NOT NULL,
  `Curso_id_curso` INT(11) NOT NULL,
  PRIMARY KEY (`Publicacion_idPublicacion`, `Curso_id_curso`),
  INDEX `fk_Publicacion_has_Curso_Curso1_idx` (`Curso_id_curso` ASC) VISIBLE,
  INDEX `fk_Publicacion_has_Curso_Publicacion1_idx` (`Publicacion_idPublicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_has_Curso_Publicacion1`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES `mydb`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Publicacion_has_Curso_Curso1`
    FOREIGN KEY (`Curso_id_curso`)
    REFERENCES `mydb`.`Curso` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion_Especialidad` (
  `Publicacion_idPublicacion` INT(11) NOT NULL,
  `Especialidad_id_especialidad` INT(11) NOT NULL,
  PRIMARY KEY (`Publicacion_idPublicacion`, `Especialidad_id_especialidad`),
  INDEX `fk_Publicacion_has_Especialidad_Especialidad1_idx` (`Especialidad_id_especialidad` ASC) VISIBLE,
  INDEX `fk_Publicacion_has_Especialidad_Publicacion1_idx` (`Publicacion_idPublicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_has_Especialidad_Publicacion1`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES `mydb`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Publicacion_has_Especialidad_Especialidad1`
    FOREIGN KEY (`Especialidad_id_especialidad`)
    REFERENCES `mydb`.`Especialidad` (`id_especialidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion_Facultad` (
  `Publicacion_idPublicacion` INT(11) NOT NULL,
  `Facultad_id_facultad` INT(11) NOT NULL,
  PRIMARY KEY (`Publicacion_idPublicacion`, `Facultad_id_facultad`),
  INDEX `fk_Publicacion_has_Facultad_Facultad1_idx` (`Facultad_id_facultad` ASC) VISIBLE,
  INDEX `fk_Publicacion_has_Facultad_Publicacion1_idx` (`Publicacion_idPublicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_has_Facultad_Publicacion1`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES `mydb`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Publicacion_has_Facultad_Facultad1`
    FOREIGN KEY (`Facultad_id_facultad`)
    REFERENCES `mydb`.`Facultad` (`id_facultad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
