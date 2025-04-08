***********************
***   DICCIONARIO   ***
***********************

Un diccionario es una estructura en python, que almacena la información en pares clave-valor.
Un diccionario en otros lenguajes de programación se conoce como mapa, tabla hash o arreglo asociativo.
Un diccionario es una estructura mutable es decir que se puede modificar después de su creación.
Cada elemento del diccionario consta de una clave y un valor separados por dos puntos :
La clave debe ser única y puede ser de cualquier tipo inmutable, como cadenas, números o tuplas.

*****************
***   TUPLA   ***
*****************

En Python, una tupla se crea con valores fijos que se especifican al momento de su definición. No es posible modificar una tupla una vez creada, por lo que no se pueden llenar con valores adicionales de forma dinámica.

Para crear una tupla con valores fijos, simplemente especifica los valores separados por comas dentro de paréntesis ().

En Python, las tuplas son estructuras de datos inmutables, lo que significa que no se pueden modificar una vez creadas. No es posible agregar elementos directamente a una tupla existente.

Dado que las tuplas son inmutables, no se pueden modificar sus elementos directamente. Sin embargo, puedes convertir la tupla en una lista, realizar la modificación y luego volver a convertirla en una tupla si es necesario. 


******************************
***   GESTION DE CADENAS   ***
******************************

---------------------------
NOTACION REBANADO (SLICING)
---------------------------

(*) Crear una cadena

cadena = 'Hola Mundo'

(*) Notación Rebanada

cadena[5:10]   				--->   Mundo
cadena[1:2]    				--->   o
cadena[5:10:2] 				--->   Mno
cadena[5:10:3] 				--->   Md 

cadena[0:10:2] 				--->   Hl ud

cadena[::-2]   				--->   onMao
cadena[::2]    				--->   Hl ud

cadena[::1]    				--->   Hola Mundo
cadena[::]     				--->   Hola Mundo
cadena[::-1]   				--->   odnuM aloH

cadena[0:4]    				--->   Hola

cadena = cadena[0:4]
rcadena = cadena[::-1]   	--->   aloH

cadena[3::-1]   			--->   aloH        0:4:1    3::-1      

cadena[9:4:-1]   			--->   odnuM      5:10:1   9:4:-1       Inicia 5 Fin 5+5letras, Inicia 9 Fin 9-5letras

cadena[7:5:-1]   			--->   nu         6:8:1    7:5:-1

cadena[5::-1]    			--->   M aloH     0:6:1    5::-1

cadena[2::-1]    			--->   loH        0:3:1    2::-1

---------------
METODOS CADENAS
---------------

capitalize() 				devuelve una copia de la cadena con la primera letra en mayúscula.
center(n) 					devuelve una copia de la cadena centrada y con longitud n.
find(sub,[,desde[,hasta]]) 	devuelve la posición de la primera aparición de sub en la cadena; si se incluye desde, la búsqueda comienza en esa posición y termina en hasta, si se especifica.
isalnum() devuelve cierto si la cadena es no vacía y sólo contiene letras y dígitos.
isalpha() devuelve cierto si la cadena es no vacía y sólo contiene letras.
isdigit() devuelve cierto si la cadena es no vacía y sólo contiene dígitos.
islower() devuelve cierto si todas las letras de la cadena son minúsculas y hay al menos una minúscula.
isspace() devuelve cierto si la cadena es no vacía y todos sus caracteres son espacios.
isupper() devuelve cierto si todas las letras de la cadena son mayúsculas y hay al menos una mayúscula.
lower() devuelve una copia de la cadena con las letras convertidas a minúsculas.
lstrip() devuelve una copia de la cadena con los blancos iniciales omitidos.
replace(v, n) devuelve una copia de la cadena donde se han sustituido todas las apariciones de la cadena v por n.
rstrip() devuelve una copia de la cadena con los blancos finales omitidos.
split([s]) devuelve una lista que contiene las palabras de la cadena. Si se incluye la cadena s, se utiliza como separador.
strip() devuelve una copia de la cadena con los blancos iniciales y finales omitidos.
upper() devuelve una copia de la cadena convertida a mayúsculas.


                                

'''













