create database netflix;

use netflix;

select * from netflix_titles order by show_id asc;

UPDATE netflix_titles SET show_id = REPLACE(show_id,'s',' ') WHERE show_id LIKE 's%';

ALTER TABLE netflix_titles ALTER COLUMN show_id INT NOT NULL

