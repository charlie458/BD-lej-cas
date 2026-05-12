USE lejos_de_casa;
-- Procedimientos almacenados
-- actualizar estado de un pago

DELIMITER // 
CREATE PROCEDURE sp_actualizar_pago(
IN p_id INT
)

BEGIN 
UPDATE Pagos
SET estado = 'Pagado' 
WHERE id = p_id;

END //

DELIMITER ;

CALL sp_actualizar_pago(4);

CALL sp_actualizar_pago(5);
SELECT * FROM pagos;

DELIMITER //
CREATE PROCEDURE sp_casas_usuario(
IN u_id_propietario VARCHAR(20)
)

BEGIN
SELECT  c.id AS id_casa,
        c.calle,
        c.tipo,
        u.nombres,
        u.apellidos
FROM Casas c
JOIN Usuarios u
ON u.curp = c.id_propietario
WHERE u.curp = u_id_propietario;

END //

DELIMITER ;

CALL sp_casas_usuario('CURP001');


DELIMITER //
CREATE PROCEDURE sp_hacer_reserva(
IN r_fecha_inicio DATETIME,
IN r_fecha_fin DATETIME,
IN r_id_casa INT,
IN r_id_comprador VARCHAR(20)
)

BEGIN
INSERT INTO Reservas (fecha_inicio, fecha_fin, estado, id_casa, id_comprador) VALUES
(r_fecha_inicio, r_fecha_fin, 'Activo', r_id_casa, r_id_comprador);

END // 

DELIMITER ;


CALL sp_hacer_reserva('2026-05-01 14:00:00', '2026-05-08 11:00:00', 6, 'CURP001');

select * from reservas;


DELIMITER //
CREATE PROCEDURE sp_region_nueva(
P_codigo_postal VARCHAR (5),
P_estado varchar (50),
P_municipio varchar(50)

)
BEGIN 
  INSERT INTO regiones (codigo_postal,estado,municipio)
  VALUES (P_codigo_postal, P_estado, P_municipio) ;
END //
DELIMITER ;




CALL sp_region_nueva(20200,'Aguascalientes','Calvillo');


SELECT * FROM regiones;

DELIMITER //
CREATE PROCEDURE sp_numero_cuartos(
P_id INT,
P_numero_cuartos INT
)
BEGIN
	UPDATE casas
    SET cuartos = P_numero_cuartos
    WHERE id = P_id;
END //
DELIMITER ;
DROP PROCEDURE sp_numero_cuartos;

SELECT * FROM casas;

CALL sp_numero_cuartos(1,3);


  
  





