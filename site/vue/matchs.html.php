<div class="arbitres">
	<?php

	echo "<div class='table_categorie' id='table_categorie'><table> <tr>
	<td></td> 
	<td>Adresse de la salle</td>
	<td>Date du match</td>
	<td>Heure du match</td>
	<td>Montant Déplacement Arbitre 1</td>
	<td>Montant Déplacement Arbitre 2</td></tr>";

	$listeMatchs = getMatchs();

	while($ligne = $listeMatchs -> fetch(PDO::FETCH_OBJ)){
		echo "<tr>";
		echo "<tr>";?>
		<td><input type='radio' name='select' value="<?php echo($ligne->num_match);?>"></td>
		<?php
		echo "<td>$ligne->adresse_salle</td>";
		echo "<td>$ligne->date_match</td>";
		echo "<td>$ligne->heure_match</td>";
		echo "<td>$ligne->montant_déplt_p</td>";
		echo "<td>$ligne->montant_déplt_s</td>";
		echo "</tr>";
	}
	echo "</table></div>";
	?>
	<div class="button_categorie">
		<button type="submit" id="blur" onclick="openFormMatch()" class="btn blur">Ajouter un match</button>
	</div>

</div>