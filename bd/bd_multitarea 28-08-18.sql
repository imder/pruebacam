-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-08-2018 a las 00:50:09
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_multitarea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientes`
--

CREATE TABLE `ambientes` (
  `idAmbiente` int(255) NOT NULL,
  `nom_ambiente` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ancho` int(255) NOT NULL,
  `largo` int(255) NOT NULL,
  `altura` int(255) NOT NULL,
  `url_plano` int(11) NOT NULL,
  `relev_idRelev` int(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ambientes`
--

INSERT INTO `ambientes` (`idAmbiente`, `nom_ambiente`, `ancho`, `largo`, `altura`, `url_plano`, `relev_idRelev`) VALUES
(1, 'sistemas', 4, 3, 3, 0, 0),
(2, 'Of. TÃ©cnica ', 3, 4, 2, 0, 0),
(3, '', 0, 0, 0, 0, 0),
(4, 'Of. TÃ©cnica ', 3, 4, 2, 0, 0),
(5, 'Ambiente 3', 3, 4, 2, 0, 0),
(6, 'Ambiente 4', 3, 4, 2, 0, 0),
(7, 'Ambiente 5', 4, 5, 3, 0, 0),
(8, 'Ambiente 6', 3, 4, 2, 0, 0),
(9, 'Ambiente 6i', 3, 4, 2, 0, 0);

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
  `fotografias` varchar(255) DEFAULT NULL,
  `relev_idRelev` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cableado_estructurado`
--

INSERT INTO `cableado_estructurado` (`idCable`, `categoria`, `marca`, `cant_puntos`, `ent_facilidades`, `inst_gabinete`, `planos`, `certificacion`, `fotografias`, `relev_idRelev`) VALUES
(1, '6-A', 'intelligent', 5, 'No', 'Si', NULL, 'Si', NULL, 32),
(2, '5-E', 'FURUKAWA', 8, 'No', 'Si', NULL, 'Si', NULL, 33),
(3, '5-E', '', 0, 'Si', 'Si', NULL, 'Si', NULL, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `idCaracteristica` int(11) NOT NULL,
  `descripCaract` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`idCaracteristica`, `descripCaract`) VALUES
(1, 'Cantidad de puntos'),
(2, 'Categoria'),
(3, 'Marca'),
(4, 'Entrada de facilidades'),
(5, 'Tipo'),
(6, 'Cantidad de puntos camaras y sensores'),
(8, 'Cantidad de interruptores'),
(9, 'Acometida'),
(10, 'Cantidad de luminarias'),
(11, 'Instalacion de gabinete'),
(12, 'Planos'),
(13, 'Certificacion'),
(14, 'Puesta a tierra'),
(15, 'Instalacion de tablero'),
(16, 'Cantidad de puntos de voz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cctv`
--

CREATE TABLE `cctv` (
  `idCctv` int(11) NOT NULL,
  `cant_puntos_cam_sen` int(11) DEFAULT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `fotografias` varchar(255) DEFAULT NULL,
  `relev_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cctv`
--

INSERT INTO `cctv` (`idCctv`, `cant_puntos_cam_sen`, `tipo`, `planos`, `fotografias`, `relev_idRelev`) VALUES
(1, 18, 'cableado estructurado', NULL, NULL, 31);

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
  `fotografias` varchar(25) DEFAULT NULL,
  `relev_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fibra_optica`
--

INSERT INTO `fibra_optica` (`idFibra`, `cant_puntos`, `tipo`, `inst_gabinete`, `planos`, `certificacion`, `fotografias`, `relev_idRelev`) VALUES
(1, 2, 'multimodo', 'Si', NULL, 'Si', NULL, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografias`
--

CREATE TABLE `fotografias` (
  `idFoto` int(10) NOT NULL,
  `nom_foto` varchar(255) NOT NULL DEFAULT '',
  `url_foto` varchar(255) NOT NULL DEFAULT '',
  `tipo_img` varchar(255) DEFAULT NULL,
  `fk_idAmbiente` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fotografias`
--

INSERT INTO `fotografias` (`idFoto`, `nom_foto`, `url_foto`, `tipo_img`, `fk_idAmbiente`) VALUES
(1, '1896934_639466756120295_292223200_n.jpg', '../fotografias/1896934_639466756120295_292223200_n.jpg', 'image/jpeg', 21),
(2, 'ASUS TP550L CPU.png', '../fotografias/ASUS TP550L CPU.png', 'image/png', 27),
(3, '1888727_637968932936744_483239538_n.png', '../fotografias/1888727_637968932936744_483239538_n.png', 'image/png', 28),
(4, '26805234_502512136816446_1097080724416225450_n.jpg', '../fotografias/26805234_502512136816446_1097080724416225450_n.jpg', 'image/jpeg', 29),
(5, '1654308_637960586270912_547469439_n.jpg', '../fotografias/1654308_637960586270912_547469439_n.jpg', 'image/jpeg', 30),
(6, '34471775_279401439268430_1207809614691696640_n.jpg', '../fotografias/34471775_279401439268430_1207809614691696640_n.jpg', 'image/jpeg', 31),
(7, 'copia digital.jpg', '../fotografias/copia digital.jpg', 'image/jpeg', 32),
(8, '26168735_2263445047014480_8720401350081177484_n.png', '../fotografias/26168735_2263445047014480_8720401350081177484_n.png', 'image/png', 33),
(9, '1534459281013283076716.jpg', '../fotografias/1534459281013283076716.jpg', 'image/jpeg', 35),
(10, '15344598371011465888727.jpg', '../fotografias/15344598371011465888727.jpg', 'image/jpeg', 35),
(11, '27544884_1824838841147557_6525088442386346090_n.jpg', '../fotografias/27544884_1824838841147557_6525088442386346090_n.jpg', 'image/jpeg', 38),
(12, '26168735_2263445047014480_8720401350081177484_n.png', '../fotografias/26168735_2263445047014480_8720401350081177484_n.png', 'image/png', 38),
(13, '15354658943741371862858.jpg', '../fotografias/15354658943741371862858.jpg', 'image/jpeg', 38),
(14, '1535465907321-445767747.jpg', '../fotografias/1535465907321-445767747.jpg', 'image/jpeg', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iluminacion`
--

CREATE TABLE `iluminacion` (
  `id_Ilum` int(11) NOT NULL,
  `cant_luminarias` int(11) DEFAULT NULL,
  `cant_lnterruptores` int(11) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `fotografias` varchar(255) DEFAULT NULL,
  `relev_idRelev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `iluminacion`
--

INSERT INTO `iluminacion` (`id_Ilum`, `cant_luminarias`, `cant_lnterruptores`, `planos`, `fotografias`, `relev_idRelev`) VALUES
(1, 12, 13, NULL, NULL, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relevamientos`
--

CREATE TABLE `relevamientos` (
  `idRelev` int(11) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `representante` varchar(30) NOT NULL,
  `correoR` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `lugar` varchar(50) NOT NULL,
  `idUsuario` int(15) DEFAULT NULL,
  `ser_idServ` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `relevamientos`
--

INSERT INTO `relevamientos` (`idRelev`, `cliente`, `representante`, `correoR`, `telefono`, `lugar`, `idUsuario`, `ser_idServ`) VALUES
(3, 'DELUX', 'Miguel Angel de la Barra', 'delabarra@hotmail.com', 78145243, 'El Alto Zona 16 de Julio', 1, 2),
(4, 'GENIUS BOLIVIA', 'Olliverto Condori', 'condori@hotmail.com', 78163353, 'El Alto, Rio seco', 1, 1),
(5, 'BOLIVIA TV', 'Amilcar Barral', 'boliviatv@hotmail.es', 22546264, 'Calacoto Calle 21', 1, 2),
(6, 'SAMSUNG', 'Victor andrade', 'andrade@gmail.com', 79232332, 'La paz, Miraflores Av. Bush', 1, 2),
(7, 'LASER COMP', 'Victor andrade', 'andrade@gmail.com', 79232332, 'La paz, Miraflores Av. Bush', 1, 2),
(8, 'ADUANA', 'Jose Andrade', 'andrade25@gmail.com', 79238532, 'La paz, Sopcachi Av. 20 de Octubre', 1, 1),
(9, 'BANCO UNION', 'Andres Gutierres Pardo', 'pardo2019@union.com.bo', 2458685, 'La Paz, Zona Sur Calacoto Calle 16', 2, 1),
(10, 'RED UNO', 'Gustavo Hinojosa', 'gusti2018@reduno.bo', 65946231, 'La Paz, Chijini Calle 15-A', 2, 1),
(11, 'UNITEL', 'Gonzalo Calle Amaru', 'calle2025@gmail.com', 2465685, 'El Alto, Los andes Av. La paz', 2, 1),
(12, 'NEATEX', 'Luis Luna gonzales', 'lucho2025@htomail.com', 2541347, 'El Alto, Zona Mejillones Av.31', 2, 1),
(13, 'NEATEX', 'Luis Luna gonzales', 'boliviatv@hotmail.es', 2546264, 'El Alto, Rio seco villa tunari ', 2, 1),
(14, 'LIDER', 'Marcelo Andrade', 'chelo2025@gmail.com', 79254532, 'La paz, Sopocachi Plaza Avaroa', 1, 1),
(15, 'FINO', 'Jaime Iturri', 'chelo2025@gmail.com', 79254532, 'La paz, Sopocachi Plaza Avaroa', 1, 1),
(16, 'SOBOCE', 'Samuel Doria', 'samuel2025@gmail.com', 79254634, 'La paz, Sopocachi Plaza Avaroa', 1, 3),
(17, 'SOBOCE2', 'Samuel Doria', 'samuel2025@gmail.com', 79254634, 'La paz, Sopocachi Plaza Avaroa', 1, 2),
(18, 'SOBOCE3', 'Samuel Doria', 'samuel2025@gmail.com', 79254634, 'La paz, Sopocachi Plaza Avaroa', 1, 2),
(19, 'BOLIVIA TV2', 'Olliverto Condori', 'boliviatv@hotmail.es', 65626231, 'El Alto, Los andes Av. La paz', 2, 1),
(20, 'ADUANA2', 'Miguel Angel de la Barra', 'delabarra@hotmail.com', 79232332, 'La paz, Miraflores Av. Bush', 1, 1),
(21, 'ADUANA3', 'Miguel Angel de la Barra', 'delabarra@hotmail.com', 79232332, 'La paz, Miraflores Av. Bush', 1, 2),
(22, 'LASER COMP2', 'Daniel Fernandez Ortega', 'ortega2025@gmail.com', 79854235, 'El Alto Zona Bolivar A', 1, 1),
(23, 'LASER COMP3', 'Daniel Fernandez Ortega', 'ortega2025@gmail.com', 79854235, 'El Alto Zona Bolivar A', 1, 2),
(24, 'LASER COMP4', 'Daniel Fernandez Ortega', 'ortega2025@gmail.com', 79854235, 'El Alto Zona Bolivar A', 1, 3),
(25, 'LASER COMP5', 'Daniel Fernandez Ortega', 'ortega2025@gmail.com', 79854235, 'El Alto Zona Bolivar A', 1, 4),
(26, 'LASER COMP6', 'Daniel Fernandez Ortega', 'ortega2025@gmail.com', 79854235, 'El Alto Zona Bolivar A', 1, 5),
(27, 'GENIUS BOLIVIA2', 'Amilcar Barral', 'gusti2018@reduno.bo', 22546264, 'El Alto, Rio seco villa tunari', 2, 2),
(28, 'DELUX2', 'Daniel Fernandez Ortega', 'ortega2025@gmail.com', 79854235, 'El Alto Zona Bolivar A', 1, 3),
(29, 'Adventure Works', 'Greg Akselrod', 'AdventureWorks@live.com', 123, 'Calacoto Calle 21', 2, 4),
(30, 'SAMSUNG6', 'Victor andrade', 'delabarra@hotmail.com', 79854235, 'La paz, Miraflores Av. Bush', 1, 4),
(31, 'A Datum Corporation', 'Abolrous, Hazem', 'hazem@example.com', 123, 'La Paz, Chijini Calle 15-A', 2, 5),
(32, 'BANCO DE LA PRODUCCI', 'HECTOR VIVERO', 'bancaenlinea@produbanco.com', 74058593, 'AV. AMAZONAS N35-211 Y JAPON', 1, 1),
(33, 'LIDER5', 'Miguel Angel de la Barra', 'andrade@gmail.com', 79232332, 'El Alto Zona 25 de Julio', 1, 1),
(34, 'genex35', 'Jaime Iturri Valda', 'iturry2025@hotmail.com', 79854235, 'La paz, Miraflores Av. Cuba', 2, 2),
(35, 'UPEA3', 'herbert Alvarado ', 'delabarra@hotmail.com', 78145243, 'El Alto Zona 16 de Julio', 1, 2),
(36, '3M DISTRIBUIDOR', 'Alan Padilla', 'emcosimlpz@entelnet.bo', 74546618, 'Av Bush #1599 esq Pasoso Kanki', 1, 2),
(37, 'Entel', 'Victor andrade', 'sanchez@gmail.com', 75655334, 'La paz, Miraflores Av. Bush', 2, 3),
(38, 'Entel2', 'Victor andrade', 'sanchez@gmail.com', 75655334, 'La paz, Miraflores Av. Bush', 2, 3);

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
  `Descripcion` varchar(100) DEFAULT NULL,
  `nivel` int(2) DEFAULT NULL,
  `idCaracteristicas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idServicio`, `Descripcion`, `nivel`, `idCaracteristicas`) VALUES
(1, 'Cableado estructurado en cobre', 1, '1;2;3;4;11;12;13'),
(2, 'Fibra Optica', 1, '1;5;11;12;13'),
(3, 'Iluminacion', 1, '8;10;12'),
(4, 'Sistema Electrico', 1, '5;9;14;15'),
(5, 'CCTV', 1, '5;6;12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_electrico`
--

CREATE TABLE `sistema_electrico` (
  `id_Electro` int(50) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `acometida` varchar(25) DEFAULT NULL,
  `puesta_tierra` varchar(25) DEFAULT NULL,
  `inst_tablero` varchar(25) DEFAULT NULL,
  `fotografias` varchar(255) DEFAULT NULL,
  `relev_idRelev` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sistema_electrico`
--

INSERT INTO `sistema_electrico` (`id_Electro`, `tipo`, `acometida`, `puesta_tierra`, `inst_tablero`, `fotografias`, `relev_idRelev`) VALUES
(1, 'monofasico', 'no', 'si', 'si', NULL, 30),
(2, 'trifasico', 'No', 'Si', 'Si', NULL, 30),
(3, 'monofasico', 'No', 'Si', 'Si', NULL, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `Cedula` int(10) NOT NULL,
  `Nombres` varchar(25) NOT NULL,
  `appaterno` varchar(30) NOT NULL,
  `apmaterno` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `nivel` varchar(15) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `passwords` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `Cedula`, `Nombres`, `appaterno`, `apmaterno`, `telefono`, `nivel`, `usuario`, `passwords`) VALUES
(1, 7050155, 'Daniel Reynaldo', 'Canaviri', 'Mayta', 77597376, '3', 'dany', '0f7b2bb5d0c7e6209ecff113108f64cf'),
(2, 7512425, 'Vanessa', 'Vargas', 'Ortiz', 65923542, '1', 'vane', '3a24b25a7b092a252166a1641ae953e7');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`idAmbiente`);

--
-- Indices de la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  ADD PRIMARY KEY (`idCable`),
  ADD KEY `relev_idRelev` (`relev_idRelev`);

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
  ADD KEY `relev_idRelev` (`relev_idRelev`);

--
-- Indices de la tabla `fibra_optica`
--
ALTER TABLE `fibra_optica`
  ADD PRIMARY KEY (`idFibra`),
  ADD KEY `relev_idRelev` (`relev_idRelev`);

--
-- Indices de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  ADD PRIMARY KEY (`idFoto`),
  ADD KEY `cable_idCable` (`fk_idAmbiente`),
  ADD KEY `relev_idRelev` (`fk_idAmbiente`),
  ADD KEY `relev_idRelev_2` (`fk_idAmbiente`);

--
-- Indices de la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  ADD PRIMARY KEY (`id_Ilum`),
  ADD KEY `relev_idRelev` (`relev_idRelev`);

--
-- Indices de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  ADD PRIMARY KEY (`idRelev`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `ser_idServ` (`ser_idServ`);

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
  ADD PRIMARY KEY (`id_Electro`),
  ADD KEY `relev_idRelev` (`relev_idRelev`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `idAmbiente` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  MODIFY `idCable` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `cctv`
--
ALTER TABLE `cctv`
  MODIFY `idCctv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `fibra_optica`
--
ALTER TABLE `fibra_optica`
  MODIFY `idFibra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `fotografias`
--
ALTER TABLE `fotografias`
  MODIFY `idFoto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  MODIFY `id_Ilum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  MODIFY `idRelev` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `resumen`
--
ALTER TABLE `resumen`
  MODIFY `idResumen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `sistema_electrico`
--
ALTER TABLE `sistema_electrico`
  MODIFY `id_Electro` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cableado_estructurado`
--
ALTER TABLE `cableado_estructurado`
  ADD CONSTRAINT `fk_cableado_relevamientos` FOREIGN KEY (`relev_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cctv`
--
ALTER TABLE `cctv`
  ADD CONSTRAINT `fk_cctv_relevamientos` FOREIGN KEY (`relev_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `fibra_optica`
--
ALTER TABLE `fibra_optica`
  ADD CONSTRAINT `fk_fibra_relevamientos` FOREIGN KEY (`relev_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `iluminacion`
--
ALTER TABLE `iluminacion`
  ADD CONSTRAINT `fk_iluminacion_relevamientos` FOREIGN KEY (`relev_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  ADD CONSTRAINT `fk_relevamientos_servicios` FOREIGN KEY (`ser_idServ`) REFERENCES `servicios` (`idServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_relevamientos_usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sistema_electrico`
--
ALTER TABLE `sistema_electrico`
  ADD CONSTRAINT `fk_electrico_relevamientos` FOREIGN KEY (`relev_idRelev`) REFERENCES `relevamientos` (`idRelev`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
