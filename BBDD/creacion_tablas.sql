-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2026 a las 19:54:44
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

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `nombreCliente` varchar(50) NOT NULL,
  `apellidoCliente` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `ID_Contrato` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `ID_Evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--

--
-- Estructura de tabla para la tabla `detalle_contrato`
--

CREATE TABLE `detalle_contrato` (
  `ID_DetalleContrato` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL CHECK (`precioUnitario` >= 0),
  `cantidad` int(11) NOT NULL CHECK (`cantidad` > 0),
  `ID_Contrato` int(11) NOT NULL,
  `ID_Stand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL,
  `nombreEmpleado` varchar(50) NOT NULL,
  `apellidoEmpleado` varchar(50) NOT NULL,
  `telefonoEmpleado` varchar(20) DEFAULT NULL,
  `emailEmpleado` varchar(100) DEFAULT NULL,
  `dniEmpleado` varchar(20) NOT NULL,
  `estadoEmpleado` enum('activo','inactivo','suspendido') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `ID_Evento` int(11) NOT NULL,
  `tipoEvento` enum('Boda','Cumpleaños','Fiesta infantil','Evento corporativo') NOT NULL,
  `fechaEvento` date NOT NULL,
  `lugarEvento` varchar(100) NOT NULL,
  `ID_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `ID_Pago` int(11) NOT NULL,
  `fechaPago` date NOT NULL,
  `metodoPago` varchar(50) NOT NULL,
  `montoPago` decimal(10,2) NOT NULL CHECK (`montoPago` > 0),
  `ID_Contrato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estructura de tabla para la tabla `stand`
--

CREATE TABLE `stand` (
  `ID_Stand` int(11) NOT NULL,
  `nombreStand` enum('Coctelería','Frutas y batidos','Café e infusiones','Arepera','Sushi','Hot Pot','Barbacoa','Quesos y embutidos','Helados','Postres','Gofres y Creps') NOT NULL,
  `categoria` enum('dulce','salado','bebidas') NOT NULL,
  `precioBase` decimal(10,2) NOT NULL CHECK (`precioBase` >= 0),
  `estado` enum('disponible','ocupado','mantenimiento','inactivo') NOT NULL DEFAULT 'disponible',
  `ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`ID_Contrato`),
  ADD UNIQUE KEY `unique_contrato_evento` (`ID_Evento`);

--
-- Indices de la tabla `detalle_contrato`
--
ALTER TABLE `detalle_contrato`
  ADD PRIMARY KEY (`ID_DetalleContrato`),
  ADD UNIQUE KEY `uq_contrato_stand` (`ID_Contrato`,`ID_Stand`),
  ADD KEY `idx_detalle_contrato` (`ID_Contrato`),
  ADD KEY `idx_detalle_stand` (`ID_Stand`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_Empleado`),
  ADD UNIQUE KEY `dniEmpleado` (`dniEmpleado`),
  ADD UNIQUE KEY `emailEmpleado` (`emailEmpleado`),
  ADD UNIQUE KEY `telefonoEmpleado` (`telefonoEmpleado`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`ID_Evento`),
  ADD UNIQUE KEY `unique_evento_cliente` (`ID_Cliente`,`fechaEvento`,`lugarEvento`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`ID_Pago`),
  ADD KEY `idx_pago_contrato` (`ID_Contrato`),
  ADD KEY `idx_pago_fecha` (`fechaPago`);

--
-- Indices de la tabla `stand`
--
ALTER TABLE `stand`
  ADD PRIMARY KEY (`ID_Stand`),
  ADD KEY `idx_stand_empleado` (`ID_Empleado`),
  ADD KEY `idx_stand_estado` (`estado`),
  ADD KEY `idx_stand_categoria` (`categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `ID_Contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `detalle_contrato`
--
ALTER TABLE `detalle_contrato`
  MODIFY `ID_DetalleContrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `ID_Evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `ID_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `stand`
--
ALTER TABLE `stand`
  MODIFY `ID_Stand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas

-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `fk_contrato_evento` FOREIGN KEY (`ID_Evento`) REFERENCES `evento` (`ID_Evento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_contrato`
--
ALTER TABLE `detalle_contrato`
  ADD CONSTRAINT `fk_detalle_contrato` FOREIGN KEY (`ID_Contrato`) REFERENCES `contrato` (`ID_Contrato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_stand` FOREIGN KEY (`ID_Stand`) REFERENCES `stand` (`ID_Stand`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_contrato` FOREIGN KEY (`ID_Contrato`) REFERENCES `contrato` (`ID_Contrato`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `stand`
--
ALTER TABLE `stand`
  ADD CONSTRAINT `fk_stand_empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
