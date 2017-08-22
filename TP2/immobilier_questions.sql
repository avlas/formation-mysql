USE immobilier;

/* Question 1 : Affichez le nom des agences */
SELECT nom FROM agence;

/* Question 2 : Affichez le numéro de l’agence « Orpi » */
SELECT idAgence FROM agence 
WHERE nom = 'Orpi';

/* Question 3 : Affichez le premier enregistrement de la table logement */
SELECT * FROM logement 
WHERE idLogement = 5067;

/* Question 4 : Affichez le nombre de logements (Alias : Nombre_de_logements) */
SELECT count(*) AS Nombre_de_logements FROM logement;

/* Question 5 : Affichez les logements à vendre à moins de 150 000 € dans l’ordre croissant des prix. */
SELECT * FROM logement 
WHERE categorie = 'vente' AND prix < 150000 
ORDER BY prix ASC;

/* Question 6 : Affichez le nombre de logements à la location (alias : nombre) */
SELECT count(*) AS nombre FROM logement 
WHERE categorie = 'location';

/* Question 7 : Affichez les villes différentes recherchées par les personnes demandeuses d'un logement */
SELECT DISTINCT ville FROM demande;
-- or
SELECT DISTINCT ville FROM logement, logement_personne 
WHERE logement.idLogement = logement_personne.idLogement;

/* Question 8 : Affichez le nombre de biens à vendre par ville */
SELECT ville, count(*) AS nombre_de_logements FROM logement 
WHERE categorie = 'vente' GROUP BY ville;

/* Question 9 : Quelles sont les id des logements destinés à la location ? */
/* Question 10 : Quels sont les id des logements entre 20 et 30m² ? */
/* Question 11 : Quel est le prix vendeur (hors commission) du logement le moins cher à vendre ? (Alias : prix minimum) */
/* Question 12 : Dans quelle ville se trouve les maisons à vendre ? */
/* Question 13 : L’agence Orpi souhaite diminuer les frais qu’elle applique sur le logement ayant l'id « 5246 ». Passer les frais de ce logement de 800 à 730€ */
/* Question 14 : Quels sont les logements gérés par l’agence « laforet » */
/* Question 15 : Affichez le nombre de propriétaires dans la ville de Paris (Alias : Nombre) */
/* Question 16 : Affichez les informations des trois premieres personnes souhaitant acheter un logement */
/* Question 17 : Affichez le prénom du vendeur pour le logement ayant la référence « 5770 » */
/* Question 18 : Affichez les prénoms des personnes souhaitant accéder à un logement sur la ville de Lyon */
/* Question 19 : Affichez les prénoms des personnes souhaitant accéder à un logement en location sur la ville de Paris */
/* Question 20 : Affichez les prénoms des personnes souhaitant acheter un logement de la plus grande à la plus petite superficie */
/* Question 21 : Quel sont les prix finaux proposés par les agences pour la maison à la vente ayant la référence « 5091 » ? (Alias : prix frais d'agence
inclus) */
/* Question 23 : Si l’ensemble des logements étaient vendus ou loués demain, quel serait le bénéfice généré grâce aux frais d’agence et pour chaque agence
(Alias : benefice, classement : par ordre croissant des gains) */
/* Question 24 : Affichez les id des biens en location, les prix, suivis des frais d’agence (classement : dans l’ordre croissant des prix) */
/* Question 25 : Quel est le prénom du propriétaire proposant le logement le moins cher à louer ? */
/* Question 26 : Affichez le prénom et la ville où se trouve le logement de chaque propriétaire */
/* Question 27 : Quel est l’agence immobilière s’occupant de la plus grande gestion de logements répertoriés à Paris ? (alias : nombre, classement : trié par
ordre décroissant) */
/* Question 28 : Affichez le prix et le prénom des vendeurs dont les logements sont proposés à 130000 € ou moins en prix final avec frais appliqués par les
agences (alias : prix final, classement : ordre croissant des prix finaux) : */

/* Question 29 : Afficher toutes les demandes enregistrées avec la personne à l'origine de la demande (Afficher également les demandes d'anciennes personnes n'existant plus dans notre base de données). */
/* Question 30 : Afficher toutes les personnes enregistrées avec leur demandes correspondantes (Afficher également les personnes n'ayant pas formulé de demandes). */
