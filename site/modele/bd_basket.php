<?php
function getCategories(){
	try{
		$cnx = connexionPDO();
		$req = $cnx->prepare("SELECT * FROM categorie");
		req->execute();

		$resultat = $req->fetch(PDO::FETCH_ASSOC)
	}catch{
		print("Erreur !: " . $e.getMessage());
		die()
	}
	return resultat;
}

function getCategorieByNum($NumCat){
	try{
		$cnx = connexionPDO();
		$req = $cnx->prepare("SELECT * FROM categorie WHERE numcategorie =?");
		req->bindValue(1, $NumCat);
		req->execute();

		$resultat = $req->fetch(PDO::FETCH_ASSOC)
	}catch{
		print("Erreur !: " . $e.getMessage());
		die()
	}
	return resultat;
}

function addCategorie($NomCat, $MontantIndemnite){
	try{
		$cnx = connexionPDO();
		$reqCat = $cnx->prepare("SELECT * FROM categorie");
		reqCat->execute();
		$num_of_rows = $reqCat->rowCount();
		$NumCat=num_of_rows+1;
		$req = $cnx->prepare("INSERT INTO categorie(numcategorie, nomcategorie, montantindemnite) values(?, ?, ?)");
		req->bindValue(1, $NumCat);
		req->bindValue(2, $NomCat);
		req->bindValue(3, $MontantIndemnite);
		req->execute();

		$resultat = $req->fetch(PDO::FETCH_ASSOC)
	}catch{
		print("Erreur !: " . $e.getMessage());
		die()
	}
	return resultat;
}

function updateCategorie($NumCat; $NomCat, $MontantIndemnite){
	try{
		$cnx = connexionPDO();
		$req = $cnx->prepare("UPDATE categorie SET numcategorie =? , nomcategorie = ?, montantindemnite = ?");
		req->bindValue(1, $NumCat);
		req->bindValue(2, $NomCat);
		req->bindValue(3, $MontantIndemnite);
		req->execute();

		$resultat = $req->fetch(PDO::FETCH_ASSOC)
	}catch{
		print("Erreur !: " . $e.getMessage());
		die()
	}
	return resultat;
}

function delCategorie($NumCat){
	try{
		$cnx = connexionPDO();
		$req = $cnx->prepare("DELETE FROM categorie WHERE numcategorie=?");
		req->bindValue(1, $NumCat);
		req->execute();

		$resultat = $req->fetch(PDO::FETCH_ASSOC)
	}catch{
		print("Erreur !: " . $e.getMessage());
		die()
	}
	return resultat;
}
}

?>