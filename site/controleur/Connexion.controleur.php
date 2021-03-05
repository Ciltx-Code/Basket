<?php

include "./modele/bd_basket_connexion.php";

$btn = "Initialiser";
if (isset($_POST["btn"])){
    $btn = $_POST["btn"];
}

$message = "";
$erreur = "";

switch ($btn){
    case "Initialiser" :
        $_POST["mail"] = "";
        $_POST["pwd"]= "";
        break;

    case "connexion" :
        if (EMPTY($_GET["mail"] == "" )){
            $erreur = "Vous devez saisir un email";
            break;
        }
        if(EMPTY($_GET["pwd"])==""){
            $erreur="Vous devez saisir un mot de passe";
        }

        if($erreur=""){
            login($_GET["mail"],$_POST["pwd"]);
        }
        break;
}
?>