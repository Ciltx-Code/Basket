<?php
include "./modele/bd_basket.php";

$btn = "Initialiser";
if (isset($_GET["btn"])){
	$btn = $_GET["btn"];
}


$message = "";
$erreur = "";

switch ($btn){
	case "Initialiser" :
	$_GET['nomcat']="";
	$_GET['mtnindemnite']="";
	break;
	case "Supprimer":
		delCategorie($_GET['NumCat']);
		header('Location: index.php?action=categorie');
		break;

	case 'Modifier':
		updateCategorie($_GET['NumCat'], $_GET['NomCat'], $_GET['MontantIndemnite']);
		header('Location: index.php?action=categorie');
		break;

	case "Enregistrer" :
		/*if ( $_POST["nom"] == "" ){
			$erreur = "Vous devez saisir un nom";
		    break;
		}*/
		
		//Enregistrer le nom dans la base de données ....
		addCategorie($_GET['nomcat'], $_GET['mtnindemnite']);

		$message = $_GET["nomcat"]. "a été enregistré";
		header('Location: index.php?action=categorie');

		
		break;


	}




	include "./vue/vueCategorie.php";
	?>