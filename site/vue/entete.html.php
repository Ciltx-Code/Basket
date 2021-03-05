<div class="background" id="background">
	<div class="entete" id="entete">
		<a class="logo" href="../site"><img href="../site" src="../site/images/ffbb_icone.jpg"></a>

		<nav>
			<ul>
                <?php
                session_start( ) ;
                echo $_SESSION["id"];
                if(isset($_SESSION["id"])){
                ?>
                    <li>Bienvenue <?php echo $_SESSION["id"]?></li>
                    <li><a href="./">Accueil</a></li>
                    <li><a href="?action=arbitres">Arbitres</a></li>
                    <li><a href="?action=categorie">Catégories</a></li>
                    <li><a>Deconnexion</a></li>
                    <?php
                }else{
                ?>
                    <li><a href="./">Accueil</a></li>
                    <li><a href="?action=arbitres">Arbitres</a></li>
                    <li><a href="?action=categorie">Catégories</a></li>
                    <li><a onclick="openForm()">Connexion</a></li>
                <?php
                }
                ?>
			</ul>
		</nav>
	</div>