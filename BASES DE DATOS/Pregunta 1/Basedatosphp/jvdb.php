<?php
// Declaramos la clase
class JVDB{
    // Declaramos un método constructor que recibe el nombre de la base de datos a la que conectarse    
    public function __construct($basededatos){
        // Establecemos la base de datos a la que se conectará
        $this->db = $basededatos;
        // Imprimimos un mensaje en pantalla que indica a qué base de datos nos hemos conectado
        echo "La base de datos que se ha seleccionado es: ".$this->db."<br>";
    }
    // Declaramos un método que procesa una consulta
    public function peticion($consulta){
        // Imprimimos un mensaje en pantalla que indica qué consulta se va a procesar
        echo "A continuacion vamos a procesar la siguiente consulta: ".$consulta."<br>";
        // Extraemos la primera, segunda y tercera palabra de la consulta para determinar qué tipo de consulta es
        $primerapalabra = explode(" ",$consulta)[0];
        $segundapalabra = explode(" ",$consulta)[1];
        $tercerapalabra = explode(" ",$consulta)[2];
        // Imprimimos un mensaje en pantalla que indica cuál es la primera palabra de la consulta
        echo "la primera palabra es: ".$primerapalabra."<br>";
        // Comparamos la primera palabra de la consulta con una serie de posibilidades usando un switch
        switch($primerapalabra){
            case "CREATE":
                // Si la primera palabra es CREATE, imprimimos un mensaje en pantalla que indica que se va a crear algo
                echo "Voy a crear algo<br>";
                // Si la segunda palabra es TABLE, se creará una nueva tabla
                if($segundapalabra == "TABLE"){
                    // Abrimos un archivo en modo "append" (añadir al final) en la carpeta correspondiente a la base de datos
                    // El nombre del archivo será el valor de la tercera palabra de la consulta, seguido de la extensión ".csv"
                    $myfile = fopen("db/".$this->db."/".$tercerapalabra.".csv", "a") or die("Unable to open file!");
                    // Extraemos el texto que se encuentra entre paréntesis en la consulta
                    $text = $consulta;
                    preg_match('#\((.*?)\)#', $text, $match);
                    print $match[1];
                    $txt = $match[1];
                    $campos = explode(",",$txt);
                    $cadenacampos = "";
                    for($i = 0;$i<count($campos);$i++){
                        $cadenacampos .= '"'.$campos[$i].'",';
                    }
                    $recortado = substr($cadenacampos, 0, -1);
                    fwrite($myfile, $recortado."\n");
                    fclose($myfile);
                  
                }
                break;
            case "INSERT":
                $tabla = explode(" ",$consulta)[2];
                $myfile = fopen("db/".$this->db."/".$tabla.".csv", "a") or die("Unable to open file!");
                $text = $consulta;
                preg_match('#\((.*?)\)#', $text, $match);
                    print $match[1];
                    $txt = $match[1];
                fwrite($myfile, $txt."\n");
                break;   
            case "SELECT":
                            $piezas = explode(" ",$consulta);
                            foreach( $piezas as $key => $value )
                            {
                                if($piezas[$key] == 'FROM' )
                                {
                                    $tabla = $piezas[$key+1];
                                    break;
                                }
                            }
                echo "la tabla es: ".$tabla."<br>";
                $array = [];
                $contador = 0;
                $file = fopen("db/".$this->db."/".$tabla.".csv", 'r');
                $line = fgetcsv($file); 
                $nombrescampo = $line;
                
                $file = fopen("db/".$this->db."/".$tabla.".csv", 'r');
                while (($line = fgetcsv($file)) !== FALSE){
                    
                    $array[$contador] = $line;
                    
                    for($i = 0;$i<count($line);$i++){
                        $array[$contador][$nombrescampo[$i]] = $line[$i];
                    }
                    $contador++;
                }
                fclose($file);
                return $array;
                break;
            case "DELETE":
                    $piezas = explode(" ",$consulta);
                    foreach( $piezas as $key => $value )
                            {
                                if($piezas[$key] == 'FROM' )
                                {
                                    $tabla = $piezas[$key+1];
                                    
                                    break;
                                }
                                
                            }
                    foreach( $piezas as $key => $value )
                        {
                                if($piezas[$key] == 'WHERE' )
                                {
                                    $campo = $piezas[$key+1];
                                    $valor = str_replace("'","",$piezas[$key+3]);
                                    break;
                                }
                            }
        
                            echo "De la tabla ".$tabla." Voy a borrar el campo ".$campo." 
                            cuyo valor sea ".$valor."<br>";
                           $array = [];
                           $contador = 0;
                           $file = fopen("db/".$this->db."/".$tabla.".csv", 'r');
                           $line = fgetcsv($file); 
                           $nombrescampo = $line;
                           $file = fopen("db/".$this->db."/".$tabla.".csv", 'r');
                           $file2 = fopen("db/".$this->db."/".$tabla."2.csv", 'w');
                           while (($line = fgetcsv($file)) !== FALSE){
                               $borra = "no";
                               $array[$contador] = $line;

                               for($i = 0;$i<count($line);$i++){
                                  $array[$contador][$nombrescampo[$i]] = $line[$i];
                                   if($nombrescampo[$i] == $campo && $line[$i] == $valor){
                                       $borra = "si";
                                   }else{
                                       
                                    
                                   }
                                }
                                $contador++;
                                 if($borra == "si"){
                                      echo "He encontrado una coincidencia<br>";
                                 }else{
                                     echo "No he encontrado una coincidencia<br>";

                                     foreach($line as $a) {
                                         fwrite($file2,'"'.$a.'",');
                                     }
                                     fwrite($file2, PHP_EOL);
                                 }
                            }
                            fclose($file);
                             fclose($file2);
               
                            unlink("db/".$this->db."/".$tabla.".csv");
                            rename("db/".$this->db."/".$tabla."2.csv", "db/".$this->db."/".$tabla.".csv");
                                
                            
                            break;
        }
    }
}

?>