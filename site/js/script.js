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
    document.body.style.pointerEvents="none";
    document.getElementById("popupFormMatch").style.pointerEvents="all";
}

function closeFormMatch(){
    document.getElementById("popupFormMatch").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
    document.body.style.pointerEvents="all";
}


function openFormCategorie() {
    document.getElementById("popupFormCat").style.display="block";
    document.getElementById("background").style.filter="blur(2px)";
    document.getElementById("popupFormCat").style.filter="blur(0px)";
    document.body.style.pointerEvents="none";
    document.getElementById("popupFormCat").style.pointerEvents="all";

}

function closeFormCategorie() {
    document.getElementById("popupFormCat").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
    document.body.style.pointerEvents="all";
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
    document.body.style.pointerEvents="none";
    document.getElementById("popupFormCatModSuppr").style.pointerEvents="all";

}
function closeFormCategorieModif() {
    document.getElementById("popupFormCatModSuppr").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
    document.body.style.pointerEvents="all";
}

function Afficher() {
    if(document.getElementById("myDropdown").style.display=="block"){
        document.getElementById("myDropdown").style.display="none";
    } else {
        document.getElementById("myDropdown").style.display="block";
    }
}

function openFormMatchModif(adresse, date, heure, equipe1, equipe2, arbitre1, arbitre2, mtn1, mtn2, num) {
    document.getElementById('choixSalleMod').selectedIndex=adresse;
    document.getElementById('dateMod').value=date;
    document.getElementById('heureMod').value=heure;
    document.getElementById('choixEquipe1Mod').selectedIndex=equipe1;
    document.getElementById('choixEquipe2Mod').selectedIndex=equipe2;
    document.getElementById('choixArbitre1Mod').selectedIndex=arbitre1;
    document.getElementById('choixArbitre2Mod').selectedIndex=arbitre2;
    document.getElementById('mtn1Mod').value=mtn1;
    document.getElementById('mtn2Mod').value=mtn2;
    document.getElementById('numMatch').value=num;
    document.getElementById("popupFormMatchModSuppr").style.display="block";
    document.getElementById("background").style.filter="blur(2px)";
    document.getElementById("popupFormMatchModSuppr").style.filter="blur(0px)";
    disable(5);
    disable(6);
    disable(7);
    disable(8);
}

function closeFormMatchModif() {
    document.getElementById("popupFormMatchModSuppr").style.display="none";
    document.getElementById("background").style.filter="blur(0px)";
}

function ajax(num){
    switch(num){
        case 1:
        var nom = document.getElementById('arbitre1').value;
        var equipe1 = $('.listeEquipe1').val();
        var equipe2 = $('.listeEquipe2').val();
        break;
        case 2 : 
        var nom = document.getElementById('arbitre2').value;
        var equipe1 = $('.listeEquipe1').val();
        var equipe2 = $('.listeEquipe2').val();
        break;
        case 3:
        var nom = document.getElementById('choixArbitre1Mod').value;
        var equipe1 = document.getElementById('choixEquipe1Mod').value;
        var equipe2 = document.getElementById('choixEquipe2Mod').value;
        break;
        case 4:
        var nom = document.getElementById('choixArbitre2Mod').value;
        var equipe1 = $('.listeEquipe1Mod').val();
        var equipe2 = $('.listeEquipe2Mod').val();
        break;

    }
    

    $.post('modele/AjaxFunction.php', {nom:nom,equipe1:equipe1,equipe2:equipe2},function(donnees){
        var result = donnees;
        console.log(result);
        switch(num){
            case 1:
            if(result=='false'){
                document.getElementById('erreur1').style.display = 'block';
                document.getElementById('arbitre2').options[document.getElementById('arbitre1').selectedIndex].disabled =false;
                document.getElementById('arbitre1').selectedIndex = 0;

            }else{
                document.getElementById('erreur1').style.display = 'none';
            }
            break;

            case 2:
            if(result=='false'){
                document.getElementById('erreur2').style.display = 'block';
                document.getElementById('arbitre1').options[document.getElementById('arbitre2').selectedIndex].disabled =false;
                document.getElementById('arbitre2').selectedIndex = 0;
            }else{
                document.getElementById('erreur2').style.display = 'none';
            }
            break;
            case 3:
            if(result=='false'){
                document.getElementById('erreur3').style.display = 'block';
                document.getElementById('choixArbitre2Mod').options[document.getElementById('choixArbitre1Mod').selectedIndex].disabled =false;
                document.getElementById('choixArbitre1Mod').selectedIndex = 0;

            }else{
                document.getElementById('erreur3').style.display = 'none';
            }
            break;

            case 4:
            if(result=='false'){
                document.getElementById('erreur4').style.display = 'block';
                document.getElementById('choixArbitre1Mod').options[document.getElementById('choixArbitre2Mod').selectedIndex].disabled =false;
                document.getElementById('choixArbitre2Mod').selectedIndex = 0;
            }else{
                document.getElementById('erreur4').style.display = 'none';
            }
            break;
        }
        
    });
    return false;
}

function ajax2(num){
    switch(num){
        case 1:
            var nom = document.getElementById('arbitre1').value;
            var equipe1 = $('.listeEquipe1').val();
            var equipe2 = $('.listeEquipe2').val();
            break;
        case 2 :
            var nom = document.getElementById('arbitre2').value;
            var equipe1 = $('.listeEquipe1').val();
            var equipe2 = $('.listeEquipe2').val();
            break;
        case 3:
            var nom = document.getElementById('choixArbitre1Mod').value;
            var equipe1 = document.getElementById('choixEquipe1Mod').value;
            var equipe2 = document.getElementById('choixEquipe2Mod').value;
            break;
        case 4:
            var nom = document.getElementById('choixArbitre2Mod').value;
            var equipe1 = $('.listeEquipe1Mod').val();
            var equipe2 = $('.listeEquipe2Mod').val();
            break;

    }
    $.post('modele/AjaxRègleGestionClubArbitre.php', {nom:nom,equipe1:equipe1,equipe2:equipe2},function(donnees){
        var result = donnees;
        console.log(result);
        switch(num){
            case 1:
                if(result=='false'){
                    document.getElementById('erreur1').style.display = 'block';
                    document.getElementById('arbitre2').options[document.getElementById('arbitre1').selectedIndex].disabled =false;
                    document.getElementById('arbitre1').selectedIndex = 0;

                }else{
                    document.getElementById('erreur1').style.display = 'none';
                }
                break;

            case 2:
                if(result=='false'){
                    document.getElementById('erreur2').style.display = 'block';
                    document.getElementById('arbitre1').options[document.getElementById('arbitre2').selectedIndex].disabled =false;
                    document.getElementById('arbitre2').selectedIndex = 0;
                }else{
                    document.getElementById('erreur2').style.display = 'none';
                }
                break;
            case 3:
                if(result=='false'){
                    document.getElementById('erreur3').style.display = 'block';
                    document.getElementById('choixArbitre2Mod').options[document.getElementById('choixArbitre1Mod').selectedIndex].disabled =false;
                    document.getElementById('choixArbitre1Mod').selectedIndex = 0;

                }else{
                    document.getElementById('erreur3').style.display = 'none';
                }
                break;

            case 4:
                if(result=='false'){
                    document.getElementById('erreur4').style.display = 'block';
                    document.getElementById('choixArbitre1Mod').options[document.getElementById('choixArbitre2Mod').selectedIndex].disabled =false;
                    document.getElementById('choixArbitre2Mod').selectedIndex = 0;
                }else{
                    document.getElementById('erreur4').style.display = 'none';
                }
                break;
        }

    });
}

function disable(num){
    switch(num){
        case 1:
        var input = document.getElementById('choixEquipe1').selectedIndex;
        var opts = document.getElementById('choixEquipe2').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('choixEquipe2').options[j].disabled=true;
            }else{
                document.getElementById('choixEquipe2').options[j].disabled=false;
            }
        }
        document.getElementById('choixEquipe2').options[input].disabled=true;
        break;

        case 2:
        var input = document.getElementById('choixEquipe2').selectedIndex;
        var opts = document.getElementById('choixEquipe1').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('choixEquipe1').options[j].disabled=true;
            }else{
                document.getElementById('choixEquipe1').options[j].disabled=false;
            }
        }
        document.getElementById('choixEquipe1').options[input].disabled=true;
        break;

        case 3:
        var input = document.getElementById('arbitre1').selectedIndex;
        var opts = document.getElementById('arbitre2').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('arbitre2').options[j].disabled=true;
            }else{
                document.getElementById('arbitre2').options[j].disabled=false;
            }
        }
        document.getElementById('arbitre2').options[input].disabled=true;
        break;

        case 4:
        var input = document.getElementById('arbitre2').selectedIndex;
        var opts = document.getElementById('arbitre1').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('arbitre1').options[j].disabled=true;
            }else{
                document.getElementById('arbitre1').options[j].disabled=false;
            }
        }
        document.getElementById('arbitre1').options[input].disabled=true;
        break;

        case 5:
        var input = document.getElementById('choixEquipe1Mod').selectedIndex;
        var opts = document.getElementById('choixEquipe2Mod').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('choixEquipe2Mod').options[j].disabled=true;
            }else{
                document.getElementById('choixEquipe2Mod').options[j].disabled=false;
            }
        }
        document.getElementById('choixEquipe2Mod').options[input].disabled=true;
        break;

        case 6:
        var input = document.getElementById('choixEquipe2Mod').selectedIndex;
        var opts = document.getElementById('choixEquipe1Mod').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('choixEquipe1Mod').options[j].disabled=true;
            }else{
                document.getElementById('choixEquipe1Mod').options[j].disabled=false;
            }
        }
        document.getElementById('choixEquipe1Mod').options[input].disabled=true;
        break;

        case 7:
        var input = document.getElementById('choixArbitre1Mod').selectedIndex;
        var opts = document.getElementById('choixArbitre2Mod').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('choixArbitre2Mod').options[j].disabled=true;
            }else{
                document.getElementById('choixArbitre2Mod').options[j].disabled=false;
            }
        }
        document.getElementById('choixArbitre2Mod').options[input].disabled=true;
        break;

        case 8:
        var input = document.getElementById('choixArbitre2Mod').selectedIndex;
        var opts = document.getElementById('choixArbitre1Mod').options;
        for (var opt, j = 0; opt = opts[j]; j++) {
            if (j==0) {
                document.getElementById('choixArbitre1Mod').options[j].disabled=true;
            }else{
                document.getElementById('choixArbitre1Mod').options[j].disabled=false;
            }
        }
        document.getElementById('choixArbitre1Mod').options[input].disabled=true;
        break;
    }



}