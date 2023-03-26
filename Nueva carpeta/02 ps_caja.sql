CREATE PROCEDURE de_caja (
IN PI_Idcuenta INT,
IN PI_Idmovimiento INT
)
BEGIN
DELETE FROM Cuenta
WHERE Idcuenta=PI_Idcuenta;
-- select * from Caja 
DELETE FROM Movimiento
WHERE Idmovimiento=PI_Idmovimiento;

END;

CREATE PROCEDURE upd_caja(
IN PF_Saldo float,
IN PV_Divisa varchar(20),
IN PD_FechaApertura date,
IN PI_Idcuenta int,

IN PV_Tipo varchar(5),
IN Pf_Monto float,
IN PD_FecMovimiento DATETIME,
IN PI_Idmovimiento int
)
BEGIN
-- update del modulo Caja
UPDATE Cuenta
SET
	Saldo = PI_Saldo,
	Divisa = PV_Divisa,
	FechaApertura = PD_FechaApertura

WHERE  Idcuenta= PI_Idcuenta;

UPDATE Movimiento
SET
	Tipo = PV_Tipo,
	Monto = PF_Monto,
	Fecha = PD_Fecha
WHERE Idmovimiento = PI_Idmovimiento;
END;

CREATE PROCEDURE sele_caja(
IN PF_Saldo float,
IN PV_Divisa varchar(20),
IN PD_FechaApertura date,

IN PV_Tipo varchar(5),
IN Pf_Monto float,
IN PD_FecMovimiento DATETIME
)
-- select del modulo caja
-- select de la tabla cuenta
BEGIN
SELECT 
   PI_Saldo,
	PV_Divisa,
	PD_FechaApertura
FROM Cuenta;

-- select de la tabla Movimiento
SELECT 
	PV_Tipo,
	PF_Monto,
	PD_Fecha
FROM Movimiento;
END;
create procedure ins_Caja(

IN PF_Saldo float,
IN PV_Divisa varchar(20),
IN PD_FechaApertura date,

IN PV_Tipo varchar(5),
IN Pf_Monto float,
IN PD_FecMovimiento DATETIME,
)
-- insert de la tabla Caja
BEGIN
INSERT INTO Cuenta
(
Saldo,
Divisa,
FechaApertura
)
VALUES (
PI_Saldo,
PV_Divisa,
PD_FechaApertura
);
end;