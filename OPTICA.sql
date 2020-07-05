-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-07-2020 a las 21:13:11
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `OPTICA`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLIENTE`
--

CREATE TABLE `CLIENTE` (
  `ID_CLIENTE` int(20) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `DATA_REGISTRE` date NOT NULL,
  `ES_RECOMENDADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `CLIENTE`:
--   `ID_CLIENTE`
--       `DATOS_PERSONA` -> `ID`
--   `ES_RECOMENDADO`
--       `RECOMENDACION` -> `CLIENTE_RECOMENDADO`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DATOS_PERSONA`
--

CREATE TABLE `DATOS_PERSONA` (
  `ID` int(20) NOT NULL,
  `NOM` varchar(100) NOT NULL,
  `CARRER` varchar(100) NOT NULL,
  `NUMERO` int(20) NOT NULL,
  `PIS` int(20) NOT NULL,
  `PORTA` int(20) NOT NULL,
  `CIUTAT` varchar(100) NOT NULL,
  `CODI_POSTAL` int(20) NOT NULL,
  `PAIS` varchar(100) NOT NULL,
  `TELEFONO` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `DATOS_PERSONA`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLEADO_VENTA`
--

CREATE TABLE `EMPLEADO_VENTA` (
  `ID_EMPLEADO` int(20) NOT NULL,
  `ID_ULLERAS` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `EMPLEADO_VENTA`:
--   `ID_ULLERAS`
--       `ULLERES` -> `ID_ULLERES`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MUNTURA`
--

CREATE TABLE `MUNTURA` (
  `ID_MUNTURA` int(20) NOT NULL,
  `COLOR` varchar(100) NOT NULL,
  `ES_FLOTANT` tinyint(1) NOT NULL,
  `ES_METALICA` tinyint(1) NOT NULL,
  `ES_PASTA` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `MUNTURA`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROVEIDOR`
--

CREATE TABLE `PROVEIDOR` (
  `NIF` int(20) NOT NULL,
  `FAX` int(20) NOT NULL,
  `ID_PROVEIDOR` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `PROVEIDOR`:
--   `ID_PROVEIDOR`
--       `DATOS_PERSONA` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RECOMENDACION`
--

CREATE TABLE `RECOMENDACION` (
  `CLIENTE_RECOMENDADO` tinyint(1) NOT NULL,
  `ID_CLIENTE` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `RECOMENDACION`:
--   `ID_CLIENTE`
--       `DATOS_PERSONA` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ULLERES`
--

CREATE TABLE `ULLERES` (
  `ID_ULLERES` int(20) NOT NULL,
  `REF_VIDRES` int(11) NOT NULL,
  `REF_MUNTURA` int(11) NOT NULL,
  `PREU` float NOT NULL,
  `MARCA` varchar(100) NOT NULL,
  `ID_PROVEIDOR` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `ULLERES`:
--   `REF_MUNTURA`
--       `MUNTURA` -> `ID_MUNTURA`
--   `REF_VIDRES`
--       `VIDRES` -> `ID_VIDRES`
--   `ID_PROVEIDOR`
--       `PROVEIDOR` -> `ID_PROVEIDOR`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VIDRES`
--

CREATE TABLE `VIDRES` (
  `ID_VIDRES` int(20) NOT NULL,
  `GRADUACIO` decimal(20,0) NOT NULL,
  `COLOR` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `VIDRES`:
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD PRIMARY KEY (`ID_CLIENTE`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`),
  ADD KEY `ES_RECOMENDADO` (`ES_RECOMENDADO`);

--
-- Indices de la tabla `DATOS_PERSONA`
--
ALTER TABLE `DATOS_PERSONA`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `EMPLEADO_VENTA`
--
ALTER TABLE `EMPLEADO_VENTA`
  ADD PRIMARY KEY (`ID_EMPLEADO`),
  ADD KEY `ID_ULLERAS` (`ID_ULLERAS`);

--
-- Indices de la tabla `MUNTURA`
--
ALTER TABLE `MUNTURA`
  ADD PRIMARY KEY (`ID_MUNTURA`);

--
-- Indices de la tabla `PROVEIDOR`
--
ALTER TABLE `PROVEIDOR`
  ADD PRIMARY KEY (`NIF`),
  ADD KEY `ID_PROVEIDOR` (`ID_PROVEIDOR`);

--
-- Indices de la tabla `RECOMENDACION`
--
ALTER TABLE `RECOMENDACION`
  ADD PRIMARY KEY (`CLIENTE_RECOMENDADO`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- Indices de la tabla `ULLERES`
--
ALTER TABLE `ULLERES`
  ADD PRIMARY KEY (`ID_ULLERES`),
  ADD KEY `ID_PROVEIDOR` (`ID_PROVEIDOR`),
  ADD KEY `REF_VIDRES` (`REF_VIDRES`),
  ADD KEY `REF_MUNTURA` (`REF_MUNTURA`);

--
-- Indices de la tabla `VIDRES`
--
ALTER TABLE `VIDRES`
  ADD PRIMARY KEY (`ID_VIDRES`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `DATOS_PERSONA` (`ID`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ES_RECOMENDADO`) REFERENCES `RECOMENDACION` (`CLIENTE_RECOMENDADO`);

--
-- Filtros para la tabla `EMPLEADO_VENTA`
--
ALTER TABLE `EMPLEADO_VENTA`
  ADD CONSTRAINT `empleado_venta_ibfk_1` FOREIGN KEY (`ID_ULLERAS`) REFERENCES `ULLERES` (`ID_ULLERES`);

--
-- Filtros para la tabla `PROVEIDOR`
--
ALTER TABLE `PROVEIDOR`
  ADD CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`ID_PROVEIDOR`) REFERENCES `DATOS_PERSONA` (`ID`);

--
-- Filtros para la tabla `RECOMENDACION`
--
ALTER TABLE `RECOMENDACION`
  ADD CONSTRAINT `recomendacion_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `DATOS_PERSONA` (`ID`);

--
-- Filtros para la tabla `ULLERES`
--
ALTER TABLE `ULLERES`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`REF_MUNTURA`) REFERENCES `MUNTURA` (`ID_MUNTURA`),
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`REF_VIDRES`) REFERENCES `VIDRES` (`ID_VIDRES`),
  ADD CONSTRAINT `ulleres_ibfk_3` FOREIGN KEY (`ID_PROVEIDOR`) REFERENCES `PROVEIDOR` (`ID_PROVEIDOR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
