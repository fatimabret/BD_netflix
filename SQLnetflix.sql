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

--Tabla contenido
CREATE TABLE Contenido(
  id_contenido INT identity(1,1),
  type VARCHAR(50) NOT NULL,
  rating VARCHAR(50) NOT NULL,
  date_added DATE NOT NULL,
  CONSTRAINT PK_id_contenido PRIMARY KEY (id_contenido)
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
select * from country
INSERT INTO Country (nombre)
VALUES ('India'),
	('United Kingdom'),
	('France');

INSERT INTO Director (nomyape)
VALUES ('Kirsten Johnson'),
		('Julien Leclercq'),
		('Mike Flanagan'),
		('Robert Cullen, José Luis Ucha'),
		('Haile Gerima');
select * from Director

INSERT INTO Contenido (type, rating, date_added)
VALUES ('Movie', 'PG-13', '2021-09-25'),
		('TV Show', 'TV-MA', '2021-09-24'),
		('Movie', 'PG', '2021-09-24'),
		('Movie', 'TV-MA', '2021-09-24'),
		('TV Show', 'TV-14', '2021-09-24');
select * from Contenido

INSERT INTO Actor (nomyape)
VALUES ('Ama Qamata'),
		('Khosi Ngema'),
		('Gail Mabalane'),
		('Thabang Molaba'),
		('Dillon Windvogel'),
		('Sami Bouajila'),
		('Tracy Gotoas'),
		('Samuel Jouy'),
		('Nabiha Akkari'),
		('Sofiane Zermani');
select * from Actor

