--DATABASE CONSESIONARIA

--tablas
--PRIMERO DROPEARLAS


DROP TABLE Autos;
DROP TABLE Empleado;
DROP TABLE Proveedores;    
DROP TABLE Cliente;
DROP TABLE Ventas;
DROP TABLE Auditoria;


CREATE TABLE Autos (
ID_auto VARCHAR2(10) PRIMARY KEY,
Marca VARCHAR2(50),
Modelo VARCHAR2(50),
Ano NUMBER(4),
Precio NUMBER(10, 2),
Color VARCHAR2(30),
Descripcion VARCHAR2(500),
Fecha_disponibilidad DATE);


Create table Empleado(
id_Empleado VARCHAR2(10)PRIMARY KEY,
nombreEmpleado varchar2(100),
apellidoEmpleado1 varchar2(100),
apellidoEmpleado2 varchar2(100),
correo_empleado varchar2(100),
telefono_empleado NUMBER,
direccionEmpleado varchar2(250));


Create table Proveedores(
id_Proveedor varchar2(10)PRIMARY KEY,
ID_auto VARCHAR2(10),
nombreProveedor varchar2(100),
produtoProveedor varchar2(100),
direccionProveedor varchar2(250),
correo_proveedor varchar2(100),
telefono_proveedor NUMBER,
precio_Proveedor NUMBER,
CONSTRAINT ID_auto_FK2 FOREIGN KEY (ID_auto) REFERENCES Autos(ID_auto));


CREATE TABLE Cliente (
ID_Cliente VARCHAR2(10)PRIMARY KEY,
Nombre VARCHAR2(100),
PrimerApellido VARCHAR2(100),
SegundoApellido VARCHAR2(100),
Direccion VARCHAR2(100),
Telefono VARCHAR2(100),
Correo VARCHAR2(100));


CREATE TABLE Ventas (
id_Venta VARCHAR2(10)PRIMARY KEY,
ID_Cliente VARCHAR2(10),
descripcion_Venta VARCHAR2(250),
cantidadProducto NUMBER,
id_Empleado VARCHAR2(10),
ID_auto VARCHAR2(10),
precio_Producto NUMBER,
fecha_venta DATE,
CONSTRAINT ID_Cliente_FK FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
CONSTRAINT id_Empleado_FK FOREIGN KEY (id_Empleado) REFERENCES Empleado(id_Empleado),
CONSTRAINT ID_auto_FK FOREIGN KEY (ID_auto) REFERENCES Autos(ID_auto));


    
CREATE OR REPLACE PROCEDURE AgregarAuto(
    p_ID_auto IN VARCHAR2,
    p_Marca IN VARCHAR2,
    p_Modelo IN VARCHAR2,
    p_Ano IN NUMBER,
    p_Precio IN NUMBER,
    p_Color IN VARCHAR2,
    p_Descripcion IN VARCHAR2,
    p_Fecha_disponibilidad IN DATE
)
AS
BEGIN
    INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad)
    VALUES (p_ID_auto, p_Marca, p_Modelo, p_Ano, p_Precio, p_Color, p_Descripcion, p_Fecha_disponibilidad);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Auto agregado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al agregar el auto: ' || SQLERRM);
END;


CREATE OR REPLACE PROCEDURE EditarAuto (
    p_ID_auto IN VARCHAR2,
    p_Marca IN VARCHAR2,
    p_Modelo IN VARCHAR2,
    p_Ano IN NUMBER,
    p_Precio IN NUMBER,
    p_Color IN VARCHAR2,
    p_Descripcion IN VARCHAR2,
    p_Fecha_disponibilidad IN DATE
) AS
BEGIN
    UPDATE Autos
    SET Marca = p_Marca,
        Modelo = p_Modelo,
        Ano = p_Ano,
        Precio = p_Precio,
        Color = p_Color,
        Descripcion = p_Descripcion,
        Fecha_disponibilidad = p_Fecha_disponibilidad
    WHERE ID_auto = p_ID_auto;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Auto actualizado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el auto: ' || SQLERRM);
END;


CREATE OR REPLACE PROCEDURE eliminar_auto(
    p_ID_auto IN VARCHAR2
)
IS
BEGIN
    DELETE FROM Autos
    WHERE ID_auto = p_ID_auto;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� ning�n auto con el ID especificado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Auto eliminado exitosamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al intentar eliminar el auto: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE AgregarEmpleado(
    id_Empleado_in IN VARCHAR2,
    nombreEmpleado_in IN VARCHAR2,
    apellidoEmpleado1_in IN VARCHAR2,
    apellidoEmpleado2_in IN VARCHAR2,
    correo_empleado_in IN VARCHAR2,
    telefono_empleado_in IN NUMBER,
    direccionEmpleado_in IN VARCHAR2
)
IS
BEGIN
    INSERT INTO Empleado (
        id_Empleado,
        nombreEmpleado,
        apellidoEmpleado1,
        apellidoEmpleado2,
        correo_empleado,
        telefono_empleado,
        direccionEmpleado
    ) VALUES (
        id_Empleado_in,
        nombreEmpleado_in,
        apellidoEmpleado1_in,
        apellidoEmpleado2_in,
        correo_empleado_in,
        telefono_empleado_in,
        direccionEmpleado_in
    );
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Empleado agregado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar el empleado: ' || SQLERRM);
        ROLLBACK;
END AgregarEmpleado;

CREATE OR REPLACE PROCEDURE EditarEmpleado(
    p_idEmpleado IN VARCHAR2,
    p_nombre IN VARCHAR2,
    p_apellido1 IN VARCHAR2,
    p_apellido2 IN VARCHAR2,
    p_correo IN VARCHAR2,
    p_telefono IN NUMBER,
    p_direccion IN VARCHAR2
)
IS
BEGIN
    UPDATE Empleado
    SET nombreEmpleado = p_nombre,
        apellidoEmpleado1 = p_apellido1,
        apellidoEmpleado2 = p_apellido2,
        correo_empleado = p_correo,
        telefono_empleado = p_telefono,
        direccionEmpleado = p_direccion
    WHERE id_Empleado = p_idEmpleado;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Empleado actualizado exitosamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� ning�n empleado con el ID especificado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Se produjo un error al actualizar el empleado.');
END EditarEmpleado;

CREATE OR REPLACE PROCEDURE eliminar_empleado (
    p_id_empleado IN VARCHAR2
)
IS
BEGIN
    DELETE FROM Empleado WHERE id_Empleado = p_id_empleado;
    DBMS_OUTPUT.PUT_LINE('Empleado eliminado correctamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� ning�n empleado con el ID proporcionado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurri� un error al intentar eliminar al empleado.');
END eliminar_empleado;

CREATE OR REPLACE PROCEDURE AgregarProveedor(
    p_ID_auto IN VARCHAR2,
    p_nombreProveedor IN VARCHAR2,
    p_productoProveedor IN VARCHAR2,
    p_direccionProveedor IN VARCHAR2,
    p_correoProveedor IN VARCHAR2,
    p_telefonoProveedor IN NUMBER,
    p_precioProveedor IN NUMBER
)
IS
BEGIN
    INSERT INTO Proveedores (
        ID_auto,
        nombreProveedor,
        produtoProveedor,
        direccionProveedor,
        correo_proveedor,
        telefono_proveedor,
        precio_Proveedor
    ) VALUES (
        p_ID_auto,
        p_nombreProveedor,
        p_productoProveedor,
        p_direccionProveedor,
        p_correoProveedor,
        p_telefonoProveedor,
        p_precioProveedor
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Proveedor agregado correctamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al agregar el proveedor: ' || SQLERRM);
        ROLLBACK;
END AgregarProveedor;

CREATE OR REPLACE PROCEDURE EditarProveedor (
    p_idProveedor IN VARCHAR2,
    p_ID_auto IN VARCHAR2,
    p_nombreProveedor IN VARCHAR2,
    p_productoProveedor IN VARCHAR2,
    p_direccionProveedor IN VARCHAR2,
    p_correoProveedor IN VARCHAR2,
    p_telefonoProveedor IN NUMBER,
    p_precioProveedor IN NUMBER
)
AS
BEGIN
    UPDATE Proveedores
    SET ID_auto = p_ID_auto,
        nombreProveedor = p_nombreProveedor,
        produtoProveedor = p_productoProveedor,
        direccionProveedor = p_direccionProveedor,
        correo_proveedor = p_correoProveedor,
        telefono_proveedor = p_telefonoProveedor,
        precio_Proveedor = p_precioProveedor
    WHERE id_Proveedor = p_idProveedor;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Proveedor actualizado correctamente.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('El proveedor con ID ' || p_idProveedor || ' no existe.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el proveedor: ' || SQLERRM);
END;


CREATE OR REPLACE PROCEDURE eliminarProveedor (
    p_idProveedor IN VARCHAR2
)
AS
BEGIN
    DELETE FROM Proveedores WHERE id_Proveedor = p_idProveedor;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� ning�n proveedor con el ID especificado.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Proveedor eliminado correctamente.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al intentar eliminar el proveedor: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE agregar_venta (
    p_ID_Cliente IN VARCHAR2,
    p_descripcion_Venta IN VARCHAR2,
    p_cantidadProducto IN NUMBER,
    p_id_Empleado IN VARCHAR2,
    p_ID_auto IN VARCHAR2,
    p_precio_Producto IN NUMBER,
    p_fecha_venta IN DATE
)
IS
BEGIN
    INSERT INTO Ventas (
        ID_Cliente, 
        descripcion_Venta, 
        cantidadProducto, 
        id_Empleado, 
        ID_auto, 
        precio_Producto, 
        fecha_venta
    )
    VALUES (
        p_ID_Cliente, 
        p_descripcion_Venta, 
        p_cantidadProducto, 
        p_id_Empleado, 
        p_ID_auto, 
        p_precio_Producto, 
        p_fecha_venta
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('�Venta agregada correctamente!');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al agregar la venta: ' || SQLERRM);
END agregar_venta;

CREATE OR REPLACE PROCEDURE editar_venta (
    p_id_Venta IN VARCHAR2,
    p_ID_Cliente IN VARCHAR2,
    p_descripcion_Venta IN VARCHAR2,
    p_cantidadProducto IN NUMBER,
    p_id_Empleado IN VARCHAR2,
    p_ID_auto IN VARCHAR2,
    p_precio_Producto IN NUMBER,
    p_fecha_venta IN DATE
)
AS
BEGIN
    UPDATE Ventas
    SET 
        ID_Cliente = p_ID_Cliente,
        descripcion_Venta = p_descripcion_Venta,
        cantidadProducto = p_cantidadProducto,
        id_Empleado = p_id_Empleado,
        ID_auto = p_ID_auto,
        precio_Producto = p_precio_Producto,
        fecha_venta = p_fecha_venta
    WHERE 
        id_Venta = p_id_Venta;
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('La venta con ID ' || p_id_Venta || ' ha sido editada exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error al editar la venta: ' || SQLERRM);
END editar_venta;

CREATE OR REPLACE PROCEDURE eliminar_venta (
    p_id_Venta IN VARCHAR2
)
IS
BEGIN
    DELETE FROM Ventas
    WHERE id_Venta = p_id_Venta;
    
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� ninguna venta con el ID especificado: ' || p_id_Venta);
    ELSE
        DBMS_OUTPUT.PUT_LINE('La venta con ID ' || p_id_Venta || ' ha sido eliminada correctamente.');
        COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Ocurri� un error al intentar eliminar la venta: ' || SQLERRM);
END eliminar_venta;


CREATE OR REPLACE PROCEDURE MostrarClientes IS
    CURSOR clientes_cursor IS
        SELECT ID_Cliente, Nombre, PrimerApellido, SegundoApellido, Direccion, Telefono, Correo
        FROM Cliente;
    cliente_id Cliente.ID_Cliente%TYPE;
    cliente_nombre Cliente.Nombre%TYPE;
    cliente_apellido1 Cliente.PrimerApellido%TYPE;
    cliente_apellido2 Cliente.SegundoApellido%TYPE;
    cliente_direccion Cliente.Direccion%TYPE;
    cliente_telefono Cliente.Telefono%TYPE;
    cliente_correo Cliente.Correo%TYPE;
BEGIN
    OPEN clientes_cursor;
    LOOP
        FETCH clientes_cursor INTO cliente_id, cliente_nombre, cliente_apellido1, cliente_apellido2, cliente_direccion, cliente_telefono, cliente_correo;
        EXIT WHEN clientes_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || cliente_id || ', Nombre: ' || cliente_nombre || ' ' || cliente_apellido1 || ' ' || cliente_apellido2 || ', Direcci�n: ' || cliente_direccion || ', Tel�fono: ' || cliente_telefono || ', Correo: ' || cliente_correo);
    END LOOP;
    CLOSE clientes_cursor;
END MostrarClientes;

CREATE OR REPLACE PROCEDURE MostrarAutos IS
    CURSOR autos_cursor IS
        SELECT ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad
        FROM Autos;

    auto_id Autos.ID_auto%TYPE;
    auto_marca Autos.Marca%TYPE;
    auto_modelo Autos.Modelo%TYPE;
    auto_ano Autos.Ano%TYPE;
    auto_precio Autos.Precio%TYPE;
    auto_color Autos.Color%TYPE;
    auto_descripcion Autos.Descripcion%TYPE;
    auto_fecha_disponibilidad Autos.Fecha_disponibilidad%TYPE;
BEGIN
    OPEN autos_cursor;
    LOOP
        FETCH autos_cursor INTO auto_id, auto_marca, auto_modelo, auto_ano, auto_precio, auto_color, auto_descripcion, auto_fecha_disponibilidad;
        EXIT WHEN autos_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || auto_id || ', Marca: ' || auto_marca || ', Modelo: ' || auto_modelo || ', A�o: ' || auto_ano || ', Precio: ' || auto_precio || ', Color: ' || auto_color || ', Descripci�n: ' || auto_descripcion || ', Fecha de Disponibilidad: ' || auto_fecha_disponibilidad);
    END LOOP;
    CLOSE autos_cursor;
END;


INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A001', 'Dodge', 'Charger', 1970, 45000.00, 'Negro', 'Dodge Charger 1970, famoso por su apariencia en pel�culas y carreras', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A002', 'Dodge', 'Challenger', 1971, 42000.00, 'Rojo', 'Dodge Challenger 1971, un muscle car ic�nico con motor HEMI', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A003', 'Dodge', 'Viper GTS', 1996, 75000.00, 'Azul', 'Dodge Viper GTS 1996, un superdeportivo americano con motor V10', TO_DATE('2024-08-01', 'YYYY-MM-DD'));

INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A004', 'Ford', 'Mustang Boss 302', 1969, 50000.00, 'Amarillo', 'Ford Mustang Boss 302 1969, uno de los Mustangs m�s potentes y buscados', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A005', 'Ford', 'Mustang GT', 1987, 30000.00, 'Blanco', 'Ford Mustang GT 1987, un cl�sico de la era moderna con motor V8', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A006', 'Ford', 'Mustang Cobra R', 1993, 55000.00, 'Negro', 'Ford Mustang Cobra R 1993, una edici�n limitada dise�ada para las carreras', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A007', 'Ford', 'Thunderbird', 1955, 65000.00, 'Rojo', 'Ford Thunderbird 1955, un ic�nico auto deportivo de los 50', TO_DATE('2024-08-01', 'YYYY-MM-DD'));

INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A008', 'Chevrolet', 'Corvette Stingray', 1970, 60000.00, 'Azul', 'Chevrolet Corvette Stingray 1970, un cl�sico americano con dise�o aerodin�mico', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A009', 'Chevrolet', 'Camaro Z28', 1979, 40000.00, 'Rojo', 'Chevrolet Camaro Z28 1979, un muscle car popular con estilo agresivo', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A010', 'Chevrolet', 'Impala SS', 1996, 35000.00, 'Negro', 'Chevrolet Impala SS 1996, una versi�n de alto rendimiento del Impala', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A011', 'Chevrolet', 'El Camino', 1987, 32000.00, 'Blanco', 'Chevrolet El Camino 1987, un veh�culo h�brido entre auto y camioneta', TO_DATE('2024-08-01', 'YYYY-MM-DD'));

INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A012', 'Chevrolet', 'Monte Carlo SS', 1985, 38000.00, 'Negro', 'Chevrolet Monte Carlo SS 1985, conocido por su desempe�o en NASCAR', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A013', 'Dodge', 'Daytona', 1969, 68000.00, 'Naranja', 'Dodge Daytona 1969, un auto de carreras dise�ado para alta velocidad', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A014', 'Ford', 'GT40', 1966, 120000.00, 'Azul', 'Ford GT40 1966, legendario en Le Mans por vencer a Ferrari', TO_DATE('2024-08-01', 'YYYY-MM-DD'));
INSERT INTO Autos (ID_auto, Marca, Modelo, Ano, Precio, Color, Descripcion, Fecha_disponibilidad) VALUES 
('A015', 'Chevrolet', 'Bel Air', 1957, 70000.00, 'Turquesa', 'Chevrolet Bel Air 1957, un �cono de la cultura automotriz americana', TO_DATE('2024-08-01', 'YYYY-MM-DD'));


INSERT INTO Proveedores (id_Proveedor, ID_auto, nombreProveedor, produtoProveedor, direccionProveedor, correo_proveedor, telefono_proveedor, precio_Proveedor)VALUES
('P001', 'A001', 'Dodge Company', 'Partes para Charger', 'San Jos�, Avenida Central', 'contacto@dodgecompany.com', 85012345, 45000.00);

INSERT INTO Proveedores (id_Proveedor, ID_auto, nombreProveedor, produtoProveedor, direccionProveedor, correo_proveedor, telefono_proveedor, precio_Proveedor)VALUES
('P002', 'A004', 'Ford Motors', 'Partes para Mustang', 'Cartago, Avenida 3', 'soporte@fordmotors.com', 86023456, 50000.00);

INSERT INTO Proveedores (id_Proveedor, ID_auto, nombreProveedor, produtoProveedor, direccionProveedor, correo_proveedor, telefono_proveedor, precio_Proveedor) VALUES 
('P003', 'A008', 'Chevrolet Suppliers', 'Partes para Corvette', 'Heredia, Calle Principal', 'ventas@chevroletsuppliers.com', 87034567, 60000.00);


--auditoria


-- Creación de la tabla de auditoría
CREATE TABLE Auditoria (
    ID_Auditoria NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    Nombre_Tabla VARCHAR2(50),
    Operacion VARCHAR2(10),
    ID_Registro VARCHAR2(10),
    Usuario VARCHAR2(50),
    Fecha_Hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Valores_Antiguos CLOB,
    Valores_Nuevos CLOB
);

-- Trigger para la tabla Autos
CREATE OR REPLACE TRIGGER trg_audit_Autos
AFTER INSERT OR UPDATE OR DELETE ON Autos
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Nuevos)
        VALUES ('Autos', v_operacion, :NEW.ID_auto, USER, TO_CLOB('Marca=' || :NEW.Marca || ', Modelo=' || :NEW.Modelo || ', Ano=' || :NEW.Ano || ', Precio=' || :NEW.Precio || ', Color=' || :NEW.Color || ', Descripcion=' || :NEW.Descripcion || ', Fecha_disponibilidad=' || :NEW.Fecha_disponibilidad));
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos, Valores_Nuevos)
        VALUES ('Autos', v_operacion, :OLD.ID_auto, USER, TO_CLOB('Marca=' || :OLD.Marca || ', Modelo=' || :OLD.Modelo || ', Ano=' || :OLD.Ano || ', Precio=' || :OLD.Precio || ', Color=' || :OLD.Color || ', Descripcion=' || :OLD.Descripcion || ', Fecha_disponibilidad=' || :OLD.Fecha_disponibilidad),
                                            TO_CLOB('Marca=' || :NEW.Marca || ', Modelo=' || :NEW.Modelo || ', Ano=' || :NEW.Ano || ', Precio=' || :NEW.Precio || ', Color=' || :NEW.Color || ', Descripcion=' || :NEW.Descripcion || ', Fecha_disponibilidad=' || :NEW.Fecha_disponibilidad));
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos)
        VALUES ('Autos', v_operacion, :OLD.ID_auto, USER, TO_CLOB('Marca=' || :OLD.Marca || ', Modelo=' || :OLD.Modelo || ', Ano=' || :OLD.Ano || ', Precio=' || :OLD.Precio || ', Color=' || :OLD.Color || ', Descripcion=' || :OLD.Descripcion || ', Fecha_disponibilidad=' || :OLD.Fecha_disponibilidad));
    END IF;
END;
/

-- Trigger para la tabla Empleado
CREATE OR REPLACE TRIGGER trg_audit_Empleado
AFTER INSERT OR UPDATE OR DELETE ON Empleado
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Nuevos)
        VALUES ('Empleado', v_operacion, :NEW.id_Empleado, USER, TO_CLOB('NombreEmpleado=' || :NEW.nombreEmpleado || ', ApellidoEmpleado1=' || :NEW.apellidoEmpleado1 || ', ApellidoEmpleado2=' || :NEW.apellidoEmpleado2 || ', Correo_empleado=' || :NEW.correo_empleado || ', Telefono_empleado=' || :NEW.telefono_empleado || ', DireccionEmpleado=' || :NEW.direccionEmpleado));
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos, Valores_Nuevos)
        VALUES ('Empleado', v_operacion, :OLD.id_Empleado, USER, TO_CLOB('NombreEmpleado=' || :OLD.nombreEmpleado || ', ApellidoEmpleado1=' || :OLD.apellidoEmpleado1 || ', ApellidoEmpleado2=' || :OLD.apellidoEmpleado2 || ', Correo_empleado=' || :OLD.correo_empleado || ', Telefono_empleado=' || :OLD.telefono_empleado || ', DireccionEmpleado=' || :OLD.direccionEmpleado),
                                            TO_CLOB('NombreEmpleado=' || :NEW.nombreEmpleado || ', ApellidoEmpleado1=' || :NEW.apellidoEmpleado1 || ', ApellidoEmpleado2=' || :NEW.apellidoEmpleado2 || ', Correo_empleado=' || :NEW.correo_empleado || ', Telefono_empleado=' || :NEW.telefono_empleado || ', DireccionEmpleado=' || :NEW.direccionEmpleado));
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos)
        VALUES ('Empleado', v_operacion, :OLD.id_Empleado, USER, TO_CLOB('NombreEmpleado=' || :OLD.nombreEmpleado || ', ApellidoEmpleado1=' || :OLD.apellidoEmpleado1 || ', ApellidoEmpleado2=' || :OLD.apellidoEmpleado2 || ', Correo_empleado=' || :OLD.correo_empleado || ', Telefono_empleado=' || :OLD.telefono_empleado || ', DireccionEmpleado=' || :OLD.direccionEmpleado));
    END IF;
END;
/

-- Trigger para la tabla Proveedores
CREATE OR REPLACE TRIGGER trg_audit_Proveedores
AFTER INSERT OR UPDATE OR DELETE ON Proveedores
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Nuevos)
        VALUES ('Proveedores', v_operacion, :NEW.id_Proveedor, USER, TO_CLOB('ID_auto=' || :NEW.ID_auto || ', NombreProveedor=' || :NEW.nombreProveedor || ', ProductoProveedor=' || :NEW.produtoProveedor || ', DireccionProveedor=' || :NEW.direccionProveedor || ', Correo_proveedor=' || :NEW.correo_proveedor || ', Telefono_proveedor=' || :NEW.telefono_proveedor || ', Precio_Proveedor=' || :NEW.precio_Proveedor));
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos, Valores_Nuevos)
        VALUES ('Proveedores', v_operacion, :OLD.id_Proveedor, USER, TO_CLOB('ID_auto=' || :OLD.ID_auto || ', NombreProveedor=' || :OLD.nombreProveedor || ', ProductoProveedor=' || :OLD.produtoProveedor || ', DireccionProveedor=' || :OLD.direccionProveedor || ', Correo_proveedor=' || :OLD.correo_proveedor || ', Telefono_proveedor=' || :OLD.telefono_proveedor || ', Precio_Proveedor=' || :OLD.precio_Proveedor),
                                            TO_CLOB('ID_auto=' || :NEW.ID_auto || ', NombreProveedor=' || :NEW.nombreProveedor || ', ProductoProveedor=' || :NEW.produtoProveedor || ', DireccionProveedor=' || :NEW.direccionProveedor || ', Correo_proveedor=' || :NEW.correo_proveedor || ', Telefono_proveedor=' || :NEW.telefono_proveedor || ', Precio_Proveedor=' || :NEW.precio_Proveedor));
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos)
        VALUES ('Proveedores', v_operacion, :OLD.id_Proveedor, USER, TO_CLOB('ID_auto=' || :OLD.ID_auto || ', NombreProveedor=' || :OLD.nombreProveedor || ', ProductoProveedor=' || :OLD.produtoProveedor || ', DireccionProveedor=' || :OLD.direccionProveedor || ', Correo_proveedor=' || :OLD.correo_proveedor || ', Telefono_proveedor=' || :OLD.telefono_proveedor || ', Precio_Proveedor=' || :OLD.precio_Proveedor));
    END IF;
END;
/

-- Trigger para la tabla Cliente
CREATE OR REPLACE TRIGGER trg_audit_Cliente
AFTER INSERT OR UPDATE OR DELETE ON Cliente
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Nuevos)
        VALUES ('Cliente', v_operacion, :NEW.ID_Cliente, USER, TO_CLOB('Nombre=' || :NEW.Nombre || ', PrimerApellido=' || :NEW.PrimerApellido || ', SegundoApellido=' || :NEW.SegundoApellido || ', Direccion=' || :NEW.Direccion || ', Telefono=' || :NEW.Telefono || ', Correo=' || :NEW.Correo));
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos, Valores_Nuevos)
        VALUES ('Cliente', v_operacion, :OLD.ID_Cliente, USER, TO_CLOB('Nombre=' || :OLD.Nombre || ', PrimerApellido=' || :OLD.PrimerApellido || ', SegundoApellido=' || :OLD.SegundoApellido || ', Direccion=' || :OLD.Direccion || ', Telefono=' || :OLD.Telefono || ', Correo=' || :OLD.Correo),
                                            TO_CLOB('Nombre=' || :NEW.Nombre || ', PrimerApellido=' || :NEW.PrimerApellido || ', SegundoApellido=' || :NEW.SegundoApellido || ', Direccion=' || :NEW.Direccion || ', Telefono=' || :NEW.Telefono || ', Correo=' || :NEW.Correo));
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos)
        VALUES ('Cliente', v_operacion, :OLD.ID_Cliente, USER, TO_CLOB('Nombre=' || :OLD.Nombre || ', PrimerApellido=' || :OLD.PrimerApellido || ', SegundoApellido=' || :OLD.SegundoApellido || ', Direccion=' || :OLD.Direccion || ', Telefono=' || :OLD.Telefono || ', Correo=' || :OLD.Correo));
    END IF;
END;
/

-- Trigger para la tabla Ventas
CREATE OR REPLACE TRIGGER trg_audit_Ventas
AFTER INSERT OR UPDATE OR DELETE ON Ventas
FOR EACH ROW
DECLARE
    v_operacion VARCHAR2(10);
BEGIN
    IF INSERTING THEN
        v_operacion := 'INSERT';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Nuevos)
        VALUES ('Ventas', v_operacion, :NEW.id_Venta, USER, TO_CLOB('ID_Cliente=' || :NEW.ID_Cliente || ', Descripcion_Venta=' || :NEW.descripcion_Venta || ', CantidadProducto=' || :NEW.cantidadProducto || ', ID_Empleado=' || :NEW.id_Empleado || ', ID_auto=' || :NEW.ID_auto || ', Precio_Producto=' || :NEW.precio_Producto || ', Fecha_venta=' || :NEW.fecha_venta));
    ELSIF UPDATING THEN
        v_operacion := 'UPDATE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos, Valores_Nuevos)
        VALUES ('Ventas', v_operacion, :OLD.id_Venta, USER, TO_CLOB('ID_Cliente=' || :OLD.ID_Cliente || ', Descripcion_Venta=' || :OLD.descripcion_Venta || ', CantidadProducto=' || :OLD.cantidadProducto || ', ID_Empleado=' || :OLD.id_Empleado || ', ID_auto=' || :OLD.ID_auto || ', Precio_Producto=' || :OLD.precio_Producto || ', Fecha_venta=' || :OLD.fecha_venta),
                                            TO_CLOB('ID_Cliente=' || :NEW.ID_Cliente || ', Descripcion_Venta=' || :NEW.descripcion_Venta || ', CantidadProducto=' || :NEW.cantidadProducto || ', ID_Empleado=' || :NEW.id_Empleado || ', ID_auto=' || :NEW.ID_auto || ', Precio_Producto=' || :NEW.precio_Producto || ', Fecha_venta=' || :NEW.fecha_venta));
    ELSIF DELETING THEN
        v_operacion := 'DELETE';
        INSERT INTO Auditoria (Nombre_Tabla, Operacion, ID_Registro, Usuario, Valores_Antiguos)
        VALUES ('Ventas', v_operacion, :OLD.id_Venta, USER, TO_CLOB('ID_Cliente=' || :OLD.ID_Cliente || ', Descripcion_Venta=' || :OLD.descripcion_Venta || ', CantidadProducto=' || :OLD.cantidadProducto || ', ID_Empleado=' || :OLD.id_Empleado || ', ID_auto=' || :OLD.ID_auto || ', Precio_Producto=' || :OLD.precio_Producto || ', Fecha_venta=' || :OLD.fecha_venta));
    END IF;
END;
/



