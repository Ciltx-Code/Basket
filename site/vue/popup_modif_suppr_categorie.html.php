<div class="login-popup">
	<div class="popupFormCategorieModifSuppr" id="popupFormCatModSuppr">

		<form action="" class="form-container" method="GET">
			<h2>Veuillez modifier les informations suivantes :</h2>
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