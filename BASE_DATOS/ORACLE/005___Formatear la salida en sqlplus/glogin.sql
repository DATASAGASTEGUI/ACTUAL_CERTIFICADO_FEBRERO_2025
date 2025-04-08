SET PAGESIZE 100 -- Esto establece el tamaño de página (número de filas por página)
SET LINESIZE 150 -- Esto establece el tamaño de línea (número de caracteres por línea)
SET FEEDBACK OFF -- Esto desactiva los mensajes de "n filas seleccionadas"
SET HEADSEP OFF -- Esto desactiva la línea separadora del encabezado
COLUMN nombre FORMAT A20 -- Ajusta el ancho de la columna 'nombre' a 20 caracteres
COLUMN apellido FORMAT A20 -- Ajusta el ancho de la columna 'apellido' a 20 caracteres
COLUMN edad FORMAT 9999 -- Ajusta el ancho de la columna 'edad' a 4 dígitos (puedes cambiar según tus necesidades)
SET WRAP ON -- Permite que los datos que excedan el ancho de la columna se envuelvan en líneas adicionales.
