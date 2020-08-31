CREATE DATABASE etudiant;
USE etudiant;
CREATE TABLE Etudiant(
   id_etudiant INT,
   nom_etudiant VARCHAR(50),
   prenom_etudiant VARCHAR(50),
   date_entree DATE NOT NULL,
   PRIMARY KEY(id_etudiant)
);

CREATE TABLE Matiere(
   id_matiere INT,
   lib_matiere VARCHAR(50),
   coefficient DECIMAL(3,1) NOT NULL,
   PRIMARY KEY(id_matiere)
);

CREATE TABLE Controle(
   id_etudiant INT,
   id_matiere INT,
   PRIMARY KEY(id_etudiant, id_matiere),
   FOREIGN KEY(id_etudiant) REFERENCES Etudiant(id_etudiant),
   FOREIGN KEY(id_matiere) REFERENCES Matiere(id_matiere)
);
