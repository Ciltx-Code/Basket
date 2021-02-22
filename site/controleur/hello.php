<?php
$btn = "Initialiser";
if (isset($_POST["btn"])){
	$btn = $_POST["btn"];
}

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
}

include "./vue/vueHello.php";
?>