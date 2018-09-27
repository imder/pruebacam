-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2018 a las 06:33:52
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientes`
--

CREATE TABLE `ambientes` (
  `id` int(11) NOT NULL,
  `nom_ambiente` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ancho` int(255) NOT NULL,
  `largo` int(255) NOT NULL,
  `altura` int(255) NOT NULL,
  `datos_red` int(50) NOT NULL,
  `datos_energia` int(50) NOT NULL,
  `datos_cctv` int(50) NOT NULL,
  `datos_luminaria` int(50) NOT NULL,
  `url_plano` int(11) NOT NULL,
  `fk_idRelev` int(35) NOT NULL,
  `idAmbiente` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cableado_estructurado`
--

CREATE TABLE `cableado_estructurado` (
  `idCable` int(5) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `cant_puntos` int(2) DEFAULT NULL,
  `ent_facilidades` varchar(20) DEFAULT NULL,
  `inst_gabinete` varchar(20) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `certificacion` varchar(20) DEFAULT NULL,
  `fk_idRelev` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `idCaracteristica` int(11) NOT NULL,
  `descripCaract` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cctv`
--

CREATE TABLE `cctv` (
  `idCctv` int(11) NOT NULL,
  `cant_p_cam_sen` int(11) DEFAULT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(255) NOT NULL,
  `cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `representante` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correoR` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(35) NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contador`
--

CREATE TABLE `contador` (
  `cont` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fibra_optica`
--

CREATE TABLE `fibra_optica` (
  `idFibra` int(11) NOT NULL,
  `cant_puntos` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `inst_gabinete` varchar(11) DEFAULT NULL,
  `planos` varchar(25) DEFAULT NULL,
  `certificacion` varchar(25) DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografias`
--

CREATE TABLE `fotografias` (
  `idFoto` int(10) NOT NULL,
  `nom_foto` varchar(255) NOT NULL DEFAULT '',
  `url_foto` varchar(255) NOT NULL DEFAULT '',
  `tipo_img` varchar(255) DEFAULT NULL,
  `fk_idAmbiente` int(11) NOT NULL DEFAULT '0',
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iluminacion`
--

CREATE TABLE `iluminacion` (
  `id_Ilum` int(11) NOT NULL,
  `cant_luminarias` int(11) DEFAULT NULL,
  `cant_lnterruptores` int(11) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planos`
--

CREATE TABLE `planos` (
  `idPlano` int(11) NOT NULL,
  `url_plano` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fk_idAmb` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relevamientos`
--

CREATE TABLE `relevamientos` (
  `idRelev` int(11) NOT NULL,
  `fk_idUsuario` int(15) DEFAULT NULL,
  `fk_idCliente` int(255) NOT NULL,
  `fk_idServicio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen`
--

CREATE TABLE `resumen` (
  `idResumen` int(11) NOT NULL,
  `rel_idRelev` varchar(255) DEFAULT NULL,
  `ser_idServ` varchar(255) DEFAULT NULL,
  `car_idCaracter` varchar(255) DEFAULT NULL,
  `res_descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `nivel` int(2) DEFAULT NULL,
  `caracteristicas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_electrico`
--

CREATE TABLE `sistema_electrico` (
  `idElectro` int(50) NOT NULL,
  `p_energia` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `acometida` varchar(25) DEFAULT NULL,
  `puesta_tierra` varchar(25) DEFAULT NULL,
  `inst_tablero` varchar(25) DEFAULT NULL,
  `fk_idRelev` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `appaterno` varchar(30) NOT NULL,
  `apmaterno` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `nivel` varchar(15) NOT NULL,
  `username` varchar(40) NOT NULL,
  `passwords` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAmbiente` (`idAmbiente`);

--
-- Indices de la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  ADD PRIMARY KEY (`idCable`),
  ADD KEY `relev_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`idCaracteristica`);

--
-- Indices de la tabla `cctv`
--
ALTER TABLE `cctv`
  ADD PRIMARY KEY (`idCctv`),
  ADD KEY `relev_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `fibra_optica`
--
ALTER TABLE `fibra_optica`
  ADD PRIMARY KEY (`idFibra`),
  ADD KEY `relev_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD PRIMARY KEY (`idFoto`),
  ADD KEY `cable_idCable` (`fk_idAmbiente`),
  ADD KEY `relev_idRelev` (`fk_idAmbiente`),
  ADD KEY `relev_idRelev_2` (`fk_idAmbiente`),
  ADD KEY `fk_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  ADD PRIMARY KEY (`id_Ilum`),
  ADD KEY `relev_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`idPlano`),
  ADD KEY `fk_idAmbiente` (`fk_idAmb`);

--
-- Indices de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  ADD PRIMARY KEY (`idRelev`),
  ADD KEY `idUsuario` (`fk_idUsuario`),
  ADD KEY `ser_idServ` (`fk_idServicio`),
  ADD KEY `fk_idCliente` (`fk_idCliente`);

--
-- Indices de la tabla `resumen`
--
ALTER TABLE `resumen`
  ADD PRIMARY KEY (`idResumen`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicio`),
  ADD KEY `idServicio` (`idServicio`);

--
-- Indices de la tabla `sistema_electrico`
--
ALTER TABLE `sistema_electrico`
  ADD PRIMARY KEY (`idElectro`),
  ADD KEY `relev_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  MODIFY `idCable` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cctv`
--
ALTER TABLE `cctv`
  MODIFY `idCctv` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fibra_optica`
--
ALTER TABLE `fibra_optica`
  MODIFY `idFibra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  MODIFY `idFoto` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  MODIFY `id_Ilum` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `planos`
--
ALTER TABLE `planos`
  MODIFY `idPlano` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  MODIFY `idRelev` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `resumen`
--
ALTER TABLE `resumen`
  MODIFY `idResumen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sistema_electrico`
--
ALTER TABLE `sistema_electrico`
  MODIFY `idElectro` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
