--Creacion y coneccion a la base de datos llamada 'biblioteca'
CREATE DATABSE biblioteca;
\c biblioteca;
--creacion de las tablas
CREATE TABLE socios(
rut varchar(10) PRIMARY KEY,
nombre varchar(30),
apellido varchar(30),
direccion varchar(100),
telefono varchar(14)
);
CREATE TABLE libros(
ISBN varchar(15) PRIMARY KEY,
titulo varchar(50),
n_pag integer
);
CREATE TABLE autor(
cod_autor SERIAL PRIMARY KEY,
nombre varchar(30),
apellido varchar(30),
fecha_nac integer,
fecha_muerte integer
);
CREATE TABLE tipo_autor(
id SERIAL PRIMARY KEY,
nombre varchar(50),
descripcion text
);
CREATE TABLE autores(
id SERIAL PRIMARY KEY,
cod_autor_id INT,
tipo_autor_id INT,
ISBN_id varchar(15),
FOREIGN KEY (cod_Autor_id) REFERENCES autor (cod_autor),
FOREIGN KEY (tipo_autor_id) REFERENCES tipo_autor(id),
FOREIGN KEY (ISBN_id) REFERENCES libros (ISBN)
);
CREATE TABLE prestamos(
id SERIAL PRIMARY KEY,
ISBN_libro varchar(15),
fecha_inicio date,
fecha_real_devol date,
rut_socio varchar(10),
FOREIGN KEY (ISBN_libro) REFERENCES libros (ISBN),
FOREIGN KEY (rut_socio) REFERENCES socios (rut)
);
--poblado tabla lobros
INSERT INTO libros (isbn, titulo, n_pag) VALUES('111-1111111-111', 'Cuentos de terror', 344);
INSERT INTO libros (isbn, titulo, n_pag) VALUES ('222-2222222-222', 'Poesías contemporáneas', 167);
INSERT INTO libros (isbn, titulo, n_pag) VALUES ('333-3333333-333', 'Historia de Asia', 511);
INSERT INTO libros (isbn, titulo, n_pag) VALUES ('444-4444444-444', 'Manual de mecánica', 298);
--poblado de la tabla 'autor'
INSERT INTO autor (cod_autor, nombre, apellido, fecha_nac) VALUES (1, 'Andres', 'Ulloa', 1982);
INSERT INTO autor (cod_autor, nombre, apellido, fecha_nac, fecha_muerte) VALUES (2, 'Sergio', 'Mardones', 1950, 2012);
INSERT INTO autor (cod_autor, nombre, apellido, fecha_nac, fecha_muerte) VALUES (3, 'Jose', 'Salgado', 1968, 2020);
INSERT INTO autor (cod_autor, nombre, apellido, fecha_nac) VALUES (4, 'Ana', 'Salgado', 1972);
INSERT INTO autor (cod_autor, nombre, apellido, fecha_nac) VALUES (5, 'Martin', 'Porta', 1976);
--poblado e la tabla 'tipo_autor'
INSERT INTO tipo_autor (id, nombre, descripcion) VALUES (1, 'Principal', 'Autor principal de la obra');
INSERT INTO tipo_autor (id, nombre, descripcion) VALUES (2, 'Coautor', 'Coautor o colabordor de la obra');
--poblado tabla 'autores'
INSERT INTO autores (id, cod_autor_id, tipo_autor_id, isbn_id) VALUES (10, 3, 1, '111-1111111-111');
INSERT INTO autores (id, cod_autor_id, tipo_autor_id, isbn_id) VALUES (11, 4, 2, '111-1111111-111');
INSERT INTO autores (id, cod_autor_id, tipo_autor_id, isbn_id) VALUES (12, 1, 1, '222-2222222-222');
INSERT INTO autores (id, cod_autor_id, tipo_autor_id, isbn_id) VALUES (13, 2, 1, '333-3333333-333');
INSERT INTO autores (id, cod_autor_id, tipo_autor_id, isbn_id) VALUES (14, 5, 1, '444-4444444-444');
--Poblado tabla 'socios' 
INSERT INTO socios (rut, nombre, apellido, direccion, telefono) VALUES ('1111111-1', 'Juan', 'Soto', 'AVENIDA 1, SANTIAGO', '911111111');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono) VALUES ('2222222-2', 'Ana', 'Pérez', 'PASAJE 2, SANTIAGO', '922222222');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono) VALUES ('3333333-3', 'Sandra', 'Aguilar', 'AVENIDA 2, SANTIAGO', '933333333');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono) VALUES ('4444444-4', 'Esteban', 'Jerez', 'AVENIDA 3, SANTIAGO', '944444444');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono) VALUES ('5555555-5', 'Silvana', 'Muñoz', 'PASAJE 3, SANTIAGO', '955555555');
--Poblado tabla 'prestamos' (basado en el historial)
INSERT INTO prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) VALUES (1, '111-1111111-111', '20-01-2020', '27-01-2020', '1111111-1');
INSERT INTO prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) VALUES (2, '222-2222222-222', '20-01-2020', '30-01-2020', '5555555-5');
INSERT INTO prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) VALUES (3, '333-3333333-333', '22-01-2020', '30-01-2020', '3333333-3');
INSERT INTO prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) VALUES (4, '444-4444444-444', '23-01-2020', '30-01-2020', '4444444-4');
INSERT INTO prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) VALUES (5, '111-1111111-111', '27-01-2020', '04-02-2020', '2222222-2');
INSERT INTO prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) VALUES (6, '444-4444444-444', '31-01-2020', '12-02-2020', '1111111-1');
INSERT INTO prestamos (id, isbn_libro, fecha_inicio, fecha_real_devol, rut_socio) VALUES (7, '222-2222222-222', '31-01-2020', '12-02-2020', '3333333-3');
