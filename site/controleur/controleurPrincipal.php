<?php

function controleurPrincipal($action){
    $lesActions = array();
    $lesActions["defaut"] = "hello.php";
    $lesActions["hello"] = "hello.php";
    $lesActions["categorie"] = "GotoCategorie.php";
    $lesActions["arbitres"] = "GotoArbitres.php";
    $lesActions["enregistrercat"] = "../modele/bd_basket_categorie.php.php";
    $lesActions["modifiercat"] = "../modele/bd_basket_categorie.php.php";
    $lesActions["inscription"] = "GoToInscription.php";
    $lesActions["connexion"] = "Connexion.controleur.php";
    
    if (array_key_exists ( $action , $lesActions )){
        return $lesActions[$action];
    }
    else{
        return $lesActions["defaut"];
    }

}

?>