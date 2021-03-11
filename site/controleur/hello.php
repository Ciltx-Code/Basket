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

	case "connexion" :
        if (EMPTY($_GET["email"] == "" )){
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

include "./vue/vueAccueil.php";
?>