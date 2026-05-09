USE lejos_de_casa;

START TRANSACTION;

INSERT INTO Casas (cupo, tipo, imagen, cuartos, calle, num_interior, id_region, id_propietario) 
VALUES (5, 'Dos plantas', 'img11.jpg', 4, 'Av.  bade de datos ', 742, '01000', 'CURP011');

SET @nuevo_id_casa = LAST_INSERT_ID();

INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
VALUES (
    'Casas', 
    'INSERT', 
    USER(), 
    CONCAT('Alta exitosa de propiedad ID: ', @nuevo_id_casa, ' en region 01000')
);

COMMIT;

SELECT * FROM Casas;




START TRANSACTION;

DELETE FROM Pagos WHERE id_reserva IN (SELECT id FROM Reservas WHERE id_casa = 11);
DELETE FROM Contratos WHERE id_reserva IN (SELECT id FROM Reservas WHERE id_casa = 11);

DELETE FROM Casas WHERE id = 11;

INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
VALUES ('Casas', 'DELETE', USER(), 'Intento de borrado de casa ID 11');

-- Se cancela la eliminacion de esa casa
ROLLBACK;







