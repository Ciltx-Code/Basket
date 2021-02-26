function preloadImages(){
	document.body.style.backgroundImage="url('images/Blur_Background.png')";
	document.body.style.backgroundImage="url('images/Background.png')";
}

function openForm() {
    document.getElementById("popupForm").style.display="block";
    document.body.style.backgroundImage="url('images/Blur_Background.png')";
    document.getElementById("entete").style.filter="blur(2px)";
    document.getElementById("accueil").style.filter="blur(2px)";
    document.getElementById("pied").style.filter="blur(2px)";

}

function closeForm() {
    document.getElementById("popupForm").style.display="none";
    document.body.style.backgroundImage="url('images/Background.png')";
    document.getElementById("entete").style.filter="blur(0px)";
    document.getElementById("accueil").style.filter="blur(0px)";
    document.getElementById("pied").style.filter="blur(0px)";
}