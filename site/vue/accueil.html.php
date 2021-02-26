	<div class="accueil">
		<h1>Accueil</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum posuere urna ac tellus sagittis ultricies. Proin elementum arcu et sapien ornare faucibus. Mauris varius lorem a ligula dapibus, sed congue purus porta. Pellentesque justo massa, blandit a ex ac, suscipit rutrum elit.</p>
	</div>
	<div class="login-popup">
		<div class="form-popup" id="popupForm">
			<form action="/action_page.php" class="form-container">
				<h2>Veuillez vous connecter</h2>
				<label for="email">
					<strong>E-mail</strong>
				</label>
				<input type="text" id="email" placeholder="Votre Email" name="email" required>
				<label for="psw">
					<strong>Mot de passe</strong>
				</label>
				<input type="password" id="psw" placeholder="Votre Mot de passe" name="psw" required>
				<button type="submit" class="btn">Connecter</button>
				<button type="button" class="btn cancel" onclick="closeForm()">Fermer</button>
			</form>
		</div>
	</div>