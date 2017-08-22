DROP DATABASE IF EXISTS formation;

/* Creation d'une database */
CREATE DATABASE IF NOT EXISTS formation;
USE formation;

/* Creation de la table - commande */
CREATE TABLE IF NOT EXISTS commande(
ID INTEGER NOT NULL AUTO_INCREMENT, 
commandeName VARCHAR(25) NOT NULL, 
commandeDate DATE, 
commandeTotal INTEGER,
PRIMARY KEY(ID)
) ENGINE=InnoDB ;

/* Creation de la table - plat */
CREATE TABLE IF NOT EXISTS plat(
ID INTEGER NOT NULL AUTO_INCREMENT, 
platName VARCHAR(25) NOT NULL, 
platTarif INTEGER,
PRIMARY KEY(ID)
) ENGINE=InnoDB ;

/* Creation de la table - ingredient */
CREATE TABLE IF NOT EXISTS ingredient(
ID INTEGER NOT NULL AUTO_INCREMENT, 
ingredientName VARCHAR(25),
PRIMARY KEY(ID)
) ENGINE=InnoDB ;

/* Creation de la table - commande_plats */
CREATE TABLE IF NOT EXISTS commande_plats(
ID INTEGER NOT NULL AUTO_INCREMENT, 
commandeID INTEGER,
platID INTEGER,
PRIMARY KEY(ID),
CONSTRAINT FK_cmdPlat_commandeID FOREIGN KEY(commandeID) REFERENCES formation.commande(id) ON DELETE CASCADE,
CONSTRAINT FK_cmdPlat_platID FOREIGN KEY(platID) REFERENCES formation.plat(id) ON DELETE CASCADE
) ENGINE=InnoDB ;

/* Creation de la table - plat_ingredients */
CREATE TABLE IF NOT EXISTS plat_ingredients(
platID INTEGER NOT NULL, 
ingredientID INTEGER NOT NULL, 
quantite INTEGER,
PRIMARY KEY (platID, ingredientID),
CONSTRAINT FK_platIngr_platID FOREIGN KEY(platID) REFERENCES formation.plat(ID) ON DELETE CASCADE,
CONSTRAINT FK_platIngr_ingredientID FOREIGN KEY(ingredientID) REFERENCES formation.ingredient(ID) ON DELETE CASCADE
) ENGINE=InnoDB ;

/* Creation de la table - depot */
CREATE TABLE IF NOT EXISTS depot(
ingredientID INTEGER NOT NULL AUTO_INCREMENT, 
depotDate DATE,
quantite INTEGER,
PRIMARY KEY (ingredientID, depotDate),
CONSTRAINT FK_ingredientID FOREIGN KEY(ingredientID) REFERENCES formation.ingredient(ID) ON DELETE CASCADE
) ENGINE=InnoDB ;

/* Insertion des donnees dans la table - commande */
INSERT INTO commande (commandeName, commandeDate, commandeTotal) 
VALUES 
	('Cmd1', '2017-08-01', 10),
	('Cmd2', '2017-08-01', 6),
	('Cmd3', '2017-08-02', 16);

/* Insertion des donnees dans la table -plat */
INSERT INTO plat (platName, platTarif) 
VALUES 
	('Sandwish poulet', 5), 
	('Sandwish saumon', 5), 
	('Wraps poulet', 6), 
    ('Wraps boeuf', 6);

/* Insertion des donnees dans la table - ingredient */
INSERT INTO ingredient (ingredientName) 
VALUES 
	('tortilla'), 
	('pain'), 
	('poulet'), 
    ('saumon'),
    ('boeuf');
    
/* Insertion des donnees dans la table - commande_plats */
INSERT INTO commande_plats (commandeID, platID) 
VALUES (1,1), (1,2), (2,3), (3,1), (3,2), (3,3);

/* Insertion des donnees dans la table - plat_ingredients */
INSERT INTO plat_ingredients (platID, ingredientID, quantite) 
VALUES 
	(1, 2, 200), 
	(1, 3, 150), 
	(2, 2, 200), 
	(2, 4, 150), 
	(3, 1, 100), 
	(3, 2, 150), 
	(4, 1, 100), 
	(4, 5, 150);

/* Insertion des donnees dans la table - depot */
INSERT INTO depot (ingredientID, depotDate, quantite) 
VALUES 
	(1, '2017-08-01', 1000),
	(2, '2017-08-02', 500),
    (3, '2017-08-03', 2000),
	(4, '2017-08-04', 1450),
	(3, '2017-08-05', 700);
   
/* Jointure - plat - ingredient */
SELECT plat.platName, ingredient.ingredientName 
FROM plat_ingredients
RIGHT JOIN plat ON plat.ID=plat_ingredients.platID 
LEFT JOIN ingredient ON ingredient.ID=plat_ingredients.ingredientID
ORDER BY plat.platName;