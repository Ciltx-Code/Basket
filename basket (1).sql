-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 25 fév. 2021 à 17:46
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
  PRIMARY KEY (`num_arbitre`,`num_club`,`num_equipe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `catégorie`
--

DROP TABLE IF EXISTS `catégorie`;
CREATE TABLE IF NOT EXISTS `catégorie` (
  `num_catégorie` int NOT NULL AUTO_INCREMENT,
  `nom_catégorie` varchar(50) NOT NULL,
  `montant_indemnité` decimal(5,0) NOT NULL,
  PRIMARY KEY (`num_catégorie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`num_championnat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `num_club` int NOT NULL,
  `nom_club` varchar(50) NOT NULL,
  PRIMARY KEY (`num_club`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `deplacement`
--

DROP TABLE IF EXISTS `deplacement`;
CREATE TABLE IF NOT EXISTS `deplacement` (
  `num_arbitre` int NOT NULL,
  `num_salle` int NOT NULL,
  `distance` int NOT NULL,
  PRIMARY KEY (`num_arbitre`,`num_salle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `division`
--

DROP TABLE IF EXISTS `division`;
CREATE TABLE IF NOT EXISTS `division` (
  `num_division` int NOT NULL AUTO_INCREMENT,
  `nom_division` varchar(50) NOT NULL,
  PRIMARY KEY (`num_division`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `num_equipe` int NOT NULL,
  `num_club` int NOT NULL,
  `nom_equipe` varchar(50) NOT NULL,
  `num_championnat` int NOT NULL,
  PRIMARY KEY (`num_equipe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `indisponibilité`
--

DROP TABLE IF EXISTS `indisponibilité`;
CREATE TABLE IF NOT EXISTS `indisponibilité` (
  `num_arbitre` int NOT NULL,
  `date_jour` date NOT NULL,
  `Code_demi_journée` varchar(50) NOT NULL,
  PRIMARY KEY (`num_arbitre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `montant_déplt_p` int NOT NULL,
  `montant_déplt_s` int NOT NULL,
  PRIMARY KEY (`num_match`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `num_salle` int NOT NULL AUTO_INCREMENT,
  `adresse salle` varchar(50) NOT NULL,
  PRIMARY KEY (`num_salle`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_championnat`
--

DROP TABLE IF EXISTS `type_championnat`;
CREATE TABLE IF NOT EXISTS `type_championnat` (
  `num_type_championnat` int NOT NULL AUTO_INCREMENT,
  `nom_type_championnat` int NOT NULL,
  PRIMARY KEY (`num_type_championnat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
