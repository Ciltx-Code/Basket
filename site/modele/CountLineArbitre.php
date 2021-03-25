<?php
try{
    include "../modele/bd_connexion.php";
    $cnx = connexionPDO();

    $req = $cnx->prepare("Select count(num_arbitre) as ligneArbitre from arbitre");
    $req->execute();
    $ligne = $req->fetch(PDO::FETCH_OBJ);
    $compteTotal = $ligne->ligneArbitre;


    echo $compteTotal;


}catch (PDOException $e) {
    print("Erreur !: " . $e->getMessage());
    die();
}

?>