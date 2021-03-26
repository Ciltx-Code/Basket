//Liste Déroulante
function Afficher() {
    if(document.getElementById("myDropdown").style.display=="block"){
        document.getElementById("myDropdown").style.display="none";
    } else {
        document.getElementById("myDropdown").style.display="block";
    }
}


//Gestion De Formulaires
function openForm(form) {
    document.getElementById(form).style.display="block";
    document.getElementById("background").style.filter="blur(2px)";
    document.getElementById(form).style.filter="blur(0px)";
    document.body.style.pointerEvents="none";
    document.getElementById(form).style.pointerEvents="all";
}

function closeForm(form) {
    document.getElementById(form).style.display="none";
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
    document.body.style.pointerEvents="none";
    document.getElementById("popupFormMatchModSuppr").style.pointerEvents="all";
    disable('choixEquipe1Mod','choixEquipe2Mod');
    disable('choixEquipe2Mod','choixEquipe1Mod');
    disable('choixArbitre1Mod','choixArbitre2Mod');
    disable('choixArbitre2Mod','choixArbitre1Mod');
}

//Check Championnat et Club des Arbitres

function checkGlobal(Arb1, Arb2, Eq1, Eq2, Err){
    $.post('modele/CountLineArbitre.php',function(donnees){
        var nb = parseInt(donnees);

        for (var i = 1; i <=nb; i++) {
            document.getElementById(Arb1).options[i].disabled=false;
            checkChampArbitre(Arb1, Arb2, Eq1, Eq2, Err,i);
            checkClubArbitre(Arb1, Arb2, Eq1, Eq2, Err,i);
        }
    });
}

function checkChampArbitre(Arb1, Arb2, Eq1, Eq2, Err,i){
    var nom = i;
    var equipe1 = $("." + Eq1).val();
    var equipe2 = $("." + Eq2).val();
    $.post('modele/AjaxFunction.php', {nom:nom,equipe1:equipe1,equipe2:equipe2},function(donnees){
        var result = donnees;
        if(result=='false'){
            if(i == document.getElementById(Arb1).selectedIndex || i == document.getElementById(Arb2).selectedIndex){
                document.getElementById(Arb1).selectedIndex = 0;
            }
            if(i == document.getElementById(Arb2).selectedIndex){
                document.getElementById(Arb2).selectedIndex = 0;
            }
            //document.getElementById(Arb2).options[document.getElementById(Arb1).options[i].disabled =true;
            document.getElementById(Arb1).options[i].disabled=true;
            document.getElementById(Arb2).options[i].disabled=true;
            //document.getElementById(Arb1).options[document.getElementById(Arb2).options[i].disabled =true;

        }

    });
}


function checkClubArbitre(Arb1, Arb2, Eq1, Eq2, Err,i){

    var nom = i;
    var equipe1 = $('.' + Eq1).val();
    var equipe2 = $('.' + Eq2).val();
    $.post('modele/AjaxRegleGestionClubArbitre.php', {nom:nom,equipe1:equipe1,equipe2:equipe2},function(donnees){
        var result = donnees;
        if(result=='false'){
            if(i == document.getElementById(Arb1).selectedIndex){
                document.getElementById(Arb1).selectedIndex = 0;
            }
            if(i == document.getElementById(Arb2).selectedIndex){
                document.getElementById(Arb2).selectedIndex = 0;
            }
            //document.getElementById(Arb2).options[document.getElementById(Arb1).selectedIndex].disabled =true;
            //document.getElementById(Arb1).options[document.getElementById(Arb2).selectedIndex].disabled =true;
            document.getElementById(Arb1).options[i].disabled=true;
            document.getElementById(Arb2).options[i].disabled=true;

        }
    });
}

function disable(equipe1, equipe2){
    var input = document.getElementById(equipe1).selectedIndex;
    var opts = document.getElementById(equipe2).options;
    for (var opt, j = 0; opt = opts[j]; j++) {
        if (j==0) {
            document.getElementById(equipe2).options[j].disabled=true;
        }else{
            document.getElementById(equipe2).options[j].disabled=false;
        }
        
    }
    document.getElementById(equipe2).options[input].disabled=true;
}