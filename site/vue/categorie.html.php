		<div class="categorie">
			<?php

			echo "<div class='table_categorie' id='table_categorie'><table> <tr> 
			<td>Selection</td>
			<td>Nom de catégorie</td>
			<td>Montant de l'indémnité</td></tr>";


			$listeCategories = getCategories();
			echo "<form name='form' method='get'>";
			while($ligne = $listeCategories -> fetch(PDO::FETCH_OBJ)){
				echo "<tr>";
				echo "<td><input type='radio' name='select' value='$ligne->num_catégorie' onclick='getValueConfirm()'></td>";
				echo "<td>$ligne->nom_catégorie </td>";
				echo "<td>$ligne->montant_indemnité €</td>";
				echo "</tr>";
			}
			echo "</table></div></form>";
			?>

			<div class="button_categorie">
				<button type="submit" id="blur" onclick="openFormCategorie()" class="btn blur">Ajouter une catégorie</button>
				<button type="submit" id="blur2" class="btn blur" onclick="openFormCategorieModif()">Modifier une catégorie</button>
				<button type="submit" id="blur3" class="btn blur">Supprimer une catégorie</button>
			</div>

			
		</div>


