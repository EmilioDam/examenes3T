<?php
session_start();
/*echo "Que sepas que el usuario que has enviado es ".$_POST['usuario']."<br>";
echo "Que sepas que el password que has enviado es ".$_POST['contrasena']."<br>";
*/
//ABRO LA CONEXIÓN CON LA BASE DE DATYOS
$enlace = mysqli_connect("localhost", "cursoaplicacionesweb","cursoaplicacionesweb","cursoaplicacionesweb2");

//LE PIDO ALGO A LA BASE DE DATOS
$peticion = "

SELECT * FROM usuarios
WHERE
usuario = '".$_POST['usuario']."'
AND
password = '".$_POST['contrasena']."'
LIMIT 1

";
$resultado = mysqli_query($enlace,$peticion );

$pasas = false;
$_SESSION['pasas'] = false;

// DEVUELVO POR PANTALLA LO QUE ME DE
if ($fila = $resultado->fetch_assoc()) {
    //echo $fila['nombre']." ".$fila['apellidos']."<br>";
    $pasas = true;
    $_SESSION['nombre'] = $fila['nombre'];
    $_SESSION['apellidos'] = $fila['apellidos'];
}else{
    //echo "No hay ningún usuario que cumpla esas caracteristicas";
    $pases = false;
}

// VALIDAMOS
if($pasas){
    echo "Te voy a dar acceso a la aplicacion";
    $_SESSION['pasas'] = true;
    
    echo '<meta http-equiv="refresh"
    content="3; url=escritorio.php">';
} else{
    $_SESSION['pasas'] = false;
    echo "No te voy a dar acceso a la aplicacion";
    echo '<meta http-equiv="refresh"
    content="3; url=index.html">';
}

// CIERRO LOS RECURSOS QUE HAYA ABIERTO
mysqli_close($enlace);


?>