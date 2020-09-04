USE video_club;

ALTER TABLE `Movies`
ADD `type_id` INT(10) NOT NULL,
ADD CONSTRAINT FK_type_to_movie FOREIGN KEY (`type_id`) REFERENCES Types (`type_id`);

ALTER TABLE `Tapes`
ADD `movie_title` VARCHAR(50) NOT NULL,
ADD `movie_director` VARCHAR(100) NOT NULL,

ADD CONSTRAINT FK_movie_to_tape FOREIGN KEY( `movie_title`, `movie_director`) 
 REFERENCES `Movies` (`movie_title`, `movie_director`);


ALTER TABLE `Clients`
ADD `adress_id` INT(10) NOT NULL,
ADD CONSTRAINT FK_adress_to_client FOREIGN KEY (`adress_id`) REFERENCES `Adresses` (`adress_id`);





