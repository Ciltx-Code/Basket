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

	case "Enregistrer" :


	break;


}

include "./vue/vueArbitres.php";
?>