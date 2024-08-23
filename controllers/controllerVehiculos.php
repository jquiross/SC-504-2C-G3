<?php

include_once 'config/conexion.php';

try {
    // Conectar a la base de datos Oracle
    $conn = new PDO("oci:dbname=//localhost:1521/orcl", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Verificar si el formulario ha sido enviado   
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $accion = $_POST['accion'];

        if ($accion === 'agregar') {
            agregarVehiculo($conn, $_POST);
        } elseif ($accion === 'editar') {
            editarVehiculo($conn, $_POST);
        } elseif ($accion === 'eliminar') {
            eliminarVehiculo($conn, $_POST);
        } elseif ($accion === 'consultar') {
            consultarVehiculos($conn);
        }
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

function agregarVehiculo($conn, $data) {
    try {
        $stmt = $conn->prepare("BEGIN AgregarVehiculo(:p_id_vehiculo, :p_modelo, :p_marca, :p_ano, :p_precio, :p_estado, :p_color, :p_vin, :p_categoria_id, :p_proveedor_id, :p_foto_url, :p_id_auditoria); END;");
        $stmt->bindParam(':p_id_vehiculo', $data['p_id_vehiculo']);
        $stmt->bindParam(':p_modelo', $data['p_modelo']);
        $stmt->bindParam(':p_marca', $data['p_marca']);
        $stmt->bindParam(':p_ano', $data['p_ano']);
        $stmt->bindParam(':p_precio', $data['p_precio']);
        $stmt->bindParam(':p_estado', $data['p_estado']);
        $stmt->bindParam(':p_color', $data['p_color']);
        $stmt->bindParam(':p_vin', $data['p_vin']);
        $stmt->bindParam(':p_categoria_id', $data['p_categoria_id']);
        $stmt->bindParam(':p_proveedor_id', $data['p_proveedor_id']);
        $stmt->bindParam(':p_foto_url', $data['p_foto_url']);
        $stmt->bindParam(':p_id_auditoria', $data['p_id_auditoria']);
        $stmt->execute();
        echo "Vehículo agregado exitosamente.";
    } catch (PDOException $e) {
        echo "Error al agregar vehículo: " . $e->getMessage();
    }
}

function editarVehiculo($conn, $data) {
    try {
        $stmt = $conn->prepare("BEGIN ActualizarVehiculo(:p_id_vehiculo, :p_modelo, :p_marca, :p_ano, :p_precio, :p_estado, :p_color, :p_vin, :p_categoria_id, :p_proveedor_id, :p_foto_url, :p_id_auditoria); END;");
        $stmt->bindParam(':p_id_vehiculo', $data['p_id_vehiculo']);
        $stmt->bindParam(':p_modelo', $data['p_modelo']);
        $stmt->bindParam(':p_marca', $data['p_marca']);
        $stmt->bindParam(':p_ano', $data['p_ano']);
        $stmt->bindParam(':p_precio', $data['p_precio']);
        $stmt->bindParam(':p_estado', $data['p_estado']);
        $stmt->bindParam(':p_color', $data['p_color']);
        $stmt->bindParam(':p_vin', $data['p_vin']);
        $stmt->bindParam(':p_categoria_id', $data['p_categoria_id']);
        $stmt->bindParam(':p_proveedor_id', $data['p_proveedor_id']);
        $stmt->bindParam(':p_foto_url', $data['p_foto_url']);
        $stmt->bindParam(':p_id_auditoria', $data['p_id_auditoria']);
        $stmt->execute();
        echo "Vehículo actualizado correctamente.";
    } catch (PDOException $e) {
        echo "Error al actualizar vehículo: " . $e->getMessage();
    }
}

function eliminarVehiculo($conn, $data) {
    try {
        $stmt = $conn->prepare("BEGIN EliminarVehiculo(:p_id_vehiculo); END;");
        $stmt->bindParam(':p_id_vehiculo', $data['p_id_vehiculo']);
        $stmt->execute();
        echo "Vehículo eliminado exitosamente.";
    } catch (PDOException $e) {
        echo "Error al eliminar vehículo: " . $e->getMessage();
    }
}

function consultarVehiculos($conn) {
    try {
        $stmt = $conn->query("BEGIN MostrarVehiculos(); END;");
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "ID: " . $row['ID_VEHICULO'] . " - Modelo: " . $row['MODELO'] . " - Marca: " . $row['MARCA'] . " - Año: " . $row['ANO'] . " - Precio: " . $row['PRECIO'] . " - Estado: " . $row['ESTADO'] . " - Color: " . $row['COLOR'] . " - VIN: " . $row['VIN'] . " - Categoría ID: " . $row['CATEGORIA_ID'] . " - Proveedor ID: " . $row['PROVEEDOR_ID'] . " - Foto URL: " . $row['FOTO_URL'] . " - ID Auditoría: " . $row['ID_AUDITORIA'] . "<br>";
        }
    } catch (PDOException $e) {
        echo "Error al consultar vehículos: " . $e->getMessage();
    }
}
?>
