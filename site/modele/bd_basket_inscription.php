<?php
    include_once "bd_connexion.php";

    function insertUser($pwd,$mail,$nom,$prenom,$naissance){
        try{
            $hash = password_hash($pwd,PASSWORD_BCRYPT);
            $cnx = connexionPDO();
            $req = $cnx->prepare("INSERT INTO user(id_user,pwd_user, mail_user, nom_user, prenom_user, naissance_user) values(NULL , ?, ?, ?, ?, ?)");
            $req->bindValue(2,$hash);
            $req->bindValue(3,$mail);
            $req->bindValue(4,$nom);
            $req->bindValue(5,$prenom);
            $req->bindValue(6,$naissance);
            $req->execute();
            $resultat = $req;
        } catch (PDOException $e) {
            print("Erreur !: " . $e.getMessage());
            die();
        }
        return $resultat;
    }
?>