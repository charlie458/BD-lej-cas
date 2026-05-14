-- nuevas vistas y triggers
USE lejos_de_casa;
CREATE VIEW vw_reserva_completa AS 
SELECT 
	r.id as id_reserva,
    r.fecha_inicio as fecha_inicio,
    r.fecha_fin as fecha_fin,
    r.estado as estado,
    c.id as id_casa,
    c.cupo as cupo,
    c.tipo as tipo,
    c.cuartos as cuartos,
    c.calle as calle,
    c.num_interior as numero_interior,
    c.precio as precio,
    u.curp as 'curp usuario',
    u.nombres as nombres,
    u.apellidos as apellidos,
    u.correo as correo,
    u.telefono as telefono,
    u.rol as rol
FROM reservas as r 
JOIN casas as c ON r.id_casa = c.id
JOIN usuarios as u ON u.curp = r.id_comprador;

SELECT * FROM vw_reserva_completa;


DELIMITER //
CREATE TRIGGER trg_creacion_reserva
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
	INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
		VALUES (
			'reservas', 
			'INSERT', 
			CURRENT_USER(), 
			CONCAT('Se realizo una nueva reserva ID: ', NEW.id, ' por el ussuario: ',NEW.id_comprador,' Casa reservada: ',NEW.id_casa,
            ' Fecha inicio: ',NEW.fecha_inicio,' Fecha de corte: ',NEW.fecha_fin)
);

END //
DELIMITER ;

INSERT INTO Reservas (fecha_inicio, fecha_fin, estado, id_casa, id_comprador) VALUES
('2026-07-15 14:00:00', '2026-07-30 11:00:00', 'Activo', 1, 'CURP003');

SELECT * FROM bitacora;
DELIMITER //

CREATE PROCEDURE sp_limpieza_reservas_vencidas()
BEGIN
    DECLARE v_filas_afectadas INT;

    UPDATE Reservas 
    SET estado = 'Caducado' 
    WHERE fecha_fin < NOW() AND estado = 'Activo' AND id>0;
    
    SET v_filas_afectadas = ROW_COUNT();

    -- Registrar la limpieza en la bitácora
    IF v_filas_afectadas > 0 THEN
        INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
        VALUES ('Reservas', 'AUTO-UPDATE', 'SYSTEM', CONCAT('Se caducaron ', v_filas_afectadas, ' reservas antiguas.'));
    END IF;
    
    SELECT CONCAT('Limpieza completada. Reservas actualizadas: ', v_filas_afectadas) AS Status;
END //

DELIMITER ;

CALL sp_limpieza_reservas_vencidas;

SELECT * FROM reservas;


DELIMITER //
-- CREATE TRIGGER 

CREATE VIEW vw_usuarios_mejor_valorados AS
SELECT 
	u.curp,
    CONCAT(u.nombres,' ',u.apellidos) AS nombre_completo,
    u.correo,
    AVG(r.calificacion) AS promedio_valoracion,
    COUNT(r.id) AS total_resenias
FROM Usuarios u
JOIN ReseniasUsuario r ON u.curp = r.id_Usuario
GROUP BY u.curp
HAVING total_resenias > 0
ORDER BY promedio_valoracion DESC, total_resenias DESC;


SELECT * FROM vw_usuarios_mejor_valorados;


CREATE VIEW vw_casas_mejor_valoradas AS
SELECT
	c.id AS ID_casa,
	c.cupo AS cupo,
	c.tipo AS tipo,
	c.imagen AS imagen,
	c.cuartos AS cuartos,
	c.calle AS calle,
	c.num_interior AS num_interior,
	c.id_region AS id_region,
	c.id_propietario AS id_propietario,
	c.precio AS precio,
	AVG(r.calificacion) AS promedio_valoracion,
    COUNT(r.id) AS total_resenias
FROM casas c
JOIN ReseniasCasas r ON r.id_casa = c.id
GROUP BY c.id
HAVING total_resenias > 0
ORDER BY promedio_valoracion DESC, total_resenias DESC;

SELECT * FROM vw_casas_mejor_valoradas;






    