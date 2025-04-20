-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pruebas_ta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pruebas_ta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pruebas_ta` DEFAULT CHARACTER SET utf8mb3 ;
USE `pruebas_ta` ;

-- -----------------------------------------------------
-- Table `pruebas_ta`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `codigo_PUCP` INT NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `estado` ENUM('HABILITADO', 'DESHABILITADO') NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Administrador` (
  `id_Administrador` INT NOT NULL AUTO_INCREMENT,
  `clave_Maestra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Administrador`),
  CONSTRAINT `fk_Administrador_Usuario1`
    FOREIGN KEY (`id_Administrador`)
    REFERENCES `pruebas_ta`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Publicacion` (
  `idPublicacion` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `estado` ENUM('VISIBLE', 'GUARDADO', 'RESTRINGIDO', 'OCULTO') NOT NULL,
  `fechaPublicacion` DATE NOT NULL,
  `url_imagen` VARCHAR(45) NULL DEFAULT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`idPublicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Comentario` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(45) NOT NULL,
  `valoracion` INT NULL DEFAULT NULL,
  `fecha` DATE NOT NULL,
  `id_publicacion` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_comentario`),
  INDEX `fk_Comentario_Publicacion1_idx` (`id_publicacion` ASC) VISIBLE,
  INDEX `fk_Comentario_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Publicacion1`
    FOREIGN KEY (`id_publicacion`)
    REFERENCES `pruebas_ta`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `pruebas_ta`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Denuncia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Denuncia` (
  `id_reporte` INT NOT NULL AUTO_INCREMENT,
  `autor` INT NOT NULL,
  `reportante` INT NOT NULL,
  `motivo` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_reporte` DATE NOT NULL,
  `id_administrador` INT NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_reporte`),
  INDEX `fk_Denuncia_Publicacion1_idx` (`autor` ASC) VISIBLE,
  INDEX `fk_Denuncia_Usuario1_idx` (`reportante` ASC) VISIBLE,
  INDEX `fk_Denuncia_Administrador1_idx` (`id_administrador` ASC) VISIBLE,
  CONSTRAINT `fk_Denuncia_Administrador1`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `pruebas_ta`.`Administrador` (`id_Administrador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Denuncia_Publicacion1`
    FOREIGN KEY (`autor`)
    REFERENCES `pruebas_ta`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Denuncia_Usuario1`
    FOREIGN KEY (`reportante`)
    REFERENCES `pruebas_ta`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Especialidad` (
  `id_especialidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_especialidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Facultad` (
  `id_facultad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_facultad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Notificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Notificacion` (
  `id_notificacion` INT NOT NULL AUTO_INCREMENT,
  `mensaje` VARCHAR(45) NULL DEFAULT NULL,
  `tipo_notificacion` VARCHAR(45) NOT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `fecha` DATE NOT NULL,
  `id_publicacion` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `activo` TINYINT NOT NULL,
  PRIMARY KEY (`id_notificacion`),
  INDEX `fk_Notificacion_Publicacion1_idx` (`id_publicacion` ASC) VISIBLE,
  INDEX `fk_Notificacion_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Notificacion_Publicacion1`
    FOREIGN KEY (`id_publicacion`)
    REFERENCES `pruebas_ta`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Notificacion_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `pruebas_ta`.`Usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Publicacion_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Publicacion_Curso` (
  `Publicacion_idPublicacion` INT NOT NULL,
  `Curso_id_curso` INT NOT NULL,
  PRIMARY KEY (`Publicacion_idPublicacion`, `Curso_id_curso`),
  INDEX `fk_Publicacion_has_Curso_Curso1_idx` (`Curso_id_curso` ASC) VISIBLE,
  INDEX `fk_Publicacion_has_Curso_Publicacion1_idx` (`Publicacion_idPublicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_has_Curso_Curso1`
    FOREIGN KEY (`Curso_id_curso`)
    REFERENCES `pruebas_ta`.`Curso` (`id_curso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Publicacion_has_Curso_Publicacion1`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES `pruebas_ta`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Publicacion_Especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Publicacion_Especialidad` (
  `Publicacion_idPublicacion` INT NOT NULL,
  `Especialidad_id_especialidad` INT NOT NULL,
  PRIMARY KEY (`Publicacion_idPublicacion`, `Especialidad_id_especialidad`),
  INDEX `fk_Publicacion_has_Especialidad_Especialidad1_idx` (`Especialidad_id_especialidad` ASC) VISIBLE,
  INDEX `fk_Publicacion_has_Especialidad_Publicacion1_idx` (`Publicacion_idPublicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_has_Especialidad_Especialidad1`
    FOREIGN KEY (`Especialidad_id_especialidad`)
    REFERENCES `pruebas_ta`.`Especialidad` (`id_especialidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Publicacion_has_Especialidad_Publicacion1`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES `pruebas_ta`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pruebas_ta`.`Publicacion_Facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pruebas_ta`.`Publicacion_Facultad` (
  `Publicacion_idPublicacion` INT NOT NULL,
  `Facultad_id_facultad` INT NOT NULL,
  PRIMARY KEY (`Publicacion_idPublicacion`, `Facultad_id_facultad`),
  INDEX `fk_Publicacion_has_Facultad_Facultad1_idx` (`Facultad_id_facultad` ASC) VISIBLE,
  INDEX `fk_Publicacion_has_Facultad_Publicacion1_idx` (`Publicacion_idPublicacion` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_has_Facultad_Facultad1`
    FOREIGN KEY (`Facultad_id_facultad`)
    REFERENCES `pruebas_ta`.`Facultad` (`id_facultad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Publicacion_has_Facultad_Publicacion1`
    FOREIGN KEY (`Publicacion_idPublicacion`)
    REFERENCES `pruebas_ta`.`Publicacion` (`idPublicacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
