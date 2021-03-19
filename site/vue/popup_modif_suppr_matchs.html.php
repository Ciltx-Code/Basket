<div class="login-popup">
	<div class="popupFormMatchModifSuppr" id="popupFormMatchModSuppr">

		<form action="" class="form-container" method="post">
			<h2>Veuillez entrer les informations suivantes :</h2>
			<input type="hidden" name="action" value="matchs">
			<input type="hidden" id="numMatch" name="num" value="">
			<label for="mtn">
				<strong>Adresse de la salle</strong>
			</label><br/>
			<select name="choixSalle" value="" id="choixSalleMod" class ="liste">
				<option disabled selected value="">--Choisir la salle--</option>
				<?php 
				$salles = getSalles();
				while($ligne = $salles -> fetch(PDO::FETCH_OBJ)){
					?>
					<option value="<?php echo $ligne->num_salle ?>"> <?php echo $ligne->adresse_salle ?> </option>

					<?php
				}
				?>
			</select><br/><br/>
			<label for="mtn">
				<strong>Date du match</strong>
			</label><br/>
			<input type="date" id="dateMod" value="" name="date" required><br/><br/>
			<input type="time" id="heureMod" value="" name="heure" required><br/><br/>
			

			<label for="mtn">
				<strong>Selectionner l'équipe 1</strong>
			</label>
			<label for="mtn">
				<strong>Selectionner l'équipe 2</strong>
			</label><br/>
			<select onchange="disable(1)" required name="choixEquipe1" id="choixEquipe1Mod" class ="listeEquipe1Mod">
				<option disabled selected value="">--Choisir une équipe--</option>
				<?php 
				$equipe = getEquipe();
				while($ligne = $equipe -> fetch(PDO::FETCH_OBJ)){
					?>
					<option value="<?php echo $ligne->num_equipe ?>"> <?php echo $ligne->nom_equipe ?> </option>

					<?php
				}
				?>
			</select>
			<select onchange="disable(2)" required name="choixEquipe2" id="choixEquipe2Mod" class ="listeEquipe2Mod">
				<option disabled selected value="">--Choisir une équipe--</option>
				<?php 
				$equipe = getEquipe();
				while($ligne = $equipe -> fetch(PDO::FETCH_OBJ)){
					?>
					<option value="<?php echo $ligne->num_equipe ?>"> <?php echo $ligne->nom_equipe ?> </option>

					<?php
				}
				?>
			</select><br/><br/>

			<label for="mtn">
				<strong>Selectionner l'arbitre 1</strong>
			</label><br/>
			<select onchange="disable(3), ajax(3)" required name="arbitre1" id="choixArbitre1Mod" class ="liste">
				<option disabled selected value="">--Choisir un arbitre--</option>
				<?php 
				$equipe = getArbitre();
				while($ligne = $equipe -> fetch(PDO::FETCH_OBJ)){
					?>
					<option value="<?php echo $ligne->num_arbitre ?>"> <?php echo $ligne->nom_arbitre ?>  <?php echo $ligne->prenom_arbitre; ?></option>

					<?php
				}
				?>
			</select>
			<p id="erreur3" class="erreur3">Erreur, cet arbitre ne peut pas être séléctionné</p>
			<input type="text" name="mtn1" value="" id="mtn1Mod" placeholder="montant de l'indemnité">

			<label for="mtn">
				<strong>Selectionner l'arbitre 2</strong>
			</label><br/>
			<select onchange="disable(4), ajax(4)" required name="arbitre2" id="choixArbitre2Mod" class ="liste">
				<option disabled selected value="">--Choisir un arbitre--</option>
				<?php 
				$equipe = getArbitre();
				while($ligne = $equipe -> fetch(PDO::FETCH_OBJ)){
					?>
					<option value="<?php echo $ligne->num_arbitre ?>"> <?php echo $ligne->nom_arbitre ?>  <?php echo $ligne->prenom_arbitre; ?></option>

					<?php
				}
				?>
			</select><br/><br/>
			<p id="erreur4" class="erreur4">Erreur, cet arbitre ne peut pas être séléctionné</p>
			<input type="text" name="mtn2" value="" id="mtn2Mod" placeholder="montant de l'indemnité">

			<input type="submit" name="btn" class="btnmodifsuppr" value="Modifier">
			<input type="submit" name="btn" class="btnmodifsuppr" value="Supprimer">
			<input type="button" class="btn cancel" value="Annuler" onclick="closeFormMatchModif()">
		</form>
	</div>
</div>