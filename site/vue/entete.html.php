<?php
session_start( ) ;
?>
<div class="background" id="background">
	<div class="entete" id="entete">
		<a class="logo" href="../site"><img href="../site" src="../site/images/ffbb_icone.jpg"></a>

		<nav>
			<ul>
                <?php
                if(isset($_SESSION["id"])){
                ?>
                    <li>Bienvenue <?php echo $_SESSION["username"]?></li>
                    <li><a href="./">Accueil</a></li>
                    <li><a href="?action=arbitres">Arbitres</a></li>
                    <li><a href="?action=categorie">Catégories</a></li>
                    <li><?php echo $_SESSION["username"]; ?>
                        <ul>
                            <li>Mon Profil</li>
                            <li>Paramètres</li>
                            <li>Deconnexion</li>
                        </ul>
                    </li>
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