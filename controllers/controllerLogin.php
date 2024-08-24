<?php

include_once './config/conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['btningresar'])) {
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $password = isset($_POST['password']) ? trim($_POST['password']) : '';


    if (!empty($email) && !empty($password)) {
        try {

            $conn = new PDO("oci:dbname=//localhost:1521/orcl", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $stmt = $conn->prepare("BEGIN validar_usuario(:email, :password, :valido, :rol); END;");


            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $password);
            $stmt->bindParam(':valido', $valido, PDO::PARAM_INT | PDO::PARAM_INPUT_OUTPUT, 1);
            $stmt->bindParam(':rol', $rol, PDO::PARAM_INT | PDO::PARAM_INPUT_OUTPUT, 1);


            $stmt->execute();


            if ($valido == 1) {

                session_start();
                $_SESSION['email'] = $email;
                $_SESSION['rol'] = $rol;


                if ($rol == 1) {
                    header("Location: indexDashBoard.php"); 
                } else {
                    header("Location: login.php"); 
                }
                exit;
            } else {
                $error = "Credenciales incorrectas.";
            }
        } catch (PDOException $e) {
            $error = "Error al conectar a la base de datos: " . $e->getMessage();
        }
    } else {
        $error = "Por favor, completa todos los campos.";
    }
}
?>
