<h1>Iscription</h1>
<?php
if (isset($_POST['formRegistration'])) {

    $nom = $_POST['nom'] ?? "";
    $prenom = $_POST['prenom'] ?? "";
    $mail = $_POST['mail'] ?? "";
    $mdp = $_POST['mdp'] ?? "";


    $erreurs = array();

    if ($nom == "") array_push($erreurs, "Veuillez saisir votre nom");
    if ($prenom == "") array_push($erreurs, "Veuillez saisir votre prénom");
    if ($mail == "") array_push($erreurs, "Veuillez saisir votre mail");
    if ($mdp == "") array_push($erreurs, "Veuillez saisir votre mot de passe");

if(count($erreurs) > 0) {
       $message = "<ul>";

        for($i = 0; $i< count($erreurs) ; $i++ ){
            $message .= "<li>";
             $message .= $erreurs[$i];
            $message .= "</li>";

         }

    $message .= "</ul>";

    echo "$message";
    
    include "formRegistration.php";


    }

    else {
        echo "Pas d'erreurs";
    }


}

else {
    echo "Je ne viens pas du formulaire";
    include "formRegistration.php";
}

