CREATE SCHEMA IF NOT EXISTS `TA_PROGRA`; 
#USUARIOS (PRIMERO)
CREATE TABLE IF NOT EXISTS usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  codigo_pucp INT NOT NULL UNIQUE,
  nombre_usuario VARCHAR(45) NOT NULL UNIQUE,
  contrasena VARCHAR(255) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL UNIQUE,
  estado ENUM('HABILITADO', 'RESTRINGIDO') NOT NULL DEFAULT 'HABILITADO',
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id_usuario));

#PUBLICACIONES (TERCERO)
CREATE TABLE IF NOT EXISTS publicacion (
  id_publicacion INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(45) NOT NULL,
  descripcion VARCHAR(150) NOT NULL,
  estado ENUM('VISIBLE', 'GUARDADO', 'RESTRINGIDO', 'OCULTO') NOT NULL DEFAULT 'VISIBLE',
  fecha_publicacion DATE NOT NULL,
  ruta_imagen VARCHAR(255), #NO SE ALMACENA LA IMAGEN
  id_usuario INT NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id_publicacion),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario));
 
 #Relacion muchos a muchos entre usuario y publicacion (CUALQUIER MOMENTO)
 CREATE TABLE favoritos (
    id_usuario INT NOT NULL,
    id_publicacion INT NOT NULL,
    PRIMARY KEY (id_usuario, id_publicacion),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion)
);
 
 #(CUARTO)
CREATE TABLE IF NOT EXISTS comentario (
  id_comentario INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_publicacion INT NOT NULL,
  contenido VARCHAR(150) NOT NULL,
  valoracion INT NOT NULL,
  fecha DATE NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id_comentario),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
  FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion));

#CATEGORIAS (SEGUNDO)
CREATE TABLE IF NOT EXISTS curso (
  id_curso INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id_curso));
    
CREATE TABLE IF NOT EXISTS especialidad (
  id_especialidad INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id_especialidad));
    
CREATE TABLE IF NOT EXISTS facultad (
  id_facultad INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id_facultad));
  #FALTA IMPLEMENTAR LAS TABLAS MUCHOS A MUCHOS

-- Relación Publicacion-Curso (muchos-a-muchos)
CREATE TABLE publicacion_curso (
    id_publicacion INT NOT NULL,
    id_curso INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_curso),
    FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion) ON DELETE CASCADE,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Relación Publicacion-Especialidad
CREATE TABLE publicacion_especialidad (
    id_publicacion INT NOT NULL,
    id_especialidad INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_especialidad),
    FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion) ON DELETE CASCADE,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

-- Relación Publicacion-Facultad
CREATE TABLE publicacion_facultad (
    id_publicacion INT NOT NULL,
    id_facultad INT NOT NULL,
    PRIMARY KEY (id_publicacion, id_facultad),
    FOREIGN KEY (id_publicacion) REFERENCES publicacion(id_publicacion) ON DELETE CASCADE,
    FOREIGN KEY (id_facultad) REFERENCES facultad(id_facultad)
);
  
#NOTIFICACIONES
CREATE TABLE IF NOT EXISTS notificacion (
  id_notificacion INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  mensaje VARCHAR(150) NOT NULL,
  tipo_not ENUM('GUARDADA', 'COMENTADA', 'REPORTADA') NOT NULL,
  cantidad INT NOT NULL,
  fechaDATE NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (id_notificacion),
  FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario));
  
  #DENUNCIAS
