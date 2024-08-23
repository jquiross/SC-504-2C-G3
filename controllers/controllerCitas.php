<?php
include './config/conexion.php'; 

function conexion() {
    try {
        $conn = new PDO("oci:dbname=//localhost:1521/XE", 'usuario', 'contraseña');
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    } catch (PDOException $e) {
        die("Error de conexión: " . $e->getMessage());
    }
}


function agregarCita($id_cita, $cliente_id, $usuario_id, $vehiculo_id, $fecha_hora, $tipo, $estado) {
    $conn = conexion();
    $sql = 'BEGIN AgregarCita(:id_cita, :cliente_id, :usuario_id, :vehiculo_id, :fecha_hora, :tipo, :estado); END;';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id_cita', $id_cita);
        $stmt->bindParam(':cliente_id', $cliente_id);
        $stmt->bindParam(':usuario_id', $usuario_id);
        $stmt->bindParam(':vehiculo_id', $vehiculo_id);
        $stmt->bindParam(':fecha_hora', $fecha_hora);
        $stmt->bindParam(':tipo', $tipo);
        $stmt->bindParam(':estado', $estado);
        $stmt->execute();
        echo "Cita agregada exitosamente.";
    } catch (PDOException $e) {
        echo "Error al agregar cita: " . $e->getMessage();
    }   
}

function editarCita($id_cita, $cliente_id, $usuario_id, $vehiculo_id, $fecha_hora, $tipo, $estado) {
    $conn = conexion();
    $sql = 'BEGIN EditarCita(:id_cita, :cliente_id, :usuario_id, :vehiculo_id, :fecha_hora, :tipo, :estado); END;';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id_cita', $id_cita);
        $stmt->bindParam(':cliente_id', $cliente_id);
        $stmt->bindParam(':usuario_id', $usuario_id);
        $stmt->bindParam(':vehiculo_id', $vehiculo_id);
        $stmt->bindParam(':fecha_hora', $fecha_hora);
        $stmt->bindParam(':tipo', $tipo);
        $stmt->bindParam(':estado', $estado);
        $stmt->execute();
        echo "Cita actualizada correctamente.";
    } catch (PDOException $e) {
        echo "Error al actualizar cita: " . $e->getMessage();
    }
}

function eliminarCita($id_cita) {
    $conn = conexion();
    $sql = 'BEGIN EliminarCita(:id_cita); END;';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id_cita', $id_cita);
        $stmt->execute();
        echo "Cita eliminada correctamente.";
    } catch (PDOException $e) {
        echo "Error al eliminar cita: " . $e->getMessage();
    }
}

function obtenerCitas() {
    $conn = conexion();
    $sql = 'SELECT * FROM citas';
    try {
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $citas = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $citas;
    } catch (PDOException $e) {
        echo "Error al obtener citas: " . $e->getMessage();
    }
}
?>