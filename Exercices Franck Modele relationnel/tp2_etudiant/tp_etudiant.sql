DROP DATABASE IF EXISTS etudiants;
CREATE DATABASE etudiants;
USE etudiant;
CREATE TABLE IF NOT EXISTS Etudiant(
   id_etudiant INT AUTO_INCREMENT,
   nom_etudiant VARCHAR(50),
   prenom_etudiant VARCHAR(50),
   date_entree DATE NOT NULL,
   PRIMARY KEY(id_etudiant)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS Matiere(
   id_matiere INT,
   lib_matiere VARCHAR(50),
   coefficient DECIMAL(3,1) NOT NULL,
   PRIMARY KEY(id_matiere)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS Controle(
   id_etudiant INT,
   id_matiere INT,
   PRIMARY KEY(id_etudiant, id_matiere),
   FOREIGN KEY(id_etudiant) REFERENCES Etudiant(id_etudiant),
   FOREIGN KEY(id_matiere) REFERENCES Matiere(id_matiere)
)engine=InnoDb CHARSET utf8 COLLATE utf8_general_ci;

INSERT INTO Etudiant(id_etudiant,nom_etudiant,prenom_etudiant,date_entree) VALUES('Dupont','Charles','2025-10-21'),('Favier','Isabelle','2020-09-18');

INSERT INTO matiere() VALUE('1','Sociologie','10,5');