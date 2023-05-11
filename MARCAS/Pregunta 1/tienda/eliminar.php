<?php
include "../admin/conexiondb.php";    
    $peticion = "DELETE FROM ".$_GET['tabla']." WHERE Identificador = ".$_GET['id']."";
    mysqli_query($enlace,$peticion );
    echo '<meta http-equiv="refresh"
    content="3; url=index.php">';
    ?>