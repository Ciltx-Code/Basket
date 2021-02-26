-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 fév. 2021 à 17:37
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `basket`
--

-- --------------------------------------------------------

--
-- Structure de la table `arbitre`
--

DROP TABLE IF EXISTS `arbitre`;
CREATE TABLE IF NOT EXISTS `arbitre` (
  `num_arbitre` int NOT NULL AUTO_INCREMENT,
  `nom_arbitre` varchar(50) NOT NULL,
  `prenom_arbitre` varchar(50) NOT NULL,
  `adresse_arbitre` varchar(50) NOT NULL,
  `CP_arbitre` varchar(50) NOT NULL,
  `ville_arbitre` varchar(50) NOT NULL,
  `date_naiss_arbitre` date NOT NULL,
  `tel_fixe_arbitre` varchar(50) NOT NULL,
  `tel_port_arbitre` varchar(50) NOT NULL,
  `mail_arbitre` varchar(50) NOT NULL,
  `num_club` int NOT NULL,
  `num_equipe` int NOT NULL,
  PRIMARY KEY (`num_arbitre`,`num_club`,`num_equipe`),
  KEY `num_club` (`num_club`,`num_equipe`),
  KEY `num_equipe` (`num_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `arbitre`
--

INSERT INTO `arbitre` (`num_arbitre`, `nom_arbitre`, `prenom_arbitre`, `adresse_arbitre`, `CP_arbitre`, `ville_arbitre`, `date_naiss_arbitre`, `tel_fixe_arbitre`, `tel_port_arbitre`, `mail_arbitre`, `num_club`, `num_equipe`) VALUES
(1, 'BOGUSZ', 'Thierry', '41 rue Frédéric Mistral', '87000', 'Limoges', '1959-04-26', '0555374890', '0714253696', 'thbogusz@yahoo.fr', 3, 1),
(2, 'BOURGEOIS', 'Agnès', ' adresse super belle', '87000', 'Limoges', '0000-00-00', '0555432100', '0763254178', 'bourgeois.agnes@educ-valadon-limoges.fr', 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `num_catégorie` int NOT NULL AUTO_INCREMENT,
  `nom_catégorie` varchar(50) NOT NULL,
  `montant_indemnité` decimal(5,0) NOT NULL,
  PRIMARY KEY (`num_catégorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`num_catégorie`, `nom_catégorie`, `montant_indemnité`) VALUES
(1, 'U-15', '20'),
(2, 'U-18', '20'),
(3, 'U-20', '20'),
(4, 'Senoir', '20');

-- --------------------------------------------------------

--
-- Structure de la table `championnat`
--

DROP TABLE IF EXISTS `championnat`;
CREATE TABLE IF NOT EXISTS `championnat` (
  `num_championnat` int NOT NULL AUTO_INCREMENT,
  `nom_championnat` varchar(50) NOT NULL,
  `num_catégorie` int NOT NULL,
  `num_division` int NOT NULL,
  `num_type_championnat` int NOT NULL,
  PRIMARY KEY (`num_championnat`),
  KEY `num_championnat` (`num_championnat`,`num_catégorie`,`num_division`,`num_type_championnat`),
  KEY `num_catégorie` (`num_catégorie`),
  KEY `num_division` (`num_division`),
  KEY `num_type_championnat` (`num_type_championnat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `championnat`
--

INSERT INTO `championnat` (`num_championnat`, `nom_championnat`, `num_catégorie`, `num_division`, `num_type_championnat`) VALUES
(1, 'Championnat_1', 1, 2, 1),
(2, 'Championnat_2', 4, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `num_club` int NOT NULL AUTO_INCREMENT,
  `nom_club` varchar(50) NOT NULL,
  PRIMARY KEY (`num_club`),
  KEY `num_club` (`num_club`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `club`
--

INSERT INTO `club` (`num_club`, `nom_club`) VALUES
(1, 'CSP'),
(2, 'USBBB'),
(3, 'ASPTT Limoges'),
(4, 'Limoges-Saint-Antoine');

-- --------------------------------------------------------

--
-- Structure de la table `deplacement`
--

DROP TABLE IF EXISTS `deplacement`;
CREATE TABLE IF NOT EXISTS `deplacement` (
  `num_arbitre` int NOT NULL,
  `num_salle` int NOT NULL,
  `distance` int NOT NULL,
  PRIMARY KEY (`num_arbitre`,`num_salle`),
  KEY `num_arbitre` (`num_arbitre`,`num_salle`),
  KEY `num_salle` (`num_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `deplacement`
--

INSERT INTO `deplacement` (`num_arbitre`, `num_salle`, `distance`) VALUES
(1, 1, 280),
(2, 4, 300);

-- --------------------------------------------------------

--
-- Structure de la table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `num_division` int NOT NULL AUTO_INCREMENT,
  `nom_division` varchar(50) NOT NULL,
  PRIMARY KEY (`num_division`),
  KEY `num_division` (`num_division`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `division`
--

INSERT INTO `division` (`num_division`, `nom_division`) VALUES
(1, 'Pro A'),
(2, 'Espoirs'),
(3, 'Pro B'),
(4, 'Ligue Feminine de basket');

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `num_equipe` int NOT NULL AUTO_INCREMENT,
  `num_club` int NOT NULL,
  `nom_equipe` varchar(50) NOT NULL,
  `num_championnat` int NOT NULL,
  PRIMARY KEY (`num_equipe`),
  KEY `num_equipe` (`num_equipe`),
  KEY `num_championnat` (`num_championnat`),
  KEY `num_club` (`num_club`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`num_equipe`, `num_club`, `nom_equipe`, `num_championnat`) VALUES
(1, 3, 'Equipe_1', 2),
(2, 4, 'Equipe_2', 2);

-- --------------------------------------------------------

--
-- Structure de la table `indisponibilite`
--

DROP TABLE IF EXISTS `indisponibilite`;
CREATE TABLE IF NOT EXISTS `indisponibilite` (
  `num_arbitre` int NOT NULL,
  `date_jour` date NOT NULL,
  `Code_demi_journée` varchar(50) NOT NULL,
  PRIMARY KEY (`num_arbitre`),
  KEY `num_arbitre` (`num_arbitre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `indisponibilite`
--

INSERT INTO `indisponibilite` (`num_arbitre`, `date_jour`, `Code_demi_journée`) VALUES
(1, '2021-04-14', '01'),
(2, '2021-05-13', '02');

-- --------------------------------------------------------

--
-- Structure de la table `match`
--

DROP TABLE IF EXISTS `match`;
CREATE TABLE IF NOT EXISTS `match` (
  `num_match` int NOT NULL AUTO_INCREMENT,
  `num_salle` int NOT NULL,
  `date_match` date NOT NULL,
  `heure_match` time NOT NULL,
  `num_equipe1_` int NOT NULL,
  `num_equipe_2` int NOT NULL,
  `num_arbitre_p` int NOT NULL,
  `num_arbitre_s` int NOT NULL,
  `montant_déplt_p` decimal(4,0) NOT NULL,
  `montant_déplt_s` decimal(4,0) NOT NULL,
  PRIMARY KEY (`num_match`),
  KEY `num_match` (`num_match`),
  KEY `num_salle` (`num_salle`),
  KEY `num_equipe1_` (`num_equipe1_`),
  KEY `num_equipe_2` (`num_equipe_2`),
  KEY `num_arbitre_p` (`num_arbitre_p`),
  KEY `num_arbitre_s` (`num_arbitre_s`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `match`
--

INSERT INTO `match` (`num_match`, `num_salle`, `date_match`, `heure_match`, `num_equipe1_`, `num_equipe_2`, `num_arbitre_p`, `num_arbitre_s`, `montant_déplt_p`, `montant_déplt_s`) VALUES
(1, 1, '2021-04-01', '14:00:00', 1, 2, 1, 2, '150', '200');

-- --------------------------------------------------------

--
-- Structure de la table `parametres`
--

DROP TABLE IF EXISTS `parametres`;
CREATE TABLE IF NOT EXISTS `parametres` (
  `numéro_param` int NOT NULL AUTO_INCREMENT,
  `montant_km` decimal(5,0) NOT NULL,
  `mail_responsable` varchar(50) NOT NULL,
  PRIMARY KEY (`numéro_param`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `parametres`
--

INSERT INTO `parametres` (`numéro_param`, `montant_km`, `mail_responsable`) VALUES
(1, '150', 'responsablen1@gmail.com'),
(2, '300', 'responsablen2@hotmail.fr');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `num_salle` int NOT NULL AUTO_INCREMENT,
  `adresse salle` varchar(50) NOT NULL,
  PRIMARY KEY (`num_salle`),
  KEY `num_salle` (`num_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`num_salle`, `adresse salle`) VALUES
(1, 'Palace of Auburn Hills'),
(2, 'United Center'),
(3, 'Rose Garden'),
(4, 'Quicken Loans Arena');

-- --------------------------------------------------------

--
-- Structure de la table `type_championnat`
--

DROP TABLE IF EXISTS `type_championnat`;
CREATE TABLE IF NOT EXISTS `type_championnat` (
  `num_type_championnat` int NOT NULL AUTO_INCREMENT,
  `nom_type_championnat` varchar(50) NOT NULL,
  PRIMARY KEY (`num_type_championnat`),
  KEY `num_type_championnat` (`num_type_championnat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type_championnat`
--

INSERT INTO `type_championnat` (`num_type_championnat`, `nom_type_championnat`) VALUES
(1, 'Championnat départemental'),
(2, 'Championnat inter-départemental'),
(3, 'Championnat régionnal'),
(4, 'Championnat inter-régionnal');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `arbitre`
--
ALTER TABLE `arbitre`
  ADD CONSTRAINT `arbitre_ibfk_1` FOREIGN KEY (`num_club`) REFERENCES `club` (`num_club`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arbitre_ibfk_2` FOREIGN KEY (`num_equipe`) REFERENCES `equipe` (`num_equipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `championnat`
--
ALTER TABLE `championnat`
  ADD CONSTRAINT `championnat_ibfk_1` FOREIGN KEY (`num_catégorie`) REFERENCES `categorie` (`num_catégorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `championnat_ibfk_2` FOREIGN KEY (`num_division`) REFERENCES `division` (`num_division`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `championnat_ibfk_3` FOREIGN KEY (`num_type_championnat`) REFERENCES `type_championnat` (`num_type_championnat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `deplacement`
--
ALTER TABLE `deplacement`
  ADD CONSTRAINT `deplacement_ibfk_1` FOREIGN KEY (`num_arbitre`) REFERENCES `arbitre` (`num_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deplacement_ibfk_2` FOREIGN KEY (`num_salle`) REFERENCES `salle` (`num_salle`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`num_championnat`) REFERENCES `championnat` (`num_championnat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `equipe_ibfk_2` FOREIGN KEY (`num_club`) REFERENCES `club` (`num_club`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `indisponibilite`
--
ALTER TABLE `indisponibilite`
  ADD CONSTRAINT `indisponibilite_ibfk_1` FOREIGN KEY (`num_arbitre`) REFERENCES `arbitre` (`num_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `match`
--
ALTER TABLE `match`
  ADD CONSTRAINT `match_ibfk_1` FOREIGN KEY (`num_arbitre_p`) REFERENCES `arbitre` (`num_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_ibfk_2` FOREIGN KEY (`num_arbitre_s`) REFERENCES `arbitre` (`num_arbitre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_ibfk_3` FOREIGN KEY (`num_salle`) REFERENCES `salle` (`num_salle`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_ibfk_4` FOREIGN KEY (`num_equipe1_`) REFERENCES `equipe` (`num_equipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `match_ibfk_5` FOREIGN KEY (`num_equipe_2`) REFERENCES `equipe` (`num_equipe`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
