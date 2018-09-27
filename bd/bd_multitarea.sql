-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2018 a las 03:19:25
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
(15, 'Instalacion de tablero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenesrel`
--

CREATE TABLE `imagenesrel` (
  `idImagen` int(10) NOT NULL,
  `relev_idRelev` int(11) NOT NULL,
  `imagen` varchar(35) NOT NULL,
  `url` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relevamientos`
--

CREATE TABLE `relevamientos` (
  `cliente` varchar(20) NOT NULL,
  `representante` varchar(30) NOT NULL,
  `correoR` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `lugar` varchar(50) NOT NULL,
  `idRelev` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `relevamientos`
--

INSERT INTO `relevamientos` (`cliente`, `representante`, `correoR`, `telefono`, `lugar`, `idRelev`) VALUES
('BANCO UNION', 'marcelo', 'marcelo@multitareasrl.com', 72152304, 'miraflores', 1),
('BBV', 'JUAN PABLO', 'juanpablo@gmail.com', 456454123, 'irpavi', 2),
('OST TECHd', 'marcelod', 'fernando@gmail.com', 2147483647, 'miraflores', 3),
('OST TECHdre', 'marcelod', 'fernando@gmail.com', 2147483647, 'miraflores', 4),
('BANCO UNION2', 'jose luis', 'joseluis@gmail.com', 676876324, 'miraflores', 5),
('Contabilidad', 'Fernando', 'fernando@gmail.com', 17878754, 'irpavi', 6),
('ADUANA', 'Fernando', 'fernando@gmail.com', 17878754, 'irpavi', 7),
('Dropdrow', 'Fernando', 'reyna@multitareasrl.com', 17878754, 'miraflores', 8),
('OST TECtttt', 'algor', 'oscar@gmail.com', 72152304, 'obrajes', 9),
('OST TECttttddd', 'algorsd', 'osczar@gmail.com', 72152304, 'obrajes', 10),
('EDV', 'fdfd', 'marcelo@multitareasrl.bo', 72152304, 'obrajes', 11),
('BANCO SOL', 'Fernando', 'fernando@gmail.com', 17878754, 'miraflores', 12),
('CONTRALORIA', 'Andrea Hinojosa', 'andreah@gmail.com', 79875212, 'Calle colon #456 ', 13),
('Banco Union', 'Valeria Carvajal', 'v@bunion.com', 78565231, 'la paz', 14),
('MULTI', 'PEPONA', 'Joselui@gmail.com', 7656232, 'Calle Murillo', 15),
('Sabsa', 'Andres canaviri', 'Andre@sabsa', 78876545, 'Miraflores', 16),
('Banco nacional', 'PEPONA', 'Joselui@gmail.com', 78565231, 'Calle Murillo', 17),
('ANH', 'Luis Gimenez', 'gimenez@gmail.com', 7662632, 'Calle 21 Pampahasi', 18),
('OST TECH', 'algor', 'reyna@multitareasrl.com', 17878754, 'miraflores', 19),
('AUTORIDAD DEL JUEGO', 'Andrea Hinojosa', 'andreah@gmail.com', 78565231, 'Calle Murillo', 20),
('d', 'd', 'd', 0, 'd', 21),
('red', 'd', 'd', 0, 'd', 22),
('UPEA', 'rector', 'dede@gmail.com', 65626262, 'El alto', 23),
('UPEA2', 'D', 'D', 0, 'D', 24),
('UPEA3', 'rector', 'dede@gmail.com', 65626262, 'El alto', 25),
('4', '33', '34', 34, '34', 26),
('UPEA4', 'rector', 'dede@gmail.com', 65626262, 'El alto', 27),
('ANH', 'DIEGO', 'G@BHB.COM', 65656, 'OMKMKL', 28),
('Ttre', 'rector', 'rwww@hy.com', 65626262, 'Frwee', 29),
('AUTORIDAD DEL JUEGO', 'danie', 'dan@gmail.com', 70501555, 'Villa adela', 30),
('DDDD', 'sssss', 'dsdsds@gmail.com', 56262, 'alto', 31),
('UPEA', 'Daniel', 'dan@gmail.com', 78974576, 'Villa tunari', 32),
('DELAPAZ', 'Andrea', 'dan@gmail.com', 78974576, 'Villa tunari', 33),
('DELAPAZ2', 'Andrea', 'dan@gmail.com', 78974576, 'Villa tunari', 34),
('UPEA7', 'herbert', 'herbert@gmail.com', 77597976, 'miraflores', 35),
('UPEA77', 'herbert', 'herbert@gmail.com', 77597976, 'miraflores', 36),
('KANTUTANI', 'Kantuta', 'kan@gmail.com', 70895422, 'el alto', 37),
('UPEA774', 'herbert', 'herbert@gmail.com', 77597976, 'miraflores', 38),
('UPEA7747', 'herbert', 'herbert@gmail.com', 77597976, 'miraflores', 39),
('red23', 'herbert', 'herbert@gmail.com', 77597976, 'miraflores', 40),
('DOGDE', 'RENE', 'DOGDE@gmail.com', 83265626, 'Calacoto', 41),
('red2334', 'herbert', 'herbert@gmail.com', 77597976, 'miraflores', 42),
('DOGDE2', 'RENE', 'DOGDE@gmail.com', 83265626, 'Calacoto', 43),
('red238', 'herbert', 'DOGDE@gmail.com', 77597976, 'Calacoto', 44),
('Entel', 'Aurelio sanchez', 'sanchez@gmail.com', 7345598, 'Villa adela', 45),
('Abc', 'Aurelio sanchez', 'sanchez@gmail.com', 75655334, 'Obrajes', 46),
('DOGDE24', 'RENE', 'DOGDE@gmail.com', 83265626, 'Calacoto', 47),
('UPEA34', 'Aurelio sanchez', 'herbert@gmail.com', 83265626, 'Villa adela', 48),
('DELUX', 'daniel', 'daniel@gmail.com', 78145243, 'miraflores', 49),
('Colegio Los Andes', 'Bernardo Yapita', 'yapita@gmail.com', 79582436, 'Zona Los andes', 50),
('Agetic', 'Ramiro Cuevas Santander', 'cuevas_r@gmail.com', 79281619, 'Obrajes', 51),
('Agetic2', 'Ramiro Cuevas Santander', 'cuevas_r@gmail.com', 79281619, 'Obrajes', 52),
('Facultad Derecho', 'Andres Gomes', 'gomes@gmail.com', 79584264, 'EL alto', 53),
('Agetic3', 'Jorge Gonzales', 'gonzales@hotmail.com', 73525626, 'Calacoto', 54),
('Volvo', 'Justo ALoso ibaÃ±es', 'ibanes@hotmail.com', 83265626, 'Calacoto', 55),
('DELAPAZ', 'Roberto Hinojosa', 'Robert_h@gmail.com', 72564826, 'El Alto Zona 16 de julio', 56),
('', '', '', 0, '', 57),
('LIDER PAPELERIA2', 'Gonzalo Humerez', 'ibanes@hotmail.com', 68497223, 'Obrajes', 58),
('DOGDE4', 'Justo ALoso ibaÃ±es', 'andy-S@ginex.com', 68497223, 'Calacoto', 59),
('DOGDE9', 'Andrea Soliz', 'DOGDE@gmail.com', 68497223, 'Obrajes', 60),
('INTEL', 'George Ramirez', 'g_ramirez@hotmail.com', 76985426, 'Villa Tunari ', 61),
('Facultad Derecho', 'Gonzalo Ribera', 'ribera@gmail.com', 76854224, 'llojeta', 62),
('Volvo2', 'Gonzalo Humerez 2', 'andy-S@ginex.com', 68497223, 'Calacoto', 63),
('qwe', 'qwe', 'qwe@mail.com', 123, 'Calacoto', 64),
('q', 'q', 'a@ml.com', 23, 'obrajes', 65),
('lucho', 'lucho', 'lucho@gmail.com', 784212121, 'rio seco', 66),
('genex', 'victor andrade', 'andrade@gmail.com', 79232332, 'el alto', 67);

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
(1, 'Cableado Estructurado en cobre', 1, '2;4;6;10'),
(2, 'Fibra Optica', 1, NULL),
(3, 'Sistema Electrico', 1, NULL),
(4, 'Iluminacion', 1, NULL),
(5, 'Cctv', 1, NULL),
(7, '', 0, NULL),
(8, '', 0, NULL),
(9, '', 0, NULL),
(10, 'redes', 1, NULL),
(11, 'fibra optica', 2, NULL);

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
(24, 7050155, 'Daniel', 'Carvajal', 'NuÃ±ez', 77597376, 'Administrador', 'dan', '11110a94fadf290abfb11e98ef9fa505'),
(25, 8050255, 'Marcelo', 'Gimenes', 'Nina', 78892123, 'Usuario', 'Chelo', 'b9e59e6af1f3121f0e2dc42af117b2ae'),
(26, 9050355, 'Rodrigo', 'Canqui', 'Nose', 74125472, 'Usuario', 'rodrigo', 'be7009bdd0938c430692ba5c748e131c'),
(27, 0, '', '', '', 0, 'Administrador', '', '202cb962ac59075b964b07152d234b70'),
(28, 0, '', '', '', 0, 'Administrador', '', '81dc9bdb52d04dc20036dbd8313ed055'),
(29, 0, '', '', '', 0, 'Administrador', '', '68053af2923e00204c3ca7c6a3150cf7'),
(30, 0, '', '', '', 0, 'Administrador', '', '250cf8b51c773f3f8dc8b4be867a9a02'),
(31, 717171, 'Rene', 'Condori', 'Nina', 74598751, 'Administrador', 'rene', 'e10adc3949ba59abbe56e057f20f883e'),
(32, 8899775, 'sebastian', 'hidalgo', 'hidalgo', 2256560, 'Administrador', 'herb', '4fc237f42cffa981ab21bfbe879c25c4'),
(33, 7050155, 'Daniel', 'Reynaldo', 'Canaviri', 77597976, 'Administrador', 'dany', '0f7b2bb5d0c7e6209ecff113108f64cf'),
(34, 456834, 'Deysi', 'GimÃ©nez ', 'Rocha', 75655334, 'Usuario', 'Deysi', '0f7b2bb5d0c7e6209ecff113108f64cf'),
(35, 568424, 'Danitza', 'Gomes', 'Valeriano', 71456981, 'Usuario', 'dati', '3a24b25a7b092a252166a1641ae953e7'),
(36, 0, '', '', '', 0, 'Administrador', '', 'ba347fcc9a79fb74e95670b24848164f'),
(37, 0, '', '', '', 0, 'Usuario', 'dany', '0f7b2bb5d0c7e6209ecff113108f64cf'),
(38, 0, '', '', '', 0, 'Administrador', 'dany', '0f7b2bb5d0c7e6209ecff113108f64cf'),
(39, 854862, 'Juan Carlos', 'Paredes', 'Motoya', 65448985, 'Administrador', 'juan', '827ccb0eea8a706c4c34a16891f84e7b'),
(40, 0, '', '', '', 0, '', '', 'd41d8cd98f00b204e9800998ecf8427e'),
(41, 689751, 'Armando ', 'Gimenez', 'Valdes', 75412431, 'Usuario', 'armando', '1f6419b1cbe79c71410cb320fc094775'),
(42, 7050898, 'rene', 'flores', 'andrade', 79854235, 'Usuario', 'rene', '8977ecbb8cb82d77fb091c7a7f186163');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`idCaracteristica`);

--
-- Indices de la tabla `imagenesrel`
--
ALTER TABLE `imagenesrel`
  ADD PRIMARY KEY (`idImagen`);

--
-- Indices de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  ADD PRIMARY KEY (`idRelev`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `imagenesrel`
--
ALTER TABLE `imagenesrel`
  MODIFY `idImagen` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `relevamientos`
--
ALTER TABLE `relevamientos`
  MODIFY `idRelev` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
