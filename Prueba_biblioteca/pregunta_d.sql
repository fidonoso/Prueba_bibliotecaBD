--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.

select isbn_libro, nombre, apellido, (fecha_real_devol - fecha_inicio-7)*100 as "Multa por Atraso" from prestamos inner join socios on prestamos.rut_socio=socios.rut
where fecha_real_devol - fecha_inicio>7
order by nombre ASC;


