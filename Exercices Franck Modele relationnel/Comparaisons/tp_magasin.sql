DROP DATABASE IF EXISTS magasin ;
CREATE DATABASE  IF NOT EXISTS magasin ;
USE magasin ;
CREATE TABLE Magasin(
   code_magasin INT,
   nom_magasin VARCHAR(50),
   PRIMARY KEY(code_magasin)
);

CREATE TABLE rayon(
   nom_rayon VARCHAR(50),
   PRIMARY KEY(nom_rayon)
);

CREATE TABLE article(
   code_ARTICLE INT,
   NOM_ARTICLE VARCHAR(50),
   type_article VARCHAR(50),
   PRIMARY KEY(code_ARTICLE)
);

CREATE TABLE vente(
   code_magasin INT,
   nom_rayon VARCHAR(50),
   code_ARTICLE INT,
   quantite VARCHAR(50),
   date_commande DATE NOT NULL,
   PRIMARY KEY(code_magasin, nom_rayon, code_ARTICLE),
   FOREIGN KEY(code_magasin) REFERENCES Magasin(code_magasin),
   FOREIGN KEY(nom_rayon) REFERENCES rayon(nom_rayon),
   FOREIGN KEY(code_ARTICLE) REFERENCES article(code_ARTICLE)
);
