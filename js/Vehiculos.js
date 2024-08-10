const oracledb = require('oracledb');

// Configuración de la conexión a la base de datos
const dbConfig = {
  user: 'usuario',
  password: 'contraseña',
  connectString: 'el host y el puerto'
};

// Función para crear un nuevo vehículo
async function createVehiculo(modelo, marca, año, precio, estado, color, vin, categoriaId, proveedorId) {
  try {
    // Crear una conexión a la base de datos
    const connection = await oracledb.getConnection(dbConfig);

    // Crear un nuevo vehículo
    const result = await connection.execute(
      `INSERT INTO vehiculos (modelo, marca, año, precio, estado, color, vin, categoria_id, proveedor_id) 
       VALUES (:modelo, :marca, :año, :precio, :estado, :color, :vin, :categoriaId, :proveedorId) 
       RETURNING id INTO :id`,
      {
        modelo,
        marca,
        año,
        precio,
        estado,
        color,
        vin,
        categoriaId,
        proveedorId
      },
      {
        autoCommit: true
      }
    );

    // Devolver el ID del nuevo vehículo
    return result.outBinds.id;
  } catch (error) {
    console.error(error);
    throw error;
  } finally {
    // Cerrar la conexión a la base de datos
    if (connection) {
      try {
        await connection.close();
      } catch (error) {
        console.error(error);
      }
    }
  }
}

// Función para leer todos los vehículos
async function readVehiculos() {
  try {
    // Crear una conexión a la base de datos
    const connection = await oracledb.getConnection(dbConfig);

    // Leer todos los vehículos
    const result = await connection.execute(
      `SELECT * FROM vehiculos`
    );

    // Devolver la lista de vehículos
    return result.rows;
  } catch (error) {
    console.error(error);
    throw error;
  } finally {
    // Cerrar la conexión a la base de datos
    if (connection) {
      try {
        await connection.close();
      } catch (error) {
        console.error(error);
      }
    }
  }
}

// Función para actualizar un vehículo
async function updateVehiculo(id, modelo, marca, año, precio, estado, color, vin, categoriaId, proveedorId) {
  try {
    // Crear una conexión a la base de datos
    const connection = await oracledb.getConnection(dbConfig);

    // Actualizar el vehículo
    const result = await connection.execute(
      `UPDATE vehiculos 
       SET modelo = :modelo, marca = :marca, año = :año, precio = :precio, estado = :estado, color = :color, vin = :vin, categoria_id = :categoriaId, proveedor_id = :proveedorId 
       WHERE id = :id`,
      {
        id,
        modelo,
        marca,
        año,
        precio,
        estado,
        color,
        vin,
        categoriaId,
        proveedorId
      },
      {
        autoCommit: true
      }
    );

    // Devolver el número de filas afectadas
    return result.rowsAffected;
  } catch (error) {
    console.error(error);
    throw error;
  } finally {
    // Cerrar la conexión a la base de datos
    if (connection) {
      try {
        await connection.close();
      } catch (error) {
        console.error(error);
      }
    }
  }
}

// Función para eliminar un vehículo
async function deleteVehiculo(id) {
  try {
    // Crear una conexión a la base de datos
    const connection = await oracledb.getConnection(dbConfig);

    // Eliminar el vehículo
    const result = await connection.execute(
      `DELETE FROM vehiculos WHERE id = :id`,
      {
        id
      },
      {
        autoCommit: true
      }
    );

    // Devolver el número de filas afectadas
    return result.rowsAffected;
  } catch (error) {
    console.error(error);
    throw error;
  } finally {
    // Cerrar la conexión a la base de datos
    if (connection) {
      try {
        await connection.close();
      } catch (error) {
        console.error(error);
      }
    }
  }
}

// Función para buscar un vehículo por VIN
async function searchVehiculoByVin(vin) {
  try {
    // Crear una conexión a la base de datos
    const connection = await oracledb.getConnection(dbConfig);

    // Buscar el vehículo por VIN
    const result = await connection.execute(
      `SELECT * FROM vehiculos WHERE vin = :vin`,
      {
        vin
      }
    );

    // Devolver el vehículo encontrado
    return result.rows[0];
  } catch (error) {
    console.error(error);
    throw error;
  } finally {
    // Cerrar la conexión a la base de datos
    if (connection) {
      try {
        await connection.close();
      } catch (error) {
        console.error(error);
      }
    }
  }
}

// Exportar las funciones
module.exports = {
  createVehiculo,
  readVehiculos,
  updateVehiculo,
  deleteVehiculo,
  searchVehiculoByVin
};