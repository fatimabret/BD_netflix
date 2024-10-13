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
  id_actor INT NOT NULL,
  nomyape VARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_actor PRIMARY KEY (id_actor)
);

--Tabla contenido
CREATE TABLE Contenido(
  id_contenido INT NOT NULL,
  type VARCHAR(50) NOT NULL,
  rating VARCHAR(50) NOT NULL,
  date_added DATE NOT NULL,
  CONSTRAINT PK_id_contenido PRIMARY KEY (id_contenido)
);

--Tabla country
CREATE TABLE Country(
  id_country INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_id_country PRIMARY KEY (id_country)
);

--Tabla director
CREATE TABLE Director(
  id_director INT NOT NULL,
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
  id_show INT NOT NULL,
  id_director INT NOT NULL,
  CONSTRAINT PK_id_show_id_director PRIMARY KEY (id_show, id_director),
  CONSTRAINT FK_id_show_director_show FOREIGN KEY (id_show) REFERENCES Show(id_show),
  CONSTRAINT FK_id_director_director_show FOREIGN KEY (id_director) REFERENCES Director(id_director)
);

--Tabla elenco
CREATE TABLE Elenco(
  id_show INT NOT NULL,
  id_actor INT NOT NULL,
  CONSTRAINT PK_id_show_id_actor_elenco PRIMARY KEY (id_show, id_actor),
  CONSTRAINT FK_id_show_elenco FOREIGN KEY (id_show) REFERENCES Show(id_show),
  CONSTRAINT FK_id_actor_elenco FOREIGN KEY (id_actor) REFERENCES Actor(id_actor)
);

--Tabla genero
CREATE TABLE Genero(
  id_genero INT NOT NULL,
  descripcion VARCHAR(50) NOT NULL,
  id_show INT NOT NULL,
  CONSTRAINT PK_id_genero PRIMARY KEY (id_genero),
  CONSTRAINT FK_id_show_genero FOREIGN KEY (id_show) REFERENCES Show(id_show)
);

--Carga de datos
