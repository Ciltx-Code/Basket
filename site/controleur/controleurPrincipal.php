<?php

function controleurPrincipal($action){
    $lesActions = array();
    $lesActions["defaut"] = "hello.php";
    $lesActions["hello"] = "hello.php";

    
    if (array_key_exists ( $action , $lesActions )){
        return $lesActions[$action];
    }
    else{
        return $lesActions["defaut"];
    }

}

?>