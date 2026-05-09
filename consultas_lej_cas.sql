use lejos_de_casa;

-- nivel 1
select * from reservas order by fecha_inicio;

select nombres, curp from usuarios;

select * from casas where cupo > 1 order by cupo;

select * from reservas order by fecha_fin;

select * from pagos where cantidad > 2000;

-- nivel 2
select c.id as casa, r.codigo_postal, r.estado, r.municipio 
from casas c join regiones r where r.codigo_postal = c.id_region;

select u.nombres, c.id from usuarios u join casas c 
where u.curp = c.id_propietario;

select r.id as reserva, p.cantidad as pago, p.estado as estado
from reservas r join pagos p where r.id = p.id_reserva; 

select u.curp as curp, u.nombres as nombres, u.apellidos as apellidos
from usuarios u join reservas r where u.curp = r.id_comprador;

select c.id as casa from casas c join reservas r 
where c.id = r.id;

-- nivel 3 
select c.id as casa, p.cantidad as total 
from casas c
join reservas r on c.id = r.id_casa
join pagos p on r.id = p.id_reserva
where p.cantidad > (select avg(cantidad) from pagos);

select c.id as 'casas sin reserva' from
casas c where c.id not in (select id_casa from reservas);

select c.id as casa, r.codigo_postal, u.curp as curp, u.nombres as nombres, u.apellidos as apellidos
from usuarios u
join casas c on u.curp = c.id_propietario
join regiones r on c.id_region = r.codigo_postal
where r.codigo_postal = '01000';

-- nivel 4
select c.id as 'casas disponibles' from casas c
where c.id not in (select id_casa from reservas where estado = 'Activo');

select sum(cantidad) as 'Total pagado' from pagos;

select c.id as 'casa mas cara', p.cantidad as 'total'
from casas c 
join reservas r on c.id = r.id_casa
join pagos p on p.id_reserva = r.id
order by p.cantidad desc
limit 1;

select u.curp as usuario, count(c.id) as 'total de casas'
from usuarios u join casas c where u.curp = c.id_propietario
group by u.curp;

select u.curp as usuario, count(r.id) as reservas
from usuarios u join reservas r 
where u.curp = r.id_comprador
group by u.curp
having count(r.id)>1;

select r.codigo_postal, r.estado, r.municipio, count(c.id) as 'total de casas'
from regiones r join casas c where r.codigo_postal = c.id_region
group by r.codigo_postal order by count(c.id) limit 1;

-- nivel 5

select u.curp as curp, u.nombres as nombres, sum(p.cantidad) as 'total ganado'
from usuarios u 
join casas c on c.id_propietario = u.curp
join reservas r on r.id_casa = c.id
join pagos p on p.id_reserva = r.id
group by u.curp, u.nombres;

select u.curp as ususario,u.rol as rol, count(r.id) as reservas, count(c.id) as 'casas en venta'
from usuarios u
left join reservas r on r.id_comprador = u.curp
left join casas c on c.id_propietario = u.curp
where u.rol = 'ambos'
group by u.curp;

select r.municipio, avg(c.cupo) as 'cupo promedio'
from regiones r 
join casas c on c.id_region = r.codigo_postal
group by r.municipio;





