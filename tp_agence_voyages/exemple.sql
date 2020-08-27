-- DML : Manipulation des donnees
-- INSERT
-- UPDATE
-- DELETE


USE tp_trips;
-- VIDER UNE TABLE 
TRUNCATE TABLE countries;


CREATE TABLE IF NOT EXISTS countries
(
country_code CHAR (2) PRIMARY KEY,
country_name VARCHAR(128) NOT NULL 
VALUES
('France' ,'FR');


)
INSERT INTO countries

(countriy_name ,country_code)


