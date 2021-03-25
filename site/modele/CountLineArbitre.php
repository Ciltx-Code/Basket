<?php
try{
    include "../modele/bd_connexion.php";
    $cnx = connexionPDO();

    $nom = $_POST['nom'];
    $equipe1 = $_POST['equipe1'];
    $equipe2 = $_POST['equipe2'];

    $req = $cnx->prepare("Select count(num_arbitre) as ligneArbitre from arbitre");
    $req->execute();
    $ligne = $req->fetch(PDO::FETCH_OBJ);
    $compteTotal = $ligne->ligneArbitre;


    echo'$compteTotal';


}catch (PDOException $e) {
    print("Erreur !: " . $e->getMessage());
    die();
}

?>