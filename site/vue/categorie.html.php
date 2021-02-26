<div class="categorie">
	<button type="submit" class="btn">Ajouter une catégorie</button>
	<button type="submit" class="btn">Modifier une catégorie</button>
	<button type="submit" class="btn">Supprimer une catégorie</button>
</div>

<?php


//include "./modele/bd_connexion.php";
//$connex = connexionPDO();
//$req = $connex->prepare("SELECT num_arbitre,nom_arbitre FROM `arbitre`");
//$req->execute();
$req = array();
$req = $listeCategories;

while($ligne = $req -> fetch(PDO::FETCH_OBJ)){
	echo "$ligne->num_catégorie";
	echo "$ligne->nom_catégorie";
}
?>