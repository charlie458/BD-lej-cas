-- consultas
use lejos_de_casa;

select * from usuarios;

select curp, nombres, rol from usuarios where rol='vendedor';

select * from regiones;
-- 64000
select polnito.curp, polnito.nombres, r.codigo_postal from usuarios polnito join casas c
on polnito.curp = c.id_propietario join regiones r
on r.codigo_postal = c.id_region
where r.codigo_postal = '64000'
group by polnito.nombres, polnito.curp, r.codigo_postal;
-- promedio de cupo por municipio
select r.municipio,r.estado, avg(c.cupo) as 'Promedio de cupo' from casas c join regiones r
on r.codigo_postal = c.id_region
group by r.municipio, r.estado;

-- seleccionar casa mas cara
select * from casas;
select * from pagos;
select * from reservas;

select p.cantidad, c.id from casas c join reservas r
on c.id = r.id_casa join pagos p
on p.id_reserva = r.id
group by p.cantidad, c.id order by p.cantidad desc
limit 1;


select * from reservas order by fecha_fin limit 1;

select * from Usuarios  AS U LEFT JOIN reservas AS r ON r.id_comprador = u.curp
where r.id_comprador is null; 

SELECT SUM(cantidad) AS total FROM pagos;

