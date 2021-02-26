<?php 
include "./vue/entete.html.php";
?>
<h2>Formulaire Hello</h2>
<div  class="form">
	<form class="form_content" action="./?action=hello" method="POST">

		<div class="container">
			<input type="text" name="nom" placeholder="Saisir un nom" value="<?= $_POST["nom"] ?>" /><br />
			
			<input type="submit" class="initbtn" name ="btn" value="Initialiser" />
			<input type="submit"  class="btn" name ="btn" value="Enregistrer" />



			<?php
			if ($message != "") { ?>
				<div class="alert success"> 
					<?= $message ?>.
				</div>
			<?php } ?>

			<?php
			if ($erreur != "") { ?>
				<div class="alert warning">
					<?= $erreur ?>
				</div>
			<?php } ?>

		</div>
	</div>
</form>
<?php 
include "./vue/pied.html.php";
?>
