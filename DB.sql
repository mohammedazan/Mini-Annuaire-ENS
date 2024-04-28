create database test_mini_innuaire ;
use  test_mini_innuaire ; 

CREATE TABLE `departement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `feliere` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  `departement` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_f_d` (`departement`),
  CONSTRAINT `fk_f_d` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`)
);

CREATE TABLE `etudiant` (
  `CNE` varchar(50) NOT NULL PRIMARY KEY,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `feliere` int DEFAULT NULL,
  `departement` int DEFAULT NULL,
  `telephone` varchar(13) DEFAULT NULL,
  KEY `fk_f_f` (`feliere`),
  KEY `fk_e_d` (`departement`),
  CONSTRAINT `fk_e_d` FOREIGN KEY (`departement`) REFERENCES `departement` (`id`),
  CONSTRAINT `fk_f_f` FOREIGN KEY (`feliere`) REFERENCES `feliere` (`id`)
);

INSERT INTO departement (libelle) VALUES ('Informatique');
INSERT INTO departement (libelle) VALUES ('Electronique');
INSERT INTO departement (libelle) VALUES ('Mécanique');


INSERT INTO feliere (libelle, departement) VALUES ('Génie Logiciel', 1);
INSERT INTO feliere (libelle, departement) VALUES ('Réseaux et Télécommunications', 1);
INSERT INTO feliere (libelle, departement) VALUES ('Automatique et Robotique', 2);
INSERT INTO feliere (libelle, departement) VALUES ('Microélectronique', 2);
INSERT INTO feliere (libelle, departement) VALUES ('Ingénierie des Matériaux', 3);


INSERT INTO etudiant (CNE, nom, prenom, feliere, departement, telephone) VALUES ('123456', 'Ahmed', 'Ali', 1, 1, '0123456789');
INSERT INTO etudiant (CNE, nom, prenom, feliere, departement, telephone) VALUES ('234567', 'Fatima', 'Omar', 2, 1, '0234567890');
INSERT INTO etudiant (CNE, nom, prenom, feliere, departement, telephone) VALUES ('345678', 'Karim', 'Sami', 3, 2, '0345678901');
INSERT INTO etudiant (CNE, nom, prenom, feliere, departement, telephone) VALUES ('456789', 'Lina', 'Nasser', 4, 2, '0456789012');
INSERT INTO etudiant (CNE, nom, prenom, feliere, departement, telephone) VALUES ('567890', 'Sara', 'Mohamed', 5, 3, '0567890123');




------------------------------------------------------------ table departement

SELECT * FROM test_mini_innuaire.departement ; 

INSERT INTO `departement` (`libelle`) VALUES ('TESTDB');

SELECT * FROM departement WHERE REPLACE(libelle, ' ', '') LIKE '%TESTDB%';

DELETE FROM departement WHERE id = "12";


------------------------------------------------------------ table feliere

SELECT * FROM test_mini_innuaire.feliere;

INSERT INTO `feliere` (`libelle`, `departement`) VALUES ('TESTDBFILIER', '1');

SELECT F.id, F.libelle, D.libelle AS 'departement', D.id AS 'departementId' FROM feliere F INNER JOIN departement D ON D.id = F.departement WHERE F.libelle LIKE '%Génie Logiciel%';

DELETE FROM feliere WHERE id = "6";


SELECT F.id, F.libelle, D.libelle AS 'departement', D.id AS 'departementId' FROM feliere F INNER JOIN departement D ON D.id = F.departement;

SELECT F.id, F.libelle, D.libelle AS 'departement', D.id AS 'departementId' FROM feliere F INNER JOIN departement D ON D.id = F.departement WHERE D.libelle = 'Informatique';




------------------------------------------------------------ table etudiant

 SELECT * FROM test_mini_innuaire.etudiant;

INSERT INTO `etudiant` (`CNE`, `nom`, `prenom`, `feliere`, `departement`,`telephone`) VALUES ('123489', 'azan2', 'mohammed', 2,2, '0697717892');
SELECT E.nom, E.prenom, E.CNE, E.telephone, F.libelle as 'feliere', E.feliere as 'feliereId', F.departement as 'departementId', F.departement  FROM  etudiant E INNER JOIN feliere F on E.feliere = F.id WHERE nom like '%0987484%' or prenom like '%0987484%' or cne like '%0987484%';

SELECT E.nom, E.prenom, E.CNE, E.telephone, F.libelle as 'feliere', E.feliere as 'feliereId', F.departement as 'departementId', F.departement  FROM  etudiant E INNER JOIN feliere F on E.feliere = F.id WHERE nom like '%0987484%' ;