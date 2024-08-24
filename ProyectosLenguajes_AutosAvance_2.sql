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
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE auditoria CASCADE CONSTRAINTS';
    EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- Eliminar la secuencia si ya existe
BEGIN
    EXECUTE IMMEDIATE 'DROP SEQUENCE seq_auditoria';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -2289 THEN 
            RAISE;
        END IF;
END;
/
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


select * from vehiculos;

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

-- Triggers para la secuencia de auditorï¿½a
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
            ', Aï¿½o=' || :NEW.ano || 
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
            ', Aï¿½o=' || :OLD.ano || 
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
            ', Aï¿½o=' || :NEW.ano || 
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
            ', Aï¿½o=' || :OLD.ano || 
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


-- PROCEDIMIENTOS

CREATE OR REPLACE PROCEDURE AgregarVehiculo (
    p_id_vehiculo IN NUMBER,
    p_modelo IN VARCHAR2,
    p_marca IN VARCHAR2,
    p_ano IN NUMBER,
    p_precio IN NUMBER,
    p_estado IN VARCHAR2,
    p_color IN VARCHAR2,
    p_vin IN VARCHAR2,
    p_categoria_id IN NUMBER,
    p_proveedor_id IN NUMBER,
    p_foto_url IN VARCHAR2,
    p_id_auditoria IN NUMBER
) 
AS
BEGIN
    INSERT INTO vehiculos (
        id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL, ID_Auditoria
    ) VALUES (
        p_id_vehiculo, p_modelo, p_marca, p_ano, p_precio, p_estado, p_color, p_vin, p_categoria_id, p_proveedor_id, p_foto_url, p_id_auditoria
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Vehículo agregado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al agregar el vehículo: ' || SQLERRM);
END;
/

BEGIN
    AgregarVehiculo(
        p_id_vehiculo => 17,
        p_modelo => 'Mustang',
        p_marca => 'Ford',
        p_ano => 2024,
        p_precio => 55000,
        p_estado => 'Nuevo',
        p_color => 'Azul',
        p_vin => '1FA6P8CF2M5100001',
        p_categoria_id => 4, 
        p_proveedor_id => 2, 
        p_foto_url => 'https://www.ford.mx/content/dam/Ford/website-assets/latam/mx/open-graph/2024/nameplate/mustang/ford-mustang-2024-auto-deportivo-potencia-eficiencia-versiones-precio.jpg',
        p_id_auditoria => 7 
    );
END;
/

select * from vehiculos;



CREATE OR REPLACE PROCEDURE ActualizarVehiculo (
    p_id_vehiculo IN NUMBER,
    p_modelo IN VARCHAR2,
    p_marca IN VARCHAR2,
    p_ano IN NUMBER,
    p_precio IN NUMBER,
    p_estado IN VARCHAR2,
    p_color IN VARCHAR2,
    p_vin IN VARCHAR2,
    p_categoria_id IN NUMBER,
    p_proveedor_id IN NUMBER,
    p_foto_url IN VARCHAR2,
    p_id_auditoria IN NUMBER
) 
AS
BEGIN
    UPDATE vehiculos
    SET 
        modelo = p_modelo,
        marca = p_marca,
        ano = p_ano,
        precio = p_precio,
        estado = p_estado,
        color = p_color,
        vin = p_vin,
        categoria_id = p_categoria_id,
        proveedor_id = p_proveedor_id,
        Foto_URL = p_foto_url,
        ID_Auditoria = p_id_auditoria
    WHERE id_vehiculo = p_id_vehiculo;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Vehículo actualizado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el vehículo: ' || SQLERRM);
END;
/

BEGIN
    ActualizarVehiculo(
        p_id_vehiculo => 18,
        p_modelo => 'Mustang GT',
        p_marca => 'Ford',
        p_ano => 2024,
        p_precio => 60000,
        p_estado => 'Nuevo',
        p_color => 'Rojo',
        p_vin => '2FA6P8CF2M5100002',
        p_categoria_id => 3,  -- Asegúrate de que este ID exista en la tabla de categorías
        p_proveedor_id => 5,  -- Asegúrate de que este ID exista en la tabla de proveedores
        p_foto_url => 'https://www.ford.mx/content/dam/Ford/website-assets/latam/mx/open-graph/2024/nameplate/mustang/ford-mustang-2024-auto-deportivo-potencia-eficiencia-versiones-precio.jpg',
        p_id_auditoria => 8   -- Asegúrate de que este ID exista en la tabla de auditorías
    );
END;
/


CREATE OR REPLACE PROCEDURE EliminarVehiculo (
    p_id_vehiculo IN NUMBER
) 
IS
BEGIN
    DELETE FROM vehiculos
    WHERE id_vehiculo = p_id_vehiculo;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún vehículo con el ID especificado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Vehículo eliminado exitosamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al intentar eliminar el vehículo: ' || SQLERRM);
END;
/

BEGIN
    EliminarVehiculo(p_id_vehiculo => 18);
END;
/


CREATE OR REPLACE PROCEDURE MostrarVehiculos IS
    CURSOR vehiculos_cursor IS
        SELECT id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL, ID_Auditoria
        FROM vehiculos;
    
    v_id_vehiculo vehiculos.id_vehiculo%TYPE;
    v_modelo vehiculos.modelo%TYPE;
    v_marca vehiculos.marca%TYPE;
    v_ano vehiculos.ano%TYPE;
    v_precio vehiculos.precio%TYPE;
    v_estado vehiculos.estado%TYPE;
    v_color vehiculos.color%TYPE;
    v_vin vehiculos.vin%TYPE;
    v_categoria_id vehiculos.categoria_id%TYPE;
    v_proveedor_id vehiculos.proveedor_id%TYPE;
    v_foto_url vehiculos.Foto_URL%TYPE;
    v_id_auditoria vehiculos.ID_Auditoria%TYPE;
BEGIN
    OPEN vehiculos_cursor;
    LOOP
        FETCH vehiculos_cursor INTO v_id_vehiculo, v_modelo, v_marca, v_ano, v_precio, v_estado, v_color, v_vin, v_categoria_id, v_proveedor_id, v_foto_url, v_id_auditoria;
        EXIT WHEN vehiculos_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id_vehiculo || ', Modelo: ' || v_modelo || ', Marca: ' || v_marca || ', Año: ' || v_ano || ', Precio: ' || v_precio || ', Estado: ' || v_estado || ', Color: ' || v_color || ', VIN: ' || v_vin || ', Categoría ID: ' || v_categoria_id || ', Proveedor ID: ' || v_proveedor_id || ', Foto URL: ' || v_foto_url || ', ID Auditoría: ' || v_id_auditoria);
    END LOOP;
    CLOSE vehiculos_cursor;
END;
/

BEGIN
    MostrarVehiculos;
END;


--Procedimientos Usuario Ale


CREATE OR REPLACE PROCEDURE EditarUsuario(
    id_usuario_in IN NUMBER,
    email_in IN VARCHAR2,
    password_in IN VARCHAR2,
    nombre_in IN VARCHAR2,
    apellido_in IN VARCHAR2,
    telefono_in IN VARCHAR2,
    direccion_in IN VARCHAR2,
    rol_id_in IN NUMBER
)
IS
BEGIN
    UPDATE usuarios
    SET email = email_in,
        password = password_in,
        nombre = nombre_in,
        apellido = apellido_in,
        telefono = telefono_in,
        direccion = direccion_in,
        rol_id = rol_id_in
    WHERE ID_usuarios = id_usuario_in;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario actualizado exitosamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún usuario con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Se produjo un error al actualizar el usuario: ' || SQLERRM);
        ROLLBACK;
END EditarUsuario;

CREATE OR REPLACE PROCEDURE EliminarUsuario(
    id_usuario_in IN NUMBER
)
IS
BEGIN
    DELETE FROM usuarios WHERE ID_usuarios = id_usuario_in;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario eliminado correctamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún usuario con el ID proporcionado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurrió un error al intentar eliminar al usuario: ' || SQLERRM);
        ROLLBACK;
END EliminarUsuario;


CREATE OR REPLACE PROCEDURE MostrarUsuarios
IS
    CURSOR usuarios_cursor IS
        SELECT ID_usuarios, email, nombre, apellido, telefono, direccion, rol_id
        FROM usuarios;

    usuario_id usuarios.ID_usuarios%TYPE;
    usuario_email usuarios.email%TYPE;
    usuario_nombre usuarios.nombre%TYPE;
    usuario_apellido usuarios.apellido%TYPE;
    usuario_telefono usuarios.telefono%TYPE;
    usuario_direccion usuarios.direccion%TYPE;
    usuario_rol_id usuarios.rol_id%TYPE;
BEGIN
    OPEN usuarios_cursor;
    LOOP
        FETCH usuarios_cursor INTO usuario_id, usuario_email, usuario_nombre, usuario_apellido, usuario_telefono, usuario_direccion, usuario_rol_id;
        EXIT WHEN usuarios_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || usuario_id || ', Email: ' || usuario_email || ', Nombre: ' || usuario_nombre || ', Apellido: ' || usuario_apellido || ', Teléfono: ' || usuario_telefono || ', Dirección: ' || usuario_direccion || ', Rol ID: ' || usuario_rol_id);
    END LOOP;

    CLOSE usuarios_cursor;
END MostrarUsuarios;

CREATE OR REPLACE PROCEDURE AgregarUsuario(
    email_in IN VARCHAR2,
    password_in IN VARCHAR2,
    nombre_in IN VARCHAR2,
    apellido_in IN VARCHAR2,
    telefono_in IN VARCHAR2,
    direccion_in IN VARCHAR2,
    rol_id_in IN NUMBER
)
IS
BEGIN
    INSERT INTO usuarios (
        ID_usuarios, 
        email,
        password,
        nombre,
        apellido,
        telefono,
        direccion,
        rol_id
    ) VALUES (
        usuarios_seq.NEXTVAL,
        email_in,
        password_in,
        nombre_in,
        apellido_in,
        telefono_in,
        direccion_in,
        rol_id_in
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuario agregado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar el usuario: ' || SQLERRM);
        ROLLBACK;
END AgregarUsuario;



--Procedimientos Usuario Jeanca
CREATE OR REPLACE PROCEDURE AgregarCita(
    p_id_citas IN NUMBER,
    p_cliente_id IN NUMBER,
    p_usuario_id IN NUMBER,
    p_vehiculo_id IN NUMBER,
    p_fecha_hora IN TIMESTAMP,
    p_tipo IN VARCHAR2,
    p_estado IN VARCHAR2
) IS
BEGIN
    INSERT INTO citas (
        id_citas,
        cliente_id,
        usuario_id,
        vehiculo_id,
        fecha_hora,
        tipo,
        estado
    ) VALUES (
        p_id_citas,
        p_cliente_id,
        p_usuario_id,
        p_vehiculo_id,
        p_fecha_hora,
        p_tipo,
        p_estado
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Cita agregada correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar la cita: ' || SQLERRM);
        ROLLBACK;
END AgregarCita;


CREATE OR REPLACE PROCEDURE EditarCita(
    p_id_citas IN NUMBER,
    p_cliente_id IN NUMBER,
    p_usuario_id IN NUMBER,
    p_vehiculo_id IN NUMBER,
    p_fecha_hora IN TIMESTAMP,
    p_tipo IN VARCHAR2,
    p_estado IN VARCHAR2
) IS
BEGIN
    UPDATE citas
    SET cliente_id = p_cliente_id,
        usuario_id = p_usuario_id,
        vehiculo_id = p_vehiculo_id,
        fecha_hora = p_fecha_hora,
        tipo = p_tipo,
        estado = p_estado
    WHERE id_citas = p_id_citas;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Cita actualizada correctamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ninguna cita con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar la cita: ' || SQLERRM);
        ROLLBACK;
END EditarCita;
/

CREATE OR REPLACE PROCEDURE EliminarCita(
    p_id_citas IN NUMBER
) IS
BEGIN
    DELETE FROM citas
    WHERE id_citas = p_id_citas;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Cita eliminada correctamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ninguna cita con el ID proporcionado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar la cita: ' || SQLERRM);
        ROLLBACK;
END EliminarCita;
/


CREATE OR REPLACE PROCEDURE MostrarCitas IS
    CURSOR citas_cursor IS
        SELECT id_citas, cliente_id, usuario_id, vehiculo_id, fecha_hora, tipo, estado
        FROM citas;

    v_id_citas citas.id_citas%TYPE;
    v_cliente_id citas.cliente_id%TYPE;
    v_usuario_id citas.usuario_id%TYPE;
    v_vehiculo_id citas.vehiculo_id%TYPE;
    v_fecha_hora citas.fecha_hora%TYPE;
    v_tipo citas.tipo%TYPE;
    v_estado citas.estado%TYPE;
BEGIN
    OPEN citas_cursor;
    LOOP
        FETCH citas_cursor INTO v_id_citas, v_cliente_id, v_usuario_id, v_vehiculo_id, v_fecha_hora, v_tipo, v_estado;
        EXIT WHEN citas_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id_citas || ', Cliente ID: ' || v_cliente_id || ', Usuario ID: ' || v_usuario_id || ', Vehículo ID: ' || v_vehiculo_id || ', Fecha y Hora: ' || v_fecha_hora || ', Tipo: ' || v_tipo || ', Estado: ' || v_estado);
    END LOOP;
    CLOSE citas_cursor;
END;
/




CREATE OR REPLACE PROCEDURE AgregarPago (
    p_id_pagos IN NUMBER,
    p_cliente_id IN NUMBER,
    p_factura_id IN NUMBER,
    p_monto IN NUMBER,
    p_fecha IN TIMESTAMP,
    p_metodo_pago IN VARCHAR2
) 
AS
BEGIN
    INSERT INTO pagos (
        id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago
    ) VALUES (
        p_id_pagos, p_cliente_id, p_factura_id, p_monto, p_fecha, p_metodo_pago
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Pago agregado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al agregar el pago: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE ActualizarPago (
    p_id_pagos IN NUMBER,
    p_cliente_id IN NUMBER,
    p_factura_id IN NUMBER,
    p_monto IN NUMBER,
    p_fecha IN TIMESTAMP,
    p_metodo_pago IN VARCHAR2
) 
AS
BEGIN
    UPDATE pagos
    SET 
        cliente_id = p_cliente_id,
        factura_id = p_factura_id,
        monto = p_monto,
        fecha = p_fecha,
        metodo_pago = p_metodo_pago
    WHERE id_pagos = p_id_pagos;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Pago actualizado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el pago: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE EliminarPago (
    p_id_pagos IN NUMBER
) 
IS
BEGIN
    DELETE FROM pagos
    WHERE id_pagos = p_id_pagos;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró ningún pago con el ID especificado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Pago eliminado exitosamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al intentar eliminar el pago: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE MostrarPagos IS
    CURSOR pagos_cursor IS
        SELECT id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago
        FROM pagos;
    
    v_id_pagos pagos.id_pagos%TYPE;
    v_cliente_id pagos.cliente_id%TYPE;
    v_factura_id pagos.factura_id%TYPE;
    v_monto pagos.monto%TYPE;
    v_fecha pagos.fecha%TYPE;
    v_metodo_pago pagos.metodo_pago%TYPE;
BEGIN
    OPEN pagos_cursor;
    LOOP
        FETCH pagos_cursor INTO v_id_pagos, v_cliente_id, v_factura_id, v_monto, v_fecha, v_metodo_pago;
        EXIT WHEN pagos_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id_pagos || ', Cliente ID: ' || v_cliente_id || ', Factura ID: ' || v_factura_id || ', Monto: ' || v_monto || ', Fecha: ' || v_fecha || ', Método de Pago: ' || v_metodo_pago);
    END LOOP;
    CLOSE pagos_cursor;
END;
/

CREATE OR REPLACE PROCEDURE validar_usuario (
    p_email IN VARCHAR2,
    p_password IN VARCHAR2,
    p_valido OUT NUMBER,
    p_rol OUT NUMBER
) AS
    v_password_bd VARCHAR2(255);
BEGIN
    SELECT password, rol_id INTO v_password_bd, p_rol
    FROM usuarios
    WHERE email = p_email;

    IF v_password_bd = p_password THEN
        p_valido := 1; 
    ELSE
        p_valido := 0;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_valido := 0; 
        p_rol := NULL;
    WHEN OTHERS THEN
        p_valido := 0;
        p_rol := NULL;
END;

select * from usuarios;

DECLARE
    v_valido NUMBER;
    v_rol NUMBER;
BEGIN

    validar_usuario(
        p_email => 'juan.perez@example.com',
        p_password => 'password123',
        p_valido => v_valido,
        p_rol => v_rol
    );
    
    -- Mostrar los resultados
    DBMS_OUTPUT.PUT_LINE('Valido: ' || v_valido);
    DBMS_OUTPUT.PUT_LINE('Rol: ' || v_rol);
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
        DBMS_OUTPUT.PUT_LINE('No se encontrï¿½ ningï¿½n proveedor con el ID especificado para actualizar.');
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


BEGIN
    ActualizarProveedor(
        p_id_proveedor => 15,
        p_nombre => 'Proveedor Actualizado',
        p_contacto => 'Carlos López',
        p_telefono => '8888-5678',
        p_direccion => 'Cartago, Costa Rica'
    );
END;
/


SELECT * FROM proveedores WHERE id_proveedor = 15;


-- Procedimiento para Eliminar Proveedor
CREATE OR REPLACE PROCEDURE EliminarProveedor (
    p_id_proveedor IN NUMBER         
) IS
BEGIN
    DELETE FROM proveedores
    WHERE id_proveedor = p_id_proveedor;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontrï¿½ ningï¿½n proveedor con el ID especificado.');
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

--INSERTS
-- inserts para roles 
 
INSERT INTO roles (id, nombre) VALUES (1, 'Administrador');
INSERT INTO roles (id, nombre) VALUES (2, 'Usuario');
INSERT INTO roles (id, nombre) VALUES (3, 'Invitado');
INSERT INTO roles (id, nombre) VALUES (4, 'Superusuario');

--insert para auditoria general 

INSERT INTO Auditoria_General (ID_Auditoria, Nombre_Tabla, ID_Registro, Operacion, Fecha_Cambio, Usuario, Detalles) 
VALUES (1, 'Clientes', '12345', 'INSERT', SYSTIMESTAMP, 'admin', 'Se aï¿½adiï¿½ un nuevo cliente con ID 12345.');

INSERT INTO Auditoria_General (ID_Auditoria, Nombre_Tabla, ID_Registro, Operacion, Fecha_Cambio, Usuario, Detalles) 
VALUES (2, 'Productos', '67890', 'UPDATE', SYSTIMESTAMP, 'jdoe', 'Se actualizï¿½ el precio del producto con ID 67890.');

INSERT INTO Auditoria_General (ID_Auditoria, Nombre_Tabla, ID_Registro, Operacion, Fecha_Cambio, Usuario, Detalles) 
VALUES (3, 'Pedidos', '54321', 'DELETE', SYSTIMESTAMP, 'admin', 'Se eliminï¿½ el pedido con ID 54321.');

INSERT INTO Auditoria_General (ID_Auditoria, Nombre_Tabla, ID_Registro, Operacion, Fecha_Cambio, Usuario, Detalles) 
VALUES (4, 'Empleados', '98765', 'INSERT', SYSTIMESTAMP, 'admin', 'Se aï¿½adiï¿½ un nuevo empleado con ID 98765.');

INSERT INTO Auditoria_General (ID_Auditoria, Nombre_Tabla, ID_Registro, Operacion, Fecha_Cambio, Usuario, Detalles) 
VALUES (5, 'Proveedores', '11223', 'UPDATE', SYSTIMESTAMP, 'jdoe', 'Se actualizï¿½ la informaciï¿½n del proveedor con ID 11223.');

--inserts para tabla Usuarios
INSERT INTO usuarios (ID_usuarios, email, password, nombre, apellido, telefono, direccion, rol_id)
VALUES (1, 'juan.perez@example.com', 'password123', 'Juan', 'Pï¿½rez', '555-1234', 'Calle Falsa 123', 1);

INSERT INTO usuarios (ID_usuarios, email, password, nombre, apellido, telefono, direccion, rol_id)
VALUES (2, 'ana.gomez@example.com', 'mypassword', 'Ana', 'Gï¿½mez', '555-5678', 'Avenida Siempre Viva 742', 2);

--inserts para tabla Usuarios 
INSERT INTO usuarios (ID_usuarios, email, password, nombre, apellido, telefono, direccion, rol_id)
VALUES (3, 'mario.smith@example.com', 'editorpass', 'Mario', 'Smith', '555-8765', 'Plaza Mayor 5', 4);

--inserts para clientes

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (1, 'Carlos', 'Mendoza', 'carlos.mendoza@example.com', '555-1173', 'Calle Sol 45', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (2, 'Laura', 'Pï¿½rez', 'laura.perez@example.com', '555-2692', 'Avenida Luna 89', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (3, 'Javier', 'Gï¿½mez', 'javier.gomez@example.com', '555-2353', 'Boulevard Estrella 12', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (4, 'Sofia', 'Rodrï¿½guez', 'sofia.rodriguez@example.com', '555-4714', 'Plaza Central 7', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (5, 'Ana', 'Fernández', 'ana.fernandez098@gmail.com', '8551-3849', 'San José, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (6, 'Luis', 'Martínez', 'luis.martinez781@gmail.com', '8527-5193', 'Alajuela, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (7, 'Carmen', 'Sánchez', 'carmen.sanchez342@gmail.com', '8412-6587', 'Cartago, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (8, 'Miguel', 'Ramírez', 'miguel.ramirez905@gmail.com', '8897-2531', 'Heredia, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (9, 'Elena', 'Hernández', 'elena.hernandez746@gmail.com', '8774-8932', 'Guanacaste, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (10, 'Diego', 'López', 'diego.lopez623@gmail.com', '8365-7298', 'Puntarenas, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (11, 'María', 'García', 'maria.garcia134@gmail.com', '8423-5417', 'Limón, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (12, 'Pedro', 'Núñez', 'pedro.nunez871@gmail.com', '8159-3746', 'San José, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (13, 'Julia', 'Castro', 'julia.castro957@gmail.com', '8573-2815', 'Alajuela, Costa Rica', SYSTIMESTAMP);

INSERT INTO clientes (id_cliente, nombre, apellido, email, telefono, direccion, fecha_registro)
VALUES (14, 'Roberto', 'Ortega', 'roberto.ortega645@gmail.com', '8321-6794', 'Cartago, Costa Rica', SYSTIMESTAMP);


--insert para tabla categoria

INSERT INTO categorias (id_categoria, nombre) 
VALUES (1, 'Sedan');

INSERT INTO categorias (id_categoria, nombre) 
VALUES (2, 'SUV');

INSERT INTO categorias (id_categoria, nombre) 
VALUES (3, 'Camioneta');

INSERT INTO categorias (id_categoria, nombre) 
VALUES (4, 'American Muscle');

INSERT INTO categorias (id_categoria, nombre) 
VALUES (5, 'Deportivo viejo');

-- inserts para tabla proveedores 

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion)
VALUES (1, 'AutoPartes.', 'Juan Lï¿½pez', '4711-5390', 'Avenida de la Industria 25');

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion)
VALUES (2, 'Llantas y Mas ', 'Marï¿½a Gonzï¿½lez', '3781-2750', 'Calle Rueda 77');

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion)
VALUES (3, 'Expertos Mecanix', 'Pedro Ruiz', '9016-2874', 'Boulevard Motor 8');

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion)
VALUES (4, 'Inteoriores de Carros.', 'Lucï¿½a Martï¿½nez', '2509-4872', 'Plaza de los Autos 12'); 

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion)
VALUES (5, 'AutoElectronics', 'Fernando Dï¿½az', '2458-8463', 'Calle Electrï¿½nica 45');

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion) 
VALUES (1, 'Dodge Company', 'contacto@dodgecompany.com', '8501-2345', 'San Josï¿½, Avenida Central');

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion) 
VALUES (2, 'Ford Motors', 'soporte@fordmotors.com', '8602-3456', 'Cartago, Avenida 3');

INSERT INTO proveedores (id_proveedor, nombre, contacto, telefono, direccion) 
VALUES (3, 'Chevrolet Suppliers', 'ventas@chevroletsuppliers.com', '8703-4567', 'Heredia, Calle Principal');



--inserts de vehiculos

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL)
VALUES (1, 'Corolla', 'Toyota', 2023, 25000.00, 'Nuevo', 'Blanco', 'JT2BG28K2S0298700', 1, 1, 'https://puromotor.com/wp-content/uploads/2022/04/20220401-TOYOTA-GR-COROLLA-2023-PORTADA.jpeg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL)
VALUES (3, 'F-150', 'Ford', 2021, 35000.00, 'Usado', 'Azul', '1FTEW1E52MFB12345', 3, 2, 'https://weudealerimagesprd.blob.core.windows.net/br1166/product/gallery/ford-colombia-f-150-raptor-exterior.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL)
VALUES (4, 'Civic', 'Honda', 2020, 22000.00, 'Nuevo', 'Rojo', '19XFC1F30LE123456', 1, 5, 'https://puromotor.com/wp-content/uploads/2019/08/2020-honda-civic-si-coupe-005-1566397364.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL)
VALUES (5, 'Camaro', 'Chevrolet', 2023, 32000.00, 'Nuevo', 'Amarillo', '1G1FH1R79P0134567', 4, 3, 'https://cdn.topgear.es/sites/navi.axelspringer.es/public/media/image/2017/09/chevrolet-camaro-zl1-1le-iii.jpg?tf=3840x'); 

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (6, 'Charger', 'Dodge', 1970, 45000.00, 'Disponible', 'Negro', 'VIN001CHARGER70', 4, 6, 'https://vanguardia.com.mx/binrepository/1152x648/0c0/0d0/down-right/11604/CIUN/fl0116-227310_12_VG3366046_MG2189531.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (7, 'Challenger', 'Dodge', 1971, 42000.00, 'Disponible', 'Rojo', 'VIN002CHALLENGER71', 4, 6, 'https://cdn.dealeraccelerate.com/cam/34/705/10413/1920x1440/1971-dodge-challenger-r-t');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (8, 'Viper GTS', 'Dodge', 1996, 75000.00, 'Disponible', 'Azul', 'VIN003VIPER96', 5, 6, 'https://www.supercars.net/blog/wp-content/uploads/2016/04/1023936.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (9, 'Mustang Boss 302', 'Ford', 1969, 50000.00, 'Disponible', 'Amarillo', 'VIN004MUSTANG69', 4, 7, 'https://i.ytimg.com/vi/YskCKJh0qVA/maxresdefault.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (10, 'Mustang GT', 'Ford', 1987, 30000.00, 'Disponible', 'Blanco', 'VIN005MUSTANG87', 4, 7, 'https://www.mustangspecs.com/wp-content/uploads/2019/10/1987-ford-mustang-gt-v2.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (11, 'Mustang Cobra R', 'Ford', 1993, 55000.00, 'Disponible', 'Negro', 'VIN006COBRAR93', 5, 7, 'https://silodrome.com/wp-content/uploads/2019/11/1993-SVT-Mustang-Cobra-R.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (12, 'Thunderbird', 'Ford', 1955, 65000.00, 'Disponible', 'Rojo', 'VIN007THUNDERBIRD55', 5, 7, 'https://cdn.dealeraccelerate.com/stlouis/1/1539/44057/1920x1440/1955-ford-thunderbird');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (13, 'Corvette Stingray', 'Chevrolet', 1970, 60000.00, 'Disponible', 'Azul', 'VIN008STINGRAY70', 5, 8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCYpKVLxSkRqeDyzPg5DDTVSDVxvn5IR4RBg&s');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (14, 'Camaro Z28', 'Chevrolet', 1979, 40000.00, 'Disponible', 'Rojo', 'VIN009CAMARO79', 4,8, 'https://bringatrailer.com/wp-content/uploads/2023/10/1979_chevrolet_camaro-z28_img_7237-3-67568.jpg');

INSERT INTO vehiculos (id_vehiculo, modelo, marca, ano, precio, estado, color, vin, categoria_id, proveedor_id, Foto_URL) 
VALUES (15, 'Impala SS', 'Chevrolet', 1996, 35000.00, 'Disponible', 'Negro', 'VIN010IMPALA96', 5, 8, 'https://www.carscoops.com/wp-content/uploads/2018/05/forgiato-impala-killer-mike.jpg');

--inserts para tabla stock

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (1, 1, 10); 
INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (2, 2, 5); 
INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (3, 3, 8); 
INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (4, 4, 12); 

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (1, 5, 15);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (2, 6, 8);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (3, 7, 10);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (4, 8, 6);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (5, 9, 12);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (6, 10, 9);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (7, 11, 7);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (8, 12, 5);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (9, 13, 11);

INSERT INTO stock (id_stock, vehiculo_id, cantidad) 
VALUES (10, 14, 4);

--inserts para tabla factura

INSERT INTO facturas (id_factura, cliente_id, fecha, total) 
VALUES (1, 1, SYSTIMESTAMP, 25000.00); 

INSERT INTO facturas (id_factura, cliente_id, fecha, total) 
VALUES (2, 2, SYSTIMESTAMP, 79563.99); 

INSERT INTO facturas (id_factura, cliente_id, fecha, total) 
VALUES (3, 3, SYSTIMESTAMP, 35000.00);

--inserts para tabla detalle factura

INSERT INTO detalle_factura (id_detalle_factura, factura_id, vehiculo_id, cantidad, precio_unitario)
VALUES (1, 1, 1, 1, 25000.00);

INSERT INTO detalle_factura (id_detalle_factura, factura_id, vehiculo_id, cantidad, precio_unitario)
VALUES (2, 2, 2, 1, 79999.99);

INSERT INTO detalle_factura (id_detalle_factura, factura_id, vehiculo_id, cantidad, precio_unitario)
VALUES (3, 3, 3, 2, 17500.00);  

--inserts para tabla citas 


INSERT INTO citas (id_citas, cliente_id, usuario_id, vehiculo_id, fecha_hora, tipo, estado) 
VALUES (1, 1, 1, 1, SYSTIMESTAMP + INTERVAL '1' DAY, 'Mantenimiento', 'Programada');

INSERT INTO citas (id_citas, cliente_id, usuario_id, vehiculo_id, fecha_hora, tipo, estado) 
VALUES (2, 2, 2, 2, SYSTIMESTAMP + INTERVAL '2' DAY, 'Revisiï¿½n', 'Confirmada');

INSERT INTO citas (id_citas, cliente_id, usuario_id, vehiculo_id, fecha_hora, tipo, estado) 
VALUES (3, 3, 3, 3, SYSTIMESTAMP + INTERVAL '3' DAY, 'Inspecciï¿½n', 'Cancelada');

INSERT INTO citas (id_citas, cliente_id, usuario_id, vehiculo_id, fecha_hora, tipo, estado) 
VALUES (4, 4, 4, 4, SYSTIMESTAMP + INTERVAL '4' DAY, 'Servicio', 'En progreso');

--inserts para tabla financiamiento

INSERT INTO financiamiento (id_financiamiento, cliente_id, vehiculo_id, monto_financiado, interes, plazo, estado) 
VALUES (1, 1, 1, 20000.00, 5.00, 24, 'Aprobado');

INSERT INTO financiamiento (id_financiamiento, cliente_id, vehiculo_id, monto_financiado, interes, plazo, estado) 
VALUES (2, 2, 2, 50000.00, 4.50, 36, 'En proceso'); 

INSERT INTO financiamiento (id_financiamiento, cliente_id, vehiculo_id, monto_financiado, interes, plazo, estado) 
VALUES (3, 3, 3, 15000.00, 6.00, 12, 'Rechazado'); 

INSERT INTO financiamiento (id_financiamiento, cliente_id, vehiculo_id, monto_financiado, interes, plazo, estado) 
VALUES (4, 4, 4, 30000.00, 4.75, 48, 'Aprobado'); 

INSERT INTO financiamiento (id_financiamiento, cliente_id, vehiculo_id, monto_financiado, interes, plazo, estado) 
VALUES (5, 5, 5, 45000.00, 5.25, 60, 'En proceso');  

--inserts para tabla pagos

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (1, 1, 1, 25000.00, SYSTIMESTAMP, 'Tarjeta de crï¿½dito'); 

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (7, 2, 1, 79999.99, SYSTIMESTAMP, 'Transferencia bancaria'); 

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (4, 3,5 , 35000.00, SYSTIMESTAMP, 'Efectivo'); 

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (4, 3, 1, 15000.00, SYSTIMESTAMP, 'Cheque'); 

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (5, 5, 5, 50000.00, SYSTIMESTAMP, 'Tarjeta de crï¿½dito');

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (6, 1, 2, 79999.99, SYSTIMESTAMP, 'Transferencia bancaria');

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (7, 2, 3, 35000.00, SYSTIMESTAMP, 'Efectivo'); 

INSERT INTO pagos (id_pagos, cliente_id, factura_id, monto, fecha, metodo_pago) 
VALUES (8, 3, 4, 15000.00, SYSTIMESTAMP, 'Cheque'); 

--inserts para tabla ubicaciones 

INSERT INTO ubicaciones (id_ubicaciones, nombre, direccion, telefono)
VALUES (1, 'Sucursal Central', 'Avenida Principal 123, Ciudad Capital', '123-456-7890');

INSERT INTO ubicaciones (id_ubicaciones, nombre, direccion, telefono)
VALUES (2, 'Sucursal Norte', 'Calle del Norte 456, Ciudad Norte', '234-567-8901');

INSERT INTO ubicaciones (id_ubicaciones, nombre, direccion, telefono)
VALUES (3, 'Sucursal Sur', 'Avenida del Sur 789, Ciudad Sur', '345-678-9012');

INSERT INTO ubicaciones (id_ubicaciones, nombre, direccion, telefono)
VALUES (4, 'Sucursal Este', 'Calle Este 101, Ciudad Este', '456-789-0123');

INSERT INTO ubicaciones (id_ubicaciones, nombre, direccion, telefono)
VALUES (5, 'Sucursal Oeste', 'Calle Oeste 202, Ciudad Oeste', '567-890-1234');

--FIN DE LOS INSERTS

--vistas de cada una de las tablas

CREATE VIEW vista_roles AS
SELECT 
    id AS Rol_ID,
    nombre AS Nombre_Rol
FROM 
    roles;


CREATE VIEW vista_auditoria_general AS
SELECT 
    ID_Auditoria AS Auditoria_ID,
    Nombre_Tabla AS Tabla_Afectada,
    ID_Registro AS Registro_ID,
    Operacion AS Tipo_Operacion,
    Fecha_Cambio AS Fecha_Hora_Cambio,
    Usuario AS Usuario_Responsable,
    Detalles AS Detalles_Operacion
FROM 
    Auditoria_General;


CREATE VIEW vista_usuarios AS
SELECT 
    u.ID_usuarios AS Usuario_ID,
    u.email AS Correo_Electronico,
    u.nombre AS Nombre,
    u.apellido AS Apellido,
    u.telefono AS Telefono,
    u.direccion AS Direccion,
    r.nombre AS Nombre_Rol
FROM 
    usuarios u
JOIN 
    roles r
ON 
    u.rol_id = r.id;


CREATE VIEW vista_clientes AS
SELECT 
    id_cliente AS Cliente_ID,
    nombre AS Nombre,
    apellido AS Apellido,
    email AS Email,
    telefono AS Telefono,
    direccion AS Direccion,
    fecha_registro AS Fecha_Registro
FROM 
    clientes;

CREATE VIEW vista_categorias AS
SELECT 
    id_categoria AS Categoria_ID,
    nombre AS Nombre_Categoria
FROM 
    categorias;


CREATE VIEW vista_proveedores AS
SELECT 
    id_proveedor AS Proveedor_ID,
    nombre AS Nombre_Proveedor,
    contacto AS Contacto,
    telefono AS Telefono,
    direccion AS Direccion
FROM 
    proveedores;


CREATE VIEW vista_vehiculos AS
SELECT 
    v.id_vehiculo AS Vehiculo_ID,
    v.modelo AS Modelo,
    v.marca AS Marca,
    v.ano AS Ano,
    v.precio AS Precio,
    v.estado AS Estado,
    v.color AS Color,
    v.vin AS VIN,
    c.nombre AS Categoria,
    p.nombre AS Proveedor,
    v.Foto_URL AS Foto_URL
FROM 
    vehiculos v
JOIN 
    categorias c ON v.categoria_id = c.id_categoria
JOIN 
    proveedores p ON v.proveedor_id = p.id_proveedor;


CREATE VIEW vista_stock AS
SELECT 
    s.id_stock AS Stock_ID,
    v.modelo AS Modelo_Vehiculo,
    s.cantidad AS Cantidad
FROM 
    stock s
JOIN 
    vehiculos v ON s.vehiculo_id = v.id_vehiculo;


CREATE VIEW vista_detalles_factura AS
SELECT
    f.id_factura,
    f.cliente_id,
    f.fecha AS fecha_factura,
    f.total,
    df.id_detalle_factura,
    df.vehiculo_id,
    df.cantidad,
    df.precio_unitario,
    (df.cantidad * df.precio_unitario) AS subtotal
FROM
    facturas f
JOIN
    detalle_factura df ON f.id_factura = df.factura_id;

CREATE VIEW vista_citas AS
SELECT
    c.id_citas,
    c.cliente_id,
    c.usuario_id,
    c.vehiculo_id,
    c.fecha_hora,
    c.tipo,
    c.estado,
    cl.nombre AS nombre_cliente,
    us.nombre AS nombre_usuario,
    v.modelo AS modelo_vehiculo
FROM
    citas c
JOIN
    clientes cl ON c.cliente_id = cl.id_cliente
JOIN
    usuarios us ON c.usuario_id = us.id_usuarios
JOIN
    vehiculos v ON c.vehiculo_id = v.id_vehiculo
WHERE
    c.estado = 'Activa';


CREATE VIEW vista_financiamiento_cliente AS
SELECT
    f.id_financiamiento,
    f.cliente_id,
    c.nombre AS nombre_cliente,
    f.vehiculo_id,
    v.modelo AS modelo_vehiculo,
    f.monto_financiado,
    f.interes,
    f.plazo,
    f.estado
FROM
    financiamiento f
JOIN
    clientes c ON f.cliente_id = c.id_cliente
JOIN
    vehiculos v ON f.vehiculo_id = v.id_vehiculo;


CREATE VIEW vista_pagos_realizados AS
SELECT
    p.id_pagos,
    p.cliente_id,
    c.nombre AS nombre_cliente,
    p.factura_id,
    f.fecha AS fecha_factura,
    p.monto,
    p.fecha AS fecha_pago,
    p.metodo_pago
FROM
    pagos p
JOIN
    clientes c ON p.cliente_id = c.id_cliente
JOIN
    facturas f ON p.factura_id = f.id_factura;


CREATE VIEW vista_ubicaciones AS
SELECT
    id_ubicaciones,
    nombre,
    direccion,
    telefono
FROM
    ubicaciones;


SELECT * FROM vista_usuarios;
SELECT * FROM vista_clientes;
SELECT * FROM vista_categorias;
SELECT * FROM vista_proveedores;
SELECT * FROM vista_financiamiento_cliente;
SELECT * FROM vista_pagos_realizados;
SELECT * FROM vista_stock;