use lejos_de_casa;

create user 'administrador'@'localhost' identified by '1234';
create user ''@'localhost' identified by '1234';

create role 'Administrador';
create role 'Administrador_de_Ususarios';

grant all privileges on lejos_de_casa.* to 'Administrador';
grant select on lejos_de_casa.usuarios to 'Administrador_de_Ususarios';

grant 'Administrador' to 'administrador'@'localhost';
grant 'Administrador_de_Ususarios' to 'consulta'@'localhost';

CREATE VIEW vw_casas_clientes_ubicacion AS
SELECT u.nombres AS protierario, id AS id_casa, u.calle FROM Casas JOIN Usuarios as u ON u.curp = Casas.id_propietario;

SELECT * FROM vw_casas_clientes_ubicacion;

CREATE VIEW vw_casas_disponibles AS 
select c.id as id_Casas_disponibles from casas c
where c.id not in (select id_casa from reservas where estado = 'Activo');

SELECT * FROM vw_casas_disponibles;

