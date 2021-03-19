<?php
try{
	include "../modele/bd_connexion.php";
	$cnx = connexionPDO();

	$nom = $_POST['nom'];
	$equipe1 = $_POST['equipe1'];
	$equipe2 = $_POST['equipe2'];

	$req = $cnx->prepare("SELECT c.num_championnat AS num FROM championnat c JOIN equipe e ON c.num_championnat = e.num_championnat JOIN arbitre a ON e.num_equipe = a.num_equipe WHERE a.num_arbitre=?");
	$req->bindValue(1, $nom);
	$req->execute();
	$ligne = $req->fetch(PDO::FETCH_OBJ);
	$champarb = $ligne->num;

	$reqEquipe1 = $cnx->prepare("SELECT c.num_championnat AS num FROM championnat c join equipe e ON c.num_championnat = e.num_championnat WHERE e.num_equipe = ?");
	$reqEquipe1->bindValue(1, $equipe1);
	$reqEquipe1->execute();
	$ligne = $reqEquipe1->fetch(PDO::FETCH_OBJ);
	$champeq1 = $ligne->num;

	$reqEquipe2 = $cnx->prepare("SELECT c.num_championnat AS num FROM championnat c join equipe e ON c.num_championnat = e.num_championnat WHERE e.num_equipe = ?");
	$reqEquipe2->bindValue(1, $equipe2);
	$reqEquipe2->execute();
	$ligne = $reqEquipe2->fetch(PDO::FETCH_OBJ);
	$champeq2 = $ligne->num;

	if ($champarb == $champeq1 || $req == $champeq2) {
		echo 'false';
	}else{
		echo 'true';
	}


}catch (PDOException $e) {
	print("Erreur !: " . $e->getMessage());
	die();
}

?>