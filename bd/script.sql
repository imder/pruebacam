
CREATE TABLE `ambientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `idAmbiente` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idAmbiente` (`idAmbiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE `cableado_estructurado` (
  `idCable` int(5) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `cant_puntos` int(2) DEFAULT NULL,
  `ent_facilidades` varchar(20) DEFAULT NULL,
  `inst_gabinete` varchar(20) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `certificacion` varchar(20) DEFAULT NULL,
  `fk_idRelev` int(5) DEFAULT NULL,
  PRIMARY KEY (`idCable`),
  KEY `relev_idRelev` (`fk_idRelev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `caracteristicas` (
  `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `descripCaract` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCaracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `cctv` (
  `idCctv` int(11) NOT NULL AUTO_INCREMENT,
  `cant_p_cam_sen` int(11) DEFAULT NULL,
  `tipo` varchar(25) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCctv`),
  KEY `relev_idRelev` (`fk_idRelev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `clientes` (
  `idCliente` int(255) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `representante` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correoR` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(35) NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE `contador` (
  `cont` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE `fibra_optica` (
  `idFibra` int(11) NOT NULL AUTO_INCREMENT,
  `cant_puntos` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `inst_gabinete` varchar(11) DEFAULT NULL,
  `planos` varchar(25) DEFAULT NULL,
  `certificacion` varchar(25) DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFibra`),
  KEY `relev_idRelev` (`fk_idRelev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `fotografias` (
  `idFoto` int(10) NOT NULL AUTO_INCREMENT,
  `nom_foto` varchar(255) NOT NULL DEFAULT '',
  `url_foto` varchar(255) NOT NULL DEFAULT '',
  `tipo_img` varchar(255) DEFAULT NULL,
  `fk_idAmbiente` int(11) NOT NULL DEFAULT '0',
  `fk_idRelev` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFoto`),
  KEY `cable_idCable` (`fk_idAmbiente`),
  KEY `relev_idRelev` (`fk_idAmbiente`),
  KEY `relev_idRelev_2` (`fk_idAmbiente`),
  KEY `fk_idRelev` (`fk_idRelev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `iluminacion` (
  `id_Ilum` int(11) NOT NULL AUTO_INCREMENT,
  `cant_luminarias` int(11) DEFAULT NULL,
  `cant_lnterruptores` int(11) DEFAULT NULL,
  `planos` varchar(255) DEFAULT NULL,
  `fk_idRelev` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Ilum`),
  KEY `relev_idRelev` (`fk_idRelev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


                                                        CREATE TABLE `planos` (
                                                          `idPlano` int(11) NOT NULL AUTO_INCREMENT,
                                                          `url_plano` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
                                                          `fk_idAmb` int(11) NOT NULL DEFAULT '0',
                                                          PRIMARY KEY (`idPlano`),
                                                          KEY `fk_idAmbiente` (`fk_idAmb`)
                                                        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


CREATE TABLE `relevamientos` (
  `idRelev` int(11) NOT NULL AUTO_INCREMENT,
  `fk_idUsuario` int(15) DEFAULT NULL,
  `fk_idCliente` int(255) NOT NULL,
  `fk_idServicio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRelev`),
  KEY `idUsuario` (`fk_idUsuario`),
  KEY `ser_idServ` (`fk_idServicio`),
  KEY `fk_idCliente` (`fk_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `resumen` (
  `idResumen` int(11) NOT NULL AUTO_INCREMENT,
  `rel_idRelev` varchar(255) DEFAULT NULL,
  `ser_idServ` varchar(255) DEFAULT NULL,
  `car_idCaracter` varchar(255) DEFAULT NULL,
  `res_descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idResumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `servicios` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `nivel` int(2) DEFAULT NULL,
  `caracteristicas` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `idServicio` (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `sistema_electrico` (
  `idElectro` int(50) NOT NULL AUTO_INCREMENT,
  `p_energia` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `acometida` varchar(25) DEFAULT NULL,
  `puesta_tierra` varchar(25) DEFAULT NULL,
  `inst_tablero` varchar(25) DEFAULT NULL,
  `fk_idRelev` int(50) DEFAULT NULL,
  PRIMARY KEY (`idElectro`),
  KEY `relev_idRelev` (`fk_idRelev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(10) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `appaterno` varchar(30) NOT NULL,
  `apmaterno` varchar(30) NOT NULL,
  `telefono` int(10) NOT NULL,
  `nivel` varchar(15) NOT NULL,
  `username` varchar(40) NOT NULL,
  `passwords` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;