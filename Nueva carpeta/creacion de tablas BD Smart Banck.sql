create database SmartBanck;
use SmartBanck;
select * from cliente;
SELECT * FROM empleado;
select * from personas;
select * from usuario;
select * from direcciones;
select * from telefono;
select * from cuenta;
select * from movimiento;
select * from tarjeta;
select * from sucursal;
select * from usuario_tarjeta;
select * from beneficios;
select * from contabilidad;
select * from catalago;
select * from rp_generales;
select * from rel_reportes;

-- MODULO DE PERSONAS
CREATE TABLE Personas (
  cod_persona INT NOT NULL AUTO_INCREMENT,
  nom_persona VARCHAR(150) NOT NULL,
  ID_persona INT(11) NOT NULL,
  edad_persona INT(11) NOT NULL,
  genero_persona VARCHAR(7) NOT NULL, -- F,M,O
  ident_civil VARCHAR(45) NOT NULL,
  tipo_persona VARCHAR(2) NOT NULL, -- E o C
  direccion_persona varchar(150) NOT NULL,
  fecha_registro DATETIME NOT NULL,
  telefono_persona int(11) not null,
  PRIMARY KEY (`cod_persona`));
  
create table cliente (
	cod_cliente int not null,
    cod_persona int,
    tipo_cliente varchar(2),
    Fecha_registro datetime,
    Primary key (cod_cliente),
    foreign key (cod_persona) references modulousuario.personas(cod_personas)
);

create table Empleado (
	cod_empleado int not null,
    cod_persona int,
    cargo_empleado varchar(50),
    Salario_inicial double,
    Primary key (cod_empleado),
    foreign key (cod_persona) references smartbanck.personas(cod_persona)
);

create table Usuario (
	cod_usuario int not null,
    cod_persona int,
    nombre_usuario varchar(50),
    pass_usuario varchar(50),
    estado_usuario varchar(2),
    fecha_registro datetime,
    Primary key (cod_usuario),
    foreign key (cod_persona) references smartbanck.personas(cod_persona)
);

create table Direcciones(
cod_direccion int not null,
cod_persona int,
departamento varchar(50),
colonia varchar(50),
direccion_casa varchar(50),
Primary key (cod_direccion),
foreign key (cod_persona) references smartbanck.personas(cod_persona)
);

create table Telefono(
cod_telefono int not null,
cod_persona int,
telefono int(8),
tel_referencia int(8),
estado_telefono varchar(2),
Primary key (cod_telefono),
foreign key (cod_persona) references smartbanck.personas(cod_persona)
);

-- MODULO DE CAJA
Create Table Cliente (
	cod_cliente int not null,
	Apellidos Varchar (30) not null,
	Nombres Varchar (30) not null,
	Direcion Varchar (100) not null,
	Telefono int not null,
	CodigoSucursal int not null,

	CONSTRAINT PK_Cliente
	PRIMARY KEY (cod_cliente)
);-- NO LA USE

Create Table Cuenta(
	cod_cliente int not null,
	Idcuenta int not null,
	Saldo Float not null,
	Divisa Varchar (20) not null, 
	FechaApertura Date not null,
	PRIMARY KEY (Idcuenta),
    foreign key (cod_cliente) references smartbanck.cliente(cod_cliente)
);
select * from cuenta;

Create Table Movimiento (
	Idcuenta int not null,
	Idmovimiento int not null,
	Tipo Varchar (5) not null,
	Monto Float not null,
	Fecha Datetime not null,
	PRIMARY KEY (Idmovimiento),
	foreign key (Idcuenta) references smartbanck.cuenta(Idcuenta)
    );
	

-- MODULO DE TARJETA DE CREDITO
-- Tabla Usuario_tarjeta
CREATE TABLE Usuario_Tarjeta (
  cod_Usuario_Tar INT NOT NULL AUTO_INCREMENT,
  Nom_Usuario_Tar VARCHAR(45) NOT NULL,
  Email_Usuario_Tar VARCHAR(45) NOT NULL,
  Dir_Usuario_Tar VARCHAR(45) NOT NULL,
  Tel_Usuario_Tar VARCHAR(45) NOT NULL,
  PRIMARY KEY (cod_Usuario_Tar))
ENGINE = InnoDB;

-- tabla Tarjeta
CREATE TABLE Tarjeta (
  cod_Tarjeta INT NOT NULL AUTO_INCREMENT,
  Num_Tarjeta VARCHAR(45) NOT NULL,
  pass_Tarjeta INT NOT NULL,
  Fec_Transaccion DATETIME NOT NULL,
  Tipo_Transaccion VARCHAR(100) NOT NULL,
  Usuario_Tarjeta_cod_Usuario_Tar INT NOT NULL,
  PRIMARY KEY (cod_Tarjeta),
 foreign key (Usuario_Tarjeta_cod_Usuario_Tar) references smartbanck.Usuario_Tarjeta(cod_Usuario_Tar)
);

-- Tabla Sucursal

CREATE TABLE IF NOT EXISTS Sucursal (
  cod_Sucursal INT NOT NULL AUTO_INCREMENT,
  Nom_Sucursal VARCHAR(45) NOT NULL,
  Dir_Sucursal VARCHAR(45) NOT NULL,
  Tel_Sucursal VARCHAR(45) NOT NULL,
  Detalle_Sucursal VARCHAR(100) NOT NULL,
  cod_Tarjeta INT NOT NULL,
  PRIMARY KEY (cod_Sucursal),
  foreign key (cod_Tarjeta) references smartbanck.Tarjeta(cod_Tarjeta)
);

-- Tabla Beneficios
CREATE TABLE Beneficios (
  cod_Beneficios INT NOT NULL AUTO_INCREMENT,
  Monto_Tar INT NOT NULL,
  Pagos_Tar INT NOT NULL,
  Extrafinanciamiento INT NOT NULL,
  cod_Tarjeta INT NOT NULL,
  PRIMARY KEY (cod_Beneficios),
  foreign key (cod_Tarjeta) references smartbanck.Tarjeta(cod_Tarjeta)
);
-- MODULO CONTABILIDAD
CREATE TABLE contabilidad (
  correo_user INT NOT NULL,
  contra_user VARCHAR(45) NOT NULL,
  user_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (correo_user))
ENGINE = InnoDB;

CREATE TABLE catalogo (
  cod_catalogo INT NOT NULL,
  correo_user INT NULL,
  nombre_cuenta VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_catalogo`),
 foreign key (correo_user) references smartbanck.contabilidad(correo_user)
  );
-- Estructura de tabla para la tabla `rel_reportes`
CREATE TABLE `rel_reportes`(
  `COD_REPORTES` bigint(20) NOT NULL COMMENT 'Codigos de la Tabla Relaciones Reportes',
  `COD_GENERALES` bigint(20) DEFAULT NULL COMMENT 'Codigo de Reportes Generales',
  `COD_FORMATOS` bigint(20) DEFAULT NULL COMMENT 'Codigo de Reporte Formato',
  `FEC_GENERADO` datetime NOT NULL COMMENT 'Fecha que se Genero el Reporte'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Estructura de tabla para la tabla `rp_generales`
--

CREATE TABLE `rp_generales` (
  `COD_REPORTE` bigint(20) NOT NULL COMMENT 'LLave Primaria de la Tabla',
  `NOM_REPORTE` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Titulo del Reporte',
  `NOM_USUARIO` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Usuario que genero el Reporte',
  `DES_REPORTE` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripcion del Reporte Generales',
  `COD_FORMATO` bigint(20) DEFAULT NULL COMMENT 'Tipo de Formato del Reporte',
  `FEC_DESDE` datetime NOT NULL COMMENT 'Fecha Inicial del Reporte Generado',
  `FEC_HASTA` datetime NOT NULL COMMENT 'Fecha Final del Reporte Generado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcado de datos para la tabla `rp_generales`
INSERT INTO `rp_generales` (`COD_REPORTE`, `NOM_REPORTE`, `NOM_USUARIO`, `DES_REPORTE`, `COD_FORMATO`, `FEC_DESDE`, `FEC_HASTA`) VALUES
(7, 'Reporte', 'admin', 'funcionando', 10, '2022-01-10 12:00:00', '2022-01-26 12:00:00'),
(8, 'Reporte Inicial', 'admin', 'sin anomalias', 7, '2022-01-22 06:00:00', '2026-01-22 06:00:00'),
(9, 'Observacion', 'admin', 'funcionalidad', 8, '2022-01-22 06:00:00', '2026-01-22 06:00:00'),
(10, 'Reporte Final', 'beauty', 'revision pronto', 9, '2022-01-22 06:00:00', '2026-01-22 06:00:00');

-- Indices de la tabla `rel_reportes`
ALTER TABLE `rel_reportes`
  ADD PRIMARY KEY (`COD_REPORTES`),
  ADD KEY `FK_RELGEN` (`COD_GENERALES`),
  ADD KEY `FK_RELFOR` (`COD_FORMATOS`);
  
  ALTER TABLE `rp_formato`
  ADD PRIMARY KEY (`COD_FORMATO`);

-- Indices de la tabla `rp_generales`
ALTER TABLE `rp_generales`
  ADD PRIMARY KEY (`COD_REPORTE`);

-- AUTO_INCREMENT de la tabla `rel_reportes`
ALTER TABLE `rel_reportes`
  MODIFY `COD_REPORTES` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Codigos de la Tabla Relaciones Reportes', AUTO_INCREMENT=5;

-- AUTO_INCREMENT de la tabla `rp_formato`
ALTER TABLE `rp_formato`
  MODIFY `COD_FORMATO` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'LLave Primaria de la Tabla', AUTO_INCREMENT=12;

-- AUTO_INCREMENT de la tabla `rp_generales`
ALTER TABLE `rp_generales`
  MODIFY `COD_REPORTE` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'LLave Primaria de la Tabla', AUTO_INCREMENT=11;

