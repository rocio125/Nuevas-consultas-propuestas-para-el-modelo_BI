--1. ¿Cómo evolucionan las ventas en el tiempo?

select count (v.importe) as cantidad_de_ventas, t.año, t.mes,
	   sum (v.importe) as importe_total_vendido
from los_mejores.bi_venta v
inner join los_mejores.bi_tiempo t
	on v.tiempo_id = t.id 
group by t.año, t.mes
order by t.año
	
--2.¿Qué rubros generan mayor volumen de ventas?

select r.id as rubro, sum (v.cantidad_vendida) as cantidad_vendida, sum (v.importe) importe_vendido
from los_mejores.bi_venta v
inner join los_mejores.bi_producto p
	on v.producto_id = p.id
inner join los_mejores.bi_rubro r
	on p.bi_rubro_id = r.id 
group by r.id 

--3.¿Qué provincias concentran mayor cantidad de ventas e importe vendido?

select u.provincia as provincia, sum (v.cantidad_vendida) as cantidad_vendida, sum (v.importe) as importe_vendido
from los_mejores.bi_venta v 
inner join los_mejores.bi_ubicacion u
	on v.ubicacion_id = u.id 
group by u.provincia

--4. ¿Qué medios de pago se utilizan más?
	--¿Qué porcentaje o cantidad de operaciones corresponde a cada medio de pago?

select mp.descripcion as Medio_Pago, count (p.id) as Cantidad_de_operaciones, sum (p.importe) as importe_total
from los_mejores.bi_pago p 
inner join los_mejores.bi_medio_pago mp
	on p.medio_pago_id = mp.id 
group by mp.descripcion

/* 5. ¿Qué pasa con los envíos?

costo promedio de envío
costo total de envío
cantidad de envíos
cumplimiento*/
	
select avg(e.costo_envio) as promedio_envio, sum (e.costo_envio) as total_envios, count (e.costo_envio) as cantidad_envios , e.cumplimiento
from los_mejores.bi_envio e
group by e.cumplimiento

/*6. ¿Cómo se distribuyen las ventas según la edad del cliente?
¿Qué rango etario concentra más ventas?*/

select v.cantidad_vendida as ventas, r_e.descripcion as edad_del_cliente
from los_mejores.bi_venta v
inner join los_mejores.bi_rango_etario r_e
	on v.rango_etario_id = r_e.id 
group by r_e.descripcion, v.cantidad_vendida

--7. ¿En qué horarios se producen más ventas?
	--¿Qué rango horario concentra más ventas?

select count (v.cantidad_vendida) as ventas, r_h.descripcion as Horario
from los_mejores.bi_venta v
inner join los_mejores.bi_rango_horario r_h 
	on v.rango_horario_id = r_h.id 
group by r_h.descripcion;
