CREATE PROCEDURE `new_procedure` (
IN PI_cod_Banco INT,
IN PI_cod_Beneficios INT,
IN PI_cod_Sucursal INT,
IN PI_cod_Tarjeta INT,
IN PI_cod_Usuario_Tar INT
)
BEGIN
DELETE FROM banco
WHERE cod_Banco=PI_cod_Banco;
-- select * from banco;
DELETE FROM beneficios
WHERE cod_Beneficios=PI_cod_Beneficios;

DELETE FROM sucursal
WHERE cod_Sucursal=PI_cod_Sucursal;

DELETE FROM tarjeta
WHERE cod_Tarjeta=PI_cod_Tarjeta;

DELETE FROM usuario_tarjeta
WHERE cod_Usuario_Tar=PI_cod_Usuario_Tar;
END;
delimiter $
create procedure upd_tarjeta_de_credito(
IN PV_Nom_Banco VARCHAR(45),
IN PV_Dir_Banco VARCHAR(45),
IN PV_Tel_Banco VARCHAR(45),
IN PI_cod_Banco INT,
IN PI_Monto_Tar INT,
IN PI_Pagos_Tar INT,
IN PI_Extrafinanciamiento INT,
IN PI_cod_Beneficios INT,
IN PV_Nom_Sucursal VARCHAR(45),
IN PV_Dir_Sucursal VARCHAR(45),
IN PV_Tel_Sucursal VARCHAR(45),
IN PV_Detalle_Sucursal VARCHAR(100),
IN PI_cod_Sucursal INT,
IN PV_Num_Tarjeta VARCHAR(45),
IN PI_pass_Tarjeta INT,
IN PD_Fec_Transaccion DATETIME,
IN PI_cod_Tarjeta INT,
IN PV_Tipo_Transaccion VARCHAR(100),
IN PV_Nom_Usuario_Tar VARCHAR(45),
IN PV_Email_Usuario_Tar VARCHAR(45),
IN PV_Dir_Usuario_Tar VARCHAR(45),
IN PV_Tel_Usuario_Tar VARCHAR(45),
IN PI_cod_Usuario_Tar INT
)
begin
update usuario_tarjeta
set 
Nom_Usuario_Tar = PV_Nom_Usuario_Tar,
Email_Usuario_Tar = PV_Email_Usuario_Tar,
Dir_Usuario_Tar = PV_Dir_Usuario_Tar,
Tel_Usuario_Tar = PV_Tel_Usuario_Tar
where cod_Usuario_Tar = PI_cod_Usuario_Tar;

UPDATE tarjeta
SET
Num_Tarjeta = PV_Num_Tarjeta,
pass_Tarjeta = PI_pass_Tarjeta,
Fec_Transaccion = PD_Fec_Transaccion,
Tipo_Transaccion= PI_tipo_Transaccion
WHERE cod_Tarjeta = PI_cod_Tarjeta;

UPDATE banco
SET
Nom_Banco = PV_Nom_Banco,
Dir_Banco = PV_Dir_Banco,
Tel_Banco = PV_Tel_Banco
WHERE cod_Banco = PI_cod_Banco;

UPDATE beneficios
SET
Monto_Tar = PI_Monto_Tar,
Pagos_Tar = PI_Pagos_Tar,
Extrafinanciamiento = PI_Extrafinanciamiento
WHERE cod_Beneficios = PI_cod_Beneficios;

UPDATE sucursal
SET
Nom_Sucursal = PV_Nom_Sucursal,
Dir_Sucursal = PV_Dir_Sucursal,
Tel_Sucursal = PV_Tel_Sucursal,
Detalle_Sucursal = PV_Detalle_Sucursal
WHERE cod_Sucursal = PI_cod_Sucursal;

end $


delimiter $
create procedure sel_Tarjeta_Credito(
IN PV_Nom_Banco VARCHAR(45),
IN PV_Dir_Banco VARCHAR(45),
IN PV_Tel_Banco VARCHAR(45),
IN PI_Monto_Tar INT,
IN PI_Pagos_Tar INT,
IN PI_Extrafinanciamiento INT,
IN PV_Nom_Sucursal VARCHAR(45),
IN PV_Dir_Sucursal VARCHAR(45),
IN PV_Tel_Sucursal VARCHAR(45),
IN PV_Detalle_Sucursal VARCHAR(100),
IN PV_Num_Tarjeta VARCHAR(45),
IN PI_pass_Tarjeta INT,
IN PD_Fec_Transaccion DATETIME,
IN PV_Tipo_Transaccion VARCHAR(100),
IN PV_Nom_Usuario_Tar VARCHAR(45),
IN PV_Email_Usuario_Tar VARCHAR(45),
IN PV_Dir_Usuario_Tar VARCHAR(45),
IN PV_Tel_Usuario_Tar VARCHAR(45)
)

-- select del modulo tarjeta de credito
-- select de la tabla banco
BEGIN
SELECT 
    PV_id_Banco
    PV_Nom_Banco,
    PV_Dir_Banco,
    PV_Tel_Banco,
    PI_id_Sucursal
FROM banco;

-- select de la tabla BENEFICIOS
SELECT 
PI_Monto_Tar,
PI_Pagos_Tar,
PI_Extrafinanciamiento
FROM beneficios;

-- select de la tabla SUCURSAL
SELECT 
PV_Nom_Sucursal,
PV_Dir_Sucursal,
PV_Tel_Sucursal,
PV_Detalle_Sucursal
FROM sucursal;

-- select de la tabla TARJETA
SELECT 

PV_Num_Tarjeta,
PI_pass_Tarjeta,
PD_Fec_Transaccion,
PV_Tipo_Transaccion
FROM tarjeta;

-- select de la tabla USUARIO TARJETA
SELECT
PV_Nom_Usuario_Tar,
PV_Email_Usuario_Tar,
PV_Dir_Usuario_Tar,
PV_Tel_Usuario_Tar
FROM usuario_tarjeta;

end $


delimiter $
 create procedure ins_tarjeta_credito (
 in pv_Nom_Usuario_Tar varchar(45),
 in pv_Email_Usuario_Tar varchar(45),
 in pv_Dir_Usuario_Tar Varchar(45),
 in pv_Tel_Usuario_Tar varchar(45),
 in pv_Num_Tarjeta varchar(45) ,
 in pi_pass_Tarjeta int ,
 in pd_Fec_Transaccion datetime ,
 in pv_Tipo_Transaccion varchar(100),
 IN PV_Nom_Banco VARCHAR(45),
IN PV_Dir_Banco VARCHAR(45),
IN PV_Tel_Banco VARCHAR(45),
IN PI_Monto_Tar INT,
IN PI_Pagos_Tar INT,
IN PI_Extrafinanciamiento INT,
IN PV_Nom_Sucursal VARCHAR(45),
IN PV_Dir_Sucursal VARCHAR(45),
IN PV_Tel_Sucursal VARCHAR(45),
IN PV_Detalle_Sucursal VARCHAR(100)
 )
 begin
 insert into usuario_tarjeta (Nom_Usuario_Tar,_Email_Usuario_Tar,_Dir_Usuario_Tar,Tel_Usuario_Tar)
values(pv_Nom_Usuario_Tar,pv_Email_Usuario_Tar,pv_Dir_Usuario_Tar,pv_Tel_Usuario_Tar);

 
 insert into tarjeta (
 Num_Tarjeta, 
pass_Tarjeta , 
Fec_Transaccion,  
Tipo_Transaccion
 )
values(
pv_Num_Tarjeta  ,
pi_pass_Tarjeta  ,
pd_Fec_Transaccion ,
pv_Tipo_Transaccion
);


INSERT INTO banco
(
Nom_Banco,
Dir_Banco,
Tel_Banco
)
VALUES
(
PV_Nom_Banco,
PV_Dir_Banco,
PV_Tel_Banco
);

INSERT INTO beneficios
(
Monto_Tar,
Pagos_Tar,
Extrafinanciamiento
)
VALUES
(
PI_Monto_Tar,
PI_Pagos_Tar,
PI_Extrafinanciamiento
);

INSERT INTO sucursal
(
Nom_Sucursal,
Dir_Sucursal,
Tel_Sucursal,
Detalle_Sucursal
)
VALUES
(
PV_Nom_Sucursal,
PV_Dir_Sucursal,
PV_Tel_Sucursal,
PV_Detalle_Sucursal
);
 end $