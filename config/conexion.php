<?php

$dsn = 'oci:dbname=//localhost:1521/orcl'; 
$username = 'SYSTEM'; 
$password = 'Jeremy1234'; 

try {

    $conn = new PDO($dsn, $username, $password);
    

    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


    echo "Conexión exitosa a la base de datos Collection Garage.";
} catch (PDOException $e) {

    echo "Error al conectar a la base de datos: " . $e->getMessage();
    exit;
}
?>
