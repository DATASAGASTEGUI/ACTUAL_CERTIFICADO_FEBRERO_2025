****************
***   0001   ***
****************
--------------------------------------------------------------------------------
1. Tipos Escalares Básicos
--------------------------------------------------------------------------------
-- Retorna un número
CREATE OR REPLACE FUNCTION fn_retorna_numero RETURN NUMBER IS
BEGIN
  RETURN 123.45;
END;
/
-- Retorna un varchar2
CREATE OR REPLACE FUNCTION fn_retorna_varchar RETURN VARCHAR2 IS
BEGIN
  RETURN 'Hola Mundo';
END;
/
-- Retorna un char
CREATE OR REPLACE FUNCTION fn_retorna_char RETURN CHAR IS
BEGIN
  RETURN 'Y';
END;
/
-- Retorna un date
CREATE OR REPLACE FUNCTION fn_retorna_fecha RETURN DATE IS
BEGIN
  RETURN TO_DATE('2023-01-01', 'YYYY-MM-DD');
END;
/
-- Retorna un timestamp
CREATE OR REPLACE FUNCTION fn_retorna_timestamp RETURN TIMESTAMP IS
BEGIN
  RETURN CURRENT_TIMESTAMP;
END;
/
-- Retorna un booleano (solo en PL/SQL, no en SQL)
CREATE OR REPLACE FUNCTION fn_retorna_booleano RETURN BOOLEAN IS
BEGIN
  RETURN TRUE;
END;
/
--------------------------------------------------------------------------------
2. Tipos Compuestos
--------------------------------------------------------------------------------
-- Retorna un registro (RECORD)
CREATE OR REPLACE PACKAGE pkg_ejemplo AS
  TYPE t_empleado IS RECORD (
    id NUMBER,
    nombre VARCHAR2(100),
    salario NUMBER
  );
  
  FUNCTION fn_retorna_record RETURN t_empleado;
END pkg_ejemplo;
/

CREATE OR REPLACE PACKAGE BODY pkg_ejemplo AS
  FUNCTION fn_retorna_record RETURN t_empleado IS
    v_emp t_empleado;
  BEGIN
    v_emp.id := 1;
    v_emp.nombre := 'Juan Pérez';
    v_emp.salario := 2500;
    RETURN v_emp;
  END;
END pkg_ejemplo;
/
-- Retorna una fila de tabla (ROWTYPE)
CREATE OR REPLACE FUNCTION fn_retorna_rowtype RETURN employees%ROWTYPE IS
  v_emp employees%ROWTYPE;
BEGIN
  SELECT * INTO v_emp FROM employees WHERE employee_id = 100;
  RETURN v_emp;
END;
/
--------------------------------------------------------------------------------
3. Tipos de Colección
--------------------------------------------------------------------------------
-- Retorna una tabla anidada (nested table)
CREATE OR REPLACE TYPE t_nombres IS TABLE OF VARCHAR2(100);
/

CREATE OR REPLACE FUNCTION fn_retorna_nested_table RETURN t_nombres IS
  v_lista t_nombres := t_nombres();
BEGIN
  v_lista.EXTEND(3);
  v_lista(1) := 'Ana';
  v_lista(2) := 'Carlos';
  v_lista(3) := 'María';
  RETURN v_lista;
END;
/
-- Retorna un array asociativo (INDEX BY)
CREATE OR REPLACE FUNCTION fn_retorna_array_asociativo RETURN SYS.ODCIVARCHAR2LIST IS
  v_array SYS.ODCIVARCHAR2LIST;
BEGIN
  v_array := SYS.ODCIVARCHAR2LIST();
  v_array.EXTEND(2);
  v_array(1) := 'Primero';
  v_array(2) := 'Segundo';
  RETURN v_array;
END;
/
-- Retorna un VARRAY
CREATE OR REPLACE TYPE t_varray AS VARRAY(5) OF NUMBER;
/

CREATE OR REPLACE FUNCTION fn_retorna_varray RETURN t_varray IS
  v_nums t_varray := t_varray();
BEGIN
  v_nums.EXTEND(3);
  v_nums(1) := 10;
  v_nums(2) := 20;
  v_nums(3) := 30;
  RETURN v_nums;
END;
/
--------------------------------------------------------------------------------
4. Tipos de Objeto
--------------------------------------------------------------------------------
-- Retorna un objeto definido por usuario
CREATE OR REPLACE TYPE t_persona AS OBJECT (
  id NUMBER,
  nombre VARCHAR2(100),
  fecha_nac DATE
);
/

CREATE OR REPLACE FUNCTION fn_retorna_objeto RETURN t_persona IS
  v_persona t_persona;
BEGIN
  v_persona := t_persona(1, 'Laura Gómez', TO_DATE('1990-05-15', 'YYYY-MM-DD'));
  RETURN v_persona;
END;
/
--------------------------------------------------------------------------------
5. Tipos LOB
--------------------------------------------------------------------------------
-- Retorna un CLOB
CREATE OR REPLACE FUNCTION fn_retorna_clob RETURN CLOB IS
  v_texto CLOB;
BEGIN
  v_texto := 'Este es un texto muy largo...';
  RETURN v_texto;
END;
/
-- Retorna un BLOB
CREATE OR REPLACE FUNCTION fn_retorna_blob RETURN BLOB IS
  v_imagen BLOB;
BEGIN
  -- Código para cargar datos binarios
  RETURN v_imagen;
END;
/
-- Retorna un BFILE
CREATE OR REPLACE FUNCTION fn_retorna_bfile RETURN BFILE IS
  v_archivo BFILE;
BEGIN
  v_archivo := BFILENAME('DIR_IMAGENES', 'foto.jpg');
  RETURN v_archivo;
END;
/
--------------------------------------------------------------------------------
6. Tipos XML y JSON
--------------------------------------------------------------------------------
-- Retorna XMLType
CREATE OR REPLACE FUNCTION fn_retorna_xml RETURN XMLTYPE IS
BEGIN
  RETURN XMLTYPE('<empleado><id>101</id><nombre>Pedro</nombre></empleado>');
END;
/
-- Retorna JSON (Oracle 12c+)
CREATE OR REPLACE FUNCTION fn_retorna_json RETURN VARCHAR2 IS
BEGIN
  RETURN JSON_OBJECT('id' VALUE 101, 'nombre' VALUE 'Pedro');
END;
/
--------------------------------------------------------------------------------
7. Tipos de Referencia
--------------------------------------------------------------------------------
-- Retorna un REF CURSOR
CREATE OR REPLACE FUNCTION fn_retorna_refcursor RETURN SYS_REFCURSOR IS
  v_cursor SYS_REFCURSOR;
BEGIN
  OPEN v_cursor FOR SELECT * FROM employees;
  RETURN v_cursor;
END;
/
-- Retorna una referencia a objeto
CREATE OR REPLACE FUNCTION fn_retorna_ref_objeto RETURN REF t_persona IS
  v_ref REF t_persona;
BEGIN
  SELECT REF(p) INTO v_ref FROM personas_tab p WHERE id = 1;
  RETURN v_ref;
END;
/
--------------------------------------------------------------------------------
8. Tipos Espaciales (Spatial)
--------------------------------------------------------------------------------
-- Retorna un objeto SDO_GEOMETRY
CREATE OR REPLACE FUNCTION fn_retorna_geometria RETURN SDO_GEOMETRY IS
BEGIN
  RETURN SDO_GEOMETRY(
    2001, -- Tipo: punto
    NULL,
    SDO_POINT_TYPE(10, 20, NULL),
    NULL,
    NULL
  );
END;
/
--------------------------------------------------------------------------------
Estos ejemplos cubren la mayoría de los tipos de datos  que  puede  retornar una 
función definida por usuario en Oracle PL/SQL.
--------------------------------------------------------------------------------
****************
***   0002   ***
****************
--------------------------------------------------------------------------------
1. Funciones que Retornan Tipos Escalares
--------------------------------------------------------------------------------
-- Retorna un VARCHAR2 (nombre de vendedor)
CREATE OR REPLACE FUNCTION fn_nombre_vendedor(p_id IN Vendedor.idVendedor%TYPE)
RETURN VARCHAR2 IS
  v_nombre Vendedor.nombre%TYPE;
BEGIN
  SELECT nombre INTO v_nombre FROM Vendedor WHERE idVendedor = p_id;
  RETURN v_nombre;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No existe';
END;
/
-- 1. Llamar a la función desde PL/SQL
SET SERVEROUTPUT ON;
DECLARE
  v_id_vendedor Vendedor.idVendedor%TYPE := 101; -- Puedes cambiar este valor
  v_nombre VARCHAR2(100);
BEGIN
  -- Llamada a la función
  v_nombre := fn_nombre_vendedor(v_id_vendedor);
  
  -- Manejo del retorno
  IF v_nombre = 'No existe' THEN
    DBMS_OUTPUT.PUT_LINE('El vendedor con ID ' || v_id_vendedor || ' no fue encontrado');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nombre del vendedor: ' || v_nombre);
  END IF;
END;
/
-- 2. Uso en una consulta SQL
-- Consulta para varios vendedores (incluyendo uno que no existe)
SELECT 
  idVendedor,
  fn_nombre_vendedor(idVendedor) AS nombre_vendedor,
  CASE 
    WHEN fn_nombre_vendedor(idVendedor) = 'No existe' THEN 'INEXISTENTE'
    ELSE 'REGISTRADO'
  END AS estado
FROM 
  (SELECT 101 AS idVendedor FROM DUAL 
   UNION ALL -- Existe
   SELECT 999 FROM DUAL 
   UNION ALL -- No existe
   SELECT 105 FROM DUAL) -- Existe
ORDER BY estado;

-- 3. Integración en una aplicación (ejemplo en Java con JDBC)
// Ejemplo en Java
public String obtenerNombreVendedor(int idVendedor) {
    String sql = "SELECT fn_nombre_vendedor(?) FROM DUAL";
    try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
         PreparedStatement pstmt = conn.prepareStatement(sql)) {
        
        pstmt.setInt(1, idVendedor);
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            String resultado = rs.getString(1);
            if ("No existe".equals(resultado)) {
                return "Vendedor no encontrado, por favor verifique el ID";
            } else {
                return "Nombre del vendedor: " + resultado;
            }
        }
    } catch (SQLException e) {
        return "Error al consultar la base de datos: " + e.getMessage();
    }
    return "";
}

-- 4. Uso en un procedimiento almacenado

CREATE OR REPLACE PROCEDURE sp_mostrar_info_vendedor(
  p_id_vendedor IN Vendedor.idVendedor%TYPE
) IS
  v_nombre VARCHAR2(100);
BEGIN
  -- Llamada a la función
  v_nombre := fn_nombre_vendedor(p_id_vendedor);
  
  -- Manejo del resultado
  IF v_nombre = 'No existe' THEN
    -- Registrar en tabla de errores
    INSERT INTO errores_proceso(codigo, mensaje, fecha)
    VALUES('VEND_NO_EXISTE', 'Vendedor ' || p_id_vendedor || ' no existe', SYSDATE);
    
    -- Opcional: lanzar excepción personalizada
    RAISE_APPLICATION_ERROR(-20001, 'El vendedor especificado no existe');
  ELSE
    -- Procesamiento normal
    DBMS_OUTPUT.PUT_LINE('Procesando información para: ' || v_nombre);
    -- Aquí iría el resto de la lógica del procedimiento
  END IF;
END;
/

-- Ejemplo de llamada al procedimiento
BEGIN
  sp_mostrar_info_vendedor(101); -- Existe
  sp_mostrar_info_vendedor(999); -- No existe
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- 5. Versión mejorada de la función original

Si quieres hacer la función aún más robusta:


CREATE OR REPLACE FUNCTION fn_nombre_vendedor_mejorada(
  p_id IN Vendedor.idVendedor%TYPE,
  p_default_msg IN VARCHAR2 DEFAULT 'No encontrado'
) RETURN VARCHAR2 IS
  v_nombre Vendedor.nombre%TYPE;
BEGIN
  IF p_id IS NULL THEN
    RETURN 'ID no puede ser nulo';
  END IF;
  
  SELECT nombre INTO v_nombre 
  FROM Vendedor 
  WHERE idVendedor = p_id;
  
  RETURN v_nombre;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN p_default_msg; -- Mensaje personalizable
  WHEN TOO_MANY_ROWS THEN
    RETURN 'Error: múltiples vendedores con mismo ID';
  WHEN OTHERS THEN
    RETURN 'Error al consultar: ' || SQLERRM;
END;
/

-- Ejemplo de uso de la función mejorada
SELECT 
  fn_nombre_vendedor_mejorada(101) AS vendedor_existente,
  fn_nombre_vendedor_mejorada(999) AS vendedor_inexistente,
  fn_nombre_vendedor_mejorada(NULL) AS id_nulo,
  fn_nombre_vendedor_mejorada(999, 'Vendedor no registrado') AS mensaje_personalizado
FROM DUAL;
Recomendaciones para el manejo del "no existe"
Registrar el evento: Cuando detectes que un vendedor no existe, considera registrar este evento en una tabla de logs.

Mensajes personalizables: Como en la versión mejorada, permite personalizar el mensaje de retorno.

Documentación: Documenta claramente el comportamiento de la función cuando no encuentra datos.

Consistencia: Mantén el mismo patrón de manejo de "no existe" en todas tus funciones similares.

Pruebas: Asegúrate de probar ambos casos (existente y no existente) en tus pruebas unitarias.
--------------------------------------------------------------------------------
-- Retorna un NUMBER (total de ventas de una oficina)
CREATE OR REPLACE FUNCTION fn_total_ventas_oficina(p_id IN Oficina.idOficina%TYPE)
RETURN NUMBER IS
  v_total NUMBER(10,2);
BEGIN
  SELECT SUM(ventas) INTO v_total FROM Vendedor WHERE idOficina = p_id;
  RETURN NVL(v_total, 0);
END;
/

-- Retorna un DATE (fecha de contrato más antigua)
CREATE OR REPLACE FUNCTION fn_fecha_contrato_antigua
RETURN DATE IS
  v_fecha DATE;
BEGIN
  SELECT MIN(contrato) INTO v_fecha FROM Vendedor;
  RETURN v_fecha;
END;
/
--------------------------------------------------------------------------------
2. Funciones que Retornan Tipos Compuestos
--------------------------------------------------------------------------------
-- Retorna un RECORD con datos de un vendedor
CREATE OR REPLACE PACKAGE pkg_vendedores AS
  TYPE t_vendedor IS RECORD (
    id Vendedor.idVendedor%TYPE,
    nombre Vendedor.nombre%TYPE,
    edad Vendedor.edad%TYPE,
    ventas Vendedor.ventas%TYPE
  );
  
  FUNCTION fn_info_vendedor(p_id IN Vendedor.idVendedor%TYPE) RETURN t_vendedor;
END pkg_vendedores;
/

CREATE OR REPLACE PACKAGE BODY pkg_vendedores AS
  FUNCTION fn_info_vendedor(p_id IN Vendedor.idVendedor%TYPE) RETURN t_vendedor IS
    v_vendedor t_vendedor;
  BEGIN
    SELECT idVendedor, nombre, edad, ventas 
    INTO v_vendedor.id, v_vendedor.nombre, v_vendedor.edad, v_vendedor.ventas
    FROM Vendedor WHERE idVendedor = p_id;
    
    RETURN v_vendedor;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_vendedor.id := NULL;
      RETURN v_vendedor;
  END;
END pkg_vendedores;
/

-- Retorna una fila completa de una tabla (ROWTYPE)
CREATE OR REPLACE FUNCTION fn_vendedor_completo(p_id IN Vendedor.idVendedor%TYPE)
RETURN Vendedor%ROWTYPE IS
  v_vendedor Vendedor%ROWTYPE;
BEGIN
  SELECT * INTO v_vendedor FROM Vendedor WHERE idVendedor = p_id;
  RETURN v_vendedor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/
--------------------------------------------------------------------------------
3. Funciones que Retornan Colecciones
--------------------------------------------------------------------------------
-- Retorna una tabla anidada con IDs de clientes de un vendedor
CREATE OR REPLACE TYPE t_ids_clientes IS TABLE OF INTEGER;
/

CREATE OR REPLACE FUNCTION fn_clientes_por_vendedor(p_id IN Vendedor.idVendedor%TYPE)
RETURN t_ids_clientes IS
  v_clientes t_ids_clientes := t_ids_clientes();
  CURSOR c_clientes IS
    SELECT idCliente FROM Cliente WHERE idVendedor = p_id;
BEGIN
  FOR r_cliente IN c_clientes LOOP
    v_clientes.EXTEND;
    v_clientes(v_clientes.COUNT) := r_cliente.idCliente;
  END LOOP;
  
  RETURN v_clientes;
END;
/

-- Retorna un VARRAY con nombres de productos
CREATE OR REPLACE TYPE t_nombres_productos AS VARRAY(50) OF VARCHAR2(20);
/

CREATE OR REPLACE FUNCTION fn_productos_populares
RETURN t_nombres_productos IS
  v_productos t_nombres_productos := t_nombres_productos();
BEGIN
  v_productos.EXTEND(3);
  v_productos(1) := 'Union Trinquete';
  v_productos(2) := 'Desmontador';
  v_productos(3) := 'Reductor';
  
  RETURN v_productos;
END;
/
--------------------------------------------------------------------------------
4. Funciones que Retornan Cursor (REF CURSOR)
--------------------------------------------------------------------------------
-- Retorna un cursor con información de pedidos de un cliente
CREATE OR REPLACE FUNCTION fn_pedidos_cliente(p_id IN Cliente.idCliente%TYPE)
RETURN SYS_REFCURSOR IS
  v_cursor SYS_REFCURSOR;
BEGIN
  OPEN v_cursor FOR
    SELECT p.idPedido, p.fecha_pedido, pr.descripcion, p.cantidad, p.importe
    FROM Pedido p
    JOIN Producto pr ON p.idFabrica = pr.idFabrica AND p.idProducto = pr.idProducto
    WHERE p.idCliente = p_id
    ORDER BY p.fecha_pedido DESC;
    
  RETURN v_cursor;
END;
/

-- Retorna un cursor con el ranking de vendedores
CREATE OR REPLACE FUNCTION fn_ranking_vendedores
RETURN SYS_REFCURSOR IS
  v_cursor SYS_REFCURSOR;
BEGIN
  OPEN v_cursor FOR
    SELECT idVendedor, nombre, ventas, RANK() OVER (ORDER BY ventas DESC) as ranking
    FROM Vendedor
    WHERE ventas > 0
    ORDER BY ventas DESC;
    
  RETURN v_cursor;
END;
/
--------------------------------------------------------------------------------
5. Funciones que Retornan Objetos
--------------------------------------------------------------------------------
-- Primero creamos un tipo objeto para representar una oficina
CREATE OR REPLACE TYPE t_oficina_obj AS OBJECT (
  id INTEGER,
  ciudad VARCHAR2(20),
  region VARCHAR2(20),
  ventas NUMBER(10,2),
  objetivo NUMBER(10,2),
  MEMBER FUNCTION porcentaje_cumplimiento RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY t_oficina_obj AS
  MEMBER FUNCTION porcentaje_cumplimiento RETURN NUMBER IS
  BEGIN
    RETURN (ventas/objetivo)*100;
  END;
END;
/

-- Función que retorna un objeto oficina
CREATE OR REPLACE FUNCTION fn_oficina_obj(p_id IN Oficina.idOficina%TYPE)
RETURN t_oficina_obj IS
  v_oficina t_oficina_obj;
  v_rec Oficina%ROWTYPE;
BEGIN
  SELECT * INTO v_rec FROM Oficina WHERE idOficina = p_id;
  
  v_oficina := t_oficina_obj(
    v_rec.idOficina,
    v_rec.ciudad,
    v_rec.region,
    v_rec.ventas,
    v_rec.objetivo
  );
  
  RETURN v_oficina;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/
--------------------------------------------------------------------------------
6. Funciones que Retornan XML o JSON
--------------------------------------------------------------------------------
-- Retorna datos de un pedido en formato XML
CREATE OR REPLACE FUNCTION fn_pedido_xml(p_id IN Pedido.idPedido%TYPE)
RETURN XMLTYPE IS
  v_xml XMLTYPE;
BEGIN
  SELECT XMLELEMENT("Pedido",
           XMLATTRIBUTES(
             p.idPedido AS "id",
             p.fecha_pedido AS "fecha"
           ),
           XMLELEMENT("Cliente", c.empresa),
           XMLELEMENT("Vendedor", v.nombre),
           XMLELEMENT("Producto", pr.descripcion),
           XMLELEMENT("Cantidad", p.cantidad),
           XMLELEMENT("Importe", p.importe)
         )
  INTO v_xml
  FROM Pedido p
  JOIN Cliente c ON p.idCliente = c.idCliente
  JOIN Vendedor v ON p.idVendedor = v.idVendedor
  JOIN Producto pr ON p.idFabrica = pr.idFabrica AND p.idProducto = pr.idProducto
  WHERE p.idPedido = p_id;
  
  RETURN v_xml;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/

-- Retorna datos de un cliente en formato JSON (Oracle 12c+)
CREATE OR REPLACE FUNCTION fn_cliente_json(p_id IN Cliente.idCliente%TYPE)
RETURN VARCHAR2 IS
  v_json VARCHAR2(1000);
BEGIN
  SELECT JSON_OBJECT(
           'id' VALUE c.idCliente,
           'empresa' VALUE c.empresa,
           'limiteCredito' VALUE c.limite_credito,
           'vendedor' VALUE v.nombre
         )
  INTO v_json
  FROM Cliente c
  JOIN Vendedor v ON c.idVendedor = v.idVendedor
  WHERE c.idCliente = p_id;
  
  RETURN v_json;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN '{}';
END;
/
--------------------------------------------------------------------------------
7. Funciones con Lógica Compleja
--------------------------------------------------------------------------------
-- Retorna el nivel jerárquico de un vendedor
CREATE OR REPLACE FUNCTION fn_nivel_jerarquico(p_id IN Vendedor.idVendedor%TYPE)
RETURN VARCHAR2 IS
  v_nivel VARCHAR2(20);
  v_jefe Vendedor.idVendedorJefe%TYPE;
BEGIN
  -- Si no tiene jefe, es director
  SELECT idVendedorJefe INTO v_jefe FROM Vendedor WHERE idVendedor = p_id;
  
  IF v_jefe IS NULL THEN
    v_nivel := 'Director';
  ELSE
    -- Verificamos si el jefe es director
    BEGIN
      SELECT 'Director' INTO v_nivel 
      FROM Vendedor 
      WHERE idVendedor = v_jefe AND idVendedorJefe IS NULL;
      
      v_nivel := 'Supervisor';
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_nivel := 'Vendedor';
    END;
  END IF;
  
  RETURN v_nivel;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'No existe';
END;
/

-- Retorna el desempeño de un vendedor (texto descriptivo)
CREATE OR REPLACE FUNCTION fn_desempenio_vendedor(p_id IN Vendedor.idVendedor%TYPE)
RETURN VARCHAR2 IS
  v_ventas Vendedor.ventas%TYPE;
  v_cuota Vendedor.cuota%TYPE;
  v_desempenio VARCHAR2(30);
BEGIN
  SELECT ventas, NVL(cuota, 0) INTO v_ventas, v_cuota 
  FROM Vendedor 
  WHERE idVendedor = p_id;
  
  IF v_cuota = 0 THEN
    v_desempenio := 'Sin cuota asignada';
  ELSIF v_ventas >= v_cuota * 1.5 THEN
    v_desempenio := 'Excelente';
  ELSIF v_ventas >= v_cuota THEN
    v_desempenio := 'Bueno';
  ELSIF v_ventas >= v_cuota * 0.75 THEN
    v_desempenio := 'Aceptable';
  ELSE
    v_desempenio := 'Por debajo';
  END IF;
  
  RETURN v_desempenio;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Vendedor no existe';
END;
/
--------------------------------------------------------------------------------
Estos  ejemplos  muestran  cómo  puedes  crear  funciones en Oracle que retornen 
diversos tipos de datos  basados  en  tu esquema  de base  de datos, desde tipos 
simples hasta estructuras complejas.
--------------------------------------------------------------------------------








CREATE TABLE Vendedor (
  idVendedor NUMBER PRIMARY KEY,
  nombre VARCHAR2(100),
  edad NUMBER,
  ventas NUMBER
);

INSERT INTO Vendedor VALUES (1, 'Juan Pérez', 35, 150000);
INSERT INTO Vendedor VALUES (2, 'María Gómez', 28, 95000);

-- Primero declaramos el tipo RECORD (estructura de datos personalizada)
CREATE OR REPLACE TYPE t_vendedor AS OBJECT (
  id NUMBER,
  nombre VARCHAR2(100),
  edad NUMBER,
  ventas NUMBER
);
/

-- Luego creamos la función que devuelve este tipo
CREATE OR REPLACE FUNCTION fn_info_vendedor_simple(p_id IN NUMBER) 
RETURN t_vendedor IS
  v_vendedor t_vendedor := t_vendedor(NULL, NULL, NULL, NULL);
  v_temp_row Vendedor%ROWTYPE;
BEGIN
  -- Primero intentamos obtener los datos
  SELECT * INTO v_temp_row FROM Vendedor WHERE idVendedor = p_id;
  
  -- Llenamos nuestro record personalizado
  v_vendedor.id := v_temp_row.idVendedor;
  v_vendedor.nombre := v_temp_row.nombre;
  v_vendedor.edad := v_temp_row.edad;
  v_vendedor.ventas := v_temp_row.ventas;
  
  RETURN v_vendedor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN v_vendedor; -- Retorna el record con todos los campos NULL
END;
/

Ejemplo de uso:

DECLARE
  v_datos t_vendedor;
BEGIN
  v_datos := fn_info_vendedor_simple(1);
  
  IF v_datos.id IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Vendedor: ' || v_datos.nombre || 
                         ', Edad: ' || v_datos.edad || 
                         ', Ventas: $' || v_datos.ventas);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Vendedor no encontrado');
  END IF;
END;
/
--------------------------------------------------------------------------------
-- 2. Usando %ROWTYPE (la forma más simple)

CREATE OR REPLACE FUNCTION fn_vendedor_completo_simple(p_id IN NUMBER)
RETURN Vendedor%ROWTYPE IS
  v_vendedor Vendedor%ROWTYPE;
BEGIN
  SELECT * INTO v_vendedor FROM Vendedor WHERE idVendedor = p_id;
  RETURN v_vendedor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/

-- Ejemplo de uso:

DECLARE
  v_vendedor Vendedor%ROWTYPE;
BEGIN
  v_vendedor := fn_vendedor_completo_simple(2);
  
  IF v_vendedor IS NOT NULL THEN
    DBMS_OUTPUT.PUT_LINE('Vendedor: ' || v_vendedor.nombre || 
                         ', Ventas: $' || v_vendedor.ventas);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Vendedor no encontrado');
  END IF;
END;
/
----------------
Comparación para tus alumnos
Característica	RECORD Personalizado	%ROWTYPE
Declaración	Requiere definir tipo	Usa estructura de tabla
Flexibilidad	Puedes elegir campos	Todos los campos de tabla
Sincronización	Manual con tabla	Automática con cambios en tabla
Manejo de NULL	Campos individuales NULL	Retorna NULL completo
Complejidad	Mayor (definir tipo)	Menor (usa tabla directamente)
Consejos para la enseñanza
Empieza con %ROWTYPE: Es más fácil de entender porque se relaciona directamente con la tabla.

Luego introduce RECORD: Cuando entiendan %ROWTYPE, muestra cómo crear estructuras personalizadas.

Ejemplo visual:

%ROWTYPE: Como una fotocopia de toda una fila de la tabla

RECORD: Como un formulario donde seleccionas qué campos copiar

Actividad práctica:

Que creen una función con %ROWTYPE para otra tabla (ej. Clientes)

Luego que creen un RECORD personalizado con solo 2 campos que les interesen

¿Quieres que desarrolle alguna parte específica con más detalle para tus alumnos?