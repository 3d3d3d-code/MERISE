-- DML : Manipulation des données
-- INSERT
-- UPDATE
-- DELETE

-- INSERTION DU JEU D'ESSAI DANS LA BASE DE DONNEES db_trips
-- Jeu d'essai = données factices pour tester le système

USE db_trips;

-- Vidage et réinitialisation des tables
TRUNCATE TABLE cities;
TRUNCATE TABLE countries;

-- ajout d'une ligne dans la table countries
INSERT INTO countries 
(country_name, country_code)
VALUES
('France', 'FR');

-- ajout de 3 lignes dans la table countries
INSERT INTO countries 
(country_code, country_name)
VALUES
('BE', 'Belgique'),
('DE', 'Allemagne'),
('IT', 'Italie');


-- Ajout de 5 villes
-- Dans la table cities, la clé primaire est "auto incrémentée"
-- C'est le SGBD qui génère l'identifiant à chaque ajout de données.
-- une valeur auto incrémentée ne doit pas être précisée à l'insertion
-- remarquez l'absence de la colonne "city_code" dans la requête suivante.
--
--
INSERT INTO cities 
(city_name, country_code)
VALUES
('Bruxelles', 'BE'),
('Liège', 'BE'),
('Cologne', 'DE'),
('Mulhouse', 'FR'),
('Agen', 'FR');




