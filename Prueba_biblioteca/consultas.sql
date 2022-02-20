--a. Mostrar todos los libros que posean menos de 300 páginas
select titulo from libros where n_pag<300;
--b. Mostrar todos los autores que hayan nacido después del 01-01-1970.
select nombre, apellido from autor where fecha_nac>1970;
--c. ¿Cuál es el libro más solicitado?
--**Ordena en orden descendente la cantidad de solicitudes de un libro, por lo tanto los primeros son los mas solicitados. (para este caso, 3 ejemplares)
select titulo, count(*) as "Solicitudes" from prestamos inner join libros
on prestamos.isbn_libro=libros.isbn
group by libros.titulo
ORDER BY "Solicitudes" DESC ;

--d. Si se cobrara una multa de $100 por cada día de atraso, mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.
select isbn_libro, nombre, apellido, (fecha_real_devol - fecha_inicio-7)*100 as "Multa por Atraso" from prestamos inner join socios on prestamos.rut_socio=socios.rut
where fecha_real_devol - fecha_inicio>7
order by nombre ASC;

