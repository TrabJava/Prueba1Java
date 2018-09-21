-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-09-2018 a las 16:44:59
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liga_nos_vamos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(30) NOT NULL,
  `id_liga` int(11) NOT NULL,
  `logo_equipo` varchar(150) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `id_liga` (`id_liga`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id_equipo`, `nombre_equipo`, `id_liga`, `logo_equipo`, `id_usuario`) VALUES
(1, 'klg', 1, 'ytut', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
CREATE TABLE IF NOT EXISTS `estado_usuario` (
  `id_estado_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_estado_usuario` varchar(30) NOT NULL,
  PRIMARY KEY (`id_estado_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`id_estado_usuario`, `descripcion_estado_usuario`) VALUES
(1, 'Activo'),
(2, 'Desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

DROP TABLE IF EXISTS `jugador`;
CREATE TABLE IF NOT EXISTS `jugador` (
  `rut_jugador` varchar(9) NOT NULL,
  `nombre_jugador` varchar(25) NOT NULL,
  `apellido_jugador` varchar(25) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_titular` int(11) NOT NULL,
  PRIMARY KEY (`rut_jugador`),
  KEY `id_equipo` (`id_equipo`),
  KEY `id_titular` (`id_titular`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`rut_jugador`, `nombre_jugador`, `apellido_jugador`, `id_equipo`, `id_titular`) VALUES
('245', '4253', '4242', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liga`
--

DROP TABLE IF EXISTS `liga`;
CREATE TABLE IF NOT EXISTS `liga` (
  `id_liga` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_liga` varchar(100) NOT NULL,
  PRIMARY KEY (`id_liga`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `liga`
--

INSERT INTO `liga` (`id_liga`, `descripcion_liga`) VALUES
(1, 'League of Lengend'),
(2, 'Fornite'),
(3, 'Counter Strike');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

DROP TABLE IF EXISTS `partido`;
CREATE TABLE IF NOT EXISTS `partido` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `id_liga` int(11) NOT NULL,
  `equipo_1` int(11) NOT NULL,
  `equipo_2` int(11) NOT NULL,
  `equipo_ganador` varchar(30) DEFAULT NULL,
  `equipo_perdedor` varchar(30) DEFAULT NULL,
  `fecha_partido` date NOT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `id_liga` (`id_liga`),
  KEY `equipo_1` (`equipo_1`),
  KEY `equipo_2` (`equipo_2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premio`
--

DROP TABLE IF EXISTS `premio`;
CREATE TABLE IF NOT EXISTS `premio` (
  `id_premio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_premio` varchar(100) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_premio`),
  KEY `id_equipo` (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_usuario` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `descripcion_tipo_usuario`) VALUES
(1, 'superusuario'),
(2, 'administrador'),
(3, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titular`
--

DROP TABLE IF EXISTS `titular`;
CREATE TABLE IF NOT EXISTS `titular` (
  `id_titular` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_titular` varchar(30) NOT NULL,
  PRIMARY KEY (`id_titular`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `titular`
--

INSERT INTO `titular` (`id_titular`, `descripcion_titular`) VALUES
(1, 'Titular'),
(2, 'No titular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(25) NOT NULL,
  `contrasenia` varchar(40) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `id_estado_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`),
  KEY `id_estado_usuario` (`id_estado_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `contrasenia`, `id_tipo_usuario`, `id_estado_usuario`) VALUES
(1, 'super', 'super', 1, 1),
(2, 'admin', 'admin', 2, 1),
(3, 'user', 'user', 3, 1),
(4, 'bernal', 'bernal', 3, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id_liga`),
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`),
  ADD CONSTRAINT `jugador_ibfk_2` FOREIGN KEY (`id_titular`) REFERENCES `titular` (`id_titular`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`equipo_1`) REFERENCES `equipo` (`id_equipo`),
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`equipo_2`) REFERENCES `equipo` (`id_equipo`);

--
-- Filtros para la tabla `premio`
--
ALTER TABLE `premio`
  ADD CONSTRAINT `premio_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_estado_usuario`) REFERENCES `estado_usuario` (`id_estado_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
