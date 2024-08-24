<?php

include_once './config/conexion.php'; 

function conexion() {
    try {
        $conn = new PDO("oci:dbname=//localhost:1521/XE", 'usuario', 'contraseña');
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        die("Error de conexión: " . $e->getMessage());
    }
}


function agregar_usuario($email, $password, $nombre, $apellido, $telefono, $direccion, $rol_id) {
    $conn = conexion();
    $sql = 'BEGIN AgregarUsuario(:email, :password, :nombre, :apellido, :telefono, :direccion, :rol_id); END;';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $password);
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':apellido', $apellido);
        $stmt->bindParam(':telefono', $telefono);
        $stmt->bindParam(':direccion', $direccion);
        $stmt->bindParam(':rol_id', $rol_id);
        $stmt->execute();
        echo "Usuario agregado exitosamente.";
    } catch (PDOException $e) {
        echo "Error al agregar usuario: " . $e->getMessage();
    }
}

function editar_usuario($id_usuario, $email, $password, $nombre, $apellido, $telefono, $direccion, $rol_id) {
    $conn = conexion();
    $sql = 'BEGIN EditarUsuario(:id_usuario, :email, :password, :nombre, :apellido, :telefono, :direccion, :rol_id); END;';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id_usuario', $id_usuario);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':password', $password);
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':apellido', $apellido);
        $stmt->bindParam(':telefono', $telefono);
        $stmt->bindParam(':direccion', $direccion);
        $stmt->bindParam(':rol_id', $rol_id);
        $stmt->execute();
        echo "Usuario actualizado correctamente.";
    } catch (PDOException $e) {
        echo "Error al actualizar usuario: " . $e->getMessage();
    }
}

function eliminar_usuario($id_usuario) {
    $conn = conexion();
    $sql = 'BEGIN EliminarUsuario(:id_usuario); END;';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id_usuario', $id_usuario);
        $stmt->execute();
        echo "Usuario eliminado exitosamente.";
    } catch (PDOException $e) {
        echo "Error al eliminar usuario: " . $e->getMessage();
    }
}

function mostrar_usuarios() {
    $conn = conexion();
    $sql = 'BEGIN MostrarUsuarios(); END;';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($result as $row) {
            echo "ID: " . $row['ID_USUARIO'] . " - Email: " . $row['EMAIL'] . " - Nombre: " . $row['NOMBRE'] . " - Apellido: " . $row['APELLIDO'] . " - Teléfono: " . $row['TELEFONO'] . " - Dirección: " . $row['DIRECCION'] . " - Rol ID: " . $row['ROL_ID'] . "<br>";
        }
    } catch (PDOException $e) {
        echo "Error al mostrar usuarios: " . $e->getMessage();
    }
}
?>
