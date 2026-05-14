USE lejos_de_casa;

CREATE TABLE IF NOT EXISTS Bitacora(
    id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    tabla_afectada VARCHAR(50) NOT NULL,   
    operacion VARCHAR(50),
    usuario_db VARCHAR(100),                 
    fecha_movimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(255)
);

INSERT INTO Casas (cupo, tipo, imagen, cuartos, calle, num_interior, id_region, id_propietario,precio) 
VALUES (2, 'Una planta', 'loft_mty.jpg', 1, 'Calle Falsa', 123, '64000', 'CURP011',12000);

INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
VALUES (
    'Casas', 
    'INSERT', 
    USER(), 
    CONCAT('Se creó nueva casa con ID: ', LAST_INSERT_ID(), ' para el propietario CURP011')
);

UPDATE Casas 
SET cupo = 6, 
    imagen = 'img5_new.jpg' 
WHERE id = 5;

INSERT INTO Bitacora (tabla_afectada, operacion, usuario_db, descripcion)
VALUES (
    'Casas', 
    'UPDATE', 
    USER(), 
    'Se actualizó el cupo a 6 y la imagen de la casa con ID: 5'
);


select * from bitacora;

