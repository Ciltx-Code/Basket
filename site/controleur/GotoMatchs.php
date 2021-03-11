<?php

include"./modele/bd_basket_arbitres.php";

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

	break;

	case 'Modifier':

	break;

	case "enregistrer" :
		addMatch($_GET['choixSalle'],$_GET['date'],$_GET['heure'],$_GET['choixEquipe1'],$_GET['choixEquipe2'],$_GET['arbitre1'],$_GET['arbitre2'],$_GET['mtn1'],$_GET['mtn2']);
		$message = $_GET["nomcat"]. "a été enregistré";
		header('Location: index.php?action=matchs');
	break;


}

include "./vue/vueMatchs.php";
?>