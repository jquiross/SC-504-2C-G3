-- SCRIPT DE CREACION PARA PROYECTO DE LENGUAJES

-- Eliminar las tablas si ya existen

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE detalle_factura CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Auditoria_General CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE facturas CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE stock CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE vehiculos_ubicaciones CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE vehiculos CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE citas CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE pagos CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE financiamiento CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE ubicaciones CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE proveedores CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE categorias CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE usuarios CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE clientes CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE roles CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Eliminar la secuencia si ya existe
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_roles';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/
CREATE SEQUENCE seq_roles START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_auditoria';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_auditoria START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_usuarios';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_usuarios START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_clientes';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_categorias';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_categorias START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_proveedores';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_proveedores START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_vehiculos';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_vehiculos START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_stock';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_stock START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_facturas';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_facturas START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_detalle_factura';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_detalle_factura START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_citas';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_citas START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_financiamiento';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_financiamiento START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_pagos';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_pagos START WITH 1 INCREMENT BY 1;

BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_ubicaciones';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/

CREATE SEQUENCE seq_ubicaciones START WITH 1 INCREMENT BY 1;

-- CREACION DE LAS TABLAS

-- Crear la tabla roles
CREATE TABLE roles (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(255) NOT NULL
);

-- Crear la tabla Auditoria_General
CREATE TABLE Auditoria_General (
    ID_Auditoria NUMBER PRIMARY KEY,
    Nombre_Tabla VARCHAR2(50),
    ID_Registro VARCHAR2(50),
    Operacion VARCHAR2(10),
    Fecha_Cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Usuario VARCHAR2(50),
    Detalles VARCHAR2(4000)
);

-- Crear la tabla usuarios
CREATE TABLE usuarios (
    ID_usuarios NUMBER PRIMARY KEY,
    email VARCHAR2(255) UNIQUE NOT NULL,
    password VARCHAR2(255) NOT NULL,
    nombre VARCHAR2(255),
    apellido VARCHAR2(255),
    telefono VARCHAR2(50),
    direccion VARCHAR2(255),
    rol_id NUMBER,
    CONSTRAINT fk_rol_id FOREIGN KEY (rol_id) REFERENCES roles(id)
);

-- Crear la tabla clientes
CREATE TABLE clientes (
    id_cliente NUMBER PRIMARY KEY,
    nombre VARCHAR2(255),
    apellido VARCHAR2(255),
    email VARCHAR2(255) UNIQUE NOT NULL,
    telefono VARCHAR2(50),
    direccion VARCHAR2(255),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla categorias
CREATE TABLE categorias (
    id_categoria NUMBER PRIMARY KEY,
    nombre VARCHAR2(255) NOT NULL
);

-- Crear la tabla proveedores
CREATE TABLE proveedores (
    id_proveedor NUMBER PRIMARY KEY,
    nombre VARCHAR2(255) NOT NULL,
    contacto VARCHAR2(255),
    telefono VARCHAR2(50),
    direccion VARCHAR2(255)
);

-- Crear la tabla vehiculos
CREATE TABLE vehiculos (
    id_vehiculo NUMBER PRIMARY KEY,
    modelo VARCHAR2(255),
    marca VARCHAR2(255),
    ano NUMBER,
    precio NUMBER(10, 2),
    estado VARCHAR2(50),
    color VARCHAR2(50),
    vin VARCHAR2(255) UNIQUE,
    categoria_id NUMBER,
    proveedor_id NUMBER,
    Foto_URL VARCHAR2(255),
    CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias(id_categoria),
    CONSTRAINT fk_proveedor_id FOREIGN KEY (proveedor_id) REFERENCES proveedores(id_proveedor)
);

-- Crear la tabla stock
CREATE TABLE stock (
    id_stock NUMBER PRIMARY KEY,
    vehiculo_id NUMBER,
    cantidad NUMBER,
    CONSTRAINT fk_vehiculo_id_stock FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id_vehiculo)
);

-- Crear la tabla facturas
CREATE TABLE facturas (
    id_factura NUMBER PRIMARY KEY,
    cliente_id NUMBER,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total NUMBER(10, 2),
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente)
);

-- Crear la tabla detalle_factura
CREATE TABLE detalle_factura (
    id_detalle_factura NUMBER PRIMARY KEY,
    factura_id NUMBER,
    vehiculo_id NUMBER,
    cantidad NUMBER,
    precio_unitario NUMBER(10, 2),
    CONSTRAINT fk_factura_id FOREIGN KEY (factura_id) REFERENCES facturas(id_factura),
    CONSTRAINT fk_vehiculo_id FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id_vehiculo)
);

-- Crear la tabla citas
CREATE TABLE citas (
    id_citas NUMBER PRIMARY KEY,
    cliente_id NUMBER,
    usuario_id NUMBER,
    vehiculo_id NUMBER,
    fecha_hora TIMESTAMP,
    tipo VARCHAR2(50),
    estado VARCHAR2(50),
    CONSTRAINT fk_cliente_id_citas FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuarios(ID_usuarios),
    CONSTRAINT fk_vehiculo_id_citas FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id_vehiculo)
);

-- Crear la tabla financiamiento
CREATE TABLE financiamiento (
    id_financiamiento NUMBER PRIMARY KEY,
    cliente_id NUMBER,
    vehiculo_id NUMBER,
    monto_financiado NUMBER(10, 2),
    interes NUMBER(5, 2),
    plazo NUMBER,
    estado VARCHAR2(50),
    CONSTRAINT fk_cliente_id_financiamiento FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_vehiculo_id_financiamiento FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id_vehiculo)
);

-- Crear la tabla pagos
CREATE TABLE pagos (
    id_pagos NUMBER PRIMARY KEY,
    cliente_id NUMBER,
    factura_id NUMBER,
    monto NUMBER(10, 2),
    fecha TIMESTAMP,
    metodo_pago VARCHAR2(50),
    CONSTRAINT fk_cliente_id_pagos FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_factura_id_pagos FOREIGN KEY (factura_id) REFERENCES facturas(id_factura)
);

-- Crear la tabla ubicaciones
CREATE TABLE ubicaciones (
    id_ubicaciones NUMBER PRIMARY KEY,
    nombre VARCHAR2(255),
    direccion VARCHAR2(255),
    telefono VARCHAR2(50)
);

-- ALTERTABLES
ALTER TABLE vehiculos ADD (ID_Auditoria NUMBER);
ALTER TABLE proveedores ADD (ID_Auditoria NUMBER);
ALTER TABLE stock ADD (ID_Auditoria NUMBER);
ALTER TABLE facturas ADD (ID_Auditoria NUMBER);
ALTER TABLE detalle_factura ADD (ID_Auditoria NUMBER);
ALTER TABLE citas ADD (ID_Auditoria NUMBER);
ALTER TABLE financiamiento ADD (ID_Auditoria NUMBER);
ALTER TABLE pagos ADD (ID_Auditoria NUMBER);
--FIN DE LOS ALTERTABLES

-- Crear triggers SEQ
-- Triggers para la secuencia de roles
CREATE OR REPLACE TRIGGER trg_roles
BEFORE INSERT ON roles
FOR EACH ROW
BEGIN
    SELECT seq_roles.NEXTVAL INTO :new.id FROM dual;
END;
/

-- Triggers para la secuencia de auditoría
CREATE OR REPLACE TRIGGER trg_auditoria
BEFORE INSERT ON Auditoria_General
FOR EACH ROW
BEGIN
    SELECT seq_auditoria.NEXTVAL INTO :new.ID_Auditoria FROM dual;
END;
/

-- Triggers para la secuencia de clientes
CREATE OR REPLACE TRIGGER trg_clientes
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    SELECT seq_clientes.NEXTVAL INTO :new.id_cliente FROM dual;
END;
/

-- Triggers para la secuencia de categorias
CREATE OR REPLACE TRIGGER trg_categorias
BEFORE INSERT ON categorias
FOR EACH ROW
BEGIN
    SELECT seq_categorias.NEXTVAL INTO :new.id_categoria FROM dual;
END;
/

-- Triggers para la secuencia de proveedores
CREATE OR REPLACE TRIGGER trg_proveedores
BEFORE INSERT ON proveedores
FOR EACH ROW
BEGIN
    SELECT seq_proveedores.NEXTVAL INTO :new.id_proveedor FROM dual;
END;
/

-- Triggers para la secuencia de vehiculos
CREATE OR REPLACE TRIGGER trg_vehiculos
BEFORE INSERT ON vehiculos
FOR EACH ROW
BEGIN
    SELECT seq_vehiculos.NEXTVAL INTO :new.id_vehiculo FROM dual;
END;
/

-- Triggers para la secuencia de stock
CREATE OR REPLACE TRIGGER trg_stock
BEFORE INSERT ON stock
FOR EACH ROW
BEGIN
    SELECT seq_stock.NEXTVAL INTO :new.id_stock FROM dual;
END;
/

-- Triggers para la secuencia de facturas
CREATE OR REPLACE TRIGGER trg_facturas
BEFORE INSERT ON facturas
FOR EACH ROW
BEGIN
    SELECT seq_facturas.NEXTVAL INTO :new.id_factura FROM dual;
END;
/

-- Triggers para la secuencia de detalle_factura
CREATE OR REPLACE TRIGGER trg_detalle_factura
BEFORE INSERT ON detalle_factura
FOR EACH ROW
BEGIN
    SELECT seq_detalle_factura.NEXTVAL INTO :new.id_detalle_factura FROM dual;
END;
/

-- Triggers para la secuencia de citas
CREATE OR REPLACE TRIGGER trg_citas
BEFORE INSERT ON citas
FOR EACH ROW
BEGIN
    SELECT seq_citas.NEXTVAL INTO :new.id_citas FROM dual;
END;
/

-- Triggers para la secuencia de financiamiento
CREATE OR REPLACE TRIGGER trg_financiamiento
BEFORE INSERT ON financiamiento
FOR EACH ROW
BEGIN
    SELECT seq_financiamiento.NEXTVAL INTO :new.id_financiamiento FROM dual;
END;
/

-- Triggers para la secuencia de pagos
CREATE OR REPLACE TRIGGER trg_pagos
BEFORE INSERT ON pagos
FOR EACH ROW
BEGIN
    SELECT seq_pagos.NEXTVAL INTO :new.id_pagos FROM dual;
END;
/

-- Triggers para la secuencia de ubicaciones
CREATE OR REPLACE TRIGGER trg_ubicaciones
BEFORE INSERT ON ubicaciones
FOR EACH ROW
BEGIN
    SELECT seq_ubicaciones.NEXTVAL INTO :new.id_ubicaciones FROM dual;
END;
/

-- PROCEDIMIENTOS
-- Procedimiento para Agregar Vehículo
CREATE OR REPLACE PROCEDURE AgregarVehiculo (
    p_ID_vehiculo IN NUMBER,          
    p_Marca IN VARCHAR2,
    p_Modelo IN VARCHAR2,
    p_Ano IN NUMBER,
    p_Precio IN NUMBER,
    p_Color IN VARCHAR2,
    p_Foto_URL IN VARCHAR2
) AS
BEGIN
    INSERT INTO vehiculos (
        ID_vehiculo,
        Marca,
        Modelo,
        Ano,
        Precio,
        Color,
        Foto_URL
    ) VALUES (
        p_ID_vehiculo,
        p_Marca,
        p_Modelo,
        p_Ano,
        p_Precio,
        p_Color,
        p_Foto_URL
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Vehículo agregado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al agregar el vehículo: ' || SQLERRM);
END;
/

-- Procedimiento para Editar Vehículo
CREATE OR REPLACE PROCEDURE EditarVehiculo (
    p_ID_vehiculo IN NUMBER,         
    p_Marca IN VARCHAR2,
    p_Modelo IN VARCHAR2,
    p_Ano IN NUMBER,
    p_Precio IN NUMBER,
    p_Color IN VARCHAR2,
    p_Foto_URL IN VARCHAR2
) AS
BEGIN
    UPDATE vehiculos
    SET Marca = p_Marca,
        Modelo = p_Modelo,
        Ano = p_Ano,
        Precio = p_Precio,
        Color = p_Color,
        Foto_URL = p_Foto_URL
    WHERE ID_vehiculo = p_ID_vehiculo;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún vehículo con el ID especificado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vehículo actualizado correctamente.');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el vehículo: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimiento para Eliminar Vehículo
CREATE OR REPLACE PROCEDURE EliminarVehiculo(
    p_ID_vehiculo IN NUMBER          
)
IS
BEGIN
    DELETE FROM vehiculos
    WHERE ID_vehiculo = p_ID_vehiculo;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún vehículo con el ID especificado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vehículo eliminado exitosamente.');
    END IF;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al intentar eliminar el vehículo: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Procedimiento para Consultar un Vehículo por ID
CREATE OR REPLACE PROCEDURE ConsultarVehiculo (
    p_ID_vehiculo IN NUMBER          
) IS
    v_Marca vehiculos.Marca%TYPE;
    v_Modelo vehiculos.Modelo%TYPE;
    v_Ano vehiculos.Ano%TYPE;
    v_Precio vehiculos.Precio%TYPE;
    v_Color vehiculos.Color%TYPE;
    v_Foto_URL vehiculos.Foto_URL%TYPE;
BEGIN
    SELECT Marca, Modelo, Ano, Precio, Color, Foto_URL
    INTO v_Marca, v_Modelo, v_Ano, v_Precio, v_Color, v_Foto_URL
    FROM vehiculos
    WHERE ID_vehiculo = p_ID_vehiculo;

    DBMS_OUTPUT.PUT_LINE('ID: ' || p_ID_vehiculo || ', Marca: ' || v_Marca || ', Modelo: ' || v_Modelo || ', Año: ' || v_Ano || ', Precio: ' || v_Precio || ', Color: ' || v_Color || ', Foto URL: ' || v_Foto_URL);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún vehículo con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al consultar el vehículo: ' || SQLERRM);
END;
/


-- Procedimiento para Agregar Proveedor
CREATE OR REPLACE PROCEDURE AgregarProveedor (
    p_id_proveedor IN NUMBER,        
    p_nombre IN VARCHAR2,
    p_contacto IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_direccion IN VARCHAR2
) IS
BEGIN
    INSERT INTO proveedores (
        id_proveedor,
        nombre,
        contacto,
        telefono,
        direccion
    )
    VALUES (
        p_id_proveedor,
        p_nombre,
        p_contacto,
        p_telefono,
        p_direccion
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Proveedor agregado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al agregar proveedor: ' || SQLERRM);
END;
/

-- Procedimiento para Actualizar Proveedor
CREATE OR REPLACE PROCEDURE ActualizarProveedor (
    p_id_proveedor IN NUMBER,        
    p_nombre IN VARCHAR2,
    p_contacto IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_direccion IN VARCHAR2
) IS
BEGIN
    UPDATE proveedores
    SET nombre = p_nombre,
        contacto = p_contacto,
        telefono = p_telefono,
        direccion = p_direccion
    WHERE id_proveedor = p_id_proveedor;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún proveedor con el ID especificado para actualizar.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Proveedor actualizado exitosamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al actualizar proveedor: ' || SQLERRM);
END;
/  

-- Procedimiento para Eliminar Proveedor
CREATE OR REPLACE PROCEDURE EliminarProveedor (
    p_id_proveedor IN NUMBER         
) IS
BEGIN
    DELETE FROM proveedores
    WHERE id_proveedor = p_id_proveedor;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún proveedor con el ID especificado.');
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Proveedor eliminado exitosamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al eliminar proveedor: ' || SQLERRM);
END;
/

-- AUDITORIA
-- Trigger para la tabla vehiculos
CREATE OR REPLACE TRIGGER trg_audit_vehiculos
AFTER INSERT OR UPDATE OR DELETE ON vehiculos
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'vehiculos',
            v_operacion,
            :NEW.id_vehiculo,
            USER,
            'Modelo=' || :NEW.modelo || 
            ', Marca=' || :NEW.marca || 
            ', Año=' || :NEW.ano || 
            ', Precio=' || :NEW.precio || 
            ', Estado=' || :NEW.estado || 
            ', Color=' || :NEW.color || 
            ', VIN=' || :NEW.vin || 
            ', Categoria_ID=' || :NEW.categoria_id || 
            ', Proveedor_ID=' || :NEW.proveedor_id || 
            ', Foto_URL=' || :NEW.Foto_URL
        );
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'vehiculos',
            v_operacion,
            :OLD.id_vehiculo,
            USER,
            'Modelo=' || :OLD.modelo || 
            ', Marca=' || :OLD.marca || 
            ', Año=' || :OLD.ano || 
            ', Precio=' || :OLD.precio || 
            ', Estado=' || :OLD.estado || 
            ', Color=' || :OLD.color || 
            ', VIN=' || :OLD.vin || 
            ', Categoria_ID=' || :OLD.categoria_id || 
            ', Proveedor_ID=' || :OLD.proveedor_id || 
            ', Foto_URL=' || :OLD.Foto_URL || 
            ' -> ' ||
            'Modelo=' || :NEW.modelo || 
            ', Marca=' || :NEW.marca || 
            ', Año=' || :NEW.ano || 
            ', Precio=' || :NEW.precio || 
            ', Estado=' || :NEW.estado || 
            ', Color=' || :NEW.color || 
            ', VIN=' || :NEW.vin || 
            ', Categoria_ID=' || :NEW.categoria_id || 
            ', Proveedor_ID=' || :NEW.proveedor_id || 
            ', Foto_URL=' || :NEW.Foto_URL
        );
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'vehiculos',
            v_operacion,
            :OLD.id_vehiculo,
            USER,
            'Modelo=' || :OLD.modelo || 
            ', Marca=' || :OLD.marca || 
            ', Año=' || :OLD.ano || 
            ', Precio=' || :OLD.precio || 
            ', Estado=' || :OLD.estado || 
            ', Color=' || :OLD.color || 
            ', VIN=' || :OLD.vin || 
            ', Categoria_ID=' || :OLD.categoria_id || 
            ', Proveedor_ID=' || :OLD.proveedor_id || 
            ', Foto_URL=' || :OLD.Foto_URL
        );
    END IF;
END;
/

-- Trigger para la tabla proveedores
CREATE OR REPLACE TRIGGER trg_audit_proveedores
AFTER INSERT OR UPDATE OR DELETE ON proveedores
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'proveedores',
            v_operacion,
            :NEW.id_proveedor,
            USER,
            'Nombre=' || :NEW.nombre || 
            ', Contacto=' || :NEW.contacto || 
            ', Telefono=' || :NEW.telefono || 
            ', Direccion=' || :NEW.direccion
        );
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'proveedores',
            v_operacion,
            :OLD.id_proveedor,
            USER,
            'Nombre=' || :OLD.nombre || 
            ', Contacto=' || :OLD.contacto || 
            ', Telefono=' || :OLD.telefono || 
            ', Direccion=' || :OLD.direccion || 
            ' -> ' ||
            'Nombre=' || :NEW.nombre || 
            ', Contacto=' || :NEW.contacto || 
            ', Telefono=' || :NEW.telefono || 
            ', Direccion=' || :NEW.direccion
        );
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'proveedores',
            v_operacion,
            :OLD.id_proveedor,
            USER,
            'Nombre=' || :OLD.nombre || 
            ', Contacto=' || :OLD.contacto || 
            ', Telefono=' || :OLD.telefono || 
            ', Direccion=' || :OLD.direccion
        );
    END IF;
END;
/

-- Trigger para la tabla clientes
CREATE OR REPLACE TRIGGER trg_audit_clientes
AFTER INSERT OR UPDATE OR DELETE ON clientes
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'clientes',
            v_operacion,
            :NEW.id_cliente,
            USER,
            'Nombre=' || :NEW.nombre || 
            ', Apellido=' || :NEW.apellido || 
            ', Email=' || :NEW.email || 
            ', Telefono=' || :NEW.telefono || 
            ', Direccion=' || :NEW.direccion || 
            ', Fecha_registro=' || TO_CHAR(:NEW.fecha_registro, 'YYYY-MM-DD HH24:MI:SS')
        );
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'clientes',
            v_operacion,
            :OLD.id_cliente,
            USER,
            'Nombre=' || :OLD.nombre || 
            ', Apellido=' || :OLD.apellido || 
            ', Email=' || :OLD.email || 
            ', Telefono=' || :OLD.telefono || 
            ', Direccion=' || :OLD.direccion || 
            ', Fecha_registro=' || TO_CHAR(:OLD.fecha_registro, 'YYYY-MM-DD HH24:MI:SS') || 
            ' -> ' ||
            'Nombre=' || :NEW.nombre || 
            ', Apellido=' || :NEW.apellido || 
            ', Email=' || :NEW.email || 
            ', Telefono=' || :NEW.telefono || 
            ', Direccion=' || :NEW.direccion || 
            ', Fecha_registro=' || TO_CHAR(:NEW.fecha_registro, 'YYYY-MM-DD HH24:MI:SS')
        );
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'clientes',
            v_operacion,
            :OLD.id_cliente,
            USER,
            'Nombre=' || :OLD.nombre || 
            ', Apellido=' || :OLD.apellido || 
            ', Email=' || :OLD.email || 
            ', Telefono=' || :OLD.telefono || 
            ', Direccion=' || :OLD.direccion || 
            ', Fecha_registro=' || TO_CHAR(:OLD.fecha_registro, 'YYYY-MM-DD HH24:MI:SS')
        );
    END IF;
END;
/

-- Trigger para la tabla facturas
CREATE OR REPLACE TRIGGER trg_audit_facturas
AFTER INSERT OR UPDATE OR DELETE ON facturas
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'facturas',
            v_operacion,
            :NEW.id_factura,
            USER,
            'Cliente_ID=' || :NEW.cliente_id ||
            ', Fecha=' || :NEW.fecha ||
            ', Total=' || :NEW.total
        );
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'facturas',
            v_operacion,
            :OLD.id_factura,
            USER,
            'Cliente_ID=' || :OLD.cliente_id ||
            ', Fecha=' || :OLD.fecha ||
            ', Total=' || :OLD.total ||
            ' -> ' ||
            'Cliente_ID=' || :NEW.cliente_id ||
            ', Fecha=' || :NEW.fecha ||
            ', Total=' || :NEW.total
        );
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'facturas',
            v_operacion,
            :OLD.id_factura,
            USER,
            'Cliente_ID=' || :OLD.cliente_id ||
            ', Fecha=' || :OLD.fecha ||
            ', Total=' || :OLD.total
        );
    END IF;
END;
/


-- Trigger para la tabla detalle_factura
CREATE OR REPLACE TRIGGER trg_audit_detalle_factura
AFTER INSERT OR UPDATE OR DELETE ON detalle_factura
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'detalle_factura',
            v_operacion,
            :NEW.id_detalle_factura,
            USER,
            'Factura_ID=' || :NEW.factura_id ||
            ', Vehiculo_ID=' || :NEW.vehiculo_id ||
            ', Cantidad=' || :NEW.cantidad ||
            ', Precio_Unitario=' || :NEW.precio_unitario
        );
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'detalle_factura',
            v_operacion,
            :OLD.id_detalle_factura,
            USER,
            'Factura_ID=' || :OLD.factura_id ||
            ', Vehiculo_ID=' || :OLD.vehiculo_id ||
            ', Cantidad=' || :OLD.cantidad ||
            ', Precio_Unitario=' || :OLD.precio_unitario ||
            ' -> ' ||
            'Factura_ID=' || :NEW.factura_id ||
            ', Vehiculo_ID=' || :NEW.vehiculo_id ||
            ', Cantidad=' || :NEW.cantidad ||
            ', Precio_Unitario=' || :NEW.precio_unitario
        );
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'detalle_factura',
            v_operacion,
            :OLD.id_detalle_factura,
            USER,
            'Factura_ID=' || :OLD.factura_id ||
            ', Vehiculo_ID=' || :OLD.vehiculo_id ||
            ', Cantidad=' || :OLD.cantidad ||
            ', Precio_Unitario=' || :OLD.precio_unitario
        );
    END IF;
END;
/


-- Trigger para la tabla stock
CREATE OR REPLACE TRIGGER trg_audit_stock
AFTER INSERT OR UPDATE OR DELETE ON stock
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'stock',
            v_operacion,
            :NEW.id_stock,
            USER,
            'Vehiculo_ID=' || :NEW.vehiculo_id ||
            ', Cantidad=' || :NEW.cantidad
        );
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'stock',
            v_operacion,
            :OLD.id_stock,
            USER,
            'Vehiculo_ID=' || :OLD.vehiculo_id ||
            ', Cantidad=' || :OLD.cantidad ||
            ' -> ' ||
            'Vehiculo_ID=' || :NEW.vehiculo_id ||
            ', Cantidad=' || :NEW.cantidad
        );
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria_General (Nombre_Tabla, Operacion, ID_Registro, Usuario, Detalles)
        VALUES (
            'stock',
            v_operacion,
            :OLD.id_stock,
            USER,
            'Vehiculo_ID=' || :OLD.vehiculo_id ||
            ', Cantidad=' || :OLD.cantidad
        );
    END IF;
END;
/  

--INSERTS

--FIN DE LOS INSERTS