use lejos_de_casa;
start transaction;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Regiones;
TRUNCATE TABLE Usuarios;
TRUNCATE TABLE Casas;
TRUNCATE TABLE Reservas;
TRUNCATE TABLE Pagos;
TRUNCATE TABLE Contratos;
TRUNCATE TABLE ReseniasCasas;
TRUNCATE TABLE ReseniasUsuario;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Regiones (codigo_postal, estado, municipio) VALUES
('01000', 'CDMX', 'Álvaro Obregón'),
('44100', 'Jalisco', 'Guadalajara'),
('64000', 'Nuevo León', 'Monterrey'),
('72000', 'Puebla', 'Puebla'),
('97000', 'Yucatán', 'Mérida');

INSERT INTO Usuarios (curp, nombres, apellidos, correo, telefono, rol, fecha_registro, calle, num_interior, codigo_postal, ciudad, municipio,contrasena) VALUES
('CURP001', 'Juan', 'Pérez', 'juan@mail.com', '5550001', 'vendedor', NOW(), 'Av. Reforma', 10, '01000', 'CDMX', 'Álvaro Obregón','123'),
('CURP002', 'María', 'García', 'maria@mail.com', '5550002', 'comprador', NOW(), 'Calle 5', 20, '44100', 'Guadalajara', 'Guadalajara','123'),
('CURP003', 'Carlos', 'Rodríguez', 'carlos@mail.com', '5550003', 'ambos', NOW(), 'Hidalgo', 5, '64000', 'Monterrey', 'Monterrey','123'),
('CURP004', 'Ana', 'Martínez', 'ana@mail.com', '5550004', 'vendedor', NOW(), 'Juárez', 15, '72000', 'Puebla', 'Puebla','123'),
('CURP005', 'Luis', 'Hernández', 'luis@mail.com', '5550005', 'comprador', NOW(), 'Madero', 8, '97000', 'Mérida', 'Mérida','123'),
('CURP006', 'Elena', 'López', 'elena@mail.com', '5550006', 'vendedor', NOW(), 'Constitución', 12, '01000', 'CDMX', 'Álvaro Obregón','123'),
('CURP007', 'Pedro', 'Sánchez', 'pedro@mail.com', '5550007', 'comprador', NOW(), 'Independencia', 3, '44100', 'Guadalajara', 'Guadalajara','123'),
('CURP008', 'Sofía', 'Ramírez', 'sofia@mail.com', '5550008', 'ambos', NOW(), 'Morelos', 101, '64000', 'Monterrey', 'Monterrey','123'),
('CURP009', 'Jorge', 'Flores', 'jorge@mail.com', '5550009', 'vendedor', NOW(), 'Serdán', 45, '72000', 'Puebla', 'Puebla','123'),
('CURP010', 'Lucía', 'Torres', 'lucia@mail.com', '5550100', 'comprador', NOW(), 'Montejo', 22, '97000', 'Mérida', 'Mérida','123'),
('CURP011', 'Miguel', 'Vázquez', 'miguel@mail.com', '5550111', 'vendedor', NOW(), 'Insurgentes', 500, '01000', 'CDMX', 'Álvaro Obregón','123'),
('CURP012', 'Laura', 'Gómez', 'laura@mail.com', '5550112', 'comprador', NOW(), 'Vallarta', 33, '44100', 'Guadalajara', 'Guadalajara','123'),
('CURP013', 'Diego', 'Díaz', 'diego@mail.com', '5550113', 'ambos', NOW(), 'Garza Sada', 88, '64000', 'Monterrey', 'Monterrey','123'),
('CURP014', 'Rosa', 'Morales', 'rosa@mail.com', '5550114', 'vendedor', NOW(), 'Revolución', 9, '72000', 'Puebla', 'Puebla','123'),
('CURP015', 'Oscar', 'Reyes', 'oscar@mail.com', '5550115', 'comprador', NOW(), 'Calle 60', 110, '97000', 'Mérida', 'Mérida','123'),
('CURP016', 'Jorge', '', 'prueba@mail.com', '5550116', 'comprador', NOW(), 'Calle 60', 110, '97000', 'Mérida', 'Mérida','123');

INSERT INTO Casas (cupo, tipo, imagen, cuartos, calle, num_interior, id_region, id_propietario,precio) VALUES
(4, 'Dos plantas', 'img1.jpg', 3, 'Roble', 101, '01000', 'CURP001',5000),
(2, 'Una planta', 'img2.jpg', 1, 'Pino', 202, '44100', 'CURP003',7000),
(6, 'Otro tipo', 'img3.jpg', 4, 'Cedro', 303, '64000', 'CURP004',10000),
(3, 'Dos plantas', 'img4.jpg', 2, 'Sauce', 404, '72000', 'CURP006',5000),
(5, 'Una planta', 'img5.jpg', 3, 'Palma', 505, '97000', 'CURP008',6000),
(2, 'Una planta', 'img6.jpg', 1, 'Olmo', 606, '01000', 'CURP009',10000),
(8, 'Dos plantas', 'img7.jpg', 5, 'Fresno', 707, '44100', 'CURP011',12000),
(4, 'Dos plantas', 'img8.jpg', 3, 'Abeto', 808, '64000', 'CURP013',11000),
(3, 'Una planta', 'img9.jpg', 2, 'Alamo', 909, '72000', 'CURP014',10000),
(6, 'Otro tipo', 'img10.jpg', 4, 'Enebro', 111, '97000', 'CURP001',9000);

INSERT INTO Reservas (fecha_inicio, fecha_fin, estado, id_casa, id_comprador) VALUES
('2024-05-01 14:00:00', '2024-05-07 11:00:00', 'Activo', 1, 'CURP002'),
('2024-06-10 14:00:00', '2024-06-15 11:00:00', 'Activo', 2, 'CURP005'),
('2024-03-01 14:00:00', '2024-03-05 11:00:00', 'Caducado', 3, 'CURP007'),
('2024-07-20 14:00:00', '2024-07-25 11:00:00', 'Activo', 4, 'CURP010'),
('2024-08-01 14:00:00', '2024-08-10 11:00:00', 'Activo', 5, 'CURP012'),
('2024-01-15 14:00:00', '2024-01-20 11:00:00', 'Caducado', 6, 'CURP015'),
('2024-09-05 14:00:00', '2024-09-12 11:00:00', 'Activo', 7, 'CURP003'),
('2024-10-10 14:00:00', '2024-10-15 11:00:00', 'Activo', 8, 'CURP008');

INSERT INTO Pagos (tipo, cantidad, estado, feche_pago, id_reserva) VALUES
('Tarjeta de credito', 4500.50, 'Pagado', '2024-04-28 10:00:00', 1),
('Efectivo', 2800.00, 'Pagado', '2024-06-05 15:30:00', 2),
('Tarjeta de debito', 6000.00, 'Pagado', '2024-02-25 09:15:00', 3),
('Tarjeta de credito', 3200.00, 'Pendiente', '2024-07-15 11:00:00', 4),
('Tarjeta de debito', 7500.00, 'Pagado', '2024-07-28 14:20:00', 5),
('Efectivo', 1950.00, 'Pagado', '2024-01-10 18:00:00', 6),
('Tarjeta de credito', 8900.00, 'Pendiente', '2024-09-01 12:00:00', 7),
('Tarjeta de debito', 5400.00, 'Pagado', '2024-10-05 10:45:00', 8);

INSERT INTO Contratos (contrato_pdf, vigencia, id_reserva) VALUES
('pdf_reserva_1.pdf', '2024-05-07 23:59:59', 1),
('pdf_reserva_2.pdf', '2024-06-15 23:59:59', 2),
('pdf_reserva_3.pdf', '2024-03-05 23:59:59', 3),
('pdf_reserva_4.pdf', '2024-07-25 23:59:59', 4),
('pdf_reserva_5.pdf', '2024-08-10 23:59:59', 5),
('pdf_reserva_6.pdf', '2024-01-20 23:59:59', 6),
('pdf_reserva_7.pdf', '2024-09-12 23:59:59', 7),
('pdf_reserva_8.pdf', '2024-10-15 23:59:59', 8);

INSERT INTO ReseniasCasas (calificacion, comentario, id_casa, id_calificador, fecha) VALUES
(5, 'La casa de CDMX está increíble, muy céntrica.', 1, 'CURP002', NOW()),
(4, 'Un poco pequeña pero muy acogedora.', 2, 'CURP005', NOW()),
(3, 'El aire acondicionado fallaba un poco.', 3, 'CURP007', NOW()),
(5, 'Vistas espectaculares, volvería sin duda.', 4, 'CURP010', NOW()),
(2, 'La limpieza dejó mucho que desear.', 6, 'CURP015', NOW());

INSERT INTO ReseniasUsuario (calificacion, comentario, id_Usuario, id_calificador, fecha) VALUES
(5, 'Excelente inquilina, dejó todo impecable.', 'CURP002', 'CURP001', NOW()),
(4, 'Muy amable, aunque llegó un poco tarde al check-in.', 'CURP005', 'CURP003', NOW()),
(5, 'Trato muy profesional y respetuoso.', 'CURP007', 'CURP004', NOW()),
(3, 'Tuve problemas para contactarlo al final.', 'CURP010', 'CURP006', NOW()),
(5, 'Huésped ejemplar.', 'CURP015', 'CURP009', NOW());

-- eliminar ultima reserva
delete from pagos where id_reserva=8;
delete from Contratos where id_reserva=8;
delete from reservas where id=8;

-- actualizar numero de un cliente
update Usuarios
set telefono = '555090'
where curp = 'CURP009';

-- ampliar reserva
update reservas 
set fecha_fin = '2024-01-22 12:00:00'
where id = 6;


commit;
