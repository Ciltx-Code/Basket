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

		<div class="login-popup">
			<div class="popupFormCategorie" id="popupFormCat">

				<form action="" class="form-container" method="GET">
					<h2>Veuillez entrer les informations suivantes :</h2>
					<input type="hidden" name="action" value="categorie">
					<label for="nc">
						<strong>Nom de catégorie</strong><br/>
					</label>
					<input type="text" id="nomcat" value="<?php echo $_GET['nomcat']; ?>" placeholder="Nom de categorie" name="nomcat" required><br/>
					<label for="mtn">
						<strong>Montant de l'indéminité</strong>
					</label>
					<input type="text" id="mtnindemnite" value="<?php echo $_GET['mtnindemnite']; ?>" placeholder="Montant" name="mtnindemnite" required>

					<input type="submit" name="btn" class="btn" value="Enregistrer">
					<input type="button" class="btn cancel" value="Annuler" onclick="closeFormCategorie()">
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


