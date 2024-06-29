DROP DATABASE IF EXISTS `Jefatura`;
CREATE DATABASE `Jefatura`;
use Jefatura;
CREATE TABLE `usuario` (
  `id_usu` int(11) NOT NULL,
  `nom_usu` varchar(45) NOT NULL,
  `contra` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usu`));
INSERT INTO `usuario` VALUES (1,'Emmanuel','061823'),(2,'Adrian','2006'),(3,'Juliana','Dios es amor'),(4,'Maria','leti'),(5,'Admin','1234');

CREATE TABLE `arrestos` (
  `Cod_Arresto` int(11) NOT NULL,
  `Nombre_Arrestado` varchar(25) DEFAULT NULL,
  `Apellido_Arrestado` varchar(35) DEFAULT NULL,
  `Ced_Arrestado` int(11) DEFAULT NULL,
  `Ubicacion` varchar(55) DEFAULT NULL,
  `Placa_Oficial` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Cod_Arresto`));

CREATE TABLE `denuncia` (
  `Cod_Denuncia` int(11) NOT NULL,
  `Denunciado` varchar(55) DEFAULT NULL,
  `Ced_Denunciante` int(11) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `id_estacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Denuncia`));

CREATE TABLE `estacion` (
  `id_Estacion` int(11) NOT NULL,
  `Nombre_Estacion` varchar(20) DEFAULT NULL,
  `Direccion_Estacion` varchar(55) DEFAULT NULL,
  `Telefono_Estacion` varchar(12) DEFAULT NULL,
  `Representante_Estacion` varchar(35) DEFAULT NULL,
  `Correo_Estado` varchar(40) DEFAULT NULL,
  `Codigo_Region` char(4) DEFAULT NULL,
  PRIMARY KEY (`id_Estacion`));

CREATE TABLE `denunciante` (
  `Ced_Denunciante` int(11) NOT NULL,
  `Nombre_Denunciante` varchar(25) DEFAULT NULL,
  `Apellido_Denunciante` varchar(25) DEFAULT NULL,
  `Telefono_Denunciante` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Ced_Denunciante`));

  CREATE TABLE `empleado` (
  `ced_Empleado` int(11) NOT NULL,
  `NombreEmpleado` varchar(20) DEFAULT NULL,
  `ApellidoEmpleado` varchar(30) DEFAULT NULL,
  `DireccionEmpleado` varchar(55) DEFAULT NULL,
  `TelefonoEmpleado` varchar(12) DEFAULT NULL,
  `CorreoEmpleado` varchar(55) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Sueldo` decimal(10,2) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `id_estacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ced_Empleado`));

CREATE TABLE `oficiales` (
  `ced_Oficial` int(11) NOT NULL,
  `Nombre_Oficial` varchar(20) DEFAULT NULL,
  `Apellido_Oficial` varchar(30) DEFAULT NULL,
  `Direccion_Oficial` varchar(55) DEFAULT NULL,
  `Telefono_Oficial` varchar(12) DEFAULT NULL,
  `Correo_Oficial` varchar(55) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Placa_Oficial` varchar(10) DEFAULT NULL,
  `rango` varchar(30) DEFAULT NULL,
  `unidad` varchar(30) DEFAULT NULL,
  `Sueldo` decimal(10,2) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `id_estacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`ced_Oficial`));

CREATE TABLE `regiones` (
  `Codigo_Region` char(4) DEFAULT NULL,
  `nombre` varchar(55) DEFAULT NULL);

CREATE TABLE `vehiculo` (
  `Matricula` varchar(10) NOT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `placa_oficial` varchar(10) DEFAULT NULL,
  `id_estacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`Matricula`));

CREATE VIEW denuncia_denunciante AS
SELECT d.Cod_Denuncia, d.id_estacion, d.Descripcion, d.Denunciado, 
       de.Ced_Denunciante, de.Nombre_Denunciante, de.Apellido_Denunciante
FROM denuncia d
JOIN denunciante de ON d.Ced_Denunciante = de.Ced_Denunciante;

INSERT INTO denuncia (Cod_Denuncia, Denunciado, Ced_Denunciante, Descripcion, id_estacion) VALUES
(1, 'Carlos', 123456789, 'Acoso callejero', 1),
(2, 'Luisa', 987654321, 'Maltrato domestico', 2),
(3, 'Manuel', 456789123, 'Robo de celular', 3);

INSERT INTO denunciante (Ced_Denunciante, Nombre_Denunciante, Apellido_Denunciante, Telefono_Denunciante) VALUES
(123456789, 'Ana', 'Gomez', '1234567890'),
(987654321, 'Pedro', 'Perez', '0987654321'),
(456789123, 'Maria', 'Rodriguez', '4567891230');

INSERT INTO `regiones` VALUES ('REG1', 'Region Norte'),('REG2', 'Region Sureste'),('REG3', 'Region Suroeste');

INSERT INTO arrestos (Cod_Arresto, Nombre_Arrestado, Apellido_Arrestado, Ced_Arrestado, Ubicacion, Placa_Oficial, Descripcion) VALUES
(1004, 'Juan', 'Perez', 123456789, 'Calle 1', 'ABC123', 'Robo a mano armada'),
(1007, 'Maria', 'Garcia', 987654321, 'Avenida 2', 'DEF456', 'Asalto en la via publica'),
(1003, 'Pedro', 'Jimenez', 456789123, 'Plaza central', 'GHI789', 'Venta de drogas');

INSERT INTO empleado (ced_Empleado, NombreEmpleado, ApellidoEmpleado, DireccionEmpleado, TelefonoEmpleado, CorreoEmpleado, FechaNacimiento, Sueldo, Genero) VALUES
(123456789, 'Sofia', 'Sanchez', 'Calle 2', '2345678901', 'sofia.sanchez@mail.com', '1990-01-01', 1500.00, 'F'),
(987654321, 'Juan', 'Garcia', 'Avenida 3', '3456789012', 'juan.garcia@mail.com', '1995-05-05', 2000.00, 'M'),
(456789123, 'Laura', 'Hernandez', 'Plaza central', '4567890123', 'laura.hernandez@mail.com', '1985-10-10', 2500.00, 'F');

INSERT INTO `oficiales` (`ced_Oficial`, `Nombre_Oficial`, `Apellido_Oficial`, `Direccion_Oficial`, `Telefono_Oficial`, `Correo_Oficial`, `Fecha_Nacimiento`, `Placa_Oficial`, `rango`, `unidad`, `Sueldo`, `Genero`) 
VALUES 
  (1001, 'Juan', 'Garcia', 'Av. Los Pinos 123', '555-1234', 'jgarcia@email.com', '1980-03-15', '1111AAA', 'Sargento', 'Unidad A', 2000.00, 'M'),
  (1002, 'Maria', 'Perez', 'Calle de la Playa 321', '555-4321', 'mperez@email.com', '1975-07-10', '2222BBB', 'Cabo', 'Unidad B', 1500.00, 'F'),
  (1003, 'Pedro', 'Sanchez', 'Cra. 5 # 12-34', '555-5678', 'psanchez@email.com', '1985-01-25', '3333CCC', 'Teniente', 'Unidad C', 2500.00, 'M');

INSERT INTO estacion (id_Estacion, Nombre_Estacion, Direccion_Estacion, Telefono_Estacion, Representante_Estacion, Correo_Estado, Codigo_Region) VALUES
(1002, 'Estacion 1', 'Calle 1', '1234567890', 'Pedro Perez', 'estacion1@mail.com', 'REG1'),
(1004, 'Estacion 2', 'Avenida 2', '2345678901', 'Maria Garcia', 'estacion2@mail.com', 'REG2'),
(1006, 'Estacion 3', 'Plaza central', '3456789012', 'Juan Rodriguez', 'estacion3@mail.com', 'REG3');

INSERT INTO `vehiculo` (`Matricula`, `Marca`, `Modelo`, `placa_oficial`, `id_estacion`) 
VALUES 
  ('ABC123', 'Toyota', 'Corolla', '1111AAA', 1002),
  ('DEF456', 'Honda', 'Civic', '2222BBB', 1004),
  ('GHI789', 'Chevrolet', 'Spark', '3333CCC', 1006);
