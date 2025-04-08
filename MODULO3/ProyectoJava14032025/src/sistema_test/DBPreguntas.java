package sistema_test;

import java.util.ArrayList;
import java.util.List;

public class DBPreguntas {

    public static List<Pregunta> obtenerTodasPreguntas() {
        List<Pregunta> preguntas = new ArrayList<>();

        preguntas.add(new Pregunta(1, "¿Qué tipo de software es Oracle Database?", 1, new String[]{"Sistema Operativo", "Sistema de Gestión de Base de Datos", "Editor de texto", "Navegador Web"}));
        preguntas.add(new Pregunta(2, "¿Cuál es el lenguaje principal para interactuar con Oracle Database?", 2, new String[]{"Python", "Java", "SQL", "HTML"}));
        preguntas.add(new Pregunta(3, "¿Qué componente de Oracle permite la ejecución de procedimientos almacenados?", 0, new String[]{"PL/SQL", "JavaScript", "HTML", "Bash"}));
        preguntas.add(new Pregunta(4, "¿Qué comando se usa para crear una tabla en Oracle?", 1, new String[]{"MAKE TABLE", "CREATE TABLE", "INIT TABLE", "NEW TABLE"}));
        preguntas.add(new Pregunta(5, "¿Qué extensión tienen habitualmente los archivos de control en Oracle?", 1, new String[]{".dbf", ".ctl", ".ora", ".log"}));
        /*
        preguntas.add(new Pregunta(6, "¿Cuál es el comando para eliminar una tabla?", 0, new String[]{"DROP TABLE", "REMOVE TABLE", "DELETE TABLE", "ERASE TABLE"}));
        preguntas.add(new Pregunta(7, "¿Qué comando sirve para otorgar privilegios a un usuario?", 2, new String[]{"ALLOW", "PERMIT", "GRANT", "GIVE"}));
        preguntas.add(new Pregunta(8, "¿Qué archivo contiene parámetros de inicialización en Oracle?", 0, new String[]{"init.ora", "conf.ini", "dbconfig.xml", "start.ctl"}));
        preguntas.add(new Pregunta(9, "¿Cuál es el nombre del lenguaje procedural extendido de SQL en Oracle?", 2, new String[]{"T-SQL", "SQL+", "PL/SQL", "MySQL"}));
        preguntas.add(new Pregunta(10, "¿Qué tipo de backup permite recuperar una base de datos hasta un punto específico?", 3, new String[]{"Cold Backup", "Hot Backup", "Full Backup", "Point-in-Time Recovery"}));
        
        preguntas.add(new Pregunta(11, "¿Qué comando se usa para revocar permisos?", 1, new String[]{"REMOVE", "REVOKE", "CANCEL", "UNGRANT"}));
        preguntas.add(new Pregunta(12, "¿Qué tabla contiene información sobre todas las tablas del usuario?", 0, new String[]{"USER_TABLES", "ALL_USERS", "DBA_DATAFILES", "TABLE_INFO"}));
        preguntas.add(new Pregunta(13, "¿Qué vista muestra las sesiones activas en Oracle?", 0, new String[]{"V$SESSION", "V$USER", "SESSION_INFO", "SYS.SESSIONS"}));
        preguntas.add(new Pregunta(14, "¿Qué comando se usa para finalizar una transacción?", 2, new String[]{"EXIT", "FINISH", "COMMIT", "SAVE"}));
        preguntas.add(new Pregunta(15, "¿Cuál de estos no es un tipo de dato en Oracle?", 2, new String[]{"VARCHAR2", "NUMBER", "BOOLEAN", "DATE"}));
        preguntas.add(new Pregunta(16, "¿Cuál es la herramienta gráfica de Oracle para administración?", 1, new String[]{"SQL Server Management", "SQL Developer", "MySQL Workbench", "Oracle Navigator"}));
        preguntas.add(new Pregunta(17, "¿Cuál es el nombre del archivo de configuración de Oracle Listener?", 2, new String[]{"listener.conf", "tnsnames.ora", "listener.ora", "init.ora"}));
        preguntas.add(new Pregunta(18, "¿Qué comando PL/SQL se usa para manejar errores?", 2, new String[]{"TRY...CATCH", "ON ERROR", "EXCEPTION", "CATCH"}));
        preguntas.add(new Pregunta(19, "¿Cuál es la función de ROWNUM en Oracle?", 2, new String[]{"Cuenta filas duplicadas", "Devuelve el ID del usuario", "Devuelve el número de fila", "Suma todas las filas"}));
        preguntas.add(new Pregunta(20, "¿Qué objeto sirve para automatizar tareas en Oracle?", 2, new String[]{"Cronjob", "Event", "Trigger", "Hook"}));
        preguntas.add(new Pregunta(21, "¿Qué significa DML?", 2, new String[]{"Data Management Language", "Data Migration Language", "Data Manipulation Language", "Database Management Layer"}));
        preguntas.add(new Pregunta(22, "¿Cuál no es una instrucción DML?", 0, new String[]{"SELECT", "INSERT", "DELETE", "UPDATE"}));
        preguntas.add(new Pregunta(23, "¿Cuál es el usuario por defecto de Oracle?", 1, new String[]{"ROOT", "SYSTEM", "ADMIN", "SA"}));
        preguntas.add(new Pregunta(24, "¿Qué hace el comando ROLLBACK?", 2, new String[]{"Guarda los cambios", "Elimina una tabla", "Cancela los cambios", "Reinicia la base de datos"}));
        preguntas.add(new Pregunta(25, "¿Cómo se llama el archivo que contiene los nombres de red de Oracle?", 2, new String[]{"oracle.ora", "dbnet.ini", "tnsnames.ora", "connect.xml"}));
        preguntas.add(new Pregunta(26, "¿Qué comando se usa para cambiar el valor de una columna?", 1, new String[]{"MODIFY", "UPDATE", "SET", "CHANGE"}));
        preguntas.add(new Pregunta(27, "¿Qué significa DDL?", 0, new String[]{"Data Definition Language", "Database Driver Layer", "Data Delete Language", "Direct Data Load"}));
        preguntas.add(new Pregunta(28, "¿Cuál es un ejemplo de comando DDL?", 2, new String[]{"SELECT", "INSERT", "CREATE", "DELETE"}));
        preguntas.add(new Pregunta(29, "¿Qué es un \"tablespace\"?", 2, new String[]{"Un tipo de tabla", "Una partición de disco", "Un área de almacenamiento lógico", "Un esquema"}));
        preguntas.add(new Pregunta(30, "¿Cómo se llama el motor de transacciones de Oracle?", 3, new String[]{"InnoDB", "OracleDB", "ASM", "Undo/Redo"}));
        preguntas.add(new Pregunta(31, "¿Qué hace el comando DESCRIBE en SQL*Plus?", 1, new String[]{"Elimina una tabla", "Muestra estructura de la tabla", "Borrar los datos", "Exporta la tabla"}));
        preguntas.add(new Pregunta(32, "¿Qué tipo de clave identifica de forma única cada fila?", 2, new String[]{"Clave secundaria", "Clave foránea", "Clave primaria", "Clave de búsqueda"}));
        preguntas.add(new Pregunta(33, "¿Qué comando se usa para crear una vista?", 1, new String[]{"CREATE WINDOW", "CREATE VIEW", "MAKE VIEW", "NEW VIEW"}));
        preguntas.add(new Pregunta(34, "¿Qué operador se usa para concatenar cadenas en Oracle?", 2, new String[]{"+", "&", "||", "CONCAT"}));
        preguntas.add(new Pregunta(35, "¿Qué palabra clave se usa para ordenar resultados?", 2, new String[]{"ORDER", "SORT", "ORDER BY", "GROUP"}));
        preguntas.add(new Pregunta(36, "¿Cuál es el valor por defecto de una columna si no se especifica ninguno?", 1, new String[]{"0", "NULL", "", "DEFAULT"}));
        preguntas.add(new Pregunta(37, "¿Qué función devuelve la fecha actual?", 3, new String[]{"TODAY()", "GETDATE()", "NOW()", "SYSDATE"}));
        preguntas.add(new Pregunta(38, "¿Qué cláusula limita el número de resultados?", 2, new String[]{"LIMIT", "TOP", "ROWNUM", "OFFSET"}));
        preguntas.add(new Pregunta(39, "¿Qué palabra se usa para agrupar resultados?", 1, new String[]{"SORT BY", "GROUP BY", "ORDER BY", "COLLECT"}));
        preguntas.add(new Pregunta(40, "¿Cuál es el máximo número de columnas que puede tener una tabla en Oracle 19c?", 3, new String[]{"100", "255", "1000", "4096"}));
        preguntas.add(new Pregunta(41, "¿Qué función se usa para contar filas?", 1, new String[]{"SUM()", "COUNT()", "LENGTH()", "TOTAL()"}));
        preguntas.add(new Pregunta(42, "¿Qué significa el error ORA-00942?", 0, new String[]{"Tabla o vista no existe", "Error de conexión", "Usuario inválido", "Dispositivo lleno"}));
        preguntas.add(new Pregunta(43, "¿Qué vista muestra todos los índices de una tabla?", 0, new String[]{"USER_INDEXES", "ALL_INDICES", "DBA_INDEX", "TABLE_INDEX"}));
        preguntas.add(new Pregunta(44, "¿Cuál es el formato de fecha por defecto en Oracle?", 2, new String[]{"DD-MM-YYYY", "MM/DD/YYYY", "DD-MON-YY", "YYYY-MM-DD"}));
        preguntas.add(new Pregunta(45, "¿Qué operador se usa para comprobar si un valor está en una lista?", 2, new String[]{"=", "MATCH", "IN", "ANY"}));
        preguntas.add(new Pregunta(46, "¿Qué significa el acrónimo RAC en Oracle?", 1, new String[]{"Redundant Access Control", "Real Application Clusters", "Rapid Access Connection", "Remote Administration Console"}));
        preguntas.add(new Pregunta(47, "¿Qué herramienta se usa para clonar bases de datos en Oracle?", 1, new String[]{"Oracle Dump", "RMAN", "TNS Admin", "Oracle Replicator"}));
        preguntas.add(new Pregunta(48, "¿Qué comando se usa para cambiar la contraseña de un usuario?", 1, new String[]{"CHANGE PASSWORD", "ALTER USER", "SET PASSWORD", "UPDATE USER"}));
        preguntas.add(new Pregunta(49, "¿Qué comando sirve para finalizar una sesión en SQL*Plus?", 3, new String[]{"STOP", "END", "DISCONNECT", "EXIT"}));
        preguntas.add(new Pregunta(50, "¿Qué extensión suelen tener los datafiles en Oracle?", 2, new String[]{".ora", ".sql", ".dbf", ".log"}));
*/        
return preguntas;
    }
}
