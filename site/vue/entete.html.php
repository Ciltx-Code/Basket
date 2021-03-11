<div class="background" id="background">
	<div class="entete" id="entete">
		<a class="logo" href="../site"><img href="../site" src="../site/images/ffbb_icone.jpg"></a>

		<nav>
			<ul>
                <?php
                session_start();
                if(isset($_SESSION["id"])){
                    ?>
                    <li><a href="./">Accueil</a></li>
                    <li><a href="?action=matchs">Matchs</a></li>
                    <li><a href="?action=categorie">Catégories</a></li>
                    <li class="deroulant" id="user"><?php echo $_SESSION["username"]; ?>
                        <ul class="sous">
                            <li><a>Mon profil</a></li><br>
                            <li><a>Paramètres</a></li><br>
                            <li><a>Déconnexion</a></li>
                        </ul>
                    </li>
                    <?php
                }else{
                ?>
                    <li><a href="./">Accueil</a></li>
                    <li><a href="?action=matchs">Matchs</a></li>
                    <li><a href="?action=categorie">Catégories</a></li>
                    <li><a onclick="openForm()">Connexion</a></li>
                <?php
                }
                ?>
			</ul>
		</nav>
	</div>