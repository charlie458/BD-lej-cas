use lejos_de_casa;

create user if not exists 'administrador'@'localhost' identified by '1234';
create user 'admin_users'@'localhost' identified by '1234';
create user if not exists 'gestion_casas'@'localhost' identified by '1234';

create role if not exists 'Administrador';
create role if not exists 'Administrador_de_Ususarios';
create role if not exists 'Gestor_casas';

grant all privileges on lejos_de_casa.* to 'Administrador';
grant select on lejos_de_casa.usuarios to 'Administrador_de_Ususarios';

grant 'Administrador' to 'administrador'@'localhost';
grant 'Administrador_de_Ususarios' to 'admin_users'@'localhost';
GRANT 'Gestor_casas' TO 'gestion_casas'@'localhost';

GRANT SELECT, INSERT, UPDATE ON lejos_de_casa.Casas TO 'Gestor_casas';
GRANT SELECT, INSERT, UPDATE ON lejos_de_casa.Regiones TO 'Gestor_casas';


GRANT SELECT ON lejos_de_casa.Usuarios TO 'Gestor_casas';

GRANT SELECT ON lejos_de_casa.ReseniasCasas TO 'Gestor_casas';

CREATE VIEW vw_casas_clientes_ubicacion AS
SELECT u.nombres AS protierario, id AS id_casa, u.calle FROM Casas JOIN Usuarios as u ON u.curp = Casas.id_propietario;

SELECT * FROM vw_casas_clientes_ubicacion;

CREATE VIEW vw_casas_disponibles AS 
select c.id as id_Casas_disponibles from casas c
where c.id not in (select id_casa from reservas where estado = 'Activo');

SELECT * FROM vw_casas_disponibles;

CREATE VIEW vw_pagos_pendientes AS
SELECT 
    p.id AS id_pago,
    u.nombres AS cliente,
    u.telefono AS telefono,
    c.calle AS direccion_casa,
    p.cantidad AS monto_deuda,
    r.fecha_inicio AS inicio_estancia,
    r.fecha_fin AS fin_estancia,
    con.contrato_pdf AS archivo_contrato,
    p.estado
FROM Pagos p
JOIN Reservas r ON p.id_reserva = r.id
JOIN Usuarios u ON r.id_comprador = u.curp
JOIN Casas c ON r.id_casa = c.id
LEFT JOIN Contratos con ON r.id = con.id_reserva
WHERE p.estado = 'Pendiente';

SELECT * FROM vw_pagos_pendientes;

-- REVOKE 'Administrador' FROM 'administrador'@'localhost';
-- DROP ROLE 'Administrador';
-- DROP USER 'administrador'@'localhost';
