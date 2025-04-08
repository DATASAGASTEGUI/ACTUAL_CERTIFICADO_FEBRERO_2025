-- Para eliminar un procedimiento si existe
DROP PROCEDURE IF EXISTS nombre_procedimiento;

-- Para eliminar una función si existe
DROP FUNCTION IF EXISTS nombre_funcion;
****************
***   0001   ***
****************
--------------------------------------------------------------------------------
1. Procedimiento Básico: Aumentar Ventas de una Oficina
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE aumentar_ventas_oficina (
    p_id_oficina IN Oficina.idOficina%TYPE,
    p_monto_aumento IN NUMBER
) AS
    v_ventas_actuales NUMBER;
BEGIN
    -- Obtener las ventas actuales
    SELECT ventas INTO v_ventas_actuales
    FROM Oficina
    WHERE idOficina = p_id_oficina;
    
    -- Actualizar las ventas
    UPDATE Oficina
    SET ventas = ventas + p_monto_aumento
    WHERE idOficina = p_id_oficina;
    
    -- Mostrar mensaje
    DBMS_OUTPUT.PUT_LINE('Oficina ' || p_id_oficina || 
                         ': Ventas aumentadas de ' || v_ventas_actuales || 
                         ' a ' || (v_ventas_actuales + p_monto_aumento));
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Oficina no encontrada');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END aumentar_ventas_oficina;
/
--------------------------------------------------------------------------------
2. Procedimiento con Parámetros OUT: Obtener Información de Vendedor
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE obtener_info_vendedor (
    p_id_vendedor IN Vendedor.idVendedor%TYPE,
    p_nombre OUT Vendedor.nombre%TYPE,
    p_ventas OUT Vendedor.ventas%TYPE,
    p_oficina OUT Vendedor.idOficina%TYPE
) AS
BEGIN
    SELECT nombre, ventas, idOficina
    INTO p_nombre, p_ventas, p_oficina
    FROM Vendedor
    WHERE idVendedor = p_id_vendedor;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Vendedor no encontrado');
        p_nombre := NULL;
        p_ventas := NULL;
        p_oficina := NULL;
END obtener_info_vendedor;
/

-- LLAMAR

DECLARE
    v_nombre Vendedor.nombre%TYPE;
    v_ventas Vendedor.ventas%TYPE;
    v_oficina Vendedor.idOficina%TYPE;
BEGIN
    -- Llamar al procedimiento con ID de vendedor 123
    obtener_info_vendedor(
        p_id_vendedor => 101,
        p_nombre => v_nombre,
        p_ventas => v_ventas,
        p_oficina => v_oficina
    );
    
    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Ventas: ' || v_ventas);
    DBMS_OUTPUT.PUT_LINE('Oficina: ' || v_oficina);
END;
/
--------------------------------------------------------------------------------
3. Procedimiento con Cursor: Listar Clientes por Vendedor
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE listar_clientes_por_vendedor (
    p_id_vendedor IN Vendedor.idVendedor%TYPE
) AS
    CURSOR c_clientes IS
        SELECT idCliente, empresa, limite_credito
        FROM Cliente
        WHERE idVendedor = p_id_vendedor
        ORDER BY empresa;
        
    v_contador NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Clientes del vendedor ID: ' || p_id_vendedor);
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    
    FOR cliente_rec IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || cliente_rec.idCliente || 
                            ', Empresa: ' || cliente_rec.empresa || 
                            ', Límite Crédito: ' || cliente_rec.limite_credito);
        v_contador := v_contador + 1;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Total clientes: ' || v_contador);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END listar_clientes_por_vendedor;
/

-- LLAMAR

DECLARE
    v_id_vendedor Vendedor.idVendedor%TYPE := 123;
BEGIN
    -- Activar salida (si no lo has hecho antes)
    DBMS_OUTPUT.ENABLE(1000000);
    
    -- Llamar al procedimiento
    listar_clientes_por_vendedor(v_id_vendedor);
    
    -- Puedes capturar posibles excepciones aquí también
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al ejecutar el procedimiento: ' || SQLERRM);
END;
/

-- LLAMAR

-- Primero activa la salida del buffer (necesario para ver los resultados)
SET SERVEROUTPUT ON SIZE 1000000;

-- Llamar al procedimiento para el vendedor con ID 123
EXEC listar_clientes_por_vendedor(101);

-- Otra forma equivalente:
BEGIN
    listar_clientes_por_vendedor(p_id_vendedor => 101);
END;
/
--------------------------------------------------------------------------------
4. Procedimiento con Transacción: Registrar Nuevo Pedido
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE registrar_pedido (
    p_id_pedido IN Pedido.idPedido%TYPE,
    p_id_vendedor IN Pedido.idVendedor%TYPE,
    p_id_cliente IN Pedido.idCliente%TYPE,
    p_id_fabrica IN Pedido.idFabrica%TYPE,
    p_id_producto IN Pedido.idProducto%TYPE,
    p_cantidad IN Pedido.cantidad%TYPE,
    p_resultado OUT VARCHAR2
) AS
    v_precio_producto Producto.precio%TYPE;
    v_importe Pedido.importe%TYPE;
    v_existencia_actual Producto.existencia%TYPE;
    v_limite_credito Cliente.limite_credito%TYPE;
    v_credito_usado NUMBER;
BEGIN
    -- Obtener precio y existencia del producto
    SELECT precio, existencia INTO v_precio_producto, v_existencia_actual
    FROM Producto
    WHERE idFabrica = p_id_fabrica AND idProducto = p_id_producto;
    
    -- Verificar existencia suficiente
    IF p_cantidad > v_existencia_actual THEN
        p_resultado := 'Error: Existencia insuficiente del producto';
        RETURN;
    END IF;
    
    -- Calcular importe
    v_importe := p_cantidad * v_precio_producto;
    
    -- Obtener límite de crédito del cliente
    SELECT limite_credito INTO v_limite_credito
    FROM Cliente
    WHERE idCliente = p_id_cliente;
    
    -- Calcular crédito ya usado por el cliente
    SELECT NVL(SUM(importe), 0) INTO v_credito_usado
    FROM Pedido
    WHERE idCliente = p_id_cliente;
    
    -- Verificar límite de crédito
    IF (v_credito_usado + v_importe) > v_limite_credito THEN
        p_resultado := 'Error: Límite de crédito excedido';
        RETURN;
    END IF;
    
    -- Insertar el pedido
    INSERT INTO Pedido (
        idPedido, idVendedor, idCliente, idFabrica, idProducto, 
        fecha_pedido, cantidad, importe
    ) VALUES (
        p_id_pedido, p_id_vendedor, p_id_cliente, p_id_fabrica, p_id_producto,
        SYSDATE, p_cantidad, v_importe
    );
    
    -- Actualizar existencia del producto
    UPDATE Producto
    SET existencia = existencia - p_cantidad
    WHERE idFabrica = p_id_fabrica AND idProducto = p_id_producto;
    
    -- Actualizar ventas del vendedor
    UPDATE Vendedor
    SET ventas = ventas + v_importe
    WHERE idVendedor = p_id_vendedor;
    
    COMMIT;
    p_resultado := 'Pedido registrado exitosamente. Importe: ' || v_importe;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        p_resultado := 'Error al registrar pedido: ' || SQLERRM;
END registrar_pedido;
/
--------------------------------------------------------------------------------
5. Procedimiento con IF-ELSIF-ELSE: Calcular Comisión de Vendedor
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE calcular_comision_vendedor (
    p_id_vendedor IN Vendedor.idVendedor%TYPE
) AS
    v_ventas Vendedor.ventas%TYPE;
    v_cuota Vendedor.cuota%TYPE;
    v_comision NUMBER;
    v_nombre Vendedor.nombre%TYPE;
BEGIN
    -- Obtener datos del vendedor
    SELECT nombre, ventas, cuota
    INTO v_nombre, v_ventas, v_cuota
    FROM Vendedor
    WHERE idVendedor = p_id_vendedor;
    
    -- Calcular comisión basada en el rendimiento
    IF v_cuota IS NULL THEN
        v_comision := 0;
    ELSIF v_ventas >= v_cuota * 1.5 THEN
        v_comision := v_ventas * 0.1; -- 10% por superar cuota en 50%
    ELSIF v_ventas >= v_cuota THEN
        v_comision := v_ventas * 0.07; -- 7% por alcanzar cuota
    ELSIF v_ventas >= v_cuota * 0.8 THEN
        v_comision := v_ventas * 0.05; -- 5% por alcanzar 80% de cuota
    ELSE
        v_comision := v_ventas * 0.02; -- 2% base
    END IF;
    
    -- Mostrar resultados
    DBMS_OUTPUT.PUT_LINE('Vendedor: ' || v_nombre);
    DBMS_OUTPUT.PUT_LINE('Ventas: ' || v_ventas);
    DBMS_OUTPUT.PUT_LINE('Cuota: ' || NVL(v_cuota, 0));
    DBMS_OUTPUT.PUT_LINE('Comisión calculada: ' || ROUND(v_comision, 2));
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Vendedor no encontrado');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END calcular_comision_vendedor;
/
--------------------------------------------------------------------------------
6. Procedimiento con WHILE: Actualizar Precios de Productos
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE actualizar_precios_porcentaje (
    p_porcentaje IN NUMBER,
    p_fabrica IN Producto.idFabrica%TYPE DEFAULT NULL
) AS
    v_contador NUMBER := 0;
    v_total_actualizados NUMBER := 0;
    CURSOR c_productos IS
        SELECT idFabrica, idProducto, precio
        FROM Producto
        WHERE (p_fabrica IS NULL OR idFabrica = p_fabrica)
        FOR UPDATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Iniciando actualización de precios...');
    
    FOR producto_rec IN c_productos LOOP
        -- Calcular nuevo precio
        producto_rec.precio := producto_rec.precio * (1 + p_porcentaje/100);
        
        -- Actualizar el producto
        UPDATE Producto
        SET precio = producto_rec.precio
        WHERE CURRENT OF c_productos;
        
        v_contador := v_contador + 1;
        v_total_actualizados := v_total_actualizados + 1;
        
        -- Mostrar progreso cada 5 productos
        IF MOD(v_contador, 5) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Actualizados ' || v_contador || ' productos...');
            COMMIT; -- Hacer commit periódicamente
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Proceso completado. Total productos actualizados: ' || v_total_actualizados);
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END actualizar_precios_porcentaje;
/
--------------------------------------------------------------------------------
7. Procedimiento Complejo: Generar Reporte de Oficina
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE generar_reporte_oficina (
    p_id_oficina IN Oficina.idOficina%TYPE
) AS
    v_ciudad Oficina.ciudad%TYPE;
    v_region Oficina.region%TYPE;
    v_objetivo Oficina.objetivo%TYPE;
    v_ventas Oficina.ventas%TYPE;
    v_director Director.idDirector%TYPE;
    v_nombre_director Vendedor.nombre%TYPE;
    
    v_porcentaje_cumplimiento NUMBER;
    v_diferencia NUMBER;
    
    -- Cursor para vendedores de la oficina
    CURSOR c_vendedores IS
        SELECT idVendedor, nombre, ventas, cuota
        FROM Vendedor
        WHERE idOficina = p_id_oficina
        ORDER BY ventas DESC;
        
    v_contador_vendedores NUMBER := 0;
    v_total_ventas_vendedores NUMBER := 0;
BEGIN
    -- Obtener información de la oficina
    SELECT o.ciudad, o.region, o.objetivo, o.ventas, o.idDirector, v.nombre
    INTO v_ciudad, v_region, v_objetivo, v_ventas, v_director, v_nombre_director
    FROM Oficina o
    LEFT JOIN Vendedor v ON o.idDirector = v.idVendedor
    WHERE o.idOficina = p_id_oficina;
    
    -- Calcular métricas
    v_porcentaje_cumplimiento := (v_ventas / v_objetivo) * 100;
    v_diferencia := v_ventas - v_objetivo;
    
    -- Mostrar encabezado del reporte
    DBMS_OUTPUT.PUT_LINE('=== REPORTE DE OFICINA ===');
    DBMS_OUTPUT.PUT_LINE('Oficina ID: ' || p_id_oficina);
    DBMS_OUTPUT.PUT_LINE('Ubicación: ' || v_ciudad || ' (' || v_region || ')');
    DBMS_OUTPUT.PUT_LINE('Director: ' || v_nombre_director || ' (ID: ' || v_director || ')');
    DBMS_OUTPUT.PUT_LINE('Objetivo: ' || v_objetivo);
    DBMS_OUTPUT.PUT_LINE('Ventas: ' || v_ventas);
    DBMS_OUTPUT.PUT_LINE('Cumplimiento: ' || ROUND(v_porcentaje_cumplimiento, 2) || '%');
    DBMS_OUTPUT.PUT_LINE('Diferencia: ' || v_diferencia);
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('=== VENDEDORES ===');
    
    -- Listar vendedores
    FOR vendedor_rec IN c_vendedores LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || vendedor_rec.idVendedor || 
                            ', Nombre: ' || vendedor_rec.nombre || 
                            ', Ventas: ' || vendedor_rec.ventas || 
                            ', Cuota: ' || NVL(vendedor_rec.cuota, 0) ||
                            ', Cumplimiento: ' || 
                            CASE 
                                WHEN vendedor_rec.cuota IS NULL OR vendedor_rec.cuota = 0 THEN 'N/A'
                                ELSE TO_CHAR(ROUND((vendedor_rec.ventas / vendedor_rec.cuota) * 100, 2) || '%'
                            END);
        v_contador_vendedores := v_contador_vendedores + 1;
        v_total_ventas_vendedores := v_total_ventas_vendedores + vendedor_rec.ventas;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total vendedores: ' || v_contador_vendedores);
    DBMS_OUTPUT.PUT_LINE('Suma ventas vendedores: ' || v_total_ventas_vendedores);
    DBMS_OUTPUT.PUT_LINE('Diferencia con ventas oficina: ' || (v_ventas - v_total_ventas_vendedores));
    DBMS_OUTPUT.PUT_LINE('=== FIN DEL REPORTE ===');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Oficina no encontrada');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al generar reporte: ' || SQLERRM);
END generar_reporte_oficina;
/
Cómo probar los procedimientos
Aquí tienes ejemplos de cómo llamar a cada uno de los procedimientos:

aumentar_ventas_oficina:

--------------------------------------------------------------------------------
EXEC aumentar_ventas_oficina(12, 5000);
obtener_info_vendedor:

--------------------------------------------------------------------------------
DECLARE
    v_nombre Vendedor.nombre%TYPE;
    v_ventas Vendedor.ventas%TYPE;
    v_oficina Vendedor.idOficina%TYPE;
BEGIN
    obtener_info_vendedor(101, v_nombre, v_ventas, v_oficina);
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre || ', Ventas: ' || v_ventas || ', Oficina: ' || v_oficina);
END;
/
listar_clientes_por_vendedor:

--------------------------------------------------------------------------------
EXEC listar_clientes_por_vendedor(101);
registrar_pedido:

--------------------------------------------------------------------------------
DECLARE
    v_resultado VARCHAR2(200);
BEGIN
    registrar_pedido(999999, 101, 2102, 'ACI', '41004', 10, v_resultado);
    DBMS_OUTPUT.PUT_LINE(v_resultado);
END;
/
calcular_comision_vendedor:

--------------------------------------------------------------------------------
EXEC calcular_comision_vendedor(101);
actualizar_precios_porcentaje:

--------------------------------------------------------------------------------
-- Aumentar todos los precios en 5%
EXEC actualizar_precios_porcentaje(5);

-- Aumentar solo productos de ACI en 10%
EXEC actualizar_precios_porcentaje(10, 'ACI');
generar_reporte_oficina:

--------------------------------------------------------------------------------
EXEC generar_reporte_oficina(12);
Estos ejemplos cubren una variedad de conceptos importantes en PL/SQL, incluyendo:

Manejo de parámetros (IN, OUT)

Cursores explícitos

Control de flujo (IF-ELSIF-ELSE, WHILE)

Manejo de excepciones

Transacciones (COMMIT, ROLLBACK)

Operaciones DML dentro de procedimientos

Uso de DBMS_OUTPUT para depuración

Puedes usar estos ejemplos para enseñar a tus alumnos desde lo más básico hasta conceptos más avanzados de programación en Oracle.