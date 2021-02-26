DROP DATABASE IF EXISTS MLR1;

CREATE DATABASE IF NOT EXISTS MLR1;
USE MLR1;
# -----------------------------------------------------------------------------
#       TABLE : DIVISION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DIVISION
 (
   NUM_DIVISION CHAR(10) NOT NULL  ,
   NOM_DIVISION CHAR(50) NULL  
   , PRIMARY KEY (NUM_DIVISION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CATÉGORIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATÉGORIE
 (
   NUM_CATÉGORIE CHAR(10) NOT NULL  ,
   NOM_CATÉGORIE CHAR(50) NULL  ,
   MONTANT_INDEMNITÉ CHAR(32) NULL  
   , PRIMARY KEY (NUM_CATÉGORIE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : INDISPONIBILITÉ
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INDISPONIBILITÉ
 (
   NUM_ARBITRE CHAR(10) NOT NULL  ,
   NUM_ARBITRE_REL_9 CHAR(10) NOT NULL  ,
   DATE_JOUR CHAR(32) NULL  ,
   CODE_DEMI_JOURNÉE CHAR(32) NULL  
   , PRIMARY KEY (NUM_ARBITRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE INDISPONIBILITÉ
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_INDISPONIBILITÉ_ARBITRE
     ON INDISPONIBILITÉ (NUM_ARBITRE_REL_9 ASC);

# -----------------------------------------------------------------------------
#       TABLE : EQUIPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EQUIPE
 (
   NUM_EQUIPE CHAR(10) NOT NULL  ,
   NUM_CHAMPIONNAT_REL_1 CHAR(10) NOT NULL  ,
   NUM_CLUB_REL_13 CHAR(32) NOT NULL  ,
   NUM_CLUB CHAR(10) NULL  ,
   NOM_EQUIPE CHAR(50) NULL  ,
   NUM_CHAMPIONNAT CHAR(10) NULL  
   , PRIMARY KEY (NUM_EQUIPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EQUIPE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EQUIPE_CHAMPIONNAT
     ON EQUIPE (NUM_CHAMPIONNAT_REL_1 ASC);

CREATE  INDEX I_FK_EQUIPE_CLUB
     ON EQUIPE (NUM_CLUB_REL_13 ASC);

# -----------------------------------------------------------------------------
#       TABLE : CHAMPIONNAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CHAMPIONNAT
 (
   NUM_CHAMPIONNAT CHAR(10) NOT NULL  ,
   NUM_DIVISION_REL_3 CHAR(10) NOT NULL  ,
   NUM_CATÉGORIE_REL_4 CHAR(10) NOT NULL  ,
   NUM_TYPE_CHAMPIONNAT_REL_5 CHAR(10) NOT NULL  ,
   NOM_CHAMPIONNAT CHAR(50) NULL  ,
   NUM_CATÉGORIE CHAR(50) NULL  ,
   NUM_DIVISION CHAR(10) NULL  ,
   NUM_TYPE_CHAMPIONNAT CHAR(10) NULL  
   , PRIMARY KEY (NUM_CHAMPIONNAT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CHAMPIONNAT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CHAMPIONNAT_DIVISION
     ON CHAMPIONNAT (NUM_DIVISION_REL_3 ASC);

CREATE  INDEX I_FK_CHAMPIONNAT_CATÉGORIE
     ON CHAMPIONNAT (NUM_CATÉGORIE_REL_4 ASC);

CREATE  INDEX I_FK_CHAMPIONNAT_TYPE_CHAMPIONNAT
     ON CHAMPIONNAT (NUM_TYPE_CHAMPIONNAT_REL_5 ASC);

# -----------------------------------------------------------------------------
#       TABLE : TYPE_CHAMPIONNAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_CHAMPIONNAT
 (
   NUM_TYPE_CHAMPIONNAT CHAR(10) NOT NULL  ,
   NOM_TYPE_CHAMPIONNAT CHAR(50) NOT NULL  
   , PRIMARY KEY (NUM_TYPE_CHAMPIONNAT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ARBITRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ARBITRE
 (
   NUM_ARBITRE CHAR(10) NOT NULL  ,
   NUM_CLUB_REL_2 CHAR(32) NULL  ,
   NUM_EQUIPE_REL_10 CHAR(10) NULL  ,
   NOM_ARBITRE CHAR(50) NULL  ,
   PRENOM_ARBITRE CHAR(50) NULL  ,
   ADRESSE_ARBITRE CHAR(50) NULL  ,
   CP_ARBITRE CHAR(5) NULL  ,
   VILLE_ARBITRE CHAR(50) NULL  ,
   DATE_NAISS_ARBITRE CHAR(32) NULL  ,
   TEL_FIXE_ARBITRE CHAR(10) NULL  ,
   TEL_PORT_ARBITRE CHAR(10) NULL  ,
   MAIL_ARBITRE CHAR(50) NULL  ,
   NUM_CLUB CHAR(10) NULL  ,
   NUM_EQUIPE CHAR(10) NULL  
   , PRIMARY KEY (NUM_ARBITRE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ARBITRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ARBITRE_CLUB
     ON ARBITRE (NUM_CLUB_REL_2 ASC);

CREATE  INDEX I_FK_ARBITRE_EQUIPE
     ON ARBITRE (NUM_EQUIPE_REL_10 ASC);

# -----------------------------------------------------------------------------
#       TABLE : MATCH
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATCH
 (
   NUM_MATCH CHAR(10) NOT NULL  ,
   NUM_SALLE_REL_6 CHAR(10) NULL  ,
   NUM_ARBITRE CHAR(10) NULL  ,
   NUM_ARBITRE_REL_15 CHAR(10) NULL  ,
   NUM_SALLE CHAR(10) NULL  ,
   DATE_MATCH CHAR(32) NULL  ,
   HEURE_MATCH CHAR(32) NULL  ,
   NUM_EQUIPE_1 CHAR(10) NULL  ,
   NUM_EQUIPE_2 CHAR(10) NULL  ,
   NUM_ARBITRE_P CHAR(10) NULL  ,
   NUM_ARBITRE_S CHAR(10) NULL  ,
   MONTANT_DÉPLT_P CHAR(32) NULL  ,
   MONTANT_DÉPLT_S CHAR(32) NULL  
   , PRIMARY KEY (NUM_MATCH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MATCH
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MATCH_SALLE
     ON MATCH (NUM_SALLE_REL_6 ASC);

CREATE  INDEX I_FK_MATCH_ARBITRE
     ON MATCH (NUM_ARBITRE ASC);

CREATE  INDEX I_FK_MATCH_ARBITRE1
     ON MATCH (NUM_ARBITRE_REL_15 ASC);

# -----------------------------------------------------------------------------
#       TABLE : DEPLACEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DEPLACEMENT
 (
   NUM_ARBITRE CHAR(10) NOT NULL  ,
   NUM_SALLE CHAR(10) NOT NULL  ,
   NUM_SALLE_REL_7 CHAR(10) NOT NULL  ,
   NUM_ARBITRE_REL_8 CHAR(10) NOT NULL  ,
   TARIF_KM CHAR(32) NOT NULL  
   , PRIMARY KEY (NUM_ARBITRE,NUM_SALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DEPLACEMENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DEPLACEMENT_SALLE
     ON DEPLACEMENT (NUM_SALLE_REL_7 ASC);

CREATE  INDEX I_FK_DEPLACEMENT_ARBITRE
     ON DEPLACEMENT (NUM_ARBITRE_REL_8 ASC);

# -----------------------------------------------------------------------------
#       TABLE : PARAMÈTRES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARAMÈTRES
 (
   NUMÉRO_PARAM CHAR(10) NOT NULL  ,
   MONTANT_KM CHAR(32) NULL  ,
   MAIL_RESPONSABLE CHAR(50) NULL  
   , PRIMARY KEY (NUMÉRO_PARAM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALLE
 (
   NUM_SALLE CHAR(10) NOT NULL  ,
   ADRESSE_SALLE CHAR(50) NULL  
   , PRIMARY KEY (NUM_SALLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CLUB
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLUB
 (
   NUM_CLUB CHAR(32) NOT NULL  ,
   NOM_CLUB CHAR(50) NULL  
   , PRIMARY KEY (NUM_CLUB) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : REL_11
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REL_11
 (
   NUM_EQUIPE CHAR(10) NOT NULL  ,
   NUM_MATCH CHAR(10) NOT NULL  
   , PRIMARY KEY (NUM_EQUIPE,NUM_MATCH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REL_11
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REL_11_EQUIPE
     ON REL_11 (NUM_EQUIPE ASC);

CREATE  INDEX I_FK_REL_11_MATCH
     ON REL_11 (NUM_MATCH ASC);

# -----------------------------------------------------------------------------
#       TABLE : REL_12
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REL_12
 (
   NUM_EQUIPE CHAR(10) NOT NULL  ,
   NUM_MATCH CHAR(10) NOT NULL  
   , PRIMARY KEY (NUM_EQUIPE,NUM_MATCH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REL_12
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REL_12_EQUIPE
     ON REL_12 (NUM_EQUIPE ASC);

CREATE  INDEX I_FK_REL_12_MATCH
     ON REL_12 (NUM_MATCH ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE INDISPONIBILITÉ 
  ADD FOREIGN KEY FK_INDISPONIBILITÉ_ARBITRE (NUM_ARBITRE_REL_9)
      REFERENCES ARBITRE (NUM_ARBITRE) ;


ALTER TABLE EQUIPE 
  ADD FOREIGN KEY FK_EQUIPE_CHAMPIONNAT (NUM_CHAMPIONNAT_REL_1)
      REFERENCES CHAMPIONNAT (NUM_CHAMPIONNAT) ;


ALTER TABLE EQUIPE 
  ADD FOREIGN KEY FK_EQUIPE_CLUB (NUM_CLUB_REL_13)
      REFERENCES CLUB (NUM_CLUB) ;


ALTER TABLE CHAMPIONNAT 
  ADD FOREIGN KEY FK_CHAMPIONNAT_DIVISION (NUM_DIVISION_REL_3)
      REFERENCES DIVISION (NUM_DIVISION) ;


ALTER TABLE CHAMPIONNAT 
  ADD FOREIGN KEY FK_CHAMPIONNAT_CATÉGORIE (NUM_CATÉGORIE_REL_4)
      REFERENCES CATÉGORIE (NUM_CATÉGORIE) ;


ALTER TABLE CHAMPIONNAT 
  ADD FOREIGN KEY FK_CHAMPIONNAT_TYPE_CHAMPIONNAT (NUM_TYPE_CHAMPIONNAT_REL_5)
      REFERENCES TYPE_CHAMPIONNAT (NUM_TYPE_CHAMPIONNAT) ;


ALTER TABLE ARBITRE 
  ADD FOREIGN KEY FK_ARBITRE_CLUB (NUM_CLUB_REL_2)
      REFERENCES CLUB (NUM_CLUB) ;


ALTER TABLE ARBITRE 
  ADD FOREIGN KEY FK_ARBITRE_EQUIPE (NUM_EQUIPE_REL_10)
      REFERENCES EQUIPE (NUM_EQUIPE) ;


ALTER TABLE MATCH 
  ADD FOREIGN KEY FK_MATCH_SALLE (NUM_SALLE_REL_6)
      REFERENCES SALLE (NUM_SALLE) ;


ALTER TABLE MATCH 
  ADD FOREIGN KEY FK_MATCH_ARBITRE (NUM_ARBITRE)
      REFERENCES ARBITRE (NUM_ARBITRE) ;


ALTER TABLE MATCH 
  ADD FOREIGN KEY FK_MATCH_ARBITRE1 (NUM_ARBITRE_REL_15)
      REFERENCES ARBITRE (NUM_ARBITRE) ;


ALTER TABLE DEPLACEMENT 
  ADD FOREIGN KEY FK_DEPLACEMENT_SALLE (NUM_SALLE_REL_7)
      REFERENCES SALLE (NUM_SALLE) ;


ALTER TABLE DEPLACEMENT 
  ADD FOREIGN KEY FK_DEPLACEMENT_ARBITRE (NUM_ARBITRE_REL_8)
      REFERENCES ARBITRE (NUM_ARBITRE) ;


ALTER TABLE REL_11 
  ADD FOREIGN KEY FK_REL_11_EQUIPE (NUM_EQUIPE)
      REFERENCES EQUIPE (NUM_EQUIPE) ;


ALTER TABLE REL_11 
  ADD FOREIGN KEY FK_REL_11_MATCH (NUM_MATCH)
      REFERENCES MATCH (NUM_MATCH) ;


ALTER TABLE REL_12 
  ADD FOREIGN KEY FK_REL_12_EQUIPE (NUM_EQUIPE)
      REFERENCES EQUIPE (NUM_EQUIPE) ;


ALTER TABLE REL_12 
  ADD FOREIGN KEY FK_REL_12_MATCH (NUM_MATCH)
      REFERENCES MATCH (NUM_MATCH) ;

