CREATE DATABASE agence_voyage ;
USE agence_voyage ;


CREATE TABLE sales(
   com_code CHAR(5),
   com_name VARCHAR(64) NOT NULL,
   com_password CHAR(60) NOT NULL,
   com_code_1 CHAR(5),
   PRIMARY KEY(com_code),
   FOREIGN KEY(com_code_1) REFERENCES sales(com_code)
);

CREATE TABLE countries(
   country_code CHAR(2),
   country_name VARCHAR(128) NOT NULL,
   PRIMARY KEY(country_code)
);

CREATE TABLE cities(
   city_code INT,
   city_name VARCHAR(128) NOT NULL,
   country_code CHAR(2) NOT NULL,
   PRIMARY KEY(city_code),
   FOREIGN KEY(country_code) REFERENCES countries(country_code)
);

CREATE TABLE trips(
   trip_code INT,
   trip_title VARCHAR(128) NOT NULL,
   trip_available INT NOT NULL,
   trip_start DATETIME NOT NULL,
   trip_end DATETIME NOT NULL,
   trip_price DECIMAL(7,2) NOT NULL,
   trip_overview TEXT NOT NULL,
   trip_description TEXT,
   city_code INT NOT NULL,
   PRIMARY KEY(trip_code),
   FOREIGN KEY(city_code) REFERENCES cities(city_code)
);

CREATE TABLE themes(
   theme_code INT,
   theme_name VARCHAR(32) NOT NULL,
   theme_description TEXT,
   PRIMARY KEY(theme_code)
);

CREATE TABLE services(
   service_code INT,
   service_name VARCHAR(32) NOT NULL,
   service_description TEXT,
   PRIMARY KEY(service_code)
);

CREATE TABLE clients(
   client_id INT,
   client_lastname VARCHAR(32) NOT NULL,
   client_firstname VARCHAR(32) NOT NULL,
   client_email VARCHAR(128) NOT NULL,
   client_phone CHAR(16) NOT NULL,
   client_added DATE NOT NULL,
   client_password CHAR(60) NOT NULL,
   com_code CHAR(5) NOT NULL,
   PRIMARY KEY(client_id),
   UNIQUE(client_email),
   UNIQUE(client_phone),
   FOREIGN KEY(com_code) REFERENCES sales(com_code)
);

CREATE TABLE orders(
   client_id INT,
   trip_code INT,
   order_quantity TINYINT NOT NULL,
   order_paid TINYINT NOT NULL,
   PRIMARY KEY(client_id, trip_code),
   FOREIGN KEY(client_id) REFERENCES clients(client_id),
   FOREIGN KEY(trip_code) REFERENCES trips(trip_code)
);

CREATE TABLE steps(
   city_code INT,
   trip_code INT,
   step_start DATETIME NOT NULL,
   step_end DATETIME NOT NULL,
   PRIMARY KEY(city_code, trip_code),
   FOREIGN KEY(city_code) REFERENCES cities(city_code),
   FOREIGN KEY(trip_code) REFERENCES trips(trip_code)
);

CREATE TABLE note(
   client_id INT,
   trip_code INT,
   service_code INT,
   service_score TINYINT NOT NULL,
   PRIMARY KEY(client_id, trip_code, service_code),
   FOREIGN KEY(client_id) REFERENCES clients(client_id),
   FOREIGN KEY(trip_code) REFERENCES trips(trip_code),
   FOREIGN KEY(service_code) REFERENCES services(service_code)
);

CREATE TABLE suggest(
   trip_code INT,
   theme_code INT,
   PRIMARY KEY(trip_code, theme_code),
   FOREIGN KEY(trip_code) REFERENCES trips(trip_code),
   FOREIGN KEY(theme_code) REFERENCES themes(theme_code)
);
