/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80041
Source Host           : localhost:3307
Source Database       : sicont

Target Server Type    : MYSQL
Target Server Version : 80041
File Encoding         : 65001

Date: 2025-05-23 16:07:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `beneficiarios_cfg_proyectos`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiarios_cfg_proyectos`;
CREATE TABLE `beneficiarios_cfg_proyectos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CodProyecto` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `CodConvenio` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Id_Mpio` int DEFAULT NULL,
  `IdSubregion` int DEFAULT NULL,
  `IdPrograma` int DEFAULT NULL,
  `NombreProyecto` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `EstadoProyecto` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `EstadoConvenio` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiarios_cfg_proyectos
-- ----------------------------
INSERT INTO `beneficiarios_cfg_proyectos` VALUES ('1', 'test001', '0001ipqfh', null, null, null, 'test', null, null, '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_acceso`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_acceso`;
CREATE TABLE `beneficiario_cfg_tipo_acceso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_acceso
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_acceso` VALUES ('1', 'Via Destapada', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_acceso` VALUES ('2', 'Via Pavimentada', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_acceso` VALUES ('3', 'Acceso Fluvial', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_acceso` VALUES ('4', 'Camino de herradura', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_alcantarilaldo_saneamiento`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_alcantarilaldo_saneamiento`;
CREATE TABLE `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_alcantarilaldo_saneamiento
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` VALUES ('1', 'Distancia a punto de conexión (metros)', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` VALUES ('2', 'Pozo séptico', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` VALUES ('3', 'Vertimiento Directo', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` VALUES ('4', 'Alcantarillado urbano', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` VALUES ('5', 'Alcantarillado rural', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` VALUES ('6', 'Sin Alcantarillado', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` VALUES ('7', 'Sin Dato', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_disponibilidad_agua`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_disponibilidad_agua`;
CREATE TABLE `beneficiario_cfg_tipo_disponibilidad_agua` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_disponibilidad_agua
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('1', 'Distancia al punto de toma (metros)', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('2', 'Acueducto urbano', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('3', 'Acueducto veredal', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('4', 'Nacimiento', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('5', 'Quebrada', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('6', 'Aljibe', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('7', 'Sin Dato', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_disponibilidad_agua` VALUES ('8', 'Sin Agua', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_energia`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_energia`;
CREATE TABLE `beneficiario_cfg_tipo_energia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_energia
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_energia` VALUES ('1', 'Cuenta con servicios de energia', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_energia` VALUES ('2', 'Distancia de conexión a poste de luz (mts)', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_energia` VALUES ('3', 'Contador', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_energia` VALUES ('4', 'Tablero de interruptores', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_energia` VALUES ('5', 'Pre - Pagada', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_energia` VALUES ('6', 'Sin Dato', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_energia` VALUES ('7', 'Energia Prepago', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_enfoque_diferencial`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_enfoque_diferencial`;
CREATE TABLE `beneficiario_cfg_tipo_enfoque_diferencial` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_enfoque_diferencial
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('2', 'Victima', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('3', 'Mujer jefatura de Hogar', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('4', 'Hombre jefatura de Hogar', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('5', 'Discapacidad', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('6', 'Afrodescendiente', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('7', 'Indigena\r\n', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('8', 'Adulto Mayor', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('9', 'LGTBIQ+H', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_enfoque_diferencial` VALUES ('10', 'Afectado ola Invernal', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_intervencion`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_intervencion`;
CREATE TABLE `beneficiario_cfg_tipo_intervencion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_intervencion
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_intervencion` VALUES ('1', 'Vivienda Nueva Rural', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_intervencion` VALUES ('2', 'Vivienda Nueva Urbana', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_intervencion` VALUES ('3', 'Mejoramiento Rural', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_intervencion` VALUES ('4', 'Mejoramiento Urbano', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_intervencion` VALUES ('5', 'Titulación/Escrituración', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_tenencia`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_tenencia`;
CREATE TABLE `beneficiario_cfg_tipo_tenencia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_tenencia
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_tenencia` VALUES ('1', 'Certificado de Tradición y libertad', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_tenencia` VALUES ('2', 'Sana Posesión', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_tenencia` VALUES ('3', 'Acto administrativo', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_tenencia` VALUES ('4', 'Otro ¿Cuál?', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_cfg_tipo_vivienda`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_cfg_tipo_vivienda`;
CREATE TABLE `beneficiario_cfg_tipo_vivienda` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_cfg_tipo_vivienda
-- ----------------------------
INSERT INTO `beneficiario_cfg_tipo_vivienda` VALUES ('1', 'Rural', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `beneficiario_cfg_tipo_vivienda` VALUES ('2', 'Urbana', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `beneficiario_datos_json_temp`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_datos_json_temp`;
CREATE TABLE `beneficiario_datos_json_temp` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Json_Temporal` longtext COLLATE utf32_spanish_ci,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_datos_json_temp
-- ----------------------------

-- ----------------------------
-- Table structure for `beneficiario_datos_pagos`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_datos_pagos`;
CREATE TABLE `beneficiario_datos_pagos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Postulado` int DEFAULT NULL,
  `Monto` float(20,2) DEFAULT NULL,
  `Id_listado` int DEFAULT NULL,
  `Fecha_Desembolso` date DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Postulado` (`Id_Postulado`),
  CONSTRAINT `FK_postulados_pagos` FOREIGN KEY (`Id_Postulado`) REFERENCES `beneficiario_datos_postulados` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_datos_pagos
-- ----------------------------

-- ----------------------------
-- Table structure for `beneficiario_datos_postulados`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_datos_postulados`;
CREATE TABLE `beneficiario_datos_postulados` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ID_form` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `FechaElaboracion` date DEFAULT NULL,
  `Convenio` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Id_depto` int DEFAULT NULL,
  `Id_mpio` int DEFAULT NULL,
  `Direccion` varchar(250) COLLATE utf32_spanish_ci DEFAULT NULL,
  `IdTipoVivienda` int DEFAULT NULL COMMENT 'rural/urbana',
  `Id_Proyecto` int DEFAULT NULL,
  `Id_Tipo_Intervencion` int DEFAULT NULL,
  `SegundoApellidoJefeHogar` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `PrimerApellidoJefeHogar` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `SegundoNombreJefeHogar` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `PrimerNombreJefeHogar` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Id_TipoDocumento` int DEFAULT NULL,
  `Identificacion` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Escolaridad` int DEFAULT NULL,
  `Ocupacion` int DEFAULT NULL,
  `IngresoPromedioMensual` float(20,2) DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Id_Genero` int DEFAULT NULL,
  `Id_Tipo_Acceso` int DEFAULT NULL,
  `Latitud` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Longitud` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Id_DisponibilidadAgua` int DEFAULT NULL,
  `IdTenencia` int DEFAULT NULL,
  `OtraTenencia` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `IdEnergia` int DEFAULT NULL,
  `IdAlcantarillado` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Id_Depto_cfg_departamento_idx` (`Id_depto`),
  KEY `FK_Id_Mpio_cfg_municipios_idx` (`Id_mpio`),
  KEY `Fk_Id_Tipo_Vivienda_beneficiario_cfg_tipo_vivienda_idx` (`IdTipoVivienda`),
  KEY `Fk_Id_Proyecto_beneficiarios_cfg_proyectos_idx` (`Id_Proyecto`),
  KEY `FK_Id_Tipo_Intervencion_beneficiario_cfg_tipo_intervencion_idx` (`Id_Tipo_Intervencion`),
  KEY `FK_Escolaridad_cfg_nivel_escolaridad_idx` (`Escolaridad`),
  KEY `FK_Id_TipoDocumento_cfg_tipo_identificacion_documento_idx` (`Id_TipoDocumento`),
  KEY `FK_Ocupacion_cfg_tipo_ocupacion_idx` (`Ocupacion`),
  KEY `FK_Id_Genero_cfg_genero_idx` (`Id_Genero`),
  KEY `FK_Id_Tipo_Acceso_beneficiario_cfg_tipo_acceso_idx` (`Id_Tipo_Acceso`),
  KEY `FK_Id_DisponibilidadAgua_beneficiario_cfg_tipo_disponibilid_idx` (`Id_DisponibilidadAgua`),
  KEY `FK_IdTenencia_beneficiario_cfg_tipo_tenencia_idx` (`IdTenencia`),
  KEY `FK_IdEnergia_beneficiario_cfg_tipo_energia_idx` (`IdEnergia`),
  KEY `FK_IdAlcantarillado_beneficiario_cfg_tipo_alcantarilaldo_sa_idx` (`IdAlcantarillado`),
  CONSTRAINT `FK_beneficiario_cfg_tipo_alcantarilaldo_saneamiento` FOREIGN KEY (`IdAlcantarillado`) REFERENCES `beneficiario_cfg_tipo_alcantarilaldo_saneamiento` (`Id`),
  CONSTRAINT `FK_Escolaridad_cfg_nivel_escolaridad` FOREIGN KEY (`Escolaridad`) REFERENCES `cfg_nivel_escolaridad` (`Id`),
  CONSTRAINT `FK_Id_Depto_cfg_departamento` FOREIGN KEY (`Id_depto`) REFERENCES `cfg_departamentos` (`id`),
  CONSTRAINT `FK_Id_DisponibilidadAgua` FOREIGN KEY (`Id_DisponibilidadAgua`) REFERENCES `beneficiario_cfg_tipo_disponibilidad_agua` (`Id`),
  CONSTRAINT `FK_Id_Genero_cfg_genero` FOREIGN KEY (`Id_Genero`) REFERENCES `cfg_genero` (`Id`),
  CONSTRAINT `FK_Id_Mpio_cfg_municipios` FOREIGN KEY (`Id_mpio`) REFERENCES `cfg_municipios` (`id`),
  CONSTRAINT `Fk_Id_Proyecto_beneficiarios_cfg_proyectos` FOREIGN KEY (`Id_Proyecto`) REFERENCES `beneficiarios_cfg_proyectos` (`Id`),
  CONSTRAINT `FK_Id_Tipo_Acceso_beneficiario_cfg_tipo_acceso` FOREIGN KEY (`Id_Tipo_Acceso`) REFERENCES `beneficiario_cfg_tipo_acceso` (`Id`),
  CONSTRAINT `FK_Id_Tipo_Intervencion_beneficiario_cfg_tipo_intervencion` FOREIGN KEY (`Id_Tipo_Intervencion`) REFERENCES `beneficiario_cfg_tipo_intervencion` (`Id`),
  CONSTRAINT `Fk_Id_Tipo_Vivienda_beneficiario_cfg_tipo_vivienda` FOREIGN KEY (`IdTipoVivienda`) REFERENCES `beneficiario_cfg_tipo_vivienda` (`Id`),
  CONSTRAINT `FK_Id_TipoDocumento_cfg_tipo_identificacion_documento` FOREIGN KEY (`Id_TipoDocumento`) REFERENCES `cfg_tipo_identificacion_documento` (`Id`),
  CONSTRAINT `FK_IdEnergia_beneficiario_cfg_tipo_energia` FOREIGN KEY (`IdEnergia`) REFERENCES `beneficiario_cfg_tipo_energia` (`Id`),
  CONSTRAINT `FK_IdTenencia_beneficiario_cfg_tipo_tenencia` FOREIGN KEY (`IdTenencia`) REFERENCES `beneficiario_cfg_tipo_tenencia` (`Id`),
  CONSTRAINT `FK_Ocupacion_cfg_tipo_ocupacion` FOREIGN KEY (`Ocupacion`) REFERENCES `cfg_tipo_ocupacion` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_datos_postulados
-- ----------------------------
INSERT INTO `beneficiario_datos_postulados` VALUES ('28', '1', '2023-10-30', 'CI-564-2021', '1', '118', 'Cll 71     50 B Norte 71 ', '2', '1', '2', null, 'FIGUEROA', null, 'NANCY ', '1', '35898627', '1983-05-10', '1', '1', '2000000.00', '3153781701', '1', '1', 'S/D', 'S/D', '4', '2', null, '4', '1', '1', '2023-10-30 23:18:13', '2023-10-30 23:18:13', 'Maria.Montoya', 'Maria.Montoya');
INSERT INTO `beneficiario_datos_postulados` VALUES ('29', '004', '2022-11-03', 'CI-728-2021', '1', '45', 'La Llega ', '2', '1', '4', null, 'Marin', null, 'Maria', '1', '1038097139', '0005-12-08', '11', '1', '0.00', '3128811714', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 18:15:03', '2023-11-15 18:15:03', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('30', '001', '2022-11-02', 'CI-728-2021', '1', '45', 'SIN DATOS ', '2', '1', '4', null, 'Nisperuza', null, 'Abel', '1', '3128811714', '1953-06-20', '11', '9', '0.00', '3137713363', '2', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 18:21:23', '2023-11-15 18:21:23', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('31', '009', '2022-11-03', 'CI-728-2021', '1', '45', 'Kennedy La Llega ', '2', '1', '4', null, 'Banquet', 'S/D', 'German', '1', '15305682', '1956-09-21', '11', '9', '70000.00', '3122633574', '2', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 18:28:50', '2023-11-15 18:28:50', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('32', '0', '2022-11-02', 'CI-728-2021', '1', '45', 'El Porvenir  ', '2', '1', '4', null, 'Medina', null, 'Luz', '1', '43895803', '1939-09-10', '11', '9', '0.00', '3104764373', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 18:34:23', '2023-11-15 18:34:23', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('33', '002', '2022-11-01', 'CI-728-2021', '1', '45', 'La Gloria De Dios ', '2', '1', '4', null, 'Montoya', null, 'Nubia', '1', '21791026', '1960-11-10', '11', '9', '0.00', '3508690950', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 19:29:37', '2023-11-15 19:29:37', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('34', '013', '2022-12-19', 'CI-728-2021', '1', '45', 'Las Delicias ', '2', '1', '4', 'S/D', 'Cespedes', 'S/D', 'Mercedes', '1', '22236558', '1932-05-12', '11', '9', '0.00', '3207795599', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 19:34:49', '2023-11-15 19:34:49', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('35', '013', '2022-11-03', 'CI-728-2021', '1', '45', 'Nueva Granada ', '2', '1', '4', null, 'Herazo', null, 'Nayivis', '1', '22241884', '1961-07-09', '11', '9', '0.00', '3135309938', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 19:41:17', '2023-11-15 19:41:17', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('36', '006', '2022-11-01', 'CI-728-2021', '1', '45', 'El 20 De Julio ', '2', '1', '4', null, 'Zuleta', null, 'Danilsa', '1', '22246845', '1976-09-21', '11', '9', '0.00', '3147538341', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 19:47:44', '2023-11-15 19:47:44', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('37', '003', '2022-11-01', 'CI-728-2021', '1', '45', 'S/D ', '2', '1', '4', null, 'Ochoa', null, 'Enilda', '1', '22247342', '0084-08-20', '11', '9', '0.00', '3195128009', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:00:30', '2023-11-15 20:00:30', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('38', '003', '2022-11-01', 'CI-728-2021', '1', '45', 'S/D ', '2', '1', '4', null, 'Ochoa', null, 'Enilda', '1', '22247342', '1984-08-20', '11', '9', '0.00', '3195128009', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:08:37', '2023-11-15 20:08:37', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('39', '007', '2022-11-02', 'CI-728-2021', '1', '45', 'El Pgreso ', '2', '1', '4', null, 'Esquivel', null, 'Lina', '1', '25833085', '1950-11-23', '11', '9', '0.00', '3137977230', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:13:14', '2023-11-15 20:13:14', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('40', '015', '2022-11-02', 'CI-728-2021', '1', '45', 'Sagrado Corazón ', '2', '1', '4', null, 'Ospina', null, 'Morayma', '1', '26231628', '1971-09-16', '11', '9', '0.00', '3128353372', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:19:43', '2023-11-15 20:19:43', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('41', '018', '2022-11-19', 'CI-728-2021', '1', '45', 'La Llega  ', '2', '1', '4', null, 'Moreno', null, 'Marina', '1', '33168545', '1947-08-26', '11', '9', '0.00', '3225682925', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:23:55', '2023-11-15 20:23:55', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('42', '009', '2022-11-02', 'CI-728-2021', '1', '45', 'Porvenir  ', '2', '1', '4', null, 'Palomino', null, 'Nicanor', '1', '3671614', '1955-09-21', '11', '9', '0.00', '3122895045', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:28:51', '2023-11-15 20:28:51', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('43', '006', '2022-11-03', 'CI-728-2021', '1', '45', 'El Porvenir ', '2', '1', '4', null, 'Acosta', null, 'Everlides', '1', '39267288', '1953-11-07', '11', '9', '100000.00', '3127354332', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:36:01', '2023-11-15 20:36:01', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('44', '005', '2022-11-02', 'CI-728-2021', '1', '45', 'El Porvenir ', '2', '1', '4', null, 'Carpio', null, 'Olga', '1', '42225103', '1952-01-21', '11', '9', '0.00', '3148393183', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:39:37', '2023-11-15 20:39:37', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('45', '001', '2022-11-01', 'CI-728-2021', '1', '45', 'la Gloria De Dios ', '2', '1', '4', null, 'Velasquez', null, 'Eni', '1', '42938782', '1975-05-03', '11', '9', '200000.00', '3137632304', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:45:22', '2023-11-15 20:45:22', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('46', '012', '2022-11-02', 'CI-728-2021', '1', '45', 'El Progreso ', '2', '1', '4', null, 'Garcia', 'S/D', 'Manuela', '1', '43256445', '1990-07-21', '11', '9', '500000.00', '3218163532', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:51:27', '2023-11-15 20:51:27', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('47', '019', '2022-11-01', 'CI-728-2021', '1', '45', 'Villa Echeverri ', '2', '1', '4', null, 'Tapia', null, 'Maria', '1', '43693285', '0001-01-01', '11', '9', '0.00', '3194484768', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 20:58:40', '2023-11-15 20:58:40', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('48', '014', '2022-11-02', 'CI-728-2021', '1', '45', 'La Llega ', '2', '1', '4', null, 'Viloria', null, 'Maria', '1', '43694093', '1972-12-09', '11', '9', '100000.00', '3116792069', '1', '2', null, null, '8', '2', null, '6', '7', '1', '2023-11-15 21:03:09', '2023-11-15 21:03:09', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('49', '008', '2022-11-03', 'CI-728-2021', '1', '45', 'Los Almendros  ', '2', '1', '4', null, 'Martinez', null, 'Lucelis', '1', '43893710', '1974-04-02', '11', '9', '500000.00', '3136354436', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 21:08:48', '2023-11-15 21:08:48', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('50', '003', '2022-11-02', 'CI-728-2021', '1', '45', 'El Porvenir  ', '2', '1', '4', null, 'Bernal', null, 'Ana', '1', '43896358', '1980-01-21', '11', '9', '0.00', '3222575945', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:10:36', '2023-11-15 22:10:36', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('51', '002', '2022-11-03', 'CI-728-2021', '1', '45', 'La Llega ', '2', '1', '4', null, 'Valencia', null, 'Amada', '1', '43896611', '1948-02-27', '11', '9', '0.00', '3116585836', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:19:46', '2023-11-15 22:19:46', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('52', '002', '2022-11-03', 'CI-728-2021', '1', '45', 'La Llega ', '2', '1', '4', null, 'Valencia', null, 'Amada', '1', '43896611', '1948-02-27', '11', '9', '0.00', '3116585836', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:19:54', '2023-11-15 22:19:54', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('53', '004', '2022-12-19', 'CI-728-2021', '1', '45', 'la Gloria De Dios ', '2', '1', '4', null, 'Cotera', null, 'Luz', '1', '43896651', '1980-11-05', '11', '9', '100000.00', '3174750534', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:23:55', '2023-11-15 22:23:55', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('55', '017', '2022-11-01', 'CI-728-2021', '1', '45', 'Las Colinas ', '2', '1', '4', null, 'Perez', null, 'Yenis', '1', '44120416', '1982-07-12', '11', '9', '0.00', '3218066599', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:36:49', '2023-11-15 22:36:49', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('56', '017', '2022-11-01', 'CI-728-2021', '1', '45', 'Las Colinas ', '2', '1', '4', null, 'Perez', null, 'Yenis', '1', '44120416', '1982-07-12', '11', '9', '0.00', '3218066599', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:36:59', '2023-11-15 22:36:59', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('57', '011', '2022-11-02', 'CI-728-2021', '1', '45', 'El Progreso ', '2', '1', '4', null, 'Montalvo', null, 'Manuel', '1', '6628441', '1939-04-07', '11', '9', '0.00', '3105380965', '2', '1', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:40:48', '2023-11-15 22:40:48', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('58', '005', '2022-11-01', 'CI-728-2021', '1', '45', 'Las Colinas ', '2', '1', '4', null, 'Berrio', null, 'Elkin', '1', '8202911', '1975-12-10', '11', '9', '0.00', '3106061383', '2', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:47:36', '2023-11-15 22:47:36', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('59', '007', '2022-11-01', 'CI-728-2021', '1', '45', 'Villa Echeverri ', '2', '1', '4', null, 'Cogollo', null, 'Luis', '1', '98654719', '1971-11-17', '11', '9', '0.00', '0000000', '1', '2', null, null, '7', '2', null, '6', '7', '1', '2023-11-15 22:50:39', '2023-11-15 22:50:39', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados` VALUES ('60', '12', '2024-03-28', 'CI-536-2021', '1', '84', 'Kr 25   16   N/A # 36 sin dato  ', '2', '1', '4', null, 'Yepes ', null, 'Alexis ', '1', '71556549', '2023-07-22', '11', '9', '1800000.00', '32067889207', '2', '2', 'S/D', 'S/D', '7', '4', 'Sin dato ', '6', '7', '1', '2023-11-16 20:14:14', '2023-11-16 20:14:14', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('61', '02', '1983-09-08', 'CI-536-2021', '1', '84', 'Cll 98     23   N/A Apto 10 sin dato  interior 229  ', '2', '1', '2', null, 'Sánchez ', null, 'Jobany ', '1', '71557127', '1983-08-08', '11', '9', '3659000.00', '3122017307', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-16 20:26:42', '2023-11-16 20:26:42', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('62', '04', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 19     23   N/A # 93 sin dato  ', '2', '1', '2', null, 'García ', null, 'Elicenia ', '1', '21953975', '1961-11-01', '11', '9', '2320000.00', '3108905816', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 20:46:13', '2023-11-16 20:46:13', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('63', '04', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 19     23   N/A # 93 sin dato  ', '2', '1', '2', null, 'García ', null, 'Elicenia ', '1', '21953975', '1961-11-01', '11', '9', '2320000.00', '3108905816', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 20:46:23', '2023-11-16 20:46:23', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('64', '04', '2023-03-28', '04', '1', '84', '      N/A sin dato  ', '2', '1', '2', null, 'Valencia ', null, 'Diana 																		', '1', '43689851', '1961-11-01', '11', '9', '0.00', 'Sin dato ', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 21:03:00', '2023-11-16 21:03:00', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('65', '04', '2023-03-28', '04', '1', '84', '      N/A sin dato  ', '2', '1', '2', null, 'Valencia ', null, 'Diana 																		', '1', '43689851', '1961-11-01', '11', '9', '0.00', 'Sin dato ', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 21:03:08', '2023-11-16 21:03:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('66', '04', '2023-03-28', '10', '1', '84', 'Av 23     N/A sin dato  ', '2', '1', '2', null, 'Acevedo ', null, 'Eder 																	', '1', '70142626', '1984-02-25', '11', '9', '1160000.00', '3137647683', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 21:37:43', '2023-11-16 21:37:43', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('67', '03', '2023-03-28', '	CI-536-2021	', '1', '84', 'Kr 19     22   N/A 16 sin dato  ', '2', '1', '2', null, 'García ', null, 'Elicenia  																', '1', '43689112', '1977-09-02', '11', '9', '1160000.00', '3007211136		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 21:52:23', '2023-11-16 21:52:23', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('68', '03', '2023-03-28', '	CI-536-2021	', '1', '84', 'Kr 19     22   N/A 16 sin dato  ', '2', '1', '2', null, 'García ', null, 'Elicenia  																', '1', '43689112', '1977-09-02', '11', '9', '1160000.00', '3007211136		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 21:52:31', '2023-11-16 21:52:31', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('69', '07', '2023-03-28', 'CI-536-2021', '1', '84', 'Kr 23   21 B N/A 57 sin dato  ', '2', '1', '2', null, 'Manrique ', null, 'Erika															', '1', '43689256', '1979-10-20', '11', '9', '1160000.00', '3118044083', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 22:03:36', '2023-11-16 22:03:36', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('70', '13', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 20     23   N/A 19 ', '2', '1', '2', null, 'Urrea ', null, 'Jeissy ', '1', '43689692', '1982-10-19', '11', '9', '2200000.00', '3225377293		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 22:40:22', '2023-11-16 22:40:22', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('71', '08', '2023-03-28', 'CI-536-2023', '1', '84', 'Kr 25 C 17 A N/A 35 ', '2', '1', '2', null, 'Grajales ', null, 'José ', '1', '94407062', '1980-03-07', '11', '9', '1200000.00', '3128034964		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 22:51:41', '2023-11-16 22:51:41', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('72', '05', '2028-03-28', 'CI-536-2021', '1', '84', 'Cll 18     19   N/A 55 ', '2', '1', '2', null, 'Carmona ', null, 'Juan ', '1', '1040181387', '1990-09-14', '11', '9', '1156000.00', '3226834390	', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 23:08:57', '2023-11-16 23:08:57', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('73', '06', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 19     26   N/A 25 ', '2', '1', '2', null, 'Muñoz ', null, 'Luis ', '1', '71141740', '1974-02-04', '11', '9', '1160000.00', '3117303138	', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-16 23:15:13', '2023-11-16 23:15:13', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('74', '11', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 17 A   25 C N/A 47 ', '2', '1', '2', null, 'Bedoya ', null, 'Viviana ', '1', '1040182396', '1992-12-30', '11', '9', '1500000.00', '3015343581		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 23:31:24', '2023-11-16 23:31:24', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('75', '11', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 17 A   25 C N/A 47 ', '2', '1', '2', null, 'Bedoya ', null, 'Viviana ', '1', '1040182396', '1992-12-30', '11', '9', '1500000.00', '3015343581		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 23:31:34', '2023-11-16 23:31:34', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('76', '13', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 23 A   15   N/A 33 ', '2', '1', '2', null, 'Rincón ', null, 'Ana ', '1', '43689638', '1983-04-25', '11', '9', '2800000.00', '3148446655	', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 23:45:26', '2023-11-16 23:45:26', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('77', '13', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 23 A   15   N/A 33 ', '2', '1', '2', null, 'Rincón ', null, 'Ana ', '1', '43689638', '1983-04-25', '11', '9', '2800000.00', '3148446655	', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-16 23:45:36', '2023-11-16 23:45:36', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('78', '06', '2023-03-28', 'CI-536-2021', '1', '84', 'Cll 16 A   21 B N/A 13 ', '2', '1', '2', null, 'Ceballos ', null, 'Ricardo ', '1', '1040182470', '1993-03-04', '11', '9', '1160000.00', '3105457158		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 01:43:07', '2023-11-17 01:43:07', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('79', '15', '2023-03-28', 'CI-536-2021', '1', '84', 'Kr 22     23   N/A 42 ', '2', '1', '2', null, 'Rojo ', null, 'Edwin ', '1', '71556892', '1980-06-23', '11', '9', '1160000.00', '3105464020		', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 01:52:15', '2023-11-17 01:52:15', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('80', '12', '2023-03-28', 'CI-536-2021', '1', '84', 'Kr 25 16 N/A 36 ', '2', '1', '2', null, 'Yepes ', null, 'Alex ', '1', '715556549', '1976-07-22', '11', '9', '1800000.00', '3206789207', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 02:04:25', '2023-11-17 02:04:25', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('81', '16', '2023-03-29', 'CI-536-2021', '1', '84', 'Cll 28     17   N/A 80 ', '2', '1', '2', null, 'Quiroz ', null, 'Alejandro ', '1', '8465149', '1980-03-17', '11', '9', '1500000.00', '3137471008	', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 02:24:03', '2023-11-17 02:24:03', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('82', '17', '2005-03-29', 'CI-536-2021', '1', '84', 'Cll 18     24   N/A 42 ', '2', '1', '2', null, 'Carvajal ', null, 'Marleny ', '1', '43049260', '1956-02-19', '11', '9', '0.00', '3217109009;3195967245	', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 02:38:08', '2023-11-17 02:38:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('83', '18', '2023-03-29', 'CI-536-2021', '1', '84', 'Kr N   24 N/A 102 ', '2', '1', '2', null, 'García ', null, 'Diego  ', '1', '71556261', '1971-09-18', '11', '9', '1500000.00', '3136295986		', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 02:51:40', '2023-11-17 02:51:40', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('84', '07', '2023-03-29', 'CI-536-2021', '1', '84', 'Cll 22 A   17 B N/A Apto 15 interior 503 ', '2', '1', '2', null, 'Vargas ', null, 'Paula ', '1', '1040030987', '1986-09-08', '11', '9', '2200000.00', '3147920044	', '1', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 03:00:38', '2023-11-17 03:00:38', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('85', '07', '2023-03-30', 'CI-536-2021', '1', '84', 'Kr 20     25   N/A 176 ', '2', '1', '2', null, 'Echeverry ', null, 'Claudia ', '1', '21954859', '1974-05-26', '11', '9', '1160000.00', '3207057842		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 03:14:03', '2023-11-17 03:14:03', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('86', '21', '2023-03-31', 'CI-536-2021', '1', '84', 'Cll 29     25   N/A 100 ', '2', '1', '2', null, 'López ', null, 'Diana ', '1', '1036951063', '1994-09-15', '11', '9', '2900000.00', '3147472365		', '1', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 03:23:06', '2023-11-17 03:23:06', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('87', '22', '2023-03-31', 'CI-536-2021', '1', '84', 'Kr 19     22   N/A 74 ', '2', '1', '2', null, 'Giraldo ', null, 'Luz ', '1', '39446592', '1975-05-21', '11', '9', '1160000.00', '3107466182		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 03:43:40', '2023-11-17 03:43:40', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('88', '23', '2023-04-01', 'CI-536-2021', '1', '84', 'Cll 24 A   19   21 Interior 201 ', '2', '1', '2', null, 'Castaño', null, 'Duver', '1', '1040181790', '1993-08-19', '11', '9', '1650000.00', '3192638363		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 03:57:59', '2023-11-17 03:57:59', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('89', '23', '2023-04-01', 'CI-536-2021', '1', '84', 'Cll 24 A   19   21 Interior 201 ', '2', '1', '2', null, 'Castaño', null, 'Duver', '1', '1040181790', '1993-08-19', '11', '9', '1650000.00', '3192638363		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 03:58:05', '2023-11-17 03:58:05', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('90', '24', '2023-04-01', 'CI-536-2021', '1', '84', 'Cll 23 B   23   N/A 10 Interior 201 ', '2', '1', '2', null, 'Echeverry', null, 'Tatiana ', '1', '1040183473', '1996-08-02', '11', '9', '1160000.00', '3015451685		', '1', '1', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 04:14:24', '2023-11-17 04:14:24', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('91', '25', '2023-03-01', 'CI-536-2021', '1', '84', 'Cll 23 19 N/A Apto 05 apto 302 ', '2', '1', '2', null, 'Monroy ', null, 'Jaime ', '1', '71330442', '1977-11-11', '11', '9', '3400000.00', '3002554836	', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 13:41:52', '2023-11-17 13:41:52', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('92', '25', '2023-03-01', 'CI-536-2021', '1', '84', 'Cll 23 19 N/A Apto 05 apto 302 ', '2', '1', '2', null, 'Monroy ', null, 'Jaime ', '1', '71330442', '1977-11-11', '11', '9', '3400000.00', '3002554836	', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 13:42:00', '2023-11-17 13:42:00', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('93', '25', '2023-03-01', 'CI-536-2021', '1', '84', 'Cll 23 19 N/A Apto 05 apto 302 ', '2', '1', '2', null, 'Monroy ', null, 'Jaime ', '1', '71330442', '1977-11-11', '11', '9', '3400000.00', '3002554836	', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 13:42:09', '2023-11-17 13:42:09', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('94', '26', '2023-04-03', 'CI-536-2021', '1', '84', 'Cll 241 A   17 A N/A 46 ', '2', '1', '2', null, 'Gómez ', null, 'Franklin ', '1', '71556173', '1971-05-01', '11', '9', '2228000.00', '3237286109	', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 13:49:04', '2023-11-17 13:49:04', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('95', '27', '2023-04-03', 'CI-536-2021', '1', '84', '      N/A parcelación la maria   ', '2', '1', '2', null, 'García ', null, 'Augusto ', '1', '71740476', '1965-01-19', '12', '9', '1020000.00', '3207985616		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 14:01:13', '2023-11-17 14:01:13', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('96', '28', '2023-04-03', 'CI-536-2021', '1', '84', 'Cll 17     24   N/A 20 ', '2', '1', '2', null, 'Vargas ', null, 'Gustavo ', '1', '71555708', '1966-09-24', '11', '9', '1800000.00', '3126045324		', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 14:08:07', '2023-11-17 14:08:07', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('97', '28', '2021-04-03', 'CI-536-2021', '1', '84', 'Cll 17     24   N/A 20 ', '2', '1', '2', null, 'Vargas ', null, 'Gustavo ', '1', '71555708', '1966-09-24', '11', '9', '1800000.00', '3126045324		', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 14:36:11', '2023-11-17 14:36:11', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('98', '29', '2023-04-03', 'CI-536-2021', '1', '84', 'Kr 22     23 A N/A 12 ', '2', '1', '2', null, 'Carmona ', null, 'Edison ', '1', '1040180803', '1988-07-17', '11', '9', '2200000.00', '3173896654		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 14:47:39', '2023-11-17 14:47:39', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('99', '30', '2023-03-04', 'CI-536-2021', '1', '84', 'Cll 23     17   N/A 10 ', '2', '1', '2', null, 'García ', null, 'Claudia  ', '1', '43689094', '1977-05-16', '11', '9', '1598000.00', '3226250703	', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 15:08:36', '2023-11-17 15:08:36', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('100', '30', '2023-03-04', 'CI-536-2021', '1', '84', 'Cll 23     17   N/A 10 ', '2', '1', '2', null, 'García ', null, 'Claudia  ', '1', '43689094', '1977-05-16', '11', '9', '1598000.00', '3226250703	', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 15:08:48', '2023-11-17 15:08:48', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('101', '001', '2023-11-11', 'CI-538-2021', '1', '63', 'Cll 19     24   N/A 66 ', '2', '1', '2', null, 'Suaza ', null, 'Orfa ', '1', '43689619', '1982-09-02', '11', '9', '1568853.00', '3204839584		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 15:44:23', '2023-11-17 15:44:23', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('102', '001', '2023-04-11', 'CI-538-2021', '1', '63', '      N/A ', '2', '1', '2', null, 'Padierna ', null, 'Álvaro ', '1', '70413987', '1961-11-04', '11', '9', '922413.00', '3233725431		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 16:03:04', '2023-11-17 16:03:04', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('103', '001', '2023-04-25', 'CI-538-2021', '1', '63', 'Cll 21     26   N/A 12 ', '2', '1', '2', 'S/D', 'Valencia ', null, 'Claire ', '1', '39187955', '1975-05-24', '11', '9', '0.00', '3146061899		', '1', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 16:20:39', '2023-11-17 16:20:39', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('104', '001', '2023-07-11', 'CI-538-2021', '1', '63', 'Kr 18 B   9 A N/A 22 ', '2', '1', '2', null, 'Correo ', null, 'Edisson ', '1', '15383557', '1973-09-17', '11', '9', '1608526.00', '3128213105		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 16:37:26', '2023-11-17 16:37:26', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('105', '01', '2023-08-11', 'CI-538-2021', '1', '63', 'Kr 13     13 A N/A Juan pablo II ', '2', '1', '2', null, 'Escobar ', null, 'Víctor ', '1', '1.040049152', '1997-11-15', '11', '9', '1570000.00', '3142316478		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 16:56:08', '2023-11-17 16:56:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('106', '002', '2023-06-15', 'CI-538-2021', '1', '63', 'Cll 5 C   26 A N/A 12 San judas  Payuco  ', '2', '1', '2', null, 'Cardona  ', null, 'Mary ', '1', '39188898', '1977-06-24', '11', '9', '908526.00', '3194028747 - 3043738863', '1', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 17:08:48', '2023-11-17 17:08:48', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('107', '002', '2023-07-11', 'CI-538-2021', '1', '63', 'Cll 26   17   N/A 18 ', '2', '1', '2', null, 'Otalvaro ', null, 'Jhon ', '1', '1040033506', '1988-02-03', '11', '9', '908526.00', '3104993473		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 17:21:14', '2023-11-17 17:21:14', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('108', '002', '2023-07-11', 'CI-538-2021', '1', '63', 'Cll 26   17   N/A 18 ', '2', '1', '2', null, 'Otalvaro ', null, 'Jhon ', '1', '1040033506', '1988-02-03', '11', '9', '908526.00', '3104993473		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 17:21:20', '2023-11-17 17:21:20', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('109', '002', '2023-07-15', 'CI-538-2021', '1', '63', 'Kr 10 B   17 A N/A 87 ', '2', '1', '2', null, 'Morales ', null, 'Luz ', '1', '1040038849', '1990-02-21', '11', '9', '1271000.00', '3103997074', '1', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 17:36:11', '2023-11-17 17:36:11', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('110', '02', '2023-11-28', 'CI-538-2021', '1', '63', 'Cll 12     20   N/A 57 cuatro esquinas ', '2', '1', '2', null, 'Ortiz ', null, 'Carolina ', '1', '1.040038950', '1990-12-19', '11', '9', '1842000.00', '3206074197	', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 18:05:04', '2023-11-17 18:05:04', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('111', '02', '2023-11-28', 'CI-538-2021', '1', '63', 'Cll 12     20   N/A 57 cuatro esquinas ', '2', '1', '2', null, 'Ortiz ', null, 'Carolina ', '1', '1.040038950', '1990-12-19', '11', '9', '1842000.00', '3206074197	', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 18:05:10', '2023-11-17 18:05:10', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('112', '003', '2023-04-11', 'CI-538-2021', '1', '63', 'Cll 8 A 20   N/A 95 ', '2', '1', '2', null, 'Ospina ', null, 'Ana ', '1', '31154343', '1985-12-02', '11', '9', '1000000.00', '3196830744		', '1', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 18:21:05', '2023-11-17 18:21:05', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('113', '003', '2023-07-11', 'CI-538-2021', '1', '63', 'Cll 10     20   N/A 05 ', '2', '1', '2', null, 'Betancur ', null, 'Danilo ', '1', '1040033955', '1988-03-22', '11', '9', '1070316.00', '3108226897		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 18:39:03', '2023-11-17 18:39:03', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('114', '003', '2023-07-11', 'CI-538-2021', '1', '63', 'Cll 10     20   N/A 05 ', '2', '1', '2', null, 'Betancur ', null, 'Danilo ', '1', '1040033955', '1988-03-22', '11', '9', '1070316.00', '3108226897		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 18:39:12', '2023-11-17 18:39:12', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('115', '003', '2022-10-13', 'CI-538-2021', '1', '63', 'Cll 7 B   13 B N/A 10 ', '2', '1', '2', null, 'López ', null, 'Jhon ', '1', '1036785665', '1998-11-01', '11', '9', '1000000.00', '3138871788', '2', '2', 'S/D', 'S/D', '7', '4', null, '6', '7', '1', '2023-11-17 20:20:33', '2023-11-17 20:20:33', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('116', '03', '2022-11-28', 'CI-538-2021', '1', '63', 'Kr 18     8   N/A 34 La antioqueñita  ', '2', '1', '2', null, 'Londoño ', null, 'Andrés ', '1', '15.389051', '1985-08-22', '11', '9', '1180000.00', '3145765032		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 20:45:53', '2023-11-17 20:45:53', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados` VALUES ('117', '03', '2022-11-28', 'CI-538-2021', '1', '63', 'Kr 18     8   N/A 34 La antioqueñita  ', '2', '1', '2', null, 'Londoño ', null, 'Andrés ', '1', '15.389051', '1985-08-22', '11', '9', '1180000.00', '3145765032		', '2', '2', null, null, '7', '4', null, '6', '7', '1', '2023-11-17 20:45:59', '2023-11-17 20:45:59', 'Yeraldine.Osorio', 'Yeraldine.Osorio');

-- ----------------------------
-- Table structure for `beneficiario_datos_postulados_enfoque_diferencial`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_datos_postulados_enfoque_diferencial`;
CREATE TABLE `beneficiario_datos_postulados_enfoque_diferencial` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Id_beneficiario_postulado` int DEFAULT NULL,
  `Id_tipo_enfoque_diferencial` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Enfoque_Diferencial_Postulados_idx` (`Id_beneficiario_postulado`),
  KEY `Indx_ID_Tipo_Enfoque` (`Id_tipo_enfoque_diferencial`),
  CONSTRAINT `FK_Enfoque_Diferencial` FOREIGN KEY (`Id_tipo_enfoque_diferencial`) REFERENCES `beneficiario_cfg_tipo_enfoque_diferencial` (`Id`),
  CONSTRAINT `FK_Enfoque_Diferencial_Postulados` FOREIGN KEY (`Id_beneficiario_postulado`) REFERENCES `beneficiario_datos_postulados` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_datos_postulados_enfoque_diferencial
-- ----------------------------
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('1', '29', '3', '1', '2023-11-15 18:15:05', '2023-11-15 18:15:05', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('2', '30', '4', '1', '2023-11-15 18:21:25', '2023-11-15 18:21:25', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('3', '31', '4', '1', '2023-11-15 18:28:52', '2023-11-15 18:28:52', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('4', '32', '2', '1', '2023-11-15 18:34:25', '2023-11-15 18:34:25', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('5', '32', '3', '1', '2023-11-15 18:34:27', '2023-11-15 18:34:27', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('6', '33', '2', '1', '2023-11-15 19:29:39', '2023-11-15 19:29:39', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('7', '33', '3', '1', '2023-11-15 19:29:41', '2023-11-15 19:29:41', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('8', '34', '3', '1', '2023-11-15 19:34:51', '2023-11-15 19:34:51', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('9', '35', '3', '1', '2023-11-15 19:41:19', '2023-11-15 19:41:19', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('10', '36', '3', '1', '2023-11-15 19:47:46', '2023-11-15 19:47:46', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('11', '37', '2', '1', '2023-11-15 20:00:32', '2023-11-15 20:00:32', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('12', '37', '3', '1', '2023-11-15 20:00:34', '2023-11-15 20:00:34', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('13', '38', '2', '1', '2023-11-15 20:08:39', '2023-11-15 20:08:39', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('14', '38', '3', '1', '2023-11-15 20:08:41', '2023-11-15 20:08:41', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('15', '39', '3', '1', '2023-11-15 20:13:16', '2023-11-15 20:13:16', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('16', '40', '2', '1', '2023-11-15 20:19:45', '2023-11-15 20:19:45', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('17', '40', '3', '1', '2023-11-15 20:19:47', '2023-11-15 20:19:47', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('18', '41', '3', '1', '2023-11-15 20:23:57', '2023-11-15 20:23:57', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('19', '42', '2', '1', '2023-11-15 20:28:53', '2023-11-15 20:28:53', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('20', '42', '3', '1', '2023-11-15 20:28:55', '2023-11-15 20:28:55', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('21', '43', '3', '1', '2023-11-15 20:36:03', '2023-11-15 20:36:03', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('22', '44', '3', '1', '2023-11-15 20:39:39', '2023-11-15 20:39:39', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('23', '45', '3', '1', '2023-11-15 20:45:24', '2023-11-15 20:45:24', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('24', '46', '3', '1', '2023-11-15 20:51:29', '2023-11-15 20:51:29', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('25', '47', '3', '1', '2023-11-15 20:58:42', '2023-11-15 20:58:42', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('26', '48', '3', '1', '2023-11-15 21:03:11', '2023-11-15 21:03:11', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('27', '49', '3', '1', '2023-11-15 21:08:50', '2023-11-15 21:08:50', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('28', '50', '3', '1', '2023-11-15 22:10:38', '2023-11-15 22:10:38', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('29', '51', '3', '1', '2023-11-15 22:19:48', '2023-11-15 22:19:48', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('30', '52', '3', '1', '2023-11-15 22:19:57', '2023-11-15 22:19:57', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('31', '53', '3', '1', '2023-11-15 22:23:57', '2023-11-15 22:23:57', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('33', '55', '3', '1', '2023-11-15 22:36:51', '2023-11-15 22:36:51', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('34', '56', '3', '1', '2023-11-15 22:37:02', '2023-11-15 22:37:02', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('35', '57', '2', '1', '2023-11-15 22:40:50', '2023-11-15 22:40:50', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('36', '57', '4', '1', '2023-11-15 22:40:52', '2023-11-15 22:40:52', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('37', '57', '7', '1', '2023-11-15 22:40:54', '2023-11-15 22:40:54', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('38', '58', '4', '1', '2023-11-15 22:47:38', '2023-11-15 22:47:38', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('39', '59', '3', '1', '2023-11-15 22:50:41', '2023-11-15 22:50:41', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('40', '60', '4', '1', '2023-11-16 20:14:16', '2023-11-16 20:14:16', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('41', '61', '4', '1', '2023-11-16 20:26:44', '2023-11-16 20:26:44', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('42', '62', '3', '1', '2023-11-16 20:46:15', '2023-11-16 20:46:15', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('43', '63', '3', '1', '2023-11-16 20:46:25', '2023-11-16 20:46:25', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('44', '64', '3', '1', '2023-11-16 21:03:02', '2023-11-16 21:03:02', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('45', '65', '3', '1', '2023-11-16 21:03:10', '2023-11-16 21:03:10', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('46', '66', '4', '1', '2023-11-16 21:37:45', '2023-11-16 21:37:45', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('47', '67', '3', '1', '2023-11-16 21:52:25', '2023-11-16 21:52:25', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('48', '68', '3', '1', '2023-11-16 21:52:33', '2023-11-16 21:52:33', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('49', '69', '3', '1', '2023-11-16 22:03:38', '2023-11-16 22:03:38', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('50', '70', '3', '1', '2023-11-16 22:40:24', '2023-11-16 22:40:24', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('51', '71', '4', '1', '2023-11-16 22:51:43', '2023-11-16 22:51:43', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('52', '72', '4', '1', '2023-11-16 23:08:59', '2023-11-16 23:08:59', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('53', '73', '4', '1', '2023-11-16 23:15:15', '2023-11-16 23:15:15', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('54', '74', '3', '1', '2023-11-16 23:31:26', '2023-11-16 23:31:26', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('55', '75', '3', '1', '2023-11-16 23:31:36', '2023-11-16 23:31:36', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('56', '76', '3', '1', '2023-11-16 23:45:28', '2023-11-16 23:45:28', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('57', '77', '3', '1', '2023-11-16 23:45:38', '2023-11-16 23:45:38', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('58', '78', '4', '1', '2023-11-17 01:43:09', '2023-11-17 01:43:09', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('59', '79', '4', '1', '2023-11-17 01:52:17', '2023-11-17 01:52:17', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('60', '80', '4', '1', '2023-11-17 02:04:27', '2023-11-17 02:04:27', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('61', '81', '4', '1', '2023-11-17 02:24:05', '2023-11-17 02:24:05', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('62', '82', '2', '1', '2023-11-17 02:38:10', '2023-11-17 02:38:10', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('63', '82', '3', '1', '2023-11-17 02:38:12', '2023-11-17 02:38:12', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('64', '83', '4', '1', '2023-11-17 02:51:42', '2023-11-17 02:51:42', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('65', '84', '3', '1', '2023-11-17 03:00:40', '2023-11-17 03:00:40', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('66', '85', '3', '1', '2023-11-17 03:14:06', '2023-11-17 03:14:06', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('67', '86', '2', '1', '2023-11-17 03:23:08', '2023-11-17 03:23:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('68', '86', '3', '1', '2023-11-17 03:23:10', '2023-11-17 03:23:10', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('69', '87', '3', '1', '2023-11-17 03:43:42', '2023-11-17 03:43:42', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('70', '88', '4', '1', '2023-11-17 03:58:01', '2023-11-17 03:58:01', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('71', '89', '4', '1', '2023-11-17 03:58:07', '2023-11-17 03:58:07', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('72', '90', '3', '1', '2023-11-17 04:14:26', '2023-11-17 04:14:26', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('73', '91', '4', '1', '2023-11-17 13:41:54', '2023-11-17 13:41:54', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('74', '92', '4', '1', '2023-11-17 13:42:02', '2023-11-17 13:42:02', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('75', '93', '4', '1', '2023-11-17 13:42:11', '2023-11-17 13:42:11', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('76', '94', '4', '1', '2023-11-17 13:49:06', '2023-11-17 13:49:06', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('77', '95', '4', '1', '2023-11-17 14:01:15', '2023-11-17 14:01:15', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('78', '96', '4', '1', '2023-11-17 14:08:09', '2023-11-17 14:08:09', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('79', '97', '4', '1', '2023-11-17 14:36:14', '2023-11-17 14:36:14', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('80', '98', '4', '1', '2023-11-17 14:47:41', '2023-11-17 14:47:41', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('81', '99', '3', '1', '2023-11-17 15:08:38', '2023-11-17 15:08:38', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('82', '100', '3', '1', '2023-11-17 15:08:50', '2023-11-17 15:08:50', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('83', '101', '2', '1', '2023-11-17 15:44:25', '2023-11-17 15:44:25', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('84', '101', '3', '1', '2023-11-17 15:44:27', '2023-11-17 15:44:27', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('85', '102', '4', '1', '2023-11-17 16:03:06', '2023-11-17 16:03:06', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('86', '103', '3', '1', '2023-11-17 16:20:41', '2023-11-17 16:20:41', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('87', '104', '4', '1', '2023-11-17 16:37:28', '2023-11-17 16:37:28', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('88', '105', '4', '1', '2023-11-17 16:56:10', '2023-11-17 16:56:10', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('89', '106', '3', '1', '2023-11-17 17:08:50', '2023-11-17 17:08:50', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('90', '107', '4', '1', '2023-11-17 17:21:16', '2023-11-17 17:21:16', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('91', '108', '4', '1', '2023-11-17 17:21:22', '2023-11-17 17:21:22', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('92', '109', '3', '1', '2023-11-17 17:36:13', '2023-11-17 17:36:13', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('93', '110', '3', '1', '2023-11-17 18:05:06', '2023-11-17 18:05:06', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('94', '111', '3', '1', '2023-11-17 18:05:12', '2023-11-17 18:05:12', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('95', '112', '3', '1', '2023-11-17 18:21:07', '2023-11-17 18:21:07', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('96', '113', '4', '1', '2023-11-17 18:39:05', '2023-11-17 18:39:05', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('97', '114', '4', '1', '2023-11-17 18:39:14', '2023-11-17 18:39:14', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('98', '115', '4', '1', '2023-11-17 20:20:36', '2023-11-17 20:20:36', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('99', '116', '4', '1', '2023-11-17 20:45:55', '2023-11-17 20:45:55', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_enfoque_diferencial` VALUES ('100', '117', '4', '1', '2023-11-17 20:46:01', '2023-11-17 20:46:01', 'Yeraldine.Osorio', 'Yeraldine.Osorio');

-- ----------------------------
-- Table structure for `beneficiario_datos_postulados_grupo_familiar`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_datos_postulados_grupo_familiar`;
CREATE TABLE `beneficiario_datos_postulados_grupo_familiar` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_beneficiario_postulado` int DEFAULT NULL,
  `PrimerNombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `SegundoNombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `PrimerApellido` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `SegundoApellido` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Id_TipoDocumento` int DEFAULT NULL,
  `Identificacion` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Id_Parentesco` int DEFAULT NULL,
  `Id_Escolaridad` int DEFAULT NULL,
  `Id_Genero` int DEFAULT NULL,
  `IngresosMes` float(10,2) DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Id_Tipo_documento_idx` (`Id_TipoDocumento`),
  KEY `FK_Id_parentesco_idx` (`Id_Parentesco`),
  KEY `FK_Id_Escolaridad_idx` (`Id_Escolaridad`),
  KEY `FK_Grupo_Familiar_Postualdos` (`Id_beneficiario_postulado`),
  CONSTRAINT `FK_Grupo_Familiar_Postualdos` FOREIGN KEY (`Id_beneficiario_postulado`) REFERENCES `beneficiario_datos_postulados` (`Id`),
  CONSTRAINT `FK_Id_Escolaridad` FOREIGN KEY (`Id_Escolaridad`) REFERENCES `cfg_nivel_escolaridad` (`Id`),
  CONSTRAINT `FK_Id_parentesco` FOREIGN KEY (`Id_Parentesco`) REFERENCES `cfg_parentesco` (`Id`),
  CONSTRAINT `FK_Id_Tipo_documento` FOREIGN KEY (`Id_TipoDocumento`) REFERENCES `cfg_tipo_identificacion_documento` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_datos_postulados_grupo_familiar
-- ----------------------------
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('1', '35', 'Horacio ', 'S/D', 'Rodriguez', 'S/D', '1953-11-11', '1', '3669577', '1', '11', null, '0.00', '1', '2023-11-15 19:41:21', '2023-11-15 19:41:21', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('2', '37', 'Maick', 'S/D', 'Fabra', 'Ochoa', '1999-01-17', '1', '1040523428', '3', '11', null, '0.00', '1', '2023-11-15 20:00:36', '2023-11-15 20:00:36', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('3', '37', 'Mahia ', 'S/D', 'Fabra', 'Ochoa', '2020-04-20', '4', '1041039779', '3', '11', null, '0.00', '1', '2023-11-15 20:00:40', '2023-11-15 20:00:40', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('4', '37', 'Ángel ', 'S/D', 'Córdoba ', 'Minota', '1967-09-26', '1', '8200679', '1', '11', null, '0.00', '1', '2023-11-15 20:00:44', '2023-11-15 20:00:44', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('5', '38', 'Maick ', 'S/D', 'Fabra ', 'Ochoa', '2022-01-17', '4', '1040523428', '3', '11', null, '0.00', '1', '2023-11-15 20:08:43', '2023-11-15 20:08:43', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('6', '38', 'Mahia', 'S/D', 'Fabra ', 'Ochoa', '2020-04-20', '4', '1041039779', '3', '11', null, '0.00', '1', '2023-11-15 20:08:47', '2023-11-15 20:08:47', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('7', '38', 'Ángel ', 'S/D', 'Córdoba ', 'Minota', '1967-09-26', '1', '8200679', '3', '11', null, '0.00', '1', '2023-11-15 20:08:52', '2023-11-15 20:08:52', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('8', '40', 'Efrain ', 'S/D', 'Osorio ', 'Pérez ', '1964-05-30', '1', '2826356', '1', '11', null, '0.00', '1', '2023-11-15 20:19:49', '2023-11-15 20:19:49', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('9', '43', 'Reinaldo ', 'Daniel ', 'Oviedo ', 'Ricardo', '1944-08-13', '1', '902986', '1', '11', null, '0.00', '1', '2023-11-15 20:36:05', '2023-11-15 20:36:05', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('10', '45', 'Samanta ', 'S/D', 'Rodriguez', 'V', '2022-08-21', '4', '1041089992', '2', '11', null, '0.00', '1', '2023-11-15 20:45:26', '2023-11-15 20:45:26', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('11', '47', 'Luisa ', 'Fernanda', 'Maquea', 'Tapia', '1994-02-01', '1', '1007448555', '2', '11', null, '0.00', '1', '2023-11-15 20:58:44', '2023-11-15 20:58:44', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('12', '51', 'Kevin ', 'David ', 'De Leon', 'S/D', '2008-03-31', '3', '1041037362', '3', '11', null, '0.00', '1', '2023-11-15 22:19:50', '2023-11-15 22:19:50', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('13', '51', 'Enmanuel ', 'S/D', 'De Leon', 'S/D', '2017-02-16', '4', '1040519061', '3', '11', null, '0.00', '1', '2023-11-15 22:19:52', '2023-11-15 22:19:52', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('14', '52', 'Kevin ', 'David ', 'De Leon', 'S/D', '2008-03-31', '3', '1041037362', '3', '11', null, '0.00', '1', '2023-11-15 22:19:59', '2023-11-15 22:19:59', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('15', '52', 'Enmanuel ', 'S/D', 'De Leon', 'S/D', '2017-02-16', '4', '1040519061', '3', '11', null, '0.00', '1', '2023-11-15 22:20:01', '2023-11-15 22:20:01', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('17', '55', 'Luz ', 'Daniela ', 'Ballesteros ', 'Baltazar', '2010-12-19', '3', '1040509714', '2', '11', null, '0.00', '1', '2023-11-15 22:36:53', '2023-11-15 22:36:53', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('18', '55', 'Milton', 'S/D', 'Ruiz ', 'Baltazar', '1996-03-05', '1', '1001741715', '2', '11', null, '0.00', '1', '2023-11-15 22:36:55', '2023-11-15 22:36:55', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('19', '55', 'German ', 'Antonio ', 'Gomez', 'S/D', '1996-03-05', '1', '1001741715', '1', '11', null, '0.00', '1', '2023-11-15 22:36:57', '2023-11-15 22:36:57', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('20', '56', 'Luz ', 'Daniela ', 'Ballesteros ', 'Baltazar', '2010-12-19', '3', '1040509714', '2', '11', null, '0.00', '1', '2023-11-15 22:37:04', '2023-11-15 22:37:04', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('21', '56', 'Milton', 'S/D', 'Ruiz ', 'Baltazar', '1996-03-05', '1', '1001741715', '2', '11', null, '0.00', '1', '2023-11-15 22:37:06', '2023-11-15 22:37:06', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('22', '56', 'German ', 'Antonio ', 'Gomez', 'S/D', '1996-03-05', '1', '1001741715', '1', '11', null, '0.00', '1', '2023-11-15 22:37:08', '2023-11-15 22:37:08', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('23', '58', 'Leovi ', 'María ', 'Viloria ', 'Diaz', '1988-06-25', '1', '1001684171', '6', '11', null, '0.00', '1', '2023-11-15 22:47:40', '2023-11-15 22:47:40', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('24', '62', 'Andrés ', 'Felipe ', 'Bedoya ', 'Ríos ', '1992-09-15', '1', '1040182306', '2', '11', null, null, '1', '2023-11-16 20:46:17', '2023-11-16 20:46:17', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('25', '62', 'Octavio ', 'De Jesús ', 'Ríos ', 'Catañeda', '1957-03-24', '1', '35586607', '6', '11', null, '1160000.00', '1', '2023-11-16 20:46:21', '2023-11-16 20:46:21', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('26', '63', 'Andrés ', 'Felipe ', 'Bedoya ', 'Ríos ', '1992-09-15', '1', '1040182306', '2', '11', null, null, '1', '2023-11-16 20:46:27', '2023-11-16 20:46:27', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('27', '63', 'Octavio ', 'De Jesús ', 'Ríos ', 'Catañeda', '1957-03-24', '1', '35586607', '6', '11', null, '1160000.00', '1', '2023-11-16 20:46:31', '2023-11-16 20:46:31', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('28', '64', ' Dulce ', 'María ', 'Valencia ', 'Valencia ', '1992-09-15', '1', '43689851', '2', '11', null, null, '1', '2023-11-16 21:03:04', '2023-11-16 21:03:04', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('29', '65', ' Dulce ', 'María ', 'Valencia ', 'Valencia ', '1992-09-15', '1', '43689851', '2', '11', null, null, '1', '2023-11-16 21:03:12', '2023-11-16 21:03:12', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('30', '66', 'Diana ', 'Marcela ', 'Botero ', 'Heredia  ', '1987-04-24', '1', '1128417681', '1', '11', null, null, '1', '2023-11-16 21:37:47', '2023-11-16 21:37:47', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('31', '67', 'VALENTINA									VALENTINA GARCÌA GARCÌA									', 'S/D', 'García ', 'García ', '1999-11-25', '1', '1040184622', '2', '11', null, null, '1', '2023-11-16 21:52:27', '2023-11-16 21:52:27', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('32', '67', 'Isabel 								VALENTINA GARCÌA GARCÌA									', 'S/D', 'García ', 'García ', '1999-11-25', '1', '1040180988', '2', '11', null, null, '1', '2023-11-16 21:52:29', '2023-11-16 21:52:29', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('33', '68', 'VALENTINA									VALENTINA GARCÌA GARCÌA									', 'S/D', 'García ', 'García ', '1999-11-25', '1', '1040184622', '2', '11', null, null, '1', '2023-11-16 21:52:35', '2023-11-16 21:52:35', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('34', '68', 'Isabel 								VALENTINA GARCÌA GARCÌA									', 'S/D', 'García ', 'García ', '1999-11-25', '1', '1040180988', '2', '11', null, null, '1', '2023-11-16 21:52:37', '2023-11-16 21:52:37', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('35', '69', 'Ana 						VALENTINA GARCÌA GARCÌA									', 'Sofia ', 'Ortega ', 'Manrique ', '2003-12-15', '3', '1040873583', '2', '11', null, null, '1', '2023-11-16 22:03:40', '2023-11-16 22:03:40', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('36', '70', 'Hernando ', 'De Jesús ', 'Urrea ', 'Arroyabe ', '1945-12-17', '1', '3562155', '5', '11', null, null, '1', '2023-11-16 22:40:26', '2023-11-16 22:40:26', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('37', '70', 'Anny ', 'S/D', 'Satizabal ', 'Urrea ', '2017-09-27', '3', '1039769612', '5', '11', null, null, '1', '2023-11-16 22:40:28', '2023-11-16 22:40:28', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('38', '71', 'Mariam ', 'S/D', 'García ', 'Posada', '1983-06-28', '1', '43862657', '1', '11', null, null, '1', '2023-11-16 22:51:45', '2023-11-16 22:51:45', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('39', '72', 'Laura ', 'Victoria ', 'Bedoya  ', 'Ríos ', '1990-09-14', '1', '1040181547', '1', '11', null, null, '1', '2023-11-16 23:09:01', '2023-11-16 23:09:01', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('40', '72', 'Laura ', 'Victoria ', 'Bedoya  ', 'Ríos ', '1990-09-14', '1', '1040181547', '1', '11', null, null, '1', '2023-11-16 23:09:03', '2023-11-16 23:09:03', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('41', '72', 'Samuel ', 'S/D', 'Ríos ', 'Bedoya ', '2011-10-04', '3', '1039310620', '2', '11', null, null, '1', '2023-11-16 23:09:06', '2023-11-16 23:09:06', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('42', '72', 'Emilia ', 'S/D', 'Bedoya ', 'Carmona ', '2011-10-04', '4', '1039739722', '2', '11', null, null, '1', '2023-11-16 23:09:08', '2023-11-16 23:09:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('43', '74', 'JONATHAN  									', 'Leandro', 'Mejía ', 'Agudelo ', '1990-04-05', '1', '1037603767', '1', '11', null, '1700000.00', '1', '2023-11-16 23:31:28', '2023-11-16 23:31:28', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('44', '74', 'Antonella   									', 'S/D', 'Mejía ', 'Bedoya ', '2019-02-09', '4', '1039739701', '2', '11', null, '0.00', '1', '2023-11-16 23:31:30', '2023-11-16 23:31:30', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('45', '74', 'Rebeca 								', 'S/D', 'Mejía ', 'Bedoya ', '2019-02-09', '4', '1039740124', '2', '11', null, '0.00', '1', '2023-11-16 23:31:32', '2023-11-16 23:31:32', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('46', '75', 'JONATHAN  									', 'Leandro', 'Mejía ', 'Agudelo ', '1990-04-05', '1', '1037603767', '1', '11', null, '1700000.00', '1', '2023-11-16 23:31:38', '2023-11-16 23:31:38', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('47', '75', 'Antonella   									', 'S/D', 'Mejía ', 'Bedoya ', '2019-02-09', '4', '1039739701', '2', '11', null, '0.00', '1', '2023-11-16 23:31:40', '2023-11-16 23:31:40', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('48', '75', 'Rebeca 								', 'S/D', 'Mejía ', 'Bedoya ', '2019-02-09', '4', '1039740124', '2', '11', null, '0.00', '1', '2023-11-16 23:31:42', '2023-11-16 23:31:42', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('49', '76', 'Eliecer 							', 'S/D', 'Rincón ', 'S/D', '1961-11-20', '1', '71555062', '5', '11', '0', '1160000.00', '1', '2023-11-16 23:45:30', '2023-11-16 23:45:30', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('50', '76', 'Doris  							', 'S/D', 'Realpe ', 'S/D', '1959-04-18', '1', '37450459', '5', '11', '0', '0.00', '1', '2023-11-16 23:45:32', '2023-11-16 23:45:32', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('51', '76', 'Celeste 						', 'S/D', 'Ochoa', 'Rincón ', '2017-10-02', '4', '1040184564', '2', '11', '0', '0.00', '1', '2023-11-16 23:45:34', '2023-11-16 23:45:34', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('52', '77', 'Eliecer 							', 'S/D', 'Rincón ', 'S/D', '1961-11-20', '1', '71555062', '5', '11', '0', '1160000.00', '1', '2023-11-16 23:45:40', '2023-11-16 23:45:40', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('53', '77', 'Doris  							', 'S/D', 'Realpe ', 'S/D', '1959-04-18', '1', '37450459', '5', '11', '0', '0.00', '1', '2023-11-16 23:45:43', '2023-11-16 23:45:43', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('54', '77', 'Celeste 						', 'S/D', 'Ochoa', 'Rincón ', '2017-10-02', '4', '1040184564', '2', '11', '0', '0.00', '1', '2023-11-16 23:45:45', '2023-11-16 23:45:45', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('55', '78', 'Vanesa 					', 'S/D', 'Gómez ', 'Vanegas ', '1991-08-02', '1', '1001660004', '1', '11', '0', '1300000.00', '1', '2023-11-17 01:43:11', '2023-11-17 01:43:11', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('56', '81', 'Wendy 				', 'Julieth', 'Grisales', 'Gallego ', '1988-03-12', '1', '1037594504', '1', '11', '0', null, '1', '2023-11-17 02:24:07', '2023-11-17 02:24:07', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('57', '81', 'Jerónimo  				', 'S/D', 'Quiroz ', 'Grisales ', '2018-10-19', '4', '1023548334', '2', '11', '0', null, '1', '2023-11-17 02:24:10', '2023-11-17 02:24:10', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('58', '82', 'Jhon 				', 'Alexander ', 'Carvajal ', 'S/D', '1986-06-02', '1', '1040180102', '2', '11', '0', null, '1', '2023-11-17 02:38:14', '2023-11-17 02:38:14', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('59', '85', 'Yony			', 'Alexander ', 'Echeverry ', 'Pérez ', '2003-04-21', '1', '1001445271', '2', '11', '0', '1160000.00', '1', '2023-11-17 03:14:08', '2023-11-17 03:14:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('60', '87', 'Johan 		', 'Alexander ', 'Arbeláez ', 'Giraldo', '2001-07-19', '1', '1007238091', '2', '11', '0', null, '1', '2023-11-17 03:43:44', '2023-11-17 03:43:44', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('61', '87', 'Sebastián 	', 'S/D', 'Garcia', 'Giraldo', '2003-07-24', '1', '1001445316', '2', '11', '0', null, '1', '2023-11-17 03:43:46', '2023-11-17 03:43:46', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('62', '87', 'Valeria	', 'S/D', 'Garcia', 'Giraldo', '2009-05-28', '3', '1040181790', '2', '11', '0', null, '1', '2023-11-17 03:43:48', '2023-11-17 03:43:48', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('63', '88', 'Marleny', 'S/D', 'Cardona ', 'Mesa', '1970-12-22', '1', '39200378', '5', '11', '0', null, '1', '2023-11-17 03:58:03', '2023-11-17 03:58:03', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('64', '89', 'Marleny', 'S/D', 'Cardona ', 'Mesa', '1970-12-22', '1', '39200378', '5', '11', '0', null, '1', '2023-11-17 03:58:09', '2023-11-17 03:58:09', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('65', '90', 'Sebastián ', 'S/D', 'Echeverry  ', 'Ramírez ', '1999-11-12', '1', '1001723992', '6', '11', '0', '1160000.00', '1', '2023-11-17 04:14:28', '2023-11-17 04:14:28', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('66', '90', 'Yenny ', 'Alejandra ', 'Álvarez ', 'Villa ', '1998-08-25', '1', '1040184159', '6', '11', '0', '0.00', '1', '2023-11-17 04:14:30', '2023-11-17 04:14:30', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('67', '91', 'Jacob ', 'S/D', 'Monroy ', 'Suarez', '2006-12-25', '3', '1013341808', '2', '11', '0', null, '1', '2023-11-17 13:41:56', '2023-11-17 13:41:56', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('68', '91', 'Jackeline								', 'S/D', 'Arcila', 'Cataño ', '1999-03-15', '1', '1040384477', '1', '11', '0', '2000000.00', '1', '2023-11-17 13:41:58', '2023-11-17 13:41:58', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('69', '92', 'Jacob ', 'S/D', 'Monroy ', 'Suarez', '2006-12-25', '3', '1013341808', '2', '11', '0', null, '1', '2023-11-17 13:42:04', '2023-11-17 13:42:04', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('70', '92', 'Jackeline								', 'S/D', 'Arcila', 'Cataño ', '1999-03-15', '1', '1040384477', '1', '11', '0', '2000000.00', '1', '2023-11-17 13:42:07', '2023-11-17 13:42:07', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('71', '93', 'Jacob ', 'S/D', 'Monroy ', 'Suarez', '2006-12-25', '3', '1013341808', '2', '11', '0', null, '1', '2023-11-17 13:42:13', '2023-11-17 13:42:13', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('72', '93', 'Jackeline								', 'S/D', 'Arcila', 'Cataño ', '1999-03-15', '1', '1040384477', '1', '11', '0', '2000000.00', '1', '2023-11-17 13:42:15', '2023-11-17 13:42:15', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('73', '95', 'Elena 							', 'Patricia ', 'Betancur ', 'S/D', '1979-03-05', '1', '21981159', '1', '12', '0', '1020000.00', '1', '2023-11-17 14:01:17', '2023-11-17 14:01:17', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('74', '98', 'María ', 'Clara ', 'Carmona ', 'García ', '2011-11-20', '3', '1023642616', '2', '11', '1', null, '1', '2023-11-17 14:47:43', '2023-11-17 14:47:43', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('75', '98', 'María ', 'José ', 'Carmona ', 'García ', '2019-04-01', '4', '1039739719', '2', '11', '1', null, '1', '2023-11-17 14:47:47', '2023-11-17 14:47:47', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('76', '99', 'Yederson  ', 'Estiven ', 'Botero ', 'García  ', '1904-01-17', '1', '1040870140', '2', '11', '2', null, '1', '2023-11-17 15:08:40', '2023-11-17 15:08:40', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('77', '99', 'Yederson  ', 'Estiven ', 'Botero ', 'García  ', '1904-01-17', '1', '1040870140', '2', '11', '2', null, '1', '2023-11-17 15:08:42', '2023-11-17 15:08:42', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('78', '99', 'Yederson  ', 'Estiven ', 'Botero ', 'García  ', '1904-01-17', '1', '1040870140', '2', '11', '2', null, '1', '2023-11-17 15:08:44', '2023-11-17 15:08:44', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('79', '99', 'Jerónimo ', 'S/D', 'Botero ', 'García  ', '1910-09-12', '3', '1040878462', '2', '11', '2', null, '1', '2023-11-17 15:08:46', '2023-11-17 15:08:46', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('80', '100', 'Yederson  ', 'Estiven ', 'Botero ', 'García  ', '1904-01-17', '1', '1040870140', '2', '11', '2', null, '1', '2023-11-17 15:08:53', '2023-11-17 15:08:53', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('81', '100', 'Yederson  ', 'Estiven ', 'Botero ', 'García  ', '1904-01-17', '1', '1040870140', '2', '11', '2', null, '1', '2023-11-17 15:08:55', '2023-11-17 15:08:55', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('82', '100', 'Yederson  ', 'Estiven ', 'Botero ', 'García  ', '1904-01-17', '1', '1040870140', '2', '11', '2', null, '1', '2023-11-17 15:08:57', '2023-11-17 15:08:57', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('83', '100', 'Jerónimo ', 'S/D', 'Botero ', 'García  ', '1910-09-12', '3', '1040878462', '2', '11', '2', null, '1', '2023-11-17 15:08:59', '2023-11-17 15:08:59', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('84', '101', 'Juan ', 'Gabriel ', 'Suaza ', 'Vallejo ', '2005-01-23', '3', '1040871837', '2', '11', '2', null, '1', '2023-11-17 15:44:29', '2023-11-17 15:44:29', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('85', '102', 'Lilia', 'de Jesús ', 'Olguín ', 'Bedoya ', '1965-01-25', '1', '43488000', '1', '11', '1', null, '1', '2023-11-17 16:03:08', '2023-11-17 16:03:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('86', '104', 'María ', 'Amanda ', 'Molina ', 'De Correa ', '1947-06-16', '1', '32452619', '5', '11', '1', null, '1', '2023-11-17 16:37:31', '2023-11-17 16:37:31', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('87', '105', 'Tatiana ', 'Andrea ', 'Tabares ', 'Castro ', '2000-09-07', '1', '1.007291864', '1', '11', '1', null, '1', '2023-11-17 16:56:13', '2023-11-17 16:56:13', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('88', '107', 'Ismael ', 'S/D', 'Otalvaro ', 'Rodríguez ', '1918-07-27', '1', '1040051962', '2', '11', '2', null, '1', '2023-11-17 17:21:18', '2023-11-17 17:21:18', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('89', '108', 'Ismael ', 'S/D', 'Otalvaro ', 'Rodríguez ', '1918-07-27', '1', '1040051962', '2', '11', '2', null, '1', '2023-11-17 17:21:24', '2023-11-17 17:21:24', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('90', '110', 'Diego ', 'León ', 'Tobón ', 'bedoya ', '1985-06-15', '1', '15.389108', '1', '11', '2', null, '1', '2023-11-17 18:05:08', '2023-11-17 18:05:08', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('91', '111', 'Diego ', 'León ', 'Tobón ', 'bedoya ', '1985-06-15', '1', '15.389108', '1', '11', '2', null, '1', '2023-11-17 18:05:14', '2023-11-17 18:05:14', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('92', '112', 'Richar ', 'Julián ', 'Franco ', 'Ospina ', '1985-12-02', '1', '1040030301', '2', '11', '2', '908526.00', '1', '2023-11-17 18:21:09', '2023-11-17 18:21:09', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('93', '113', 'Ana  ', 'Duque ', 'Henao ', '3108226897				3108226897				Duque ', '1991-09-11', '1', '1040039071', '1', '11', '1', '1658581.00', '1', '2023-11-17 18:39:07', '2023-11-17 18:39:07', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('94', '113', 'Salome ', 'Betancur ', 'Betancur ', 'Henao 			3108226897				Duque ', '2013-01-26', '3', '1039310936', '2', '11', '1', '0.00', '1', '2023-11-17 18:39:10', '2023-11-17 18:39:10', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('95', '114', 'Ana  ', 'Duque ', 'Henao ', '3108226897				3108226897				Duque ', '1991-09-11', '1', '1040039071', '1', '11', '1', '1658581.00', '1', '2023-11-17 18:39:16', '2023-11-17 18:39:16', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('96', '114', 'Salome ', 'Betancur ', 'Betancur ', 'Henao 			3108226897				Duque ', '2013-01-26', '3', '1039310936', '2', '11', '1', '0.00', '1', '2023-11-17 18:39:18', '2023-11-17 18:39:18', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('97', '116', 'Nicolás ', 'S/D', 'Londoño ', 'Cárdenas  			3108226897				Duque ', '2005-12-30', '3', '1.040033380', '2', '11', '2', null, '1', '2023-11-17 20:45:57', '2023-11-17 20:45:57', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar` VALUES ('98', '117', 'Nicolás ', 'S/D', 'Londoño ', 'Cárdenas  			3108226897				Duque ', '2005-12-30', '3', '1.040033380', '2', '11', '2', null, '1', '2023-11-17 20:46:03', '2023-11-17 20:46:03', 'Yeraldine.Osorio', 'Yeraldine.Osorio');

-- ----------------------------
-- Table structure for `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial`
-- ----------------------------
DROP TABLE IF EXISTS `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial`;
CREATE TABLE `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Id_beneficiario_postulado` int DEFAULT NULL,
  `Id_Grupo_Familiar` int DEFAULT NULL,
  `Id_tipo_enfoque_diferencial` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Id_Postulado_idx` (`Id_beneficiario_postulado`),
  KEY `FK_Id_Enfoque_Diferencia_idx` (`Id_tipo_enfoque_diferencial`),
  CONSTRAINT `FK_Id_Enfoque_Diferencia` FOREIGN KEY (`Id_tipo_enfoque_diferencial`) REFERENCES `beneficiario_cfg_tipo_enfoque_diferencial` (`Id`),
  CONSTRAINT `FK_Id_GrupoFamiliar` FOREIGN KEY (`Id_tipo_enfoque_diferencial`) REFERENCES `beneficiario_datos_postulados_grupo_familiar` (`Id`),
  CONSTRAINT `FK_Id_Postulado` FOREIGN KEY (`Id_beneficiario_postulado`) REFERENCES `beneficiario_datos_postulados` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial
-- ----------------------------
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('2', '37', '2', '2', '1', '2023-11-15 20:00:38', '2023-11-15 20:00:38', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('3', '37', '3', '2', '1', '2023-11-15 20:00:42', '2023-11-15 20:00:42', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('4', '38', '5', '2', '1', '2023-11-15 20:08:45', '2023-11-15 20:08:45', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('5', '38', '6', '2', '1', '2023-11-15 20:08:50', '2023-11-15 20:08:50', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('6', '38', '7', '2', '1', '2023-11-15 20:08:54', '2023-11-15 20:08:54', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('7', '38', '7', '4', '1', '2023-11-15 20:08:56', '2023-11-15 20:08:56', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('8', '40', '8', '2', '1', '2023-11-15 20:19:51', '2023-11-15 20:19:51', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('9', '43', '9', '4', '1', '2023-11-15 20:36:07', '2023-11-15 20:36:07', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('10', '45', '10', '2', '1', '2023-11-15 20:45:29', '2023-11-15 20:45:29', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('11', '47', '11', '5', '1', '2023-11-15 20:58:47', '2023-11-15 20:58:47', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('12', '58', '23', '3', '1', '2023-11-15 22:47:42', '2023-11-15 22:47:42', 'Fabio.Gaviria', 'Fabio.Gaviria');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('13', '62', '24', '5', '1', '2023-11-16 20:46:19', '2023-11-16 20:46:19', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('14', '63', '26', '5', '1', '2023-11-16 20:46:29', '2023-11-16 20:46:29', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('15', '64', '28', '5', '1', '2023-11-16 21:03:06', '2023-11-16 21:03:06', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('16', '65', '29', '5', '1', '2023-11-16 21:03:14', '2023-11-16 21:03:14', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('17', '71', '38', '2', '1', '2023-11-16 22:51:47', '2023-11-16 22:51:47', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('18', '82', '58', '2', '1', '2023-11-17 02:38:17', '2023-11-17 02:38:17', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('19', '98', '74', '5', '1', '2023-11-17 14:47:45', '2023-11-17 14:47:45', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('20', '101', '84', '2', '1', '2023-11-17 15:44:31', '2023-11-17 15:44:31', 'Yeraldine.Osorio', 'Yeraldine.Osorio');
INSERT INTO `beneficiario_datos_postulados_grupo_familiar_enfoque_diferencial` VALUES ('21', '112', '92', '5', '1', '2023-11-17 18:21:11', '2023-11-17 18:21:11', 'Yeraldine.Osorio', 'Yeraldine.Osorio');

-- ----------------------------
-- Table structure for `cfg_areas_depto`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_areas_depto`;
CREATE TABLE `cfg_areas_depto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of cfg_areas_depto
-- ----------------------------
INSERT INTO `cfg_areas_depto` VALUES ('1', 'GERENCIA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('2', 'CONTROL INTERNO DISCIPLINARIO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('3', 'CONTROL INTERNO  ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('4', 'DIRECCIÓN JURÍDICA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('5', 'DIRECCIÓN DE PLANEACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('6', 'DIRECCIÓN DE PROYECTOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('7', 'DIRECCIÓN DE VIVIENDA Y HÁBITAT', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('8', 'JEFATURA DE NEGOCIOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('9', 'JEFATURA DE TALENTO HUMANO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('10', 'JEFATURA DE COMUNICACIONES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('11', 'JEFATURA DE TITULACIÓN Y ESCRITURACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('12', 'SUBGERENCIA DE OPERACIONES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_depto` VALUES ('13', 'DIRECCIÓN ADMINISTRATIVA Y FINANCIERA', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_areas_proceso`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_areas_proceso`;
CREATE TABLE `cfg_areas_proceso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of cfg_areas_proceso
-- ----------------------------
INSERT INTO `cfg_areas_proceso` VALUES ('1', 'CONTROL INTERNO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('2', 'CONTROL INTERNO DISCIPLINARIO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('3', 'COMUNICACIONES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('4', 'TALENTO HUMANO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('5', 'TI', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('6', 'BVM', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('7', 'COORDINACIÓN JURÍDICA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('8', 'TITULACIÓN Y ESCRITURACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('9', 'CONTABILIDAD ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('10', 'TESORERIA Y FINANCIERA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('11', 'CAD', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('12', 'BIENES Y SERVICIOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('13', 'FONDO ROTATORIO DE CRÉDITO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('14', 'PLANEACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('15', 'GESTIÓN SOCIOCULTURAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('16', 'ANTIOQUIA SE PINTA DE VIDA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('17', 'REGALIAS ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('18', 'MANDATOS ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('19', 'VIVALAB', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('20', 'MEJORAMIENTO DE VIVIENDA ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('21', 'MEJORAMIENTO DE VIVIENDA RURAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('22', 'MEJORAMIENTO DE VIVIENDA URBANA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('23', 'ESPACIO PÚBLICO EFECTIVO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('24', 'INTERVENCIONES URBANAS INTEGRALES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('25', 'VIVIENDA NUEVA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('26', 'VIVIENDA NUEVA URBANA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('27', 'VIVIENDA NUEVA RURAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('28', 'PROYECTOS ESPECIALES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('29', 'FORMULACIÓN Y ESTRUCTURACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_areas_proceso` VALUES ('30', 'MGO', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_departamentos`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_departamentos`;
CREATE TABLE `cfg_departamentos` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` int NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of cfg_departamentos
-- ----------------------------
INSERT INTO `cfg_departamentos` VALUES ('1', 'Antioquia', '5');
INSERT INTO `cfg_departamentos` VALUES ('2', 'Atlantico', '8');
INSERT INTO `cfg_departamentos` VALUES ('3', 'D. C. Santa Fe de Bogotá', '11');
INSERT INTO `cfg_departamentos` VALUES ('4', 'Bolivar', '13');
INSERT INTO `cfg_departamentos` VALUES ('5', 'Boyaca', '15');
INSERT INTO `cfg_departamentos` VALUES ('6', 'Caldas', '17');
INSERT INTO `cfg_departamentos` VALUES ('7', 'Caqueta', '18');
INSERT INTO `cfg_departamentos` VALUES ('8', 'Cauca', '19');
INSERT INTO `cfg_departamentos` VALUES ('9', 'Cesar', '20');
INSERT INTO `cfg_departamentos` VALUES ('10', 'Cordova', '23');
INSERT INTO `cfg_departamentos` VALUES ('11', 'Cundinamarca', '25');
INSERT INTO `cfg_departamentos` VALUES ('12', 'Choco', '27');
INSERT INTO `cfg_departamentos` VALUES ('13', 'Huila', '41');
INSERT INTO `cfg_departamentos` VALUES ('14', 'La Guajira', '44');
INSERT INTO `cfg_departamentos` VALUES ('15', 'Magdalena', '47');
INSERT INTO `cfg_departamentos` VALUES ('16', 'Meta', '50');
INSERT INTO `cfg_departamentos` VALUES ('17', 'Nariño', '52');
INSERT INTO `cfg_departamentos` VALUES ('18', 'Norte de Santander', '54');
INSERT INTO `cfg_departamentos` VALUES ('19', 'Quindio', '63');
INSERT INTO `cfg_departamentos` VALUES ('20', 'Risaralda', '66');
INSERT INTO `cfg_departamentos` VALUES ('21', 'Santander', '68');
INSERT INTO `cfg_departamentos` VALUES ('22', 'Sucre', '70');
INSERT INTO `cfg_departamentos` VALUES ('23', 'Tolima', '73');
INSERT INTO `cfg_departamentos` VALUES ('24', 'Valle', '76');
INSERT INTO `cfg_departamentos` VALUES ('25', 'Arauca', '81');
INSERT INTO `cfg_departamentos` VALUES ('26', 'Casanare', '85');
INSERT INTO `cfg_departamentos` VALUES ('27', 'Putumayo', '86');
INSERT INTO `cfg_departamentos` VALUES ('28', 'San Andres', '88');
INSERT INTO `cfg_departamentos` VALUES ('29', 'Amazonas', '91');
INSERT INTO `cfg_departamentos` VALUES ('30', 'Guainia', '94');
INSERT INTO `cfg_departamentos` VALUES ('31', 'Guaviare', '95');
INSERT INTO `cfg_departamentos` VALUES ('32', 'Vaupes', '97');
INSERT INTO `cfg_departamentos` VALUES ('33', 'Vichada', '99');

-- ----------------------------
-- Table structure for `cfg_estados_cotizacion`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_estados_cotizacion`;
CREATE TABLE `cfg_estados_cotizacion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Descripcion` text COLLATE utf32_spanish2_ci,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of cfg_estados_cotizacion
-- ----------------------------
INSERT INTO `cfg_estados_cotizacion` VALUES ('1', 'Generada', 'Se generó exitosamente la cotización', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_estados_cotizacion` VALUES ('2', 'Vinculada', 'la cotización esta vinculada a una orden de pedido', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_estados_cotizacion` VALUES ('3', 'En Factura', 'La orden de pedido a la que esta vinculada la cotización fue vinculada a una factura activa', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_estados_cotizacion` VALUES ('4', 'Pagada', 'La factura a la que se vinculo la orden de pedido que a su vez tiene vinculada una cotización fue pagada', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_estados_cotizacion` VALUES ('5', 'Anulada', 'La cotización fue anulada y procede, por ende debe ser ignorada', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_estado_orden_pedido`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_estado_orden_pedido`;
CREATE TABLE `cfg_estado_orden_pedido` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of cfg_estado_orden_pedido
-- ----------------------------
INSERT INTO `cfg_estado_orden_pedido` VALUES ('1', 'Pendientes', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_estado_orden_pedido` VALUES ('2', 'Pagadas', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_estado_orden_pedido` VALUES ('3', 'Canceladas', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_genero`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_genero`;
CREATE TABLE `cfg_genero` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Siglas` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of cfg_genero
-- ----------------------------
INSERT INTO `cfg_genero` VALUES ('1', 'Femenino', 'F', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_genero` VALUES ('2', 'Masculino', 'M', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_municipios`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_municipios`;
CREATE TABLE `cfg_municipios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `departamento_id` int NOT NULL,
  `codigo` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `ValleAburra` varchar(255) DEFAULT NULL,
  `Zona` varchar(255) DEFAULT NULL,
  `Distancia` float(10,2) DEFAULT NULL,
  `IdayVuelta` float(10,2) DEFAULT NULL,
  `Contrato` varchar(255) DEFAULT NULL,
  `Costo` float(10,2) DEFAULT NULL,
  `RetFuente` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamento_id` (`departamento_id`),
  KEY `id` (`id`),
  CONSTRAINT `cfg_municipios_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `cfg_departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1129 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of cfg_municipios
-- ----------------------------
INSERT INTO `cfg_municipios` VALUES ('1', '1', '1', 'MEDELLIN', 'AMVA', 'AMVA', '1.00', '2.00', 'Zona_1', null, '11.00');
INSERT INTO `cfg_municipios` VALUES ('2', '1', '2', 'ABEJORRAL', 'FUERA', 'Oriente', '86.00', '172.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('3', '1', '4', 'ABRIAQUI', 'FUERA', 'Norte', '136.00', '273.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('4', '1', '21', 'ALEJANDRIA', 'FUERA', 'Norte', '79.00', '159.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('5', '1', '30', 'AMAGA', 'FUERA', 'Suroeste', '38.00', '76.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('6', '1', '31', 'AMALFI', 'FUERA', 'Norte', '148.00', '296.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('7', '1', '34', 'ANDES', 'FUERA', 'Suroeste', '116.00', '232.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('8', '1', '36', 'ANGELOPOLIS', 'FUERA', 'Suroeste', '38.00', '77.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('9', '1', '38', 'ANGOSTURA', 'FUERA', 'Norte', '122.00', '244.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('10', '1', '40', 'ANORI', 'FUERA', 'Norte', '174.00', '348.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('11', '1', '42', 'ANTIOQUIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('12', '1', '44', 'ANZA', 'FUERA', 'Occidente', '80.00', '161.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('13', '1', '45', 'APARTADO', 'FUERA', 'Urabá', '311.00', '623.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('14', '1', '51', 'ARBOLETES', 'FUERA', 'Urabá', '460.00', '920.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('15', '1', '55', 'ARGELIA', 'FUERA', 'Norte', '148.00', '296.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('16', '1', '59', 'ARMENIA', 'FUERA', 'Suroeste', '50.00', '101.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('17', '1', '79', 'BARBOSA', 'FUERA', 'Norte', '42.00', '85.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('18', '1', '86', 'BELMIRA', 'FUERA', 'Norte', '59.00', '119.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('19', '1', '88', 'BELLO', 'AMVA', 'AMVA', '13.00', '26.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('20', '1', '91', 'BETANIA', 'FUERA', 'Norte', '115.00', '230.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('21', '1', '93', 'BETULIA', 'FUERA', 'Norte', '138.00', '276.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('22', '1', '101', 'BOLIVAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('23', '1', '107', 'BRICEÑO', 'FUERA', 'Norte', '177.00', '354.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('24', '1', '113', 'BURITICA', 'FUERA', 'Norte', '92.00', '184.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('25', '1', '120', 'CACERES', 'FUERA', 'Magdalena Medio', '231.00', '462.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('26', '1', '125', 'CAICEDO', 'FUERA', 'Occidente', '96.00', '192.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('27', '1', '129', 'CALDAS', 'FUERA', 'SUR VDA', '23.00', '46.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('28', '1', '134', 'CAMPAMENTO', 'FUERA', 'Norte', '141.00', '283.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('29', '1', '138', 'CAÑASGORDAS', 'FUERA', 'Norte', '113.00', '227.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('30', '1', '142', 'CARACOLI', 'FUERA', 'Suroeste', '129.00', '258.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('31', '1', '145', 'CARAMANTA', 'FUERA', 'Suroeste', '146.00', '292.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('32', '1', '147', 'CAREPA', 'FUERA', 'Urabá', '294.00', '588.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('33', '1', '148', 'CARMEN DE VIBORAL', 'FUERA', 'Oriente', '44.00', '89.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('34', '1', '150', 'CAROLINA', 'FUERA', 'Suroeste', '97.00', '195.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('35', '1', '154', 'CAUCASIA', 'FUERA', 'Bajo Cauca', '285.00', '570.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('36', '1', '172', 'CHIGORODO', 'FUERA', 'Urabá', '282.00', '565.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('37', '1', '190', 'CISNEROS', 'FUERA', 'Norte', '77.00', '155.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('38', '1', '197', 'COCORNA', 'FUERA', 'Oriente', '81.00', '162.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('39', '1', '206', 'CONCEPCION', 'FUERA', 'Suroeste', '62.00', '125.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('40', '1', '209', 'CONCORDIA', 'FUERA', 'Suroeste', '92.00', '185.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('41', '1', '212', 'COPACABANA', 'AMVA', 'AMVA', '20.00', '40.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('42', '1', '234', 'DABEIBA', 'FUERA', 'Occidente', '174.00', '348.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('43', '1', '237', 'DONMATIAS', null, null, null, null, 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('44', '1', '240', 'EBEJICO', 'FUERA', 'Occidente', '43.00', '87.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('45', '1', '250', 'EL BAGRE', 'FUERA', 'Magdalena Medio', '281.00', '563.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('46', '1', '264', 'ENTRERRIOS', 'FUERA', 'Norte', '56.00', '113.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('47', '1', '266', 'ENVIGADO', 'AMVA', 'AMVA', '11.00', '23.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('48', '1', '282', 'FREDONIA', 'FUERA', 'Suroeste', '55.00', '110.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('49', '1', '284', 'FRONTINO', 'FUERA', 'Occidente', '136.00', '273.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('50', '1', '306', 'GIRALDO', 'FUERA', 'Norte', '96.00', '193.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('51', '1', '308', 'GIRARDOTA', 'FUERA', 'FUERA', '27.00', '54.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('52', '1', '310', 'GOMEZ PLATA', 'FUERA', 'Norte', '84.00', '168.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('53', '1', '313', 'GRANADA', 'FUERA', 'Suroeste', '73.00', '146.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('54', '1', '315', 'GUADALUPE', 'FUERA', 'Norte', '117.00', '235.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('55', '1', '318', 'GUARNE', 'FUERA', 'Oriente', '33.00', '67.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('56', '1', '321', 'GUATAPE', 'FUERA', 'Oriente', '81.00', '162.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('57', '1', '347', 'HELICONIA', 'FUERA', 'Occidente', '41.00', '82.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('58', '1', '353', 'HISPANIA', 'FUERA', 'Suroeste', '96.00', '193.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('59', '1', '360', 'ITAGUI', 'AMVA', 'AMVA', '14.00', '28.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('60', '1', '361', 'ITUANGO', 'FUERA', 'NORTE', '209.00', '418.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('61', '1', '364', 'JARDIN', 'FUERA', 'Suroeste', '130.00', '261.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('62', '1', '368', 'JERICO', 'FUERA', 'Suroeste', '108.00', '216.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('63', '1', '376', 'LA CEJA', 'FUERA', 'Oriente', '42.00', '85.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('64', '1', '380', 'LA ESTRELLA', 'AMVA', 'AMVA', '15.00', '30.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('65', '1', '390', 'LA PINTADA', 'FUERA', 'Suroeste', '112.00', '225.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('66', '1', '400', 'LA UNION', 'FUERA', 'Oriente', '61.00', '123.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('67', '1', '411', 'LIBORINA', 'FUERA', 'Norte', '80.00', '160.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('68', '1', '425', 'MACEO', 'FUERA', 'Norte', '122.00', '245.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('69', '1', '440', 'MARINILLA', 'FUERA', 'Oriente', '48.00', '96.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('70', '1', '467', 'MONTEBELLO', 'FUERA', 'Suroeste', '55.00', '111.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('71', '1', '475', 'MURINDO', 'FUERA', 'Urabá', '1000.00', '2000.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('72', '1', '480', 'MUTATA', 'FUERA', 'Occidente', '225.00', '451.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('73', '1', '483', 'NARIÑO', 'FUERA', 'Norte', '149.00', '298.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('74', '1', '490', 'NECOCLI', 'FUERA', 'Urabá', '383.00', '767.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('75', '1', '495', 'NECHI', 'FUERA', 'Urabá', '357.00', '715.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('76', '1', '501', 'OLAYA', 'FUERA', 'Norte', '72.00', '145.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('77', '1', '541', 'PEÑOL', 'FUERA', 'Oriente', '67.00', '134.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('78', '1', '543', 'PEQUE', 'FUERA', 'Occidente', '200.00', '400.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('79', '1', '576', 'PUEBLORRICO', 'FUERA', 'Suroeste', '111.00', '222.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('80', '1', '579', 'PUERTO BERRIO', 'FUERA', 'Magdalena Medio', '172.00', '344.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('81', '1', '585', 'PUERTO NARE', null, null, null, null, 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('82', '1', '591', 'PUERTO TRIUNFO', 'FUERA', 'Magdalena Medio', '186.00', '372.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('83', '1', '604', 'REMEDIOS', 'FUERA', 'Norte', '185.00', '370.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('84', '1', '607', 'RETIRO', 'FUERA', 'Oriente', '32.00', '64.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('85', '1', '615', 'RIONEGRO', 'FUERA', 'Oriente', '33.00', '67.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('86', '1', '628', 'SABANALARGA', 'FUERA', 'Norte', '116.00', '232.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('87', '1', '631', 'SABANETA', 'AMVA', 'AMVA', '14.00', '29.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('88', '1', '642', 'SALGAR', 'FUERA', 'Suroeste', '93.00', '187.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('89', '1', '647', 'SAN ANDRES', 'FUERA', 'Occidente', '137.00', '274.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('90', '1', '649', 'SAN CARLOS', 'FUERA', 'Norte', '113.00', '227.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('91', '1', '652', 'SAN FRANCISCO', 'FUERA', 'Suroeste', '101.00', '203.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('92', '1', '656', 'SAN JERONIMO', 'FUERA', 'Occidente', '38.00', '76.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('93', '1', '658', 'SAN JOSE DE LA MONTAÑA', 'FUERA', 'nordeste', '500.00', '1000.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('94', '1', '659', 'SAN JUAN DE URABA', 'FUERA', 'Urabá', '443.00', '886.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('95', '1', '660', 'SAN LUIS', 'FUERA', 'Suroeste', '132.00', '265.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('96', '1', '664', 'SAN PEDRO DE  LOS MILAGROS', null, null, null, null, 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('97', '1', '665', 'SAN PEDRO DE URABA', 'FUERA', 'Urabá', '386.00', '773.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('98', '1', '667', 'SAN RAFAEL', 'FUERA', 'Oriente', '108.00', '217.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('99', '1', '670', 'SAN ROQUE', 'FUERA', 'Norte', '96.00', '192.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('100', '1', '674', 'SAN VICENTE FERRER', null, null, null, null, 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('101', '1', '679', 'SANTA BARBARA', 'FUERA', 'Norte', '53.00', '106.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('102', '1', '686', 'SANTA ROSA DE OSOS', 'FUERA', 'Norte', '77.00', '154.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('103', '1', '690', 'SANTO DOMINGO', 'FUERA', 'Norte', '70.00', '140.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('104', '1', '697', 'SANTUARIO', 'FUERA', 'Oriente', '59.00', '119.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('105', '1', '736', 'SEGOVIA', 'FUERA', 'Magdalena Medio', '194.00', '389.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('106', '1', '756', 'SONSON', 'FUERA', 'Oriente', '115.00', '230.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('107', '1', '761', 'SOPETRAN', 'FUERA', 'Occidente', '49.00', '99.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('108', '1', '789', 'TAMESIS', 'FUERA', 'Suroeste', '138.00', '277.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('109', '1', '790', 'TARAZA', 'FUERA', 'Magdalena Medio', '223.00', '446.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('110', '1', '792', 'TARSO', 'FUERA', 'Suroeste', '97.00', '194.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('111', '1', '809', 'TITIRIBI', 'FUERA', 'Suroeste', '56.00', '113.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('112', '1', '819', 'TOLEDO', 'FUERA', 'Norte', '173.00', '347.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('113', '1', '837', 'TURBO', 'FUERA', 'Urabá', '344.00', '688.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('114', '1', '842', 'URAMITA', 'FUERA', 'Norte', '140.00', '280.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('115', '1', '847', 'URRAO', 'FUERA', 'Suroeste', '129.00', '259.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('116', '1', '854', 'VALDIVIA', 'FUERA', 'Norte', '160.00', '321.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('117', '1', '856', 'VALPARAISO', 'FUERA', 'Suroeste', '129.00', '259.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('118', '1', '858', 'VEGACHI', 'FUERA', 'Norte', '143.00', '286.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('119', '1', '861', 'VENECIA', 'FUERA', 'Suroeste', '58.00', '117.00', 'Zona_1', null, null);
INSERT INTO `cfg_municipios` VALUES ('120', '1', '873', 'VIGIA DEL FUERTE', 'FUERA', 'Occidente', '500.00', '1000.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('121', '1', '885', 'YALI', 'FUERA', 'Norte', '125.00', '250.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('122', '1', '887', 'YARUMAL', 'FUERA', 'Norte', '122.00', '244.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('123', '1', '890', 'YOLOMBO', 'FUERA', 'nordeste', '500.00', '1000.00', 'Zona_2', null, null);
INSERT INTO `cfg_municipios` VALUES ('124', '1', '893', 'YONDO', 'FUERA', 'magdalena medio', '500.00', '1000.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('125', '1', '895', 'ZARAGOZA', 'FUERA', 'Magdalena Medio', '249.00', '499.00', 'Zona_3', null, null);
INSERT INTO `cfg_municipios` VALUES ('126', '2', '1', 'BARRANQUILLA (DISTRITO ESPECIAL INDUSTRIAL Y PORTUARIO DE BARRANQUILLA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('127', '2', '78', 'BARANOA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('128', '2', '137', 'CAMPO DE LA CRUZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('129', '2', '141', 'CANDELARIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('130', '2', '296', 'GALAPA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('131', '2', '372', 'JUAN DE ACOSTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('132', '2', '421', 'LURUACO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('133', '2', '433', 'MALAMBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('134', '2', '436', 'MANATI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('135', '2', '520', 'PALMAR DE VARELA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('136', '2', '549', 'PIOJO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('137', '2', '558', 'POLO NUEVO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('138', '2', '560', 'PONEDERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('139', '2', '573', 'PUERTO COLOMBIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('140', '2', '606', 'REPELON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('141', '2', '634', 'SABANAGRANDE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('142', '2', '638', 'SABANALARGA', 'FUERA', 'Norte', '116.00', '232.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('143', '2', '675', 'SANTA LUCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('144', '2', '685', 'SANTO TOMAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('145', '2', '758', 'SOLEDAD', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('146', '2', '770', 'SUAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('147', '2', '832', 'TUBARA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('148', '2', '849', 'USIACURI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('149', '3', '1', 'Santa Fe de Bogotá', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('150', '3', '1', 'USAQUEN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('151', '3', '2', 'CHAPINERO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('152', '3', '3', 'SANTA FE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('153', '3', '4', 'SAN CRISTOBAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('154', '3', '5', 'USME', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('155', '3', '6', 'TUNJUELITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('156', '3', '7', 'BOSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('157', '3', '8', 'KENNEDY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('158', '3', '9', 'FONTIBON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('159', '3', '10', 'ENGATIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('160', '3', '11', 'SUBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('161', '3', '12', 'BARRIOS UNIDOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('162', '3', '13', 'TEUSAQUILLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('163', '3', '14', 'MARTIRES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('164', '3', '15', 'ANTONIO NARIÑO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('165', '3', '16', 'PUENTE ARANDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('166', '3', '17', 'CANDELARIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('167', '3', '18', 'RAFAEL URIBE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('168', '3', '19', 'CIUDAD BOLIVAR', 'FUERA', 'Suroeste', '104.00', '209.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('169', '3', '20', 'SUMAPAZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('170', '4', '1', 'CARTAGENA (DISTRITO TURISTICO Y CULTURAL DE CARTAGENA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('171', '4', '6', 'ACHI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('172', '4', '30', 'ALTOS DEL ROSARIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('173', '4', '42', 'ARENAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('174', '4', '52', 'ARJONA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('175', '4', '62', 'ARROYOHONDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('176', '4', '74', 'BARRANCO DE LOBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('177', '4', '140', 'CALAMAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('178', '4', '160', 'CANTAGALLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('179', '4', '188', 'CICUCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('180', '4', '212', 'CORDOBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('181', '4', '222', 'CLEMENCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('182', '4', '244', 'EL CARMEN DE BOLIVAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('183', '4', '248', 'EL GUAMO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('184', '4', '268', 'EL PEÑON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('185', '4', '300', 'HATILLO DE LOBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('186', '4', '430', 'MAGANGUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('187', '4', '433', 'MAHATES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('188', '4', '440', 'MARGARITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('189', '4', '442', 'MARIA LA BAJA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('190', '4', '458', 'MONTECRISTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('191', '4', '468', 'MOMPOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('192', '4', '473', 'MORALES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('193', '4', '549', 'PINILLOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('194', '4', '580', 'REGIDOR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('195', '4', '600', 'RIO VIEJO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('196', '4', '620', 'SAN CRISTOBAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('197', '4', '647', 'SAN ESTANISLAO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('198', '4', '650', 'SAN FERNANDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('199', '4', '654', 'SAN JACINTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('200', '4', '655', 'SAN JACINTO DEL CAUCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('201', '4', '657', 'SAN JUAN NEPOMUCENO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('202', '4', '667', 'SAN MARTIN DE LOBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('203', '4', '670', 'SAN PABLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('204', '4', '673', 'SANTA CATALINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('205', '4', '683', 'SANTA ROSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('206', '4', '688', 'SANTA ROSA DEL SUR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('207', '4', '744', 'SIMITI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('208', '4', '760', 'SOPLAVIENTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('209', '4', '780', 'TALAIGUA NUEVO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('210', '4', '810', 'TIQUISIO (PUERTO RICO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('211', '4', '836', 'TURBACO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('212', '4', '838', 'TURBANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('213', '4', '873', 'VILLANUEVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('214', '4', '894', 'ZAMBRANO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('215', '5', '1', 'TUNJA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('216', '5', '22', 'ALMEIDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('217', '5', '47', 'AQUITANIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('218', '5', '51', 'ARCABUCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('219', '5', '87', 'BELEN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('220', '5', '90', 'BERBEO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('221', '5', '92', 'BETEITIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('222', '5', '97', 'BOAVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('223', '5', '104', 'BOYACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('224', '5', '106', 'BRICEÑO', 'FUERA', 'Norte', '177.00', '354.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('225', '5', '109', 'BUENAVISTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('226', '5', '114', 'BUSBANZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('227', '5', '131', 'CALDAS', 'FUERA', 'SUR VDA', '23.00', '46.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('228', '5', '135', 'CAMPOHERMOSO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('229', '5', '162', 'CERINZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('230', '5', '172', 'CHINAVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('231', '5', '176', 'CHIQUINQUIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('232', '5', '180', 'CHISCAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('233', '5', '183', 'CHITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('234', '5', '185', 'CHITARAQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('235', '5', '187', 'CHIVATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('236', '5', '189', 'CIENEGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('237', '5', '204', 'COMBITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('238', '5', '212', 'COPER', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('239', '5', '215', 'CORRALES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('240', '5', '218', 'COVARACHIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('241', '5', '223', 'CUBARA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('242', '5', '224', 'CUCAITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('243', '5', '226', 'CUITIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('244', '5', '232', 'CHIQUIZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('245', '5', '236', 'CHIVOR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('246', '5', '238', 'DUITAMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('247', '5', '244', 'EL COCUY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('248', '5', '248', 'EL ESPINO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('249', '5', '272', 'FIRAVITOBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('250', '5', '276', 'FLORESTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('251', '5', '293', 'GACHANTIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('252', '5', '296', 'GAMEZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('253', '5', '299', 'GARAGOA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('254', '5', '317', 'GUACAMAYAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('255', '5', '322', 'GUATEQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('256', '5', '325', 'GUAYATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('257', '5', '332', 'GUICAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('258', '5', '362', 'IZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('259', '5', '367', 'JENESANO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('260', '5', '368', 'JERICO', 'FUERA', 'Suroeste', '108.00', '216.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('261', '5', '377', 'LABRANZAGRANDE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('262', '5', '380', 'LA CAPILLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('263', '5', '401', 'LA VICTORIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('264', '5', '403', 'LA UVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('265', '5', '407', 'VILLA DE LEIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('266', '5', '425', 'MACANAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('267', '5', '442', 'MARIPI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('268', '5', '455', 'MIRAFLORES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('269', '5', '464', 'MONGUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('270', '5', '466', 'MONGUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('271', '5', '469', 'MONIQUIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('272', '5', '476', 'MOTAVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('273', '5', '480', 'MUZO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('274', '5', '491', 'NOBSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('275', '5', '494', 'NUEVO COLON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('276', '5', '500', 'OICATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('277', '5', '507', 'OTANCHE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('278', '5', '511', 'PACHAVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('279', '5', '514', 'PAEZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('280', '5', '516', 'PAIPA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('281', '5', '518', 'PAJARITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('282', '5', '522', 'PANQUEBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('283', '5', '531', 'PAUNA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('284', '5', '533', 'PAYA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('285', '5', '537', 'PAZ DEL RIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('286', '5', '542', 'PESCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('287', '5', '550', 'PISBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('288', '5', '572', 'PUERTO BOYACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('289', '5', '580', 'QUIPAMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('290', '5', '599', 'RAMIRIQUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('291', '5', '600', 'RAQUIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('292', '5', '621', 'RONDON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('293', '5', '632', 'SABOYA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('294', '5', '638', 'SACHICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('295', '5', '646', 'SAMACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('296', '5', '660', 'SAN EDUARDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('297', '5', '664', 'SAN JOSE DE PARE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('298', '5', '667', 'SAN LUIS DE GACENO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('299', '5', '673', 'SAN MATEO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('300', '5', '676', 'SAN MIGUEL DE SEMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('301', '5', '681', 'SAN PABLO DE BORBUR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('302', '5', '686', 'SANTANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('303', '5', '690', 'SANTA MARIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('304', '5', '693', 'SANTA ROSA DE VITERBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('305', '5', '696', 'SANTA SOFIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('306', '5', '720', 'SATIVANORTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('307', '5', '723', 'SATIVASUR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('308', '5', '740', 'SIACHOQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('309', '5', '753', 'SOATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('310', '5', '755', 'SOCOTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('311', '5', '757', 'SOCHA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('312', '5', '759', 'SOGAMOSO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('313', '5', '761', 'SOMONDOCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('314', '5', '762', 'SORA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('315', '5', '763', 'SOTAQUIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('316', '5', '764', 'SORACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('317', '5', '774', 'SUSACON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('318', '5', '776', 'SUTAMARCHAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('319', '5', '778', 'SUTATENZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('320', '5', '790', 'TASCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('321', '5', '798', 'TENZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('322', '5', '804', 'TIBANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('323', '5', '806', 'TIBASOSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('324', '5', '808', 'TINJACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('325', '5', '810', 'TIPACOQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('326', '5', '814', 'TOCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('327', '5', '816', 'TOGUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('328', '5', '820', 'TOPAGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('329', '5', '822', 'TOTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('330', '5', '832', 'TUNUNGUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('331', '5', '835', 'TURMEQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('332', '5', '837', 'TUTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('333', '5', '839', 'TUTASA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('334', '5', '842', 'UMBITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('335', '5', '861', 'VENTAQUEMADA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('336', '5', '879', 'VIRACACHA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('337', '5', '897', 'ZETAQUIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('338', '6', '1', 'MANIZALES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('339', '6', '13', 'AGUADAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('340', '6', '42', 'ANSERMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('341', '6', '50', 'ARANZAZU', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('342', '6', '88', 'BELALCAZAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('343', '6', '174', 'CHINCHINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('344', '6', '272', 'FILADELFIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('345', '6', '380', 'LA DORADA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('346', '6', '388', 'LA MERCED', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('347', '6', '433', 'MANZANARES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('348', '6', '442', 'MARMATO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('349', '6', '444', 'MARQUETALIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('350', '6', '446', 'MARULANDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('351', '6', '486', 'NEIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('352', '6', '495', 'NORCASIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('353', '6', '513', 'PACORA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('354', '6', '524', 'PALESTINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('355', '6', '541', 'PENSILVANIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('356', '6', '614', 'RIOSUCIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('357', '6', '616', 'RISARALDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('358', '6', '653', 'SALAMINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('359', '6', '662', 'SAMANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('360', '6', '665', 'SAN JOSE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('361', '6', '777', 'SUPIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('362', '6', '867', 'VICTORIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('363', '6', '873', 'VILLAMARIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('364', '6', '877', 'VITERBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('365', '7', '1', 'FLORENCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('366', '7', '29', 'ALBANIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('367', '7', '94', 'BELEN DE LOS ANDAQUIES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('368', '7', '150', 'CARTAGENA DEL CHAIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('369', '7', '205', 'CURILLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('370', '7', '247', 'EL DONCELLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('371', '7', '256', 'EL PAUJIL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('372', '7', '410', 'LA MONTAÑITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('373', '7', '460', 'MILAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('374', '7', '479', 'MORELIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('375', '7', '592', 'PUERTO RICO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('376', '7', '610', 'SAN JOSE DE FRAGUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('377', '7', '753', 'SAN VICENTE DEL CAGUAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('378', '7', '756', 'SOLANO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('379', '7', '785', 'SOLITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('380', '7', '860', 'VALPARAISO', 'FUERA', 'Suroeste', '129.00', '259.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('381', '8', '1', 'POPAYAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('382', '8', '22', 'ALMAGUER', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('383', '8', '50', 'ARGELIA', 'FUERA', 'Norte', '148.00', '296.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('384', '8', '75', 'BALBOA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('385', '8', '100', 'BOLIVAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('386', '8', '110', 'BUENOS AIRES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('387', '8', '130', 'CAJIBIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('388', '8', '137', 'CALDONO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('389', '8', '142', 'CALOTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('390', '8', '212', 'CORINTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('391', '8', '256', 'EL TAMBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('392', '8', '290', 'FLORENCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('393', '8', '318', 'GUAPI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('394', '8', '355', 'INZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('395', '8', '364', 'JAMBALO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('396', '8', '392', 'LA SIERRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('397', '8', '397', 'LA VEGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('398', '8', '418', 'LOPEZ (MICAY)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('399', '8', '450', 'MERCADERES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('400', '8', '455', 'MIRANDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('401', '8', '473', 'MORALES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('402', '8', '513', 'PADILLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('403', '8', '517', 'PAEZ (BELALCAZAR)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('404', '8', '532', 'PATIA (EL BORDO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('405', '8', '533', 'PIAMONTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('406', '8', '548', 'PIENDAMO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('407', '8', '573', 'PUERTO TEJADA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('408', '8', '585', 'PURACE (COCONUCO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('409', '8', '622', 'ROSAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('410', '8', '693', 'SAN SEBASTIAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('411', '8', '698', 'SANTANDER DE QUILICHAO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('412', '8', '701', 'SANTA ROSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('413', '8', '743', 'SILVIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('414', '8', '760', 'SOTARA (PAISPAMBA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('415', '8', '780', 'SUAREZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('416', '8', '807', 'TIMBIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('417', '8', '809', 'TIMBIQUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('418', '8', '821', 'TORIBIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('419', '8', '824', 'TOTORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('420', '8', '845', 'VILLARICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('421', '9', '1', 'VALLEDUPAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('422', '9', '11', 'AGUACHICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('423', '9', '13', 'AGUSTIN CODAZZI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('424', '9', '32', 'ASTREA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('425', '9', '45', 'BECERRIL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('426', '9', '60', 'BOSCONIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('427', '9', '175', 'CHIMICHAGUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('428', '9', '178', 'CHIRIGUANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('429', '9', '228', 'CURUMANI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('430', '9', '238', 'EL COPEY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('431', '9', '250', 'EL PASO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('432', '9', '295', 'GAMARRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('433', '9', '310', 'GONZALEZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('434', '9', '383', 'LA GLORIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('435', '9', '400', 'LA JAGUA IBIRICO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('436', '9', '443', 'MANAURE (BALCON DEL CESAR)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('437', '9', '517', 'PAILITAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('438', '9', '550', 'PELAYA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('439', '9', '570', 'PUEBLO BELLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('440', '9', '614', 'RIO DE ORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('441', '9', '621', 'LA PAZ (ROBLES)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('442', '9', '710', 'SAN ALBERTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('443', '9', '750', 'SAN DIEGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('444', '9', '770', 'SAN MARTIN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('445', '9', '787', 'TAMALAMEQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('446', '10', '1', 'MONTERIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('447', '10', '68', 'AYAPEL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('448', '10', '79', 'BUENAVISTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('449', '10', '90', 'CANALETE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('450', '10', '162', 'CERETE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('451', '10', '168', 'CHIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('452', '10', '182', 'CHINU', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('453', '10', '189', 'CIENAGA DE ORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('454', '10', '300', 'COTORRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('455', '10', '350', 'LA APARTADA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('456', '10', '417', 'LORICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('457', '10', '419', 'LOS CORDOBAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('458', '10', '464', 'MOMIL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('459', '10', '466', 'MONTELIBANO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('460', '10', '500', 'MOÑITOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('461', '10', '555', 'PLANETA RICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('462', '10', '570', 'PUEBLO NUEVO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('463', '10', '574', 'PUERTO ESCONDIDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('464', '10', '580', 'PUERTO LIBERTADOR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('465', '10', '586', 'PURISIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('466', '10', '660', 'SAHAGUN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('467', '10', '670', 'SAN ANDRES SOTAVENTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('468', '10', '672', 'SAN ANTERO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('469', '10', '675', 'SAN BERNARDO DEL VIENTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('470', '10', '678', 'SAN CARLOS', 'FUERA', 'Norte', '113.00', '227.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('471', '10', '686', 'SAN PELAYO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('472', '10', '807', 'TIERRALTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('473', '10', '855', 'VALENCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('474', '11', '1', 'AGUA DE DIOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('475', '11', '19', 'ALBAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('476', '11', '35', 'ANAPOIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('477', '11', '40', 'ANOLAIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('478', '11', '53', 'ARBELAEZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('479', '11', '86', 'BELTRAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('480', '11', '95', 'BITUIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('481', '11', '99', 'BOJACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('482', '11', '120', 'CABRERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('483', '11', '123', 'CACHIPAY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('484', '11', '126', 'CAJICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('485', '11', '148', 'CAPARRAPI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('486', '11', '151', 'CAQUEZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('487', '11', '154', 'CARMEN DE CARUPA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('488', '11', '168', 'CHAGUANI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('489', '11', '175', 'CHIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('490', '11', '178', 'CHIPAQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('491', '11', '181', 'CHOACHI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('492', '11', '183', 'CHOCONTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('493', '11', '200', 'COGUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('494', '11', '214', 'COTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('495', '11', '224', 'CUCUNUBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('496', '11', '245', 'EL COLEGIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('497', '11', '258', 'EL PEÑON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('498', '11', '260', 'EL ROSAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('499', '11', '269', 'FACATATIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('500', '11', '279', 'FOMEQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('501', '11', '281', 'FOSCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('502', '11', '286', 'FUNZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('503', '11', '288', 'FUQUENE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('504', '11', '290', 'FUSAGASUGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('505', '11', '293', 'GACHALA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('506', '11', '295', 'GACHANCIPA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('507', '11', '297', 'GACHETA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('508', '11', '299', 'GAMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('509', '11', '307', 'GIRARDOT', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('510', '11', '312', 'GRANADA', 'FUERA', 'Suroeste', '73.00', '146.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('511', '11', '317', 'GUACHETA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('512', '11', '320', 'GUADUAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('513', '11', '322', 'GUASCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('514', '11', '324', 'GUATAQUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('515', '11', '326', 'GUATAVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('516', '11', '328', 'GUAYABAL DE SIQUIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('517', '11', '335', 'GUAYABETAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('518', '11', '339', 'GUTIERREZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('519', '11', '368', 'JERUSALEN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('520', '11', '372', 'JUNIN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('521', '11', '377', 'LA CALERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('522', '11', '386', 'LA MESA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('523', '11', '394', 'LA PALMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('524', '11', '398', 'LA PEÑA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('525', '11', '402', 'LA VEGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('526', '11', '407', 'LENGUAZAQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('527', '11', '426', 'MACHETA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('528', '11', '430', 'MADRID', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('529', '11', '436', 'MANTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('530', '11', '438', 'MEDINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('531', '11', '473', 'MOSQUERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('532', '11', '483', 'NARIÑO', 'FUERA', 'Norte', '149.00', '298.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('533', '11', '486', 'NEMOCON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('534', '11', '488', 'NILO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('535', '11', '489', 'NIMAIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('536', '11', '491', 'NOCAIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('537', '11', '506', 'VENECIA (OSPINA PEREZ)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('538', '11', '513', 'PACHO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('539', '11', '518', 'PAIME', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('540', '11', '524', 'PANDI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('541', '11', '530', 'PARATEBUENO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('542', '11', '535', 'PASCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('543', '11', '572', 'PUERTO SALGAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('544', '11', '580', 'PULI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('545', '11', '592', 'QUEBRADANEGRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('546', '11', '594', 'QUETAME', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('547', '11', '596', 'QUIPILE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('548', '11', '599', 'APULO (RAFAEL REYES)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('549', '11', '612', 'RICAURTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('550', '11', '645', 'SAN ANTONIO DEL TEQUENDAMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('551', '11', '649', 'SAN BERNARDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('552', '11', '653', 'SAN CAYETANO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('553', '11', '658', 'SAN FRANCISCO', 'FUERA', 'Suroeste', '101.00', '203.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('554', '11', '662', 'SAN JUAN DE RIOSECO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('555', '11', '718', 'SASAIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('556', '11', '736', 'SESQUILE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('557', '11', '740', 'SIBATE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('558', '11', '743', 'SILVANIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('559', '11', '745', 'SIMIJACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('560', '11', '754', 'SOACHA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('561', '11', '758', 'SOPO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('562', '11', '769', 'SUBACHOQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('563', '11', '772', 'SUESCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('564', '11', '777', 'SUPATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('565', '11', '779', 'SUSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('566', '11', '781', 'SUTATAUSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('567', '11', '785', 'TABIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('568', '11', '793', 'TAUSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('569', '11', '797', 'TENA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('570', '11', '799', 'TENJO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('571', '11', '805', 'TIBACUY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('572', '11', '807', 'TIBIRITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('573', '11', '815', 'TOCAIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('574', '11', '817', 'TOCANCIPA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('575', '11', '823', 'TOPAIPI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('576', '11', '839', 'UBALA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('577', '11', '841', 'UBAQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('578', '11', '843', 'UBATE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('579', '11', '845', 'UNE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('580', '11', '851', 'UTICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('581', '11', '862', 'VERGARA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('582', '11', '867', 'VIANI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('583', '11', '871', 'VILLAGOMEZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('584', '11', '873', 'VILLAPINZON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('585', '11', '875', 'VILLETA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('586', '11', '878', 'VIOTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('587', '11', '885', 'YACOPI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('588', '11', '898', 'ZIPACON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('589', '11', '899', 'ZIPAQUIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('590', '12', '1', 'QUIBDO (SAN FRANCISCO DE QUIBDO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('591', '12', '6', 'ACANDI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('592', '12', '25', 'ALTO BAUDO (PIE DE PATO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('593', '12', '50', 'ATRATO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('594', '12', '73', 'BAGADO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('595', '12', '75', 'BAHIA SOLANO (MUTIS)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('596', '12', '77', 'BAJO BAUDO (PIZARRO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('597', '12', '99', 'BOJAYA (BELLAVISTA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('598', '12', '135', 'CANTON DE SAN PABLO (MANAGRU)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('599', '12', '205', 'CONDOTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('600', '12', '245', 'EL CARMEN DE ATRATO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('601', '12', '250', 'LITORAL DEL BAJO SAN JUAN (SANTA GENOVEVA DE DOCORDO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('602', '12', '361', 'ISTMINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('603', '12', '372', 'JURADO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('604', '12', '413', 'LLORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('605', '12', '425', 'MEDIO ATRATO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('606', '12', '430', 'MEDIO BAUDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('607', '12', '491', 'NOVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('608', '12', '495', 'NUQUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('609', '12', '600', 'RIOQUITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('610', '12', '615', 'RIOSUCIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('611', '12', '660', 'SAN JOSE DEL PALMAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('612', '12', '745', 'SIPI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('613', '12', '787', 'TADO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('614', '12', '800', 'UNGUIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('615', '12', '810', 'UNION PANAMERICANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('616', '13', '1', 'NEIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('617', '13', '6', 'ACEVEDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('618', '13', '13', 'AGRADO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('619', '13', '16', 'AIPE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('620', '13', '20', 'ALGECIRAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('621', '13', '26', 'ALTAMIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('622', '13', '78', 'BARAYA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('623', '13', '132', 'CAMPOALEGRE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('624', '13', '206', 'COLOMBIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('625', '13', '244', 'ELIAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('626', '13', '298', 'GARZON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('627', '13', '306', 'GIGANTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('628', '13', '319', 'GUADALUPE', 'FUERA', 'Norte', '117.00', '235.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('629', '13', '349', 'HOBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('630', '13', '357', 'IQUIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('631', '13', '359', 'ISNOS (SAN JOSE DE ISNOS)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('632', '13', '378', 'LA ARGENTINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('633', '13', '396', 'LA PLATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('634', '13', '483', 'NATAGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('635', '13', '503', 'OPORAPA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('636', '13', '518', 'PAICOL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('637', '13', '524', 'PALERMO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('638', '13', '530', 'PALESTINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('639', '13', '548', 'PITAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('640', '13', '551', 'PITALITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('641', '13', '615', 'RIVERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('642', '13', '660', 'SALADOBLANCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('643', '13', '668', 'SAN AGUSTIN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('644', '13', '676', 'SANTA MARIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('645', '13', '770', 'SUAZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('646', '13', '791', 'TARQUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('647', '13', '797', 'TESALIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('648', '13', '799', 'TELLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('649', '13', '801', 'TERUEL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('650', '13', '807', 'TIMANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('651', '13', '872', 'VILLAVIEJA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('652', '13', '885', 'YAGUARA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('653', '14', '1', 'RIOHACHA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('654', '14', '78', 'BARRANCAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('655', '14', '90', 'DIBULLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('656', '14', '98', 'DISTRACCION', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('657', '14', '110', 'EL MOLINO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('658', '14', '279', 'FONSECA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('659', '14', '378', 'HATONUEVO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('660', '14', '420', 'LA JAGUA DEL PILAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('661', '14', '430', 'MAICAO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('662', '14', '560', 'MANAURE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('663', '14', '650', 'SAN JUAN DEL CESAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('664', '14', '847', 'URIBIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('665', '14', '855', 'URUMITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('666', '14', '874', 'VILLANUEVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('667', '15', '1', 'SANTA MARTA (DISTRITO TURISTICO CULTURAL E HISTORICO DE SANTA MARTA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('668', '15', '30', 'ALGARROBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('669', '15', '53', 'ARACATACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('670', '15', '58', 'ARIGUANI (EL DIFICIL)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('671', '15', '161', 'CERRO SAN ANTONIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('672', '15', '170', 'CHIVOLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('673', '15', '189', 'CIENAGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('674', '15', '205', 'CONCORDIA', 'FUERA', 'Suroeste', '92.00', '185.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('675', '15', '245', 'EL BANCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('676', '15', '258', 'EL PIÑON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('677', '15', '268', 'EL RETEN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('678', '15', '288', 'FUNDACION', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('679', '15', '318', 'GUAMAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('680', '15', '541', 'PEDRAZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('681', '15', '545', 'PIJIÑO DEL CARMEN (PIJIÑO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('682', '15', '551', 'PIVIJAY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('683', '15', '555', 'PLATO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('684', '15', '570', 'PUEBLOVIEJO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('685', '15', '605', 'REMOLINO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('686', '15', '660', 'SABANAS DE SAN ANGEL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('687', '15', '675', 'SALAMINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('688', '15', '692', 'SAN SEBASTIAN DE BUENAVISTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('689', '15', '703', 'SAN ZENON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('690', '15', '707', 'SANTA ANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('691', '15', '745', 'SITIONUEVO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('692', '15', '798', 'TENERIFE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('693', '16', '1', 'VILLAVICENCIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('694', '16', '6', 'ACACIAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('695', '16', '110', 'BARRANCA DE UPIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('696', '16', '124', 'CABUYARO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('697', '16', '150', 'CASTILLA LA NUEVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('698', '16', '223', 'SAN LUIS DE CUBARRAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('699', '16', '226', 'CUMARAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('700', '16', '245', 'EL CALVARIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('701', '16', '251', 'EL CASTILLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('702', '16', '270', 'EL DORADO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('703', '16', '287', 'FUENTE DE ORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('704', '16', '313', 'GRANADA', 'FUERA', 'Suroeste', '73.00', '146.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('705', '16', '318', 'GUAMAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('706', '16', '325', 'MAPIRIPAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('707', '16', '330', 'MESETAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('708', '16', '350', 'LA MACARENA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('709', '16', '370', 'LA URIBE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('710', '16', '400', 'LEJANIAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('711', '16', '450', 'PUERTO CONCORDIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('712', '16', '568', 'PUERTO GAITAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('713', '16', '573', 'PUERTO LOPEZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('714', '16', '577', 'PUERTO LLERAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('715', '16', '590', 'PUERTO RICO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('716', '16', '606', 'RESTREPO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('717', '16', '680', 'SAN CARLOS DE GUAROA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('718', '16', '683', 'SAN JUAN DE ARAMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('719', '16', '686', 'SAN JUANITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('720', '16', '689', 'SAN MARTIN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('721', '16', '711', 'VISTAHERMOSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('722', '17', '1', 'PASTO (SAN JUAN DE PASTO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('723', '17', '19', 'ALBAN (SAN JOSE)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('724', '17', '22', 'ALDANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('725', '17', '36', 'ANCUYA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('726', '17', '51', 'ARBOLEDA (BERRUECOS)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('727', '17', '79', 'BARBACOAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('728', '17', '83', 'BELEN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('729', '17', '110', 'BUESACO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('730', '17', '203', 'COLON (GENOVA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('731', '17', '207', 'CONSACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('732', '17', '210', 'CONTADERO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('733', '17', '215', 'CORDOBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('734', '17', '224', 'CUASPUD (CARLOSAMA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('735', '17', '227', 'CUMBAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('736', '17', '233', 'CUMBITARA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('737', '17', '240', 'CHACHAGUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('738', '17', '250', 'EL CHARCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('739', '17', '254', 'EL PEÑOL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('740', '17', '256', 'EL ROSARIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('741', '17', '258', 'EL TABLON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('742', '17', '260', 'EL TAMBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('743', '17', '287', 'FUNES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('744', '17', '317', 'GUACHUCAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('745', '17', '320', 'GUAITARILLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('746', '17', '323', 'GUALMATAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('747', '17', '352', 'ILES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('748', '17', '354', 'IMUES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('749', '17', '356', 'IPIALES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('750', '17', '378', 'LA CRUZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('751', '17', '381', 'LA FLORIDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('752', '17', '385', 'LA LLANADA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('753', '17', '390', 'LA TOLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('754', '17', '399', 'LA UNION', 'FUERA', 'Oriente', '61.00', '123.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('755', '17', '405', 'LEIVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('756', '17', '411', 'LINARES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('757', '17', '418', 'LOS ANDES (SOTOMAYOR)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('758', '17', '427', 'MAGUI (PAYAN)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('759', '17', '435', 'MALLAMA (PIEDRANCHA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('760', '17', '473', 'MOSQUERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('761', '17', '490', 'OLAYA HERRERA (BOCAS DE SATINGA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('762', '17', '506', 'OSPINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('763', '17', '520', 'FRANCISCO PIZARRO (SALAHONDA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('764', '17', '540', 'POLICARPA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('765', '17', '560', 'POTOSI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('766', '17', '565', 'PROVIDENCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('767', '17', '573', 'PUERRES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('768', '17', '585', 'PUPIALES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('769', '17', '612', 'RICAURTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('770', '17', '621', 'ROBERTO PAYAN (SAN JOSE)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('771', '17', '678', 'SAMANIEGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('772', '17', '683', 'SANDONA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('773', '17', '685', 'SAN BERNARDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('774', '17', '687', 'SAN LORENZO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('775', '17', '693', 'SAN PABLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('776', '17', '694', 'SAN PEDRO DE CARTAGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('777', '17', '696', 'SANTA BARBARA (ISCUANDE)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('778', '17', '699', 'SANTA CRUZ (GUACHAVES)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('779', '17', '720', 'SAPUYES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('780', '17', '786', 'TAMINANGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('781', '17', '788', 'TANGUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('782', '17', '835', 'TUMACO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('783', '17', '838', 'TUQUERRES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('784', '17', '885', 'YACUANQUER', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('785', '18', '1', 'CUCUTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('786', '18', '3', 'ABREGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('787', '18', '51', 'ARBOLEDAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('788', '18', '99', 'BOCHALEMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('789', '18', '109', 'BUCARASICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('790', '18', '125', 'CACOTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('791', '18', '128', 'CACHIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('792', '18', '172', 'CHINACOTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('793', '18', '174', 'CHITAGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('794', '18', '206', 'CONVENCION', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('795', '18', '223', 'CUCUTILLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('796', '18', '239', 'DURANIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('797', '18', '245', 'EL CARMEN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('798', '18', '250', 'EL TARRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('799', '18', '261', 'EL ZULIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('800', '18', '313', 'GRAMALOTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('801', '18', '344', 'HACARI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('802', '18', '347', 'HERRAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('803', '18', '377', 'LABATECA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('804', '18', '385', 'LA ESPERANZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('805', '18', '398', 'LA PLAYA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('806', '18', '405', 'LOS PATIOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('807', '18', '418', 'LOURDES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('808', '18', '480', 'MUTISCUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('809', '18', '498', 'OCAÑA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('810', '18', '518', 'PAMPLONA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('811', '18', '520', 'PAMPLONITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('812', '18', '553', 'PUERTO SANTANDER', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('813', '18', '599', 'RAGONVALIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('814', '18', '660', 'SALAZAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('815', '18', '670', 'SAN CALIXTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('816', '18', '673', 'SAN CAYETANO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('817', '18', '680', 'SANTIAGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('818', '18', '720', 'SARDINATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('819', '18', '743', 'SILOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('820', '18', '800', 'TEORAMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('821', '18', '810', 'TIBU', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('822', '18', '820', 'TOLEDO', 'FUERA', 'Norte', '173.00', '347.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('823', '18', '871', 'VILLACARO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('824', '18', '874', 'VILLA DEL ROSARIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('825', '19', '1', 'ARMENIA', 'FUERA', 'Suroeste', '50.00', '101.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('826', '19', '111', 'BUENAVISTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('827', '19', '130', 'CALARCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('828', '19', '190', 'CIRCASIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('829', '19', '212', 'CORDOBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('830', '19', '272', 'FILANDIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('831', '19', '302', 'GENOVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('832', '19', '401', 'LA TEBAIDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('833', '19', '470', 'MONTENEGRO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('834', '19', '548', 'PIJAO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('835', '19', '594', 'QUIMBAYA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('836', '19', '690', 'SALENTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('837', '20', '1', 'PEREIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('838', '20', '45', 'APIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('839', '20', '75', 'BALBOA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('840', '20', '88', 'BELEN DE UMBRIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('841', '20', '170', 'DOS QUEBRADAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('842', '20', '318', 'GUATICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('843', '20', '383', 'LA CELIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('844', '20', '400', 'LA VIRGINIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('845', '20', '440', 'MARSELLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('846', '20', '456', 'MISTRATO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('847', '20', '572', 'PUEBLO RICO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('848', '20', '594', 'QUINCHIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('849', '20', '682', 'SANTA ROSA DE CABAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('850', '20', '687', 'SANTUARIO', 'FUERA', 'Oriente', '59.00', '119.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('851', '21', '1', 'BUCARAMANGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('852', '21', '13', 'AGUADA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('853', '21', '20', 'ALBANIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('854', '21', '51', 'ARATOCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('855', '21', '77', 'BARBOSA', 'FUERA', 'Norte', '42.00', '85.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('856', '21', '79', 'BARICHARA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('857', '21', '81', 'BARRANCABERMEJA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('858', '21', '92', 'BETULIA', 'FUERA', 'Norte', '138.00', '276.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('859', '21', '101', 'BOLIVAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('860', '21', '121', 'CABRERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('861', '21', '132', 'CALIFORNIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('862', '21', '147', 'CAPITANEJO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('863', '21', '152', 'CARCASI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('864', '21', '160', 'CEPITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('865', '21', '162', 'CERRITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('866', '21', '167', 'CHARALA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('867', '21', '169', 'CHARTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('868', '21', '176', 'CHIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('869', '21', '179', 'CHIPATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('870', '21', '190', 'CIMITARRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('871', '21', '207', 'CONCEPCION', 'FUERA', 'Suroeste', '62.00', '125.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('872', '21', '209', 'CONFINES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('873', '21', '211', 'CONTRATACION', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('874', '21', '217', 'COROMORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('875', '21', '229', 'CURITI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('876', '21', '235', 'EL CARMEN DE CHUCURY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('877', '21', '245', 'EL GUACAMAYO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('878', '21', '250', 'EL PEÑON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('879', '21', '255', 'EL PLAYON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('880', '21', '264', 'ENCINO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('881', '21', '266', 'ENCISO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('882', '21', '271', 'FLORIAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('883', '21', '276', 'FLORIDABLANCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('884', '21', '296', 'GALAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('885', '21', '298', 'GAMBITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('886', '21', '307', 'GIRON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('887', '21', '318', 'GUACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('888', '21', '320', 'GUADALUPE', 'FUERA', 'Norte', '117.00', '235.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('889', '21', '322', 'GUAPOTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('890', '21', '324', 'GUAVATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('891', '21', '327', 'GUEPSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('892', '21', '344', 'HATO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('893', '21', '368', 'JESUS MARIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('894', '21', '370', 'JORDAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('895', '21', '377', 'LA BELLEZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('896', '21', '385', 'LANDAZURI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('897', '21', '397', 'LA PAZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('898', '21', '406', 'LEBRIJA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('899', '21', '418', 'LOS SANTOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('900', '21', '425', 'MACARAVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('901', '21', '432', 'MALAGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('902', '21', '444', 'MATANZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('903', '21', '464', 'MOGOTES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('904', '21', '468', 'MOLAGAVITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('905', '21', '498', 'OCAMONTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('906', '21', '500', 'OIBA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('907', '21', '502', 'ONZAGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('908', '21', '522', 'PALMAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('909', '21', '524', 'PALMAS DEL SOCORRO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('910', '21', '533', 'PARAMO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('911', '21', '547', 'PIEDECUESTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('912', '21', '549', 'PINCHOTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('913', '21', '572', 'PUENTE NACIONAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('914', '21', '573', 'PUERTO PARRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('915', '21', '575', 'PUERTO WILCHES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('916', '21', '615', 'RIONEGRO', 'FUERA', 'Oriente', '33.00', '67.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('917', '21', '655', 'SABANA DE TORRES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('918', '21', '669', 'SAN ANDRES', 'FUERA', 'Occidente', '137.00', '274.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('919', '21', '673', 'SAN BENITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('920', '21', '679', 'SAN GIL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('921', '21', '682', 'SAN JOAQUIN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('922', '21', '684', 'SAN JOSE DE MIRANDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('923', '21', '686', 'SAN MIGUEL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('924', '21', '689', 'SAN VICENTE DE CHUCURI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('925', '21', '705', 'SANTA BARBARA', 'FUERA', 'Norte', '53.00', '106.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('926', '21', '720', 'SANTA HELENA DEL OPON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('927', '21', '745', 'SIMACOTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('928', '21', '755', 'SOCORRO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('929', '21', '770', 'SUAITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('930', '21', '773', 'SUCRE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('931', '21', '780', 'SURATA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('932', '21', '820', 'TONA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('933', '21', '855', 'VALLE SAN JOSE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('934', '21', '861', 'VELEZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('935', '21', '867', 'VETAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('936', '21', '872', 'VILLANUEVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('937', '21', '895', 'ZAPATOCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('938', '22', '1', 'SINCELEJO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('939', '22', '110', 'BUENAVISTA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('940', '22', '124', 'CAIMITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('941', '22', '204', 'COLOSO (RICAURTE)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('942', '22', '215', 'COROZAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('943', '22', '230', 'CHALAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('944', '22', '235', 'GALERAS (NUEVA GRANADA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('945', '22', '265', 'GUARANDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('946', '22', '400', 'LA UNION', 'FUERA', 'Oriente', '61.00', '123.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('947', '22', '418', 'LOS PALMITOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('948', '22', '429', 'MAJAGUAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('949', '22', '473', 'MORROA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('950', '22', '508', 'OVEJAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('951', '22', '523', 'PALMITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('952', '22', '670', 'SAMPUES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('953', '22', '678', 'SAN BENITO ABAD', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('954', '22', '702', 'SAN JUAN DE BETULIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('955', '22', '708', 'SAN MARCOS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('956', '22', '713', 'SAN ONOFRE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('957', '22', '717', 'SAN PEDRO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('958', '22', '742', 'SINCE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('959', '22', '771', 'SUCRE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('960', '22', '820', 'TOLU', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('961', '22', '823', 'TOLUVIEJO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('962', '23', '1', 'IBAGUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('963', '23', '24', 'ALPUJARRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('964', '23', '26', 'ALVARADO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('965', '23', '30', 'AMBALEMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('966', '23', '43', 'ANZOATEGUI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('967', '23', '55', 'ARMERO (GUAYABAL)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('968', '23', '67', 'ATACO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('969', '23', '124', 'CAJAMARCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('970', '23', '148', 'CARMEN APICALA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('971', '23', '152', 'CASABIANCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('972', '23', '168', 'CHAPARRAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('973', '23', '200', 'COELLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('974', '23', '217', 'COYAIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('975', '23', '226', 'CUNDAY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('976', '23', '236', 'DOLORES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('977', '23', '268', 'ESPINAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('978', '23', '270', 'FALAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('979', '23', '275', 'FLANDES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('980', '23', '283', 'FRESNO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('981', '23', '319', 'GUAMO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('982', '23', '347', 'HERVEO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('983', '23', '349', 'HONDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('984', '23', '352', 'ICONONZO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('985', '23', '408', 'LERIDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('986', '23', '411', 'LIBANO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('987', '23', '443', 'MARIQUITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('988', '23', '449', 'MELGAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('989', '23', '461', 'MURILLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('990', '23', '483', 'NATAGAIMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('991', '23', '504', 'ORTEGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('992', '23', '520', 'PALOCABILDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('993', '23', '547', 'PIEDRAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('994', '23', '555', 'PLANADAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('995', '23', '563', 'PRADO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('996', '23', '585', 'PURIFICACION', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('997', '23', '616', 'RIOBLANCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('998', '23', '622', 'RONCESVALLES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('999', '23', '624', 'ROVIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1000', '23', '671', 'SALDAÑA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1001', '23', '675', 'SAN ANTONIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1002', '23', '678', 'SAN LUIS', 'FUERA', 'Suroeste', '132.00', '265.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1003', '23', '686', 'SANTA ISABEL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1004', '23', '770', 'SUAREZ', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1005', '23', '854', 'VALLE DE SAN JUAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1006', '23', '861', 'VENADILLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1007', '23', '870', 'VILLAHERMOSA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1008', '23', '873', 'VILLARRICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1009', '24', '1', 'CALI (SANTIAGO DE CALI)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1010', '24', '20', 'ALCALA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1011', '24', '36', 'ANDALUCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1012', '24', '41', 'ANSERMANUEVO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1013', '24', '54', 'ARGELIA', 'FUERA', 'Norte', '148.00', '296.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1014', '24', '100', 'BOLIVAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1015', '24', '109', 'BUENAVENTURA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1016', '24', '111', 'BUGA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1017', '24', '113', 'BUGALAGRANDE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1018', '24', '122', 'CAICEDONIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1019', '24', '126', 'CALIMA (DARIEN)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1020', '24', '130', 'CANDELARIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1021', '24', '147', 'CARTAGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1022', '24', '233', 'DAGUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1023', '24', '243', 'EL AGUILA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1024', '24', '246', 'EL CAIRO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1025', '24', '248', 'EL CERRITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1026', '24', '250', 'EL DOVIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1027', '24', '275', 'FLORIDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1028', '24', '306', 'GINEBRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1029', '24', '318', 'GUACARI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1030', '24', '364', 'JAMUNDI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1031', '24', '377', 'LA CUMBRE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1032', '24', '400', 'LA UNION', 'FUERA', 'Oriente', '61.00', '123.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1033', '24', '403', 'LA VICTORIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1034', '24', '497', 'OBANDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1035', '24', '520', 'PALMIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1036', '24', '563', 'PRADERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1037', '24', '606', 'RESTREPO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1038', '24', '616', 'RIOFRIO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1039', '24', '622', 'ROLDANILLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1040', '24', '670', 'SAN PEDRO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1041', '24', '736', 'SEVILLA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1042', '24', '823', 'TORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1043', '24', '828', 'TRUJILLO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1044', '24', '834', 'TULUA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1045', '24', '845', 'ULLOA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1046', '24', '863', 'VERSALLES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1047', '24', '869', 'VIJES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1048', '24', '890', 'YOTOCO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1049', '24', '892', 'YUMBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1050', '24', '895', 'ZARZAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1051', '25', '1', 'ARAUCA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1052', '25', '65', 'ARAUQUITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1053', '25', '220', 'CRAVO NORTE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1054', '25', '300', 'FORTUL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1055', '25', '591', 'PUERTO RONDON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1056', '25', '736', 'SARAVENA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1057', '25', '794', 'TAME', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1058', '26', '1', 'YOPAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1059', '26', '10', 'AGUAZUL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1060', '26', '15', 'CHAMEZA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1061', '26', '125', 'HATO COROZAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1062', '26', '136', 'LA SALINA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1063', '26', '139', 'MANI', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1064', '26', '162', 'MONTERREY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1065', '26', '225', 'NUNCHIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1066', '26', '230', 'OROCUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1067', '26', '250', 'PAZ DE ARIPORO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1068', '26', '263', 'PORE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1069', '26', '279', 'RECETOR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1070', '26', '300', 'SABANALARGA', 'FUERA', 'Norte', '116.00', '232.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1071', '26', '315', 'SACAMA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1072', '26', '325', 'SAN LUIS DE PALENQUE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1073', '26', '400', 'TAMARA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1074', '26', '410', 'TAURAMENA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1075', '26', '430', 'TRINIDAD', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1076', '26', '440', 'VILLANUEVA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1077', '27', '1', 'MOCOA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1078', '27', '219', 'COLON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1079', '27', '320', 'ORITO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1080', '27', '568', 'PUERTO ASIS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1081', '27', '569', 'PUERTO CAICEDO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1082', '27', '571', 'PUERTO GUZMAN', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1083', '27', '573', 'PUERTO LEGUIZAMO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1084', '27', '749', 'SIBUNDOY', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1085', '27', '755', 'SAN FRANCISCO', 'FUERA', 'Suroeste', '101.00', '203.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1086', '27', '757', 'SAN MIGUEL (LA DORADA)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1087', '27', '760', 'SANTIAGO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1088', '27', '865', 'LA HORMIGA (VALLE DEL GUAMUEZ)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1089', '27', '885', 'VILLAGARZON', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1090', '28', '1', 'SAN ANDRES', 'FUERA', 'Occidente', '137.00', '274.00', null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1091', '28', '564', 'PROVIDENCIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1092', '29', '1', 'LETICIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1093', '29', '263', 'EL ENCANTO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1094', '29', '405', 'LA CHORRERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1095', '29', '407', 'LA PEDRERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1096', '29', '430', 'LA VICTORIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1097', '29', '460', 'MIRITI-PARANA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1098', '29', '530', 'PUERTO ALEGRIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1099', '29', '536', 'PUERTO ARICA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1100', '29', '540', 'PUERTO NARIÑO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1101', '29', '669', 'PUERTO SANTANDER', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1102', '29', '798', 'TARAPACA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1103', '30', '1', 'PUERTO INIRIDA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1104', '30', '343', 'BARRANCO MINAS', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1105', '30', '883', 'SAN FELIPE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1106', '30', '884', 'PUERTO COLOMBIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1107', '30', '885', 'LA GUADALUPE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1108', '30', '886', 'CACAHUAL', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1109', '30', '887', 'PANA PANA (CAMPO ALEGRE)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1110', '30', '888', 'MORICHAL (MORICHAL NUEVO)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1111', '31', '1', 'SAN JOSE DEL GUAVIARE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1112', '31', '15', 'CALAMAR', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1113', '31', '25', 'EL RETORNO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1114', '31', '200', 'MIRAFLORES', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1115', '32', '1', 'MITU', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1116', '32', '161', 'CARURU', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1117', '32', '511', 'PACOA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1118', '32', '666', 'TARAIRA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1119', '32', '777', 'PAPUNAUA (MORICHAL)', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1120', '32', '889', 'YAVARATE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1121', '33', '1', 'PUERTO CARREÑO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1122', '33', '524', 'LA PRIMAVERA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1123', '33', '572', 'SANTA RITA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1124', '33', '666', 'SANTA ROSALIA', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1125', '33', '760', 'SAN JOSE DE OCUNE', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1126', '33', '773', 'CUMARIBO', null, null, null, null, null, null, null);
INSERT INTO `cfg_municipios` VALUES ('1127', '1', '0', 'SANTAFE DE ANTIOQUIA', 'FUERA', 'Occidente\r\n', '57.70', '115.40', 'Zona_1', '454500.00', null);
INSERT INTO `cfg_municipios` VALUES ('1128', '1', '0', 'CIUDAD BOLIVAR', 'FUERA', 'Suroeste', '104.60', '209.00', 'Zona_2', '612248.00', null);

-- ----------------------------
-- Table structure for `cfg_nivel_escolaridad`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_nivel_escolaridad`;
CREATE TABLE `cfg_nivel_escolaridad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of cfg_nivel_escolaridad
-- ----------------------------
INSERT INTO `cfg_nivel_escolaridad` VALUES ('1', 'Desescolarizado', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('2', 'Primera Infancia', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('3', 'Primaria Completa', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('4', 'Primaria Incompleta', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('5', 'Segundaria Completa', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('6', 'Segundaria Incompleta', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('7', 'Técnico', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('8', 'Tecnologo', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('9', 'Profesional', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('10', 'Especialista', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('11', 'Sin Dato', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_nivel_escolaridad` VALUES ('12', 'Otro', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_parentesco`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_parentesco`;
CREATE TABLE `cfg_parentesco` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of cfg_parentesco
-- ----------------------------
INSERT INTO `cfg_parentesco` VALUES ('1', 'Conyuge', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_parentesco` VALUES ('2', 'Hijo (a)', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_parentesco` VALUES ('3', 'Nieto (a)', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_parentesco` VALUES ('4', 'Cuñado (a)', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_parentesco` VALUES ('5', 'Padres', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_parentesco` VALUES ('6', 'Otro', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_tipo_contrato`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_tipo_contrato`;
CREATE TABLE `cfg_tipo_contrato` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Abreviatura` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of cfg_tipo_contrato
-- ----------------------------
INSERT INTO `cfg_tipo_contrato` VALUES ('1', 'ACTA DE INCORPORACIÓN RECURSOS IDEA', null, '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('2', 'ARRENDAMIENTO', 'ARR', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('3', 'COMODATO', 'CTO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('4', 'COMPRA ', 'CPRA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('5', 'COMPRA-VENTA', 'CPRA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('6', 'CONSULTORÍA', 'CONS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('7', 'CONTRATO DE FIDUCIA MERCANTÍL', 'FID', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('8', 'CONTRATO DE MANDATO CON REPRESENTACIÓN', 'CMTO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('9', 'CONTRATO DE MANDATO SIN REPRESENTACIÓN', 'CMTO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('10', 'CONTRATO INTERADMINISTRATIVO - BVM', 'CI', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('11', 'CONVENIO DE ASOCIACIÓN', 'CA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('12', 'CONVENIO DE COLABORACIÓN', 'CC', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('13', 'CONVENIO DE COOPERACIÓN', 'CC', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('14', 'CONVENIO INTERADMINISTRATIVO ', 'CI', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('15', 'CONVENIO MARCO', 'CI', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('16', 'INTERVENTORÍA', 'INT', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('17', 'OBRA', 'OB', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('18', 'ORDEN DE COMPRA', null, '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('19', 'PRESTACIÓN DE SERVICIOS ', 'CPS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('20', 'SUMINISTRO', 'SU', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('21', 'COMPRA MENOR', 'CM', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_contrato` VALUES ('22', 'CONTRATO DE COLABORACION', 'COC', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_tipo_identificacion_documento`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_tipo_identificacion_documento`;
CREATE TABLE `cfg_tipo_identificacion_documento` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `Siglas` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of cfg_tipo_identificacion_documento
-- ----------------------------
INSERT INTO `cfg_tipo_identificacion_documento` VALUES ('1', 'Cédula de Ciudadania', 'CC', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_identificacion_documento` VALUES ('2', 'Cédula de Extranjeria', 'CE', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_identificacion_documento` VALUES ('3', 'Tarjeta de Identidad', 'TI', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_identificacion_documento` VALUES ('4', 'Registro Civil', 'RC', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_identificacion_documento` VALUES ('7', 'Pasaporte', 'P', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_tipo_ocupacion`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_tipo_ocupacion`;
CREATE TABLE `cfg_tipo_ocupacion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of cfg_tipo_ocupacion
-- ----------------------------
INSERT INTO `cfg_tipo_ocupacion` VALUES ('1', 'Ama de Casa', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('2', 'Agricultura', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('3', 'Estudiante', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('4', 'Independiente', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('5', 'Empleado', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('6', 'Desempleado', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('7', 'Oficios Varios', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('8', 'Ninguno', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `cfg_tipo_ocupacion` VALUES ('9', 'Otro', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `cfg_tipo_via`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_tipo_via`;
CREATE TABLE `cfg_tipo_via` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Abreviatura` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of cfg_tipo_via
-- ----------------------------
INSERT INTO `cfg_tipo_via` VALUES ('1', 'Autopista', 'Autopista');
INSERT INTO `cfg_tipo_via` VALUES ('2', 'Carretera', 'Carretera');
INSERT INTO `cfg_tipo_via` VALUES ('3', 'Avenida', 'Av');
INSERT INTO `cfg_tipo_via` VALUES ('4', 'Calle', 'Cll');
INSERT INTO `cfg_tipo_via` VALUES ('5', 'Carrera', 'Kr');
INSERT INTO `cfg_tipo_via` VALUES ('6', 'Diagonal', 'Diag');
INSERT INTO `cfg_tipo_via` VALUES ('7', 'Transversal', 'Trans');
INSERT INTO `cfg_tipo_via` VALUES ('8', 'Vereda', 'Vereda');
INSERT INTO `cfg_tipo_via` VALUES ('9', 'Avenida Calle', 'Avenida Calle');
INSERT INTO `cfg_tipo_via` VALUES ('10', 'Avenida Carrera', 'Avenida Carrera');
INSERT INTO `cfg_tipo_via` VALUES ('11', 'Bulevar', 'Bulevar');
INSERT INTO `cfg_tipo_via` VALUES ('13', 'Circular', 'Cir');
INSERT INTO `cfg_tipo_via` VALUES ('14', 'Circunvalar', 'Circunvalar');
INSERT INTO `cfg_tipo_via` VALUES ('15', 'Pasaje', 'Pasaje');
INSERT INTO `cfg_tipo_via` VALUES ('16', 'Paseo', 'Paseo');
INSERT INTO `cfg_tipo_via` VALUES ('17', 'Troncal', 'Troncal');
INSERT INTO `cfg_tipo_via` VALUES ('18', 'Variante', 'Variante');
INSERT INTO `cfg_tipo_via` VALUES ('19', 'Kilometro', 'Km');

-- ----------------------------
-- Table structure for `cfg_tipo_vivienda`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_tipo_vivienda`;
CREATE TABLE `cfg_tipo_vivienda` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Abreviatura` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of cfg_tipo_vivienda
-- ----------------------------
INSERT INTO `cfg_tipo_vivienda` VALUES ('1', 'Apartamento', 'Apto');
INSERT INTO `cfg_tipo_vivienda` VALUES ('2', 'Apartaestudio', 'Apto');
INSERT INTO `cfg_tipo_vivienda` VALUES ('3', 'Casa', '#');
INSERT INTO `cfg_tipo_vivienda` VALUES ('4', 'Anexo', '#');
INSERT INTO `cfg_tipo_vivienda` VALUES ('5', 'N/A', null);

-- ----------------------------
-- Table structure for `cfg_tipo_zona`
-- ----------------------------
DROP TABLE IF EXISTS `cfg_tipo_zona`;
CREATE TABLE `cfg_tipo_zona` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of cfg_tipo_zona
-- ----------------------------
INSERT INTO `cfg_tipo_zona` VALUES ('1', 'Norte');
INSERT INTO `cfg_tipo_zona` VALUES ('2', 'Sur');
INSERT INTO `cfg_tipo_zona` VALUES ('3', 'Este');
INSERT INTO `cfg_tipo_zona` VALUES ('4', 'Oeste');
INSERT INTO `cfg_tipo_zona` VALUES ('5', 'N/A');

-- ----------------------------
-- Table structure for `contrato_adjuntos`
-- ----------------------------
DROP TABLE IF EXISTS `contrato_adjuntos`;
CREATE TABLE `contrato_adjuntos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_ARCHIVO` varchar(255) DEFAULT NULL,
  `ID_JURIDICA_CONTRATO` int DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SIZE` varchar(255) DEFAULT NULL,
  `TIPO_DOCUMENTO` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `contrato_adjuntos_ibfk_1` (`ID_JURIDICA_CONTRATO`),
  CONSTRAINT `contrato_adjuntos_ibfk_1` FOREIGN KEY (`ID_JURIDICA_CONTRATO`) REFERENCES `juridica_contrato` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of contrato_adjuntos
-- ----------------------------
INSERT INTO `contrato_adjuntos` VALUES ('1', 'AdjuntoContrato-_0.pdf', '14', '../Documentacion/Contrato//AdjuntoContrato-_0.pdf', '516737', '3', '1', '2023-10-12 00:33:49', '2023-10-12 00:33:49', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `contrato_adjuntos` VALUES ('15', 'AdjuntoContrato-_0. DISPONIBILIDAD PRESUPUESTAL', '30', '../Documentacion/Contrato//AdjuntoContrato-_0. DISPONIBILIDAD PRESUPUESTAL', '534160', '3', '1', '2023-10-12 21:15:57', '2023-10-12 21:15:57', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `contrato_adjuntos` VALUES ('16', 'AdjuntoContrato-_0. DISPONIBILIDAD PRESUPUESTAL', '31', '../Documentacion/Contrato//AdjuntoContrato-_0. DISPONIBILIDAD PRESUPUESTAL', '534160', '3', '1', '2023-10-12 21:16:04', '2023-10-12 21:16:04', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');

-- ----------------------------
-- Table structure for `contrato_tipo_adjunto`
-- ----------------------------
DROP TABLE IF EXISTS `contrato_tipo_adjunto`;
CREATE TABLE `contrato_tipo_adjunto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of contrato_tipo_adjunto
-- ----------------------------
INSERT INTO `contrato_tipo_adjunto` VALUES ('1', 'Acta de Inicio', '1', '2023-05-08 11:23:35', null, 'daniel.rodriguez', null);
INSERT INTO `contrato_tipo_adjunto` VALUES ('2', 'Copia de Contrato', '1', '2023-05-08 11:23:39', null, 'daniel.rodriguez', null);
INSERT INTO `contrato_tipo_adjunto` VALUES ('3', 'CDP', '1', '2023-05-08 11:23:39', null, 'daniel.rodriguez', null);
INSERT INTO `contrato_tipo_adjunto` VALUES ('4', 'RP', '1', '2023-05-08 11:23:39', null, 'daniel.rodriguez', null);

-- ----------------------------
-- Table structure for `juridica_contrato`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato`;
CREATE TABLE `juridica_contrato` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CONTRATO_NUMERO_VIVA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CONTRATO_NUMERO_CONTRATANTE` varchar(100) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ESTADO_CONTRATO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT 'INICIADO',
  `TIPO_PROCESO_CONTRATO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `CONTRATANTE` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `FECHA_INI` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL,
  `FECHA_CONTRATO` date DEFAULT NULL,
  `MONTO` double(30,4) DEFAULT NULL,
  `OBJETO_CONTRATO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `RETENCION` float(10,2) DEFAULT NULL,
  `PAGOHONORARIO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `MONTO_DISPONIBILIDAD_PRESUPUESTAL` float(30,2) DEFAULT NULL,
  `FECHA_DISPONIBILIDAD_PRESUPUESTAL` date DEFAULT NULL,
  `DISPONIBILIDAD_PRESUPUESTAL` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `DIRECCION` int DEFAULT NULL COMMENT 'VIENE DE LA TABLA CFG_AREAS_DEPTO',
  `PROCESO` int DEFAULT NULL COMMENT 'viene de la tabla cfg_areas_proceso',
  `APORTES_ESPECIE_MPIO` float(30,2) DEFAULT NULL,
  `APORTES_RECURSOS_MPIO` float(30,2) DEFAULT NULL,
  `APORTES_ESPECIE_VIVA` float(30,2) DEFAULT NULL,
  `APORTES_RECURSOS_VIVA` float(30,2) DEFAULT NULL,
  `TOTAL_APORTES` double(30,2) DEFAULT NULL,
  `SEGMENTO_CONTRATO` text COLLATE utf8mb3_spanish_ci,
  `FECHA_NRO_ACTA` date DEFAULT NULL,
  `NRO_ACTA` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `TIPO_PERSONA` int DEFAULT NULL COMMENT 'PROVIENE DE juridica_contrato_tipo_persona',
  `ID_DEPTO` int DEFAULT NULL,
  `TIPO_MODALIDAD` int DEFAULT NULL COMMENT 'ESTO VIENE DE LA TABLA juridica_contrato_tipo_modalidad',
  `TIPO_CONTRATO` int DEFAULT NULL COMMENT 'VIENE DE LA TABLA cfg_tipo_contrato',
  `FECHA_SOLICITUD` date DEFAULT NULL,
  `ROL_TECNICO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ROL_LOGISTICO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ROL_JURIDICO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ID_MUNICIPIO` int DEFAULT NULL,
  `NOMBRE_CONTACTO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `NUMERO_CONTACTO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `CORREO_CONTACTO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ORDENADOR_GASTO` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `FECHA_TRANS_CAD` date DEFAULT NULL,
  `FECHA_PUBLICACION_SECOP` date DEFAULT NULL,
  `FECHA_PUBLICACION_GEST_TRANS` date DEFAULT NULL,
  `LINK_PUBLICACION_SECOP` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ID_TIPO_GASTO` int DEFAULT NULL COMMENT 'VIENE DE LA TABLA juridica_contrato_tipo_gasto',
  `COMPROMISO_PRESUPUESTAL` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `MONTO_COMPROMISO_PRESUPUESTAL` varchar(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `FECHA_COMPROMISO_PRESUPUESTAL` date DEFAULT NULL,
  `MOTIVO_ANULACION` text COLLATE utf8mb3_spanish_ci,
  `FECHA_ANULACION` date DEFAULT NULL,
  `POSEE_ARCHIVOS` varchar(2) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaCreacion` datetime NOT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_MUNICIPIO` (`ID_MUNICIPIO`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- ----------------------------
-- Records of juridica_contrato
-- ----------------------------
INSERT INTO `juridica_contrato` VALUES ('1', 'CPS-002-2023', null, 'EN EJECUCIÓN', 'ContratoDirecto', null, '2023-01-12', '2023-12-31', '2023-01-11', null, 'PRESTACIÓN DE SERVICIOS PROFESIONALES\nPARA LA REPRESENTACIÓN JUDICIAL Y\nEXTRAJUDICIAL DE LA EMPRESA DE VIVIENDA DE\nANTIOQUIA–VIVA', null, null, '100000000.00', '2023-01-05', '1', '4', '7', '0.00', '0.00', '0.00', '100000000.00', '402.96', '44', '2023-01-06', '1', '2', '1', '1', '19', '2023-01-06', 'SARA TRUJILLO QUICENO', 'YURY ANDREA BUITRAGO LOAIZA', 'ANA LUCIA MONTOYA CASTRO', '1', 'HERNÁN RAMIRO MORENO GÓMEZ', '3223247', 'hmoreno@esleg.com', 'ALBA LUCIA SEQUEDA GAMBOA', '2023-10-11', '2023-01-16', '2023-02-03', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.3771545&isFromPublicArea=True&isModal=False', '1', '2', '402957339', '2023-01-11', null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-09-04 21:38:43', 'ESNEYDER.MONTOYA', '2023-10-11 18:25:18');
INSERT INTO `juridica_contrato` VALUES ('2', '111', '010', 'INICIADO', 'BVM', 'MUNICIPIO DE REMEDIOS', '2023-08-28', '2023-12-31', null, '100000000.0000', 'GESTIONAR MATERIALES PARA LA CONSTRUCCION ', '0.00', 'unico', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, '83', 'VICTOR GIRALDO', '3182070575', 'victor.giraldo@viva.gov.co', null, null, null, null, null, null, null, null, null, null, null, 'NO', '1', 'PAULA.GARCIA', '2023-09-04 23:13:32', 'PAULA.GARCIA', '2023-09-04 23:13:32');
INSERT INTO `juridica_contrato` VALUES ('3', 'PIP-002-2023', null, 'EN EJECUCIÓN', 'ContratoProceso', null, '2023-03-01', '2023-12-31', '2023-02-28', null, 'PROVISIÓN DE PERSONAL TEMPORAL PARA LAS ACTIVIDADES DE ASEO, CAFETERÍA Y MANTENIMIENTO GENERAL, EN LAS SEDES DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA –VIVA.\n', null, null, '92992520.00', '2023-02-06', '1809', '13', '12', '0.00', '73522696.00', '0.00', '0.00', '73522696.00', '41', '2023-02-08', '7', '2', '1', '3', '19', '2023-02-23', 'ARIEL EDUARDO ECHEVERRY CORREA', 'MOISES BUSTOS OCAMPO', 'JULISSA ANDREA OQUENDO GOMEZ', '1', 'ALBERTO ANTONIO GARCÍA', '3222278', 'asearesp@gmail.com', 'LUZ EDILIA LOPEZ VAHOS', null, '2023-03-03', '2023-04-04', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.4114867&isFromPublicArea=True&isModal=False', '3', '1913', '73522698', '2023-02-28', null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-09-05 18:38:40', 'ESNEYDER.MONTOYA', '2023-09-05 18:50:41');
INSERT INTO `juridica_contrato` VALUES ('4', 'CPS-003-2023', null, 'EN EJECUCIÓN', 'ContratoDirecto', null, '2023-04-25', '2023-12-31', '2023-04-14', null, 'CONTRATO DE PRESTACIÓN DE SERVICIOS PARA DESARROLLAR Y EJECUTAR ACTIVIDADES DE CAPACITACIÓN, FORMACIÓN, CURSOS Y DIPLOMADOS EN HABILIDADES BLANDAS, TÉCNICAS Y FUNCIONALES PARA LOS SERVIDORES DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA- VIVA ', null, null, '34410000.00', '2023-03-09', '1859', '9', '4', '0.00', '0.00', '0.00', '34410000.00', '34410000.00', 'Ninguno', '2023-03-15', '13', '2', '1', '1', '19', '2023-03-16', 'MARIA ISABEL MORENO PARDO', 'MOISES BUSTOS OCAMPO', 'ASTRID HURTADO GUTIERREZ', '1', 'MARIA CLARA GALINDO AGUILAR', '3104509701', 'coorgrupoiso.ceset@udea.edu.co', 'CONSTANZA DIAZ GRANADOS', null, '2023-05-04', '2023-05-04', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.4369363&isFromPublicArea=True&isModal=False', '1', '2025', '34410000', '2023-04-21', null, null, 'NO', '1', 'Moises.Bustos', '2023-09-06 15:44:36', 'Moises.Bustos', '2023-09-06 16:10:13');
INSERT INTO `juridica_contrato` VALUES ('5', 'PIP-003-2023', 'PIP-003-2023', 'EN EJECUCIÓN', 'ContratoProceso', null, '2023-08-11', '2023-12-31', '2023-07-31', null, 'INTERVENTORÍA TÉCNICA, ADMINISTRATIVA, FINANCIERA, LEGAL Y AMBIENTAL PARA CONSTRUCCIÓN DE HASTA (12) VIVIENDAS PARA LA POBLACIÓN EN PROCESO DE REINCORPORACIÓN UBICADA EN LA HACIENDA LAS MERCEDES – MUNICIPIO DE ITUANGO DEL DEPARTAMENTO DE ANTIOQUIA.', null, null, '116009056.00', '2023-05-25', '2046', '6', '27', '0.00', '0.00', '0.00', '0.00', '115926454.00', '44', '2023-06-17', '32', '2', '1', '3', '16', '2023-07-06', 'CARLOS FELIPE GALLEGO RESTREPO', 'MOISES BUSTOS OCAMPO', 'DIEGO ALEXANDER UPEGUI GARCIA ', '47', 'MARIO ALONSO RESTREPO VELEZ', '3127572394', 'mariorestrepo.interventor@gmail.com', 'LUIS FERNANDO CORTES MOLINA', null, '2023-08-03', '2023-09-06', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.4810045&isFromPublicArea=True&isModal=False', '1', '2392', '115926454', '2023-07-31', null, null, 'NO', '1', 'Moises.Bustos', '2023-09-06 16:22:31', 'Moises.Bustos', '2023-09-06 17:57:07');
INSERT INTO `juridica_contrato` VALUES ('6', 'CI-004-2023', null, 'EN EJECUCIÓN', 'ContratoDirecto', null, '2023-02-09', '2023-12-31', '2023-02-09', null, 'CONVENIO INTERADMINISTRATIVO PARA EJECUTAR EL PROYECTO DE MEJORAMIENTO DE ENTORNOS “ANTIOQUIA SE PINTA DE VIDA” EN EL MUNICIPIO DE HELICONIA.', null, null, '24000000.00', '2022-12-22', '197487', '7', '20', '2000000.00', '0.00', '3000000.00', '24000000.00', '29.00', '45', '2023-02-01', '6', '2', '1', '1', '14', '2023-02-03', 'CARLOS FELIPE GALLEGO RESTREPO', 'MOISES BUSTOS OCAMPO', 'MARGARITA ROSA CORREA ECHEVERRI ', '57', 'JOHN FREDY ORTIZ TABARES', '8549635', 'alcaldia@heliconia-antioquia.gov.co', 'SERGIO LUCAS GARCÍA CORTÉS', null, '2023-02-10', '2023-03-07', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.3982065&isFromPublicArea=True&isModal=False', '1', '197487', '24000000', '2022-12-22', null, null, 'NO', '1', 'Moises.Bustos', '2023-09-06 21:32:41', 'Moises.Bustos', '2023-09-06 21:36:56');
INSERT INTO `juridica_contrato` VALUES ('7', 'CI-005-2023', null, 'INICIADO', 'ContratoDirecto', null, '2023-07-26', '2023-10-24', null, null, 'CONVENIO INTERADMINISTRATIVO CON EL MUNICIPIO DE PUERTO BERRIO – ANTIOQUIA, PARA LA COFINANCIACIÓN DEL PROYECTO “ESPACIO PÚBLICO EFECTIVO SECTOR EL PENSIL”, EN EL MARCO DEL PROGRAMA ESPACIO PÚBLICO EFECTIVO - EPE. ', null, null, '125000000.00', '2022-12-22', '197352', '6', '23', '0.00', '127867976.00', '0.00', '125000000.00', '373.49', '44', '2023-04-19', '19', '2', '1', '1', '14', '2023-04-20', 'LORENA VIVIANA HERRERA GOMEZ', 'MOISES BUSTOS OCAMPO', 'LADY JHOJANA PINEDA GONZALEZ', '80', 'GUSTAVO ERNESTO MEDINA ZAPATA', '8332120', 'hacienda@puertoberrio-antioquia.gov.co', 'LUIS FERNANDO CORTES MOLINA', '2023-08-08', '2023-07-13', '2023-08-01', 'HF8EFH8UEWFFQE', '1', '1345', '125000000', '2023-07-24', null, null, 'NO', '1', 'Moises.Bustos', '2023-09-07 00:19:57', 'Moises.Bustos', '2023-10-11 18:17:25');
INSERT INTO `juridica_contrato` VALUES ('8', 'MC-004-2023', 'MC-002-2023', 'EN EJECUCIÓN', 'ContratoProceso', null, '2023-03-02', '2023-12-31', '2023-02-24', null, 'PRESTACIÓN DEL SERVICIO PARA REALIZAR EXÁMENES MÉDICOS OCUPACIONALES AL PERSONAL VINCULADO DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA-VIVA', null, null, '4500000.00', '2023-01-20', '1797', '9', '4', '0.00', '4500000.00', '0.00', '0.00', '4.00', '49', '2023-02-01', '6', '2', '1', '2', '19', '2023-02-15', 'DANIELA CARVAJAL', 'MOISES BUSTOS OCAMPO', 'ASTRID HURTADO GUTIERREZ', '1', 'NIDIA MILENA GAVIRIA', '3115811302', 'comercial6@laboravitalips.com', 'CONSTANZA DIAZ GRANADOS', '2023-07-04', '2023-03-01', '2023-03-31', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.4103305&isFromPublicArea=True&isModal=False', '1', '1893', '4500000', '2023-02-24', null, null, 'NO', '1', 'Moises.Bustos', '2023-09-07 16:09:13', 'ESNEYDER.MONTOYA', '2023-10-11 17:39:33');
INSERT INTO `juridica_contrato` VALUES ('9', 'CI-006-2023', null, 'INICIADO', 'ContratoDirecto', null, null, null, null, null, 'CONVENIO INTERADMINISTRATIVO DE COFINANCIACIÓN EN EL MARCO DE LA CUARTA CONVOCATORIA “+COCINAS PARA LA VIDA”, PARA LA EJECUCIÓN DE MEJORAMIENTOS DE VIVIENDA URBANA Y RURAL EN EL MUNICIPIO DE CALDAS', null, null, '97798800.00', '2023-06-16', '2112', '6', '20', '1517220.00', '0.00', '0.00', '97798800.00', '99316020.00', 'Ninguno', '2023-06-17', '32', '2', '1', '1', '14', '2023-06-16', 'ANDRÉS FELIPE ZAPATA CORREA', 'MOISES BUSTOS OCAMPO', 'MELISSA MEJIA ROMAN ', '27', 'MAURICIO CARMONA CANO', '3788500', 'alcaldia@caldasantioquia.gov.co', null, null, null, null, null, null, null, null, null, null, null, 'NO', '1', 'Moises.Bustos', '2023-09-19 18:43:01', 'Moises.Bustos', '2023-09-19 18:43:01');
INSERT INTO `juridica_contrato` VALUES ('10', 'MC-005-2023', 'MC-003-2023', 'INICIADO', 'ContratoProceso', null, '2023-07-06', '2023-10-31', null, null, 'ADQUISICION, INSTALACION Y CONFIGURACION DE 7 DISPOSITIVOS ACCESS POINT PARA LA AMPLIACION Y MEJORA DE LA RED WIFI DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA (VIVA).', null, null, '10800000.00', '2023-05-25', '2049', '13', '5', '0.00', '9329600.00', '0.00', '0.00', '9329600.00', '23', '2023-05-31', '27', null, '1', '2', '4', '2023-06-20', 'WILMAR DARIO AGUDELO DAVILA', 'NOEMIS RODRIGUEZ VIDAL', 'JULISSA ANDREA OQUENDO GOMEZ', '1', '', '', '', 'LUZ EDILIA LOPEZ VAHOS', '2023-10-02', '2023-07-04', '2023-08-02', 'https://community.secop.gov.co/Public/Common/GoogleReCaptcha/Index?previousUrl=https%3a%2f%2fcommunity.secop.gov.co%2fPublic%2fTendering%2fOpportunityDetail%2fIndex%3fnoticeUID%3dCO1.NTC.4688235%26isFromPublicArea%3dTrue%26isModal%3dFalse', '2', '2218', '9329600', '2023-06-29', null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-10-11 16:41:59', 'ESNEYDER.MONTOYA', '2023-10-11 18:29:58');
INSERT INTO `juridica_contrato` VALUES ('11', 'MC-006-2023', 'MC-004-2023', 'INICIADO', 'ContratoProceso', null, '2023-07-06', '2023-10-31', null, null, 'ADQUISICION, INSTALACION Y CONFIGURACION DE 7 DISPOSITIVOS ACCESS POINT PARA LA AMPLIACION Y MEJORA DE LA RED WIFI DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA (VIVA).', null, null, '10800000.00', '2023-05-25', '2049', '13', '5', '0.00', '9329600.00', '0.00', '0.00', '9329600.00', '23', '2023-05-31', '27', null, '1', '2', '4', '2023-06-20', 'WILMAR DARIO AGUDELO', 'NOEMIS RODRIGUEZ VIDAL', 'JULISSA ANDREA OQUENDO GOMEZ', '1', '', '', '', 'LUZ EDILIA LOPEZ VAHOS', '2023-09-21', '2023-07-04', '2023-08-02', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.4688235&isFromPublicArea=True&isModal=False', '2', '2218', '9329600', '2023-06-29', null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-10-11 17:46:49', 'ESNEYDER.MONTOYA', '2023-10-11 17:52:54');
INSERT INTO `juridica_contrato` VALUES ('12', 'CPS-007-2023', null, 'INICIADO', 'ContratoDirecto', null, '2023-01-16', '2023-10-26', null, null, 'PRESTACIÓN DE SERVICIOS PROFESIONALES COMO\nABOGADO PARA LA GESTIÓN JURÍDICA DE LOS\nPROYECTOS DE LA EMPRESA DE VIVIENDA DE\nANTIOQUIA VIVA', null, null, '87032872.00', '2023-01-11', '15', '4', '7', '0.00', '0.00', '0.00', '87032872.00', '87032874.00', '44', '2023-01-12', '2', '2', '1', '1', '19', '2023-01-12', 'KELLY TATIANA TABARES HERRERA', 'LAURA MARCELA ZAPATA CARO', 'ANA LUCIA MONTOYA CASTRO', '1', 'DIEGO ALEXANDER UPEGUI GARCIA', '3113460356', 'g_oedigarcia@hotmail.com', 'ALBA LUCIA SEQUEDA GAMBOA', '2023-06-14', '2023-01-16', '2023-02-06', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.3770769&isFromPublicArea=True&isModal=False', '3', '20', '87032874', '2023-01-13', null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-10-11 18:41:16', 'ESNEYDER.MONTOYA', '2023-10-11 18:50:02');
INSERT INTO `juridica_contrato` VALUES ('13', 'PIP-007-2023', 'PIP-004-2023', 'INICIADO', 'ContratoProceso', null, null, null, null, null, 'PROVISIÓN DE PERSONAL TEMPORAL PARA LAS ACTIVIDADES DE ASEO, CAFETERÍA Y MANTENIMIENTO GENERAL, EN LAS SEDES DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA –VIVA', null, null, '92992520.00', '2023-02-06', '1809', '13', '12', '0.00', '0.00', '0.00', '73522696.00', '73522698.00', '41', '2023-02-08', '7', null, '1', '3', '19', '2023-02-23', 'ARIEL EDUARDO ECHEVARRI CORREA', 'MOISES BUSTOS OCAMPO', 'JULISSA ANDREA OQUENDO GOMEZ', '1', '', '', '', null, null, null, null, null, null, null, null, null, null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-10-11 20:57:29', 'ESNEYDER.MONTOYA', '2023-10-11 21:48:24');
INSERT INTO `juridica_contrato` VALUES ('14', 'CPS-011-2023', null, 'EN EJECUCIÓN', 'ContratoDirecto', null, '2023-02-06', '2023-11-10', '2023-06-06', null, 'REALIZACIÓN DE ACTIVIDADES DE APOYO, ACOMPAÑAMIENTO Y ASESORÍA JURÍDICA EXTERNA DENTRO DE LOS PROCESOS Y TRÁMITES ADMINISTRATIVOS EN MATERIA PRECONTRACTUAL, CONTRACTUAL Y POST CONTRACTUAL DONDE SEA PARTÍCIPE LA EMPRESA DE VIVIENDA DE ANTIOQUIA –VIVA.', null, null, '185000000.00', '2023-01-20', '1511', '4', '7', '0.00', '0.00', '0.00', '185000000.00', '185000000.00', '44', '2023-01-26', '5', '2', '1', '1', '19', '2023-01-27', 'KELLY TATIANA TABARES HERRERA', 'YURY ANDREA BUITRAGO LOAIZA', 'LUIS FERNANDO QUIROS HENAO', '1', 'HERNAN RAMIRO MORENO GÓMEZ', '3185633484', 'hmoreno@esleg.com', 'ALBA LUCIA SEQUEDA GAMBOA', '2023-10-02', '2023-02-07', '2023-02-03', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.3954228&isFromPublicArea=True&isModal=False', '1', '1836', '185000000', '2023-01-31', null, null, 'SI', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:33:49', 'ESNEYDER.MONTOYA', '2023-10-12 19:15:45');
INSERT INTO `juridica_contrato` VALUES ('29', 'CPS-011-2023', 'MC-004-2023', 'EN EJECUCIÓN', 'ContratoProceso', null, '2023-02-23', '2023-12-31', '2023-02-20', null, 'MANTENIMIENTO PREVENTIVO INTEGRAL, Y/O \nCORRECTIVO, NECESARIO PARA LOS EQUIPOS \nDEL SISTEMA DE AIRE ACONDICIONADO DE LA \nSEDE DE LA EMPRESA DE VIVIENDA DE ANTIOQUIA \n–VIVA', null, null, '11000000.00', '2023-01-20', '1784', '13', '12', '0.00', '0.00', '0.00', '9319700.00', '9319700.00', '39', '2023-02-01', '6', '2', '1', '2', '19', '2023-02-15', 'ARIEL EDUARDO ECHEVERRI CORREA', 'NOEMIS RODRIGUEZ VIDAL', 'JULISSA ANDREA OQUENDO GOMEZ', '1', 'JOSE OMAR RICO VASQUEZ', '3105262392', 'ricovaingenieriayservicios@gmail.com', 'LUZ EDILIA LOPEZ VAHOS', '2023-06-28', '2023-02-23', '2023-03-07', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.4068867&isFromPublicArea=True&isModal=False', '3', '1896', '9319700', '2023-02-24', null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-10-12 19:01:56', 'ESNEYDER.MONTOYA', '2023-10-12 19:10:47');
INSERT INTO `juridica_contrato` VALUES ('30', 'PIP-004-2023', null, 'INICIADO', 'ContratoProceso', null, null, null, null, null, 'SUMINISTRO DE PAPELERÍA E IMPLEMENTOS DE \nOFICINA, CAFETERÍA, ASEO, PERIFÉRICOS DE \nTECNOLOGÍA, PARA EL NORMAL FUNCIONAMIENTO \nDE LA EMPRESA DE VIVIENDA DE ANTIOQUI', null, null, '108417600.00', '2023-03-23', '1926', '13', '12', null, null, null, null, null, '23', '2023-03-29', '15', null, '1', '3', '20', '2023-04-17', 'ARIEL EDUARDO ECHEVERRI CORREA', 'MOISES BUSTOS OCAMPO', 'JULISSA ANDREA OQUENDO GOMEZ', '1', '', '', '', null, null, null, null, null, null, null, null, null, null, null, 'SI', '1', 'ESNEYDER.MONTOYA', '2023-10-12 21:15:57', 'ESNEYDER.MONTOYA', '2023-10-12 21:15:57');
INSERT INTO `juridica_contrato` VALUES ('31', 'PIP-005-2023', null, 'INICIADO', 'ContratoProceso', null, null, null, null, null, 'SUMINISTRO DE PAPELERÍA E IMPLEMENTOS DE \nOFICINA, CAFETERÍA, ASEO, PERIFÉRICOS DE \nTECNOLOGÍA, PARA EL NORMAL FUNCIONAMIENTO \nDE LA EMPRESA DE VIVIENDA DE ANTIOQUI', null, null, '108417600.00', '2023-03-23', '1926', '13', '12', null, null, null, null, null, '23', '2023-03-29', '15', null, '1', '3', '20', '2023-04-17', 'ARIEL EDUARDO ECHEVERRI CORREA', 'MOISES BUSTOS OCAMPO', 'JULISSA ANDREA OQUENDO GOMEZ', '1', '', '', '', null, null, null, null, null, null, null, null, null, null, null, 'SI', '1', 'ESNEYDER.MONTOYA', '2023-10-12 21:16:04', 'ESNEYDER.MONTOYA', '2023-10-12 21:16:04');
INSERT INTO `juridica_contrato` VALUES ('32', 'SU-013-2023', 'PIP-006-2023', 'EN EJECUCIÓN', 'ContratoProceso', null, '2023-04-27', '2023-12-31', '2023-04-25', null, 'SUMINISTRO DE PAPELERÍA E IMPLEMENTOS DE \nOFICINA, CAFETERÍA, ASEO, PERIFÉRICOS DE \nTECNOLOGÍA, PARA EL NORMAL FUNCIONAMIENTO \nDE LA EMPRESA DE VIVIENDA DE ANTIOQUI', null, null, '108417600.00', '2023-03-23', '1926', '13', '12', '0.00', '0.00', '0.00', '108417600.00', '108417600.00', '23', '2023-03-29', '15', '2', '1', '3', '20', '2023-04-17', 'ARIEL EDUARDO ECHEVERRI', 'MOISES BUSTOS OCAMPO', 'JULISSA ANDREA OQUENDO', '1', '', '', '', 'LUZ EDILIA LOPEZ VAHOS', '2023-02-06', '2023-04-28', '2023-05-05', 'https://community.secop.gov.co/Public/Tendering/OpportunityDetail/Index?noticeUID=CO1.NTC.4357222&isFromPublicArea=True&isModal=False', '3', '2033', '108417600', '2023-04-25', null, null, 'NO', '1', 'ESNEYDER.MONTOYA', '2023-10-12 21:18:44', 'ESNEYDER.MONTOYA', '2023-10-12 21:50:54');

-- ----------------------------
-- Table structure for `juridica_contrato_adicion`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_adicion`;
CREATE TABLE `juridica_contrato_adicion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CONTRATO` int DEFAULT NULL,
  `MONTO` double(30,4) DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of juridica_contrato_adicion
-- ----------------------------

-- ----------------------------
-- Table structure for `juridica_contrato_alertas_vistas`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_alertas_vistas`;
CREATE TABLE `juridica_contrato_alertas_vistas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Id_Contrato` int DEFAULT NULL,
  `D15` int DEFAULT NULL,
  `D30` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_alertas_vistas
-- ----------------------------

-- ----------------------------
-- Table structure for `juridica_contrato_amparos`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_amparos`;
CREATE TABLE `juridica_contrato_amparos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_amparos
-- ----------------------------
INSERT INTO `juridica_contrato_amparos` VALUES ('1', 'CUMPLIMIENTO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('2', 'PAGO DE SALARIOS, PRESTACIONES SOCIALES E INDEMNIZACIONES LABORALES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('3', 'CALIDAD DEL BIEN O SERVICIO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('4', 'SERIEDAD DE LA OFERTA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('5', 'PREDIOS, LABORES Y OPERACIONES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('6', 'CONTRATISTA Y SUBCONTRATISTAS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('7', 'VEHÍCULOS PROPIOS Y NO PROPIOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('8', 'PATRONAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('9', 'ESTABILIDAD Y CALIDAD DE LA OBRA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('10', 'DAÑO EMERGENTE Y LUCRO CESANTE', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_amparos` VALUES ('11', 'PERJUICIOS EXTRAPATRIMONIALES', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `juridica_contrato_contratante`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_contratante`;
CREATE TABLE `juridica_contrato_contratante` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `NombreContratista` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Identificacion` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Id_Contrato` int DEFAULT NULL,
  `Digito_verificacion` varchar(1) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaCreacion` datetime NOT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_contratante
-- ----------------------------
INSERT INTO `juridica_contrato_contratante` VALUES ('1', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '1', 'ESNEYDER.MONTOYA', '2023-09-04 21:38:43', 'ESNEYDER.MONTOYA', '2023-09-04 21:38:43');
INSERT INTO `juridica_contrato_contratante` VALUES ('2', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 15:12:55', 'Daniel.Rodriguez', '2023-09-05 15:42:54');
INSERT INTO `juridica_contrato_contratante` VALUES ('3', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 15:13:08', 'Daniel.Rodriguez', '2023-09-05 15:42:56');
INSERT INTO `juridica_contrato_contratante` VALUES ('4', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 15:13:08', 'Daniel.Rodriguez', '2023-09-05 15:42:58');
INSERT INTO `juridica_contrato_contratante` VALUES ('5', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'Daniel.Rodriguez', '2023-09-05 15:44:44', 'ESNEYDER.MONTOYA', '2023-09-05 18:27:45');
INSERT INTO `juridica_contrato_contratante` VALUES ('6', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'Daniel.Rodriguez', '2023-09-05 15:45:15', 'ESNEYDER.MONTOYA', '2023-09-05 18:27:49');
INSERT INTO `juridica_contrato_contratante` VALUES ('7', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'Daniel.Rodriguez', '2023-09-05 15:46:02', 'ESNEYDER.MONTOYA', '2023-09-05 18:27:52');
INSERT INTO `juridica_contrato_contratante` VALUES ('8', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'Daniel.Rodriguez', '2023-09-05 15:46:42', 'ESNEYDER.MONTOYA', '2023-09-05 18:27:54');
INSERT INTO `juridica_contrato_contratante` VALUES ('9', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 18:14:19', 'ESNEYDER.MONTOYA', '2023-09-05 18:27:57');
INSERT INTO `juridica_contrato_contratante` VALUES ('10', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 18:14:19', 'ESNEYDER.MONTOYA', '2023-09-05 18:27:58');
INSERT INTO `juridica_contrato_contratante` VALUES ('11', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 18:14:19', 'ESNEYDER.MONTOYA', '2023-09-05 18:28:00');
INSERT INTO `juridica_contrato_contratante` VALUES ('12', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 18:14:19', 'ESNEYDER.MONTOYA', '2023-09-05 18:28:02');
INSERT INTO `juridica_contrato_contratante` VALUES ('13', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '1', '7', '0', 'ESNEYDER.MONTOYA', '2023-09-05 18:14:19', 'ESNEYDER.MONTOYA', '2023-10-18 23:18:52');
INSERT INTO `juridica_contrato_contratante` VALUES ('14', 'ASEAR S.A E.S.P.', '811044253', '3', '8', '1', 'ESNEYDER.MONTOYA', '2023-09-05 18:50:41', 'ESNEYDER.MONTOYA', '2023-09-05 18:50:41');
INSERT INTO `juridica_contrato_contratante` VALUES ('15', 'UNIVERSIDAD DE ANTIOQUIA ', '890980040', '4', '8', '1', 'Moises.Bustos', '2023-09-06 15:44:36', 'Moises.Bustos', '2023-09-06 15:44:36');
INSERT INTO `juridica_contrato_contratante` VALUES ('16', 'UNIVERSIDAD DE ANTIOQUIA ', '890980040', '4', '8', '1', 'Moises.Bustos', '2023-09-06 16:07:26', 'Moises.Bustos', '2023-09-06 16:07:26');
INSERT INTO `juridica_contrato_contratante` VALUES ('17', 'UNIVERSIDAD DE ANTIOQUIA ', '890980040', '4', '8', '1', 'Moises.Bustos', '2023-09-06 16:07:54', 'Moises.Bustos', '2023-09-06 16:07:54');
INSERT INTO `juridica_contrato_contratante` VALUES ('18', 'UNIVERSIDAD DE ANTIOQUIA ', '890980040', '4', '8', '1', 'Moises.Bustos', '2023-09-06 16:09:01', 'Moises.Bustos', '2023-09-06 16:09:01');
INSERT INTO `juridica_contrato_contratante` VALUES ('19', 'UNIVERSIDAD DE ANTIOQUIA ', '890980040', '4', '8', '1', 'Moises.Bustos', '2023-09-06 16:10:13', 'Moises.Bustos', '2023-09-06 16:10:13');
INSERT INTO `juridica_contrato_contratante` VALUES ('20', 'MARIO ALONSO RESTREPO VELEZ', '98658837', '5', '9', '1', 'Moises.Bustos', '2023-09-06 17:57:07', 'Moises.Bustos', '2023-09-06 17:57:07');
INSERT INTO `juridica_contrato_contratante` VALUES ('21', 'MUNICIPIO DE HELICONIA', '890982494', '6', '7', '1', 'Moises.Bustos', '2023-09-06 21:32:41', 'Moises.Bustos', '2023-09-06 21:32:41');
INSERT INTO `juridica_contrato_contratante` VALUES ('22', 'MUNICIPIO DE HELICONIA', '890982494', '6', '7', '1', 'Moises.Bustos', '2023-09-06 21:36:56', 'Moises.Bustos', '2023-09-06 21:36:56');
INSERT INTO `juridica_contrato_contratante` VALUES ('23', 'MUNICIPIO DE PUERTO BERRIO', '890980049', '7', '3', '1', 'Moises.Bustos', '2023-09-07 00:19:57', 'Moises.Bustos', '2023-09-07 00:19:57');
INSERT INTO `juridica_contrato_contratante` VALUES ('24', 'LABORA VITAL IPS S.A.S', '900628918', '8', '7', '1', 'Moises.Bustos', '2023-09-07 16:23:32', 'Moises.Bustos', '2023-09-07 16:23:32');
INSERT INTO `juridica_contrato_contratante` VALUES ('25', 'MUNICIPIO DE CALDAS', '890980447', '9', '1', '1', 'Moises.Bustos', '2023-09-19 18:43:01', 'Moises.Bustos', '2023-09-19 18:43:01');
INSERT INTO `juridica_contrato_contratante` VALUES ('26', 'DIEGO ALEXANDER UPEGUI GARCIA', '1037614104', '12', '9', '1', 'ESNEYDER.MONTOYA', '2023-10-11 18:41:16', 'ESNEYDER.MONTOYA', '2023-10-11 18:41:16');
INSERT INTO `juridica_contrato_contratante` VALUES ('27', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '14', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:33:49', 'ESNEYDER.MONTOYA', '2023-10-12 00:33:49');
INSERT INTO `juridica_contrato_contratante` VALUES ('28', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '15', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:34:06', 'ESNEYDER.MONTOYA', '2023-10-12 00:34:06');
INSERT INTO `juridica_contrato_contratante` VALUES ('29', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '16', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:34:22', 'ESNEYDER.MONTOYA', '2023-10-12 00:34:22');
INSERT INTO `juridica_contrato_contratante` VALUES ('30', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '17', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:14', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:14');
INSERT INTO `juridica_contrato_contratante` VALUES ('31', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '18', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:14', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:14');
INSERT INTO `juridica_contrato_contratante` VALUES ('32', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '19', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15');
INSERT INTO `juridica_contrato_contratante` VALUES ('33', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '20', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15');
INSERT INTO `juridica_contrato_contratante` VALUES ('34', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '21', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15');
INSERT INTO `juridica_contrato_contratante` VALUES ('35', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '22', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:15');
INSERT INTO `juridica_contrato_contratante` VALUES ('36', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '23', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16');
INSERT INTO `juridica_contrato_contratante` VALUES ('37', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '24', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16');
INSERT INTO `juridica_contrato_contratante` VALUES ('38', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '25', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16');
INSERT INTO `juridica_contrato_contratante` VALUES ('39', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '26', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:16');
INSERT INTO `juridica_contrato_contratante` VALUES ('40', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '27', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:50', 'ESNEYDER.MONTOYA', '2023-10-12 00:35:50');
INSERT INTO `juridica_contrato_contratante` VALUES ('41', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '28', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 00:40:29', 'ESNEYDER.MONTOYA', '2023-10-12 00:40:29');
INSERT INTO `juridica_contrato_contratante` VALUES ('42', 'RICOVA INGENIERÍA Y SERVICIOS S.A.S', '901401112', '29', '6', '1', 'ESNEYDER.MONTOYA', '2023-10-12 19:10:47', 'ESNEYDER.MONTOYA', '2023-10-12 19:10:47');
INSERT INTO `juridica_contrato_contratante` VALUES ('43', 'ESTRUCTURADORES LEGALES -ESLEG- S.A.S.', '900624831', '14', '7', '1', 'ESNEYDER.MONTOYA', '2023-10-12 19:15:19', 'ESNEYDER.MONTOYA', '2023-10-12 19:15:19');
INSERT INTO `juridica_contrato_contratante` VALUES ('44', 'SUMINISTROS Y ELEMENTOS EMPRESARIALES  S.A.S', '900975633', '32', '0', '1', 'ESNEYDER.MONTOYA', '2023-10-12 21:42:43', 'ESNEYDER.MONTOYA', '2023-10-12 21:42:43');

-- ----------------------------
-- Table structure for `juridica_contrato_cuentacobros`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_cuentacobros`;
CREATE TABLE `juridica_contrato_cuentacobros` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Contrato` int DEFAULT NULL,
  `FechaCobro` date DEFAULT NULL,
  `MontoCobro` float(20,4) DEFAULT NULL,
  `NumeroCobro` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of juridica_contrato_cuentacobros
-- ----------------------------

-- ----------------------------
-- Table structure for `juridica_contrato_cuentacobros_adjuntos`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_cuentacobros_adjuntos`;
CREATE TABLE `juridica_contrato_cuentacobros_adjuntos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_ARCHIVO` varchar(255) DEFAULT NULL,
  `ID_JURIDICA_CONTRATO_CUENTACOBRO` int DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SIZE` varchar(255) DEFAULT NULL,
  `TIPO_DOCUMENTO` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `contrato_adjuntos_ibfk_1` (`ID_JURIDICA_CONTRATO_CUENTACOBRO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of juridica_contrato_cuentacobros_adjuntos
-- ----------------------------

-- ----------------------------
-- Table structure for `juridica_contrato_honorarios`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_honorarios`;
CREATE TABLE `juridica_contrato_honorarios` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Contrato` int DEFAULT NULL,
  `Monto` float(20,4) DEFAULT NULL,
  `FechaFactura` date DEFAULT NULL,
  `PoseeAdjuntos` varchar(2) COLLATE utf8mb4_spanish_ci DEFAULT 'SI',
  `NumeroFactura` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of juridica_contrato_honorarios
-- ----------------------------

-- ----------------------------
-- Table structure for `juridica_contrato_otrasfuentes`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_otrasfuentes`;
CREATE TABLE `juridica_contrato_otrasfuentes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Contrato` int DEFAULT NULL,
  `Monto` float(10,2) DEFAULT NULL,
  `NombreFuente` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_otrasfuentes
-- ----------------------------
INSERT INTO `juridica_contrato_otrasfuentes` VALUES ('1', '7', '100000000.00', 'FONDO DE VIVIENDA DE INTERES SOCIAL Y REFORMA URBANA EN EL MUNICIPIO DE PUERTO BERRIO', '1', '2023-09-07 00:19:57', '2023-09-07 00:19:57', 'Moises.Bustos', 'Moises.Bustos');

-- ----------------------------
-- Table structure for `juridica_contrato_poliza`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_poliza`;
CREATE TABLE `juridica_contrato_poliza` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Contrato` int DEFAULT NULL COMMENT 'viene de juridica_contrato',
  `Id_Tipo_Poliza` int DEFAULT NULL,
  `Compania_Poliza` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Numero_Poliza` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_poliza
-- ----------------------------
INSERT INTO `juridica_contrato_poliza` VALUES ('1', '1', '3', 'sss', '2222', '0', '2023-09-05 15:24:18', '2023-09-05 15:33:56', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_poliza` VALUES ('2', '1', '1', 'SEGUROS MUNDIAL', 'HHHH', '0', '2023-09-05 15:29:27', '2023-09-05 15:34:00', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_poliza` VALUES ('3', '1', '3', 'www', 'wwww', '0', '2023-09-05 15:34:20', '2023-09-05 15:34:28', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_poliza` VALUES ('4', '1', '1', 'SEGUROS MUNDIAL', 'M-100187513', '1', '2023-09-05 18:18:14', '2023-09-05 18:18:14', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza` VALUES ('5', '3', '1', 'ASEGURADORA SOLIDARIA DE COLOMBIA', '496-47-994000017298', '1', '2023-09-05 18:56:25', '2023-09-05 18:56:25', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza` VALUES ('6', '3', '1', 'ASEGURADORA SOLIDARIA DE COLOMBIA', '496-47-994000017298', '0', '2023-09-05 18:56:25', '2023-09-05 18:57:27', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza` VALUES ('7', '4', '1', 'SURAMERICANA', '3616682–9', '1', '2023-09-06 15:59:43', '2023-09-06 15:59:43', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza` VALUES ('8', '5', '2', 'SEGUROS DEL ESTADO', '65-40-101071957', '0', '2023-09-06 16:41:37', '2023-09-06 17:38:00', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza` VALUES ('9', '5', '3', 'SEGUROS DEL ESTADO', '65-44-101222142', '1', '2023-09-06 17:41:41', '2023-09-06 17:41:41', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza` VALUES ('10', '5', '1', 'SEGUROS DEL ESTADO', '65-44-101223387', '1', '2023-09-06 17:43:54', '2023-09-06 17:43:54', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza` VALUES ('11', '5', '2', 'SEGUROS DEL ESTADO', '65-40-101071957', '1', '2023-09-06 17:51:48', '2023-09-06 17:51:48', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza` VALUES ('12', '8', '1', 'SEGUROS MUNDIAL', 'M-100191695', '1', '2023-09-07 16:16:26', '2023-09-07 16:16:26', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza` VALUES ('13', '12', '1', 'SEGUROS DEL ESTADO S.A.', '65-46-101031495', '1', '2023-10-11 18:52:14', '2023-10-11 18:52:14', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza` VALUES ('14', '14', '1', 'SEGUROS MUNDIAL', 'M-100188932', '1', '2023-10-12 01:06:19', '2023-10-12 01:06:19', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza` VALUES ('15', '29', '1', 'ASEGURADORA SOLIDARIA DE COLOMBIA ', '530-47-994000038350', '1', '2023-10-12 19:13:19', '2023-10-12 19:13:19', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza` VALUES ('16', '32', '1', 'SEGUROS DEL ESTADO S.A.', '14-44-101180730', '1', '2023-10-12 21:47:47', '2023-10-12 21:47:47', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');

-- ----------------------------
-- Table structure for `juridica_contrato_poliza_amparos`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_poliza_amparos`;
CREATE TABLE `juridica_contrato_poliza_amparos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Poliza` int DEFAULT NULL COMMENT 'viene de la tabla Juridica_Contrato_Poliza',
  `Tipo_Amparo` int DEFAULT NULL COMMENT 'viene de la tabla juridica_contrato_amparos',
  `Fecha_Inicio_Amparo` date DEFAULT NULL,
  `Fecha_Fin_Amparo` date DEFAULT NULL,
  `Cuantia_Amparo` double(20,2) DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_poliza_amparos
-- ----------------------------
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('1', '1', '3', '2023-09-05', '2023-09-06', '22222.00', '1', '2023-09-05 15:24:18', '2023-09-05 15:24:18', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('2', '2', '3', '2023-01-10', '2023-04-30', '80591467.00', '1', '2023-09-05 15:29:27', '2023-09-05 15:29:27', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('3', '3', '1', '2023-09-01', '2023-09-07', '2222.00', '1', '2023-09-05 15:34:20', '2023-09-05 15:34:20', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('4', '3', '8', '2023-09-01', '2023-09-07', '2222.00', '1', '2023-09-05 15:34:20', '2023-09-05 15:34:20', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('5', '4', '1', '2023-01-10', '2024-04-30', '80591467.00', '1', '2023-09-05 18:18:14', '2023-09-05 18:18:14', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('6', '4', '3', '2023-01-10', '2024-04-30', '80591467.00', '1', '2023-09-05 18:18:14', '2023-09-05 18:18:14', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('7', '5', '1', '2023-03-01', '2024-06-30', '14704539.00', '1', '2023-09-05 18:56:25', '2023-09-05 18:56:25', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('8', '5', '2', '2023-03-01', '2026-12-31', '14704539.00', '1', '2023-09-05 18:56:25', '2023-09-05 18:56:25', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('9', '5', '3', '2023-03-01', '2024-06-30', '14704539.00', '1', '2023-09-05 18:56:25', '2023-09-05 18:56:25', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('10', '6', '1', '2023-03-01', '2024-06-30', '14704539.00', '1', '2023-09-05 18:56:25', '2023-09-05 18:56:25', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('11', '6', '2', '2023-03-01', '2026-12-31', '14704539.00', '1', '2023-09-05 18:56:25', '2023-09-05 18:56:25', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('12', '6', '3', '2023-03-01', '2024-06-30', '14704539.00', '1', '2023-09-05 18:56:25', '2023-09-05 18:56:25', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('13', '7', '3', '2023-04-14', '2024-06-30', '6882000.00', '1', '2023-09-06 15:59:43', '2023-09-06 15:59:43', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('14', '7', '1', '2023-04-14', '2024-06-30', '6882000.00', '1', '2023-09-06 15:59:43', '2023-09-06 15:59:43', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('15', '7', '2', '2023-04-14', '2026-12-31', '6882000.00', '1', '2023-09-06 15:59:43', '2023-09-06 15:59:43', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('16', '8', '4', '2023-06-29', '2023-10-29', '11600905.00', '1', '2023-09-06 16:41:37', '2023-09-06 16:41:37', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('17', '8', '1', '2023-07-31', '2024-07-01', '23185290.00', '1', '2023-09-06 16:41:37', '2023-09-06 16:41:37', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('18', '8', '2', '2023-07-31', '2026-12-31', '23185290.00', '1', '2023-09-06 16:41:37', '2023-09-06 16:41:37', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('19', '8', '3', '2023-07-31', '2028-12-31', '23185290.00', '1', '2023-09-06 16:41:37', '2023-09-06 16:41:37', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('20', '8', '5', '2023-07-31', '2023-12-31', '232000000.00', '1', '2023-09-06 16:41:37', '2023-09-06 16:41:37', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('21', '8', '8', '2023-07-31', '2023-12-31', '232000000.00', '1', '2023-09-06 16:41:37', '2023-09-06 16:41:37', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('22', '9', '4', '2023-06-29', '2023-10-29', '11600905.00', '1', '2023-09-06 17:41:41', '2023-09-06 17:41:41', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('23', '10', '4', '2023-06-29', '2023-10-29', '11600905.00', '0', '2023-09-06 17:43:54', '2023-09-06 17:52:13', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('24', '10', '1', '2023-07-31', '2024-07-01', '23185290.00', '1', '2023-09-06 17:43:54', '2023-09-06 17:43:54', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('25', '10', '2', '2023-07-31', '2026-12-31', '23185290.00', '1', '2023-09-06 17:43:54', '2023-09-06 17:43:54', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('26', '10', '3', '2023-07-31', '2028-12-31', '23185290.00', '1', '2023-09-06 17:43:54', '2023-09-06 17:43:54', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('27', '11', '5', '2023-07-31', '2023-12-31', '232000000.00', '1', '2023-09-06 17:51:48', '2023-09-06 17:51:48', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('28', '11', '10', '2023-07-31', '2023-12-31', '232000000.00', '1', '2023-09-06 17:51:48', '2023-09-06 17:51:48', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('29', '11', '11', '2023-07-31', '2023-12-31', '232000000.00', '1', '2023-09-06 17:51:48', '2023-09-06 17:51:48', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('30', '12', '1', '2023-02-22', '2024-06-30', '900000.00', '1', '2023-09-07 16:16:26', '2023-09-07 16:16:26', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('31', '12', '3', '2023-02-22', '2024-06-30', '900000.00', '1', '2023-09-07 16:16:26', '2023-09-07 16:16:26', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('32', '12', '2', '2023-02-22', '2026-12-31', '900000.00', '1', '2023-09-07 16:16:26', '2023-09-07 16:16:26', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('33', '13', '1', '2023-01-11', '2024-04-30', '17406574.00', '1', '2023-10-11 18:52:14', '2023-10-11 18:52:14', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('34', '14', '1', '2023-02-01', '2023-11-10', '37000000.00', '1', '2023-10-12 01:06:19', '2023-10-12 01:06:19', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('35', '14', '3', '2023-02-01', '2023-11-10', '37000000.00', '1', '2023-10-12 01:06:19', '2023-10-12 01:06:19', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('36', '15', '1', '2023-02-20', '2024-04-30', '931970.00', '1', '2023-10-12 19:13:19', '2023-10-12 19:13:19', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('37', '16', '1', '2023-04-24', '2024-04-30', '10841760.00', '1', '2023-10-12 21:47:47', '2023-10-12 21:47:47', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_poliza_amparos` VALUES ('38', '16', '3', '2023-04-24', '2024-04-30', '10841760.00', '1', '2023-10-12 21:47:47', '2023-10-12 21:47:47', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');

-- ----------------------------
-- Table structure for `juridica_contrato_poliza_amparos_alertas_vistas`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_poliza_amparos_alertas_vistas`;
CREATE TABLE `juridica_contrato_poliza_amparos_alertas_vistas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Id_Contrato_amparo` int DEFAULT NULL,
  `D15` int DEFAULT NULL,
  `D30` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_poliza_amparos_alertas_vistas
-- ----------------------------

-- ----------------------------
-- Table structure for `juridica_contrato_supervisor`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_supervisor`;
CREATE TABLE `juridica_contrato_supervisor` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Contrato` int DEFAULT NULL COMMENT 'viene de juridica_contrato',
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Identificacion` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_supervisor
-- ----------------------------
INSERT INTO `juridica_contrato_supervisor` VALUES ('1', '1', 'dnaiel rodriguez', '11111', '1', '2023-09-05 15:46:42', '2023-09-05 15:46:42', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_supervisor` VALUES ('2', '1', 'sadasd', '222', '0', '2023-09-05 15:46:42', '2023-09-05 15:47:11', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `juridica_contrato_supervisor` VALUES ('3', '1', 'SARA TRUJILLO QUICENO', '21526530', '1', '2023-09-05 18:14:19', '2023-09-05 18:14:19', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_supervisor` VALUES ('4', '3', 'ARIEL EDUARDO ECHEVERRI CORREA', '98524441', '1', '2023-09-05 18:50:41', '2023-09-05 18:50:41', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_supervisor` VALUES ('5', '4', 'CONSTANZA DÍAZ GRANADOS', '1017124799', '1', '2023-09-06 16:07:26', '2023-09-06 16:07:26', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_supervisor` VALUES ('6', '4', 'CONSTANZA DÍAZ GRANADOS', '1017124799', '1', '2023-09-06 16:07:54', '2023-09-06 16:07:54', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_supervisor` VALUES ('7', '4', 'CONSTANZA DÍAZ GRANADOS', '1017124799', '1', '2023-09-06 16:09:01', '2023-09-06 16:09:01', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_supervisor` VALUES ('8', '4', 'CONSTANZA DÍAZ GRANADOS', '1017124799', '1', '2023-09-06 16:10:13', '2023-09-06 16:10:13', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_supervisor` VALUES ('9', '5', 'CARLOS FELIPE GALLEGO RESTREPO', '15443567', '1', '2023-09-06 17:57:07', '2023-09-06 17:57:07', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_supervisor` VALUES ('10', '6', 'CARLOS FELIPE GALLEGO RESTREPO', '15443567', '1', '2023-09-06 21:36:56', '2023-09-06 21:36:56', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_supervisor` VALUES ('11', '8', 'DANIELA CARVAJAL VILLADA', '1017182801', '1', '2023-09-07 16:23:32', '2023-09-07 16:23:32', 'Moises.Bustos', 'Moises.Bustos');
INSERT INTO `juridica_contrato_supervisor` VALUES ('12', '29', 'ARIEL EDUEARDO ECHEVERRI', '98675432', '1', '2023-10-12 19:10:47', '2023-10-12 19:10:47', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');
INSERT INTO `juridica_contrato_supervisor` VALUES ('13', '32', 'ARIEL EDUARDO ECHEVERRI CORREA', '78253429', '1', '2023-10-12 21:42:43', '2023-10-12 21:42:43', 'ESNEYDER.MONTOYA', 'ESNEYDER.MONTOYA');

-- ----------------------------
-- Table structure for `juridica_contrato_tipo_estado`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_tipo_estado`;
CREATE TABLE `juridica_contrato_tipo_estado` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT '',
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of juridica_contrato_tipo_estado
-- ----------------------------
INSERT INTO `juridica_contrato_tipo_estado` VALUES ('1', 'EN EJECUCIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_estado` VALUES ('2', 'TERMINADO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_estado` VALUES ('3', 'INICIADO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_estado` VALUES ('4', 'ANULADO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_estado` VALUES ('5', 'DESIERTO', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `juridica_contrato_tipo_gasto`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_tipo_gasto`;
CREATE TABLE `juridica_contrato_tipo_gasto` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_tipo_gasto
-- ----------------------------
INSERT INTO `juridica_contrato_tipo_gasto` VALUES ('1', 'FUNCIONAMIENTO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_gasto` VALUES ('2', 'INVERSIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_gasto` VALUES ('3', 'FUNCIONAMIENTO-INVERSIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_gasto` VALUES ('4', 'ESPECIE', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_gasto` VALUES ('5', 'N/A', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `juridica_contrato_tipo_modalidad`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_tipo_modalidad`;
CREATE TABLE `juridica_contrato_tipo_modalidad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Abreviatura` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_tipo_modalidad
-- ----------------------------
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('1', 'CONTRATACIÓN DIRECTA', null, '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('2', 'MÍNICA CUANTÍA', 'MC', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('3', 'INVITACIÓN PRIVADA ', 'PIP', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('4', 'INVITACIÓN ABIERTA', 'IA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('5', 'ALIANZA ESTRATÉGICA', 'AE', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('6', 'ORDEN DE COMPRA', null, '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('7', 'OFERTA NO VINCULANTE', 'ONV', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('8', 'LICITACIÓN PÚBLICA', 'LP', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('9', 'SELECCIÓN ABREVIADA POR SUBASTA INVERSA', 'SA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('10', 'SELECCIÓN ABREVIADA POR MENOR CUANTÍA', 'SA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('11', 'CONCURSO DE MÉRITOS', 'CME', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_modalidad` VALUES ('12', 'COMPRA MENOR', 'CM', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `juridica_contrato_tipo_persona`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_tipo_persona`;
CREATE TABLE `juridica_contrato_tipo_persona` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_tipo_persona
-- ----------------------------
INSERT INTO `juridica_contrato_tipo_persona` VALUES ('1', 'PERSONA NATURAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_persona` VALUES ('2', 'PERSONA JURÍDICA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_persona` VALUES ('3', 'CONSORCIO ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_persona` VALUES ('4', 'UNIÓN TEMPORAL', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `juridica_contrato_tipo_poliza`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_tipo_poliza`;
CREATE TABLE `juridica_contrato_tipo_poliza` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_tipo_poliza
-- ----------------------------
INSERT INTO `juridica_contrato_tipo_poliza` VALUES ('1', 'GARANTÍA ÚNICA DE CUMPLIMIENTO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_poliza` VALUES ('2', 'RESPONSABILIDAD CIVIL EXTRACONTRACTUAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_poliza` VALUES ('3', 'GARANTÍA DE SERIEDAD ', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `juridica_contrato_tipo_segmento`
-- ----------------------------
DROP TABLE IF EXISTS `juridica_contrato_tipo_segmento`;
CREATE TABLE `juridica_contrato_tipo_segmento` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Segmento` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of juridica_contrato_tipo_segmento
-- ----------------------------
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('1', '10000000', 'MATERIAL VIVO VEGETAL Y ANIMAL, ACCESORIOS Y SUMINISTROS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('2', '11000000', 'MATERIAL MINERAL, TEXTIL Y VEGETAL Y ANIMAL NO COMESTIBLE', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('3', '12000000', 'MATERIAL QUÍMICO INCLUYENDO BIOQUÍMICOS Y MATERIALES DE GAS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('4', '13000000', 'MATERIALES DE RESINA, COLOFINIA, CAUCHO, ESPUMA, PELÍCULA Y ELASTÓMERICOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('5', '14000000', 'MATERIALES Y PRODUCTOS DE PAPEL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('6', '15000000', 'MATERIALES COMBUSTIBLES, ADITIVOS PARA COMBUSTIBLES, LUBRICANTES Y ANTICORROSIVOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('7', '20000000', 'MAQUINARIA Y ACCESORIOS DE MINERÍA Y PERFORACIÓN DE POZOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('8', '21000000', 'MAQUINARIA Y ACCESORIOS PARA AGRICULTURA, PESCA, SILVICULTURA Y FAUNA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('9', '22000000', 'MAQUINARIA Y ACCESORIOS PARA CONSTRUCCIÓN Y EDIFICACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('10', '23000000', 'MAQUINARIA Y ACCESORIOS PARA MANUFACTURA Y PROCESAMIENTO INDUSTRIAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('11', '24000000', 'MAQUINARIA, ACCESORIOS Y SUMINISTROS PARA MANEJO, ACONDICIONAMIENTO Y ALMACENAMIENTO DE MATERIALES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('12', '25000000', 'VEHÍCULOS COMERCIALES, MILITARES Y PARTICULARES, ACCESORIOS Y COMPONENTES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('13', '26000000', 'MAQUINARIA Y ACCESORIOS PARA GENERACIÓN Y DISTRIBUCCIÓN ENERGÍA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('14', '27000000', 'HERRAMIENTAS Y MAQUINARIA GENERAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('15', '30000000', 'COMPONENTES Y SUMINISTROS PARA ESTRUCTURAS, EDIFICACIÓN, CONSTRUCCIÓN Y OBRAS CIVILES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('16', '31000000', 'COMPONENTES Y SUMINISTROS DE MANUFACTURA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('17', '32000000', 'COMPONENTES Y SUMINISTROS ELECTRÓNICOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('18', '39000000', 'COMPONENTES, ACCESORIOS Y SUMINISTROS DE SISTEMAS ELÉCTRICOS E ILUMINACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('19', '40000000', 'COMPONENTES Y EQUIPOS PARA DISTRIBUCIÓN Y SISTEMAS DE ACONDICIONAMIENTO ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('20', '41000000', 'EQUIPOS Y SUMINISTROS DE LABORATORIO, DE MEDICIÓN, DE OBSERVACIÓN Y DE PRUEBAS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('21', '42000000', 'EQUIPO MÉDICO, ACCESORIOS Y SUMINISTROS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('22', '43000000', 'DIFUSIÓN DE TECNOLOGÍAS DE INFORMACIÓN Y TELECOMUNICACIONES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('23', '44000000', 'EQUIPOS  DE OFICINA, ACCESORIOS Y SUMINISTROS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('24', '45000000', 'EQUIPOS Y SUMINISTROS PARA IMPRESIÓN, FOTOGRAFIA Y AUDIOVISUALES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('25', '46000000', 'EQUIPOS Y SUMINISTROS DE DEFENSA, ORDEN PUBLICO, PROTECCIÓN, VIGILANCIA Y SEGURIDAD ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('26', '47000000', 'EQUIPOS Y SUMINISTROS PARA LIMPIEZA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('27', '48000000', 'MAQUINARIA, EQUIPO Y SUMINISTROS PARA LA INDUSTRIA DE SERVICIOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('28', '49000000', 'EQUIPOS, SUMINISTROS Y ACCESORIOS PARA DEPORTES Y RECREACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('29', '50000000', 'ALIMENTOS, BEBIDAS Y TABACO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('30', '51000000', 'MEDICAMENTOS Y PRODUCTOS FARMACÉUTICOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('31', '52000000', 'ARTÍCULOS DOMÉSTICOS, SUMINISTROS Y PRODUCTOS ELECTRÓNICOS DE CONSUMO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('32', '53000000', 'ROPA, MALETAS Y PRODUCTOS DE ASEO PERSONAL', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('33', '54000000', 'PRODUCTOS PARA RELOJERÍA, JOYERÍA Y PIEDRAS PRECIOSAS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('34', '55000000', 'PUBLICACIONES IMPRESAS, PUBLICACIONES ELECTRONICAS Y ACCESORIOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('35', '56000000', 'MUEBLES, MOBILIARIO  Y DECORACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('36', '60000000', 'INSTRUMENTOS MUSICALES, JUEGOS, JUGUETES, ARTES, ARTESANÍAS Y EQUIPO EDUCATIVO, MATERIALES, ACCESORIOS Y SUMINISTROS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('37', '70000000', 'SERVICIOS DE CONTRATACIÓN AGRÍCOLA, PESQUERA, FORESTAL Y DE FAUNA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('38', '71000000', 'SERVICIOS DE MINERÍA, PETRÓLEO Y GAS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('39', '72000000', 'SERVICIOS DE EDIFICACIÓN, CONSTRUCCIÓN DE INSTALACIONES Y MANTENIMIENTO ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('40', '73000000', 'SERVICIOS DE PRODUCCIÓN INDUSTRIAL Y MANUFACTURA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('41', '76000000', 'SERVICIOS DE LIMPIEZA, DESCONTAMINACIÓN Y TRATAMIENTO DE RESIDUOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('42', '77000000', 'SERVICIOS MEDIOAMBIENTALES ', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('43', '78000000', 'SERVICIOS DE TRANSPORTE, ALMACENAJE Y CORREO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('44', '80000000', 'SERVICIOS DE GESTIÓN, SERVICIOS PROFESIONALES DE EMPRESA Y SERVICIOS ADMINISTRATIVOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('45', '81000000', 'SERVICIOS BASADOS EN INGENIERÍA, INVESTIGACIÓN Y TECNOLOGÍA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('46', '82000000', 'SERVICIOS EDITORIALES, DE DISEÑO, DE ARTES GRAFICAS Y BELLAS ARTES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('47', '83000000', 'SERVICIOS PÚBLICOS Y SERVICIOS RELACIONADOS CON EL SECTOR PÚBLICO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('48', '84000000', 'SERVICIOS FINANCIEROS Y DE SEGUROS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('49', '85000000', 'SERVICIOS DE SALUD', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('50', '86000000', 'SERVICIOS EDUCATIVOS Y DE FORMACIÓN', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('51', '90000000', 'SERVICIOS DE VIAJES, ALIMENTACIÓN, ALOJAMIENTO Y ENTRETENIMIENTO', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('52', '91000000', 'SERVICIOS PERSONALES Y DOMÉSTICOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('53', '92000000', 'SERVICIOS DE DEFENSA NACIONAL, ORDEN PÚBLICO, SEGURIDAD Y VIGILANCIA', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('54', '93000000', 'SERVICIOS POLÍTICOS Y DE ASUNTOS CÍVICOS', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('55', '94000000', 'ORGANIZACIONES Y CLUBES', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `juridica_contrato_tipo_segmento` VALUES ('56', '95000000', 'TERRENOS, EDIFICIOS, ESTRUCTURALES Y VÍAS', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Mensaje` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `UsuarioCreacion` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `URL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ID_PADRE` int DEFAULT NULL,
  `ICONO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ORDEN` int DEFAULT NULL,
  `TITULO` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '',
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id_padre` (`ID_PADRE`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Configuración', '', null, 'fa-solid fa-screwdriver-wrench', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('2', 'Usuarios', '', '1', 'fa-solid fa-user-group', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('3', 'Juridica', '', null, 'fas fa-balance-scale', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('4', 'Contratos', '', '3', 'fa-solid fa-file-contract', '1', null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('5', 'Editar Usuario', 'Configuracion/EditarUsuario.php', '2', 'fa-solid fa-user-pen', '2', 'Editar Usuario', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('6', 'Crear Usuario', 'Configuracion/CrearUsuario.php', '2', 'fa-solid fa-user-plus', '1', 'Crear Usuario', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('8', 'Crear Contrato', 'Administracion/CrearContrato.php', '4', 'fa-solid fa-file-signature', '1', 'Crear Contrato', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('9', 'Modificación u Otro SI', 'Administracion/CrearOtroSi.php', '4', 'fa-solid fa-file-signature', '2', 'Modificación u Otro SI', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('10', 'Transporte', '', null, 'fas fa-truck', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('11', 'Operar', '', '10', 'fa-solid fa-gears', '1', null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('12', 'Solicitar Servicios', 'Transporte/Solicitarservicio.php', '11', 'fa-solid fa-car-side', '1', 'Solicitar Servicio', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('13', 'Asignar Vehiculos', 'Transporte/AsignarVehiculosSolicitud.php', '11', 'fa-solid fa-car-on', '3', 'Asignar Vehiculo', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('14', 'Contabilidad', '', null, 'fas fa-file-invoice-dollar', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('15', 'Financiera', '', null, 'fas fa-chart-line', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('16', 'Registro de Honorarios', 'Contabilidad/RegistroHonorarios.php', '14', 'fas fa-money-check-alt', '1', 'Registro de Honorarios', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('17', 'Registro de Cuenta de Cobro', 'Contabilidad/RegistroCuentaCobro.php', '15', 'fas fa-file-invoice', '1', 'Registro de Cuenta de Cobro', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('18', 'Autorizar Servicio', 'Transporte/AutorizacionTransporte.php', '11', 'fas fa-check-circle', '2', 'Autorizar Servicio', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('19', 'Proveedores', '', null, 'fa-solid fa-truck', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('20', 'Crear Proveedor', 'Proveedores/GestionarProveedores.php', '19', 'fa-solid fa-person-circle-plus', '1', 'Crear Proveedor', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('21', 'Carga de Precios', 'Proveedores/CargarPrecios.php', '19', 'fas fa-list-alt', '2', 'Carga de Precios', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('22', 'Pedidos', '', null, 'fas fa-shopping-cart', null, null, '1', null, null, '', null);
INSERT INTO `menu` VALUES ('23', 'Generar Cotización', 'Pedidos/GenerarCotizacion.php', '22', 'far fa-file-alt', '1', 'Generar Cotización', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('24', 'Editar Cotización', 'Pedidos/EditarCotizacion.php', '22', 'fas fa-edit', '2', 'Editar Cotización', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('25', 'Generar Orden de Pedido al Proveedor', 'Pedidos/GenerarOrdenPedidoProveedor.php', '22', 'far fa-file-alt', '4', 'Generar Orden de Pedido al Proveedor', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('26', 'Gestionar Ordenes de Pedidos', 'Pedidos/GestionarOrdenPedidoProveedor.php', '22', 'far fa-file-alt', '3', 'Gestionar Ordenes de Pedidos', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('27', 'Gestionar Solicitudes', 'Transporte/GestionTransporte.php', '11', 'fas fa-check-circle', '4', 'Gestionar Solicitudes', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('28', 'Gestion de Reportados', 'Pedidos/GestionarMaterialesReportados.php', '22', 'far fa-file-alt', '5', 'Gestion de Reportados', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('29', 'Generar Factura', 'Pedidos/GenerarFactura.php', '22', 'fas fa-money-check-alt', '6', 'Generar Factura', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('31', 'Adicionar Información Contrato', 'Administracion/AdicionarInfoContrato.php', '4', 'fa-solid fa-file-signature', '3', 'Adicionar Información Contrato', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('32', 'Reportes', '', '3', 'fas fa-file-alt', '4', '', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('33', 'Resumen Mensual de la Gestión Contractual', 'Administracion/Reportes/ResumenGestionContractual.php', '32', 'fa-regular fa-file', '1', 'Resumen Mensual de la Gestión Contractual', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('34', 'Reportes', '', '10', 'fas fa-file-alt', '2', '', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('35', 'Informe de Servicio de Transporte', 'Transporte/Reportes/InformeServicioTransporte.php', '34', 'fa-regular fa-file-lines', '1', 'Informe de Servicio de Transporte', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('36', 'Información Adicional por Contrato', 'Administracion/Reportes/AdicionalxContrato.php', '32', 'fa-regular fa-file', '2', 'Información Adicional por Contrato', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('37', 'Relación de Pólizas y Amparos por Contrato', 'Administracion/Reportes/PolizasAmparosxContrato.php', '32', 'fa-regular fa-file', '3', 'Relación de Pólizas y Amparos por Contrato', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('38', 'Finalizar Servicio', 'Transporte/FinalizarSolicitud.php', '11', 'fa-solid fa-car-side', '4', 'Finalizar Servicio', '1', null, null, '', null);
INSERT INTO `menu` VALUES ('39', 'Menú', '', '1', 'fa-solid fa-bars', null, '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');
INSERT INTO `menu` VALUES ('40', 'Nueva Opción', 'Configuracion/NuevoMenu.php', '39', 'fa-regular fa-square-plus', '1', 'Nueva Opción', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');
INSERT INTO `menu` VALUES ('41', 'Nuevo Perfil', 'Configuracion/NuevoPerfil.php', '39', 'fa-solid fa-users', '2', 'Nuevo Perfil', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');
INSERT INTO `menu` VALUES ('42', 'Vincular Perfil a Menú', 'Configuracion/NuevoMenuPerfil.php', '39', 'fa-solid fa-users-rays', '3', 'Vincular Perfil a Menú', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');
INSERT INTO `menu` VALUES ('45', 'Data', '', null, 'fa-solid fa-people-roof', null, '', '1', '2023-10-18 10:20:39', '2023-10-18 10:20:39', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu` VALUES ('46', 'Ficha de Caracterización Social', 'Data/RegistrarPostulados.php', '45', 'fa-solid fa-people-group', '1', 'Ficha de Caracterización Social', '1', '2023-10-18 10:24:59', '2023-10-18 10:24:59', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu` VALUES ('47', 'Resumen General de Contratos', 'Administracion/Reportes/ResumenGeneralContrato.php', '32', 'fa-solid fa-table', '4', 'Resumen General de Contratos', '1', '2023-11-01 22:33:05', '2023-11-01 22:33:05', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu` VALUES ('48', 'Registrar Beneficiarios', 'Data/RegistrarBeneficiarios.php', '45', 'fa-solid fa-house-chimney-user', '2', 'Registrar Beneficiarios', '1', '2023-11-10 17:49:57', '2023-11-10 17:49:57', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu` VALUES ('49', 'Reportes Data', '', '45', 'fa-solid fa-list-ul', '3', 'Reportes Data', '1', '2023-11-17 16:46:06', '2023-11-17 16:46:06', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu` VALUES ('50', 'Listado Resumen', 'Data/Reportes Data/ListadoRegistrado.php', '49', 'fa-solid fa-list-ul', '1', 'Listado Resumen', '1', '2023-11-17 16:48:43', '2023-11-17 16:48:43', 'Daniel.Rodriguez', 'Daniel.Rodriguez');

-- ----------------------------
-- Table structure for `menu_perfil`
-- ----------------------------
DROP TABLE IF EXISTS `menu_perfil`;
CREATE TABLE `menu_perfil` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_MENU` int DEFAULT NULL,
  `ID_PERFIL` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PK_ID_MENU` (`ID_MENU`) USING BTREE,
  KEY `ID_PERFIL` (`ID_PERFIL`),
  CONSTRAINT `menu_perfil_ibfk_1` FOREIGN KEY (`ID_MENU`) REFERENCES `menu` (`ID`),
  CONSTRAINT `menu_perfil_ibfk_2` FOREIGN KEY (`ID_PERFIL`) REFERENCES `usuarios_cfg_perfiles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- ----------------------------
-- Records of menu_perfil
-- ----------------------------
INSERT INTO `menu_perfil` VALUES ('2', '10', '4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('3', '11', '4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('4', '12', '4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('5', '13', '4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('6', '18', '4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('7', '27', '4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('9', '3', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('10', '4', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('11', '9', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('12', '14', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('13', '15', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('14', '16', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('15', '17', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('16', '19', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('17', '20', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('18', '21', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('19', '22', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('20', '23', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('21', '24', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('22', '25', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('23', '26', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('24', '27', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('25', '28', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('26', '29', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('27', '31', '2', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('28', '4', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('29', '8', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('30', '3', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('31', '31', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('32', '10', '5', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('33', '11', '5', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('34', '12', '5', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('35', '27', '5', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('36', '32', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('37', '36', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('38', '33', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('39', '37', '3', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('40', '38', '4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `menu_perfil` VALUES ('42', '45', '7', '1', '2023-10-20 23:21:44', '2023-10-20 23:21:44', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu_perfil` VALUES ('43', '46', '7', '1', '2023-10-20 23:21:44', '2023-10-20 23:21:44', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu_perfil` VALUES ('44', '48', '7', '1', '2023-11-10 17:58:21', '2023-11-10 17:58:21', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu_perfil` VALUES ('45', '50', '7', '1', '2023-11-17 17:09:37', '2023-11-17 17:09:37', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `menu_perfil` VALUES ('46', '49', '7', '1', '2023-11-17 17:09:39', '2023-11-17 17:09:39', 'Daniel.Rodriguez', 'Daniel.Rodriguez');

-- ----------------------------
-- Table structure for `pedidos_cotizacion`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_cotizacion`;
CREATE TABLE `pedidos_cotizacion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NumeroCotizacion` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Id_Depto` int DEFAULT NULL,
  `Id_Mpio` int DEFAULT NULL,
  `Id_Contrato` int DEFAULT NULL,
  `FechaSol` date DEFAULT NULL,
  `Direccion` text COLLATE utf8mb4_spanish_ci,
  `Solicitante` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Cedula` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Cargo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Id_estado_cotizacion` int DEFAULT '1' COMMENT 'viene de la tabla cfg_estados_cotizacion',
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidos_cotizacion
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_cotizacion_adjuntos`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_cotizacion_adjuntos`;
CREATE TABLE `pedidos_cotizacion_adjuntos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_ARCHIVO` varchar(255) DEFAULT NULL,
  `Id_Orden_Pedido` int DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SIZE` varchar(255) DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `contrato_adjuntos_ibfk_1` (`Id_Orden_Pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of pedidos_cotizacion_adjuntos
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_cotizacion_detalles`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_cotizacion_detalles`;
CREATE TABLE `pedidos_cotizacion_detalles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Orden_Pedido` int DEFAULT NULL,
  `Material` text COLLATE utf8mb4_spanish_ci,
  `Cantidad` int DEFAULT NULL,
  `Precio` float(10,2) DEFAULT NULL,
  `Id_Proveedor` int DEFAULT NULL,
  `Unidad` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidos_cotizacion_detalles
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_factura`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_factura`;
CREATE TABLE `pedidos_factura` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_depto` int DEFAULT NULL,
  `Id_mpio` int DEFAULT NULL,
  `Contrato` int DEFAULT NULL,
  `Observaciones` text COLLATE utf32_spanish2_ci,
  `Nro_Factura` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaCreacion` datetime NOT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of pedidos_factura
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_factura_nota_credito`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_factura_nota_credito`;
CREATE TABLE `pedidos_factura_nota_credito` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Factura` int DEFAULT NULL,
  `Material` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio` double(10,2) DEFAULT NULL,
  `Nro_Orden_Credito` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaCreacion` datetime NOT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of pedidos_factura_nota_credito
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_factura_orden_pedidos`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_factura_orden_pedidos`;
CREATE TABLE `pedidos_factura_orden_pedidos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Factura` int DEFAULT NULL COMMENT 'viene de la tabla pedidos_factura',
  `NumeroOrdenPedido` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `MontoOrden` double(20,2) DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaCreacion` datetime NOT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of pedidos_factura_orden_pedidos
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_orden_pedido`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_orden_pedido`;
CREATE TABLE `pedidos_orden_pedido` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Depto` int DEFAULT NULL,
  `Id_Mpio` int DEFAULT NULL,
  `Numero_Orden_Pedido` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Id_Contrato` int DEFAULT NULL,
  `Id_EstadoOrdenPedido` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT '1',
  `Observaciones` text COLLATE utf8mb4_spanish_ci,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidos_orden_pedido
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_orden_pedidos_materiales`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_orden_pedidos_materiales`;
CREATE TABLE `pedidos_orden_pedidos_materiales` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Orden_Pedido` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Material` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IdProveedor` int DEFAULT NULL,
  `Precio` float(10,2) DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidos_orden_pedidos_materiales
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_orden_pedidos_reportados`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_orden_pedidos_reportados`;
CREATE TABLE `pedidos_orden_pedidos_reportados` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Material` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Numero_Orden_Pedido` varchar(55) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Motivo` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `Estado` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of pedidos_orden_pedidos_reportados
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_orden_pedido_cotizacion`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_orden_pedido_cotizacion`;
CREATE TABLE `pedidos_orden_pedido_cotizacion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Orden_Pedido` int DEFAULT NULL,
  `Numero_Cotizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of pedidos_orden_pedido_cotizacion
-- ----------------------------

-- ----------------------------
-- Table structure for `proveedor`
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Nit` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Direccion` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Mpio` int DEFAULT NULL,
  `Depto` int DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaCreacion` datetime NOT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES ('1', 'CEMENTOS ARGOS SA ', '890100251 ', 'VIA 40 LAS FLORES', '126', '2', '3232540144', '1', 'PAULA.GARCIA', '2023-09-04 23:21:22', 'PAULA.GARCIA', '2023-09-04 23:21:22');

-- ----------------------------
-- Table structure for `proveedor_precio`
-- ----------------------------
DROP TABLE IF EXISTS `proveedor_precio`;
CREATE TABLE `proveedor_precio` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Elemento` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IdProveedor` int DEFAULT NULL,
  `Unidad` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaCambioPrecio` date DEFAULT NULL,
  `mpio` int DEFAULT NULL,
  `depto` int DEFAULT NULL,
  `Precio` float(20,4) DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of proveedor_precio
-- ----------------------------
INSERT INTO `proveedor_precio` VALUES ('1', 'CEMENTO GRIS', '1', 'SACO', '2023-09-04', '126', '2', '33629.0000', '1', '2023-09-04 23:22:50', '2023-09-04 23:22:50', 'PAULA.GARCIA', 'PAULA.GARCIA');

-- ----------------------------
-- Table structure for `trans_clientes`
-- ----------------------------
DROP TABLE IF EXISTS `trans_clientes`;
CREATE TABLE `trans_clientes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Identificacion` int DEFAULT NULL,
  `Id_area` int DEFAULT NULL,
  `Correo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Direccion` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Barrio` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of trans_clientes
-- ----------------------------
INSERT INTO `trans_clientes` VALUES ('1', 'ADARVE PALACIO  LUZ MARINA', '43590969', '8', 'luz.adarve@viva.gov.co', '2949211', 'Calle 32 EE 80 - 3 Apto 602 ', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('2', 'AGUDELO BARRENECHE YULI BIBIANA', '43917660', '1', 'yuli.agudelo@viva.gov.co', '3117901906', 'Calle 16 71-59', 'Belen las playas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('3', 'AGUDELO DAVILA WILLMAR DARIO', '98663128', '7', 'wilmar.agudelo@viva.gov.co', '4672292', 'Carrera 67 No 108-16', 'Cabañitas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('4', 'AGUILAR ARANGO ESTEFANIA', '1020484064', '5', 'estefania.aguilar@viva.gov.co', '3122055944', 'Calle 21 71-35', 'Paris', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('5', 'AGUIRRE AGUIRRE CRISTIAN CAMILO', '1216713630', '4', 'cristian.aguirre@viva.gov.co', '3058967527', 'Cra 89 92 C 119 INT 331 ', 'Robledo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('6', 'ALVAREZ MANCO CARLOS FELIPE', '1036613182', '6', 'carlos.alvarez@viva.gov.co', '3219499597', 'Calle 9 B sur 79 A 101 Apto 1009', 'Rodeo Alto', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('7', 'ALVAREZ  RAMIREZ PAOLA ANDREA', '44007552', '5', 'paola.alvarez@viva.gov.co', '3137061527', 'Calle 21 cc 41 c 99 interior 301', 'santarita', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('8', 'ALVAREZ ORTIZ CATHERINE', '43996640', '8', 'catherine.alvarez@viva.gov.co', '3128362945', 'Calle 57 69-27 apto 262', 'Trapiche', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('9', 'ALVAREZ RAMIREZ JHON ALEXANDER', '1053860910', '7', 'jhon.alvarez@viva.gov.co', '3155073990', 'Calle 64 47-14', 'Simon Bolivar', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('10', 'ALZATE FRANCO DIANA MARIA', '30239992', '6', 'diana.alzate@viva.gov.co', '3206652603', 'Cra 67 B 48 A 06', 'Laureles-Estadio', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('11', 'ARANGO BEDOYA EDUARDO', '1128283425', '4', 'subregionsuroeste@viva.gov.co', '3005058901', 'Cl 35 85 C 14', 'Santa Teresita', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('12', 'ARANGO DIEZ CARLOS ENRIQUE', '98673124', '5', 'carlos.arango@viva.gov.co', '3135708095', 'Cra 55 30 B 2 ', 'Florida Bello', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('13', 'ARANGO MESA LAURA MILENA', '1039460734', '6', 'laura.arango@viva.gov.co', '3206360538', 'Cra 25 A 40 F SUR 159', 'La mina', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('14', 'ARENAS LONDOÑO DIEGO ARMANDO', '1039450413', '6', 'ingenieroapoyo1@viva.gov.co', '3007407410', 'Calle 67 sur 45-62 interior 212', 'Santa Ana', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('15', 'ARIAS BOTERO JUAN PABLO', '71798621', '5', 'juan.arias@viva.gov.co', '3147911158', 'Cra 38 26-385 B 5 Apto 9810', 'San Diego', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('16', 'ARIAS MORENO LAURA', '1040047028', '5', 'laura.arias@viva.gov.co', '3002941602', 'Cra 46 C Calle 80 Sur 155 Urb. Amonte Apto 2217', 'Sabaneta', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('17', 'ARISTIZABAL CHAVARRIAGA JUANITA', '1037653656', '2', 'juanita.aristizabal@viva.gov.co', '3176464755', 'Cra 34 76-sur 23 ', 'San Jose', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('18', 'ARISTIZABAL GIRALDO CLAUDIA MILENA', '43987559', '1', 'claudia.aristizabal@viva.gov.co', '3217800243', 'Cra 50 92-101', 'Aranjuez', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('19', 'AVENDAÑO ESCALANTE LAURA VANESA', '1039703701', '6', 'vanesa.avendano@viva.gov.co', '3217597928', 'Calle 81 86-44 Piso 1', 'Robledo el Diamante', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('20', 'AVENDAÑO PEREZ  ERICA JOHANNA', '43920792', '7', 'planeacion7@viva.gov.co', '4881411', 'Carrera 98 No 50 A 30 Apto 507 Unidad Girasoles', 'Calazans', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('21', 'AYALA RINCON ARTURO', '80213899', '1', 'arturo.ayala@viva.gov.co', '3138840469', 'KR 33 43 28', 'Buenos Aires', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('22', 'BAQUERO LANCHEROS  LUZ ANGELICA', '1121843006', '7', 'luz.baquero@viva.gov.co', '3145545347', 'Cra 76 # 95- 56', 'Robledo miramar', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('23', 'BEDOYA CORREA YENIFER DAYANA', '1216720993', '10', 'yenifer.bedoya@viva.gov.co', '3167555701', 'Cr 130 63-90 ', 'Corregimiento de san cristobal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('24', 'BEDOYA OSPINA ANA MARIA', '43259684', '1', 'ana.bedoya@viva.gov.co', '3103977773', 'Calle 30 #42A-21 Torre 2 Apt. 803', 'San Diego', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('25', 'BELLO MENA KEVIN JUSHEP', '1037645949', '5', 'kevin.bello@viva.gov.co', '3122186180', 'Cra 51 A 7 sur 107', 'Guayabal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('26', 'BELTRAN MONSALVE WALTER GUILLERMO', '98491882', '6', 'arquitectoviviendayhabitat4@viva.gov.co', '3122347387', 'CRA 49 # 45 - 48 INT 1401 CONDOMINIO SANTA CLARA,', 'Manchester', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('27', 'BENJUMEA  ZAPATA DIANA RAQUEL', '43158110', '5', 'diana.benjumea@viva.gov.co', '3521173', 'Calle 17, numero 37a - 80, urbanización providencia de castropol, apto 531', 'Castropol', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('28', 'BENJUMEA ROJAS SANTIAGO', '1128405057', '5', 'santiago.benjumea@viva.gov.co', '3003652298', 'Circular 5 # 66b - 58', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('29', 'BETANCUR AGUDELO ANGIE DAYANA', '1020105990', '7', 'angiedayana0119@gmail.com', '3016015040', 'Carrera 11 54-32 interior 104', 'caicedo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('30', 'BOHORQUEZ RODRIGUEZ CESAR EUGENIO', '13748901', '5', 'cesar.bohorquez@viva.gov.co', '3187345721', 'Calle 31 76-52 Apto 207', 'Belen Parque', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('31', 'BLANCO SAINT SORNY EUGENIA CATALINA', '43085542', '5', 'mandatogsp9@viva.gov.co', '3137670765', 'Calle 7 Sur 83 A 34 Apto 202 Colinass del Rodeo', 'Belen', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('32', 'BOLAÑOS RAMIREZ  LUIS EMILIO', '1067868191', '1', 'luis.bolanos@viva.gov.co', '3017891165', 'Carrera76 No 89 55', 'Castilla', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('33', 'BOTERO ARBOLEDA ALEXANDER DE JESUS', '1036621634', '6', 'viviendayhabitat15@viva.gov.co', '3128905870', 'Calle 9 B sur 79- A 101 Apto 709', 'Belen Rodeo Alto', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('34', 'BOTERO GARCIA JUAN CAMILO', '70879516', '1', 'camilo.botero@viva.gov.co', '3105187103', 'Cra 54 A 75 SUR 13 INT 1205', 'Portal de la Estrella', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('35', 'BOTERO VARELA ANA MARIA', '1238938070', '5', 'ana.botero@viva.gov.co', '3017913001', 'Cra 82 32 EE 48', 'La castellena', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('36', 'BOTERO VELASQUEZ JUAN CARLOS', '9726714', '4', 'subregionoccidente@viva.gov.co', '3108411284', 'Cra 38 A 26-343', 'San Diego', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('37', 'BOTERO YEPES JUAN ESTEBAN', '1037665080', '2', 'juan.botero@viva.gov.co', '3341128', 'Calle 47A Sur N°40A-48', 'Trianon', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('38', 'BRICEÑO DE LOS RIOS SEBASTIAN', '1152450144', '5', 'sebastian.briceno@viva.gov.co', '3174358802', 'Calle 14 40 B 12 ', 'Castropol', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('39', 'BUITRAGO LOAIZA YURY ANDREA', '1040040933', '7', 'yury.buitrago@viva.gov.co', '3006740685', 'Calle 43 78-23 ', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('40', 'BUSTOS OCAMPO MOISES', '1010011566', '7', 'moises.bustos@viva.gov.co', '3226874624', 'Calle 77 Sur 46-54 Edificio la sabana Apto 1206', 'Calle Larga', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('41', 'CABALLERO MUNERA ANA LUCIA', '43152479', '4', 'ana.caballero@viva.gov.co', '3002746408', 'Carrera 63 B # 73 SUR 126 Apto 2021 ', 'La Estrella', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('42', 'CANO MARIN JOSE IGNACIO', '98549999', '2', 'jose.cano@viva.gov.co', '3007695591', 'Cra 93 N. 44- 55', 'La America', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('43', 'CADAVID CARDONA MARIA ALEJANDRA', '1017266299', '5', 'maria.cadavid@viva.gov.co', '3003464421', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('44', 'CADAVID VERGARA NORA  HELENA', '43521928', '5', 'nora.cadavid@viva.gov.co', '3218928073', 'Calle 48F Sur # 40-55 ', 'Señorial', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('45', 'CANO DIOSA JULIAN ESTEBAN', '1017181503', '5', 'julian.cano@viva.gov.co', '3004418096', 'Cra 34 100-01', 'San Pablo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('46', 'CANO VALLEJO  NATALIA', '32109200', '7', 'natalia.cano@viva.gov.co', '3636228', 'Carrera 33 No 27 A 91 apto 1008', 'Citte', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('47', 'CANTILLO RAMIREZ LUIS  JAVIER', '11810423', '5', 'luis.cantillo@viva.gov.co', '3057548460', 'Cra 37 54-35', 'Boston', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('48', 'CARDENAS  RAMIREZ MARIA PATRICIA', '42893887', '3', 'maria.cardenas@viva.gov.co', '3053554120', 'Carrera 56 # 4-78', 'Campo Amor', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('49', 'CARDENAS ARANGO ENGIE YURANNI', '1036635130', '1', 'secretariagerencia@viva.gov.co', '3015582233', 'Cra 58 77-50 Torre 1 Apto  120 Urbanizacion Laureles del sur', 'Urbanizacion Laureles del sur', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('50', 'CARDENAS LONDOÑO ALEXANDER', '71764661', '5', 'alexander.cardenas@viva.gov.co', '3117697848', 'CALLE48BB # 85A17', 'La Floresta', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('51', 'CARDONA OSORIO BRAYHAN', '1037621863', '5', 'subregionuraba@viva.gov.co', '3136050041', 'Cra 55 # 10BS17', 'Medellin', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('52', 'CARDONA RESTREPO PAOLA ANDREA', '43613444', '1', 'paola.cardona@viva.gov.co', '3195031850', 'CRA 88 No. 31 E 35 ', 'Belen Las Mercedes', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('53', 'CARDONA SALAZAR JAIRO ANDRES', '15443447', '6', 'jairo.cardona@viva.gov.co', '3113416828', 'Calle 74 73-47 Int 802', 'Robledo Pilarica', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('54', 'CARDONA VALENCIA JAIME ALBERTO', '1037591621', '5', 'jaime.cardona@viva.gov.co', '3117693981', 'Crr 31  19 445', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('55', 'CARDONA VALENCIA JUAN DIEGO', '71333492', '5', 'diego.cardona@viva.gov.co', '3012428163', 'Cra 36 47-05 ', 'Buenos Aires', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('56', 'CARDONA MARIA PAULINA', '1037120590', '1', 'maria.cardona@viva.gov.co', '3107128047', 'Calle 8 Cra 84 F 190', 'Belen Loma de los Bernal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('57', 'CARMONA HOYOS YULIANA', '1035851561', '4', 'yuliana.carmona@viva.gov.co', '3136200720', 'Cra 9 10 C 98 INT 105 Torre 7 ', 'Santa Ana ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('58', 'CARVAJAL PUERTA CARLOS FELIPE', '1214747929', '1', 'carlos.carvajal@viva.gov.co', '4891761', 'calle 100 B sur 51-24 apto 302', 'Unidos la Tablaza', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('59', 'CARVAJAL SEPULVEDA  ISABEL CRISTINA', '43063332', '6', 'isabel.carvajal@viva.gov.co', '3126575', 'Carrera 39  # 5 A 20', 'El Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('60', 'CARVAJAL VILLADA DANIELA', '1017182801', '10', 'administrativa8@viva.gov.co', '3872459', 'Cra 87 # 37- 84 Apto 501 ', 'Santa Monica', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('61', 'CASTELLANOS GONZALEZ PAOLA ANDREA', '1110488862', '5', 'paola.castellanos@viva.gov.co', '3182571732', 'Cra 43 A 16 B 50  Apto 810', 'Castropol', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('62', 'CASTRILLON ARIAS JEISSON STEVEN', '1193582333', '7', 'jeisson.castrillon@viva.gov.co', '3004478434', 'calle 95 No 65- 52 apto 201', 'Castilla', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('63', 'CASTRILLON GRISALES NORA MARIA', '43741107', '6', 'operaciones4@viva.gov.co', '3053785054', 'Cll 36 B sur 77-41 Santa Maria de los ANGELES TORRE 8 Apto 502', 'San Antonio de Prado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('64', 'CEBALLOS ROMERO ELVER MAURICIO', '1017239429', '5', 'elver.ceballos@viva.gov.co', '3045555817', 'Calle 54 81-48 Apto 802 ', 'Calasanz', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('65', 'COLORADO CORTÉS JESSICA', '1020458387', '2', 'jessica.colorado@viva.gov.co', '5378828', 'Diagonal 57 N°45-100', 'Bello', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('66', 'CHAVARRO CARVAJAL LINA CONSTANZA', '55061818', '7', 'lina.chavarro@viva.gov.co', '3112774171', 'Cra 38 26-385  ', 'San Diego', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('67', 'CORRALES ORTIZ ELIZABETH', '43268502', '5', 'tecnicosplaneacion@viva.gov.co', '3016098647', 'Calle 57 69-27', 'Boyaca las Brisas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('68', 'CORREA ECHEVERRI MARGARITA ROSA', '43723205', '8', 'juridica6@viva.gov.co', '3137083703', 'Calle 27 A SUR 46 N. 47-55 APTO 1314', 'Envigado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('69', 'CORREA MENESES ISABEL', '1152715704', '5', 'isabel.correa@viva.gov.co', '3246361416', 'Cra 65 A 93-05', 'Castilla', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('70', 'CORTÉS ARIAS CARLOS ALBERTO', '71745140', '6', 'carlos.cortes@viva.gov.co', '3206870617', 'Carrera 27 DD Sur 44 Inteerior 506', 'La Inmaculada', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('71', 'CORTES MOLINA LUIS FERNANDO', '98569993', '6', 'luis.cortes@viva.gov.co', '2885079', 'Carrera 13  No 27-67 Urbanizacion Manzanares 1 casa 149 ', 'Urbanizacion manzanares', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('72', 'CUARTAS RAMIREZ HERGIDIA DEL SOCORRO', '43045146', '1', 'hergidia.cuartas@viva.gov.co', '3282106', 'Carrera 45 No 65 Sur 51 Apto 310 Montesur II', 'Urbanizacion Montesur II', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('73', 'CUARTAS RAMIREZ SANTIAGO', '1017208611', '5', 'santiago.cuartas@viva.gov.co', '3195284303', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('74', 'DAVID RESTREPO ANGELA CRISTINA', '43287298', '6', 'angela.david@viva.gov.co', '3533760', 'Calle 31 76-52 Apto 302', 'Belen Parque', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('75', 'DE OSSA GARCIA VALENTINA', '1026157545', '5', 'valentina.deossa@viva.gov.co', '3213435665', 'Cra 50 Cll 137 A sur 15 Apto 505 ', 'Crito Rey', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('76', 'DE VARGAS CABARCAS IVAN DARIO', '72202130', '6', 'ivan.devargas@viva.gov.co', '3242788219', 'Calle 40 59 CC 02', 'Serramonte', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('77', 'DELVASTO MACHADO DANIEL LEONARDO', '1121715567', '6', 'daniel.delvasto@viva.gov.co', '3185229616', 'Calle 28 84-195 Unidad Mirador de los Alpes', 'Belen los Alpes', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('78', 'DIAZ GALVIS NATALIA', '1037596006', '7', 'natalia.diaz@viva.gov.co', '3218123305', 'Cra 74 A 27-60', 'Belen Granada', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('79', 'DIAZ GRANADOS CONSTANZA', '1017124799', '1', 'constanza.diaz@viva.gov.co', '5784477', 'Cra 88 # 31E - 35 Apto 808 - Urbanización Cristales', 'Belén las Mercedes', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('80', 'DIAZ MOLINA ORLANDO', '98548496', '1', 'orlando.diaz@viva.gov.co', '3118931959', 'Autopista Medellin Bogota Kilometro 17 + 300 Altos de la Molina Lote 63 ', 'Vereda Nomedal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('81', 'DUQUE FRANCO SANDRA  LILIANA', '39447360', '1', 'sandra.duque@viva.gov.co', '3246800022', 'Calle 52 64-39 BL61 APTO 401 ', 'Carlos E Restrepo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('82', 'DURAN DUQUE LUIS ROBERTO', '71336375', '1', 'luis.duran@viva.gov.co', '5709021', 'Carrera 37A N 1 Sur 41 apto 302', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('83', 'DURANGO SANCHEZ CARLOS ALEJANDRO', '8127764', '4', 'arquitectoplaneacion12@viva.gov.co', '3007125872', 'Carrera 73 # C2-31 apto 703', 'Suramericana', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('84', 'ECHAVARRIA ECHAVARRIA CARLOS MARIO', '71776291', '7', 'carlos.echavarria@viva.gov.co', '3127979903', 'Cra 78 B 3-25 ', 'Belen Rincon', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('85', 'ECHEVERRI BEDOYA ELIANA YANETH', '39200652', '1', 'eliana.echeverri@viva.gov.co', '3127411043', 'Calle 45 A sur 39 B22 apto 1008', 'Las antillas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('86', 'ECHEVERRI CORREA ARIEL EDUARDO', '98524441', '7', 'ariel.echeverri@viva.gov.co', '3212974489', 'CARRERA 50A N° 22-50', 'Itagui', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('87', 'ESTRADA MESA DIANA LUCIA', '1018343908', '8', 'diana.estrada@viva.gov.co', '3145666589', 'Cra 63 C 42 B 27 Apto 202 Edificio conquistadores del rio', 'Conquistadores', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('88', 'FLOREZ GUTIERREZ SOFIA', '1020477149', '1', 'sofia.florez@viva.gov.co', '3045206305', 'Calle 24 53-59', 'Cabañitas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('89', 'GALEANO GARCES SANTIAGO', '1017231637', '6', 'santiago.galeano@viva.gov.co', '3183580602', 'Cra 81 C 49 F 50', 'Calasanz', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('90', 'GALLEGO RESTREPO CARLOS FELIPE', '15443567', '5', 'carlos.gallego@viva.gov.co', '3017062423', 'Cra 51 44-53 Apto 301', 'San Francisco', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('91', 'GALLO DUQUE DIANA FERNANDA', '1017133422', '5', 'diana.gallo@viva.gov.co', '3137313963', 'Cra 40 48-50 Apto 517 Torre 3', 'Mojon', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('92', 'GARCES NOREÑA JOHAN ESTIVEN', '1216725199', '5', 'johan.garces@viva.gov.co', '3004723342', 'Calle 64 BC # 105 A 99  Interior 9902', 'Nuevo Occidente(san cristobal) ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('93', 'GARCÉS TORRES LUIS GABRIEL', '79781735', '5', 'centralpark2@viva.gov.co', '3044223573', 'Calle 111 66 09 Piso 3', 'Boyaca', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('94', 'GARCIA BEDOYA  PAULA ANDREA', '43455172', '1', 'paula.garcia@viva.gov.co', '2532734', 'CALLE 48 C # 95 - 52', 'La Floresta', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('95', 'GARCIA CORTES SERGIO  LUCAS', '1017159879', '5', 'sergio.lucas@viva.gov.co', '3176473885', 'Calle 7 No 36 90', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('96', 'GARCIA HERNANDEZ KELLY YULIETH', '1035388646', '7', 'kelly.garcia@viva.gov.co', '3124240242', 'CLL 51 47-57', 'Sector Bello', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('97', 'GARCIA RODRIGUEZ JUAN ESTEBAN', '1020415363', '5', 'juan.garcia@viva.gov.co', '3164526800', 'Calle 117 67 B 57', 'Las Brisas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('98', 'GARCIA URAN GUSTAVO HUMBERTO', '1128428278', '4', 'gustavo.garcia@viva.gov.co', '3507796282', 'Cra 50 86-22', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('99', 'GAVIRIA ORTIZ FABIO NELSON', '15388288', '5', 'fabio.gaviria@viva.gov.co', '3105992016', 'Calle 76 80-85 apto 410 UNIDAD RESIDENCIAL DOÑA MARIA ROBLEDO', 'Pilarica', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('100', 'GIL CASTAÑO OSCAR MAURICIO', '71378536', '5', 'oscar.gil@viva.gov.co', '5089435', 'Calle 98 sur # 79 A 221 TORRE 2 Apto 107', 'Rodeo Alto(Belen)', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('101', 'GIRALDO RODRIGUEZ MARIA ALEXANDRA', '1128448010', '4', 'maria.giraldo@viva.gov.co', '3217470750', 'Calle 94 D 83 D 04', 'Miramar', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('102', 'GOEZ RUEDA MARYSOL', '1214718853', '7', 'marysol.goez@viva.gov.co', '3003726236', 'Calle 35d N. 108 B-53', 'Belencito villa laura', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('103', 'GOMEZ ACEVEDO MARICELA', '1044509308', '5', 'maricela.gomez@viva.gov.co', '3114117376', 'Dg 54 N. 44-15', 'Panamericana ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('104', 'GÓMEZ ARISTIZÁBAL GUSTAVO ADOLFO', '70384854', '6', 'gustavo.gomez@viva.gov.co', '3105153887', 'Calle 3A sur No. 75DA-30', 'Belén - La Mota', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('105', 'GOMEZ CARDONA WILLIAM', '15371797', '6', 'william.gomez@viva.gov.co', '3013367863', 'Calle 49 40-44 Apto 1005', 'Boston', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('106', 'GOMEZ MIRA PAULO CESAR', '98668148', '5', 'paulo.gomez@viva.gov.co', '3116388954', 'Cra 46 C 44 sur 100 Apto 501 ', 'Milan', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('107', 'GÓMEZ RUIZ JUAN FELIPE', '71334637', '2', 'controlinterno2@viva.gov.co', '3137490391', 'Carrera 44 # 19A - 20 Apto 724', 'ciudad del rio', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('108', 'GONZALEZ CADAVID MARIA CAMILA', '1017255032', '1', 'administrativa12@viva.gov.co', '3196922763', 'Clle 8 84 F 25 Apto 617', 'Belen Loma de los Bernal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('109', 'GONZALEZ MARIN MARIA ALEJANDRA', '1017209412', '4', 'maria.gonzalez@viva.gov.co', '3003439804', 'Cra 49 # 92-99', 'Aranjuez', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('110', 'GONZALEZ RESTREPO EVELIN YURANI', '1128460077', '7', 'evelin.gonzalez@viva.gov.co', '3206609260', 'Cra 60 Cll 75 aa sur 75', 'Toledo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('111', 'GONZALEZ OSORNO ANA MARIA', '43541657', '2', 'ana.gonzalez@viva.gov.co', '3242888330', 'Calle 70 A 44- 20 ', 'Manrrique central', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('112', 'GUERRA CARO JUAN JOSE', '1152222122', '1', 'juan.guerra@viva.gov.co', '3213006078', 'Calle 106 sur 50-76', 'La Umbria', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('113', 'GRANADOS RENDON  JHOJANNA', '43117882', '7', 'jhojanna.granados@viva.gov.co', '4177182', 'Carrera 56 C No 83 DD Sur 52 Apto 1605', 'Conjunto Natural Aquavento', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('114', 'GRATTZ LOZANO MILENA EFIGENIA', '52265902', '1', 'milena.grattz@viva.gov.co', '3142550408', 'Diagonal 4 B 31-20 T 8 APTO 832', 'Las Villas/zipaquira', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('115', 'GUTIERREZ ARROYAVE ANGELICA MARIA', '1035913772', '1', 'recepcion@viva.gov.co', '3044720465', 'Cra 74 112-07', 'Florencia', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('116', 'GUTIERREZ HERNANDEZ ERICA MARCELA', '1017188020', '1', 'erica.gutierrez@viva.gov.co', '3206699343', 'Cra 51 93-73 int 201', 'Aranjuez', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('117', 'GUTIERREZ RAMIREZ ADRIANA MILENA', '39176314', '6', 'adriana.gutierrez@viva.gov.co', '3127249067', 'Calle 73 73 A 60 Ed.Avenida del cerro', 'Robledo Pilarica', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('118', 'GUTIERREZ SERNA HISLENIA  MELISSA', '1128443705', '6', 'melissa.gutierrez@viva.gov.co', '3188833741', 'Calle 104 68 A 103 INT 301', 'Gurardot', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('119', 'HENAO QUINTERO MONICA MILENA', '43105663', '6', 'monica.henao@viva.gov.co', '3206628538', 'Cra 59 DD 40-12 ', 'Cerro Monte', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('120', 'HERNANDEZ PARRA DAVID ALBERTO', '1017167802', '4', 'david.hernandez@viva.gov.co', '3117588308', 'Cra 84 34 A 31', 'Simon Bolivar', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('121', 'HERNANDEZ MANRIQUE GLORIA ESTELA', '43803489', '4', 'gloria.hernandez@viva.gov.co', '3043684684', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('122', 'HERRERA CADAVID SEBASTIAN', '1035424362', '1', 'mandatossj4@viva.gov.co', '3243101', 'Cra 59 70-125 Apto 518', 'Santa Maria', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('123', 'HERRERA GOMEZ LORENA VIVIANA', '30235550', '6', 'lorena.herrera@viva.gov.co', '3013562267', 'Calle 9 Sur 79 C 151 Apto 907', 'Mirador de Arboleda', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('124', 'HOLGUIN HIDALGO NATALIA ANDREA', '32297003', '8', 'natalia.holguin@viva.gov.co', '3014049398', 'Calle 23 sur 4-85 casa 49 ', 'Alto de las palmas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('125', 'HIGUITA GAVIRIA LISA DANIELA', '1020450796', '7', '', '3218383813', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('126', 'HOLGUIN MARTINEZ VALENTINA', '1035872623', '5', 'valentina.holguin@viva.gov.co', '3012460091', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('127', 'HOYOS CORREA ALEJANDRA', '1128281765', '4', 'alejandra.hoyos@viva.gov.co', '3104197425', 'Calle 6 # 32 61', 'La Florida', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('128', 'HURTADO GUTIERREZ ASTRID', '1060267022', '8', 'astrid.hurtado@viva.gov.co', '3117585895', 'Diagonal 79 # 9-51 interior 513 bloque 4', 'Belen Loma de los Bernal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('129', 'HURTADO OCAMPO DANIELA', '1020465939', '7', 'daniela.hurtado@viva.gov.co', '321576413', 'Calle 37 55-22 Int 101', 'San jose obreo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('130', 'JAIMES FONSECA JORGE ENRIQUE', '88262754', '6', 'jorge.jaimes@viva.gov.co', '3187897220', 'Conjunto Nativa torre 1 Apto 1104 ', 'Cimarronas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('131', 'JARAMILLO PEREZ LAURA', '1128455922', '5', 'laura.jaramillo@viva.gov.co', '3206589964', 'Cara 45 26-162 Int 1618', 'Madera', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('132', 'JIMENEZ ORREGO CRISTIAN ALBERTO', '1001228204', '7', 'cristian.jimenez@viva.gov.co', '3043465261', 'Cl 93 A 37-63 INTERIOR 202', 'Manrique la Salle', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('133', 'LEGUIZAMON VARGAS DIANA PAOLA', '1050170482', '1', 'diana .leguizamon@viva.gov.co', '3186108417', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('134', 'LOAIZA CARVAJAL MARIA CAMILA', '1000415005', '1', 'maria.loaiza@viva.gov.co', '3242516464', 'Cra 96 c 49-57', 'Floresta pradera', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('135', 'LOAIZA PIEDRAHITA DANIELA', '1039459674', '6', 'mandatogsp6@viva.gov.co', '3153749889', 'Calle 75 sur 45-143 int 401', 'Calle Larga', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('136', 'LOAIZA ROMAN LEONARDO', '1017247452', '6', 'leonardo.loaiza@viva.gov.co', '3502990968', 'CALLE 78B N° 75-209 INT 202', 'ROBLEDO (ALTAMIRA)', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('137', 'LONDOÑO HERRERA EDISON DARIO', '71225660', '5', 'arquitectomandato3@viva.gov.co', '5504367', 'Calle 35  B 86-52 APTO 501 ', 'Simon Bolivar', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('138', 'LOPERA ZAPATA  ELIZABETH', '1037601055', '7', 'elizabeth.lopera@viva.gov.co', '5971006', 'Cra 24B Calle 40 A Sur 52 Palmeras 2 Apto 1406 torre 9 ', 'Envigado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('139', 'LOPEZ LOPEZ SANTIAGO', '1128458507', '5', 'santiago.lopez@viva.gov.co', '3217248498', 'Calle 29 54 B 27', 'LaFinca', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('140', 'LOPEZ MENA EIDA MERY', '1017130796', '7', 'eida.lopez@viva.gov.co', '3005207420', 'Cra 80 B 32 D 26', 'Laureles Nogal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('141', 'LOPEZ SUAREZ DIEGO', '71381710', '7', 'diego.lopez@viva.gov.co', '3013370705', 'Calle 42 74-39 Apto 702 Edificio Lauredal 1 ', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('142', 'LOPEZ VAHOS LUZ EDILIA', '43481997', '7', 'luz.lopez@viva.gov.co', '3148330345', 'calle 49 E 83 A 200 sol creciente Apto 1815', 'Clazans', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('143', 'LOZANO GIRALDO WILLIAM FRANCISCO', '1038405033', '6', 'william.lozano@viva.gov.co', '3222345149', 'Diagonal 75 C 2 A 146', 'Belen la Mota', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('144', 'LUENGAS BERNAL CAMILO ANDRES', '1032444620', '5', 'camilo.luengas@viva.gov.co', '3124453071', 'Calle 77 B 120 A 45 Torre 1 Apto 104', 'Gran Granada', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('145', 'LUNA GUERRA ANGELA MARIA', '36753876', '4', 'angela.luna@viva.gov.co', '3432726', 'Circular 2 # 66 B 125 Apto 702', 'San Joaquin', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('146', 'MANCO MANCO NATALIA ANDREA', '1017203116', '6', 'natalia.manco@viva.gov.co', '3043860166', 'Calle 20 FF 81 A 125', 'Paris los Sauces', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('147', 'MARIN DURANGO JEISSON HERNAN', '71526959', '5', 'jeisson.marin@viva.gov.co', '3005006264', 'Calle 10 A 9-53', 'Santa Ana', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('148', 'MÁRQUEZ ATEHORTÚA SANTIAGO', '1152462521', '5', 'santiago.marquez@viva.gov.co', '3215560712', 'Calle 34 78 A 111', 'Las Acacias ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('149', 'MARTINEZ CAMACHO LINA MARCELA', '43159618', '7', 'lina.martinez@viva.gov.co', '3215905125', 'calle 75 70-163 apto 301', 'Robledo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('150', 'MARTINEZ RESTREPO TATIANA SORELLY', '43108237', '7', 'tatiana.martinez@viva.gov.co', '3506838355', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('151', 'MAYA CANO JULIAN ESTEBAN', '1037582306', '6', 'julian.maya@viva.gov.co', '3054531317', 'Cra 81 47A 39', 'La Floresta', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('152', 'MAYA GUTIERREZ TATIANA ANDREA', '32244489', '7', 'tatiana.maya@viva.gov.co', '3233455871', 'Cra 39 40 B SUR 176 Urbanizacion suramerica manzana 1 apto 206', 'El Dorado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('153', 'MEDINA CANO REY JOSE', '1017125808', '5', 'rey.medina@viva.gov.co', '3504821004', 'Dg 43 34 E 20', 'Alcala', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('154', 'MEDINA PELAEZ LUZ TATIANA', '43585921', '6', 'luz.medina@viva.gov.co', '3002389950', 'Cr 63 AA N. 42-90 Apto 904', 'Conquistadores', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('155', 'MEJIA GARZON KARENN ANDREA', '43258136', '5', 'arquitectoplaneacion6@viva.gov.co', '3215195539', 'Circular 4 #72-50 apto 401', 'laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('156', 'MEJIA ROMAN  MELISSA MARIA', '39175758', '8', 'melissa.mejia@viva.gov.co', '2975902', 'Calle 47 D 83-33 Apto 803', 'La Floresta', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('157', 'MESA GALEANO  MARLEN ARLETTY', '1036602069', '8', 'marlen.mesa@viva.gov.co', '3127323706', 'Carrera 48 # 76 D Sur 34 Apto 1615', 'Calle Larga', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('158', 'MESA RESTREPO JOSE MAURICIO', '3438711', '6', 'jose.mesa@viva.gov.co', '3108921886', 'CALLE 20 SUR # 38 - 40 APTO 202', 'Envigado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('159', 'MOLINA GARCIA ESTEFANIA', '1020463820', '7', 'estefania.molina@viva.gov.co', '3007651335', 'calle 65 f numero 91 A 49 interior (202)', 'Robledo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('160', 'MONROY LUNA LUIS FERNANDO', '80110067', '5', 'luis.monroy@viva.gov.co', '3112190695', 'Circular 73 B 38-35 Apto 501 Edificio Alamos del parque ', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('161', 'MONTOYA ACEVEDO  ESNEYDER', '1036616181', '8', 'juridica3@viva.gov.co', '3015910269', 'Cra 41 No. 60A-28 int. 302', 'Los Ángeles ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('162', 'MONTOYA CASTRO ANA LUCIA', '32256052', '8', 'juridica8@viva.gov.co', '3104144080', 'Calle 42  # 69- 65 Apto 201 Edificio Isabela', 'San Joaquin', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('163', 'MONTOYA HERNANDEZ MARIA MANUELA ', '1039473714', '5', 'manuela.montoya@viva.gov.co', '3226925400', 'Cra 43 A Calle 55 sur 47', 'Virgen del carmen', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('164', 'MONTOYA JARAMILLO ALBA ROSA', '43572248', '1', 'administrativa7@viva.gov.co', '5944064', 'calle 26 71-50', 'Belen San Bernardo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('165', 'MONTOYA MARIA DEL ROSARIO', '42896760', '1', 'maria.montoya@viva.gov.co', '3166414693', 'Calle 14 N. 43 F 25', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('166', 'MONTOYA VILLA ROBINSON ANDRES', '1027884368', '5', 'robinson.montoya@viva.gov.co', '3147350407', 'Cra 52 82 C 10', 'Aranjuez', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('167', 'MORALES DURANGO DANIEL', '1040367887', '1', 'daniel.morales@viva.gov.co', '3176988248', 'Calle 36 88-30 int 301', 'Barrio Cristobal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('168', 'MORALES LOAIZA DAYANA ANDREA', '1020461129', '6', 'dayana.morales@viva.gov.co', '3016776508', 'Avenida 48 B N. 65-142', 'Niquia Camacol', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('169', 'MORALES MONTES LUZ ADRIANA', '32105801', '6', 'luz.morales@viva.gov.co', '3015968391', 'Cra  84 F 3 D 150 Apto 626 torre 6 AVIVA  AFINITY', 'Loma de los Bernal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('170', 'MORENO CASTAÑO SANDRA LILIANA', '1114209101', '10', 'sandra.moreno@viva.gov.co', '3162680262', 'Calle 34 c 82 A 23', 'Laureles la castellana', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('171', 'MORENO PARDO  MARIA ISABEL', '1017192677', '1', 'maria.moreno@viva.gov.co', '3113589899', 'Cra 85 # 65 A 47', 'Robledo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('172', 'MORENO RENTERIA SINDY MARCELA', '1017185533', '6', 'sindy.moreno@viva.gov.co', '3146466478', 'Cra 71 20 E 25 INT 105', 'Paris', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('173', 'MORILLO RODRIGUEZ MARIA ALEJANDRA', '1085905806', '4', 'maria.morillo@viva.gov.co', '3187692827', 'Cra 72 44-40 Torre Florida', 'Florida Nueva', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('174', 'MOSQUERA BONILLA GISELA', '1214725180', '5', 'gisela.mosquera@viva,gov,co', '3135629941', 'Calle 63 B 105- 217', 'Ciudadela Nuevo Occidente', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('175', 'MOSQUERA CORDOBA PLINIO ISIDRO', '1077458492', '5', 'plinio.mosquera@viva.gov.co', '3207786657', 'Cra 25 75 C 1 ', 'La Gran Avenida', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('176', 'MOSQUERA MORENO JUAN FERNANDO', '1000401093', '1', 'juan.mosquera@viva.gov.co', '3023683745', 'Calle 57  90-80', 'Mirador de calasanz', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('177', 'MUNERA JARAMILLO SEBASTIAN MENUHIN', '8027086', '3', 'sebastian.munera@viva.gov.co', '3173453211', 'Cra 79 AA  1 A Sur 280 Casa 136 vivienda de oeste 2', 'Belen Rincon', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('178', 'MUÑOZ ACEVEDO ALVARO', '71644123', '5', 'operaciones2@viva.gov.co', '3346636', 'Carrera 29 A 7B 50', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('179', 'MUÑOZ MANCERA ROLANDO', '1037596307', '6', 'rolando.munoz@viva.gov.co', '3014338591', 'Calle 44 sur 47-18', 'Milan Vallejuelos', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('180', 'NARANJO ACEVEDO YOHANA MARITZA', '1047968003', '8', 'yohana.naranjo@viva.gov.co', '3225722985', 'Carrera 39 # 45-45 Apto 201', 'La esmeralda', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('181', 'NARANJO GONZALEZ LINA MARCELA', '1037948273', '1', 'lina.naranjo@viva.gov.co', '3108994080', 'Cra 47 A 6 AB 30', 'Buenos Aires', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('182', 'NOREÑA RAMIREZ LEIDY MARIA', '43920918', '7', 'recepcionpiso1@viva.gov.co', '3102886534', 'Cl 57 cr 68 C ', 'Valadares', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('183', 'OLIVERO  AMELL  EDWIN JOSE', '92537102', '6', 'edwin.olivero@viva.gov.co', '6140653', 'Diagonal 55 # 33-79 Apto 1016', 'Niquia', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('184', 'OQUENDO GOMEZ JULISSA ANDREA', '43875956', '8', 'viviendayhabitat4@viva.gov.co', '3217685186', 'carrera 53 No 25 32 apto 2804', 'Las Cabañas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('185', 'OREJUELA TERAN WILMAR', '1017142907', '6', 'wilmar.orejuela@viva.gov.co', '3112903324', 'Calle 53 55 A67', 'Artex(itagui)', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('186', 'OROZCO ARANGO  MARIA ISABEL', '43583380', '5', 'isabel.orozco@viva.gov.co', '2295379', 'CRA 39E # 48 C SUR 103', 'Señorial Envigado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('187', 'OROZCO CUARTAS ANDREA', '1039459283', '4', 'viviendayhabitat9@viva.gov.co', '4873497', 'Calle 107 sur # 50-99', 'La Raya', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('188', 'ORTEGA MARIA CATALINA', '39212699', '5', 'maria.ortega@viva.gov.co', '3122395922', 'AV 26 52-140', 'Niquia', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('189', 'ORTIZ ARCILA SANDRA MILENA', '43867184', '6', 'sandra.ortiz@viva.gov.co', '3043367374', 'Carrera 75 DA 2 B SUR 320', 'Belen la Mota', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('190', 'ORTIZ MONTOYA SANTIAGO', '1017207633', '6', 'santiago.ortiz@viva.gov.co', '3216925932', 'Calle 40 105-146 Apto 509', 'La America', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('191', 'OSORIO ZAPATA MARTA RUBI', '1037586292', '7', 'rubi.osorio@viva.gov.co', '3187383570', 'Calle 92 c 32-45 ', 'Manrique', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('192', 'PALACIOS GONZALEZ WILMAR ENRIQUE', '1001051876', '7', 'wepalacios67@misena.edu.co', '3042546411', 'Calle 103B 49-74', 'Santa Cruz', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('193', 'PALENCIA RIVERA  ANA MARIA', '1035430911', '4', 'ana.palencia@viva.gov.co', '3196028441', 'Carrera 43 N 50A - 53 ', 'Mirador azul', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('194', 'PARRA CAGUA JAKELINE', '1094975885', '1', 'practicanteviviendayhabitat@viva.gov.co', '3225368521', 'Calle 57 68 c 65 apto 343 unidad peña verde', 'El trapiche', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('195', 'PARRA GIRALDO SANDRA CAROLINA', '1037949422', '6', 'sandra.parra@viva.gov.co', '3113077142', 'Calle 79 57 B 02', 'Araucarias 2', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('196', 'PARRA RIOS MONICA CECILIA', '43720876', '5', 'cecilia.parra@viva.gov.co', '3207042540', 'Calle 47 F 88-49 ', 'Florsta,Snta Lucia', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('197', 'PATERNINA CASTAÑEDA LUIS FERNANDO', '8046462', '7', '', '3053025149', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('198', 'PATIÑO ARISTIZABAL HERNANDO FABIO', '71720121', '7', 'hernando.patiño@viva.gov.co', '3024363475', 'Cra 99 A 48 A 13', 'Floresta la Pradera', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('199', 'PÉREZ AVENDAÑO EDISON JOSE', '71362756', '6', 'edison.perez@viva.gov.co', '5806045', 'Carrera 66 No 92 09', 'Francisco Antonio Zea', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('200', 'PEREZ MUNERA JUAN FELIPE', '71787393', '1', 'juan.perez@viva.gov.co', '2664395', 'CALLE 5 No 43 E 24', 'Patio Bonito', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('201', 'PEREZ OCHOA  LAURA CARLINA', '1128415197', '4', 'laura.perez@viva.gov.co', '2347083', 'CALLE 25 No. 16B - 51 RECINTO CAMPESTRE SANTA ANA', 'El Retiro', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('202', 'PÉREZ URIBE LUZ PIEDAD', '43810710', '5', 'luz.perez@viva.gov.co', '2759386', 'CALLE 28 NRO 53-94', 'la cabaña', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('203', 'PINEDA GONZALEZ LADY JHOJANA', '1040743751', '8', 'lady.pineda@viva.gov.co', '3113981627', 'Calle 75 B SUR 54- B 65', 'Villas de Alcantara', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('204', 'POTES POTES CAROLINA', '1076324367', '1', 'carolina.potes@viva.gov.co', '3505269803', 'Cra 25 C 55 B 46', 'Boston', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('205', 'PUERTA MARTINEZ HELBERT ARTURO', '71687444', '4', 'planeacion2@viva.gov.co', '300 347 45 82 ', 'Carrera 41 N°57 sur 60. Interior 1707', 'Sabaneta', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('206', 'PULGARIN GIL JORGE MARIO', '1035390720', '7', 'jorge.pulgarin@viva.gov.co', '3122774306', 'Calle 97 84 108', 'Picachito', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('207', 'QUICENO ARBELAEZ LUIS FELIPE', '1040749950', '5', 'luis.quiceno@viva.gov.co', '3148849372', 'CL 74 B SUR CR 60-17', 'La Ferreira', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('208', 'QUIROZ GARCIA  JESSICA', '1017185699', '6', 'titulacion2@viva.gov.co', '4893920', 'calle 59 No 70-125 apto 518', 'Itagui', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('209', 'QUIROS HENAO LUIS FERNANDO', '98644415', '8', 'juridica4@viva.gov.co', '3053313588', 'Cra 82 # 102-22 Apto 201', '12 de Octubre', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('210', 'QUIROS MEJIA ELIANA', '1020438471', '1', 'eliana.quiroz@viva.gov.co', '3008098953', 'Cra 36 CC 82-05', 'Manrrique', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('211', 'RADA ZAPATA DANIEL ARMANDO', '1039700187', '7', 'daniel.rada@viva.gov.co', '3217354738', 'Calle 30 A 83- 25', 'Belen los Alpes', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('212', 'RAMIREZ  GOMEZ PABLO', '1214740063', '7', 'pablo.ramirez@viva.gov.co', '3053000445', 'CARREA 47 #73-39', 'Campo Valdes', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('213', 'RAMIREZ PINEDA GISELLA MARIA', '43828814', '6', 'arquitectoplaneacion1@viva.gov.co', '3175735007', 'Cra  63 N. 25 a 42', 'Urbanizacion Altos de Bariloche', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('214', 'RAMIREZ QUICENO ELIANA EMILSE', '43623195', '6', 'eliana.ramirez@viva.gov.co', '3023443228', 'Calle 89 91-16 int 202 ', 'Robledo villa sofia', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('215', 'RAMIREZ URIBE SANTIAGO', '1152190097', '5', 'planeacion3@viva.gov.co', '3506894904', 'Carrera 79 BB 45 B 25 bloque 23 apto 301', 'La America', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('216', 'RAMIREZ VALENCIA LUIS IGNACIO', '15333923', '5', 'luis.ramirez@viva.gov.co', '3122598117', 'Calle 64 44- 51 interior 409 urbanizacion Robles 2', 'La Esmeralda', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('217', 'RAMOS COLORADO JULIANA', '1039446085', '1', 'juliana.ramos@viva.gov.co', '3217479179', 'Cra 38 75  B  sur 115 Apto 523', 'San Jose', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('218', 'RENDON MARIN VALERIA', '1053790859', '4', 'valeria.rendon@viva.gov.co', '4128810', 'Circular 74#76E-30', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('219', 'RESTREPO ALCARAZ CAMILO ANDRES', '1037602755', '5', 'camilo.restrepo@viva.gov.co', '3136854987', 'Cra 87 A 32 A 310 Castillo de la castañeda Apto 1012', 'Belen la Castañeda', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('220', 'RESTREPO ARCILA CATALINA MARIA', '32256836', '8', 'catalina.restrepo@viva.gov.co', '3006649384', 'Cra 72 C2-39 Apto 403', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('221', 'RESTREPO BUITRAGO CARLOS ALBERTO', '71756034', '7', 'carlos.restrepo@viva.gov.co', '5076429', 'Calle 35D No. 98-14', 'Santa Monica 2', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('222', 'RESTREPO CANO MILENY ALEJANDRA', '1152454508', '1', 'alejandra.restrepo@viva.gov.co', '3015713377', 'Cra 83 B 22-28 Int 101', 'Belen Zafra', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('223', 'RESTREPO CHAVERRA PAULA ANDREA', '42691723', '8', 'juridica16@viva.gov.co', '2742141', 'Cra 45 26 -162 apto 148', 'Puerta Madera', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('224', 'RESTREPO MOLINA LUIS BERNARDO', '70553369', '6', 'luis.restrepo@viva.gov.co', '3282774', 'Calle 36 Sur #27d 50', 'la inmaculada', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('225', 'RESTREPO MONTOYA CESAR AUGUSTO', '8464237', '6', 'cesar.restrepo@viva.gov.co', '3015605359', 'Carrera 47  # 133 Sur 20 Apto 402', 'El Playon', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('226', 'RESTREPO RODRIGUEZ DIANA ISABEL', '21980412', '1', 'administrativa9@viva.gov.co', '3217806184', 'Calle 79 c sur 55 c 54 torre 8 apto 204 urbanizacion apartamentos claro verde en la estrella ', 'La Estrella', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('227', 'RESTREPO VILLA JORGE ANDRES', '1039467943', '4', 'jorge.restrepo@viva.gov.co', '3007177166', 'Cra 42 # 60 sur 60', 'La Florida', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('228', 'RINCÓN ÁLVAREZ LILIANA MARIA', '43536930', '6', 'liliana.rincon@viva.gov.co', '5733943', 'CALLE 69 SUR  # 46-145 APTO 1103 EDIFICIO PALOSANTO', 'calle del banco', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('229', 'RIOS ECHEVERRI LAURA ISABEL', '1128282102', '4', 'laura.rios@viva.gov.co', '3505278118', 'Calle 31 A 81-49', 'Belen Vicuña', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('230', 'RIVAS  RESTREPO BEATRIZ ELENA', '43519632', '7', 'beatriz.rivas@viva.gov.co', '2978486', 'DIAGONAL 75D 1-221 BELEN LA MOTA', 'Belen ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('231', 'RIVERA REVUELTAS CLAUDIA PATRICIA', '45513558', '1', 'claudia.rivera@viva.gov.co', '3117104840', 'Calle 49 53-66', 'Suarez', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('232', 'RIVERA PEREIRA FELIX DANIEL', '1152435922', '6', 'arquitectoplaneacion@viva.gov.co', '2536896', 'Calle 44 C # 90 A 63', 'La America(La Floresta)', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('233', 'RODRIGUEZ VIDAL NOEMIS GREISSI', '1052963733', '7', 'juridica7@viva.gov.co', '3438723', 'calle 21 No 82 A 65', 'Belen Altavista ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('234', 'ROJAS BERNAL LAURA VANESSA', '1035870917', '6', 'laura.rojas@viva.gov.co', '3127782746', 'Cll 3 B 7-23 ', 'Girardota', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('235', 'ROJAS GIRALDO CRISTIAN SEBASTIAN', '1035872805', '6', 'cristian.rojas@viva.gov.co', '3107302625', 'Cra 68 A 106 A 19', 'Gratamira', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('236', 'ROMAÑA   ROMAÑA LEISON FREYDER', '71316254', '1', 'leison.romana@viva.gov.co', '3218013934', 'Calle 29  C  N.33-53 Casa 106', 'Palmas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('237', 'RUA  ARANGO DORA LUCIA', '43432480', '7', 'dora.rua@viva.gov.co', '3474800', 'carrera 38 No 75 B sur 115 apto 901 Urbanizacion la Vega', 'SanJose', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('238', 'RUIZ  OQUENDO PAULA ANDREA', '32256546', '1', 'paula.ruiz@viva.gov.co', '3113059311', 'Diagonal 43 34 E 20 APTO 901 Unidad Curazao ', 'Alcala', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('239', 'RUIZ CASTAÑO YENNY PAOLA', '1032444809', '7', 'yenny.ruiz@viva.gov.co', '3134062841', 'Calle 128 A 89-99', 'Suba Rincon ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('240', 'RUIZ URIBE RAFAEL IGNACIO', '98561323', '7', 'rafael.ruiz@viva.gov.co', '3504533849', 'Calle 8 # 84 F 220 Apto 916', 'Loma de los Bernal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('241', 'SALAZAR FERNANDO ALBEIRO', '8460714', '5', 'fernando.salazar@viva.gov.co', '5366550', 'calle 27 D Sur No 27 C 50 torre 4 apto 222', 'Cumbres', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('242', 'SALDARRIAGA ARANGO LUISA FERNANDA', '1152205132', '5', 'luisa.saldarriaga@viva.gov.co', '3016500319', 'Calle 79 B 86 75 ', 'Robledo el Diamante', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('243', 'SANTA GIRALDO CAROLINA', '24331836', '6', 'carolina.santa@viva.gov.co', '3006169891', 'Cra 44 N. 16 SUR 55 APTO 401 Portal del Campestre', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('244', 'SEPULVEDA ATEHORTUA SEBASTIAN STEVEN', '1017209148', '6', 'sebastian.sepulveda@viva.gov.co', '3006205011', 'Diagonal 17 CC 56-B 50 ', 'Caicedo La Libertad', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('245', 'SEPULVEDA RIOS CINDY', '1037632749', '1', 'cindy.sepulveda@viva.gov.co', '3146260575', 'Calle 77 sur 35 A 71', 'Loma San Jose', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('246', 'SEQUEDA GAMBOA ALBA LUCIA', '60259330', '8', 'alba.sequeda@viva.gov.co', '5374582', 'Cra 32 # 6 SUR 45 Apto 305 Bosques de la cascada ', 'Los Balsos 2 ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('247', 'SERNA FLOREZ YULIANA ANDREA', '1152709414', '4', 'yuliana.serna@viva.gov.co', '3008457350', 'Calle 121 # 30-14 Int 114', 'Popular 1', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('248', 'SOTO VARGAS JUAN SEBASTIAN', '1040759649', '7', 'juan.soto@viva.gov.co', '3205786676', 'Calle 15 79-340 apto 501', 'Belen la loma de los bernal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('249', 'SOTO YANEZ VICTOR ALEXANDER', '1093746398', '6', 'victor.soto@viva.gov.co', '3114632240', 'Cra 44 26-71 Apto 2307 C.R Madera Esencial (Bello)', 'Bello', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('250', 'SUAREZ MULETT CARLOS MAURICIO', '92559370', '6', 'carlos.suarez@viva.gov.co', '3002762483', 'Carrera 77 60-45 Apto 410 Torre 3 ', 'los colores', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('251', 'SUAREZ VELASQUEZ ANA MERCEDES', '43989623', '5', 'ana.suarez@viva.gov.co', '3163534', 'Cll 39 66 A 44 Ed Jardines 1 Apto 501', 'Conquistadores', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('252', 'TABARES ACEVEDO MADELYN JULIETH', '1128273873', '8', 'madelyn.tabares@viva.gov.co', '3014449058', 'Carrera 37 A 15 B 50', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('253', 'TABARES  HERRERA KELLY TATIANA', '1152197204', '8', 'kelly.tabares@viva.gov.co', '3005138863', 'Carrera 46 # 63-58 Edificio Santa Elena Apto 906', 'La  Mansion (Villa Hermosa)', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('254', 'TANGARIFE  MUÑOZ JAN DAVID', '1040180074', '1', 'david.tangarife@viva.gov.co', '2731536', 'KM 24 VIA LAS PALMAS', 'vereda los salados', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('255', 'TABERA RAMIREZ CLARA ELENA', '1036605829', '7', 'clara.tabera@viva.gov.co', '3147209514', 'Calle 40 51-62 int 301', 'San Isidro', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('256', 'TIRADO DUQUE  ALEJANDRA MARIA', '32107731', '1', 'abogadatitulacion@viva.gov.co', '5801849', 'calle 33 c 88 A 169 APTO 915 ', 'Laureles', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('257', 'TORO CARMONA JUAN PABLO', '1020413411', '4', 'subregionmagdalena@viva.gov.co', '3137273730', 'AV 26 52 - 200 TORRE 6 APTO 436', ' NORTEAMERICA', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('258', 'TORRES CANO PAULA ANDREA', '1039024960', '6', 'paula.torres@viva.gov.co', '3207841700', 'Cra 55 A sur 38-130 int 1809', 'Maria Auxiliadora', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('259', 'TORRES RESTREPO DIEGO LUIS', '70565577', '6', 'diegotorrestrepo@yahoo.com', '3207886879', 'carrera 27 38 sur 51 apto 817 int 3', 'El chingui 1', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('260', 'TRUJILLO QUICENO SARA', '21526530', '8', 'sara.trujillo@viva.gov.co', '3316483', 'Cra 39 A 40 F SUR 02 villas del mediterraneo', 'El Dorado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('261', 'UPEGUI GARCIA DIEGO ALEXANDER', '1037614104', '8', 'juridica12@viva.gov.co', '3113460356', 'Cra 75 A # 92-130', 'Robledo', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('262', 'URIBE CASTRILLON JULIANA', '1017150254', '5', 'juliana.uribe@viva.gov.co', '3006515113', 'Calle 39 64-60 Apto 402', 'Conquistadores', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('263', 'URIBE RIOS JORGE ALBERTO', '71754009', '5', 'jorge.uribe@viva.gov.co', '3154115080', 'Calle 1 A 50 F 15', 'Cristo Rey', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('264', 'URBAY USUGA DIANA CRISTINA', '1037594922', '1', 'diana .urbay@viva.gov.co', '3117471183', 'Calle 48 17 B 25', 'Buenos Aires', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('265', 'VALENCIA CORREA LINA MARIA', '43567744', '3', 'lina.valencia@viva.gov.co', '3147827210', 'Calle 41  # 75 25 Apto 301 ', 'Laureles ', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('266', 'VALENCIA LOPEZ MARTA JOHANNA', '1020466056', '5', 'marta.valencia@viva.gov.co', '3146835815', 'Calle 26 A 58-54', 'Cabañas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('267', 'VALENCIA PANIAGUA ANDRES FELIPE', '1128470141', '7', 'andres.valencia@viva.gov.co', '3113836648', 'Cra 119 50-13 ', 'San Javier', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('268', 'VALLEJO HERNANDEZ MANUELA', '1037621720', '5', 'manuela.vallejo@viva.gov.co', '3217036792', 'Calle 22 sur 40-63', 'Zuñiga', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('269', 'VARGAS HOYOS TAMARA', '43156852', '6', 'tamara.vargas@viva.gov.co', '4793163', 'Calle 38 B sur 26-02', 'Camino Verde', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('270', 'VASQUEZ MONSALVE JENIFER', '1020418994', '7', 'jenifer.vasquez@viva.gov.co', '3233265695', 'Calle', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('271', 'VASQUEZ VELILLA BEATRIZ ELENA', '43482595', '6', 'beatriz.vasquez@viva.gov.co', '3128927499', 'Calle 59 D 68 C 10 Apto 404 Edificio Torre Primavera ', 'Primavera', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('272', 'VEINTEMILLA PALENCIA LAURA', '1037595151', '7', 'laura.veintemilla@viva.gov.co', '3503354666', 'Calle 50F SUR 67-148', 'Barichara', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('273', 'VELASQUEZ CAMPUZANO  CLAUDIA YURANNY', '39177833', '1', 'claudia.velasquez@viva.gov.co', '3128105856', 'Calle 25 # 53-76 Cabañas', 'Cabañitas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('274', 'VELASCO CEDIEL CARLOS EDUARDO', '79789143', '6', 'carlos.velasco@viva.gov.co', '3188744008', 'Cra 38 # 26-385 bloque 16 Apto 156', 'San Diego', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('275', 'VELASQUEZ DUQUE GLORIA MARIA', '43532463', '1', 'gloria.velasquez@viva.gov.co', '3226505378', 'Calle 18 AA 82-24', 'Belen', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('276', 'VELASQUEZ FRANCO LUISA CATALINA', '31420837', '5', 'planeacion4@viva.gov.co', '3103893895', 'Calle 4 # 17 - 115 ', 'Poblado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('277', 'VELASQUEZ TAMAYO ANDREA', '1152434460', '8', 'andrea.velasquez@viva.gov.co', '3145830440', 'Carrera 84 B # 4 G 75', 'Loma de los Bernal', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('278', 'VELEZ AGUDELO JAIME ALEJANDRO', '8027090', '5', 'alejandro.velez@viva.gov.co', '3007707291', 'Cra 57 N. 22 A 41 Apto 201', 'Salitre Oriental', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('279', 'VELEZ GARCIA BILLANET', '21530257', '6', 'billanet.velez@viva.gov.co', '3218394345', 'cra 2 # 66B 122 APTO 302 ed. Torre Tikal', 'San Joaquin', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('280', 'VELEZ HERNANDEZ MONICA MARCELA', '43607277', '5', 'monica.velez@viva.gov.co', '5163079', 'Calle 67 43-16', 'Manrique', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('281', 'VILLA CANO ISABEL CRISTINA', '32205488', '1', 'isabel.villa@viva.gov.co', '3004497581', '', '', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('282', 'VILLEGAS GIRALDO SORELLY', '43552919', '1', 'sorelly.villegas@viva.gov.co', '3012250006', 'Calle 84  No 39 A - 85 ', 'Manrique las granjas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('283', 'VILLOTA TULCANES ANDREA CAROLINA', '1082748546', '6', 'andrea,villota@viva.gov.co', '3104182546', 'Cra 70 15-35', 'Belen las playas', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('284', 'ZAPATA  GARCIA SANDRA MILENA', '32142447', '7', 'sandra.zapata@viva.gov.co', '2769019', 'Calle 96 BB 80-05', '12 de octubre', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('285', 'ZAPATA CARO LAURA MARCELA', '1017195295', '7', 'laura.zapata@viva.gov.co', '3103504586', 'Cra 45 C 63 B 23 Apto 201', 'Villahermosa', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('286', 'ZAPATA CORREA ANDRES FELIPE', '1037615701', '6', 'andres.zapata@viva.gov.co', '3108953421', 'Cra 46 22 Sur 50', 'Envigado', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('287', 'ZAPATA HERNANDEZ VENANCIO', '1017131637', '7', 'venancio.zapata@viva.gov.co', '3003459616', 'Cra 44 69- 29', 'Manrrique Central', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('288', 'ZAPATA OCAMPO STEPHANY', '1128274782', '5', 'stephany.zapata@viva.gov.co', '3114053915', 'Carrera 88 34 5 ', 'Simon Bolivar', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('289', 'ZAPATA RAMIREZ YULIANA CRISTINA', '32090244', '6', 'yuliana.zapata@viva.gov.co', '3122055944', 'Calle 121 # 30-14 Int 114', 'Popular 1', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('290', 'ZARATE BENITEZ ERICA', '1017165937', '6', 'erica.zarate@viva.gov.co', '3014601612', 'Calle 77 CC 84- 39 ', 'Robledo Bello Horizonte', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('291', 'ZULUAGA GARZON BIBIANA ASTRID', '39451646', '5', 'bibiana .zuluaga@viva.gov.co', '3007807969', 'Calle 77 sur 47 C 65', 'Santa maria de los dolores', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('292', 'ZULUAGA PANIAGUA ANDREA ', '1017252891', '5', 'andrea.zuluaga@viva.gov.co', '3016918683', 'Cra 24 C 34-39 ', 'Palmas de cataluña', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);
INSERT INTO `trans_clientes` VALUES ('293', 'ZULUAGA ZAPATA GUSTAVO ADOLFO', '1044501501', '6', 'viviendayhabitat10@viva.gov.co', '3203690925', 'CALLE 25 No. 16B-51 RECINTO CAMPESTRE SANTA ANA CASA 172', 'EL RETIRO-ANTIOQUIA', '1', '2023-05-12 11:12:36', null, 'daniel.rodriguez', null);

-- ----------------------------
-- Table structure for `trans_invitados_movilizados`
-- ----------------------------
DROP TABLE IF EXISTS `trans_invitados_movilizados`;
CREATE TABLE `trans_invitados_movilizados` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Servicio` int DEFAULT NULL,
  `Identificacion` int DEFAULT NULL,
  `Servidor` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Direccion` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of trans_invitados_movilizados
-- ----------------------------
INSERT INTO `trans_invitados_movilizados` VALUES ('1', '291', '43081223', 'LUISA ', '32380405', 'MEDELLIN ', '1', '2023-10-31 16:31:19', '2023-10-31 16:31:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');

-- ----------------------------
-- Table structure for `trans_servicios`
-- ----------------------------
DROP TABLE IF EXISTS `trans_servicios`;
CREATE TABLE `trans_servicios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TipoServicio` int DEFAULT NULL,
  `Costo` float(10,2) DEFAULT NULL,
  `MpioDestino` int DEFAULT NULL,
  `MpioOrigen` int DEFAULT NULL,
  `Mes` int DEFAULT NULL,
  `FechaServicio` date DEFAULT NULL,
  `FechaSalida` date DEFAULT NULL,
  `Pernocta` varchar(2) COLLATE utf8mb4_spanish_ci DEFAULT 'NO',
  `FechaRegreso` date DEFAULT NULL,
  `HoraSalida` time DEFAULT NULL,
  `Proceso` int DEFAULT NULL,
  `Convenio` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Placas` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Conductor` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TelefonoConductor` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `TipoVehiculo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ObjetoViaje` text COLLATE utf8mb4_spanish_ci,
  `ObservacionesDestino` text COLLATE utf8mb4_spanish_ci,
  `CantDias` float(10,2) DEFAULT NULL,
  `Estado` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT 'Solicitado',
  `ObservacionFin` text COLLATE utf8mb4_spanish_ci,
  `Unificado_Con` int DEFAULT NULL,
  `HoraFinReal` time DEFAULT NULL,
  `FechaFinReal` date DEFAULT NULL,
  `CantPersonas` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `MotivoCancelacion` int DEFAULT NULL,
  `ObservacionCancelacion` text COLLATE utf8mb4_spanish_ci,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of trans_servicios
-- ----------------------------
INSERT INTO `trans_servicios` VALUES ('16', null, null, '1', '59', null, null, '2023-08-04', null, '2023-08-11', '07:00:00', '7', 'VIVA', null, null, null, '1', 'TRASLADO PERMANENTE DIRECTOR', '', '4.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 18:11:19', '2023-08-15 18:11:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('17', null, null, '1', '1', null, null, '2023-08-04', null, '2023-08-11', '07:30:00', '11', 'VIVA', null, null, null, '4', 'MUNICIPIOS DE ANTIOQUIA', '', '4.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 18:18:10', '2023-08-15 18:18:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('18', null, null, '1', '1', null, null, '2023-08-04', null, '2023-08-11', '07:20:00', '10', 'VIVA', null, null, null, '4', 'TRANSLADO JEFACTURA COMUNUCACIONES\n', '', '4.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 18:25:10', '2023-08-15 18:25:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('19', null, null, '122', '1', null, null, '2023-08-08', null, '2023-08-12', '06:00:00', '6', 'CI-307-2022      CI-704-2021 YARUMAL ', null, null, null, '4', 'HABILITACION PISO Y BAÑO EN CAMPAMENTO -                      RECIBO DE MEJORAMIENTOS PISOS Y BAÑOS EN YARUMAL', '', '3.00', 'Solicitado', null, null, null, null, '2', '1', '2023-08-15 18:38:47', '2023-08-15 18:38:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('20', null, null, '29', '1', null, null, '2023-08-08', null, '2023-08-12', '07:00:00', '7', 'CI-247-2022', null, null, null, '4', 'REALIZAR VISITAS DE CARACTERIZACIÓN ', 'ÁREA RURAL Y URBANA|', '3.00', 'Solicitado', null, null, null, null, '2', '1', '2023-08-15 19:07:03', '2023-08-15 19:07:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('15', '5', '0.00', '1', '87', null, null, '2023-08-04', null, '2023-08-11', '07:00:00', '6', 'VIVA', null, null, null, '1', 'TRASLADO PERMANENTE DIRECTOR', '', '4.50', 'Autorizado', null, null, null, null, '1', '1', '2023-08-15 17:51:44', '2023-10-06 22:25:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('14', null, null, '1', '84', null, null, '2023-08-04', null, '2023-08-11', '07:30:00', '5', 'VIVA', null, null, null, '1', 'TRASLADO PERMANENTE DIRECTOR', 'EL RETIRO ', '4.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 17:35:49', '2023-08-15 17:35:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('21', null, null, '29', '1', null, null, '2023-08-08', null, '2023-08-12', '07:00:00', '7', 'CI-247-2022', null, null, null, '4', 'REALIZAR VISITAS DE CARACTERIZACIÓN', '', '3.00', 'Solicitado', null, null, null, null, '2', '1', '2023-08-15 19:18:11', '2023-08-15 19:18:11', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('22', null, null, '89', '1', null, null, '2023-08-08', null, '2023-08-12', '06:03:00', '6', 'CI-689-2021', null, null, null, '4', 'VISITAS  DE HABILITACION ', '', '3.00', 'Solicitado', null, null, null, null, '5', '1', '2023-08-15 19:32:50', '2023-08-15 19:32:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('23', null, null, '40', '1', null, null, '2023-08-08', null, '2023-08-12', '06:30:00', '6', 'CI-651-2021     CI-699-2021', null, null, null, '4', 'VISITAS DE RECIBO A LOS MEJORAMIENTOS DE PISOS Y BAÑOS DE LA CONVOCATORIA, HOGARES DIGNOS PARA LA VIDA', 'BETULIA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 21:23:15', '2023-08-15 21:23:15', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('24', null, null, '77', '1', null, null, '2023-08-08', null, '2023-08-11', '06:00:00', '6', 'CI-684-2021', null, null, null, '4', 'RECIBOS DE PISOS Y BAÑOS CI - 684 - 2021', '', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 21:29:28', '2023-08-15 21:29:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('25', null, null, '54', '19', null, null, '2023-08-08', null, '2023-08-11', '07:00:00', '6', 'CI-307-2022', null, null, null, '4', 'HABILITACIONY RECIBOS DE PISOS Y BAÑOS', '', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 21:38:38', '2023-08-15 21:38:38', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('26', null, null, '52', '47', null, null, '2023-08-08', null, '2023-08-12', '06:00:00', '6', 'CI-307 2022', null, null, null, '4', 'VISITA DE RECIBOS DE TRABAJOS EJECUTADOS  EN EL  MUNICIPIOS DE GOMEZ PLATA CI-307 2022', '', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 22:02:47', '2023-08-15 22:02:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('27', null, null, '6', '19', null, null, '2023-08-08', null, '2023-08-11', '06:04:00', '6', 'CI-788-2021', null, null, null, '4', 'VISITAS HABILITACIÓ Y   RECIBO  PISOS Y BAÑOS', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 22:06:35', '2023-08-15 22:06:35', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('28', null, null, '14', '1', null, null, '2023-08-08', null, '2023-08-11', '05:30:00', '6', 'CI-106-2023', null, null, null, '4', 'VISITAS DE HABILITACION', '', '2.50', 'Solicitado', null, null, null, null, '2', '1', '2023-08-15 22:11:50', '2023-08-15 22:11:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('29', null, null, '116', '1', null, null, '2023-08-08', null, '2023-08-11', '06:00:00', '6', 'CI 293-2022', null, null, null, '4', 'HABILITACION  DE PISOS Y BAÑOS', '', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 22:21:57', '2023-08-15 22:21:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('30', null, null, '23', '19', null, null, '2023-08-08', null, '2023-08-11', '06:00:00', '6', 'CI-600-2021', null, null, null, '4', ' REVISIÓN Y RECIBO DE MEJORAMIENTOS LOCATIVOS RURALES.', '', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 22:36:28', '2023-08-15 22:36:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('31', null, null, '80', '47', null, null, '2023-08-08', null, '2023-08-11', '06:00:00', '6', 'CI-663-2021 ', null, null, null, '4', 'VISITAS DE HABILITACIÓN CI 663-2021 ', 'RURAL', '2.50', 'Solicitado', null, null, null, null, '3', '1', '2023-08-15 22:47:22', '2023-08-15 22:47:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('32', null, null, '90', '19', null, null, '2023-08-08', null, '2023-08-11', '07:00:00', '6', 'CI-266-2022', null, null, null, '4', 'HABILITACIÓN PISOS- BAÑOS CONVOCATORIAS HOGARES DIGNOS,CI 266-22', '', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 23:01:16', '2023-08-15 23:01:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('33', null, null, '90', '1', null, null, '2023-08-08', null, '2023-08-11', '05:00:00', '6', 'CA-156-2020 CA-620-2021 CA-152-2020 CA-606-2021', null, null, null, '4', 'SEGUIMIENTO AL CONVENIO', 'EL PEÑOL', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 23:26:43', '2023-08-15 23:26:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('34', null, null, '90', '1', null, null, '2023-08-09', null, '2023-08-11', '18:00:00', '6', 'CI-575-2021', null, null, null, '4', 'VISITAS MVR', '', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 23:33:41', '2023-08-15 23:33:41', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('35', null, null, '102', '19', null, null, '2023-08-09', null, '2023-08-11', '06:00:00', '6', 'CI-676-2021', null, null, null, '4', 'VISITAS PARA REALIZAR RECIBOS DE MEJORAMIENTOS RURALES', '', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-15 23:36:44', '2023-08-15 23:36:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('36', null, null, '105', '1', null, null, '2023-08-10', null, '2023-08-11', '05:00:00', '7', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', '', '1.50', 'Solicitado', null, null, null, null, '4', '1', '2023-08-15 23:50:13', '2023-08-15 23:50:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('37', null, null, '105', '51', null, null, '2023-08-10', null, '2023-08-11', '06:00:00', '7', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '1.50', 'Solicitado', null, null, null, null, '4', '1', '2023-08-16 00:00:50', '2023-08-16 00:00:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('38', null, null, '28', '1', null, null, '2023-08-10', null, '2023-08-11', '06:00:00', '9', 'CTO 155', null, null, null, '4', ' MEJORAMIENTOS DE VIVIENDAS URBANAS Y RURALES  ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 00:05:26', '2023-08-16 00:05:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('39', null, null, '31', '19', null, null, '2023-08-10', null, '2023-08-11', '06:00:00', '6', 'CI-692-2021', null, null, null, '4', 'VISITAS DE RECIBO, CI 115 DE 2021', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 00:18:19', '2023-08-16 00:18:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('40', null, null, '35', '1', null, null, '2023-08-11', null, '2023-08-13', '21:00:00', '7', 'VIVA', null, null, null, '4', 'GRAN ENCUENTRO COMUNAL', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 00:39:18', '2023-08-16 00:39:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('41', null, null, '105', '70', null, null, '2023-08-11', null, '2023-08-13', '04:30:00', '1', 'VIVA', null, null, null, '4', 'AVANZADO DE SEGURIDAD GOBERNADOR DE ANTIOQUIA', 'CORREGIMIENTO FRAGUAS DE MACHUCA', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 00:43:55', '2023-08-16 00:43:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('42', null, null, '16', '1', null, null, '2023-08-11', null, '2023-08-11', '06:00:00', '10', 'VIVA', null, null, null, '4', 'GRABACIÓN DE PROMOCIONAL', 'NO', '0.50', 'Solicitado', null, null, null, null, '4', '1', '2023-08-16 15:40:26', '2023-08-16 15:40:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('43', null, null, '111', '1', null, null, '2023-08-11', null, '2023-08-11', '06:00:00', '6', 'CI-165-2023', null, null, null, '4', 'VISITAS DE HABILITACION A  LOS MEJORAMIENTOS ADSCRITOS AL CI-165-2023', 'NO', '0.50', 'Solicitado', null, null, null, null, '2', '1', '2023-08-16 15:44:31', '2023-08-16 15:44:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('44', null, null, '37', '1', null, null, '2023-08-11', null, '2023-08-11', '06:00:00', '6', 'HOGARES DIGNOS PARA LA VIDA (REGALÍAS', null, null, null, '4', 'HABILITACION DE MEJORAMIENTOS DE COCINAS PARA LA CONVOCATORIA HOGARES DIGNOS (REGALÍAS)', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 15:47:58', '2023-08-16 15:47:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('45', null, null, '90', '41', null, null, '2023-08-11', null, '2023-08-12', '06:30:00', '7', 'N/A', null, null, null, '4', 'ENCUENTRO CON COMUNIDADA Y ADMINISTRACIÓN MUNICIPAL  ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 16:17:39', '2023-08-16 16:17:39', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('46', null, null, '119', '19', null, null, '2023-08-16', null, '2023-08-18', '06:00:00', '6', 'CI 656  2021', null, null, null, '4', 'VISITAS DE RECIBO CI 656  - CI 686 Y  HABILITACION NUEVO ESQUEMA, CI 115 DE 2021', 'LA CEJA      LA UNION', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 17:47:15', '2023-08-16 17:47:15', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('47', null, null, '104', '1', null, null, '2023-08-16', null, '2023-08-16', '07:30:00', '6', 'CI-556-2021  CI-238-2022 CI-221-2022  CI-72-2020', null, null, null, '4', 'REVISIÓN PROYECTOS VNU', 'MARINILLA    ENVIGADO     SABANETA', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 17:51:00', '2023-08-16 17:51:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('48', null, null, '38', '1', null, null, '2023-08-16', null, '2023-08-19', '07:00:00', '7', 'N/A', null, null, null, '4', 'Visitas de Caracterización en zona Rural Y Urbana del Municipio', 'ZONAS RURALES Y URBANAS', '2.50', 'Solicitado', null, null, null, null, '2', '1', '2023-08-16 17:56:56', '2023-08-16 17:56:56', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('49', null, null, '7', '53', null, null, '2023-08-16', null, '2023-08-19', '06:00:00', '6', 'CI-675-2021 ANDES', null, null, null, '4', 'VISITAS DE HABILITACION Y RECIBO A LOS MEJORAMIENTOS DE PISOS Y BAÑOS DE LA CONVOCATORIA, HOGARES DIGNOS PARA LA VIDA', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:00:48', '2023-08-16 18:00:48', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('50', null, null, '55', '19', null, null, '2023-08-16', null, '2023-08-18', '07:30:00', '7', 'N/A', null, null, null, '4', 'REUNION COMUNITARIA-SOCIALIZACION PROYECTO HOGARES DIGNOS PARA LA VIDA', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:03:01', '2023-08-16 18:03:01', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('51', null, null, '9', '19', null, null, '2023-08-16', null, '2023-08-16', '07:00:00', '6', 'Cto 155-2022 ', null, null, null, '4', 'Realizar Inspecciones de seguridad y Salud en el trabajo del contrato 155', '', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:20:19', '2023-08-16 18:20:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('52', null, null, '44', '51', null, null, '2023-08-16', null, '2023-08-17', '05:30:00', '6', 'CI- 96-2023', null, null, null, '4', ' HABILITACION EN MEJORAMIENTOS INTEGRALES CI- 96-2023-  ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:22:52', '2023-08-16 18:22:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('53', null, null, '5', '19', null, null, '2023-08-16', null, '2023-08-17', '06:00:00', '6', 'CI 714-2021', null, null, null, '4', 'VISITAS DE RECIBOS  PISOS- BAÑOS CONVOCATORIAS HOGARES DIGNOS, CI 714-21 MUNICIPIO DE AMAGÁ ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:25:07', '2023-08-16 18:25:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('54', null, null, '66', '1', null, null, '2023-08-16', null, '2023-08-17', '05:30:00', '6', 'CI-261-2023', null, null, null, '4', 'RECIBO  DE COCINAS', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:27:27', '2023-08-16 18:27:27', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('55', null, null, '85', '1', null, null, '2023-08-16', null, '2023-08-16', '00:20:00', '1', 'VIVA', null, null, null, '4', 'AVANZADA DE SEGURIDAD MINISTRA DE VIVIENDA', 'JMC', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:32:12', '2023-08-16 18:32:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('56', null, null, '117', '1', null, null, '2023-08-16', null, '2023-08-16', '07:00:00', '6', 'CI-255-2023', null, null, null, '4', 'VISITA DE VERIFICACION A LOS MEJORAMIENTOS DE COCINAS PARA LA CONVOCATORIA + COCINAS PARA LA VIDA', '', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:37:21', '2023-08-16 18:37:21', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('57', null, null, '16', '1', null, null, '2023-08-16', null, '2023-08-16', '05:00:00', '7', 'ASPDV', null, null, null, '4', 'AVANZADA ASPDV ', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:39:57', '2023-08-16 18:39:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('58', null, null, '14', '1', null, null, '2023-08-14', null, '2023-08-18', '05:30:00', '6', 'CI-106-2023', null, null, null, '4', 'VISITAS DE HABILITACION', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:50:16', '2023-08-16 18:50:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('59', null, null, '90', '1', null, null, '2023-08-14', null, '2023-08-18', '06:00:00', '6', 'CI - 707 - 2021', null, null, null, '4', 'RECIBOS DE PISOS Y BAÑOS  CI - 707 - 2021', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:56:30', '2023-08-16 18:56:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('60', null, null, '9', '19', null, null, '2023-08-14', null, '2023-08-18', '06:00:00', '6', 'CI-784-2021', null, null, null, '4', ' REVISIÓN Y RECIBO DE MEJORAMIENTOS LOCATIVOS RURALES.', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 18:58:25', '2023-08-16 18:58:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('61', null, null, '92', '47', null, null, '2023-08-14', null, '2023-08-18', '06:00:00', '6', 'CI-301-2022', null, null, null, '4', 'VISITAS RECIBO CI 301-2022', 'O', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:00:46', '2023-08-16 19:00:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('62', null, null, '1', '84', null, null, '2023-08-14', null, '2023-08-18', '07:30:00', '5', 'VIVA', null, null, null, '1', 'TRASLADO PERMANENTE DIRECTOR', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:05:52', '2023-08-16 19:05:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('63', null, null, '1', '87', null, null, '2023-08-14', null, '2023-08-18', '06:07:00', '6', 'VIVA', null, null, null, '1', 'TRASLADO PERMANENTE DIRECTOR', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:08:16', '2023-08-16 19:08:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('64', null, null, '1', '59', null, null, '2023-08-14', null, '2023-08-18', '07:00:00', '7', 'VIVA', null, null, null, '1', 'TRASLADO PERMANENTE DIRECTOR', 'AMVA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:22:00', '2023-08-16 19:22:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('65', null, null, '1', '1', null, null, '2023-08-14', null, '2023-08-18', '07:00:00', '11', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE DIRECTOR', 'AMVA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:25:10', '2023-08-16 19:25:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('66', null, null, '1', '1', null, null, '2023-08-14', null, '2023-08-18', '07:00:00', '10', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE JEFE COMUNICACIONES', 'AMVA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:27:47', '2023-08-16 19:27:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('67', null, null, '9', '1', null, null, '2023-08-14', null, '2023-08-18', '05:30:00', '6', 'CI -307 - 2022', null, null, null, '4', ' HABILITACION A  LOS MEJORAMIENTOS ADSCRITOS AL CI-307-2022', 'GUADALIUPE', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:30:29', '2023-08-16 19:30:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('68', null, null, '40', '47', null, null, '2023-08-14', null, '2023-08-17', '05:30:00', '6', 'CI -144 - 2023', null, null, null, '4', ' HABILITACION A  LOS MEJORAMIENTOS ADSCRITOS AL CI-144-2023', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:33:41', '2023-08-16 19:33:41', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('69', null, null, '83', '47', null, null, '2023-08-15', null, '2023-08-19', '06:00:00', '6', 'CI-292-2022', null, null, null, '4', 'VISITA DE HABILITACION  PARA EL  MUNICIPIOS DE REMEDIOS CI-292 2022', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:43:43', '2023-08-16 19:43:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('70', null, null, '24', '47', null, null, '2023-08-15', null, '2023-08-15', '06:30:00', '6', 'CI 661_2021', null, null, null, '4', 'VISITAS DE RECIBO DE LOS MEJORAMIENTOS HDPV', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:50:26', '2023-08-16 19:50:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('71', null, null, '6', '19', null, null, '2023-08-15', null, '2023-08-18', '06:00:00', '6', 'CI-788-2021', null, null, null, '4', 'VISITAS HABILITACIÓ Y   RECIBO  PISOS Y BAÑOS', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 19:54:18', '2023-08-16 19:54:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('72', null, null, '93', '19', null, null, '2023-08-15', null, '2023-08-18', '06:00:00', '6', 'CONVENIO CI-655-2021', null, null, null, '4', ' HABILITACION  Y RECIBO DE MEJORAMIENTOS BAÑOS Y PISOS ', 'ZONA RURAL', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 20:00:31', '2023-08-16 20:00:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('73', null, null, '112', '47', null, null, '2023-08-15', null, '2023-08-17', '07:00:00', '6', 'CI-450-2017', null, null, null, '4', 'VERIFICACIÓN DE MEJORAMIENTOS DE VIVIENDA', 'SAN ANDRES DE CUERQUIA, SAN PEDRO DE LOS MILAGROS', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 21:18:46', '2023-08-16 21:18:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('74', null, null, '117', '1', null, null, '2023-08-15', null, '2023-08-16', '06:00:00', '6', '234-2023', null, null, null, '4', 'SEGUIMIENTO AL CONTRATO', ' VEREDAS: PLAYA RICA Y EL GUATABO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 21:22:54', '2023-08-16 21:22:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('75', null, null, '83', '19', null, null, '2023-08-15', null, '2023-08-16', '07:00:00', '6', 'CI-292-2022', null, null, null, '4', 'REUNIÓN DE INICIO DE CONVENIO CI-292-2022', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 21:25:30', '2023-08-16 21:25:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('76', null, null, '125', '1', null, null, '2023-08-15', null, '2023-08-17', '06:00:00', '6', 'CI-258-2023', null, null, null, '4', 'VISITA INICIAL PARA COORDINAR EL INICIO DE LAS ACTIVIDADES PRELIMINARES PARA LA INSTALACIÓN DE LAS COCINAS EN EL MARCO +COCINAS PARA LA VIDA', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 21:28:48', '2023-08-16 21:28:48', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('77', null, null, '90', '59', null, null, '2023-08-15', null, '2023-08-16', '06:00:00', '6', 'CI-156-2020', null, null, null, '4', 'SEGUIMIENTO AL CONVENIO', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 21:31:57', '2023-08-16 21:31:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('78', null, null, '46', '1', null, null, '2023-08-15', null, '2023-08-16', '06:00:00', '6', 'CI-621-2021 Y CI-612-2021', null, null, null, '4', 'VISITA Y REUNIÓN', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-16 21:38:58', '2023-08-16 21:38:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('79', '1', '0.00', '81', '1', null, null, '2023-08-01', null, '2023-08-05', '07:00:00', '1', 'VIVA', 'jpu897', 'daniel rodriguez', '2222222222', '4', 'AVANZADO DE SEGURIDAD GOBERNADOR DE ANTIOQUIA', 'SANTO DOMINGO   Y SAN VICENTE', '3.00', 'Cancelado', null, null, null, null, '1', '0', '2023-08-16 22:55:52', '2023-09-18 16:59:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('80', '1', '0.00', '118', '19', null, null, '2023-08-01', null, '2023-08-05', '07:00:00', '6', 'CI-709-2021', 'LKN434', 'ROBINSON FERNEY TUBERQUIA ', '314 7672573', '4', 'HABILITACIONY RECIBOS DE PISOS Y BAÑOS', 'NO', '3.00', 'Cancelado', null, null, null, null, '1', '0', '2023-08-16 23:01:06', '2023-09-18 22:31:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('81', '1', '0.00', '24', '1', null, null, '2023-08-01', null, '2023-08-04', '06:30:00', '6', 'CI 661_2021', 'ESQ447', 'JULIAN VELASQUEZ ECHEVERRI', '300 6167743', '4', ' HABILITACIÓN Y RECIBO DE LOS MEJORAMIENTOS HOGARES DIGNOS', 'NO', '2.50', 'Asignado', null, null, null, null, '1', '1', '2023-08-16 23:03:41', '2023-09-18 18:37:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('82', '2', '0.00', '93', '1', null, null, '2023-08-01', null, '2023-08-04', '06:00:00', '6', 'CI 655-2021', 'JYY190', 'ARLEI DARIO BUILES CARO', '323 4332706', '4', 'RECIBO DE PISOS Y BAÑOS', 'NO', '2.50', 'Asignado', null, null, null, null, '1', '1', '2023-08-16 23:06:22', '2023-09-18 18:38:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('83', '2', '0.00', '90', '47', null, null, '2023-08-01', null, '2023-08-04', '06:00:00', '6', 'CI-266-2022', 'LKO276', 'MAURICIO RAMIREZ ZAPATA ', '3116050068', '4', ' HABILITACIÓN  CI 266- 2022 DE CONVOCATORIAS – H  D  P V ', 'NO', '2.50', 'Asignado', null, null, null, null, '1', '1', '2023-08-16 23:12:03', '2023-09-18 18:39:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('84', '2', '0.00', '6', '1', null, null, '2023-08-01', null, '2023-08-04', '07:00:00', '6', 'CI-567-2021 y CI-609-2021', 'GTY088', 'EDWIN HERNA+G36:G54N BEDOYA PARRA ', '302 2754191', '4', 'VISITAS MVU Y MVR', 'NO', '2.50', 'Asignado', null, null, null, null, '1', '1', '2023-08-16 23:23:19', '2023-09-18 18:40:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('85', '1', '0.00', '119', '19', null, null, '2023-08-01', null, '2023-08-03', '05:00:00', '6', 'CI 115  2023', 'EQW362', 'FRANCISCO EDGAR ZAPATA ROJAS', '300 6079212', '4', 'VISITAS DE HABILITACION NUEVO ESQUEMA, CI 115 DE 2021', 'A UNION - LA CEJA', '2.00', 'Asignado', null, null, null, null, '1', '1', '2023-08-16 23:28:09', '2023-09-18 18:42:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('86', '6', '0.00', '69', '1', null, null, '2023-08-01', null, '2023-08-03', '06:30:00', '6', 'CI-91-2023', 'LKN333', 'DAVID ALEJANDRO CONTRERAS CHAVARRIAGA', '3127903764', '4', 'VISITAS HABILITACION RURALES; DUSTER 4X4', 'NO', '2.00', 'Cancelado', null, null, null, null, '1', '0', '2023-08-16 23:32:49', '2023-10-04 21:58:11', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('87', '2', '0.00', '90', '1', null, null, '2023-08-01', null, '2023-08-02', '05:00:00', '6', 'CI-259-2023', 'JYO082', 'JULIAN FERNANDO  MONSALVE ARBOLEDA', '312 4697448', '4', 'HABILITACIÓN DE COCINAS', 'NO', '1.50', 'Asignado', null, null, null, null, '1', '1', '2023-08-16 23:35:59', '2023-09-18 20:53:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('88', '2', '0.00', '96', '1', null, null, '2023-08-01', null, '2023-08-01', '07:30:00', '6', 'CI-214-2022', 'JYX906', 'DIOFANOR MORALES PATIÑO', '311 7720061', '4', 'REVISIÓN PROYECTOS VNU', 'NO', '0.50', 'Cancelado', null, null, null, null, '1', '0', '2023-08-16 23:44:31', '2023-10-04 21:59:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('89', '2', '0.00', '26', '1', null, null, '2023-08-02', null, '2023-08-05', '06:00:00', '6', 'N/A', 'LKO267', 'EDGAR BARRIOS LOMBO', '3005417057', '4', ' CARACTERIZACION TECNICO-SOCIAL A POTENCIALES BENEFICIARIOS DE MEJORAMIENTO + COCINAS PARA LA VIDA', 'ZONA RURAL Y URBANA', '2.50', 'Asignado', null, null, null, null, '1', '1', '2023-08-17 00:16:04', '2023-09-19 00:21:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('90', '2', '0.00', '5', '19', null, null, '2023-08-02', null, '2023-08-04', '06:00:00', '6', 'CI-714-2021', 'JYX906', 'DIOFANOR MORALES PATIÑO', '311 7720061', '4', ' PISOS- BAÑOS CONVOCATORIAS \" HDPV\" ', 'NO', '2.00', 'Cancelado', null, null, null, null, '1', '0', '2023-08-17 00:24:28', '2023-09-19 16:11:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('91', '2', '0.00', '1', '84', null, null, '2023-08-02', null, '2023-08-02', '06:30:00', '8', 'VIVA', null, null, null, '1', 'Asistencia evento público Gobernación - IDEA', 'ALAMAENTRO', '0.50', 'Autorizado', null, null, null, null, '1', '1', '2023-08-17 00:32:14', '2023-09-19 00:19:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('92', '2', '0.00', '1', '19', null, null, '2023-08-02', null, '2023-08-02', '08:00:00', '6', '175 DE 2023', null, null, null, '4', 'RECIBOS DE MEJORAMIENTOS CONVENIO 175 DE 2023', 'NO', '0.50', 'Autorizado', null, null, null, null, '1', '1', '2023-08-17 00:34:34', '2023-09-19 00:20:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('93', '5', '0.00', '70', '1', null, null, '2023-08-03', null, '2023-08-04', '05:00:00', '11', 'VIVA', 'JYX887', 'ADRIAN HUMBERTO CORREA MARIN', '3106044452', '4', 'LEVANTAMIENTO TOPOGRÁFICO', 'NO', '1.50', 'Asignado', null, null, null, null, '1', '1', '2023-08-17 15:10:55', '2023-10-04 21:20:05', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('94', '5', '0.00', '37', '1', null, null, '2023-08-03', null, '2023-08-04', '06:00:00', '6', 'CONVOCATIORIA H  D  P V  (REGALÍAS', null, null, null, '4', 'HABILITACION DE MEJORAMIENTOS DE COCINAS ', 'NO', '1.50', 'Autorizado', null, null, null, null, '1', '1', '2023-08-17 15:12:54', '2023-10-06 22:17:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('95', '1', '289873.00', '1', '1', null, null, '2023-08-03', null, '2023-08-04', '07:00:00', '11', 'VIVA', null, null, null, '1', 'CARACTERIZACIONES SOCIALES ISVIMED', 'AMVA', '1.50', 'Autorizado', null, null, null, null, '1', '1', '2023-08-17 15:17:55', '2023-10-11 21:35:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('96', null, null, '1', '1', null, null, '2023-08-03', null, '2023-08-03', '05:40:00', '6', 'CI-243-2023', null, null, null, '4', 'REUNION TECNICA DE APERTURA DE PROGRAMA +COCINAS', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 15:21:19', '2023-08-17 15:21:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('97', null, null, '1', '85', null, null, '2023-08-12', null, '2023-08-12', '07:00:00', '1', 'VIVA', null, null, null, '4', 'AVANZADA DE SEGURIDAD MINISTRA DE VIVIENDA', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 15:50:52', '2023-08-17 15:50:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('98', null, null, '69', '47', null, null, '2023-08-12', null, '2023-08-12', '07:00:00', '10', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE JEFE COMUNICACIONES', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 16:15:18', '2023-08-17 16:15:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('99', null, null, '119', '59', null, null, '2023-08-12', null, '2023-08-13', '07:00:00', '7', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE DIRECTOR', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 16:22:44', '2023-08-17 16:22:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('100', null, null, '69', '47', null, null, '2023-08-12', null, '2023-08-12', '07:00:00', '7', 'VIVA', null, null, null, '4', 'RODADA EN BICICLETA', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 16:27:07', '2023-08-17 16:27:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('101', null, null, '69', '1', null, null, '2023-08-12', null, '2023-08-12', '05:30:00', '9', 'VIVA', null, null, null, '4', 'RODADA EN BICICLETA', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 16:30:59', '2023-08-17 16:30:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('102', null, null, '105', '19', null, null, '2023-08-12', null, '2023-08-12', '05:00:00', '6', 'MANDATO SSJ 12600', null, null, null, '4', 'ENTREGA PROYECTO  SUBESTACIÓN DE POLICIA FRAGUAS AL SR. GOBERNADOR ', 'SUBESTACION DE POLICIA DE FRAGUAS MACHUCA CORREGIMIENTO DE SEGOVIA', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 16:41:06', '2023-08-17 16:41:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('103', null, null, '123', '1', null, null, '2023-08-17', null, '2023-08-18', '05:30:00', '6', 'CA-765-2021 014-2022', null, null, null, '4', 'SEGUIMIENTO AL CONVENIO', 'VEGACHI', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 16:55:04', '2023-08-17 16:55:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('104', null, null, '121', '1', null, null, '2023-08-17', null, '2023-08-18', '06:00:00', '6', 'CI-138-2023', null, null, null, '4', 'RECIBO COCICNAS', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 17:08:42', '2023-08-17 17:08:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('105', null, null, '46', '1', null, null, '2023-08-17', null, '2023-08-17', '06:00:00', '10', 'VIVA', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL A ASPDV', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 17:14:34', '2023-08-17 17:14:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('106', null, null, '88', '1', null, null, '2023-08-17', null, '2023-08-18', '05:00:00', '7', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 17:21:18', '2023-08-17 17:21:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('107', null, null, '88', '1', null, null, '2023-08-17', null, '2023-08-18', '05:00:00', '7', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 17:24:47', '2023-08-17 17:24:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('108', null, null, '88', '64', null, null, '2023-08-17', null, '2023-08-18', '06:00:00', '7', 'CI-75-2023', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 17:28:05', '2023-08-17 17:28:05', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('109', null, null, '65', '1', null, null, '2023-08-17', null, '2023-08-18', '06:00:00', '5', 'CI-636-2021', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-636-2021', 'no', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 17:40:40', '2023-08-17 17:40:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('110', null, null, '65', '1', null, null, '2023-08-17', null, '2023-08-18', '06:00:00', '6', 'CI-636-2021', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-636-2021', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 17:58:31', '2023-08-17 17:58:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('111', null, null, '82', '1', null, null, '2023-08-17', null, '2023-08-17', '05:00:00', '6', 'CI-562-2021', null, null, null, '5', 'REVISIÓN PROYECTOS VNU', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 18:04:58', '2023-08-17 18:04:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('112', null, null, '10', '1', null, null, '2023-08-17', null, '2023-08-17', '05:00:00', '7', 'VIVA', null, null, null, '4', 'ASISTIR A LA SECION DEL CONSEJO ', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 18:13:55', '2023-08-17 18:13:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('113', null, null, '70', '1', null, null, '2023-08-17', null, '2023-08-17', '07:30:00', '11', 'VIVA', null, null, null, '4', 'REUNIÓN ALCALDÍA', 'CASCO UBANO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 18:18:12', '2023-08-17 18:18:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('114', null, null, '16', '1', null, null, '2023-08-17', null, '2023-08-17', '08:00:00', '7', 'N/A', null, null, null, '4', 'LOGISTICA ENTREGA DE MATERIALES PARA MURALES DISPERSOS PROYECTO ESPECIAL', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 18:22:19', '2023-08-17 18:22:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('115', null, null, '39', '19', null, null, '2023-08-17', null, '2023-08-17', '07:00:00', '6', 'CI-102-2023', null, null, null, '4', 'SEGUIMIENTO MEJORAMIENTOS EN EJECUCIÓN', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-17 18:30:13', '2023-08-17 18:30:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('116', null, null, '55', '85', null, null, '2023-08-18', null, '2023-08-19', '08:00:00', '5', 'CI-145-2023 CI-580-2021 CI-344-2023 CI-101-2023 CI-256-2022', null, null, null, '1', ' proyecto de mejoramientos de vivienda CI-145-2023, con la comunidad beneficiaria.  Atender llamado  Concejo Municipal  sobre la gestión de mejoramientos y vivienda nueva ', 'GUARNE', '1.50', 'Solicitado', null, null, null, null, '0', '1', '2023-08-18 16:43:52', '2023-08-18 16:43:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('117', null, null, '88', '1', null, null, '2023-08-18', null, '2023-08-18', '04:00:00', '10', 'VIVA', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL A ASPDV', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-18 16:46:33', '2023-08-18 16:46:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('118', null, null, '65', '1', null, null, '2023-08-18', null, '2023-08-18', '05:30:00', '6', 'MANDATO SSJ 12600', null, null, null, '4', ' INICIO DE LOS TRABAJOS ELÉCTRICOS. MANDATO N° 4600012600 DE 2021.', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-18 16:52:06', '2023-08-18 16:52:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('119', null, null, '38', '85', null, null, '2023-08-18', null, '2023-08-19', '08:00:00', '5', 'CI-145-2023 CI-580-2021 CI-344-2023 CI-101-2023 CI-256-2022', null, null, null, '1', ' proyecto de mejoramientos de vivienda CI-145-2023, con la comunidad beneficiaria.  Atender llamado  Concejo Municipal  sobre la gestión de mejoramientos y vivienda nueva  ', 'GUARNE', '1.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-18 17:37:30', '2023-08-18 17:37:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('120', null, null, '113', '1', null, null, '2023-08-21', null, '2023-08-26', '07:00:00', '1', 'VIVA', null, null, null, '4', 'AVANZADO DE SEGURIDAD GOBERNADOR DE ANTIOQUIA', 'APARTADO -VEGACHI', '3.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 16:28:25', '2023-08-22 16:28:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('121', null, null, '1', '19', null, null, '2023-08-21', null, '2023-08-26', '07:00:00', '1', 'CI-307-2022         CI-265-2022  ', null, null, null, '4', 'AVANZADO DE SEGURIDAD GOBERNADOR DE ANTIOQUIA', 'NO', '3.50', 'Solicitado', null, null, null, null, '2', '1', '2023-08-22 16:45:23', '2023-08-22 16:45:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('122', null, null, '28', '1', null, null, '2023-08-22', null, '2023-08-22', '07:00:00', '6', 'CI-709-2021', null, null, null, '4', 'HABILITACION PISO Y BAÑO  RECIBO DE MEJORAMIENTOS ', 'VEGACHI', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 17:07:00', '2023-08-22 17:07:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('123', null, null, '28', '19', null, null, '2023-08-21', null, '2023-08-26', '06:00:00', '6', 'CI-307-2022         CI-265-2022 ', null, null, null, '4', 'HABILITACION PISO Y BAÑO  RECIBO DE MEJORAMIENTOS ', '', '3.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 17:12:42', '2023-08-22 17:12:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('124', null, null, '32', '1', null, null, '2023-08-22', null, '2023-08-26', '07:00:00', '6', '014-2022', null, null, null, '4', 'SEGUIMIENTO AL CONVENIO', 'NECOCLI TURBO MUTATA  CHIGORODO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 18:23:50', '2023-08-22 18:23:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('125', null, null, '1', '87', null, null, '2023-08-22', null, '2023-08-25', '07:00:00', '6', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE DIRECTOR', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 18:39:10', '2023-08-22 18:39:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('126', null, null, '1', '87', null, null, '2023-08-22', null, '2023-08-25', '07:00:00', '7', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE DIRECTOR', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 18:43:44', '2023-08-22 18:43:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('127', null, null, '1', '1', null, null, '2023-08-22', null, '2023-08-25', '07:00:00', '11', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE DIRECTOR', 'AMVA', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 18:51:07', '2023-08-22 18:51:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('128', null, null, '1', '1', null, null, '2023-08-22', null, '2023-08-25', '07:00:00', '10', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE JEFE COMUNICACIONES', 'AMVA', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 18:54:16', '2023-08-22 18:54:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('129', null, null, '39', '19', null, null, '2023-08-22', null, '2023-08-25', '07:00:00', '6', 'CI-102-2023', null, null, null, '4', '\nVISITAS DE HABILITACIÓN NUEVO ESQUEMA 094-2022\n', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 19:07:42', '2023-08-22 19:07:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('130', null, null, '52', '19', null, null, '2023-08-22', null, '2023-08-25', '06:00:00', '6', 'CI-307-2022', null, null, null, '4', 'VISITA DE RECIBOS DE TRABAJOS EJECUTADOS  EN EL  MUNICIPIOS DE GOMEZ PLATA CI-307 2022', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 19:22:09', '2023-08-22 19:22:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('131', null, null, '95', '1', null, null, '2023-08-22', null, '2023-08-25', '06:00:00', '6', 'CI - 684 - 2021', null, null, null, '4', 'RECIBOS DE PISOS Y BAÑOS CI - 684 - 2021', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 19:24:40', '2023-08-22 19:24:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('132', null, null, '52', '19', null, null, '2023-08-22', null, '2023-08-25', '06:00:00', '6', 'CI-788-2021', null, null, null, '4', 'VISITAS DE HABILITACION A  LOS MEJORAMIENTOS ADSCRITOS AL CI-165-2023', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 19:32:55', '2023-08-22 19:32:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('133', null, null, '54', '1', null, null, '2023-08-22', null, '2023-08-25', '05:00:00', '6', 'CI-165-2023', null, null, null, '4', 'VISITAS DE HABILITACION A  LOS MEJORAMIENTOS ADSCRITOS AL CI-165-2023', '', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 19:45:04', '2023-08-22 19:45:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('134', null, null, '111', '47', null, null, '2023-08-22', null, '2023-08-25', '05:30:00', '6', 'CI -144 - 2023', null, null, null, '4', 'VISITAS DE HABILITACION A  LOS MEJORAMIENTOS ADSCRITOS AL CI-144-2023', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 19:52:12', '2023-08-22 19:52:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('135', null, null, '1', '1', null, null, '2023-08-22', null, '2023-08-25', '04:06:00', '9', 'VIVA', null, null, null, '4', 'EL RECORRIDO ES POR EL AREA METROPOLITANA LOS DIAS 22, 23. 24, 25 DE AGOSTO ', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 23:07:06', '2023-08-22 23:07:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('136', null, null, '113', '1', null, null, '2023-08-22', null, '2023-08-24', '07:00:00', '11', 'VIVA', null, null, null, '4', 'MESA DE TRABAJO CON MUNICIPIOS', 'APARTADO CAREPA', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 23:19:44', '2023-08-22 23:19:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('137', null, null, '94', '1', null, null, '2023-08-22', null, '2023-08-23', '08:30:00', '6', 'CI-227-2021 CI-228-2021', null, null, null, '4', 'REVISIÓN PROYECTOS VNU', 'ARBOLETES', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 23:28:32', '2023-08-22 23:28:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('138', null, null, '1', '47', null, null, '2023-08-22', null, '2023-08-22', '04:00:00', '10', 'VIVA', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL A ENTREGA DE TITULOS', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-22 23:33:06', '2023-08-22 23:33:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('139', null, null, '105', '47', null, null, '2023-08-22', null, '2023-08-22', '07:00:00', '10', 'VIVA', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL A ENTREGA DE TITULOS', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-22 23:51:51', '2023-08-22 23:51:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('140', null, null, '24', '19', null, null, '2023-08-23', null, '2023-08-25', '06:00:00', '6', 'CI-246-2022', null, null, null, '4', 'VERIFICACIÓN DE MEJORAMIENTOS DE VIVIENDA', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 17:49:18', '2023-08-24 17:49:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('141', null, null, '80', '19', null, null, '2023-08-23', null, '2023-08-25', '06:52:00', '6', 'CI-641-2021', null, null, null, '4', 'VISITAS URBANAS', 'VISITAS URBANAS', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 18:01:17', '2023-08-24 18:01:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('142', null, null, '35', '1', null, null, '2023-08-23', null, '2023-08-23', '05:00:00', '3', '014-2022', null, null, null, '4', 'Visita de campo para verificar la calidad, el estado y el cumplimiento del manual de supervisión.', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 18:20:34', '2023-08-24 18:20:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('143', null, null, '44', '1', null, null, '2023-08-23', null, '2023-08-25', '05:40:00', '6', 'CI- 96-2023-- CI 696-2021', null, null, null, '4', ' HABILITACION EN MEJORAMIENTOS INTEGRALES CI- 96-2023- NUEVO ESQUEMA---  RECIBO EN MODALIDAD PISOS Y BAÑOS, CI 696-2021 HOGARES DIGNOS PARA LA VIDA', 'HELICONIA', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 18:43:54', '2023-08-24 18:43:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('144', null, null, '8', '1', null, null, '2023-08-23', null, '2023-08-25', '05:30:00', '6', 'CI-253-2023', null, null, null, '4', 'VISITAS DE RECIBO DE LAS COCINAS EN EL MARCO +COCINAS PARA LA VIDA', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 18:50:00', '2023-08-24 18:50:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('145', null, null, '102', '19', null, null, '2023-08-23', null, '2023-08-25', '06:00:00', '6', 'CI-676-2021 ', null, null, null, '4', 'VISITA AL  MUNICIPIO DE SANTA ROSA DE OSOS PARA VISITAS DE RECIBO  DE MEJORAMIENTOS BAÑOS Y PISOS ', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 18:57:34', '2023-08-24 18:57:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('146', null, null, '14', '14', null, null, '2023-08-23', null, '2023-08-25', '06:00:00', '6', 'CI-263-2022', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-263-2022', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 19:06:41', '2023-08-24 19:06:41', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('147', null, null, '47', '1', null, null, '2023-08-23', null, '2023-08-23', '07:30:00', '11', 'VIVA', null, null, null, '4', 'CARACTERIZACIONES ', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 19:33:29', '2023-09-04 17:06:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('148', null, null, '108', '41', null, null, '2023-08-23', null, '2023-08-24', '05:00:00', '10', 'VIVA', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL ENTREGA DE MEJORAMIENTOS DE VIVIENDA, PRIMERA PIEDRA VNU YERBABUEN', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 19:41:23', '2023-08-24 19:41:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('149', null, null, '90', '1', null, null, '2023-08-23', null, '2023-08-24', '06:00:00', '6', 'CI-266-2022', null, null, null, '4', 'RECIBO DE COCINAS RURALES.', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 19:44:59', '2023-08-24 19:44:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('150', null, null, '109', '110', null, null, '2023-08-23', null, '2023-08-24', '06:00:00', '10', 'VIVA', null, null, null, '4', 'ANUNCIO DE MEJORAMIENTOS - PRIMERA PIEDRA', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 19:47:22', '2023-09-04 18:11:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('151', null, null, '23', '1', null, null, '2023-08-23', null, '2023-08-23', '06:00:00', '6', 'CI-124-2023', null, null, null, '4', 'HABILITACION DE MEJORAMIENTOS DE COCINAS PARA LA CONVOCATORIA HOGARES DIGNOS', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 22:13:43', '2023-08-24 22:13:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('152', null, null, '118', '19', null, null, '2023-08-23', null, '2023-08-23', '05:00:00', '9', 'Cto 155 del 2022', null, null, null, '4', 'INSPECCIONES SST', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:19:07', '2023-09-04 16:30:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('153', null, null, '117', '1', null, null, '2023-08-23', null, '2023-08-23', '06:30:00', '6', 'CI-370-2020', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-08-24 22:32:46', '2023-08-24 22:32:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('154', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:08', '2023-09-04 16:06:30', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('155', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:10', '2023-09-04 16:06:34', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('156', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:11', '2023-09-04 16:30:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('157', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:11', '2023-09-04 16:34:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('158', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:12', '2023-09-04 16:28:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('159', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:12', '2023-09-04 16:30:37', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('160', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:12', '2023-09-04 16:34:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('161', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:16', '2023-09-04 16:28:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('162', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:16', '2023-09-04 16:31:48', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('163', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:16', '2023-09-04 16:28:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('164', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:17', '2023-09-04 16:30:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('165', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:17', '2023-09-04 16:28:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('166', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:17', '2023-09-04 16:41:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('167', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:23', '2023-09-04 16:28:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('168', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:23', '2023-09-04 16:30:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('169', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:24', '2023-09-04 16:28:35', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('170', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:24', '2023-09-04 16:31:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('171', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:24', '2023-09-04 16:28:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('172', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:24', '2023-09-04 16:27:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('173', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:24', '2023-09-04 16:26:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('174', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:29', '2023-09-04 16:26:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('175', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:30', '2023-09-04 16:26:39', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('176', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:30', '2023-09-04 16:26:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('177', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:30', '2023-09-04 16:26:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('178', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:42', '2023-09-04 16:26:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('179', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:43', '2023-09-04 16:11:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('180', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:43', '2023-09-04 16:30:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('181', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:58', '2023-09-04 16:11:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('182', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:58', '2023-09-04 16:11:38', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('183', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:58', '2023-09-04 16:11:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('184', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:58', '2023-09-04 16:11:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('185', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:58', '2023-09-04 16:11:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('186', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:59', '2023-09-04 16:11:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('187', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:44:59', '2023-09-04 16:11:01', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('188', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:45:37', '2023-09-04 16:10:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('189', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:45:37', '2023-09-04 16:07:13', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('190', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:45:38', '2023-09-04 16:07:08', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('191', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:45:38', '2023-09-04 16:06:43', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('192', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 22:45:38', '2023-09-04 16:06:46', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('193', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 23:01:17', '2023-09-04 16:06:50', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('194', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 23:01:19', '2023-09-04 16:06:55', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('195', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 23:01:19', '2023-09-04 16:06:59', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('196', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '9', '116-2023', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO CI-370-2020', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 23:01:19', '2023-09-04 16:07:03', 'NATALIA.CASTAÑO', 'Daniel.Rodriguez', null, null);
INSERT INTO `trans_servicios` VALUES ('197', null, null, '119', '1', null, null, '2023-08-23', null, '2023-08-23', '06:30:00', '6', 'CI -115 - 2022', null, null, null, '4', 'SEGUIMIENTO MEJORAMIENTOS  ADSCRITOS AL CI-115-2023', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '0', '2023-08-24 23:15:42', '2023-09-04 16:28:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('198', null, null, '37', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '6', '116-2023', null, null, null, '1', 'CI 116-2023 CISNEROS- RECIBO DE MEJORAMIENTOS DE VIVIENDA EN ZONA URBANA', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 16:50:13', '2023-09-04 16:50:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('199', null, null, '119', '1', null, null, '2023-08-23', null, '2023-08-23', '07:00:00', '6', 'CI -115 - 2022', null, null, null, '4', 'SEGUIMIENTO MEJORAMIENTOS  ADSCRITOS AL CI-115-2023', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 16:53:42', '2023-09-04 16:53:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('200', null, null, '24', '1', null, null, '2023-08-23', null, '2023-08-25', '06:00:00', '6', 'CI 114_2023 , CI 170_2023', null, null, null, '4', ' HABILITACION EN MEJORAMIENTOS INTEGRALES CI- 96-2023- NUEVO ESQUEMA---  RECIBO EN MODALIDAD PISOS Y BAÑOS, CI 696-2021 HOGARES DIGNOS PARA LA VIDA', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 17:30:00', '2023-09-04 17:30:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('201', null, null, '1', '1', null, null, '2023-08-23', null, '2023-09-23', '07:30:00', '11', 'VIVA', null, null, null, '4', 'CARACTERIZACIONES', 'NO', '16.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 17:36:40', '2023-09-04 17:36:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('202', null, null, '110', '1', null, null, '2023-08-23', null, '2023-08-24', '07:00:00', '9', 'VIVA', null, null, null, '4', 'ANUNCIO DE MEJORAMIENTOS - PRIMERA PIEDRA', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 18:02:57', '2023-09-04 18:02:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('203', null, null, '118', '19', null, null, '2023-08-23', null, '2023-08-23', '05:00:00', '9', 'Cto 155 del 2022', null, null, null, '1', 'INSPECCIONES SST', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 18:07:08', '2023-09-04 18:07:08', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('204', null, null, '56', '1', null, null, '2023-08-24', null, '2023-08-24', '07:30:00', '6', 'CI-375-2020  CI-241-2022', null, null, null, '1', 'SEGUIMIENTO A LOS CONVENIOS  ', 'RIONEGRO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 18:40:19', '2023-09-04 18:40:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('205', null, null, '110', '64', null, null, '2023-08-24', null, '2023-08-24', '07:00:00', '6', 'CI-153-2023', null, null, null, '4', 'EVENTO PRIMERA PIEDRA Y ENTREGA MEJORAMIENTOS', 'TAMESIS', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 18:48:57', '2023-09-04 18:48:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('206', null, null, '42', '1', null, null, '2023-08-24', null, '2023-08-27', '07:00:00', '7', 'N/A', null, null, null, '4', 'VISITAS DE CARACTERIZACION ', 'ZONAS RURALES Y URBANAS', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 18:59:19', '2023-09-04 18:59:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('207', null, null, '117', '59', null, null, '2023-08-24', null, '2023-08-25', '06:00:00', '6', '234-2023', null, null, null, '4', 'SEGUIMIENTO AL CONTRATO', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 19:02:51', '2023-09-04 19:02:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('208', null, null, '16', '1', null, null, '2023-08-24', null, '2023-09-25', '05:00:00', '7', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '17.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 19:17:51', '2023-09-04 19:17:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('209', null, null, '16', '1', null, null, '2023-08-24', null, '2023-08-25', '06:00:00', '8', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 19:23:55', '2023-09-04 19:23:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('210', null, null, '77', '1', null, null, '2023-08-24', null, '2023-08-25', '07:00:00', '6', 'CI-660-2021- CI-677-2021', null, null, null, '4', 'Visitas de Recibo', 'CONCEPCION', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 19:30:07', '2023-09-04 19:30:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('211', null, null, '84', '1', null, null, '2023-08-24', null, '2023-08-24', '07:30:00', '6', 'CI-716-2021', null, null, null, '4', 'VISITAS DE RECIBIDOS DE MEJORAMIENTOS DE VIVIENDAS', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 19:36:03', '2023-09-04 19:36:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('212', null, null, '116', '1', null, null, '2023-08-24', null, '2023-09-25', '05:00:00', '6', 'CI-272-2022', null, null, null, '4', 'ENTREGA OFICIAL DE SUBESTACIÓN A LA POLICÍA Y REVISIÓN TÉCNICA CASA DE JUSTICIA EL BAGRE', 'RURAL', '17.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 19:46:04', '2023-09-04 19:46:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('213', null, null, '45', '19', null, null, '2023-08-24', null, '2023-08-25', '05:00:00', '6', 'MANDATO SSJ 12600', null, null, null, '4', 'ENTREGA OFICIAL DE SUBESTACIÓN A LA POLICÍA Y REVISIÓN TÉCNICA CASA DE JUSTICIA EL BAGRE', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 19:52:33', '2023-09-04 19:52:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('214', null, null, '29', '1', null, null, '2023-08-24', null, '2023-08-24', '06:00:00', '8', '362 de 2023', null, null, null, '4', 'Seguimiento contrato ', 'NO ', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 21:21:59', '2023-09-04 21:21:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('215', null, null, '39', '1', null, null, '2023-08-24', null, '2023-08-24', '06:30:00', '6', 'CI-102-2023', null, null, null, '4', 'SEGUIMIENTO Y ENTREGAS MEJORAMIENTOS DEL CI-102-2023', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 21:33:35', '2023-09-04 21:33:35', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('216', null, null, '16', '1', null, null, '2023-08-24', null, '2023-08-25', '05:00:00', '7', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 21:42:17', '2023-09-04 21:42:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('217', null, null, '1', '1', null, null, '2023-08-25', null, '2023-08-25', '06:00:00', '11', 'VIVA', null, null, null, '4', 'SOCIALIZACIÓN PROCESO DE RECONOCIMIENTO DE EDIFICACIONES', 'AMVA', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 22:09:52', '2023-09-04 22:09:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('218', null, null, '6', '1', null, null, '2023-08-25', null, '2023-08-26', '09:00:00', '11', 'VIVA', null, null, null, '4', 'REUNION BENIFICIARIOS PROYTECTO SAN JOSE Nº2, SOCIALIZACION CON LA JUNTA ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 22:17:05', '2023-09-04 22:17:05', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('219', null, null, '16', '87', null, null, '2023-08-25', null, '2023-08-25', '04:00:00', '10', 'ASPDV', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL ASPDV ARMENIA', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 22:25:09', '2023-09-04 22:25:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('220', null, null, '16', '1', null, null, '2023-08-25', null, '2023-08-25', '04:40:00', '10', 'VIVA', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL ASPDV ARMENIA', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 22:44:21', '2023-09-04 22:44:21', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('221', null, null, '16', '64', null, null, '2023-08-25', null, '2023-08-25', '07:00:00', '5', 'VIVA', null, null, null, '4', 'PARTICIPACIÓN EN SESION DEL CONCEJO MUNICIPALL', 'ARMENIA', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 22:58:04', '2023-09-04 22:58:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('222', null, null, '12', '1', null, null, '2023-08-25', null, '2023-09-25', '08:00:00', '8', 'VIVA', null, null, null, '1', 'FORTALECIMIENTO DEL MARKET PLACE - BVM', 'LOBORINA', '16.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 23:02:54', '2023-09-04 23:02:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('223', null, null, '12', '59', null, null, '2023-08-25', null, '2023-08-25', '06:00:00', '7', 'CI-120-2022', null, null, null, '4', 'REUNION CON BENEFICIARIOS DEL PROYECTO NUEVO ESQUEMA', 'CAMPERO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 23:09:23', '2023-09-04 23:09:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('224', null, null, '99', '1', null, null, '2023-08-26', null, '2023-08-26', '05:00:00', '5', 'VIVA', null, null, null, '4', 'REUNIÓN  COMUNIDAD EXPLICARLOS AVANCES  PROCESO DE LOS 60 MEJORAMIENTOS A EJECUTAR  ', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-04 23:28:10', '2023-09-04 23:28:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('225', null, null, '45', '45', null, null, '2023-08-27', null, '2023-09-01', '08:00:00', '6', 'CI 014-2022', null, null, null, '4', 'SEGUIMIENTO CONVENIO 014-2022', 'NECHI, CAUCASIA, CACERES', '3.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 15:51:01', '2023-09-05 15:51:01', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('226', null, null, '21', '47', null, null, '2023-08-28', null, '2023-09-01', '06:00:00', '6', 'CI-292-2022', null, null, null, '4', 'VISITA DE HABILITACION  PARA EL  MUNICIPIOS DE REMEDIOS CI-292 2022', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '0', '2023-09-05 15:57:53', '2023-09-05 18:24:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('227', null, null, '21', '87', null, null, '2023-08-28', null, '2023-09-01', '06:00:00', '6', ' CI-651-2021 -CI-675-2021', null, null, null, '4', 'VISITAS DE RECIBO A LOS MEJORAMIENTOS DE PISOS Y BAÑOS DE LA CONVOCATORIA, HOGARES DIGNOS PARA LA VIDA', 'CONCORDIA  - ANDES', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 16:06:29', '2023-09-05 16:06:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('228', null, null, '112', '1', null, null, '2023-08-28', null, '2023-09-01', '06:30:00', '6', 'CI-711-2021', null, null, null, '4', 'RECIBOS PISOS Y BAÑOS ', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 16:12:28', '2023-09-05 16:12:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('229', null, null, '1', '1', null, null, '2023-08-28', null, '2023-09-01', '07:00:00', '11', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE DIRECTOR', 'MUNICIPIOS ANTIOQUIA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 16:24:08', '2023-09-05 16:24:08', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('230', null, null, '1', '1', null, null, '2023-08-28', null, '2023-09-01', '06:30:00', '10', 'VIVA', null, null, null, '4', 'TRASLADO PERMANENTE JEFE COMUNICACIONES', 'AMVA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 16:28:29', '2023-09-05 16:28:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('231', null, null, '111', '47', null, null, '2023-08-28', null, '2023-09-01', '06:30:00', '6', 'CI -165 - 2023', null, null, null, '4', ' HABILITACION A  LOS MEJORAMIENTOS ADSCRITOS AL CI-144-2023', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 16:34:59', '2023-09-05 16:34:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('232', null, null, '89', '1', null, null, '2023-08-28', null, '2023-09-01', '06:30:00', '6', 'CI-689-2021', null, null, null, '4', 'VISITAS DE HABILITACION Y RECIBOS', 'SAN JOSE DE LA MONTAÑA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 16:57:21', '2023-09-05 16:57:21', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('233', null, null, '14', '1', null, null, '2023-08-28', null, '2023-08-31', '06:00:00', '5', 'CI-284-2022', null, null, null, '4', 'VISITAS DE RECIBO A MEJORAMIENTOS', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 17:06:22', '2023-09-05 17:06:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('234', null, null, '13', '1', null, null, '2023-08-28', null, '2023-08-30', '05:00:00', '3', 'CA-528-2021', null, null, null, '4', ' verificar la calidad, el estado y el cumplimiento del manual de supervisión.', 'CHIGORODO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 17:12:08', '2023-09-05 17:12:08', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('235', null, null, '89', '1', null, null, '2023-08-28', null, '2023-08-30', '06:30:00', '6', 'CI -300 - 2022', null, null, null, '4', 'SEGUIMIENTO MEJORAMIENTOS  ADSCRITOS AL CI-300-2022', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 17:22:49', '2023-09-05 17:22:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('236', null, null, '104', '1', null, null, '2023-08-28', null, '2023-08-29', '17:00:00', '7', 'ASPV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 17:25:54', '2023-09-05 17:25:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('237', null, null, '104', '1', null, null, '2023-08-28', null, '2023-08-29', '05:00:00', '7', 'ASPDV', null, null, null, '4', 'PREJORNADA JORNADA ASPDV ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 17:46:17', '2023-09-05 17:46:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('238', null, null, '11', '1', null, null, '2023-08-28', null, '2023-08-29', '06:30:00', '6', 'CI-170-2023', null, null, null, '4', 'REUNIÓN Y VISITAS DE HABILITACIÓN NUEVO ESQUEMA', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 17:57:14', '2023-09-05 17:57:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('239', null, null, '93', '85', null, null, '2023-08-28', null, '2023-08-29', '05:00:00', '6', 'CI-655-2021', null, null, null, '4', 'RECIBO COCINAS', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 17:59:23', '2023-09-05 17:59:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('240', null, null, '77', '47', null, null, '2023-08-28', null, '2023-08-29', '06:00:00', '7', 'CI-338-2023', null, null, null, '4', 'REALIZACION CARACTERIZACIONES TECNICO Y SOCIALES', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 18:03:39', '2023-09-05 18:03:39', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('241', null, null, '83', '47', null, null, '2023-08-28', null, '2023-09-01', '06:00:00', '6', 'CI-292-2022', null, null, null, '4', 'VISITA DE HABILITACION  PARA EL  MUNICIPIOS DE REMEDIOS CI-292 2022', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 18:28:06', '2023-09-05 18:28:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('242', null, null, '1', '84', null, null, '2023-08-28', null, '2023-09-01', '07:30:00', '5', 'VIVA', null, null, null, '1', 'TRASLADO PERMANENTE DIRECTOR', 'RETIRO -MEDELLIN-RETIRO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 18:33:34', '2023-09-05 18:33:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('243', null, null, '45', '1', null, null, '2023-08-28', null, '2023-09-01', '08:00:00', '6', 'CI 014-2022', null, null, null, '4', 'SEGUIMIENTO CONVENIO 014-2022', 'NECHI, CAUCASIA, CACERES', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 18:40:32', '2023-09-05 18:40:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('244', null, null, '104', '1', null, null, '2023-08-29', null, '2023-08-29', '05:00:00', '10', 'ASPV', null, null, null, '4', 'ACOMPAÑAMIENTO COMUNICACIONAL A JORNADA DE ASPDV', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 18:48:32', '2023-09-05 18:48:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('245', null, null, '28', '19', null, null, '2023-08-29', null, '2023-09-02', '06:00:00', '6', 'CI-307-2022          CI-265-2022   ', null, null, null, '4', 'HABILITACION PISO Y BAÑO EN CAMPAMENTO -                      RECIBO DE MEJORAMIENTOS PISOS Y BAÑOS EN CAMPAMENTO', 'NO', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 18:59:24', '2023-09-05 18:59:24', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('246', null, null, '77', '19', null, null, '2023-08-29', null, '2023-09-01', '06:00:00', '6', 'CI-632-2021', null, null, null, '4', ' REVISIÓN Y RECIBO DE MEJORAMIENTOS LOCATIVOS RURALES.', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 19:10:49', '2023-09-05 19:10:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('247', null, null, '52', '19', null, null, '2023-08-29', null, '2023-09-01', '06:00:00', '6', 'CI-307-2022', null, null, null, '4', 'VISITAS   RECIBO  PISOS ,BAÑOS Y COCINAS', 'NO', '2.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 19:14:26', '2023-09-05 19:14:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('248', null, null, '10', '1', null, null, '2023-08-29', null, '2023-08-31', '06:00:00', '11', 'VIVA', null, null, null, '4', 'REVISIÓN DE EXPEDIENTES', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 19:19:44', '2023-09-05 19:19:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('249', null, null, '9', '19', null, null, '2023-08-29', null, '2023-08-31', '07:00:00', '6', 'CI-307-2022', null, null, null, '4', 'SEGUIMIENTO MEJORAMIENTOS RURALES', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 19:26:03', '2023-09-05 19:26:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('250', null, null, '78', '1', null, null, '2023-08-29', null, '2023-08-30', '06:00:00', '6', 'CI-319-2023', null, null, null, '4', 'HABILITACION DE COCINAS URBANAS', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-05 19:32:10', '2023-09-05 19:32:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('251', null, null, '40', '1', null, null, '2023-08-29', null, '2023-08-30', '07:00:00', '6', 'CI-144-2023', null, null, null, '4', 'HABILITACION DE COCINAS URBANAS', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-07 19:00:56', '2023-09-07 19:00:56', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('252', null, null, '90', '19', null, null, '2023-08-29', null, '2023-08-30', '06:00:00', '6', 'VISITAS DE RECIBO CI 707   ', null, null, null, '4', 'VISITAS DE RECIBO CI 707   ', 'NO', '1.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-07 19:07:09', '2023-09-07 19:07:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('253', null, null, '48', '1', null, null, '2023-08-29', null, '2023-08-29', '06:00:00', '8', '4600014535 de 2023', null, null, null, '4', 'SEGUIMIENTO A CONTRATO', 'NO', '0.50', 'Solicitado', null, null, null, null, '1', '1', '2023-09-07 19:10:33', '2023-09-07 19:10:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('255', '1', '0.00', '80', '1', null, null, '2023-08-01', 'SI', '2023-09-05', '07:00:00', '1', 'VIVA', 'GDW361', 'HERNEY MENDEZ MUÑOZ', '301 6640942', '4', 'AVANZADO DE SEGURIDAD GOBERNADOR DE ANTIOQUIA', 'SANTO DOMINGO   Y SAN VICENTE', '35.00', 'Cancelado', null, null, null, null, '1', '0', '2023-09-13 23:46:39', '2023-09-18 21:03:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('256', '1', '0.00', '118', '19', null, null, '2023-08-01', 'SI', '2023-08-05', '07:00:00', '6', 'CI-709-2021', 'LKO483', 'ALFREDO JOSE DAVILA JIMENEZ', '3246050095', '4', 'HABILITACIONY RECIBOS DE PISOS Y BAÑOS', 'NO', '4.00', 'Asignado', null, null, null, null, '1', '1', '2023-09-13 23:52:49', '2023-10-09 21:57:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('257', null, null, '1', '1', null, null, '2023-08-30', 'NO', '2023-08-30', '06:00:00', '9', 'VIVA    ', null, null, null, '4', 'TRANSPORTE COORDINADOR', '', '0.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-13 23:59:38', '2023-09-13 23:59:38', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('258', null, null, '52', '19', null, null, '2023-08-30', 'SI', '2023-09-02', '06:00:00', '6', 'CI-307-2022', null, null, null, '4', 'VISITAS   RECIBO  PISOS ,BAÑOS Y COCINAS', '', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 00:04:17', '2023-09-14 00:04:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('259', null, null, '9', '1', null, null, '2023-08-30', 'SI', '2023-09-01', '05:00:00', '6', 'CI-307-2022', null, null, null, '4', 'VISITA DE HABILITACION, SEGUIMIENTO Y RECIBO A LOS MEJORAMIENTOS', '', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 00:07:54', '2023-09-14 00:07:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('260', null, null, '11', '1', null, null, '2023-08-30', 'SI', '2023-09-01', '06:30:00', '6', 'CI-661-2021', null, null, null, '4', ' RECIBO DE LOS MEJORAMIENTOS', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 00:15:26', '2023-09-14 00:15:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('261', null, null, '29', '1', null, null, '2023-08-30', 'SI', '2023-09-01', '06:00:00', '6', 'CI-676-2021 ', null, null, null, '4', 'RECIBO DE MEJORAMIETOS RURALES', 'NO', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 00:20:11', '2023-09-14 00:20:11', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('262', null, null, '102', '19', null, null, '2023-08-30', 'SI', '2023-09-01', '06:00:00', '6', 'CI-676-2021 ', null, null, null, '4', 'VISITA AL  MUNICIPIO DE SANTA ROSA DE OSOS PARA VISITAS DE RECIBO  DE MEJORAMIENTOS BAÑOS Y PISOS ', 'ZONA RURAL, VIAS COMPLICADAS', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 00:29:36', '2023-09-14 00:29:36', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('263', null, null, '8', '1', null, null, '2023-08-30', 'NO', '2023-09-01', '06:30:00', '6', 'CI-652-2021', null, null, null, '4', 'Reunión de inicio Adición- Visitas de habilitación', 'Zona Rural', '2.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 00:36:13', '2023-09-14 00:36:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('264', null, null, '1', '1', null, null, '2023-08-30', 'SI', '2023-08-31', '06:00:00', '6', '234-2023', null, null, null, '4', 'SEGUIMIENTO AL CONTRATO', 'VALPARAISO', '1.00', 'Solicitado', null, null, null, null, '2', '1', '2023-09-14 00:42:51', '2023-09-14 00:42:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('265', null, null, '80', '1', null, null, '2023-08-30', 'SI', '2023-08-31', '07:00:00', '12', 'CI-154-2023   CI-193-2023', null, null, null, '1', 'SEGUIMIENTO CONVENIOS CI-154-2023 Y CI-193-2023', 'VEGACHI', '1.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 00:55:14', '2023-09-14 00:55:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('266', null, null, '37', '19', null, null, '2023-08-30', 'NO', '2023-08-31', '07:00:00', '6', 'CI 116-2023', null, null, null, '4', 'CI 116-2023 CISNEROS- RECIBO DE MEJORAMIENTOS DE VIVIENDA EN ZONA URBANA', 'NO', '1.00', 'Solicitado', null, null, null, null, '2', '1', '2023-09-14 00:59:14', '2023-09-14 00:59:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('267', null, null, '119', '1', null, null, '2023-08-30', 'NO', '2023-08-31', '06:00:00', '6', 'CI-238-2023', null, null, null, '4', 'RECIBO DE COCINAS DE LA CONVOCATORIA + COCINAS', '', '1.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 01:07:42', '2023-09-14 01:07:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('268', null, null, '7', '1', null, null, '2023-08-30', 'NO', '2023-08-30', '06:00:00', '8', '337 de 2023', null, null, null, '4', 'Seguimiento contrato ', 'NO', '0.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-14 01:11:46', '2023-09-14 01:11:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('269', '1', '0.00', '100', '1', null, null, '2023-08-30', 'NO', '2023-08-30', '14:30:00', '11', 'VIVA', 'fgi331', 'sandoval blacke', '33333333', '1', 'REUNION DIRECTIVA JUNTAS DE VIVIENDAS (JUNTOS HAREMOS EL CAMBIO)', 'NO', '0.00', 'Cancelado', null, null, null, null, '2', '0', '2023-09-14 01:20:59', '2023-09-18 16:23:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('270', '1', '0.00', '38', '1', null, null, '2023-08-30', 'NO', '2023-08-30', '07:00:00', '6', 'CI-101-2023', 'hhu113', 'humberto calle', '32323', '1', 'REUNIÓN DE INICIO, NUEVO ESQUEMA.', '', '0.00', 'Cancelado', null, null, null, null, '3', '0', '2023-09-14 01:32:07', '2023-09-18 16:23:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('271', '1', '0.00', '28', '85', null, null, '2023-08-30', 'SI', '2023-08-31', '05:00:00', '6', 'CI-655-2021', 'jpu897', 'daniel rodriguez', '2222222222', '4', 'RECIBO COCINAS', 'CAMPAMENTO ', '1.00', 'Cancelado', null, null, null, null, '1', '0', '2023-09-14 01:35:50', '2023-09-18 17:56:37', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('272', '1', '0.00', '81', '1', null, null, '2023-08-01', 'SI', '2023-08-05', '07:00:00', '1', 'SANTO DOMINGO   Y SAN VICENTE', null, null, null, '1', 'AVANZADO DE SEGURIDAD GOBERNADOR DE ANTIOQUIA', 'SANTO DOMINGO   Y SAN VICENTE', '4.00', 'Autorizado', null, null, null, null, '1', '1', '2023-09-18 17:07:35', '2023-09-18 18:34:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('273', '5', '0.00', '1', '1', null, null, '2023-08-01', 'SI', '2023-08-01', '07:00:00', '11', 'VIVA', 'ESQ692', 'HERIBEL  MUNERA AGUDELO', '314 7674592', '4', 'AREA METROPOLITANA Y CORREGUIMIENTOS', 'AMVA', '0.00', 'Asignado', null, null, null, null, '2', '1', '2023-09-18 21:51:54', '2023-09-18 22:02:45', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('274', '6', '0.00', '7', '1', null, null, '2023-08-01', 'NO', '2023-08-01', '06:00:00', '6', 'VIVA-CF-475-2006 ', null, null, null, '1', 'SEGUIMIENTO AL CONVENIO VIVA-CF-475-2006 ', 'CASCO URBANO DEL MUNICIPIO', '0.00', 'Autorizado', null, null, null, null, '1', '1', '2023-09-18 22:09:12', '2023-09-18 22:26:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('275', '6', '0.00', '85', '1', null, null, '2023-08-01', 'NO', '2023-08-01', '07:30:00', '6', 'CI-562-2021', '', '', '', '4', 'REVISIÓN PROYECTOS VNU', 'NO', '0.00', 'Asignado', null, null, null, null, '1', '1', '2023-09-18 22:14:27', '2023-09-18 23:18:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('276', '6', '0.00', '107', '1', null, null, '2023-08-01', 'NO', '2023-08-01', '07:00:00', '6', '233-2022', 'ESP488', 'JORGE HUMBERTO MONTOYA HIGUITA', '316 4926827', '1', 'CI 233-2022 SOPETRÁN, RECIBO DE MEJORAMIENTOS DE VIVIENDA EN ZONA URBANA', 'NO', '0.00', 'Asignado', null, null, null, null, '2', '1', '2023-09-18 22:19:27', '2023-09-18 22:57:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('277', '5', '0.00', '1', '1', null, null, '2023-08-01', 'NO', '2023-08-01', '07:00:00', '11', 'VIVA', 'JYX068', 'AUGUSTO  ESCALANTE  MORALES', '3506420188', '1', 'ARQUITECTONICO', 'NO', '0.00', 'Asignado', null, null, null, null, '3', '1', '2023-09-18 22:26:09', '2023-09-18 22:56:45', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('278', '5', '0.00', '5', '1', null, null, '2023-08-02', 'NO', '2023-08-04', '06:00:00', '6', 'CI-714-2021', null, null, null, '6', ' PISOS- BAÑOS CONVOCATORIAS \" HDPV\" ', 'NO', '2.00', 'Autorizado', null, null, null, null, '1', '1', '2023-09-19 16:16:04', '2023-10-02 23:30:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('279', '0', '0.00', '38', '1', null, null, '2023-11-25', 'SI', '2023-11-29', '05:00:00', '6', 'gjhjkh', 'JYY190', 'ARLEI DARIO BUILES CARO', '323 4332706', '4', 'fhfhggkhkh', 'ggjh', '4.00', 'Asignado', null, null, null, null, '1', '1', '2023-09-22 21:21:25', '2023-11-07 22:21:34', 'prueba', 'prueba', null, null);
INSERT INTO `trans_servicios` VALUES ('280', null, null, '41', '1', null, null, '2023-09-26', 'NO', '2023-09-29', '06:00:00', '1', '234', '', '', '', '', 'bfcbc', 'BARBOSA', '3.00', 'Solicitado', null, null, null, null, '1', '1', '2023-09-26 21:29:58', '2023-09-26 21:36:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('281', '5', '0.00', '9', '1', null, null, '2023-10-23', 'SI', '2023-10-27', '09:47:00', '7', 'VIVA', null, null, null, '6', 'AVANZADA PARA EVENTO DE UNIDOS', 'AVANZADA PARA EVENTO DE UNIDOS ', '4.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-06 16:51:32', '2023-10-17 19:11:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('282', null, null, '17', '87', null, null, '2023-10-13', 'NO', '2023-10-13', '06:00:00', '6', 'CONVENIO 791 DE 2021', null, null, null, '6', 'HABILITACIONES\n', 'NO', '0.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-11 23:36:10', '2023-10-17 19:11:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('283', null, null, '106', '1', null, null, '2023-10-18', 'SI', '2023-10-20', '06:30:00', '6', 'CI-132-2023', null, null, null, '4', 'VISITAS DE HABILITACIONES DE MEJORAMIENTOS DE VIVIENDAS URBANAS Y REUNION INICIAL', 'NO', '2.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-11 23:43:59', '2023-10-17 19:11:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('284', null, null, '106', '1', null, null, '2023-10-24', 'SI', '2023-10-27', '06:30:00', '6', 'CI-132-2023', null, null, null, '4', 'VISITAS DE HABILITACIONES DE MEJORAMIENTOS DE VIVIENDAS URBANAS Y REUNION INICIAL', 'PEÑOL CI-103-2023', '3.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-12 00:00:32', '2023-10-17 19:11:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('285', null, null, '116', '47', null, null, '2023-10-17', 'SI', '2023-10-21', '05:00:00', '6', 'CL-186-2023', null, null, null, '6', 'VISITAS DE HABILITACION A  LOS MEJORAMIENTO', 'NO', '4.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-12 00:24:25', '2023-10-17 19:11:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('286', null, null, '116', '47', null, null, '2023-10-17', 'SI', '2023-10-21', '05:00:00', '6', 'CL-186-2023', null, null, null, '6', 'VISITAS DE HABILITACION A  LOS MEJORAMIENTO', 'NO', '4.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-12 01:04:58', '2023-10-17 19:11:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('287', null, null, '116', '47', null, null, '2023-10-24', 'SI', '2023-10-28', '05:00:00', '6', 'CL-186-2023', null, null, null, '6', 'VISITAS DE HABILITACION A  LOS MEJORAMIENTO', 'NO', '4.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-13 00:29:33', '2023-10-17 19:11:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('288', null, null, '17', '51', null, null, '2023-10-17', 'NO', '2023-10-19', '07:30:00', '7', 'CI- 791-2021', null, null, null, '7', 'VISITA AL MUNICIPIO PARA ACTIVIDADES DE HABILITACION', '', '2.00', 'Cancelado', null, null, null, null, '1', '1', '2023-10-13 00:33:47', '2023-10-17 19:11:36', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('289', '1', '8936522.00', '112', '1', null, null, '2023-10-02', 'SI', '2023-10-07', '06:00:00', '6', 'CI-711-2021', null, null, null, '7', 'HABILITACIONES PISOS Y BAÑOS ', 'NO', '5.00', 'Autorizado', null, null, null, null, '1', '1', '2023-10-18 00:26:52', '2023-10-18 23:07:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('290', null, null, '112', '1', null, null, '2023-10-02', 'SI', '2023-10-07', '06:00:00', '6', 'CI-711-2021', null, null, null, '7', 'HABILITACIONES PISOS Y BAÑOS ', 'NO', '5.00', 'Solicitado', null, null, null, null, '1', '1', '2023-10-18 23:04:52', '2023-10-18 23:04:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('291', '1', '8936522.00', '17', '1', null, null, '2023-10-31', 'SI', '2023-11-01', '06:00:00', '6', 'VIVA', null, null, null, '7', 'ENTREGA DE VIVIENDA', 'COPACABANA', '1.00', 'Autorizado', null, null, null, null, '1', '1', '2023-10-31 16:31:19', '2023-10-31 16:39:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);
INSERT INTO `trans_servicios` VALUES ('292', null, null, '14', '1', null, null, '2023-11-02', 'SI', '2023-11-03', '06:00:00', '9', 'FSDGD', null, null, null, '4', 'RERGER', 'PUERTO BERRIO', '1.00', 'Solicitado', null, null, null, null, '1', '1', '2023-11-01 22:19:55', '2023-11-01 22:19:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO', null, null);

-- ----------------------------
-- Table structure for `trans_servidores_movilizados`
-- ----------------------------
DROP TABLE IF EXISTS `trans_servidores_movilizados`;
CREATE TABLE `trans_servidores_movilizados` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Servicio` int DEFAULT NULL,
  `Identificacion` int DEFAULT NULL,
  `Servidor` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Direccion` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of trans_servidores_movilizados
-- ----------------------------
INSERT INTO `trans_servidores_movilizados` VALUES ('7', '7', null, 'Pedro Perez', '2323', 'Almacentro ', '1', '2023-05-24 08:29:44', '2023-05-24 08:29:44', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `trans_servidores_movilizados` VALUES ('8', '7', null, 'Maria Martinez', '45456456456', 'Carrera 23 # 87 CENTRO ', '0', '2023-05-24 08:29:44', '2023-05-24 08:29:44', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `trans_servidores_movilizados` VALUES ('9', '8', null, 'daniel rodriguez', '3332222', 'Cll 23 # 33 robledo ', '1', '2023-06-07 15:43:40', '2023-06-07 15:43:40', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('10', '8', null, 'pedro perez', '222222', '', '1', '2023-06-07 15:43:40', '2023-06-07 15:43:40', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('11', '9', null, 'wsdsd', '333', '', '1', '2023-06-07 16:06:35', '2023-06-07 16:06:35', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('12', '10', null, 'fulanito de tal', '123', 'almacentro ', '1', '2023-06-20 08:07:45', '2023-06-20 08:07:45', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('13', '11', null, 'test', '222', 'dddd ', '0', '2023-06-28 11:20:42', '2023-06-28 11:20:42', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('14', '11', null, 'test 2 ', '2323', '', '0', '2023-06-28 11:20:42', '2023-06-28 11:20:42', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('15', '12', null, 'test', '222', 'dddd ', '0', '2023-06-28 11:21:11', '2023-06-28 11:21:11', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('16', '12', null, 'test 2 ', '2323', '', '1', '2023-06-28 11:21:11', '2023-06-28 11:21:11', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('17', '0', '121', 'test', '1111', '', '1', '2023-07-05 10:33:07', '2023-07-05 10:33:07', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('18', '0', '121', 'test', '1111', '', '1', '2023-07-05 10:33:24', '2023-07-05 10:33:24', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('19', '8', '12', 'test', '12', '', '0', '2023-07-05 10:35:16', '2023-07-05 10:35:16', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('20', '8', '12', 'test2', '12', '', '0', '2023-07-05 10:37:00', '2023-07-05 10:37:00', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('21', '8', '12', 'test', '12', '', '0', '2023-07-05 10:38:13', '2023-07-05 10:38:13', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('22', '8', '12', 'test', '12', '', '0', '2023-07-05 11:03:23', '2023-07-05 11:03:23', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('23', '8', '12', 'test', '44', '', '0', '2023-07-05 11:05:40', '2023-07-05 11:05:40', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('24', '8', '122', 'test2', '1', 'test2 122 1 cra 1 2 3 ', '1', '2023-07-05 11:11:22', '2023-07-05 11:11:22', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('25', '8', '12', 'primero', '12', 'primero 12 12 cra 2 2 2 ', '1', '2023-07-05 11:15:06', '2023-07-05 11:15:06', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('26', '11', '12', 'primero', '12', 'primero 12 12 cra 2 2 2 ', '1', '2023-07-05 11:15:21', '2023-07-05 11:15:21', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('27', '11', '12', 'segundo', '12', 'primero 12 12 cra 2 2 2 ', '1', '2023-07-05 11:15:30', '2023-07-05 11:15:30', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('28', '11', '12', 'segundo', '12', 'primero 12 12 cra 2 2 2 ', '1', '2023-07-05 11:16:25', '2023-07-05 11:16:25', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('29', '12', '12', 'primero', '12', 'primero 12 12 cra 1 2 3 ', '0', '2023-07-05 11:22:03', '2023-07-05 11:22:03', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('30', '12', '2222', 'dddd', '333', 'cra 1 2 3 ', '1', '2023-07-05 11:31:03', '2023-07-05 11:31:03', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('31', '13', '123', 'pasajero 1', '78999', 'Cll 34 # 78 almacentro ', '1', '2023-08-01 10:20:26', '2023-08-01 10:20:26', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('32', '13', '222', 'dasda', '222', '', '1', '2023-08-01 10:20:26', '2023-08-01 10:20:26', '', '');
INSERT INTO `trans_servidores_movilizados` VALUES ('33', '14', '0', 'ALEJANDRA HOYOS CORREA', '3104197425', 'EL RETIRO CL 28 C  N°16 B- 20 URB BOSQUES DE NORMANDIA. ', '1', '2023-08-15 17:35:49', '2023-08-15 17:35:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('34', '15', '0', 'LUIS FERNANDO CORTÉS       ', '3105600067', 'SABANETA ', '1', '2023-08-15 17:51:44', '2023-08-15 17:51:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('35', '16', '0', 'lucas garcia', '3003020731', 'CALLE 75 AA SUR #  52 D- 60  FRONTERA SURAMERICANA   ITAGUI ', '1', '2023-08-15 18:11:19', '2023-08-15 18:11:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('36', '17', '0', 'ORLANDO DIAZ', '3014621393', 'CRA 65C No 38A SUR-44 AUTOPISTA  MEDELLIN  BOGOTA K.17 MAS 300 ALTO DE LA VIRGEN    ', '1', '2023-08-15 18:18:10', '2023-08-15 18:18:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('37', '18', '0', 'LEISON FREYDER ROMAÑA', '3218013934', 'CALLE 29 C #33-53 CASA 106 AIRES DE SAN DIEGO LOMA DEL INDIO ', '1', '2023-08-15 18:25:10', '2023-08-15 18:25:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('38', '19', '0', 'WALTER  BELTRAN       ', '3122377387', 'BELLO CR 49 # 45 - 48 INT 1401URB. SANTA CLARA ', '1', '2023-08-15 18:38:47', '2023-08-15 18:38:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('39', '19', '1', 'RUBEN AGUDELO ', '3045649353', 'CLE 80 # 71 12 CORDOBA -ROBLEDO ', '1', '2023-08-15 18:38:47', '2023-08-15 18:38:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('40', '20', '0', 'PLINIO MOSQUERA ', '3207786657', 'CLL 68 A # 27 46 MANRIQUE ', '1', '2023-08-15 19:07:03', '2023-08-15 19:07:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('41', '20', '1', 'ISABEL CORREA', '3246361416', 'CRA 65 A # 93 - 05 CASTILLA ', '1', '2023-08-15 19:07:03', '2023-08-15 19:07:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('42', '21', '2', 'VALENTINA SANCHEZ ', '3012014918', 'CLL 75 SUR # 33 - 03SABANETA  ', '1', '2023-08-15 19:18:11', '2023-08-15 19:18:11', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('43', '21', '3', 'DIEGO TORRES', '30522713293207886879', ' CRA 27 #3 8 SUR 51 ENVIGADO  ', '1', '2023-08-15 19:18:11', '2023-08-15 19:18:11', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('44', '22', '3', 'KELY YOHANA GARCES      ', '3128360876', 'CL 69 CR 96 E-33 (INT 406) Robledo La Huerta ', '1', '2023-08-15 19:32:50', '2023-08-15 19:32:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('45', '22', '4', '  VANESSA AREIZA   ', '3024388761', 'CL 69 CR 96 E-33 (INT 406) Robledo La Huerta ', '1', '2023-08-15 19:32:50', '2023-08-15 19:32:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('46', '22', '2', 'LAURIN QUINTERO  ', '3024388761', 'CL 69 CR 96 E-33 (INT 406) Robledo La Huerta ', '1', '2023-08-15 19:32:50', '2023-08-15 19:32:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('47', '22', '5', 'ESNEIDER ARGAEZ   ', '3128360876', 'CL 69 CR 96 E-33 (INT 406) Robledo La Huerta ', '1', '2023-08-15 19:32:50', '2023-08-15 19:32:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('48', '22', '1', '  WILLIAM ALVAREZ  ', '3128360876', 'CL 69 CR 96 E-33 (INT 406) Robledo La Huerta ', '1', '2023-08-15 19:32:50', '2023-08-15 19:32:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('49', '23', '1', 'PAULA TORRES', '3207841700', 'CLL 55A SUR #38-130 URB. VILLA ROMERA-SABANETA  ', '1', '2023-08-15 21:23:15', '2023-08-15 21:23:15', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('50', '24', '2', 'JORGE JAIME FONSECA ', '3187897220', ' URB. RESIDENCIAL ORIGEN - CALLE 50 # 96C-90  CALASANZ ', '1', '2023-08-15 21:29:28', '2023-08-15 21:29:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('51', '25', '3', 'ALEXANDER SOTO YANEZ', '3114632240', 'CRA 44 # 26-71, URB. MADERA ESCENCIAL. T  8 APT 901. BELLO ', '1', '2023-08-15 21:38:38', '2023-08-15 21:38:38', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('52', '26', '0', 'ROLANDO MUÑOZ MANCERA', '3014338591', 'CL 44S #47-18 MILAN CONDOMINIO 9 ENVIGADO ', '1', '2023-08-15 22:02:47', '2023-08-15 22:02:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('53', '27', '2', 'JULIANA ZAPATA', '3197562683', 'Cr. 65A # 68-44 BELLO ', '1', '2023-08-15 22:06:35', '2023-08-15 22:06:35', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('54', '28', '3', 'SANTIAGO ORTIZ      ', '3216925932', 'CL 40 #105-146 AP 509, Urb. Abedules San Javier ', '1', '2023-08-15 22:11:50', '2023-08-15 22:11:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('55', '28', '4', 'FELIPE ALVAREZ', '3216925932', '', '1', '2023-08-15 22:11:50', '2023-08-15 22:11:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('56', '29', '2', 'SANTIAGO GALEANO', '3183580602', 'CR 81 C # 49F-50 Ed BELLO HORIZONTE ', '1', '2023-08-15 22:21:57', '2023-08-15 22:21:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('57', '30', '8', 'IVAN DE VARGAS', '3242788219', 'C RA 59 B # 40 39 PISO 1- SERRAMONTE  EN BELLO ', '1', '2023-08-15 22:36:28', '2023-08-15 22:36:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('58', '31', '4', 'LAURA ARANGO             ', '3206360538', 'CRA25 A #40F SUR 159- ENVIGADO ', '1', '2023-08-15 22:47:22', '2023-08-15 22:47:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('59', '31', '5', '     YULIANA RESTREPO     ', '3206360538', 'CRA25 A #40F SUR 159- ENVIGADO ', '1', '2023-08-15 22:47:22', '2023-08-15 22:47:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('60', '31', '7', '      DANIEL MARIN', '3206360538', 'CRA25 A #40F SUR 159- ENVIGADO ', '1', '2023-08-15 22:47:22', '2023-08-15 22:47:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('61', '32', '4', 'SANDRA  PARRA  ', '3113077142', ' CALL 79 CR 57 B-2  BELLO, ARAUCARIAS  ', '1', '2023-08-15 23:01:16', '2023-08-15 23:01:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('62', '33', '6', 'HENRY ALDEMAR PORTILLA', '3043786062', 'CLL 15 #79-204 APTO 607 ', '1', '2023-08-15 23:26:43', '2023-08-15 23:26:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('63', '34', '2', 'ADRIANA GUTIÉRREZ ', '3127249067', 'CRA 73C 74 247 -MONTECLARO- ROBLEDO PILARICA ', '1', '2023-08-15 23:33:41', '2023-08-15 23:33:41', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('64', '35', '5', 'BEATRIZ ELENA VASQUEZ  ', '3128927499', 'CRA 58D # 68C - 10  BELLO ', '1', '2023-08-15 23:36:44', '2023-08-15 23:36:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('65', '36', '6', 'SANTIAGO BENJUMEA    ', '3003652298', 'CLAR 5 # 66 B - 58 ', '1', '2023-08-15 23:50:13', '2023-08-15 23:50:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('66', '36', '5', ' ANA MARIA BOTERO     ', '30179130013', 'CLLE 34 # 81 A - 94 ', '1', '2023-08-15 23:50:13', '2023-08-15 23:50:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('67', '36', '8', '   CATALINA FRANCO  ', '3103893895', 'CLLE 4 # 17 - 115 APTO 1306 ', '1', '2023-08-15 23:50:13', '2023-08-15 23:50:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('68', '36', '9', 'PAOLA CASTELLANOS', '3017693961', '  CLE 30 # 83-21 LOS ALPES ', '1', '2023-08-15 23:50:13', '2023-08-15 23:50:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('69', '37', '5', 'JAVIER CANTILLO     ', '3057548460', 'CRA 37 # 54 - 35 BOSTON ', '1', '2023-08-16 00:00:50', '2023-08-16 00:00:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('70', '37', '7', '                     JULIAN CANO       ', '004418096', 'CRA 34 # 100 - 01 SAN PABLO  ', '1', '2023-08-16 00:00:50', '2023-08-16 00:00:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('71', '37', '6', 'LUZ ADRIANA AMANTE     ', '3127131053', 'CRA 67 # 97 - 47 CASTILLA ', '1', '2023-08-16 00:00:50', '2023-08-16 00:00:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('72', '37', '2', 'JUAN PABLO TORO', '3137273730', 'CLE 9 # 72-50 URB BIZET 1 LA MOTA. ', '1', '2023-08-16 00:00:50', '2023-08-16 00:00:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('73', '38', '5', 'SANDRA MORENO', '3162680262', 'MEDELLIN; CAL 34C N°82A-23 ', '1', '2023-08-16 00:05:26', '2023-08-16 00:05:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('74', '39', '5', 'SINDY MORENO', '3146466478', 'CRA 71 #20E25 INT 105 BARRIO PARIS, BELLO ', '1', '2023-08-16 00:18:19', '2023-08-16 00:18:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('75', '40', '5', 'JUAN ESTEBAN GARCIA', '3164526800', 'CLLE 117 # 67 B - 57 ', '1', '2023-08-16 00:39:18', '2023-08-16 00:39:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('76', '41', '5', 'INTEND.EDISON GIRALSO', '3103749320', 'ALPUJARRA GOBERNACION  ', '1', '2023-08-16 00:43:55', '2023-08-16 00:43:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('77', '42', '2', 'DANIEL MORALES', '3176988248', 'copacabana Cra 35 N.49C-34 Ap 208 el tablazo ', '1', '2023-08-16 15:40:26', '2023-08-16 15:40:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('78', '42', '9', 'PAOLA CASTELLANOS', '3017693961', ' Vereda el Uvito parte baja San cristóbal. Casa 15A ', '1', '2023-08-16 15:40:26', '2023-08-16 15:40:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('79', '42', '12', 'HERNAN ARBOLEDA', '3053401180', ' Calle 30#83-21  ', '1', '2023-08-16 15:40:26', '2023-08-16 15:40:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('80', '42', '13', 'PAULA RUIZ', '3113059311', '/Diagonal 43 # 34 E -20, apto 901. Barrio Alcalá Bello. ', '1', '2023-08-16 15:40:26', '2023-08-16 15:40:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('81', '43', '5', 'EDISON PEREZ   ', '3104439789', 'CRA 65 # 101-117 ', '1', '2023-08-16 15:44:31', '2023-08-16 15:44:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('82', '43', '6', 'YOLANDA OSSA ', '3007225513', ' CRA 43 # 47 - 64 - TORRES DE BOMBONA ', '1', '2023-08-16 15:44:31', '2023-08-16 15:44:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('83', '44', '4', 'SNEIDER GARCIA', '3103316409', 'MEDELLÍN CLL. 47A # 14B 06 B. BUENOS AIRES ', '1', '2023-08-16 15:47:58', '2023-08-16 15:47:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('84', '45', '7', 'DIANA GALLO ', '3137313963', 'COPACABANA CRA 40 # 48 - 50 - ', '1', '2023-08-16 16:17:39', '2023-08-16 16:17:39', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('85', '46', '5', 'SINDY MORENO', '3146466478', 'CRA 71 #20E25 INT 105 BARRIO PARIS, BELLO ', '1', '2023-08-16 17:47:15', '2023-08-16 17:47:15', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('86', '47', '4', 'LUZ TATIANA MEDINA ', '3002389950', 'CALLE 49D SUR No.40A-46 ', '1', '2023-08-16 17:51:00', '2023-08-16 17:51:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('87', '48', '4', 'FABIO GAVIRIA', '3105992016', 'CLE 76 # 80-85 ROBLEDO ', '1', '2023-08-16 17:56:56', '2023-08-16 17:56:56', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('88', '48', '6', '   PLINIO  MOSQUERA ', '3207786657', '/  Crr 31  Cll 70 - 28 Manrique oriental ', '1', '2023-08-16 17:56:56', '2023-08-16 17:56:56', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('89', '49', '6', 'PAULA TORRES', '3207841700', 'CLL 55A SUR #38-130 URB. VILLA ROMERA-SABANETA  ', '1', '2023-08-16 18:00:48', '2023-08-16 18:00:48', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('90', '50', '3', 'CATALINA ORTEGA', '3122395922', 'AVDA 26 # 52 -140 NIQUIA  ', '1', '2023-08-16 18:03:01', '2023-08-16 18:03:01', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('91', '51', '5', 'CLAUDIA VELASQUEZ', '3128105856', '  Calle 25 # 53-76 cabañas ', '1', '2023-08-16 18:20:19', '2023-08-16 18:20:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('92', '52', '5', 'LAURA VANESSA ROJAS    ', '3007810612', 'GIRARDOTA ', '1', '2023-08-16 18:22:52', '2023-08-16 18:22:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('93', '53', '6', 'SANDRA CAROLINA PARRA ', '3113077142', 'CALL 79 CR 57 B-2        (BELLO, ARAUCARIAS 2).  ', '1', '2023-08-16 18:25:07', '2023-08-16 18:25:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('94', '54', '3', 'DANIEL DELVASTO', '3185229616', 'CALLE 28 # 84-195 ', '1', '2023-08-16 18:27:27', '2023-08-16 18:27:27', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('95', '55', '5', 'MAYOR JAIRO MORENO', '3102007271', 'MEDELLIN   HOLAYA HERRERA ', '1', '2023-08-16 18:32:12', '2023-08-16 18:32:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('96', '56', '5', 'SNEIDER GARCIA', '3103316409', 'CLL. 47A # 14B 06 B. BUENOS AIRES LOS CERROS ', '1', '2023-08-16 18:37:21', '2023-08-16 18:37:21', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('97', '57', '3', 'ANA MARIA BOTERO', '3017913001', 'CLLE 34 # 81 A - 94  ', '1', '2023-08-16 18:39:57', '2023-08-16 18:39:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('98', '58', '2', 'SANTIAGO ORTIZ  ', '3216925932', 'CL 40 #105-146 AP 509, Ur. Abedules, San Javier - Medellín ', '1', '2023-08-16 18:50:16', '2023-08-16 18:50:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('99', '59', '3', 'JORGE E. JAIMES FONSECA', '3187897220', '', '1', '2023-08-16 18:56:30', '2023-08-16 18:56:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('100', '60', '5', 'IVAN DE VARGAS', '3242788219', 'CARRERA 59B # 40 39 SERRAMONTE-BELLO ', '1', '2023-08-16 18:58:25', '2023-08-16 18:58:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('101', '61', '6', 'LAURA ARANGO ', '3206360538', 'CRA25 A #40F SUR 159- ENVIGADO ', '1', '2023-08-16 19:00:46', '2023-08-16 19:00:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('102', '62', '9', 'ALEJANDRA HOYOS CORREA', '3104197425', 'EL RETIRO CL 28 C  N°16 B- 20 URB BOSQUES DE NORMANDIA. ', '1', '2023-08-16 19:05:52', '2023-08-16 19:05:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('103', '63', '4', 'LUIS FERNANDO CORTÉS', '3105600067', 'SABANETA ', '1', '2023-08-16 19:08:16', '2023-08-16 19:08:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('104', '64', '9', 'LUCAS GARCIA', '3003020731', 'CLLE 75 AA SUR #  52 D- 60  FRONTERA SURAMERICANA   ITAGUI ', '1', '2023-08-16 19:22:00', '2023-08-16 19:22:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('105', '65', '5', 'ORLANDO DIAZ', '3014621393', 'CRA 65C No 38A SUR-44 AUTOPISTA  MEDELLIN  BOGOTA K.17 MAS 300 ALTO DE LA VIRGEN    ', '1', '2023-08-16 19:25:10', '2023-08-16 19:25:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('106', '66', '5', 'LEISON FREYDER ROMAÑA', '3218013934', 'CALLE 29 C #33-53 CASA 106 AIRES DE SAN DIEGO LOMA DEL INDIO ', '1', '2023-08-16 19:27:47', '2023-08-16 19:27:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('107', '67', '4', 'EDISON PEREZ', '3104439789', 'CRA 65 # 101-117CRA 65 # 101-117 ', '1', '2023-08-16 19:30:29', '2023-08-16 19:30:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('108', '68', '7', 'MATEO ARICAPA      ', '3104017422', 'CLLE 41 SUR # 25AA - 132 ED. MIRADOR ENVIGADO   ', '1', '2023-08-16 19:33:41', '2023-08-16 19:33:41', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('109', '69', '5', 'ROLANDO MUÑOZ ', '3014338591', 'CL 44S #47-18 MILAN CONDOMINIO 9 ENVIGADO ', '1', '2023-08-16 19:43:43', '2023-08-16 19:43:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('110', '70', '5', 'LEONARDO LOAIZA ', '3218078367', 'CLL 78B # 75-209 INT 202 ', '1', '2023-08-16 19:50:26', '2023-08-16 19:50:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('111', '71', '5', 'JULIANA ZAPATA', '3197562683', 'Cr. 65A # 68-44 BELLO ', '1', '2023-08-16 19:54:18', '2023-08-16 19:54:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('112', '72', '2', 'BEATRIZ VASQUEZ  ', '3128927499', 'CRA 58D # 68C - 10  BELLO ', '1', '2023-08-16 20:00:31', '2023-08-16 20:00:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('113', '73', '5', 'LUIS BERNARDO RESTREPO        ', '3158518335', 'CLLE 36 SUR #27D-50-LA INMACULADA-ENVIGADO ', '1', '2023-08-16 21:18:46', '2023-08-16 21:18:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('114', '74', '5', 'SANDRA MORENO', '3162680262', 'CALLE 34C Nº 82A-23 ', '1', '2023-08-16 21:22:54', '2023-08-16 21:22:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('115', '75', '6', 'ROSANA ESTRADA  ', '3054143202', 'Av 31 #66-29 Niquia Terranova ', '1', '2023-08-16 21:25:30', '2023-08-16 21:25:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('116', '76', '5', 'JUAN PABLO GOMEZ HERNANDEZ', '3242760773', 'CRA. 84B #4G-75, COLINA DE LOS BERNAL ', '1', '2023-08-16 21:28:48', '2023-08-16 21:28:48', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('117', '77', '6', 'WILMAR OREJUELA TERÁN', '3112903324', 'CALLE 46 NO 51A-28 (ITAGUI- EDIFICIO VIENA ', '1', '2023-08-16 21:31:57', '2023-08-16 21:31:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('118', '78', '0', 'ADRIANA MILENA GUTIÉRREZ  ', '3127249067', 'CARRERA 73C 74 247 ', '1', '2023-08-16 21:38:58', '2023-08-16 21:38:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('119', '79', '5', 'Intendente                                 Edison Giraldo Taborda', '3103749320', 'ALPUJARRA GOBERNACION  ', '1', '2023-08-16 22:55:52', '2023-08-16 22:55:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('120', '80', '2', 'ALEXANDER SOTO YANEZALEXANDER SOTO YANEZ', '3114632240', 'CARRERA 44 # 26-71, CONJUNTO RESIDENCIAL MADERA ESCENCIAL. TORRE 8 APART 901. BELLO ', '1', '2023-08-16 23:01:06', '2023-08-16 23:01:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('121', '81', '5', 'LEONARDO LOAIZA  ', '3218078367', 'CLL 78B # 75-209 INT 202 ', '1', '2023-08-16 23:03:41', '2023-08-16 23:03:41', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('122', '82', '4', 'SANTIAGO GALEANO', '3183580602', 'CR 81 C # 49F-50 Ed BelLohorizonte ', '1', '2023-08-16 23:06:22', '2023-08-16 23:06:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('123', '83', '8', 'LAURA ARANGO MESA ', '3206360538', 'CRA25 A #40F SUR 159- ENVIGADO ', '1', '2023-08-16 23:12:03', '2023-08-16 23:12:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('124', '84', '6', 'ADRIANA   GUTIÉRREZ  ', '3127249067', 'CRA 73C 74 247-MONTECLARO-PILARICA ', '1', '2023-08-16 23:23:19', '2023-08-16 23:23:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('125', '85', '2', 'SINDY MORENO/', '3146466478', 'CRA 71 #20E25 INT 105  PARIS, BELLO ', '1', '2023-08-16 23:28:09', '2023-08-16 23:28:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('126', '86', '5', 'NATALIA MANCO   ', '3043860166', 'CLL 20 FF # 81 A 125 ', '1', '2023-08-16 23:32:49', '2023-08-16 23:32:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('127', '87', '6', 'DANIEL DELVASTO', '3185229616', 'CALLE 28 # 84-195 ', '1', '2023-08-16 23:35:59', '2023-08-16 23:35:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('128', '88', '4', 'ELIANA PRECIADO ', '3017702500', 'CALLE 31 BB # 89 E 75 URB ALTOS DEL CASTILLO -BELEN. ', '1', '2023-08-16 23:44:31', '2023-08-16 23:44:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('129', '89', '5', 'LAURA JARAMILLO', '3206589964', 'CRA 45 # 26 - 162 - APTO 1618 ', '1', '2023-08-17 00:16:04', '2023-08-17 00:16:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('130', '90', '8', ' SANDRA CAROLINA PARRA ', '3113077142', 'CLL 79 CR 57 B-2  BELLO, ARAUCARIAS 2 AL FINAL DEL PARQUEDARO ', '1', '2023-08-17 00:24:28', '2023-08-17 00:24:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('131', '91', '5', 'JAN  DAVID TANGARIFE', '3206657325', 'EL RETIRO           ', '1', '2023-08-17 00:32:14', '2023-08-17 00:32:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('132', '92', '2', 'LUIS FELIPE CAMPOS ', '3105044621', 'CRA 48A #44-21  MANCHESTER- BELLO ', '1', '2023-08-17 00:34:34', '2023-08-17 00:34:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('133', '93', '5', 'DIANA LEGUIZAMON', '3186108417', 'Calle 1AA #66-61Apto 401  ', '1', '2023-08-17 15:10:55', '2023-08-17 15:10:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('134', '94', '6', 'SNEIDER GARCIA  ', '3103316409', 'MEDELLÍN CLL. 47A # 14B 06 B. BUENOS AIRES ', '1', '2023-08-17 15:12:54', '2023-08-17 15:12:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('135', '95', '5', 'LINA NARANJO         ', '3108994080', 'CRA 78 # 30-25   ', '1', '2023-08-17 15:17:55', '2023-08-17 15:17:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('136', '96', '5', 'JULIAN ESTEBAN MAYA  ', '3054531317', 'CRA 96C # 50A - 280, URB. MONTEPARAISO -CALAZANS ', '1', '2023-08-17 15:21:19', '2023-08-17 15:21:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('137', '97', '5', 'MAYOR JAIRO MORENO', '3102007271', 'RIONEGRO  AEROPUERTO JOSE MARIA CORDOBA  ', '1', '2023-08-17 15:50:52', '2023-08-17 15:50:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('138', '98', '2', 'LEISON FREYDER ROMAÑA', '3218013934', 'CALLE 29 C #33-53 CASA 106 AIRES DE SAN DIEGO LOMA DEL INDIO ', '1', '2023-08-17 16:15:18', '2023-08-17 16:15:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('139', '99', '1', 'LUCAS GARCIA', '3003020731', 'CLLE 75 AA SUR #  52 D- 60  FRONTERA SURAMERICANA   ITAGUI ', '1', '2023-08-17 16:22:44', '2023-08-17 16:22:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('140', '100', '2', 'ISABEL OROZCO  ', '3003020731', 'Cra 39 E #48c Sur 103 apto 1114 Magdalena de la Cuenca señorial envigado ', '1', '2023-08-17 16:27:07', '2023-08-17 16:27:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('141', '101', '5', 'CATALINA ORTEGA', '3122395922', 'Avenida 26 # 52-140 Niquia urbanización Roterdam ', '1', '2023-08-17 16:30:59', '2023-08-17 16:30:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('142', '102', '5', 'VICTOR  AGUDELO   ', '3136437597', 'CRA 44 # 26-71 MADERA ESENCIAL - BELLO ', '1', '2023-08-17 16:41:06', '2023-08-17 16:41:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('143', '103', '5', 'HENRY ALDEMAR PORTILLA ', '3043786062', 'CALLE 15 N° 79 - 240  ', '1', '2023-08-17 16:55:04', '2023-08-17 16:55:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('144', '104', '2', 'JEFFERSON MARIN ', '3132814075', 'CRR 105D CLL 60D 38  ', '1', '2023-08-17 17:08:42', '2023-08-17 17:08:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('145', '105', '5', 'CI-138-2023', '3505269803', 'Cra. 80b #8 Sur - 36   ', '1', '2023-08-17 17:14:34', '2023-08-17 17:14:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('146', '106', '8', 'SANTIAGO BENJUMEA  ', '3003652298', 'CLAR 5 # 66 B - 58  ', '1', '2023-08-17 17:21:18', '2023-08-17 17:21:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('147', '107', '1', 'JAVIER CANTILLO  ', '3057548460', 'CRA 37 # 54 - 35 BOSTON ', '1', '2023-08-17 17:24:47', '2023-08-17 17:24:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('148', '108', '6', 'EDUARDO ARANGO  ', '3005058901', 'Cra 50 #99 SUR – 69, LA TABLAZA (MPIO DE LA ESTRELLA) ', '1', '2023-08-17 17:28:05', '2023-08-17 17:28:05', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('149', '109', '2', 'WILLIAM LOZANO GIRALDO     ', '3222345149', 'DIAG. 75C #2a-146, LA MOTA ', '1', '2023-08-17 17:40:40', '2023-08-17 17:40:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('150', '110', '2', 'WILLIAM LOZANO GIRALDO     ', '3222345149', 'DIAG. 75C #2a-146, LA MOTA ', '1', '2023-08-17 17:58:31', '2023-08-17 17:58:31', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('151', '111', '6', 'LUZ TATIANA MEDINA      ', '3002389950', 'CALLE 49D SUR No.40A-46 ', '1', '2023-08-17 18:04:58', '2023-08-17 18:04:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('152', '112', '3', ' MAURICIO CEBALLOS       ', '3045555817', 'SABANETA CLLE 78 SUR # 40 - 115 ', '1', '2023-08-17 18:13:55', '2023-08-17 18:13:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('153', '113', '6', 'ALEJANDRA TIRADO     ', '3104192687', 'CRA 32 # 77SUR 731 APTO 0115 AIRES DEL BOSQUE ', '1', '2023-08-17 18:18:12', '2023-08-17 18:18:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('154', '114', '6', 'PAOLA CASTELLANOS', '3017693961', ' CLLE 30 # 83 - 21  ', '1', '2023-08-17 18:22:19', '2023-08-17 18:22:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('155', '115', '5', 'ROSANA ESTRADA Z ', '3054143202', '3054143202 ', '1', '2023-08-17 18:30:13', '2023-08-17 18:30:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('156', '116', '5', 'SUSANA GOMEZ', '3007541636', 'RIONEGRO  CRA 52 A # 60 A- 51. URB. Senderos de San Sebastián, apt 302, torre 2  ', '0', '2023-08-18 16:43:52', '2023-08-18 16:43:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('157', '117', '6', 'PAOLA MASSIEL GUTIERREZ  ', '3105437378', 'CL 7 #83-31 ', '1', '2023-08-18 16:46:33', '2023-08-18 16:46:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('158', '118', '4', 'JOHN JAIRO GALLEGO GIL', '3006544907', 'CALLE 45 F # 80-61 LA FLORESTA ', '1', '2023-08-18 16:52:06', '2023-08-18 16:52:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('159', '119', '5', 'SUSANA GOMEZ', '3007541636', 'RIONEGRO  CRA 52 A # 60 A- 51. URB. Senderos de San Sebastián, apt 302, torre 2  ', '1', '2023-08-18 17:37:30', '2023-08-18 17:37:30', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('160', '120', '5', 'JOAHN AYARZA ', '3207395394', 'ALPUJARRA GOBERNACION  ', '1', '2023-08-22 16:28:26', '2023-08-22 16:28:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('161', '121', '0', 'WALTER  BELTRAN      ', '3122377387', 'BELLO CR 49 # 45 - 48 INT 1401 CONDOMINIO SANTA CLARA ', '1', '2023-08-22 16:45:23', '2023-08-22 16:45:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('162', '121', '8', 'RUBEN FELIPE AGUDELO', '3045649353', ' CALLE 80 # 71 12 BARRIO CORDOBA -ROBLEDO ', '1', '2023-08-22 16:45:23', '2023-08-22 16:45:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('163', '122', '4', 'SANTTIAGO GALEANO', '3183580602', 'N/A ', '1', '2023-08-22 17:07:00', '2023-08-22 17:07:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('164', '123', '5', 'WALTER  . BELTRAN       ', '3122377387', 'BELLO CR 49 # 45 - 48 INT 1401 CONDOMINIO SANTA CLARA  ', '1', '2023-08-22 17:12:42', '2023-08-22 17:12:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('165', '124', '5', 'HENRY PORTILLA           ', '3043786062', 'AEROPUERTO DE CAREPA ', '1', '2023-08-22 18:23:50', '2023-08-22 18:23:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('166', '125', '5', 'LUIS FERNANDO CORTÉS      ', '3105600067', 'SABANETA ', '1', '2023-08-22 18:39:10', '2023-08-22 18:39:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('167', '126', '5', 'LUCAS GARCIA', '3003020731', 'CLLE 75 AA SUR #  52 D- 60  FRONTERA SURAMERICANA   ITAGUI ', '1', '2023-08-22 18:43:44', '2023-08-22 18:43:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('168', '127', '5', 'ORLANDO DIAZ', '3014621393', 'CRA 65C No 38A SUR-44 AUTOPISTA  MEDELLIN  BOGOTA K.17 MAS 300 ALTO DE LA VIRGEN    ', '1', '2023-08-22 18:51:07', '2023-08-22 18:51:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('169', '128', '5', 'LEISON FREYDER ROMAÑA', '3218013934', 'CALLE 29 C #33-53 CASA 106 AIRES DE SAN DIEGO LOMA DEL INDIO ', '1', '2023-08-22 18:54:16', '2023-08-22 18:54:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('170', '129', '2', ' SANDRA   PARRA ', '3113077142', 'CLL 79 CR 57 B-2  (BELLO, ARAUCARIAS 2) ', '1', '2023-08-22 19:07:42', '2023-08-22 19:07:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('171', '130', '5', 'ROLANDO MUÑOZ  ', '3113077142', 'CLL 79 CR 57 B-2  (BELLO, ARAUCARIAS 2) ', '1', '2023-08-22 19:22:09', '2023-08-22 19:22:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('172', '131', '2', 'JORGE E. JAIMES  ', '3187897220', 'URB. ORIGEN - CALLE 50 # 96C-90  CALASANZ ', '1', '2023-08-22 19:24:40', '2023-08-22 19:24:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('173', '132', '2', 'JULIANA ZAPATA', '3197562683', 'Cr. 65A # 68-44 BELLO ', '1', '2023-08-22 19:32:55', '2023-08-22 19:32:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('174', '133', '4', 'EDISON PEREZ', '3197562683', 'CRA 65 # 101-117 MEDELLIN ', '1', '2023-08-22 19:45:04', '2023-08-22 19:45:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('175', '134', '5', 'MATEO ARICAPA', '3104017422', 'CLLE 41 SUR # 25A - 149 ED. MIRADOR ENVIGADO ', '1', '2023-08-22 19:52:12', '2023-08-22 19:52:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('176', '135', '5', 'JERSSON GIL              ', '3246832490', '', '1', '2023-08-22 23:07:06', '2023-08-22 23:07:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('177', '136', '8', 'ORLANDO DIAZ MOLINA  ', '3014621393', 'AEROPUERTO ANTONIO ROLDAN BETANCUR -CAREPA ', '1', '2023-08-22 23:19:44', '2023-08-22 23:19:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('178', '137', '6', 'ELIANA PRECIADO     ', '3017702500', 'AEROPUERTO MONTERIA ', '1', '2023-08-22 23:28:32', '2023-08-22 23:28:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('179', '138', '5', 'CAROLINA POTES', '3505269803', 'Cra. 80b #8 Sur  Diagonal 31 # 34F sur 13 (Envigado) ', '1', '2023-08-22 23:33:06', '2023-08-22 23:33:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('180', '139', '6', 'CAROLINA POTES', '3505269803', 'Cra. 80b #8 Sur  Diagonal 31 # 34F sur 13 (Envigado) ', '1', '2023-08-22 23:51:51', '2023-08-22 23:51:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('181', '140', '5', 'LUIS BERNARDO RESTREPO', '3158518335', ' CLE 57 # 68C-65 PEÑA VERDE BELLO ', '1', '2023-08-24 17:49:18', '2023-08-24 17:49:18', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('182', '141', '5', 'IVAN DE VARGAS', '3242788219', 'CARRERA 59B # 40 39 BELLO ', '1', '2023-08-24 18:01:17', '2023-08-24 18:01:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('183', '142', '5', 'JUAN FELIPE GÓMEZ RUIZ', '3137490391', 'Carrera 44 No. 19A 20 Urb. Parque Central del Rio ', '1', '2023-08-24 18:20:34', '2023-08-24 18:20:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('184', '143', '2', 'LEONARDO LOAIZA ROMAN', '3137490391', '', '1', '2023-08-24 18:43:54', '2023-08-24 18:43:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('185', '144', '5', 'JUAN PABLO GOMEZ ', '3242760773', 'CRA. 84B #4G-75, BELEN      ', '1', '2023-08-24 18:50:00', '2023-08-24 18:50:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('186', '145', '5', 'BEATRIZ ELENA VASQUEZ VELILLA', '3128927499', 'CRA 58D # 68C - 10  BELLO ', '1', '2023-08-24 18:57:34', '2023-08-24 18:57:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('187', '146', '2', 'LORENA HERRERA GÓMEZ', '3013562267', 'CL 9 SUR # 79C - 151  RODEO ALTO ', '1', '2023-08-24 19:06:41', '2023-08-24 19:06:41', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('188', '147', '5', 'ANA MARIA LOAIZA', '3146842204', 'CRA 44 Nº71A-60 ', '1', '2023-08-24 19:33:29', '2023-08-24 19:33:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('189', '148', '7', 'DANIEL MORALES', '3176988248', ' CRA 35 # 49C - 34 APTO 208 BARRIO EL TABLAZO, COPACABANA ', '1', '2023-08-24 19:41:24', '2023-08-24 19:41:24', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('190', '149', '6', 'DANIEL DELVASTO', '3185229616', 'CALLE 28 # 84-195 ', '1', '2023-08-24 19:44:59', '2023-08-24 19:44:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('191', '150', '2', 'PAOLA MASSIEL GUTIERREZ ', '3105437378', 'CL 7 #83-31 ', '1', '2023-08-24 19:47:22', '2023-08-24 19:47:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('192', '151', '5', 'SNEIDER GARCIA', '3103316409', ' CLL. 47A # 14B 06 B. BUENOS AIRES LOS CERROS ', '1', '2023-08-24 22:13:43', '2023-08-24 22:13:43', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('193', '152', '7', 'CLAUDIA VELASQUEZ', '3128105856', 'Calle 25 #53-76 Cabañas Bello ', '1', '2023-08-24 22:19:07', '2023-08-24 22:19:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('194', '153', '5', 'WILLIAM LOZANO', '3222345149', 'DIAG. 75C #2A-146 URB. SALAMANCA ', '1', '2023-08-24 22:32:46', '2023-08-24 22:32:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('195', '197', '5', 'YOLANDA OSSA      ', '3007225513', 'CRA 43 # 47 - 64 - CENTRO  ', '1', '2023-08-24 23:15:42', '2023-08-24 23:15:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('196', '198', '1', 'TÁMARA VARGAS HOYOS', '3146325475', 'CALLE 38B SUR NO 26-02 MONTEVENTO ', '1', '2023-09-04 16:50:13', '2023-09-04 16:50:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('197', '199', '6', 'YOLANDA OSSA   ', '3007225513', 'CRA 43 # 47 - 64 - CENTRO  ', '1', '2023-09-04 16:53:42', '2023-09-04 16:53:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('198', '200', '5', 'LEONARDO LOAIZA ROMAN', '3218078367', 'CLL 78B # 75-209 INT 202 ', '1', '2023-09-04 17:30:00', '2023-09-04 17:30:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('199', '201', '8', 'ANA MARIA LOAIZA', '3146842204', 'CRA 44 Nº71A-60 ', '1', '2023-09-04 17:36:40', '2023-09-04 17:36:40', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('200', '202', '4', 'PAOLA MASSIEL GUTIERREZ ', '3105437378', '', '1', '2023-09-04 18:02:57', '2023-09-04 18:02:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('201', '203', '8', 'CLAUDIA VELASQUEZ', '3128105856', 'Calle 25 #53-76 Cabañas Bello ', '1', '2023-09-04 18:07:08', '2023-09-04 18:07:08', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('202', '204', '5', 'WILLIAM LOZANO', '3222345149', 'DIAG. 75C #2A-146 URB. SALAMANCA ', '1', '2023-09-04 18:40:19', '2023-09-04 18:40:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('203', '205', '6', 'EDUARDO ARANGO', '3005058901', 'Cra 50 #99 SUR – 69, LA TABLAZA (MPIO DE LA ESTRELLA) ', '1', '2023-09-04 18:48:57', '2023-09-04 18:48:57', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('204', '206', '1077458492', 'PLINIO MOSQUERA', '3207786657', 'CRA 31 # 70 - 28 MANRIQUE ', '1', '2023-09-04 18:59:19', '2023-09-04 18:59:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('205', '207', '6', ' MARY LUZ RAMIREZ  ', '3017891722', 'CALLE 63 A Nº 58 D 30 (ITAGUI)  ', '1', '2023-09-04 19:02:51', '2023-09-04 19:02:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('206', '208', '7', 'SANTIAGO BENJUMEA ', '3003652298', 'CLAR 5 # 66 B - 58  ', '1', '2023-09-04 19:17:51', '2023-09-04 19:17:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('207', '209', '6', 'PAULA RUIZ', '3053401180', 'Vereda el Uvito parte baja San cristóbal. Casa 15A   ', '1', '2023-09-04 19:23:55', '2023-09-04 19:23:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('208', '210', '6', 'KELY YOHANA GARCES  ', '3128360876', 'CL 69 CR 96 E-33 (INTERIOR 406) Robledo La Huerta ', '1', '2023-09-04 19:30:07', '2023-09-04 19:30:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('209', '211', '7', 'NATALIA MANCO ', '1017203116', 'CLL 20 FF # 81 A 125 ', '1', '2023-09-04 19:36:03', '2023-09-04 19:36:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('210', '212', '7', 'CLAUDIA VELASQUEZ', '1035866402', 'CRR 25C CALLE 55B-68  ', '1', '2023-09-04 19:46:04', '2023-09-04 19:46:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('211', '213', '1044502182', 'VICTOR ADOLFO AGUDELO ', '3136437597', 'CRA 44 # 26-71  - BELLO ', '1', '2023-09-04 19:52:33', '2023-09-04 19:52:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('212', '214', '6', 'JAN DAVID TANGARIFE', '3206657325', 'Km 24 Vía Las Palmas  ', '1', '2023-09-04 21:21:59', '2023-09-04 21:21:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('213', '215', '6', 'ROSANA ESTRADA  ', '3054143202', 'AV 31 #66-29 NIQUIA TERRANOVA ', '1', '2023-09-04 21:33:35', '2023-09-04 21:33:35', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('214', '216', '5', 'JAVIER CANTILLO', '3057548460', 'CRA 37 # 54 - 35 BOSTON ', '1', '2023-09-04 21:42:17', '2023-09-04 21:42:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('215', '217', '43987559', 'CLAUDIA ARISTIZABA    ', '3217800243', 'CRA 50 #92-101  ', '1', '2023-09-04 22:09:52', '2023-09-04 22:09:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('216', '218', '5', 'ANA MARIA LOAIZA         ', '3146842204', 'CRA 44 Nº 71A - 60 (MANRIQUE)  ', '1', '2023-09-04 22:17:05', '2023-09-04 22:17:05', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('217', '219', '6', 'CAROLY SANDOVAL', '3157456196', ' Cra 45 # 77 sur 40 SABANETA ', '1', '2023-09-04 22:25:09', '2023-09-04 22:25:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('218', '220', '3', 'TATIANA RENDON', '3207451307', 'calle 21 #55-12 SAN ANTONIO DE PEREIRA ', '1', '2023-09-04 22:44:21', '2023-09-04 22:44:21', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('219', '221', '2', 'EDUARDO ARANGO', '3005058901', 'Cra 50 #99 SUR – 69, LA TABLAZA (MPIO DE LA ESTRELLA) ', '1', '2023-09-04 22:58:04', '2023-09-04 22:58:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('220', '222', '71787393', 'JUAN FELIPE PEREZ ', '3137491340', 'Calle 1 #29 - 308 APTO 306 Conjunto residencial la Coruña ', '1', '2023-09-04 23:02:54', '2023-09-04 23:02:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('221', '223', '1128458507', 'SANTIAGO LOPEZ', '3217248498', 'CLL 29 # 54 B - 27 ITAGUI   ', '1', '2023-09-04 23:09:23', '2023-09-04 23:09:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('222', '224', '7', 'JUAN PABLO TORO    ', '3137273730', 'Calle 9 72-50 Interior 211 Bizet 1  Belen ', '1', '2023-09-04 23:28:10', '2023-09-04 23:28:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('223', '225', '1017142907', 'WILMAR OREJUELA  ', '3112903324', 'AEROPUERTO EL BAGRE ', '1', '2023-09-05 15:51:01', '2023-09-05 15:51:01', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('224', '226', '1037596307', 'ROLANDO MUÑOZ MANCERA', '3014338591', 'CL 44S #47-18 MILAN CONDOMINIO 9 ENVIGADO ', '1', '2023-09-05 15:57:53', '2023-09-05 15:57:53', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('225', '227', '1039024960', 'PAULA TORRES', '3207841700', 'CLL 55A SUR #38-130 URB VILLA ROMERA CAMPESTRE SABANETA ', '1', '2023-09-05 16:06:29', '2023-09-05 16:06:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('226', '228', '1035872805', 'SEBASTIAN ROJAS    ANDERSON MARIN', '3107302625', 'CR 68A #106A-19   ', '1', '2023-09-05 16:12:28', '2023-09-05 16:12:28', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('227', '229', '6', 'ORLANDO DIAZ', '3014621393', 'CRA 65C No 38A SUR-44 AUTOPISTA  MEDELLIN  BOGOTA K.17 MAS 300 ALTO DE LA VIRGEN    ', '1', '2023-09-05 16:24:08', '2023-09-05 16:24:08', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('228', '230', '8', 'LEISON FREYDER ROMAÑA', '3218013934', 'CALLE 29 C #33-53 CASA 106 AIRES DE SAN DIEGO LOMA DEL INDIO ', '1', '2023-09-05 16:28:29', '2023-09-05 16:28:29', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('229', '231', '5', 'MATEO ARICAPA', '3104017422', 'CLLE 41 SUR # 25A - 149 ED. MIRADOR ENVIGADO ', '1', '2023-09-05 16:34:59', '2023-09-05 16:34:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('230', '232', '1017231637', 'SANTIAGO GALEANO', '3183580602', 'CR 81C # 49F-50 ED BELOHORIZONTE ', '1', '2023-09-05 16:57:21', '2023-09-05 16:57:21', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('231', '233', '1015277974', 'YEISSON DAVID GARCIA  ', '3184282983', 'CLL 50 # 56-21 ', '1', '2023-09-05 17:06:22', '2023-09-05 17:06:22', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('232', '234', '6', 'JUAN FELIPE GÓMEZ RUIZ', '3137490391', '', '1', '2023-09-05 17:12:08', '2023-09-05 17:12:08', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('233', '235', '6', 'YOLANDA OSSA GIRALDO', '6', 'CRA 43 # 47 - 64 - TOORES DE BOMBONA,VENECI  ', '1', '2023-09-05 17:22:49', '2023-09-05 17:22:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('234', '236', '1', 'SANTIAGO BENJUMEA ', '3003652298', 'CLAR 5 # 66 B - 58 ', '1', '2023-09-05 17:25:54', '2023-09-05 17:25:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('235', '237', '4', 'JAVIER CANTILLO ', '3057548460', 'CRA 37 # 54 - 35 BOSTON ', '1', '2023-09-05 17:46:17', '2023-09-05 17:46:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('236', '238', '1017247452', 'LEONARDO LOAIZA ROMAN', '3218078367', 'CLL 78 B #75-209 INT 202 ', '1', '2023-09-05 17:57:14', '2023-09-05 17:57:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('237', '239', '1036942315', 'JUAN GIRALDO', '3117229635', 'KM 5 VIA LA CEJA  - RIONEGRO ', '1', '2023-09-05 17:59:23', '2023-09-05 17:59:23', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('238', '240', '70565577', 'DIEGO TORRES', '3207886879', 'CLL 27 # 38 SUR - 51 ENVIGADO ', '1', '2023-09-05 18:03:39', '2023-09-05 18:03:39', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('239', '241', '1037596307', 'ROLANDO MUÑOZ MANCERA', '3014338591', 'CL 44S #47-18 MILAN CONDOMINIO 9 ENVIGADO ', '1', '2023-09-05 18:28:06', '2023-09-05 18:28:06', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('240', '242', '5', 'ALEJANDRA HOYOS CORREA', '3104197425', 'EL RETIRO CL 28 C  N°16 B- 20 URB BOSQUES DE NORMANDIA. ', '1', '2023-09-05 18:33:34', '2023-09-05 18:33:34', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('241', '243', '1017142907', 'WILMAR OREJUELA  ', '3112903324', 'AEROPUERTO EL BAGRE ', '1', '2023-09-05 18:40:32', '2023-09-05 18:40:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('242', '244', '4', 'PAOLA MASSIEL GUTIERREZ  ', '3105437378', 'CL 7 #83-31  ', '1', '2023-09-05 18:48:32', '2023-09-05 18:48:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('243', '245', '6', 'WALTER  BELTRAN   ', '3122377387', 'BELLO CR 49 # 45 - 48 INT 140 ', '1', '2023-09-05 18:59:24', '2023-09-05 18:59:24', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('244', '246', '72202130', 'IVAN DE VARGAS', '3242788219', 'CRA 59B # 40 39-BELLO ', '1', '2023-09-05 19:10:49', '2023-09-05 19:10:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('245', '247', '32090244', 'JULIANA ZAPATA', '3197562683', 'Cr. 65A # 68-44 BELLO ', '1', '2023-09-05 19:14:26', '2023-09-05 19:14:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('246', '248', '43987559', 'CLAUDIA ARISTIZABA     ', '3217800243', 'CRA 50 #92-101  ', '1', '2023-09-05 19:19:44', '2023-09-05 19:19:44', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('247', '249', '1017247323', 'ROSANA ESTRADA Z ', '3054143202', 'AV 31 #66-29 NIQUIA ', '1', '2023-09-05 19:26:03', '2023-09-05 19:26:03', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('248', '250', '1121715567', 'DANIEL DELVASTO', '3185229616', 'CALLE 28 # 84-195 ', '1', '2023-09-05 19:32:10', '2023-09-05 19:32:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('249', '251', '2', 'ADRIANA  GUTIÉRREZ ', '3127249067', ' CRA 73C 74 247 ROBLEDO PILARICA ', '1', '2023-09-07 19:00:56', '2023-09-07 19:00:56', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('250', '252', '5', 'SINDY MORENO', '3146466478', 'CRA 71 #20E25 INT 105 BARRIO PARIS, BELLO ', '1', '2023-09-07 19:07:09', '2023-09-07 19:07:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('251', '253', '5', 'JAN DAVID TANGARIFE', '3206657325', '', '1', '2023-09-07 19:10:33', '2023-09-07 19:10:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('252', '254', '123', 'prueba', '123', '', '1', '2023-09-12 18:04:12', '2023-09-12 18:04:12', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `trans_servidores_movilizados` VALUES ('253', '255', '5', 'Intendente                                 Edison Giraldo Taborda ', '3103749320', 'ALPUJARRA GOBERNACION  ', '1', '2023-09-13 23:46:39', '2023-09-13 23:46:39', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('254', '256', '6', 'ALEXANDER SOTO YANEZ', '3114632240', 'CARRERA 44 # 26-71, CONJUNTO RESIDENCIAL MADERA ESCENCIAL. TORRE 8 APART 901. BELLO ', '1', '2023-09-13 23:52:49', '2023-09-13 23:52:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('255', '257', '5', 'CONSTANZA DIAZ', '3016224032', 'BELEN LAS MERCEDES ', '1', '2023-09-13 23:59:38', '2023-09-13 23:59:38', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('256', '258', '32090244', 'YULIANA ZAPATA', '3197562683', 'Cr. 65A # 68-44 BELLO ', '1', '2023-09-14 00:04:17', '2023-09-14 00:04:17', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('257', '259', '71362756', 'EDISON PEREZ', '3104439789', 'CRA 65 # 101-107 BARRIO GIRARDOT ', '1', '2023-09-14 00:07:54', '2023-09-14 00:07:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('258', '260', '1017247452', 'LEONARDO LOAIZA ', '3218078367', 'CLL 78B #75-209 INT 202 ', '1', '2023-09-14 00:15:26', '2023-09-14 00:15:26', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('259', '261', '15443447', 'JAIRO  CARDONA  ', '3113416828', 'CLLE 74 #73-47  PILARICA1  ', '1', '2023-09-14 00:20:11', '2023-09-14 00:20:11', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('260', '262', '43482595', 'BEATRIZ ELENA VASQUEZ  ', '3128927499', '', '1', '2023-09-14 00:29:36', '2023-09-14 00:29:36', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('261', '263', '1041177346', 'KELY YOHANA GARCES  ', '3128360876', 'CL 69 CR 96 E-33 (INTERIOR 406) Robledo La Huerta ', '1', '2023-09-14 00:36:13', '2023-09-14 00:36:13', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('262', '264', '43611966', 'SANDRA MORENO', '3162680262', 'CLLE 34C Nº 82A-23 ', '1', '2023-09-14 00:42:51', '2023-09-14 00:42:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('263', '264', '3', 'MARY LUZ RAMIREZ  ', '3017891722', 'CLLE 63 A Nº 58 D 30   ', '1', '2023-09-14 00:42:51', '2023-09-14 00:42:51', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('264', '265', '1038405033', 'WILLIAM  LOZANO G ', '3222345149', 'DIAG. 75C #2A-146 URB. SALAMANCA ', '1', '2023-09-14 00:55:14', '2023-09-14 00:55:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('265', '266', '43156852', 'TÁMARA VARGAS ', '3146325475', 'CALLE 38B SUR NO 26-02 ENVIGADO ', '1', '2023-09-14 00:59:14', '2023-09-14 00:59:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('266', '266', '79781735', 'LUIS   GARCES', '3044223573', 'CALLE 57 # 68C-65 BELLO. ', '1', '2023-09-14 00:59:14', '2023-09-14 00:59:14', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('267', '267', '13571333', 'SNEIDER GARCIA', '33103316409', 'CLL. 47A # 14B 06 B. BUENOS AIRES  ', '1', '2023-09-14 01:07:42', '2023-09-14 01:07:42', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('268', '268', '1040180074', 'JAN DAVID TANGARIFE', '3206657325', 'Km 24 Vía Las Palmas  ', '1', '2023-09-14 01:11:46', '2023-09-14 01:11:46', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('269', '269', '43117882', ' JHOJANNA GRANADOS       ', '3117842791', 'EDIFICIO CORTEZZA ( WE WORK ) LAS PALMAS ', '1', '2023-09-14 01:20:59', '2023-09-14 01:20:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('270', '269', '1017245785', 'SEBASTIAN MESA', '3008136168', 'EDIFICIO CORTEZZA ( WE WORK ) LAS PALMAS ', '1', '2023-09-14 01:20:59', '2023-09-14 01:20:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('271', '270', '30239992', 'DIANA ALZATE       ', '3206652603', 'CRA 67 B # 48 A-06 SURAMERICANA   ', '1', '2023-09-14 01:32:07', '2023-09-14 01:32:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('272', '270', '30239991', ' LIZETH VALENCIA', '0', ' CRA 72 # 95 – 121 CASTILLA  ', '1', '2023-09-14 01:32:07', '2023-09-14 01:32:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('273', '270', '5', '   YOLANDA OSSA ', '3007225513', '', '1', '2023-09-14 01:32:07', '2023-09-14 01:32:07', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('274', '271', '1036942315', 'JUAN GIRALDO', '1036942315', 'KM 5 VIA LA CEJA  - RIONEGRO ', '1', '2023-09-14 01:35:50', '2023-09-14 01:35:50', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('275', '272', '2', 'Intendente                                 Edison Giraldo Taborda ', '3103749320', 'CARRERA 44 # 26-71, CONJUNTO RESIDENCIAL MADERA ESCENCIAL. TORRE 8 APART 901. BELLO ', '1', '2023-09-18 17:07:35', '2023-09-18 17:07:35', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('276', '273', '1', 'CLAUDIA ARISTIZABAL  ', '3217800243', 'CRA 50 #92-101 ', '1', '2023-09-18 21:51:54', '2023-09-18 21:51:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('277', '273', '5', 'JAKELINE PARRA', '3225368521', '', '1', '2023-09-18 21:51:54', '2023-09-18 21:51:54', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('278', '274', '5', 'WILLIAM LOZANO GIRALDO', '3222345149', 'DIAG. 75C #2a-146, URB. SALAMANCA LA MOTA ', '1', '2023-09-18 22:09:12', '2023-09-18 22:09:12', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('279', '275', '2', 'ANGELA CRISTINA DAVID  ', '3136512229', 'CARRERA 75 #30 A 42 ALCAZAR  ', '1', '2023-09-18 22:14:27', '2023-09-18 22:14:27', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('280', '276', '5', 'TÁMARA VARGAS HOYOS', '3146325475', 'CALLE 38B SUR NO 26-02 MONTEVENTO, ENVIGADO/ ', '1', '2023-09-18 22:19:27', '2023-09-18 22:19:27', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('281', '276', '6', 'ISABEKL CORREA', '3246361416', 'CARRERA 65 A 93 05 CASTILLA ', '1', '2023-09-18 22:19:27', '2023-09-18 22:19:27', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('282', '277', '5', 'Jersson Andres Gil                ', '3246832490', 'VEREDA ABREO CALLEJÓN DEL POLO FINCA 489 ', '1', '2023-09-18 22:26:09', '2023-09-18 22:26:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('283', '277', '6', 'JOSE GUERRA  ', '3213006078', 'ALMACENTRO    /          CLL 47 #41-20 ', '1', '2023-09-18 22:26:09', '2023-09-18 22:26:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('284', '277', '2', 'ESTEBAN MORALES', '3183890659', '    CLL 47 #41-20 ', '1', '2023-09-18 22:26:09', '2023-09-18 22:26:09', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('285', '278', '5', 'SANDRA CAROLINA PARRA', '3113077142', 'CLL 79 CR 57 B-2  BELLO, ARAUCARIAS 2 AL FINAL DEL PARQUEDARO ', '1', '2023-09-19 16:16:04', '2023-09-19 16:16:04', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('286', '279', '1128277326', 'NATALIA CASTAÑO ', '21333', 'Cll 23 D Kr CLL 78B #75-209 INT 202 ', '1', '2023-09-22 21:21:25', '2023-09-22 21:21:25', 'prueba', 'prueba');
INSERT INTO `trans_servidores_movilizados` VALUES ('287', '280', '9', 'n', '9', 'h ', '1', '2023-09-26 21:29:58', '2023-09-26 21:29:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('288', '281', '39212699', ' CATALINA ORTEGA', '3122395922', 'AVENIDA 26 # 52 - 140 ', '1', '2023-10-06 16:51:32', '2023-10-06 16:51:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('289', '282', '8031880', 'OSCAR ANDRES RAVE BUSTAMANTE', '3012242833', 'SABANETA - CARRERA 32 # 71 SUR - 65 ', '1', '2023-10-11 23:36:10', '2023-10-11 23:36:10', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('290', '283', '1017203116', 'NATALIA MANCO', '3043860166', 'CLL 20 FF # 81 A 125 BARRIO PARIS ', '1', '2023-10-11 23:43:59', '2023-10-11 23:43:59', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('291', '284', '1017203116', 'NATALIA MANCO', '3043860166', 'CLL 20 FF # 81 A 125 BARRIO PARIS ', '1', '2023-10-12 00:00:32', '2023-10-12 00:00:32', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('292', '285', '1088030249', 'MATEO ARICAPA GUTIERREZ', '3104017422', 'CLLE 41 SUR # 25A - 149 ED. MIRADOR ENVIGADO  ', '1', '2023-10-12 00:24:25', '2023-10-12 00:24:25', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('293', '286', '1088030249', 'MATEO ARICAPA GUTIERREZ', '1088030249', 'CLLE 41 SUR # 25A - 149 ED. MIRADOR ENVIGADO  ', '1', '2023-10-12 01:04:58', '2023-10-12 01:04:58', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('294', '287', '1088030249', 'MATEO ARICAPA GUTIERREZ', '3104017422', 'CLLE 41 SUR # 25A - 149 ED. MIRADOR ENVIGADO  ', '1', '2023-10-13 00:29:33', '2023-10-13 00:29:33', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('295', '288', '1035870917', 'LAURA VANESSA ROJAS BERNAL', '3007810612', 'GIRARDOTA ', '1', '2023-10-13 00:33:47', '2023-10-13 00:33:47', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('296', '289', '1035872805', 'SEBASTIAN ROJAS', '3107302625', 'CR68A #106A19  ', '1', '2023-10-18 00:26:52', '2023-10-18 00:26:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('297', '290', '71362756', 'EDISON PEREZ', '310443978', 'CRA 65 # 101-107 ', '1', '2023-10-18 23:04:52', '2023-10-18 23:04:52', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('298', '291', '1128277326', 'NATALIA CASTAÑO ', '23356', 'CALLE 76 # 31-42 ', '1', '2023-10-31 16:31:19', '2023-10-31 16:31:19', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_servidores_movilizados` VALUES ('299', '292', '2147483647', 'NATALIA ', '3', 'CALEE 4 ', '1', '2023-11-01 22:19:55', '2023-11-01 22:19:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');

-- ----------------------------
-- Table structure for `trans_tipo_cancelacion`
-- ----------------------------
DROP TABLE IF EXISTS `trans_tipo_cancelacion`;
CREATE TABLE `trans_tipo_cancelacion` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- ----------------------------
-- Records of trans_tipo_cancelacion
-- ----------------------------
INSERT INTO `trans_tipo_cancelacion` VALUES ('1', 'Cancelación por solicitud del municipio', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_cancelacion` VALUES ('2', 'Cancelación por razones de orden público', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_cancelacion` VALUES ('3', 'Cancelación debido a la incapacidad del funcionario', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_cancelacion` VALUES ('4', 'Cancelación por falta de disponibilidad de transporte por parte del operador', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_cancelacion` VALUES ('5', 'Otros', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `trans_tipo_contrato`
-- ----------------------------
DROP TABLE IF EXISTS `trans_tipo_contrato`;
CREATE TABLE `trans_tipo_contrato` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TipoContrato` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Costo` float(10,2) DEFAULT NULL,
  `observacion` text COLLATE utf8mb4_spanish_ci,
  `anio_contrato` year DEFAULT NULL,
  `Precio_1` float(10,2) DEFAULT NULL,
  `Precio_2` float(10,2) DEFAULT NULL,
  `Precio_3` float(10,2) DEFAULT NULL,
  `FechaAplicacion` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of trans_tipo_contrato
-- ----------------------------
INSERT INTO `trans_tipo_contrato` VALUES ('1', 'Fijo', '8936522.00', 'vehiculos que estan 24/7 en el contrato pagan valor fijo', '2023', null, null, null, null);
INSERT INTO `trans_tipo_contrato` VALUES ('2', 'Adicional', null, 'son vehiculos adicionales con tarifa diferenciadora para destinos no superiores a 71km de Medellin', '2023', '454500.00', '612248.00', '842342.00', '2023-01-01');
INSERT INTO `trans_tipo_contrato` VALUES ('5', 'Por horas AMVA', '42035.00', 'son vehiculos que se pagan por su consumo en horas', '2023', null, null, null, null);
INSERT INTO `trans_tipo_contrato` VALUES ('6', 'Por horas por fuera del AMVA', '51056.00', 'son vehiculos que se pagan por su consumo en horas', '2023', null, null, null, null);
INSERT INTO `trans_tipo_contrato` VALUES ('7', 'Saliendo de uraba', '598267.00', 'son vehiculos que tiene una tarifa diferenciadora saliendo del uraba antioqueño ', '2023', null, null, null, null);

-- ----------------------------
-- Table structure for `trans_tipo_servicio`
-- ----------------------------
DROP TABLE IF EXISTS `trans_tipo_servicio`;
CREATE TABLE `trans_tipo_servicio` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of trans_tipo_servicio
-- ----------------------------
INSERT INTO `trans_tipo_servicio` VALUES ('1', 'Fijo', '1', '2023-05-12 09:35:43', null, null, null);
INSERT INTO `trans_tipo_servicio` VALUES ('2', 'Adicional', '1', '2023-05-12 09:35:43', null, null, null);
INSERT INTO `trans_tipo_servicio` VALUES ('3', 'Por Horas', '1', '2023-05-12 09:35:43', null, null, null);

-- ----------------------------
-- Table structure for `trans_tipo_vehiculo`
-- ----------------------------
DROP TABLE IF EXISTS `trans_tipo_vehiculo`;
CREATE TABLE `trans_tipo_vehiculo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) COLLATE utf32_spanish2_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- ----------------------------
-- Records of trans_tipo_vehiculo
-- ----------------------------
INSERT INTO `trans_tipo_vehiculo` VALUES ('1', 'Automovil', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_vehiculo` VALUES ('2', 'Buseta', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_vehiculo` VALUES ('4', 'Campero', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_vehiculo` VALUES ('5', 'Vans', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_vehiculo` VALUES ('6', 'Camioneta con volcó 4x4', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_tipo_vehiculo` VALUES ('7', 'Campero 4x4', '1', '0000-00-00 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for `trans_vehiculo`
-- ----------------------------
DROP TABLE IF EXISTS `trans_vehiculo`;
CREATE TABLE `trans_vehiculo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Placas` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Tipo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Conductor` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Telefono` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of trans_vehiculo
-- ----------------------------
INSERT INTO `trans_vehiculo` VALUES ('1', 'LKO267', '4', 'EDGAR BARRIOS LOMBO', '3005417057', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('2', 'LKO276', '4', 'MAURICIO RAMIREZ ZAPATA ', '3116050068', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('3', 'JYW993', '4', 'JHON FREDY MONTOYA ', '302 2630620', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('4', 'LKO306', '4', 'CARLOS JULIO ARRIENTOS', '3136849177', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('5', 'LKO286', '4', 'CRISTIAN CAMILO CARDENAS ', '3163150520', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('6', 'LKO296', '4', 'JOHN JAIRO OSORIO GOMEZ', '310 5130887', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('7', 'GTX370', '4', 'GILBERTO HERNAN LOPEZ', '3011035542', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('8', 'LKO480', '4', 'ANDRES FELIPE GUEVARA', '3002481253', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('9', 'LKO481', '4', 'HUMBERTO DE JESUS QUINTERO M.', '3146296585', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('10', 'LKO482', '4', 'JUAN DAVID QUINTERO ESCOBAR', '324 4290774', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('11', 'LKO483', '4', 'ALFREDO JOSE DAVILA JIMENEZ', '3246050095', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('12', 'LKO484', '4', 'JOHAN ESTID  ARANGO ZULETA', '301 3163308', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('13', 'ESQ410', '7', 'ROBERTO JAIRO  BEDOYA MOLINA', '3054060783', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('14', 'LKN333', '7', 'DAVID ALEJANDRO CONTRERAS CHAVARRIAGA', '3127903764', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('15', 'LKL384', '7', 'JOSE ALFREDO BERRIO URREA', ' 313 7661413', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('16', 'JYX887', '7', 'ADRIAN HUMBERTO CORREA MARIN', '3106044452', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('17', 'GTX125', '7', 'FERNANDO STEVEN CORREA\r\nOQUENDO', '304 3547494', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('18', 'JYX818', '7', 'WALTER  PEÑA ESPINAL', '312 8526758', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('19', 'GTY407', '6', 'PEDRO RUBEN MONSALVE ISAZA', '300 8215574', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('20', 'JYP090', '7', 'HEDILBERTO HERNANDEZ', ' 310 2036098', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('21', 'GTX324', '1', 'JOSE ALBERTO LARREA ', '305 2632129', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('22', 'ESQ692', '7', 'HERIBEL  MUNERA AGUDELO', '314 7674592', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('23', 'LKO079', '7', 'CARLOS ARMANDO BETANCUR ', '310 8018510', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('24', 'ESP488', '7', 'JORGE HUMBERTO MONTOYA HIGUITA', '316 4926827', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('25', 'ESQ105', '7', 'DIEGO ANDRES GALLEGO RODRIGUEZ', '320 6310724', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('26', 'GTY088', '4', 'EDWIN HERNA+G36:G54N BEDOYA PARRA ', '302 2754191', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('27', 'GDW361', '4', 'HERNEY MENDEZ MUÑOZ', '301 6640942', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('28', 'LKN434', '4', 'ROBINSON FERNEY TUBERQUIA ', '314 7672573', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('29', 'JYY190', '4', 'ARLEI DARIO BUILES CARO', '323 4332706', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('30', 'FWM203', '4', 'JHONATAN  TORO CARMONA', '321 4385956', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('31', 'JYW476', '4', 'MILTON RENE MONTYOYA', '315 5183702', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('32', 'ESQ007', '4', 'FRANCISCO ELISEO BOLIVAR', '312 5553402', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('33', 'ESR189', '4', 'PEDRO JOSE MARTINEZ', '315 4971254', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('34', 'JYO082', '6', 'JULIAN FERNANDO  MONSALVE ARBOLEDA', '312 4697448', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('35', 'JYW772', '6', 'EDUARDO LUIS MEDINA OCHOA', '314 8372938', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('36', 'EQW362', '7', 'FRANCISCO EDGAR ZAPATA ROJAS', '300 6079212', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('37', 'FWK751', '7', 'MIKE JURGEN  GOMEZ TEJADA', '311 3934019', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('38', 'ESQ447', '7', 'JULIAN VELASQUEZ ECHEVERRI', '300 6167743', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('39', 'LKO511', '7', 'JULIO CESAR MORENO ALVAREZ', '3142527484', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('40', 'JYX906', '7', 'DIOFANOR MORALES PATIÑO', '311 7720061', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('41', 'JYX068', '7', 'AUGUSTO  ESCALANTE  MORALES', '3506420188', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('42', 'JYW884', '7', 'DAVID ALEJANDRO NARANJO LOPEZ', '304 2090231', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('43', 'LKO317', '7', 'MICHAEL ROODONOY PORTILLA MEDINA', '320 5113512', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('44', 'KTN400', '7', 'CARLOS ARTURO  CARDONA ', '314 8046265', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('45', 'LKL464', '7', 'WILMER RAMOS SALGAO', '321 6034701', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('46', 'GTY053', '7', 'ELIECER OVIDIO BUSTAMANTE MENDOZA', '321 2445012', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('47', 'JYX109', '7', 'DIEGO ANDRES ORTIZ BUSTAMANTE ', '315 5860271', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('48', 'JYY213', '7', 'JAILER ALFONSO  BEDOYA ', '324 4783142', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('49', 'ESR609', '1', 'JOHNY ENRIQUE CORONEL RAMIREZ', '318 6855140', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('50', 'ESP518', '1', 'JUAN MANUEL CATAÑO', '316 2287456', '1', '0000-00-00 00:00:00', null, null, null);
INSERT INTO `trans_vehiculo` VALUES ('51', 'WCP608', 'Campero', 'DIEGO  RAUL JIMENEZ', '', '1', '2023-09-18 23:00:16', '2023-09-18 23:00:16', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('52', 'WCP608', 'Campero', 'DIEGO  RAUL JIENEZ', '3013528248', '1', '2023-09-18 23:17:49', '2023-09-18 23:17:49', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('53', 'WCP608', 'Campero', 'DIEGO  RAUL JIENEZ', '3013528248', '1', '2023-09-18 23:21:00', '2023-09-18 23:21:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('54', 'WCP608', 'Campero', 'DIEGO  RAUL JIENEZ', '3013528248', '1', '2023-09-18 23:21:05', '2023-09-18 23:21:05', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('55', 'GTX324', 'Automovil', 'JESUS ALBERTO LARREA HERNANDEZ', '321 2632129', '1', '2023-09-18 23:46:27', '2023-09-18 23:46:27', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('56', 'STQ258', 'Camioneta 4x4', 'RIOGOBERTO', '301 3529904', '1', '2023-09-19 00:26:27', '2023-09-19 00:26:27', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('57', 'STQ258', 'Camioneta 4x4', 'RIGOBEERO', '301 3529904', '1', '2023-09-19 16:16:55', '2023-09-19 16:16:55', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('58', 'STQ258', 'Camioneta 4x4', 'RIGOBEERO', '301 3529904', '1', '2023-09-19 16:16:56', '2023-09-19 16:16:56', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');
INSERT INTO `trans_vehiculo` VALUES ('59', 'LKO296', 'Camioneta 4x4', 'JHON JAIRO OSORIO GOMEZ', '310 5130887', '1', '2023-10-18 23:09:00', '2023-10-18 23:09:00', 'NATALIA.CASTAÑO', 'NATALIA.CASTAÑO');

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `USUARIO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `NOMBRES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `APELLIDOS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `CLAVE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USUARIO_UNIQUE` (`USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'Daniel.Rodriguez', 'Daniel', 'Rodriguez', '6114974b2c0053d952f0d62fe5e4afe8d203ac01cd434d4adfc420f93ed87b62', '1', '2023-04-24 16:02:45', '2023-10-13 17:49:47', null, 'Daniel.Rodriguez');
INSERT INTO `usuarios` VALUES ('9', 'prueba', 'prueba', 'prueba', '0d9d09e157f7c29a43c02e57f081915d6fe2f10da1710672086f8ad73bb95cb2', '1', '2023-04-27 14:28:20', '2023-11-10 17:58:38', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `usuarios` VALUES ('10', 'NATALIA.CASTAÑO', 'NATALIA', 'CASTAÑO', 'c0cf5ba19c353eb4cd624f4f0724e50d39fc8ae4eabc4f739b1ee5e4ed812aa4', '1', '2023-08-01 11:51:30', '2023-09-27 22:03:32', '', 'NATALIA.CASTAÑO');
INSERT INTO `usuarios` VALUES ('11', 'VICTOR.GIRALDO', 'VICTOR', 'GIRALDO JIMENEZ', '80d6e7bb0f6ec57476a3bb69ef61b18f7b1b345aabc9776e413209fe3b4c8bdb', '1', '2023-08-17 18:29:28', '2023-08-17 21:18:34', 'Daniel.Rodriguez', 'VICTOR.GIRALDO');
INSERT INTO `usuarios` VALUES ('12', 'PAULA.GARCIA', 'PAULA ANDREA', 'GARCIA BEDOYA', '3f97acbd0e4f7f1f9b8d7ea7056920694d8cc6559c10a4823394cb3e82ce417e', '1', '2023-08-17 18:30:02', '2023-09-04 22:40:50', 'Daniel.Rodriguez', 'PAULA.GARCIA');
INSERT INTO `usuarios` VALUES ('13', 'ESNEYDER.MONTOYA', 'ESNEYDER', 'MONTOYA', '9ae5278061113435c9be4160f199b27e8dd28a66d6ae3d5aa723bdc90619d46a', '1', '2023-09-01 21:31:51', '2023-10-11 16:18:48', 'Daniel.Rodriguez', 'ESNEYDER.MONTOYA');
INSERT INTO `usuarios` VALUES ('14', 'Moises.Bustos', 'Moises', 'Bustos', '37a501c881bf6b6d0d7916b3dfbc6e258e4bac3f37f0a8352bf29555d4e41e33', '1', '2023-09-05 18:10:15', '2023-09-05 18:13:15', 'Daniel.Rodriguez', 'Moises.Bustos');
INSERT INTO `usuarios` VALUES ('15', 'Elizabeth.Corrales', 'Elizabeth', 'Corrales Ortiz', '9017d27de61c9a3fd058c614d72657d252b3dd3d2870bd490c6fc6ebc33eacb5', '1', '2023-10-20 23:22:42', '2023-11-09 22:56:44', 'Daniel.Rodriguez', 'Elizabeth.Corrales');
INSERT INTO `usuarios` VALUES ('16', 'Maria.Montoya', 'MARIA MANUELA', 'MONTOYA', '17aa291e10d4ae349fd0c098e01c92f7cfa3137dce9be562d51137a00e311ea2', '1', '2023-10-30 22:59:29', '2023-10-30 23:09:41', 'Daniel.Rodriguez', 'Maria.Montoya');
INSERT INTO `usuarios` VALUES ('17', 'Fabio.Gaviria', 'Fabio Nelson', 'Gaviria', '38581692a83cdd9d8c8c789eae5ed6c09a14ef1ba0ef5e2b9c6c7d85cf943818', '1', '2023-11-15 16:51:20', '2023-11-15 17:14:53', 'Daniel.Rodriguez', 'Fabio.Gaviria');
INSERT INTO `usuarios` VALUES ('18', 'Yeraldine.Osorio', 'Yeraldine', 'Osorio', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1', '2023-11-16 16:41:18', '2023-11-17 20:56:41', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `usuarios` VALUES ('19', 'Maria.Cadavid', 'Maria Alejandra', 'Cadavid', '0e8e603488a31a03070c8b2e9cb3a478d91900b41a42d95988886b1e21b2206a', '1', '2023-11-16 16:49:30', '2023-11-17 21:00:43', 'Daniel.Rodriguez', 'Maria.Cadavid');
INSERT INTO `usuarios` VALUES ('20', 'Isabel.Correa', 'Isabel', 'Correa', '339fe24255949cbf5128f8740631a7e3f0f510f2d44c2cc48fc8eb831fca6f67', '1', '2023-11-16 16:54:12', '2023-11-17 20:59:09', 'Daniel.Rodriguez', 'Isabel.Correa');
INSERT INTO `usuarios` VALUES ('21', 'Valentina.Sanchez', 'Valentina', 'Sanchez', '956943752db1e8774ea79eca39883d33920814ed0722e88b6194d40b791ec89a', '1', '2023-11-16 16:54:49', '2023-11-17 20:58:54', 'Daniel.Rodriguez', 'Valentina.Sanchez');
INSERT INTO `usuarios` VALUES ('22', 'Apoyo.Data', 'Apoyo', 'Data', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '1', '2023-11-16 16:55:16', '2023-11-16 16:55:16', 'Daniel.Rodriguez', 'Daniel.Rodriguez');
INSERT INTO `usuarios` VALUES ('23', 'Jakeline.Parra', 'Jakeline', 'Parra', '3b267cbf082be4c90a9ea76b462ba4e38e2015e5511396bba08ec35cd8260f05', '1', '2023-11-17 20:59:34', '2023-11-17 21:01:19', 'Daniel.Rodriguez', 'Jakeline.Parra');

-- ----------------------------
-- Table structure for `usuarios_cfg_perfiles`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_cfg_perfiles`;
CREATE TABLE `usuarios_cfg_perfiles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PERFIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioCreacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '',
  `UsuarioActualizacion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of usuarios_cfg_perfiles
-- ----------------------------
INSERT INTO `usuarios_cfg_perfiles` VALUES ('1', 'Administrador', '1', null, null, '', null);
INSERT INTO `usuarios_cfg_perfiles` VALUES ('2', 'Admin de Banco de Materiales', '1', null, null, '', null);
INSERT INTO `usuarios_cfg_perfiles` VALUES ('3', 'Admin Contrataciones', '1', null, null, '', null);
INSERT INTO `usuarios_cfg_perfiles` VALUES ('4', 'Transporte Admin', '1', null, null, '', null);
INSERT INTO `usuarios_cfg_perfiles` VALUES ('5', 'Transporte Solicitante', '1', null, null, '', null);
INSERT INTO `usuarios_cfg_perfiles` VALUES ('7', 'Data Administrador', '1', '2023-10-20 23:16:49', '2023-10-20 23:16:49', 'Daniel.Rodriguez', 'Daniel.Rodriguez');

-- ----------------------------
-- Table structure for `usuarios_perfiles`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_perfiles`;
CREATE TABLE `usuarios_perfiles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_USUARIOS` int DEFAULT NULL,
  `ID_PERFIL` int DEFAULT NULL,
  `ACTIVO` tinyint(1) NOT NULL DEFAULT '1',
  `FechaCreacion` datetime NOT NULL,
  `UsuarioCreacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `FechaActualizacion` datetime DEFAULT NULL,
  `UsuarioActualizacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ID_USUARIOS` (`ID_USUARIOS`),
  KEY `ID_PERFIL` (`ID_PERFIL`),
  CONSTRAINT `usuarios_perfiles_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID`),
  CONSTRAINT `usuarios_perfiles_ibfk_2` FOREIGN KEY (`ID_PERFIL`) REFERENCES `usuarios_cfg_perfiles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf32;

-- ----------------------------
-- Records of usuarios_perfiles
-- ----------------------------
INSERT INTO `usuarios_perfiles` VALUES ('12', '1', '1', '1', '2023-04-26 14:12:48', 'Daniel.Rodriguez', '2023-04-26 14:12:48', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('13', '1', '3', '0', '2023-04-26 14:24:51', 'Daniel.Rodriguez', '2023-10-13 17:49:47', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('14', '9', '3', '0', '2023-04-27 14:28:20', 'Daniel.Rodriguez', '2023-09-21 22:16:30', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('15', '10', '4', '1', '2023-08-01 11:51:30', '', '2023-08-01 11:51:30', '');
INSERT INTO `usuarios_perfiles` VALUES ('16', '11', '2', '1', '2023-08-17 18:29:28', 'Daniel.Rodriguez', '2023-08-17 18:29:28', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('17', '12', '2', '1', '2023-08-17 18:30:02', 'Daniel.Rodriguez', '2023-08-17 18:30:02', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('18', '13', '3', '1', '2023-09-01 21:31:51', 'Daniel.Rodriguez', '2023-09-01 21:31:51', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('19', '14', '3', '1', '2023-09-05 18:10:16', 'Daniel.Rodriguez', '2023-09-05 18:10:16', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('20', '9', '5', '0', '2023-09-21 22:16:30', 'Daniel.Rodriguez', '2023-11-10 17:58:38', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('21', '15', '7', '1', '2023-10-20 23:22:42', 'Daniel.Rodriguez', '2023-10-20 23:22:42', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('22', '16', '7', '1', '2023-10-30 22:59:29', 'Daniel.Rodriguez', '2023-10-30 22:59:29', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('23', '9', '7', '1', '2023-11-10 17:58:38', 'Daniel.Rodriguez', '2023-11-10 17:58:38', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('24', '17', '7', '1', '2023-11-15 16:51:22', 'Daniel.Rodriguez', '2023-11-15 16:51:22', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('25', '18', '7', '1', '2023-11-16 16:41:20', 'Daniel.Rodriguez', '2023-11-16 16:41:20', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('26', '19', '7', '1', '2023-11-16 16:49:32', 'Daniel.Rodriguez', '2023-11-16 16:49:32', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('27', '20', '7', '1', '2023-11-16 16:54:14', 'Daniel.Rodriguez', '2023-11-16 16:54:14', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('28', '21', '7', '1', '2023-11-16 16:54:51', 'Daniel.Rodriguez', '2023-11-16 16:54:51', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('29', '22', '7', '1', '2023-11-16 16:55:18', 'Daniel.Rodriguez', '2023-11-16 16:55:18', 'Daniel.Rodriguez');
INSERT INTO `usuarios_perfiles` VALUES ('30', '23', '7', '1', '2023-11-17 20:59:36', 'Daniel.Rodriguez', '2023-11-17 20:59:36', 'Daniel.Rodriguez');

-- ----------------------------
-- View structure for `vw_amparos_vencer30dias`
-- ----------------------------
DROP VIEW IF EXISTS `vw_amparos_vencer30dias`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_amparos_vencer30dias` AS select `b`.`Compania_Poliza` AS `Compania_Poliza`,`b`.`Numero_Poliza` AS `Numero_Poliza`,`d`.`CONTRATO_NUMERO_VIVA` AS `NumContrato`,`a`.`Fecha_Inicio_Amparo` AS `Fecha_Inicio_Amparo`,`a`.`Fecha_Fin_Amparo` AS `Fecha_Fin_Amparo`,`c`.`Nombre` AS `TipoAmparo`,`a`.`Cuantia_Amparo` AS `Cuantia_Amparo`,ifnull(group_concat(`e`.`Usuario` separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,'),'NO') AS `Usuarios` from ((((`juridica_contrato_poliza_amparos` `a` join `juridica_contrato_poliza` `b` on((`a`.`Id_Poliza` = `b`.`Id`))) join `juridica_contrato_amparos` `c` on((`c`.`Id` = `a`.`Tipo_Amparo`))) join `juridica_contrato` `d` on((`d`.`ID` = `b`.`Id_Contrato`))) left join `juridica_contrato_poliza_amparos_alertas_vistas` `e` on(((`e`.`Id_Contrato_amparo` = `a`.`Id`) and (`e`.`ACTIVO` = 1)))) where ((`a`.`ACTIVO` = 1) and ((to_days(`a`.`Fecha_Fin_Amparo`) - to_days(curdate())) between 27 and 30)) group by `a`.`Id` order by `a`.`Fecha_Fin_Amparo` ;

-- ----------------------------
-- View structure for `vw_contratos_para_beneficiarios`
-- ----------------------------
DROP VIEW IF EXISTS `vw_contratos_para_beneficiarios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_contratos_para_beneficiarios` AS select `b`.`Nombre` AS `NombreTipoContrato`,`a`.`ID` AS `ID`,`a`.`CONTRATO_NUMERO_VIVA` AS `CONTRATO_NUMERO_VIVA`,`a`.`CONTRATO_NUMERO_CONTRATANTE` AS `CONTRATO_NUMERO_CONTRATANTE`,`a`.`ESTADO_CONTRATO` AS `ESTADO_CONTRATO`,`a`.`TIPO_PROCESO_CONTRATO` AS `TIPO_PROCESO_CONTRATO`,`a`.`CONTRATANTE` AS `CONTRATANTE`,`a`.`FECHA_INI` AS `FECHA_INI`,`a`.`FECHA_FIN` AS `FECHA_FIN`,`a`.`FECHA_CONTRATO` AS `FECHA_CONTRATO`,`a`.`MONTO` AS `MONTO`,`a`.`OBJETO_CONTRATO` AS `OBJETO_CONTRATO`,`a`.`RETENCION` AS `RETENCION`,`a`.`PAGOHONORARIO` AS `PAGOHONORARIO`,`a`.`MONTO_DISPONIBILIDAD_PRESUPUESTAL` AS `MONTO_DISPONIBILIDAD_PRESUPUESTAL`,`a`.`FECHA_DISPONIBILIDAD_PRESUPUESTAL` AS `FECHA_DISPONIBILIDAD_PRESUPUESTAL`,`a`.`DISPONIBILIDAD_PRESUPUESTAL` AS `DISPONIBILIDAD_PRESUPUESTAL`,`a`.`DIRECCION` AS `DIRECCION`,`a`.`PROCESO` AS `PROCESO`,`a`.`APORTES_ESPECIE_MPIO` AS `APORTES_ESPECIE_MPIO`,`a`.`APORTES_RECURSOS_MPIO` AS `APORTES_RECURSOS_MPIO`,`a`.`APORTES_ESPECIE_VIVA` AS `APORTES_ESPECIE_VIVA`,`a`.`APORTES_RECURSOS_VIVA` AS `APORTES_RECURSOS_VIVA`,`a`.`TOTAL_APORTES` AS `TOTAL_APORTES`,`a`.`SEGMENTO_CONTRATO` AS `SEGMENTO_CONTRATO`,`a`.`FECHA_NRO_ACTA` AS `FECHA_NRO_ACTA`,`a`.`NRO_ACTA` AS `NRO_ACTA`,`a`.`TIPO_PERSONA` AS `TIPO_PERSONA`,`a`.`ID_DEPTO` AS `ID_DEPTO`,`a`.`TIPO_MODALIDAD` AS `TIPO_MODALIDAD`,`a`.`TIPO_CONTRATO` AS `TIPO_CONTRATO`,`a`.`FECHA_SOLICITUD` AS `FECHA_SOLICITUD`,`a`.`ROL_TECNICO` AS `ROL_TECNICO`,`a`.`ROL_LOGISTICO` AS `ROL_LOGISTICO`,`a`.`ROL_JURIDICO` AS `ROL_JURIDICO`,`a`.`ID_MUNICIPIO` AS `ID_MUNICIPIO`,`a`.`NOMBRE_CONTACTO` AS `NOMBRE_CONTACTO`,`a`.`NUMERO_CONTACTO` AS `NUMERO_CONTACTO`,`a`.`CORREO_CONTACTO` AS `CORREO_CONTACTO`,`a`.`ORDENADOR_GASTO` AS `ORDENADOR_GASTO`,`a`.`FECHA_TRANS_CAD` AS `FECHA_TRANS_CAD`,`a`.`FECHA_PUBLICACION_SECOP` AS `FECHA_PUBLICACION_SECOP`,`a`.`FECHA_PUBLICACION_GEST_TRANS` AS `FECHA_PUBLICACION_GEST_TRANS`,`a`.`LINK_PUBLICACION_SECOP` AS `LINK_PUBLICACION_SECOP`,`a`.`ID_TIPO_GASTO` AS `ID_TIPO_GASTO`,`a`.`COMPROMISO_PRESUPUESTAL` AS `COMPROMISO_PRESUPUESTAL`,`a`.`MONTO_COMPROMISO_PRESUPUESTAL` AS `MONTO_COMPROMISO_PRESUPUESTAL`,`a`.`FECHA_COMPROMISO_PRESUPUESTAL` AS `FECHA_COMPROMISO_PRESUPUESTAL`,`a`.`MOTIVO_ANULACION` AS `MOTIVO_ANULACION`,`a`.`FECHA_ANULACION` AS `FECHA_ANULACION`,`a`.`POSEE_ARCHIVOS` AS `POSEE_ARCHIVOS`,`a`.`ACTIVO` AS `ACTIVO`,`a`.`UsuarioCreacion` AS `UsuarioCreacion`,`a`.`FechaCreacion` AS `FechaCreacion`,`a`.`UsuarioActualizacion` AS `UsuarioActualizacion`,`a`.`FechaActualizacion` AS `FechaActualizacion` from (`juridica_contrato` `a` join `cfg_tipo_contrato` `b` on((`a`.`TIPO_CONTRATO` = `b`.`Id`))) where ((`b`.`Id` in (11,12,13,14,15)) and (`a`.`ESTADO_CONTRATO` = 'EN EJECUCIÓN') and (`a`.`ACTIVO` = 1)) ;

-- ----------------------------
-- View structure for `vw_contratos_porvencer_15dias`
-- ----------------------------
DROP VIEW IF EXISTS `vw_contratos_porvencer_15dias`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_contratos_porvencer_15dias` AS select `a`.`CONTRATO_NUMERO_VIVA` AS `CONTRATO_NUMERO_VIVA`,`a`.`FECHA_INI` AS `FECHA_INI`,`a`.`FECHA_FIN` AS `FECHA_FIN`,`a`.`TIPO_PROCESO_CONTRATO` AS `TIPO_PROCESO_CONTRATO`,`b`.`Nombre` AS `TipoModalidad`,`c`.`Nombre` AS `TipoContrato`,ifnull(group_concat(`d`.`Usuario` separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,'),'NO') AS `Usuarios` from (((`juridica_contrato` `a` join `juridica_contrato_tipo_modalidad` `b` on((`a`.`TIPO_MODALIDAD` = `b`.`Id`))) join `cfg_tipo_contrato` `c` on((`c`.`Id` = `a`.`TIPO_CONTRATO`))) left join `juridica_contrato_alertas_vistas` `d` on(((`d`.`Id_Contrato` = `a`.`ID`) and (`d`.`ACTIVO` = 1) and (`d`.`D15` = 1)))) where ((`a`.`FECHA_FIN` is not null) and (`a`.`TIPO_PROCESO_CONTRATO` <> 'BVM') and ((to_days(`a`.`FECHA_FIN`) - to_days(curdate())) between 1 and 15)) group by `a`.`CONTRATO_NUMERO_VIVA` ;

-- ----------------------------
-- View structure for `vw_contratos_porvencer_30dias`
-- ----------------------------
DROP VIEW IF EXISTS `vw_contratos_porvencer_30dias`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_contratos_porvencer_30dias` AS select `a`.`CONTRATO_NUMERO_VIVA` AS `CONTRATO_NUMERO_VIVA`,`a`.`FECHA_INI` AS `FECHA_INI`,`a`.`FECHA_FIN` AS `FECHA_FIN`,`a`.`TIPO_PROCESO_CONTRATO` AS `TIPO_PROCESO_CONTRATO`,`b`.`Nombre` AS `TipoModalidad`,`c`.`Nombre` AS `TipoContrato`,ifnull(group_concat(`d`.`Usuario` separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,'),'NO') AS `Usuarios` from (((`juridica_contrato` `a` join `juridica_contrato_tipo_modalidad` `b` on((`a`.`TIPO_MODALIDAD` = `b`.`Id`))) join `cfg_tipo_contrato` `c` on((`c`.`Id` = `a`.`TIPO_CONTRATO`))) left join `juridica_contrato_alertas_vistas` `d` on(((`d`.`Id_Contrato` = `a`.`ID`) and (`d`.`ACTIVO` = 1) and (`d`.`D30` = 1)))) where ((`a`.`FECHA_FIN` is not null) and (`a`.`TIPO_PROCESO_CONTRATO` <> 'BVM') and ((to_days(`a`.`FECHA_FIN`) - to_days(curdate())) between 27 and 30)) group by `a`.`CONTRATO_NUMERO_VIVA` ;

-- ----------------------------
-- View structure for `vw_reporte_contrato_general`
-- ----------------------------
DROP VIEW IF EXISTS `vw_reporte_contrato_general`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_reporte_contrato_general` AS select `a`.`CONTRATO_NUMERO_VIVA` AS `CONTRATO_NUMERO_VIVA`,`a`.`ROL_JURIDICO` AS `ROL_JURIDICO`,`a`.`ROL_LOGISTICO` AS `ROL_LOGISTICO`,`a`.`ROL_TECNICO` AS `ROL_TECNICO`,`a`.`TIPO_CONTRATO` AS `IdTipoContrato`,`b`.`Nombre` AS `TipoContrato`,`a`.`TIPO_MODALIDAD` AS `IdTipoModalidad`,`c`.`Nombre` AS `TipoModalidad`,group_concat(`d`.`NombreContratista`,',' separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,') AS `ContratanteNombre`,group_concat(`d`.`Identificacion`,',' separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,') AS `ContratanteIdentificacion`,group_concat(`d`.`Digito_verificacion`,',' separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,') AS `DigitoVerificacion`,`a`.`OBJETO_CONTRATO` AS `OBJETO_CONTRATO`,`a`.`TOTAL_APORTES` AS `TOTAL_APORTES`,`a`.`APORTES_ESPECIE_VIVA` AS `APORTES_ESPECIE_VIVA`,`a`.`APORTES_RECURSOS_VIVA` AS `APORTES_RECURSOS_VIVA`,`a`.`APORTES_ESPECIE_MPIO` AS `APORTES_ESPECIE_MPIO`,`a`.`APORTES_RECURSOS_MPIO` AS `APORTES_RECURSOS_MPIO`,sum(`e`.`Monto`) AS `OtrasFuentes`,group_concat(`e`.`NombreFuente`,',' separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,') AS `NombreOtrasFuentes`,`f`.`Nombre` AS `Segmento`,`a`.`FECHA_INI` AS `FECHA_INI`,`a`.`FECHA_FIN` AS `FECHA_FIN`,(to_days(ifnull(`a`.`FECHA_ANULACION`,`a`.`FECHA_FIN`)) - to_days(`a`.`FECHA_INI`)) AS `PlazoDias`,`a`.`DIRECCION` AS `IdDireccion`,`g`.`NOMBRE` AS `Direccion`,`a`.`PROCESO` AS `IdProceso`,`h`.`Nombre` AS `Area_Proceso`,`a`.`ORDENADOR_GASTO` AS `ORDENADOR_GASTO`,group_concat(`i`.`Nombre`,',' separator '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0,') AS `Supervisores`,`a`.`FECHA_CONTRATO` AS `FECHA_CONTRATO`,ifnull(`a`.`FECHA_ANULACION`,`a`.`FECHA_FIN`) AS `FechaTerminacion`,`j`.`Id` AS `IdESTADOCONTRATO`,`a`.`ESTADO_CONTRATO` AS `ESTADO_CONTRATO`,`a`.`FECHA_PUBLICACION_SECOP` AS `FECHA_PUBLICACION_SECOP`,`a`.`LINK_PUBLICACION_SECOP` AS `LINK_PUBLICACION_SECOP`,`a`.`FECHA_PUBLICACION_GEST_TRANS` AS `FECHA_PUBLICACION_GEST_TRANS`,year(`a`.`FECHA_CONTRATO`) AS `Vigencia` from (((((((((`juridica_contrato` `a` left join `cfg_tipo_contrato` `b` on((`a`.`TIPO_CONTRATO` = `b`.`Id`))) left join `juridica_contrato_tipo_modalidad` `c` on((`c`.`Id` = `a`.`TIPO_MODALIDAD`))) left join `juridica_contrato_contratante` `d` on((`d`.`Id_Contrato` = `a`.`ID`))) left join `juridica_contrato_otrasfuentes` `e` on((`a`.`ID` = `e`.`Id_Contrato`))) left join `juridica_contrato_tipo_segmento` `f` on((`f`.`Id` = `a`.`SEGMENTO_CONTRATO`))) left join `cfg_areas_depto` `g` on((`g`.`ID` = `a`.`DIRECCION`))) left join `cfg_areas_proceso` `h` on((`h`.`Id` = `a`.`PROCESO`))) left join `juridica_contrato_supervisor` `i` on((`i`.`Id_Contrato` = `a`.`ID`))) left join `juridica_contrato_tipo_estado` `j` on((`j`.`Nombre` = `a`.`ESTADO_CONTRATO`))) group by `a`.`ID` order by `a`.`CONTRATO_NUMERO_VIVA` ;

-- ----------------------------
-- View structure for `vw_report_gestion_contractual`
-- ----------------------------
DROP VIEW IF EXISTS `vw_report_gestion_contractual`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_report_gestion_contractual` AS select `a`.`TIPO_CONTRATO` AS `ID_TIPO_CONTRATO`,`b`.`Nombre` AS `TipoContrato`,`a`.`TIPO_PROCESO_CONTRATO` AS `TIPO_PROCESO_CONTRATO`,`a`.`DIRECCION` AS `Id_Dir`,`c`.`NOMBRE` AS `Direccion`,count(`a`.`DIRECCION`) AS `cantidad`,year(`a`.`FECHA_SOLICITUD`) AS `anio_solicitud`,month(`a`.`FECHA_SOLICITUD`) AS `mes_solicitud`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((`a1`.`TIPO_CONTRATO` = `a`.`TIPO_CONTRATO`) and (`a1`.`DIRECCION` = `a`.`DIRECCION`) and (`a1`.`TIPO_PROCESO_CONTRATO` = `a`.`TIPO_PROCESO_CONTRATO`) and (`a1`.`ESTADO_CONTRATO` = 'DESIERTO'))) AS `Desierto`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((`a1`.`TIPO_CONTRATO` = `a`.`TIPO_CONTRATO`) and (`a1`.`DIRECCION` = `a`.`DIRECCION`) and (`a1`.`TIPO_PROCESO_CONTRATO` = `a`.`TIPO_PROCESO_CONTRATO`) and (`a1`.`ESTADO_CONTRATO` = 'ANULADO'))) AS `Anulado` from ((`juridica_contrato` `a` join `cfg_tipo_contrato` `b` on((`a`.`TIPO_CONTRATO` = `b`.`Id`))) join `cfg_areas_depto` `c` on((`c`.`ID` = `a`.`DIRECCION`))) where ((`a`.`TIPO_PROCESO_CONTRATO` <> 'BVM') and (`a`.`ACTIVO` = 1)) group by `a`.`TIPO_PROCESO_CONTRATO`,`a`.`TIPO_CONTRATO`,`a`.`DIRECCION` order by `a`.`TIPO_PROCESO_CONTRATO`,`b`.`Nombre`,`c`.`NOMBRE` ;

-- ----------------------------
-- View structure for `vw_report_gestion_contractual_totales`
-- ----------------------------
DROP VIEW IF EXISTS `vw_report_gestion_contractual_totales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_report_gestion_contractual_totales` AS select count(`a`.`ID`) AS `Cantidad`,month(`a`.`FECHA_SOLICITUD`) AS `mes_contrato`,year(`a`.`FECHA_SOLICITUD`) AS `anio_contrato`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((month(`a1`.`FECHA_SOLICITUD`) = month(`a`.`FECHA_SOLICITUD`)) and (year(`a`.`FECHA_SOLICITUD`) = year(`a1`.`FECHA_SOLICITUD`)) and (`a1`.`ESTADO_CONTRATO` = 'ANULADO'))) AS `Cant_Anulado`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((month(`a1`.`FECHA_SOLICITUD`) = month(`a`.`FECHA_SOLICITUD`)) and (year(`a`.`FECHA_SOLICITUD`) = year(`a1`.`FECHA_SOLICITUD`)) and (`a1`.`ESTADO_CONTRATO` = 'DESIERTO'))) AS `Cant_Desierto`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((month(`a1`.`FECHA_SOLICITUD`) = month(`a`.`FECHA_SOLICITUD`)) and (year(`a`.`FECHA_SOLICITUD`) = year(`a1`.`FECHA_SOLICITUD`)) and (`a1`.`FECHA_PUBLICACION_SECOP` is not null))) AS `Cant_secop`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((month(`a1`.`FECHA_SOLICITUD`) = month(`a`.`FECHA_SOLICITUD`)) and (year(`a`.`FECHA_SOLICITUD`) = year(`a1`.`FECHA_SOLICITUD`)) and (`a1`.`FECHA_PUBLICACION_GEST_TRANS` is not null))) AS `Cant_GestTrans`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((month(`a1`.`FECHA_SOLICITUD`) = month(`a`.`FECHA_SOLICITUD`)) and (year(`a`.`FECHA_SOLICITUD`) = year(`a1`.`FECHA_SOLICITUD`)) and (`a1`.`FECHA_TRANS_CAD` is not null))) AS `Cant_TransCad`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((month(`a1`.`FECHA_SOLICITUD`) = month(`a`.`FECHA_SOLICITUD`)) and (year(`a`.`FECHA_SOLICITUD`) = year(`a1`.`FECHA_SOLICITUD`)) and (`a1`.`FECHA_NRO_ACTA` is null))) AS `Cant_SinActa`,(select count(`a1`.`ID`) from `juridica_contrato` `a1` where ((month(`a1`.`FECHA_SOLICITUD`) = month(`a`.`FECHA_SOLICITUD`)) and (year(`a`.`FECHA_SOLICITUD`) = year(`a1`.`FECHA_SOLICITUD`)) and (`a1`.`FECHA_SOLICITUD` is null))) AS `Cant_SinLegalizar` from `juridica_contrato` `a` where ((`a`.`ACTIVO` = 1) and (`a`.`ESTADO_CONTRATO` <> 'ANULADO') and (`a`.`FECHA_SOLICITUD` is not null)) group by year(`a`.`FECHA_SOLICITUD`),month(`a`.`FECHA_SOLICITUD`) ;

-- ----------------------------
-- View structure for `vw_saldos_contrato`
-- ----------------------------
DROP VIEW IF EXISTS `vw_saldos_contrato`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_saldos_contrato` AS select (`a`.`MONTO` + ifnull((select sum(`a1`.`MONTO`) from `juridica_contrato_adicion` `a1` where ((`a1`.`ID_CONTRATO` = `a`.`ID`) and (`a1`.`ACTIVO` = 1))),0)) AS `disponible`,(select ifnull((sum(`b1`.`MontoOrden`) - sum((`c1`.`Precio` * `c1`.`Cantidad`))),0) AS `MontoTotal` from ((`pedidos_factura` `a1` join `pedidos_factura_orden_pedidos` `b1`) join `pedidos_factura_nota_credito` `c1`) where ((`b1`.`Id_Factura` = `a1`.`Id`) and (`c1`.`Id_Factura` = `a1`.`Id`) and (`a1`.`Contrato` = `a`.`ID`))) AS `Facturado`,ifnull((select sum((`b2`.`Precio` * `b2`.`Cantidad`)) from (`pedidos_orden_pedido` `a2` join `pedidos_orden_pedidos_materiales` `b2` on((`a2`.`Id` = `b2`.`Id_Orden_Pedido`))) where ((`a2`.`ACTIVO` = 1) and (`b2`.`ACTIVO` = 1) and (`a2`.`Id_Contrato` = `a`.`ID`)) group by `a2`.`Id_Contrato`),0) AS `comprometido`,`a`.`ID` AS `ID` from `juridica_contrato` `a` where (`a`.`ACTIVO` = 1) group by `a`.`ID` ;

-- ----------------------------
-- View structure for `vw_trans_servicios_efectivos`
-- ----------------------------
DROP VIEW IF EXISTS `vw_trans_servicios_efectivos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_trans_servicios_efectivos` AS select count(`a`.`ID`) AS `cantidad_servicios`,`a`.`TipoServicio` AS `TipoServicio`,`b`.`TipoContrato` AS `NomTipoServicio`,(case when (`a`.`TipoServicio` = 1) then (select (`a1`.`Costo` / 30) from `trans_tipo_contrato` `a1` where (`a1`.`ID` = `a`.`TipoServicio`)) when (`a`.`TipoServicio` = 2) then (select (case when (`c`.`Contrato` = 'Zona_1') then `a1`.`Precio_1` when (`c`.`Contrato` = 'Zona_2') then `a1`.`Precio_2` when (`c`.`Contrato` = 'Zona_3') then `a1`.`Precio_3` else 0 end) AS `Precio` from `trans_tipo_contrato` `a1` where (`a1`.`ID` = `a`.`TipoServicio`)) when ((`a`.`TipoServicio` <> 2) and (`a`.`TipoServicio` <> 1)) then (select `a1`.`Costo` from `trans_tipo_contrato` `a1` where (`a1`.`ID` = `a`.`TipoServicio`)) end) AS `Costo`,month(`a`.`FechaSalida`) AS `Mes`,year(`a`.`FechaSalida`) AS `Anio` from ((`trans_servicios` `a` join `trans_tipo_contrato` `b` on((`a`.`TipoServicio` = `b`.`ID`))) join `cfg_municipios` `c` on((`c`.`id` = `a`.`MpioDestino`))) where ((`a`.`ACTIVO` = 1) and (`a`.`Estado` = 'Asignado') and (`a`.`TipoServicio` is not null)) group by `a`.`TipoServicio`,`a`.`Mes`,year(`a`.`FechaSalida`) ;

-- ----------------------------
-- View structure for `vw_trans_servicios_efectivos_cancelados`
-- ----------------------------
DROP VIEW IF EXISTS `vw_trans_servicios_efectivos_cancelados`;
CREATE ALGORITHM=UNDEFINED DEFINER=`invoker`@`localhost` SQL SECURITY DEFINER VIEW `vw_trans_servicios_efectivos_cancelados` AS select `c`.`Nombre` AS `Nombre`,count(`a`.`ID`) AS `cantidad_servicio`,(select count(`a1`.`ID`) from `trans_servicios` `a1` where ((`a1`.`TipoServicio` is not null) and (`a1`.`Estado` = 'Cancelado') and (`a1`.`TipoServicio` = `a`.`TipoServicio`))) AS `Cantidad_Cancelados`,(case when (`a`.`TipoServicio` = 1) then (select (`a1`.`Costo` / 30) from `trans_tipo_contrato` `a1` where (`a1`.`ID` = `a`.`TipoServicio`)) when (`a`.`TipoServicio` = 2) then (select (case when (`b`.`Contrato` = 'Zona_1') then `a1`.`Precio_1` when (`b`.`Contrato` = 'Zona_2') then `a1`.`Precio_2` when (`b`.`Contrato` = 'Zona_3') then `a1`.`Precio_3` else 0 end) AS `Precio` from `trans_tipo_contrato` `a1` where (`a1`.`ID` = `a`.`TipoServicio`)) when ((`a`.`TipoServicio` <> 2) and (`a`.`TipoServicio` <> 1)) then (select `a1`.`Costo` from `trans_tipo_contrato` `a1` where (`a1`.`ID` = `a`.`TipoServicio`)) end) AS `Costo`,month(`a`.`FechaSalida`) AS `Mes`,year(`a`.`FechaSalida`) AS `Anio` from ((`trans_servicios` `a` join `cfg_municipios` `b` on((`b`.`id` = `a`.`MpioDestino`))) join `trans_tipo_servicio` `c` on((`c`.`ID` = `a`.`TipoServicio`))) where ((`a`.`ACTIVO` = 1) and (`a`.`TipoServicio` is not null) and (`a`.`Estado` = 'Asignado')) group by `a`.`TipoServicio`,`a`.`Mes`,year(`a`.`FechaSalida`) ;

-- ----------------------------
-- Function structure for `ObtenerTotalOrdenPedido`
-- ----------------------------
DROP FUNCTION IF EXISTS `ObtenerTotalOrdenPedido`;
DELIMITER ;;
CREATE DEFINER=`invoker`@`localhost` FUNCTION `ObtenerTotalOrdenPedido`(ID_ORDEN_PEDIDO INT) RETURNS float(10,2)
BEGIN
    DECLARE MontoFinal FLOAT(10,2);

    SELECT SUM(c.Cantidad * c.Precio)
    INTO MontoFinal
    FROM pedidos_orden_pedido a
    INNER JOIN pedidos_orden_pedidos_materiales c ON c.Id_Orden_Pedido = a.Id
    WHERE a.Id = ID_ORDEN_PEDIDO;

    RETURN MontoFinal;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `Evt_ACtualizarFechaServicioTrans`
-- ----------------------------
DROP EVENT IF EXISTS `Evt_ACtualizarFechaServicioTrans`;
DELIMITER ;;
CREATE DEFINER=`invoker`@`localhost` EVENT `Evt_ACtualizarFechaServicioTrans` ON SCHEDULE EVERY 1 DAY STARTS '2023-09-18 08:28:57' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE trans_servicios
    SET Estado = 'Terminado'
    WHERE FechaRegreso = CURRENT_DATE AND Estado != 'Cancelado';
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `EVT_ACTUALIZAR_ESTADO_CONTRATO_FINALIZADO`
-- ----------------------------
DROP EVENT IF EXISTS `EVT_ACTUALIZAR_ESTADO_CONTRATO_FINALIZADO`;
DELIMITER ;;
CREATE DEFINER=`invoker`@`localhost` EVENT `EVT_ACTUALIZAR_ESTADO_CONTRATO_FINALIZADO` ON SCHEDULE EVERY 1 DAY STARTS '2023-08-28 10:10:36' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE JURIDICA_CONTRATO
    SET ESTADO_CONTRATO = 'TERMINADO'
    WHERE FECHA_FIN <= CURDATE() AND ESTADO_CONTRATO not in ('TERMINADO','DESIERTO','ANULADO');
END
;;
DELIMITER ;
