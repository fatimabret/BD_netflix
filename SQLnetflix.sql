/*Alumnos Grupo N°1:
Barrios, Enzo Tomas
Bongiovanni, Iara Aylen
Bret, Fatima Maria Luz
Gonzalez, Ariel Rafael
*/

create database netflix;
use netflix;
select * from netflix_titles order by show_id asc;

UPDATE netflix_titles SET show_id = REPLACE(show_id,'s',' ') WHERE show_id LIKE 's%';
ALTER TABLE netflix_titles ALTER COLUMN show_id INT NOT NULL

--Definición de datos
--Tabla actor
CREATE TABLE Actor(
  id_actor INT identity(1,1),
  nomyape VARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_actor PRIMARY KEY (id_actor)
);

--Tabla type
CREATE TABLE Type(
  id_type INT identity(1,1),
  descripcion VARCHAR(50) NOT NULL,
  CONSTRAINT PK_id_type PRIMARY KEY (id_type)
);

--Tabla contenido
CREATE TABLE Contenido(
  id_contenido INT identity(1,1),
  id_type int NOT NULL,
  rating VARCHAR(50) NOT NULL,
  date_added DATE NOT NULL,
  CONSTRAINT PK_id_contenido PRIMARY KEY (id_contenido),
  CONSTRAINT FK_id_type FOREIGN KEY (id_type) REFERENCES type(id_type)
);

--Tabla country
CREATE TABLE Country(
  id_country INT identity(1,1),
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_country PRIMARY KEY (id_country)
);

--Tabla director
CREATE TABLE Director(
  id_director INT identity(1,1),
  nomyape VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_director)
);

--Tabla show
CREATE TABLE Show(
  id_show INT NOT NULL,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  duration VARCHAR(50) NOT NULL,
  release_year INT NOT NULL,
  id_contenido INT NOT NULL,
  id_country INT NOT NULL,
  CONSTRAINT PK_id_show PRIMARY KEY (id_show),
  CONSTRAINT FK_id_contenido_show FOREIGN KEY (id_contenido) REFERENCES Contenido(id_contenido),
  CONSTRAINT FK_id_country_show FOREIGN KEY (id_country) REFERENCES Country(id_country)
);

--Tabla director_show
CREATE TABLE Director_show(
  id_show INT identity(1,1),
  id_director INT NOT NULL,
  CONSTRAINT PK_id_show_id_director PRIMARY KEY (id_show, id_director),
  CONSTRAINT FK_id_show_director_show FOREIGN KEY (id_show) REFERENCES Show(id_show),
  CONSTRAINT FK_id_director_director_show FOREIGN KEY (id_director) REFERENCES Director(id_director)
);

--Tabla elenco
CREATE TABLE Elenco(
  id_show INT identity(1,1),
  id_actor INT NOT NULL,
  CONSTRAINT PK_id_show_id_actor_elenco PRIMARY KEY (id_show, id_actor),
  CONSTRAINT FK_id_show_elenco FOREIGN KEY (id_show) REFERENCES Show(id_show),
  CONSTRAINT FK_id_actor_elenco FOREIGN KEY (id_actor) REFERENCES Actor(id_actor)
);

--Tabla genero
CREATE TABLE Genero(
  id_genero INT identity(1,1),
  descripcion VARCHAR(50) NOT NULL,
  id_show INT NOT NULL,
  CONSTRAINT PK_id_genero PRIMARY KEY (id_genero),
  CONSTRAINT FK_id_show_genero FOREIGN KEY (id_show) REFERENCES Show(id_show)
);


--Carga de datos
insert into country(nombre)
values ((select country from netflix_titles WHERE show_id = 2));

select distinct director from netflix_titles order by director ASC

--ingreso lote de director
INSERT INTO director (nomyape)
SELECT DISTINCT TRIM(value)  
FROM dbo.netflix_titles
CROSS APPLY STRING_SPLIT(netflix_titles.director, ',');

select distinct nomyape from director
select * from Director order by nomyape asc


--ingreso lote de actor
INSERT INTO actor (nomyape)
SELECT DISTINCT TRIM(value)  
FROM dbo.netflix_titles
CROSS APPLY STRING_SPLIT(netflix_titles.cast, ',');

select distinct nomyape from actor order by nomyape asc
select * from actor order by nomyape asc


--ingreso lote de genero
INSERT INTO Genero(descripcion)
SELECT DISTINCT TRIM(value)  
FROM dbo.netflix_titles
CROSS APPLY STRING_SPLIT(netflix_titles.listed_in, ',');

select distinct descripcion from genero order by descripcion asc
select * from genero order by descripcion asc


--ingreso lote de type
INSERT INTO Type(descripcion)
SELECT DISTINCT TRIM(value)  
FROM dbo.netflix_titles
CROSS APPLY STRING_SPLIT(netflix_titles.type, ',');

select distinct descripcion from type order by descripcion asc
select * from type order by descripcion asc


--ingreso lote de country
INSERT INTO Country(nombre)
SELECT DISTINCT TRIM(value)  
FROM dbo.netflix_titles
CROSS APPLY STRING_SPLIT(netflix_titles.country, ',');

select distinct nombre from Country order by nombre asc
select * from Country order by nombre asc

