DROP DATABASE IF EXISTS video_club;
CREATE DATABASE video_club;
USE video_club;

CREATE TABLE `Types`
(
	`type_id` INT(10) AUTO_INCREMENT ,
	`type_name` VARCHAR(50) NOT NULL,
    `type_public` VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Type PRIMARY KEY(type_id)
)ENGINE = InnoDB CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE `Movies`
(
    `movie_title` VARCHAR(50) NOT NULL,
    `movie_director` VARCHAR(100) NOT NULL,
    `movie_duration` SMALLINT(3) NOT NULL,
   CONSTRAINT pk_movies PRIMARY KEY(movie_title, movie_director) 
)
 ENGINE = InnoDB
 CHARSET utf8
 COLLATE utf8_general_ci;


CREATE TABLE `Actors` (
    `actor_name` VARCHAR(50) NOT NULL,
   `actor_firstname` VARCHAR(50) NOT NULL,
    `actor_birth` DATE,
   `actor_sex` VARCHAR(20),
    PRIMARY KEY (actor_name , actor_firstname , actor_birth)
)
 ENGINE = InnoDB
 CHARSET utf8 
 COLLATE utf8_general_ci;

CREATE TABLE `Tapes`
(
	`tape_id` INT(10) NOT NULL AUTO_INCREMENT,
    `tape_registration` DATETIME NOT NULL,
    `tape_state` VARCHAR(50) NOT NULL,
    CONSTRAINT pk_tapes PRIMARY KEY (`tape_id`)
)
ENGINE = InnoDB 
CHARSET utf8 
COLLATE utf8_general_ci;

CREATE TABLE Addresses
(
	`address_id` INT(10) NOT NULL AUTO_INCREMENT,
    `address_zipcode` CHAR(5) NOT NULL, 
    `address_city` VARCHAR(50) NOT NULL,
    `address_number` VARCHAR(10),
    `address_street_name` VARCHAR(100) NOT NULL,
    CONSTRAINT  pk_adresses PRIMARY KEY (address_id)
)
ENGINE = InnoDB 
CHARSET utf8 
COLLATE utf8_general_ci;

CREATE TABLE `Clients`
(
	`client_id` INT(10) NOT NULL AUTO_INCREMENT ,
    `client_name` VARCHAR(50) NOT NULL,
`client_firstname` VARCHAR(50) NOT NULL,
    `client_enrollment` DATETIME NOT NULL, 
    `client_deposit`  TINYINT(3),
    CONSTRAINT pk_clients PRIMARY KEY(client_id)
)
 ENGINE = InnoDB
 CHARSET utf8 
 COLLATE utf8_general_ci;

CREATE TABLE`Shops`
(
	`shop_name` VARCHAR(50)  NOT NULL,
    `address_id` INT(10) NOT NULL,
    CONSTRAINT pk_address_to_shop FOREIGN KEY (address_id) REFERENCES Addresses(address_id),
CONSTRAINT pk_shops PRIMARY KEY (`shop_name`,`address_id`) 
   
)
 ENGINE = InnoDB
 CHARSET utf8 
 COLLATE utf8_general_ci;

CREATE TABLE `Visit` (
    `client_id` INT(10) NOT NULL,
    `shop_name` VARCHAR(50) NOT NULL,
    `address_id` INT(10) NOT NULL,-- 
    CONSTRAINT FK_client_to_visit FOREIGN KEY (`client_id`)
        REFERENCES Clients (`client_id`),
    CONSTRAINT FK_shop_to_visit FOREIGN KEY (`shop_name` , `address_id`)
        REFERENCES Shops (`shop_name` , `address_id`),
    CONSTRAINT PK_visit PRIMARY KEY (`client_id` , `shop_name` , `address_id`)
) 
 ENGINE = InnoDB 
 CHARSET utf8 
 COLLATE utf8_general_ci;
 
 CREATE table `Contain`(
 `tape_id` INT(10) NOT NULL,
 `shop_name` VARCHAR(50) NOT NULL,
 `address_id` INT (10) NOT NULL,
 CONSTRAINT FK_tape_to_contain FOREIGN KEY (`tape_id`)REFERENCES Tapes(`tape_id`),
 CONSTRAINT FK_shop_to_contain FOREIGN KEY(`shop_name`,`address_id`) REFERENCES Shops(`shop_name`,`address_id`),
 CONSTRAINT PK_contain PRIMARY KEY(`tape_id`,`shop_name`,`address_id`)
 )
  ENGINE = InnoDB 
 CHARSET utf8 
 COLLATE utf8_general_ci;
 
 CREATE TABLE `Play`
 (
 `actor_name`VARCHAR(50) NOT NULL,
 `actor_firstname`VARCHAR(50) NOT NULL,
 `actor_birth`DATE,
 `movie_title`VARCHAR(50)NOT NULL,
 `movie_director`VARCHAR(100) NOT NULL,
 
 CONSTRAINT FK_actor_to_play FOREIGN KEY ( `actor_name`,`actor_firstname`, `actor_birth`) REFERENCES `Actors` ( `actor_name`,`actor_firstname`, `actor_birth`),
CONSTRAINT FK_movie_to_play FOREIGN KEY  (`movie_title`, `movie_director`) REFERENCES `Movies` (`movie_title`, `movie_director`),
CONSTRAINT PK_play PRIMARY KEY (`actor_name`,`actor_firstname`, `actor_birth`, `movie_title`, `movie_director`) 
)
ENGINE = InnoDB 
 CHARSET utf8 
 COLLATE utf8_general_ci;
 
 CREATE TABLE `Borrow`(
 `client_id` INT(10) NOT NULL,
 `tape_id` INT(10) NOT NULL,
 `borrow_start` DATETIME NOT NULL,
 `borrow_end` DATETIME,
 
 CONSTRAINT  FK_client_to_borrow FOREIGN KEY (`client_id`) REFERENCES `Clients`(client_id),     
 CONSTRAINT FK_tape_to_borrow FOREIGN KEY (`tape_id`) REFERENCES `Tapes`(`tape_id`),
 CONSTRAINT PK_borrow PRIMARY KEY (`client_id`,`tape_id`)
 
)
ENGINE = InnoDB 
 CHARSET utf8 
 COLLATE utf8_general_ci;
 
 describe borrow;
 
 
