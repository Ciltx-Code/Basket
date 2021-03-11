/*function preloadImages() {
	document.body.style.backgroundImage="url('images/Blur_Background.png')";
	document.body.style.backgroundImage="url('images/Background.png')";
}*/

function openForm() {
    document.getElementById("popupForm").style.display="block";
    document.getElementById("background").style.filter="blur(2px)";
    document.getElementById("popupForm").style.filter="blur(0px)";
    document.body.style.pointerEvents="none";
    document.getElementById("popupForm").style.pointerEvents="all";
}

function closeForm() {
    document.getElementById("popupForm").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
    document.body.style.pointerEvents="all";
}

function openFormMatch(){
    document.getElementById("popupFormMatch").style.display="block";
    document.getElementById("background").style.filter="blur(2px)";
    document.getElementById("popupFormMatch").style.filter="blur(0px)";
}

function closeFormMatch(){
    document.getElementById("popupFormMatch").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
}


function openFormCategorie() {
    document.getElementById("popupFormCat").style.display="block";
    document.getElementById("background").style.filter="blur(2px)";
    document.getElementById("popupFormCat").style.filter="blur(0px)";

}

function closeFormCategorie() {
    document.getElementById("popupFormCat").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
}

function openFormCategorieModif(nom, mtn) {
    var element = document.form.select;
    for(var i = 0 ; i<element.length ; i++){
        if(element[i].checked){
            var check=element[i].value;
            break;
        }
    }
    document.getElementById('nomcat1').value=nom;
    document.getElementById('mtnindemnite1').value=mtn;
    document.getElementById('num').value=check;
    document.getElementById("popupFormCatModSuppr").style.display="block";
    document.getElementById("background").style.filter="blur(2px)";
    document.getElementById("popupFormCatModSuppr").style.filter="blur(0px)";

}
function closeFormCategorieModif() {
    document.getElementById("popupFormCatModSuppr").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
}

function getValueConfirm(){
    var element = document.form.select;
    for(var i = 0 ; i<element.length ; i++){
        if(element[i].checked){
            var check=element[i].value;
            break;
        }
    }
    console.log(check);
}