<?php

function login($mail,$passwd)
{
    session_start();
    include('bd_connexion.php');
    $connex = connexionPDO();

    // 1) Requête préparée SELECT : SELECT * FROM users WHERE username=?
    // 2) Envoyer la requête préparée au serveur et récupérer l'enregistrement
    // 3) Vérifier le mot de passe avec le hash du champ username : password_verify()

    $CheckConnexion = $connex->prepare("SELECT * FROM user WHERE mail_user=?");
    $CheckConnexion->bindValue(1, $mail);
    $CheckConnexion->execute();

    while ($ligne = $CheckConnexion->fetch(PDO::FETCH_OBJ)) {

        if (password_verify($passwd, $ligne->pwd_user)) {
            echo 'OK';
            $_SESSION["id"] = $ligne->id_user;
            echo"test";
        } else {
            echo 'ERREUR';
        }
    }
}
?>