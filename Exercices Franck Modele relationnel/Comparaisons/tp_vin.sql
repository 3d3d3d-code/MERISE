DROP   DATABASE VIN ;
CREATE DATABASE IF NOT EXISTS vin;
USE vin ;

CREATE TABLE vigneron(
   num_vign INT,
   nom_vign VARCHAR(50),
   prenom_vign VARCHAR(50),
   ville_vign VARCHAR(50),
   PRIMARY KEY(num_vign)
);

CREATE TABLE buveur(
   num_buv INT,
   nom_buv VARCHAR(50),
   prenom_buv VARCHAR(50),
   ville_buv VARCHAR(50),
   PRIMARY KEY(num_buv)
);

CREATE TABLE vin(
   num_vin INT,
   cru VARCHAR(50),
   millesime VARCHAR(50),
   num_vign INT NOT NULL,
   PRIMARY KEY(num_vin),
   FOREIGN KEY(num_vign) REFERENCES vigneron(num_vign)
);

CREATE TABLE commande(
   num_com INT,
   date_com DATE NOT NULL,
   num_buv INT NOT NULL,
   PRIMARY KEY(num_com),
   FOREIGN KEY(num_buv) REFERENCES buveur(num_buv)
);

CREATE TABLE apprecier(
   num_vign INT,
   num_vign_1 INT,
   note INT,
   PRIMARY KEY(num_vign, num_vign_1),
   FOREIGN KEY(num_vign) REFERENCES vigneron(num_vign),
   FOREIGN KEY(num_vign_1) REFERENCES vigneron(num_vign)
);

CREATE TABLE acheter(
   num_vin INT,
   num_com INT,
   quantite INT,
   PRIMARY KEY(num_vin, num_com),
   FOREIGN KEY(num_vin) REFERENCES vin(num_vin),
   FOREIGN KEY(num_com) REFERENCES commande(num_com)
);
