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
        echo "Erreurs";
    }

    else {
        echo "Pas d'erreurs";
    }


}

else {
    echo "Je ne vient pas du formulaire";
    include "formRegistration.php";
}

