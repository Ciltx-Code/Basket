<div class="login-popup" id="login-popup">
    <div class="form-popup" id="popupForm">
        <form action="/verification.php" class="form-container" method="post" accept-charset='UTF-8'>
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