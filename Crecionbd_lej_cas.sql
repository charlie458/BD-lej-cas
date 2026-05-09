-- =========================================================
-- lejos_de_casa.sql
-- Proyecto de lejos de casa - Taller de Bases de Datos
-- MYSQL
-- =========================================================
drop database lejos_de_casa;
CREATE DATABASE IF NOT EXISTS lejos_de_casa;
USE lejos_de_casa;

CREATE TABLE Regiones(
  codigo_postal Varchar(10) NOT NULL PRIMARY KEY,
  estado VARCHAR(100) NOT NULL,
  municipio VARCHAR(100) NOT NULL
);

CREATE TABLE Usuarios(
  curp VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
  nombres VARCHAR(255) NOT NULL,
  apellidos VARCHAR(255) NOT NULL,
  correo VARCHAR(255) NOT NULL UNIQUE,
  CHECK(correo LIKE '%@%.%'),
  telefono VARCHAR(14) NOT NULL UNIQUE,
  rol ENUM('vendedor','comprador','ambos') NOT NULL,
  fecha_registro DATETIME NOT NULL,
  calle VARCHAR(100) NOT NULL,
  num_interior int NOT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  ciudad VARCHAR(20) NOT NULL,
  municipio VARCHAR(50) NOT NULL
);

CREATE TABLE Casas(
  id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
  cupo INT NOT NULL,
  tipo ENUM('Una planta','Dos plantas','Otro tipo') NOT  NULL,
  imagen VARCHAR(50) NOT NULL,
  cuartos INT NOT NULL,
  calle VARCHAR(100) NOT NULL,
  num_interior INT NOT NULL,
  id_region VARCHAR(10) NOT NULL,
  id_propietario VARCHAR(20),
  FOREIGN KEY (id_region) REFERENCES Regiones(codigo_postal),
  FOREIGN KEY(id_propietario) REFERENCES Usuarios(curp) 
);

CREATE TABLE Reservas(
  id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
  fecha_inicio DATETIME NOT NULL,
  fecha_fin DATETIME NOT NULL,
  estado ENUM('Activo','Caducado') NOT NULL,
  id_casa INT NOT NULL,
  id_comprador VARCHAR(20) NOT NULL,
  FOREIGN KEY (id_casa) REFERENCES Casas(id),
  FOREIGN KEY(id_comprador) REFERENCES Usuarios(curp)
);

CREATE TABLE Pagos(
  id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
  tipo ENUM('Efectivo','Tarjeta de debito','Tarjeta de credito') NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  estado ENUM('Pagado','Pendiente') NOT NULL,
  feche_pago DATETIME NOT NULL,
  id_reserva INT NOT NULL UNIQUE,
  FOREIGN KEY (id_reserva) REFERENCES Reservas(id)
);

CREATE TABLE Contratos(
  id INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
  contrato_pdf VARCHAR(255) NOT NULL UNIQUE,
  vigencia DATETIME NOT NULL,
  id_reserva INT NOT NULL,
  FOREIGN KEY (id_reserva) REFERENCES Reservas(id)
);

CREATE TABLE ReseniasCasas(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY UNIQUE,
  calificacion INT NOT NULL,
  CHECK(calificacion BETWEEN 1 AND 5),
  comentario VARCHAR(300) NULL,
  id_casa INT NOT NULL,
  id_calificador VARCHAR(20) NOT NULL,
  fecha DATETIME NOT NULL,		
  FOREIGN KEY (id_casa) REFERENCES Casas(id),
  FOREIGN KEY (id_calificador) REFERENCES Usuarios(curp)
);

CREATE TABLE ReseniasUsuario(
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY UNIQUE,
  calificacion INT NOT NULL,
  CHECK(calificacion BETWEEN 1 AND 5),
  comentario VARCHAR(300) NULL,
  id_Usuario VARCHAR(20) NOT NULL,
  id_calificador VARCHAR(20) NOT NULL,
  fecha DATETIME NOT NULL,
  FOREIGN KEY (id_Usuario) REFERENCES Usuarios(curp),
  FOREIGN KEY (id_calificador) REFERENCES Usuarios(curp)
);

