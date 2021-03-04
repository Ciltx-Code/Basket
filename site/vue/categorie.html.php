	<div class="categorie">
		<?php

		echo "<div class='table_categorie'><table> <tr> 
		<td>Numéro de catégorie</td>
		<td>Nom de catégorie</td>
		<td>Montant de l'indémnité</td></tr>";


		$listeCategories = getCategories();
		while($ligne = $listeCategories -> fetch(PDO::FETCH_OBJ)){
			echo "<tr>";
			echo "<td>$ligne->num_catégorie </td>";
			echo "<td>$ligne->nom_catégorie </td>";
			echo "<td>$ligne->montant_indemnité €</td>";
			echo "</tr>";
		}
		echo "</table></div>";
		?>

		<div class="button_categorie">
			<button type="submit" onclick="openFormCategorie()" class="btn">Ajouter une catégorie</button>
			<button type="submit" class="btn">Modifier une catégorie</button>
			<button type="submit" class="btn">Supprimer une catégorie</button>
		</div>

		<div class="login-popup">
			<div class="popupFormCategorie" id="popupFormCat">
				<form action="index.php?action=enregistrercat" class="form-container" method="get">
					<h2>Veuillez entrer les informations suivantes :</h2>
					<label for="nc">
						<strong>Nom de catégorie</strong><br/>
					</label>
					<input type="text" id="nomcat" placeholder="Nom de categorie" name="nomcat" required><br/>
					<label for="mtn">
						<strong>Montant de l'indéminité</strong>
					</label>
					<input type="text" id="mtnindemnite" placeholder="Montant" name="mtnindemnite" required>
					<?php echo "<a href='?action=enregistrercat&nomcategorie=" . ['nomcat'] . "&mtn=" . $_GET['mtnindemnite'] . "'>";?>
					<button type="button" class="btn">Enregistrer</button></a>

					<button type="button" class="btn cancel" onclick="closeFormCategorie()">Annuler</button>
				</form>
			</div>

		</div>

		<div class="login-popup">
			<div class="form-popup" id="popupForm">
				<form action="/action_page.php" class="form-container">
					<h2>Veuillez vous connecter</h2>
					<label for="email">
						<strong>E-mail</strong><br/>
					</label>
					<input type="text" id="email" placeholder="Votre Email" name="email" required><br/>
					<label for="psw">
						<strong>Mot de passe</strong>
					</label>
					<input type="password" id="psw" placeholder="Votre Mot de passe" name="psw" required>
					<button type="submit" class="btn">Connexion</button>
					<button type="button" class="btn cancel" onclick="closeForm()">Fermer</button>
				</form>
			</div>

		</div>


