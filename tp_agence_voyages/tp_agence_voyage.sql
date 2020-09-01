DROP DATABASE IF EXISTS  tp_agence_voyage ;

CREATE DATABASE IF NOT EXISTS tp_agence_voyage ;
use tp_agence_voyage; 

CREATE TABLE IF NOT EXISTS sales (
    com_code CHAR(5) PRIMARY KEY NOT NULL,
    com_name VARCHAR(64) NOT NULL,
    com_password CHAR(60) NOT NULL,
    com_code_remp CHAR(5) NOT NULL
    
  
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;


        
CREATE TABLE IF NOT EXISTS clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_lastname VARCHAR(32) NOT NULL,
    client_firstname VARCHAR(32) NOT NULL,
    client_email VARCHAR(128) UNIQUE NOT NULL,
    client_phone CHAR(16) UNIQUE NOT NULL,
    client_added DATE NOT NULL,
    client_password CHAR(60) NOT NULL,
    com_code CHAR(5) NOT NULL,
   CONSTRAINT fk_codeclient FOREIGN KEY (com_code)
        REFERENCES sales (com_code)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;



CREATE TABLE IF NOT EXISTS services (
    service_code INT PRIMARY KEY NOT NULL,
    service_name VARCHAR(32) NOT NULL,
    service_description TEXT
   
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS countries (
    country_code CHAR(2),
    country_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (country_code)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS cities (
    city_code INT NOT NULL,
    city_name VARCHAR(128) NOT NULL,
    country_code CHAR(2),
    PRIMARY KEY (city_code),
    FOREIGN KEY (country_code)
        REFERENCES countries (country_code)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS trips (
    trip_code INT,
    trip_title VARCHAR(128),
    trip_available INT,
    trip_start DATETIME,
    trip_end DATETIME,
    trip_price DECIMAL(7 , 2 ),
    trip_overview TEXT,
    trip_description TEXT,
    city_code INT NOT NULL,
    PRIMARY KEY (trip_code),
    FOREIGN KEY (city_code)
        REFERENCES cities (city_code)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS orders (
    client_id INT,
    trip_code INT,
    order_quantity TINYINT NOT NULL,
    order_paid TINYINT NOT NULL,
    PRIMARY KEY (client_id , trip_code),
    FOREIGN KEY (client_id)
        REFERENCES clients (client_id),
    FOREIGN KEY (trip_code)
        REFERENCES trips (trip_code)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;




CREATE TABLE IF NOT EXISTS themes (	
    theme_code INT,
    theme_name VARCHAR(32),
    theme_description TEXT,
    PRIMARY KEY (theme_code)
)  ENGINE=INNODB CHARSET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE IF NOT EXISTS steps (
    city_code INT,
    trip_code INT,
    step_start DATETIME,
    step_end DATETIME,
    PRIMARY KEY (city_code , trip_code),
    FOREIGN KEY (city_code)
        REFERENCES cities (city_code),
    FOREIGN KEY (trip_code)
        REFERENCES trips (trip_code)
)  ENGINE=INNODB CHARSET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE IF NOT EXISTS suggest (
    trip_code INT,
    theme_code INT,
    PRIMARY KEY (trip_code , theme_code),
    FOREIGN KEY (trip_code)
        REFERENCES trips (trip_code)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS note (
    service_code INT,
    trip_code INT,
    service_score TINYINT,
    PRIMARY KEY (service_code , trip_code),
    FOREIGN KEY (service_code)
        REFERENCES services (service_code),
    FOREIGN KEY (trip_code)
        REFERENCES trips (trip_code)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;



ALTER TABLE sales ADD CONSTRAINT fk_code FOREIGN KEY (com_code_remp)
        REFERENCES sales(com_code);
