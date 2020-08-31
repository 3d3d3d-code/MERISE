CREATE DATABASE tp_commerce;
USE tp_commerce;


CREATE TABLE rayon(
   nomR VARCHAR(50),
   etage INT,
   PRIMARY KEY(nomR)
);

CREATE TABLE artticle(
   codeA INT,
   nomA VARCHAR(50) NOT NULL,
   typeA VARCHAR(50) NOT NULL,
   PRIMARY KEY(codeA)
);

CREATE TABLE fournisseur(
   codeF INT,
   adresseF VARCHAR(50) NOT NULL,
   nomF VARCHAR(50),
   PRIMARY KEY(codeF)
);

CREATE TABLE employe(
   codeE INT,
   nom_E VARCHAR(50) NOT NULL,
   salaire_E DECIMAL(6,2) NOT NULL,
   nomR VARCHAR(50),
   codeE_chef INT,
   PRIMARY KEY(codeE),
   FOREIGN KEY(nomR) REFERENCES rayon(nomR),
   FOREIGN KEY(codeE_chef) REFERENCES employe(codeE)
);

CREATE TABLE vente(
   nomR VARCHAR(50),
   codeA INT,
   PRIMARY KEY(nomR, codeA),
   FOREIGN KEY(nomR) REFERENCES rayon(nomR),
   FOREIGN KEY(codeA) REFERENCES artticle(codeA)
);

CREATE TABLE livraison(
   codeA INT,
   codeF INT,
   quantite INT,
   PRIMARY KEY(codeA, codeF),
   FOREIGN KEY(codeA) REFERENCES artticle(codeA),
   FOREIGN KEY(codeF) REFERENCES fournisseur(codeF)
);
