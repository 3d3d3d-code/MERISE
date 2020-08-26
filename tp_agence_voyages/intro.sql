
-- DDL : Langage de définition des données 
-- CREATE créer une structure de données 
-- ALTER  modifier une structure de données
-- DROP   supprimer une structure de données

-- (RE)INITIALISATION DE LA BASE DE DONNEES db_trips (TP Agence de Voyages)

-- Suppression de la base de données db_trips si elle existe
DROP DATABASE IF EXISTS db_trips;

-- creation de la base de données db_trips si elle n'existe pas
CREATE DATABASE IF NOT EXISTS db_trips CHARACTER SET utf8 COLLATE utf8_general_ci; 


-- Sélection de la abse de données db_trips pour pouvoir interragir avec.
USE db_trips;

-- les instructions suivantes seront exécutées dans la base de données sélectionnée ci-dessus.



-- suppression des tables si elles existent
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;


-- creation de la table countries si elle n'existe pas
CREATE TABLE IF NOT EXISTS countries
(
	country_code CHAR(2) PRIMARY KEY, 
    country_name VARCHAR(128) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- creation de la table cities
CREATE TABLE cities 
(
	city_code INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(128) NOT NULL,
    country_code CHAR(2) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;;


