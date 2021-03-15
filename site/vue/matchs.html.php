<div class="arbitres">
    <?php
    if(isset($_SESSION["id"])){
        echo "<div class='table_categorie' id='table_categorie'>
        <table> 
        <tr>
        <td></td> 
        <td>Adresse de la salle</td>
        <td>Date du match</td>
        <td>Heure du match</td>
        <td>Montant Déplacement Arbitre 1</td>
        <td>Montant Déplacement Arbitre 2</td></tr>";

        $listeMatchs = getMatchs();
        $count = 0;
        while($ligne = $listeMatchs -> fetch(PDO::FETCH_OBJ)){
            $numsalle = getSalleByAdresse($ligne->adresse_salle);
            $mtn1 = $ligne->montant_déplt_p;
            $mtn2 = $ligne->montant_déplt_s;
            echo "<tr>";?>
            <td>
                <input type='radio' name='select' 
                value="<?php echo($ligne->num_match);?>"
                onclick="openFormMatchModif('<?php echo($numsalle) ;?>', '<?php echo($ligne->date_match);?>', '<?php echo($ligne->heure_match);?>','<?php echo($ligne->num_equipe_1) ;?>','<?php echo($ligne->num_equipe_2) ;?>','<?php echo($mtn1);?>', '<?php echo($mtn2);?>')">
            </td>
            <?php

            echo "<td>$ligne->adresse_salle</td>";
            echo "<td>$ligne->date_match</td>";
            echo "<td>$ligne->heure_match</td>";
            echo "<td>$ligne->montant_déplt_p</td>";
            echo "<td>$ligne->montant_déplt_s</td>";
            echo "</tr>";
            $count++;
        }
        echo "</table></div>";
        ?>
        <div class="button_categorie">
            <button type="submit" id="blur" onclick="openFormMatch()" class="btn blur">Ajouter un match</button>
        </div>
    <?php }else{
        echo "<div class='table_categorie' id='table_categorie'>
        <table>
        <tr>
        <td>Adresse de la salle</td>
        <td>Date du match</td>
        <td>Heure du match</td>
        <td>Montant Déplacement Arbitre 1</td>
        <td>Montant Déplacement Arbitre 2</td></tr>";

        $listeMatchs = getMatchs();

        while($ligne = $listeMatchs -> fetch(PDO::FETCH_OBJ)){
            echo "</tr>";
            echo "<tr>";?>
            <?php
            echo "<td>$ligne->adresse_salle</td>";
            echo "<td>$ligne->date_match</td>";
            echo "<td>$ligne->heure_match</td>";
            echo "<td>$ligne->montant_déplt_p</td>";
            echo "<td>$ligne->montant_déplt_s</td>";
            echo "</tr>";
        }
        echo "</table></div>";
    }

    ?>
</div>