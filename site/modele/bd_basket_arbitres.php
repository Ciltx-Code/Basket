<?php
include"bd_connexion.php";
function getMatchs(){
	try{
		$cnx = connexionPDO();
		$req = $cnx->prepare("SELECT m.num_match, s.adresse_salle, m.date_match, m.heure_match, m.montant_déplt_p, m.montant_déplt_s FROM matchs m JOIN salle s ON m.num_salle = s.num_salle");
		$req->execute();

		$resultat = $req;
	} catch (PDOException $e) {
		print("Erreur !: " . $e->getMessage());
		die();
	}
	return $resultat;
}

?>