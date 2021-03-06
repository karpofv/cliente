-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para clientes
CREATE DATABASE IF NOT EXISTS `clientes` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `clientes`;


-- Volcando estructura para tabla clientes.cargos
CREATE TABLE IF NOT EXISTS `cargos` (
  `car_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `car_descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`car_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla clientes.cargos: ~3 rows (aproximadamente)
DELETE FROM `cargos`;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` (`car_codigo`, `car_descripcion`) VALUES
	(2, 'PROGRAMADOR I'),
	(4, 'Asistentes'),
	(6, 'Alguasiles');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `cli_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `cli_cedula` int(11) NOT NULL,
  `cli_nombre` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cli_apellido` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cli_edad` int(11) DEFAULT NULL,
  `cli_sexo` int(11) DEFAULT NULL,
  `cli_correo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cli_direccion` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `cli_telefono` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`cli_codigo`),
  UNIQUE KEY `cli_cedula` (`cli_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla clientes.cliente: ~0 rows (aproximadamente)
DELETE FROM `cliente`;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.componente
CREATE TABLE IF NOT EXISTS `componente` (
  `comp_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `comp_fechain` date DEFAULT NULL,
  `comp_nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_descripcion` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_marca` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_modelo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `comp_serial` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comp_biennac` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comp_fechadesin` date DEFAULT NULL,
  `comp_estado` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comp_motivodesinc` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`comp_codigo`),
  UNIQUE KEY `comp_serial` (`comp_serial`),
  UNIQUE KEY `comp_biennac` (`comp_biennac`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla clientes.componente: ~5 rows (aproximadamente)
DELETE FROM `componente`;
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
INSERT INTO `componente` (`comp_codigo`, `comp_fechain`, `comp_nombre`, `comp_descripcion`, `comp_marca`, `comp_modelo`, `comp_serial`, `comp_biennac`, `comp_fechadesin`, `comp_estado`, `comp_motivodesinc`) VALUES
	(2, '2017-02-08', 'Raton', 'Ratos con luz sensorar', 'Genius', 'mb01', 'sdf', 'sdf', '1988-06-15', 'DESINCORPORADO', 'Mantenimiento'),
	(3, '2017-02-08', 'Teclado', 'Teclado negro de 1001 teclas.', 'Vit', 'Doc-13', 'df', 'dfs', '2017-02-08', NULL, NULL),
	(4, '2017-02-03', ',jkj', 'nk', 'nk', 'nk', 'kjn', 'kjnkj', '2017-02-17', NULL, NULL),
	(6, '4989-06-15', 'sd', 'sadasDASD', 'sadasDAS', 'asdaDAS', 'sadaASDA', 'saadsSDAS', '2017-03-16', 'DESINCORPORADO', 'Mantenimiento'),
	(7, '0000-00-00', 'dfwd', 'dsfsdf', 'dfsf', 'fsdf', 'sdfsdf', 'sdfsd', NULL, 'ACTIVO', NULL);
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `dep_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `dep_descripcion` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dep_codigo`),
  UNIQUE KEY `dep_descripcion` (`dep_descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla clientes.departamento: ~3 rows (aproximadamente)
DELETE FROM `departamento`;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` (`dep_codigo`, `dep_descripcion`) VALUES
	(3, 'Aguasilazgo'),
	(2, 'INFORMATICA'),
	(1, 'RRHH');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.estacion
CREATE TABLE IF NOT EXISTS `estacion` (
  `est_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `est_depcodigo` int(11) NOT NULL DEFAULT '0',
  `est_descripcion` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `est_ip` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `est_mac` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `est_switch` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `est_ptswitch` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `est_patchp` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `est_ptpatchp` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`est_codigo`),
  UNIQUE KEY `est_mac` (`est_mac`),
  UNIQUE KEY `est_ip` (`est_ip`),
  UNIQUE KEY `est_ptswitch` (`est_ptswitch`),
  KEY `FK_estacion_departamento` (`est_depcodigo`),
  CONSTRAINT `FK_estacion_departamento` FOREIGN KEY (`est_depcodigo`) REFERENCES `departamento` (`dep_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla clientes.estacion: ~0 rows (aproximadamente)
DELETE FROM `estacion`;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` (`est_codigo`, `est_depcodigo`, `est_descripcion`, `est_ip`, `est_mac`, `est_switch`, `est_ptswitch`, `est_patchp`, `est_ptpatchp`) VALUES
	(5, 2, 'EWER', '192.168.2.2', 'EA:ES:DF:58:45', '1-A', '2', '22', '55-B');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.estacion_comp
CREATE TABLE IF NOT EXISTS `estacion_comp` (
  `estc_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `estc_estcodigo` int(11) DEFAULT NULL,
  `estc_compcodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`estc_codigo`),
  KEY `FK_estacion_comp_estacion` (`estc_estcodigo`),
  KEY `FK_estacion_comp_componente` (`estc_compcodigo`),
  CONSTRAINT `FK_estacion_comp_componente` FOREIGN KEY (`estc_compcodigo`) REFERENCES `componente` (`comp_codigo`),
  CONSTRAINT `FK_estacion_comp_estacion` FOREIGN KEY (`estc_estcodigo`) REFERENCES `estacion` (`est_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla clientes.estacion_comp: ~0 rows (aproximadamente)
DELETE FROM `estacion_comp`;
/*!40000 ALTER TABLE `estacion_comp` DISABLE KEYS */;
INSERT INTO `estacion_comp` (`estc_codigo`, `estc_estcodigo`, `estc_compcodigo`) VALUES
	(8, 5, 2);
/*!40000 ALTER TABLE `estacion_comp` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.m_menu_emp_menj
CREATE TABLE IF NOT EXISTS `m_menu_emp_menj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ConexMenuMaster` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conex` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Imagen` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ancho` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alto` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` text COLLATE utf8_unicode_ci,
  `CA` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAdmin` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orden` (`orden`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla clientes.m_menu_emp_menj: ~3 rows (aproximadamente)
DELETE FROM `m_menu_emp_menj`;
/*!40000 ALTER TABLE `m_menu_emp_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_menj` (`id`, `ConexMenuMaster`, `orden`, `menu`, `conex`, `funcion`, `Imagen`, `ancho`, `alto`, `nivel`, `CA`, `CAdmin`) VALUES
	(54, NULL, NULL, 'Administrador', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL),
	(74, NULL, NULL, 'Configuracion', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL),
	(76, NULL, NULL, 'Clientes', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `m_menu_emp_menj` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.m_menu_emp_sub_menj
CREATE TABLE IF NOT EXISTS `m_menu_emp_sub_menj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enlace` int(11) NOT NULL DEFAULT '0',
  `enlacesub` char(3) DEFAULT NULL,
  `Act` char(1) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) DEFAULT NULL,
  `conex` varchar(250) DEFAULT NULL,
  `Url_1` varchar(100) NOT NULL,
  `Url_2` varchar(100) NOT NULL,
  `Url_3` varchar(100) NOT NULL,
  `Url_4` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Url_5` varchar(100) NOT NULL,
  `Url_6` varchar(100) DEFAULT NULL,
  `Url_7` varchar(100) DEFAULT NULL,
  `Url_8` varchar(100) DEFAULT NULL,
  `Url_9` varchar(100) DEFAULT NULL,
  `Url_10` varchar(100) DEFAULT NULL,
  `Inserte` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Updated` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Deleted` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Acciones` varchar(80) NOT NULL,
  `Ejecutar` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `conexd` varchar(200) DEFAULT NULL,
  `funcion` varchar(100) DEFAULT NULL,
  `nivel` text,
  `CA` char(2) DEFAULT NULL,
  `CAdmin` int(1) DEFAULT NULL,
  `CssColor` varchar(50) NOT NULL,
  `CssImagen` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enlace` (`enlace`),
  CONSTRAINT `m_menu_emp_sub_menj_ibfk_1` FOREIGN KEY (`enlace`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clientes.m_menu_emp_sub_menj: ~3 rows (aproximadamente)
DELETE FROM `m_menu_emp_sub_menj`;
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` DISABLE KEYS */;
INSERT INTO `m_menu_emp_sub_menj` (`id`, `enlace`, `enlacesub`, `Act`, `orden`, `menu`, `conex`, `Url_1`, `Url_2`, `Url_3`, `Url_4`, `Url_5`, `Url_6`, `Url_7`, `Url_8`, `Url_9`, `Url_10`, `Inserte`, `Updated`, `Deleted`, `Acciones`, `Ejecutar`, `conexd`, `funcion`, `nivel`, `CA`, `CAdmin`, `CssColor`, `CssImagen`) VALUES
	(55, 74, NULL, NULL, 1, 'Crear Usuarios', 'menu.php', 'conf_usuario/crear_usuario.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(110, 54, NULL, NULL, NULL, 'Administrar Perfiles', 'menu.php', 'admin_perfil/conf_perfil.php', 'admin_perfil/conf_menu_list.php', 'admin_perfil/conf_menu_accion.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
	(162, 76, NULL, NULL, 2, 'Administrar clientes', 'menu.php', 'sistema/clientes/clientes.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '');
/*!40000 ALTER TABLE `m_menu_emp_sub_menj` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.perfiles
CREATE TABLE IF NOT EXISTS `perfiles` (
  `CodPerfil` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CodPerfil`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla clientes.perfiles: ~3 rows (aproximadamente)
DELETE FROM `perfiles`;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` (`CodPerfil`, `Nombre`) VALUES
	(1, 'Administrador'),
	(2, 'god'),
	(3, 'operador');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.perfiles_det
CREATE TABLE IF NOT EXISTS `perfiles_det` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdPerfil` int(11) NOT NULL DEFAULT '0',
  `Submenu` int(11) NOT NULL DEFAULT '0',
  `Menu` int(11) NOT NULL DEFAULT '0',
  `S` tinyint(4) NOT NULL,
  `U` tinyint(4) NOT NULL,
  `D` tinyint(4) NOT NULL,
  `I` tinyint(4) NOT NULL,
  `P` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IdPerfil_2` (`IdPerfil`,`Submenu`,`Menu`),
  KEY `IdPerfil` (`IdPerfil`),
  KEY `Submenu` (`Submenu`),
  KEY `Menu` (`Menu`),
  CONSTRAINT `perfiles_det_ibfk_1` FOREIGN KEY (`IdPerfil`) REFERENCES `perfiles` (`CodPerfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_2` FOREIGN KEY (`Menu`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfiles_det_ibfk_3` FOREIGN KEY (`Submenu`) REFERENCES `m_menu_emp_sub_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla clientes.perfiles_det: ~9 rows (aproximadamente)
DELETE FROM `perfiles_det`;
/*!40000 ALTER TABLE `perfiles_det` DISABLE KEYS */;
INSERT INTO `perfiles_det` (`id`, `IdPerfil`, `Submenu`, `Menu`, `S`, `U`, `D`, `I`, `P`) VALUES
	(1, 1, 110, 54, 0, 1, 1, 1, 1),
	(113, 1, 55, 54, 0, 1, 1, 1, 1),
	(225, 2, 110, 54, 1, 1, 1, 1, 1),
	(226, 2, 55, 54, 1, 1, 1, 1, 1),
	(235, 2, 55, 74, 1, 1, 1, 1, 1),
	(240, 1, 55, 74, 1, 1, 1, 1, 1),
	(245, 1, 162, 76, 1, 1, 1, 1, 1),
	(250, 3, 162, 76, 1, 1, 0, 1, 1),
	(254, 2, 162, 76, 1, 1, 1, 1, 1);
/*!40000 ALTER TABLE `perfiles_det` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.personal_departamento
CREATE TABLE IF NOT EXISTS `personal_departamento` (
  `perd_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `perd_percodigo` int(11) DEFAULT NULL,
  `perd_depcodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`perd_codigo`),
  UNIQUE KEY `perd_percodigo` (`perd_percodigo`,`perd_depcodigo`),
  KEY `FK_personal_departamento_departamento` (`perd_depcodigo`),
  CONSTRAINT `FK_personal_departamento_departamento` FOREIGN KEY (`perd_depcodigo`) REFERENCES `departamento` (`dep_codigo`),
  CONSTRAINT `FK_personal_departamento_personal` FOREIGN KEY (`perd_percodigo`) REFERENCES `personal` (`per_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla clientes.personal_departamento: ~0 rows (aproximadamente)
DELETE FROM `personal_departamento`;
/*!40000 ALTER TABLE `personal_departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_departamento` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.recargar
CREATE TABLE IF NOT EXISTS `recargar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `actd` int(1) NOT NULL,
  `Accion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=354 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla clientes.recargar: ~8 rows (aproximadamente)
DELETE FROM `recargar`;
/*!40000 ALTER TABLE `recargar` DISABLE KEYS */;
INSERT INTO `recargar` (`id`, `URL`, `actd`, `Accion`) VALUES
	(1, 'uploader/receiver.php', 0, ''),
	(2, 'recargar/recargar.php', 0, ''),
	(3, 'recargar/recargar.php', 0, ''),
	(4, 'sistema/documentos/selectorAnual.php', 0, ''),
	(5, 'sistema/documentos/selectorMes.php', 0, ''),
	(351, 'sistema/index.php', 0, ''),
	(352, 'recargar/recargar.php', 1, ''),
	(353, 'sistema/reportes/pdf_constancia.php', 0, '');
/*!40000 ALTER TABLE `recargar` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.registrados
CREATE TABLE IF NOT EXISTS `registrados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidad` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Usuario` int(11) NOT NULL,
  `cedula` int(11) NOT NULL DEFAULT '0',
  `Nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `correo` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla clientes.registrados: ~4 rows (aproximadamente)
DELETE FROM `registrados`;
/*!40000 ALTER TABLE `registrados` DISABLE KEYS */;
INSERT INTO `registrados` (`id`, `nacionalidad`, `Usuario`, `cedula`, `Nombres`, `Apellidos`, `sexo`, `correo`) VALUES
	(1, '', 0, 12345, 'laya', 'juan', '', ''),
	(2, '', 0, 21589306, 'Maria', 'Fernandez', '', ''),
	(3, '', 0, 19191493, 'gabriel', 'rojas', '', ''),
	(4, '', 0, 19191492, 'sadasd', 'asdas', '', '');
/*!40000 ALTER TABLE `registrados` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sexo';

-- Volcando datos para la tabla clientes.sexo: ~2 rows (aproximadamente)
DELETE FROM `sexo`;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` (`id`, `Nombre`) VALUES
	(1, 'Masculino'),
	(2, 'Femenino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;


-- Volcando estructura para tabla clientes.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) NOT NULL DEFAULT '0',
  `Usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Nombres` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contrasena` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `CodSede` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nivel` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Stilo` int(1) NOT NULL,
  `theme_color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Registro` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Usuario` (`Usuario`),
  UNIQUE KEY `Cedula_2` (`Tipo`,`Cedula`),
  KEY `Tipo` (`Cedula`,`Tipo`,`Usuario`),
  KEY `Cedula` (`Codigo`,`Usuario`,`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla clientes.usuarios: ~4 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `Cedula`, `Usuario`, `Nombres`, `Apellidos`, `contrasena`, `CodSede`, `Tipo`, `Nivel`, `Stilo`, `theme_color`, `Codigo`, `Registro`, `Fecha`, `Observacion`) VALUES
	(9, 19191493, 'ROJASGB', 'gabriel', 'rojas', 'e10adc3949ba59abbe56e057f20f883e', '', 'Empleado', '3', 0, '', 'c5925', '1', '2016-11-16 09:34:10', NULL),
	(25, 12345, 'GOD', '', '', 'a1b995eb2627f17bfd5fcb1de8533c62', NULL, 'Empleado', '2', 0, '', '0debd', NULL, '0000-00-00 00:00:00', NULL),
	(74, 8573655, 'laya', 'juan', 'laya', 'a1b995eb2627f17bfd5fcb1de8533c62', NULL, 'Empleado', '1', 0, '', '36c0a', NULL, '0000-00-00 00:00:00', NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
