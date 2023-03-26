CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ins_Persona`(
-- Parametros para la tabla personas
-- IN PI_COD_PERSONA int(11),
IN PV_NOM_PERSONA varchar(150), 
IN PI_ID_PERSONA int(11),
IN PI_EDAD_PERSONA int(11),
IN PV_GENERO_PERSONA varchar(7), -- F,M,O
IN PV_IDENT_CIVIL varchar(45),
IN PV_TIPO_PERSONA varchar(2),   -- E o C
IN PV_DIRECCION_PER VARCHAR(150),
IN PD_FECHA_REGISTRO_PER datetime,
IN PD_TELEFONO_PERSONA INT(11),

-- Parametros para la tablas Empleados 
IN PI_COD_EMPLEADO INT(11),
IN PI_COD_PERSONA_E INT(11),
IN PV_CARGO_EMPLEADO VARCHAR(50),
IN PI_SALARIO_INICIAL DOUBLE,
-- Parametros para la tabla clientes
IN PI_COD_CLIENTE INT(11),
IN PI_COD_PERSONA_C int(11),
IN PV_TIPO_CLIENTE varchar(2),
IN PD_FECHA_REGISTRO_CLI datetime,
-- Parametros para la tabla usuario 
IN PI_COD_USUARIO INT(11),
IN PI_COD_PERSONA_U INT(11),
IN PV_NOMBRE_USUARIO varchar(50),
IN PV_PASS_USUARIO varchar(50),
IN PV_ESTADO_USUARIO varchar(2),
IN PD_FECHA_REGISTRO_USR datetime
)
BEGIN
start transaction;
 -- INSERTANDO EN LA TABLA PERSONA
 INSERT INTO personas(
 -- cod_personas,
 nom_persona,
 Id_persona,
 edad_persona,
 genero_personal,
 ident_civil,
 tipo_persona,
 direccion_persona,
 fecha_registro,
 telefono_persona
 ) values (
PI_COD_PERSONA,
PV_NOM_PERSONA,
PI_ID_PERSONA,
PI_EDAD_PERSONA,
PV_GENERO_PERSONA,
PV_IDENT_CIVIL,
PV_TIPO_PERSONA,
PV_DIRECCION_PER,
PD_FECHA_REGISTRO_PER,
PD_TELEFONO_PERSONA
);
-- insertando en la tabla empleados
insert into empleado(
cod_empleado,
cod_persona,
cargo_empleado,
Salario_inicial
) values(
PI_COD_EMPLEADO,
PI_COD_PERSONA_E,
PV_CARGO_EMPLEADO,
PI_SALARIO_INICIAL 
);
-- insertando en la tabla clientes
insert into cliente(
cod_cliente,
cod_persona,
tipo_cliente,
Fecha_registro
) values(
 PI_COD_CLIENTE,
 PI_COD_PERSONA_C,
 PV_TIPO_CLIENTE,
 PD_FECHA_REGISTRO_CLI
);
-- insertando en la tabla usuario
insert into usuario(
cod_usuario,
cod_persona,
nombre_usuario,
pass_usuario,
estado_usuario,
fecha_registro
) values(
 PI_COD_USUARIO,
 PI_COD_PERSONA_U,
 PV_NOMBRE_USUARIO,
 PV_PASS_USUARIO,
 PV_ESTADO_USUARIO,
 PD_FECHA_REGISTRO_USR
);
commit;
END