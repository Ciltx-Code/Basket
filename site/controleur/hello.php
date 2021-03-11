<?php
$btn = "Initialiser";
if (isset($_POST["btn"])){
	$btn = $_POST["btn"];
}
include "./modele/bd_basket_connexion.php";

$message = "";
$erreur = "";

switch ($btn){
	case "Initialiser" :
	$_POST["nom"] = "";
	break;

	case "Enregistrer" :
	if ( $_POST["nom"] == "" ){
		$erreur = "Vous devez saisir un nom";
		break;
	}

		//Enregistrer le nom dans la base de données ....

	$message = $_POST["nom"]." a été enregistré";

	$_POST["nom"] = "";

	break;

	case "connexion" :
		login($_POST["email"],$_POST["psw"]);

	break;
}

include "./vue/vueAccueil.php";
?>