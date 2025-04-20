-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `codigoPUCP` INT NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `estado` ENUM('HABILITADO', 'DESHABILITADO') NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `id_Administrador` INT NOT NULL AUTO_INCREMENT,
  `clave_Maestra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Administrador`),
  CONSTRAINT `fk_Administrador_Usuario1`
    FOREIGN KEY (`id_Administrador`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion` (
  `idPublicacion` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `estado` ENUM('VISIBLE', 'GUARDADO', 'RESTRINGIDO', 'OCULTO') NOT NULL,
  `fechaPublicacion` DATE NOT NULL,
  `activo` TINYINT NOT NULL,
  `url_imagen` VARCHAR(45) NULL,
  PRIMARY KEY (`idPublicacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Denuncia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Denuncia` (
  `id_reporte` INT NOT NULL AUTO_INCREMENT,
  `autor` INT NOT NULL,
  `reportante` INT NOT NULL,
  `motivo` VARCHAR(45) NULL,
  `fecha_reporte` DATE NOT NULL,
  `id_administrador` INT NOT NULL,
  `activo` TINYINT NOT NULL,
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
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Denuncia_Administrador1`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `mydb`.`Administrador` (`id_Administrador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Notificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Notificacion` (
  `id_notificacion` INT NOT NULL AUTO_INCREMENT,
  `mensaje` VARCHAR(45) NULL,
  `tipo_notificacion` VARCHAR(45) NOT NULL,
  `cantidad` INT NULL,
  `fecha` DATE NOT NULL,
  `id_publicacion` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `activo` TINYINT NOT NULL,
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
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comentario` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(45) NOT NULL,
  `valoracion` INT NULL,
  `fecha` DATE NOT NULL,
  `id_publicacion` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `activo` TINYINT NOT NULL,
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
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `id_curso` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Especialidad` (
  `id_especialidad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_especialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Facultad` (
  `id_facultad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_facultad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publicacion_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion_Curso` (
  `Publicacion_idPublicacion` INT NOT NULL,
  `Curso_id_curso` INT NOT NULL,
  `activo` TINYINT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publicacion_Especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion_Especialidad` (
  `Publicacion_idPublicacion` INT NOT NULL,
  `Especialidad_id_especialidad` INT NOT NULL,
  `activo` TINYINT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Publicacion_Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Publicacion_Facultad` (
  `Publicacion_idPublicacion` INT NOT NULL,
  `Facultad_id_facultad` INT NOT NULL,
  `activo` TINYINT NULL,
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
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
