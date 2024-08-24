<?php
$dsn = 'oci:dbname=//localhost:1521/orcl'; 
$username = 'ADMIN';
$password = '1234';

try {
    $conn = new PDO($dsn, $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexión exitosa";
} catch (PDOException $e) {
    die("Error de conexión: " . $e->getMessage());
}   
?>
