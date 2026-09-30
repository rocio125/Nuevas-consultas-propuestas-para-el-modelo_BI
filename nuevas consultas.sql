--1. ¿Cómo evolucionan las ventas en el tiempo?

select count (v.importe) as cantidad_de_ventas, t.año, t.mes,
	   sum (v.importe) as importe_total_vendido
from los_mejores.bi_venta v
inner join los_mejores.bi_tiempo t
	on v.tiempo_id = t.id 
group by t.año, t.mes