-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2018 a las 06:32:57
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_multi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientes`
--

CREATE TABLE `ambientes` (
  `id` int(11) NOT NULL,
  `nom_ambiente` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ambientes`
--

INSERT INTO `ambientes` (`id`, `nom_ambiente`, `ancho`, `largo`, `altura`, `datos_red`, `datos_energia`, `datos_cctv`, `datos_luminaria`, `url_plano`, `fk_idRelev`, `idAmbiente`) VALUES
(1, 'Sotano', 3, 4, 2, 1, 2, 0, 1, 0, 1, 1),
(2, 'Planta baja', 4, 4, 3, 4, 4, 2, 2, 0, 1, 2),
(3, 'Salon principal', 4, 10, 4, 3, 0, 0, 2, 0, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cableado_estructurado`
--

CREATE TABLE `cableado_estructurado` (
  `idCable` int(5) NOT NULL,
  `categoria` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `marca` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cant_puntos` int(2) DEFAULT NULL,
  `ent_facilidades` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inst_gabinete` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `planos` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `certificacion` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_idRelev` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cableado_estructurado`
--

INSERT INTO `cableado_estructurado` (`idCable`, `categoria`, `marca`, `cant_puntos`, `ent_facilidades`, `inst_gabinete`, `planos`, `certificacion`, `fk_idRelev`) VALUES
(1, '6', 'INTELLIGENT', 5, 'No', 'Si', NULL, 'Si', 1),
(2, '5-E', 'intelligent', 3, 'Si', 'Si', NULL, 'Si', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `idCaracteristica` int(11) NOT NULL,
  `descripCaract` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cctv`
--

CREATE TABLE `cctv` (
  `idCctv` int(11) NOT NULL,
  `cant_p_cam_sen` int(11) DEFAULT NULL,
  `tipo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `planos` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cctv`
--

INSERT INTO `cctv` (`idCctv`, `cant_p_cam_sen`, `tipo`, `planos`, `fk_idRelev`) VALUES
(1, 2, 'Sensores de humo ', NULL, 1);

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

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `cliente`, `representante`, `correoR`, `telefono`, `direccion`) VALUES
(1, 'LASER COMP', 'Elmer el gruÃ±on', 'elmer@gmail.com', 78536931, 'Zona Villa el carmen av. 25 nro 45'),
(2, 'UPEA3', 'Jose luis ', 'jose@gmail.com', 72855888, 'Av juan pablo II ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contador`
--

CREATE TABLE `contador` (
  `cont` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `contador`
--

INSERT INTO `contador` (`cont`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fibra_optica`
--

CREATE TABLE `fibra_optica` (
  `idFibra` int(11) NOT NULL,
  `cant_puntos` int(11) DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inst_gabinete` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `planos` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `certificacion` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografias`
--

CREATE TABLE `fotografias` (
  `idFoto` int(10) NOT NULL,
  `nom_foto` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `url_foto` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `tipo_img` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_idAmbiente` int(11) NOT NULL DEFAULT '0',
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fotografias`
--

INSERT INTO `fotografias` (`idFoto`, `nom_foto`, `url_foto`, `tipo_img`, `fk_idAmbiente`, `fk_idRelev`) VALUES
(1, '1536723557167398228912.jpg', '../fotografias/1536723557167398228912.jpg', 'image/jpeg', 1, 1),
(2, '1536723639390-494357269.jpg', '../fotografias/1536723639390-494357269.jpg', 'image/jpeg', 2, 1),
(3, '153672365412735875117.jpg', '../fotografias/153672365412735875117.jpg', 'image/jpeg', 2, 1),
(4, '1536770360373215557244.jpg', '../fotografias/1536770360373215557244.jpg', 'image/jpeg', 1, 2),
(5, '1536770377764-73610904.jpg', '../fotografias/1536770377764-73610904.jpg', 'image/jpeg', 1, 2),
(6, '1536770386783-1229934730.jpg', '../fotografias/1536770386783-1229934730.jpg', 'image/jpeg', 1, 2),
(7, 'pexels-photo-275484.jpeg', '../fotografias/pexels-photo-275484.jpeg', 'image/jpeg', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iluminacion`
--

CREATE TABLE `iluminacion` (
  `id_Ilum` int(11) NOT NULL,
  `cant_luminarias` int(11) DEFAULT NULL,
  `cant_lnterruptores` int(11) DEFAULT NULL,
  `planos` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `iluminacion`
--

INSERT INTO `iluminacion` (`id_Ilum`, `cant_luminarias`, `cant_lnterruptores`, `planos`, `fk_idRelev`) VALUES
(1, 3, 3, NULL, 1),
(2, 2, 1, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planos`
--

CREATE TABLE `planos` (
  `idPlano` int(11) NOT NULL,
  `url_plano` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fk_idAmb` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `planos`
--

INSERT INTO `planos` (`idPlano`, `url_plano`, `fk_idAmb`) VALUES
(1, '../planos/plano_5b98b4bf9bf8e.png', 1),
(2, '../planos/plano_5b98b51c0abcd.png', 2),
(3, '../planos/plano_5b996ba960511.png', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relevamientos`
--

CREATE TABLE `relevamientos` (
  `idRelev` int(11) NOT NULL,
  `fk_idUsuario` int(15) DEFAULT NULL,
  `fk_idCliente` int(255) NOT NULL,
  `fk_idServicio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `relevamientos`
--

INSERT INTO `relevamientos` (`idRelev`, `fk_idUsuario`, `fk_idCliente`, `fk_idServicio`) VALUES
(1, 2, 1, NULL),
(2, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen`
--

CREATE TABLE `resumen` (
  `idResumen` int(11) NOT NULL,
  `rel_idRelev` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ser_idServ` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `car_idCaracter` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `res_descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nivel` int(2) DEFAULT NULL,
  `caracteristicas` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_electrico`
--

CREATE TABLE `sistema_electrico` (
  `idElectro` int(50) NOT NULL,
  `p_energia` int(11) DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `acometida` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `puesta_tierra` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inst_tablero` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_idRelev` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sistema_electrico`
--

INSERT INTO `sistema_electrico` (`idElectro`, `p_energia`, `tipo`, `acometida`, `puesta_tierra`, `inst_tablero`, `fk_idRelev`) VALUES
(1, 6, 'Monofasico', 'Si', 'Si', 'No', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombres` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `appaterno` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `apmaterno` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(10) NOT NULL,
  `nivel` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `username` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `passwords` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `cedula`, `nombres`, `appaterno`, `apmaterno`, `telefono`, `nivel`, `username`, `passwords`) VALUES
(1, 7050155, 'Daniel Reynaldo', 'Canaviri', 'Mayta', 775973786, '3', 'dany', '0f7b2bb5d0c7e6209ecff113108f64cf'),
(2, 6598515, 'Vanessa', 'Vargas', 'Ortiz', 61544632, '1', 'vane', '3a24b25a7b092a252166a1641ae953e7');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAmbiente` (`idAmbiente`),
  ADD KEY `fk_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  ADD PRIMARY KEY (`idCable`),
  ADD KEY `relev_idRelev` (`fk_idRelev`),
  ADD KEY `fk_idRelev` (`fk_idRelev`);

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
  ADD KEY `relev_idRelev` (`fk_idRelev`),
  ADD KEY `fk_idRelev` (`fk_idRelev`);

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
  ADD KEY `relev_idRelev` (`fk_idRelev`),
  ADD KEY `fk_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD PRIMARY KEY (`idFoto`),
  ADD KEY `fk_idRelev` (`fk_idRelev`),
  ADD KEY `fk_idAmbiente` (`fk_idAmbiente`);

--
-- Indices de la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  ADD PRIMARY KEY (`id_Ilum`),
  ADD KEY `relev_idRelev` (`fk_idRelev`),
  ADD KEY `fk_idRelev` (`fk_idRelev`);

--
-- Indices de la tabla `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`idPlano`),
  ADD KEY `fk_idAmbiente` (`fk_idAmb`),
  ADD KEY `fk_idAmb` (`fk_idAmb`);

--
-- Indices de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  ADD PRIMARY KEY (`idRelev`),
  ADD KEY `idUsuario` (`fk_idUsuario`),
  ADD KEY `fk_idCliente` (`fk_idCliente`),
  ADD KEY `fk_idUsuario` (`fk_idUsuario`);

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
  ADD KEY `relev_idRelev` (`fk_idRelev`),
  ADD KEY `fk_idRelev` (`fk_idRelev`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  MODIFY `idCable` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cctv`
--
ALTER TABLE `cctv`
  MODIFY `idCctv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `fibra_optica`
--
ALTER TABLE `fibra_optica`
  MODIFY `idFibra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  MODIFY `idFoto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  MODIFY `id_Ilum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `planos`
--
ALTER TABLE `planos`
  MODIFY `idPlano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  MODIFY `idRelev` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `idElectro` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD CONSTRAINT `fk_relevamientos_ambientes` FOREIGN KEY (`fk_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  ADD CONSTRAINT `fk_cableado_relevamientos` FOREIGN KEY (`fk_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cctv`
--
ALTER TABLE `cctv`
  ADD CONSTRAINT `fk_cctv_relevamientos` FOREIGN KEY (`fk_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fibra_optica`
--
ALTER TABLE `fibra_optica`
  ADD CONSTRAINT `fk_fibra_relevamientos` FOREIGN KEY (`fk_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD CONSTRAINT `fk_fotografias_relevamientos` FOREIGN KEY (`fk_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  ADD CONSTRAINT `fk_iluminacion_relevamientos` FOREIGN KEY (`fk_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `planos`
--
ALTER TABLE `planos`
  ADD CONSTRAINT `fk_planos_ambientes` FOREIGN KEY (`fk_idAmb`) REFERENCES `ambientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  ADD CONSTRAINT `fk_clientes_relevamientos` FOREIGN KEY (`fk_idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_relevamientos` FOREIGN KEY (`fk_idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sistema_electrico`
--
ALTER TABLE `sistema_electrico`
  ADD CONSTRAINT `fk_electrico_relevamientos` FOREIGN KEY (`fk_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
