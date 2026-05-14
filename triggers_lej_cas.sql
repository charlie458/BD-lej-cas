USE lejos_de_casa;

DELIMITER //

CREATE TRIGGER trg_casa_insert
AFTER INSERT ON Casas
FOR EACH ROW 
BEGIN

INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
VALUES (
    'Casas', 
    'INSERT', 
    CURRENT_USER(), 
    CONCAT('Se creó nueva casa con ID: ', NEW.id, ' para el propietario ',NEW.id_propietario)
);

END //
DELIMITER ;

SELECT * FROM bitacora;
INSERT INTO Casas (cupo, tipo, imagen, cuartos, calle, num_interior, id_region, id_propietario,precio) VALUES
(4, 'Dos plantas', 'img16.jpg', 2, 'Clarin', '201', '01000', 'CURP001',10000);


SELECT * FROM casas;

DELIMITER //
CREATE TRIGGER trg_verificar_disponibilidad

BEFORE INSERT ON Reservas
FOR EACH ROW
BEGIN
	DECLARE checar_reservas INT;
	SELECT  COUNT(*) INTO checar_reservas
    FROM Reservas
    WHERE id_casa = NEW.id_casa
    AND estado = 'Activo'
    AND((NEW.fecha_inicio BETWEEN fecha_inicio AND fecha_fin) OR
    (NEW.fecha_fin BETWEEN fecha_inicio AND fecha_fin) OR
	(fecha_inicio BETWEEN NEW.fecha_inicio AND NEW.fecha_fin));

IF checar_reservas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La casa ya tiene una reserva activa en esas fechas.';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE TRIGGER trg_registro_pagos

AFTER UPDATE ON Pagos
FOR EACH ROW
BEGIN
	IF NEW.estado = 'Pagado' THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Pagos', 'UPDATE', USER(), CONCAT('Se realizo el pago: ',NEW.id));
	END IF;
END //
DELIMITER ;



SELECT * FROM Reservas;

INSERT INTO Reservas (fecha_inicio, fecha_fin, estado, id_casa, id_comprador) VALUES
('2024-05-01 14:00:00', '2026-05-07 11:00:00', 'Activo', 1, 'CURP002');

SELECT * FROM Pagos;

UPDATE Pagos
SET estado = 'Pagado'
WHERE id = 10;

SELECT * FROM Bitacora;



    
    
DELIMITER //

CREATE TRIGGER trg_update_usuarios
AFTER UPDATE ON Usuarios
FOR EACH ROW
BEGIN
	IF NEW.correo <> OLD.correo THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo correo, nuevo:',NEW.correo,'anterior: ',OLD.correo));
	END IF;
    	IF NEW.telefono <> OLD.telefono THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo telefono, nuevo:',NEW.telefono,'anterior: ',OLD.telefono));
	END IF;
    	IF NEW.rol <> OLD.rol THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo rol, nuevo:',NEW.rol,'anterior: ',OLD.rol));
	END IF;
    	IF NEW.calle <> OLD.calle THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo calle, nuevo:',NEW.calle,'anterior: ',OLD.calle));
	END IF;
    	IF NEW.num_interior <> OLD.num_interior THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo num_interior, nuevo:',NEW.num_interior,'anterior: ',OLD.num_interior));
	END IF;
    	IF NEW.codigo_postal <> OLD.codigo_postal THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo codigo_postal, nuevo:',NEW.codigo_postal,'anterior: ',OLD.codigo_postal));
	END IF;
    	IF NEW.ciudad <> OLD.ciudad THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo ciudad, nuevo:',NEW.ciudad,'anterior: ',OLD.ciudad));
	END IF;
		IF NEW.municipio <> OLD.municipio THEN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
	VALUES ('Usuarios', 'UPDATE', USER(), CONCAT('Se relizo un update en el usuario: ',NEW.curp,'Se actualizo el campo municipio, nuevo:',NEW.municipio,'anterior: ',OLD.municipio));
	END IF;
END //
DELIMITER ;


-- 

DELIMITER //
CREATE TRIGGER trg_creacion_pago
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
	INSERT INTO Pagos (tipo, cantidad, estado, feche_pago, id_reserva) VALUES
	('Tarjeta de credito', 00, 'Pendiente',NOW(), NEW.id);
END //
DELIMITER ;

INSERT INTO Reservas (fecha_inicio, fecha_fin, estado, id_casa, id_comprador) VALUES
('2024-05-02 14:00:00', '2024-05-08 11:00:00', 'Activo', 2, 'CURP002');

SELECT * FROM reservas;

SELECT * FROM pagos;







SELECT* FROM Usuarios;

UPDATE Usuarios
SET telefono = '4491231235'
WHERE curp = 'CURP001';

SELECT * FROM Bitacora;
