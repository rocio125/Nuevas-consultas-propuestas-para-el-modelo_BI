--1. ¿Cómo evolucionan las ventas en el tiempo?

select count (v.importe) as cantidad_de_ventas, t.año, t.mes,
	   sum (v.importe) as importe_total_vendido
from los_mejores.bi_venta v
inner join los_mejores.bi_tiempo t
	on v.tiempo_id = t.id 
group by t.año, t.mes

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

