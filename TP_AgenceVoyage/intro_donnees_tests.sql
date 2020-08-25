-- DQL = Langage de  Requêtes sur les données
-- SELECT

USE db_trips;


-- sélectionner tous les pays;
SELECT * FROM countries;

SELECT * FROM countries ORDER BY country_name ASC;

SELECT * FROM countries ORDER BY country_name DESC;