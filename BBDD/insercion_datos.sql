-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2026 a las 19:55:05
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `picoteo_en_ruta`
--

-- --------------------------------------------------------
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Cliente`, `nombreCliente`, `apellidoCliente`, `telefono`, `email`) VALUES
(1, 'Carlos', 'García', '600111111', 'carlos.garcia@email.com'),
(2, 'Ana', 'López', '600222222', 'ana.lopez@email.com'),
(3, 'Luis', 'Martín', '600333333', 'luis.martin@email.com'),
(4, 'Marta', 'Sánchez', '600444444', 'marta.sanchez@email.com'),
(5, 'Pedro', 'Ruiz', '600555555', 'pedro.ruiz@email.com'),
(6, 'Laura', 'Torres', '600666666', 'laura.torres@email.com'),
(7, 'Javier', 'Moreno', '600777777', 'javier.moreno@email.com'),
(8, 'Lucía', 'Romero', '600888888', 'lucia.romero@email.com'),
(9, 'Diego', 'Navarro', '600999999', 'diego.navarro@email.com'),
(10, 'Elena', 'Gil', '601111111', 'elena.gil@email.com'),
(11, 'Sergio', 'Castro', '601222222', 'sergio.castro@email.com'),
(12, 'Paula', 'Ortega', '601333333', 'paula.ortega@email.com'),
(13, 'Raúl', 'Delgado', '601444444', 'raul.delgado@email.com'),
(14, 'Claudia', 'Vega', '601555555', 'claudia.vega@email.com'),
(15, 'Adrián', 'Herrera', '601666666', 'adrian.herrera@email.com'),
(16, 'Sara', 'Molina', '601777777', 'sara.molina@email.com'),
(17, 'Iván', 'Ramos', '601888888', 'ivan.ramos@email.com'),
(18, 'Natalia', 'Cruz', '601999999', 'natalia.cruz@email.com'),
(19, 'Hugo', 'Flores', '602111111', 'hugo.flores@email.com'),
(20, 'Patricia', 'Reyes', '602222222', 'patricia.reyes@email.com'),
(22, 'Indira Amilxu', 'Caicedo Niño', '656589580', 'indira@email.com');

-- --------------------------------------------------------
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`ID_Contrato`, `fecha`, `precioTotal`, `ID_Evento`) VALUES
(17, '2026-05-10', 5000.00, 45),
(18, '2026-06-20', 4500.00, 46),
(19, '2026-10-01', 6200.00, 47),
(20, '2026-01-10', 8000.00, 48),
(21, '2026-01-30', 5500.00, 49),
(22, '2026-02-20', 4800.00, 50),
(23, '2026-03-25', 5300.00, 51),
(24, '2026-04-30', 6000.00, 52),
(25, '2026-06-10', 7200.00, 53),
(26, '2026-06-25', 5100.00, 54),
(27, '2026-07-30', 6900.00, 55),
(28, '2026-08-20', 7500.00, 56),
(29, '2026-09-25', 8200.00, 57),
(30, '2026-10-30', 4300.00, 58),
(31, '2026-11-10', 9100.00, 59),
(32, '2026-01-05', 4700.00, 60),
(33, '2026-02-10', 6400.00, 61),
(34, '2026-03-10', 7100.00, 62),
(35, '2026-04-10', 5600.00, 63),
(36, '2026-05-15', 8800.00, 64);

-- --------------------------------------------------------
-- Volcado de datos para la tabla `detalle_contrato`
--

INSERT INTO `detalle_contrato` (`ID_DetalleContrato`, `precioUnitario`, `cantidad`, `ID_Contrato`, `ID_Stand`) VALUES
(1, 1500.00, 1, 17, 1),
(2, 1200.00, 1, 18, 2),
(3, 1000.00, 1, 19, 3),
(4, 1300.00, 1, 20, 4),
(5, 2000.00, 1, 21, 5),
(6, 2100.00, 1, 22, 6),
(7, 1800.00, 1, 23, 7),
(8, 1400.00, 1, 24, 8),
(9, 900.00, 1, 25, 9),
(10, 1100.00, 1, 26, 10),
(11, 1250.00, 1, 27, 11),
(12, 1500.00, 2, 28, 1),
(13, 1200.00, 2, 29, 2),
(14, 1000.00, 1, 30, 3),
(15, 1300.00, 2, 31, 4),
(16, 2000.00, 1, 32, 5),
(17, 2100.00, 1, 33, 6),
(18, 1800.00, 2, 34, 7),
(19, 1400.00, 1, 35, 8),
(20, 900.00, 2, 36, 9);

-- --------------------------------------------------------
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_Empleado`, `nombreEmpleado`, `apellidoEmpleado`, `telefonoEmpleado`, `emailEmpleado`, `dniEmpleado`, `estadoEmpleado`) VALUES
(21, 'Juan', 'Juarez', '612345678', 'juanperez@email.com', '12341178A', 'activo'),
(22, 'Maria', 'Martinez', '654345671', 'mariamartinez@email.com', '52765238A', 'activo'),
(23, 'Alma', 'Alonso', '655756112', 'almaalonso@email.com', '23442678B', 'activo'),
(24, 'Diego', 'Dunas', '656589560', 'diegodunas@email.com', '98895678D', 'activo'),
(25, 'Daniela', 'Duran', '655788912', 'danieladuran@email.com', '51129878D', 'activo'),
(26, 'Sergio', 'Sainz', '645331234', 'sergiosainz@email.com', '98645678S', 'suspendido'),
(27, 'Ilde', 'Iglesias', '650009786', 'ildeiglesias@email.com', '12123678I', 'activo'),
(28, 'Alvaro', 'Andrade', '611123454', 'alvaroandrade@email.com', '12345678A', 'activo'),
(29, 'Laila', 'López', '678098098', 'lailalopez@email.com', '12968678L', 'inactivo'),
(30, 'Frank', 'Flores', '662334554', 'frankflores@email.com', '12345678F', 'activo');

-- --------------------------------------------------------
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`ID_Evento`, `tipoEvento`, `fechaEvento`, `lugarEvento`, `ID_Cliente`) VALUES
(45, 'Boda', '2026-06-10', 'Madrid', 1),
(46, 'Cumpleaños', '2026-07-13', 'Barcelona', 2),
(47, 'Fiesta infantil', '2026-11-15', 'Valencia', 3),
(48, 'Evento corporativo', '2026-01-21', 'Sevilla', 4),
(49, 'Boda', '2026-02-12', 'Málaga', 5),
(50, 'Cumpleaños', '2026-03-05', 'Bilbao', 6),
(51, 'Fiesta infantil', '2026-04-18', 'Zaragoza', 7),
(52, 'Evento corporativo', '2026-05-22', 'Alicante', 8),
(53, 'Boda', '2026-06-30', 'Granada', 9),
(54, 'Cumpleaños', '2026-07-10', 'Madrid', 10),
(55, 'Fiesta infantil', '2026-08-14', 'Barcelona', 11),
(56, 'Evento corporativo', '2026-09-09', 'Valencia', 12),
(57, 'Boda', '2026-10-20', 'Sevilla', 13),
(58, 'Cumpleaños', '2026-11-11', 'Málaga', 14),
(59, 'Fiesta infantil', '2026-12-01', 'Bilbao', 15),
(60, 'Evento corporativo', '2026-01-15', 'Zaragoza', 16),
(61, 'Boda', '2026-02-25', 'Alicante', 17),
(62, 'Cumpleaños', '2026-03-18', 'Granada', 18),
(63, 'Fiesta infantil', '2026-04-22', 'Madrid', 19),
(64, 'Evento corporativo', '2026-05-30', 'Barcelona', 20);

-- --------------------------------------------------------
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`ID_Pago`, `fechaPago`, `metodoPago`, `montoPago`, `ID_Contrato`) VALUES
(1, '2026-05-01', 'tarjeta', 5000.00, 17),
(2, '2026-06-02', 'transferencia', 4500.00, 18),
(3, '2026-07-05', 'efectivo', 6200.00, 19),
(4, '2026-01-12', 'tarjeta', 8000.00, 20),
(5, '2026-02-10', 'transferencia', 5500.00, 21),
(6, '2026-03-15', 'tarjeta', 4800.00, 22),
(7, '2026-04-20', 'efectivo', 5300.00, 23),
(8, '2026-05-25', 'tarjeta', 6000.00, 24),
(9, '2026-06-28', 'transferencia', 7200.00, 25),
(10, '2026-07-30', 'tarjeta', 5100.00, 26),
(11, '2026-08-15', 'efectivo', 6900.00, 27),
(12, '2026-09-10', 'tarjeta', 7500.00, 28),
(13, '2026-10-12', 'transferencia', 8200.00, 29),
(14, '2026-11-05', 'tarjeta', 4300.00, 30),
(15, '2026-12-10', 'efectivo', 9100.00, 31),
(16, '2026-01-18', 'tarjeta', 4700.00, 32),
(17, '2026-02-28', 'transferencia', 6400.00, 33),
(18, '2026-03-20', 'tarjeta', 7100.00, 34),
(19, '2026-04-25', 'efectivo', 5600.00, 35),
(20, '2026-05-30', 'tarjeta', 8800.00, 36);

-- --------------------------------------------------------
-- Volcado de datos para la tabla `stand`
--

INSERT INTO `stand` (`ID_Stand`, `nombreStand`, `categoria`, `precioBase`, `estado`, `ID_Empleado`) VALUES
(1, 'Coctelería', 'bebidas', 1500.00, 'disponible', 21),
(2, 'Frutas y batidos', 'bebidas', 1200.00, 'ocupado', 22),
(3, 'Café e infusiones', 'bebidas', 1000.00, 'disponible', 23),
(4, 'Arepera', 'salado', 1300.00, 'mantenimiento', 24),
(5, 'Sushi', 'salado', 2000.00, 'ocupado', 25),
(6, 'Hot Pot', 'salado', 2100.00, 'disponible', 27),
(7, 'Barbacoa', 'salado', 1800.00, 'ocupado', 28),
(8, 'Quesos y embutidos', 'salado', 1400.00, 'disponible', 30),
(9, 'Helados', 'dulce', 900.00, 'disponible', 21),
(10, 'Postres', 'dulce', 1100.00, 'ocupado', 22),
(11, 'Gofres y Creps', 'dulce', 1250.00, 'disponible', 23);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
