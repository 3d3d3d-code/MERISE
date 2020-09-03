DROP DATABASE IF EXISTS video_club;
CREATE DATABASE video_club;
USE video_club;
CREATE TABLE `Types`
(
	type_id INT(10) AUTO_INCREMENT PRIMARY KEY,
	
    type_name VARCHAR(50) NOT NULL,
    type_public VARCHAR(50) NOT NULL
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;
CREATE TABLE Movies(
    movie_director VARCHAR(100) NOT NULL,
    PRIMARY KEY(movie_title, movie_director),
    movie_duration SMALLINT(3) NOT NULL
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;


CREATE TABLE Actors
(
	actor_name VARCHAR(50) NOT NULL,
	actor_firstname VARCHAR(50) NOT NULL,
    actor_birth DATE,
    actor_birth DATE,
	actor_sex VARCHAR(20),
    PRIMARY KEY(actor_name, actor_firstname, actor_birth)
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE Tape
(
	tape_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tape_registration DATETIME NOT NULL,
    tape_state VARCHAR(50) NOT NULL
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE Addresses
(
	address_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address_zipcode CHAR(5) NOT NULL, 
    address_city VARCHAR(50) NOT NULL,
    address_number VARCHAR(10),
    address_street_name VARCHAR(100) NOT NULL
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE Clients
(
	client_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(50) NOT NULL,
    client_firstname VARCHAR(50) NOT NULL,
    client_enrollment DATETIME NOT NULL, 
    client_deposit TINYINT(3)
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE Shops
(
	shop_name VARCHAR(50) NOT NULL,
    address_id INT(10) NOT NULL,
    CONSTRAINT fk_address_id FOREIGN KEY (address_id) REFERENCES Addresses(address_id),
    CONSTRAINT pk_shop_id PRIMARY KEY (shop_name, address_id)
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE Visit
(
	client_id INT(10) NOT NULL,
    shop_id VARCHAR(50) NOT NULL,
	CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    CONSTRAINT fk_shop_id FOREIGN KEY (shop_id) REFERENCES Shops(pk_shop_id)
); 