-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-07-2019 a las 04:16:10
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `Titulo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `IdCategoria` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `IdPalabra` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `TipoEstado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Imagen` varchar(300) COLLATE latin1_spanish_ci NOT NULL,
  `Resena` text COLLATE latin1_spanish_ci NOT NULL,
  `NumClick` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `IdCategoria` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `NombreCat` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `IdComentario` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `Titulo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `ContenidoCon` text COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `TipoEstado` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `ContenidoEs` varchar(40) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `palabraclave`
--

CREATE TABLE `palabraclave` (
  `IdPalabra` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `ContenidoNP` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retroalimentacion`
--

CREATE TABLE `retroalimentacion` (
  `IdRetro` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `Titulo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `NumControl` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `ContenidoRetrp` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `IdUsuario` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `DescUsuario` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `NumControl` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `IdUsuario` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `Correo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `Nombre` text COLLATE latin1_spanish_ci NOT NULL,
  `ApellidoPat` text COLLATE latin1_spanish_ci NOT NULL,
  `ApellidoMat` text COLLATE latin1_spanish_ci NOT NULL,
  `Contraseña` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utiliza`
--

CREATE TABLE `utiliza` (
  `NumControl` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `Titulo` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `FechaFin` date NOT NULL,
  `FechaIni` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`Titulo`),
  ADD KEY `IdCategoria` (`IdCategoria`,`IdPalabra`,`TipoEstado`),
  ADD KEY `IdPalabra` (`IdPalabra`),
  ADD KEY `TipoEstado` (`TipoEstado`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`IdComentario`),
  ADD KEY `Titulo` (`Titulo`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`TipoEstado`);

--
-- Indices de la tabla `palabraclave`
--
ALTER TABLE `palabraclave`
  ADD PRIMARY KEY (`IdPalabra`);

--
-- Indices de la tabla `retroalimentacion`
--
ALTER TABLE `retroalimentacion`
  ADD PRIMARY KEY (`IdRetro`,`Titulo`,`NumControl`),
  ADD KEY `Titulo` (`Titulo`,`NumControl`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`NumControl`),
  ADD KEY `IdUsuario` (`IdUsuario`);

--
-- Indices de la tabla `utiliza`
--
ALTER TABLE `utiliza`
  ADD PRIMARY KEY (`NumControl`,`Titulo`),
  ADD KEY `NumControl` (`NumControl`,`Titulo`),
  ADD KEY `Titulo` (`Titulo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `categoria` (`IdCategoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articulo_ibfk_2` FOREIGN KEY (`IdPalabra`) REFERENCES `palabraclave` (`IdPalabra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `articulo_ibfk_3` FOREIGN KEY (`TipoEstado`) REFERENCES `estado` (`TipoEstado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`Titulo`) REFERENCES `articulo` (`Titulo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `retroalimentacion`
--
ALTER TABLE `retroalimentacion`
  ADD CONSTRAINT `retroalimentacion_ibfk_1` FOREIGN KEY (`Titulo`) REFERENCES `articulo` (`Titulo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `tipousuario` (`IdUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `utiliza`
--
ALTER TABLE `utiliza`
  ADD CONSTRAINT `utiliza_ibfk_1` FOREIGN KEY (`Titulo`) REFERENCES `articulo` (`Titulo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `utiliza_ibfk_2` FOREIGN KEY (`NumControl`) REFERENCES `usuario` (`NumControl`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
