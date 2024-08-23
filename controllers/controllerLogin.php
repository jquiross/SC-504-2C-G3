<?php

include_once './config/conexion.php';
// Verificar si el formulario ha sido enviado
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['btningresar'])) {
    // Recoger los datos del formulario
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $password = isset($_POST['password']) ? trim($_POST['password']) : '';

    // Verificar que los datos no estén vacíos
    if (!empty($email) && !empty($password)) {
        try {

            $stmt = $conn->prepare("BEGIN validar_usuario(:email, :password, :valido, :rol); END;");

            // Vincular los parámetros
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $password);
            $stmt->bindParam(':valido', $valido, PDO::PARAM_INT | PDO::PARAM_INPUT_OUTPUT, 1);
            $stmt->bindParam(':rol', $rol, PDO::PARAM_INT | PDO::PARAM_INPUT_OUTPUT, 1);

            // Ejecutar el procedimiento
            $stmt->execute();

            // Verificar si las credenciales son válidas
            if ($valido == 1) {
                // Iniciar sesión y redirigir según el rol del usuario
                session_start();
                $_SESSION['email'] = $email;
                $_SESSION['rol'] = $rol;

                // Redirigir según el rol
                if ($rol == 1) {
                    header("Location: indexDashBoard.php"); // Rol de administrador
                } else {
                    header("Location: login.php"); // Rol de usuario regular
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
