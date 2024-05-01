------------------------------------------------------------ The database and its tables

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

SELECT F.id AS 'idfeliere', F.libelle AS 'feliere', D.libelle AS 'departement' FROM feliere F INNER JOIN departement D ON F.departement = D.id;
			
SELECT F.id, F.libelle, D.libelle as 'departement', D.id as 'departementId' FROM feliere F INNER JOIN departement D on D.id = F.departement ;

DELETE FROM feliere WHERE id = "8";

SELECT F.id, F.libelle, D.libelle AS 'departement', D.id AS 'departementId' FROM feliere F INNER JOIN departement D ON D.id = F.departement;
SELECT F.id, F.libelle, D.libelle AS 'departement', D.id AS 'departementId' FROM feliere F INNER JOIN departement D ON D.id = F.departement WHERE D.libelle = 'Informatique';


SELECT F.id, F.libelle, D.id as 'departementId', D.libelle as 'departement' FROM feliere F INNER JOIN departement D on D.id = F.departement WHERE F.departement = '3';

------------------------------------------------------------ table etudiant

SELECT * FROM test_mini_innuaire.etudiant;
 
 
SELECT * FROM etudiant;

SELECT e.CNE, e.nom, e.prenom, e.telephone, d.libelle AS Departement, f.libelle AS Feliere FROM etudiant e LEFT JOIN departement d ON e.departement = d.id LEFT JOIN feliere f ON e.feliere = f.id;




INSERT INTO `etudiant` (`CNE`, `nom`, `prenom`, `feliere`, `departement`,`telephone`) VALUES ('069789', 'azan3', 'mohammed3', 2,2, '0797717892');

SELECT e.CNE, e.nom, e.prenom, e.telephone, f.libelle AS feliere, d.libelle AS departement FROM etudiant e LEFT JOIN feliere f ON e.feliere = f.id 
LEFT JOIN departement d ON e.departement = d.id WHERE e.CNE LIKE '%01245866%' OR e.nom LIKE '%01245866%' OR e.prenom LIKE '%01245866%' OR f.libelle LIKE '%01245866%' OR d.libelle LIKE '%01245866%';

DELETE FROM etudiant WHERE CNE = '069789';
DELETE FROM etudiant WHERE CNE = 'D195003655';

SELECT e.CNE, e.nom, e.prenom, e.telephone, f.libelle AS feliere, d.libelle AS departement
FROM etudiant e
LEFT JOIN feliere f ON e.feliere = f.id
LEFT JOIN departement d ON e.departement = d.id
WHERE e.CNE LIKE '%Réseaux et Télécommunications%' OR e.nom LIKE '%Réseaux et Télécommunications%' OR e.telephone LIKE '%Réseaux et Télécommunications%' 
OR e.prenom LIKE '%Réseaux et Télécommunications%' OR f.libelle LIKE '%Réseaux et Télécommunications%' 
OR d.libelle LIKE '%Réseaux et Télécommunications%';

