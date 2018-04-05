<h1>Iscription</h1>
<?php
if (isset($_POST['formRegistration'])) {
    echo "Je viens du formulaire";
    include "formRegistration.php";
}

else {
    echo "Je ne vient pas du formulaire";
    include "formRegistration.php";
}

