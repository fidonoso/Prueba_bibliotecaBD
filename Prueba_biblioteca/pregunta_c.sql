--c. ¿Cuál es el libro más solicitado?

select titulo, count(*) as "Solicitudes" from prestamos inner join libros
on prestamos.isbn_libro=libros.isbn
group by libros.titulo
ORDER BY "Solicitudes" DESC ;