<?php
include "jvdb.php";
//conexió con la base de datos
$conexion = new JVDB("crm");

// Se crean las tablas clientes y productos, y se insertan datos en ellas
$conexion->peticion("CREATE TABLE clientes (id,nombre,apellidos,email,telefono)");
$conexion->peticion('INSERT INTO clientes VALUES ("1","Emilio","Cifuentes","info@emiliocifuentes.com","655232547")');    
$conexion->peticion("CREATE TABLE productos (id,nombreproducto,precio,dimensiones)");
$conexion->peticion('INSERT INTO productos VALUES ("3","ratones","25","8x5x6")'); 

// Se obtienen los datos de la tabla clientes y se ordenan por apellidos en orden ascendente
$datos = $conexion->peticion("SELECT * FROM clientes ORDER BY apellidos ASC");

// Se crea una tabla HTML para mostrar los datos obtenidos de la tabla clientes
echo '<table border="1">';
echo "<tr><td>nombre</td><td>apellidos</td><td>telefono</td><td>email</td></tr>";
for($i = 0;$i<count($datos);$i++){
    echo "<tr><td>".$datos[$i]['nombre']."</td><td>".$datos[$i]['apellidos']."</td><td>".$datos[$i]['telefono']."</td><td>".$datos[$i]['email']."</td></tr>";
}
// Saca por pantalla la el contenido de la tabla
echo "</table>";

// Se vuelve a obtener los datos de la tabla clientes y se ordenan por apellidos en orden ascendente
$datos = $conexion->peticion("SELECT * FROM clientes ORDER BY apellidos ASC");
echo '<table border="1">';
echo "<tr><td>nombre</td><td>apellidos</td><td>telefono</td><td>email</td></tr>";
for($i = 0;$i<count($datos);$i++){
    echo "<tr><td>".$datos[$i]['nombre']."</td><td>".$datos[$i]['apellidos']."</td><td>".$datos[$i]['telefono']."</td><td>".$datos[$i]['email']."</td></tr>";
}
echo "</table>";

?>
