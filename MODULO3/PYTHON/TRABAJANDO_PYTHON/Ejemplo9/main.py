import os

def ejemplo1():
    print("FORMA 1")
    lista1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print(lista1)
    print("FORMA 2")
    lista2 = []
    for i in range(1,11,1): # inicio:fin:incremento
        lista2.append(i)
    print(lista2)
    print("FORMA 3")
    lista3 = [i for i in range(1,11,1)] # [expresion for variable in iterable]    
    print(lista3)

def ejemplo2():
    print("FORMA 1")
    lista1 = [i for i in range(1,11,1) if i%2 == 0] # [expresion for variable in iterable]  
    print("FORMA 2")
    lista2 = []
    for i in range(1,11,1): # inicio:fin:incremento
        if i%2 == 0:
           lista2.append(i)
    print(lista2)

def ejemplo3():
    lista = [i**2 for i in range(1,11,1)]
    print(lista)

def ejemplo4():
    texto = "Python es un lenguaje de programación"
    lista = [letra for letra in texto] 
    print(lista, end="")

def ejemplo5():
    print("FORMA 1")
    import string
    alfabeto = [letra for letra in string.ascii_uppercase]  # Letras mayúsculas del alfabeto
    print(string.ascii_uppercase)
    print("FORMA 2")
    lista = []
    for numero in range(65, 91): 
        letra = chr(numero)
        lista.append(letra)
    print(lista)
    print("FORMA 3")
    lista1 = [chr(numero) for numero in range(65, 91)]  # Letras mayúsculas del alfabeto
    print(lista1)

def ejemplo6():
    print("FORMA 1")
    texto = "Python es un lenguaje de programación"
    lista = [letra for letra in texto if letra.lower() in 'aeiou']  # Filtrar solo vocales
    print(lista)
    print("FORMA 2")
    lista1 = [letra for letra in texto if letra.lower() in ['a','e','i','o','u']]  # Filtrar solo vocales
    print(lista1)

def ejemplo7():
    texto = "Python es un lenguaje de programación"
    lista = [letra for letra in texto if letra.lower() not in 'aeiou ']  # Filtrar solo vocales
    print(lista)

def ejemplo8():
    texto = "Python es un lenguaje de programación"
    conjunto = {'a','u'}
    lista = [letra for letra in texto if letra.lower() not in conjunto]  # Filtrar letras que no están en el conjunto
    print(lista)

def ejemplo8_1():
    texto = "Python es un lenguaje de programación"
    conjunto = {97,32}
    lista = [letra for letra in texto if ord(letra.lower()) not in conjunto]  # Filtrar letras que no están en el conjunto
    print(lista)

def ejemplo9():
    matriz = [[1, 2, 3], 
              [4, 5, 6], 
              [7, 8, 9]]
    print("FORMA 1")
    lista = []
    for fila in matriz:
        for elemento in fila:
            lista.append(elemento)  # Desempaquetar la matriz
    print("FORMA 2")
    lista1 = [elemento for fila in matriz for elemento in fila]  # Desempaquetar la matriz
    print(lista1)
    print("FORMA 3")
    lista2 = [fila for fila in matriz]  # Desempaquetar la matriz y filtrar elementos pares
    print(lista2)

def ejemplo10():
    lista = [1, "Hola", 3.14, True, ["Python", 42, "Mundo"], [5, 6, 7]]
    lista_de_lista = [elemento for elemento in lista if isinstance(elemento, list)]  # Filtrar solo enteros
    print(lista_de_lista)

# LISTA POR COMPRENSION FORMADO SOLO POR LAS CADENAS
def ejemplo11():
    lista = [1, "Hola", 3.14, True, ["Python", 42, "Mundo"], [5, 6, 7]]
    print("FORMA 1")
    lista1 = []
    for elemento in lista:
        if isinstance(elemento, str):
           lista1.append(elemento)
        elif isinstance(elemento, list):
           for subelemento in elemento:
               if isinstance(subelemento, str):
                  lista1.append(subelemento)
    print(lista1)
    print("FORMA 2")
    lista2 = [elemento for elemento in lista if isinstance(elemento, str) 
              or (isinstance(elemento, list) and 
              any(isinstance(subelemento, str) for subelemento in elemento))]  # Filtrar solo cadenas
    print(lista2)

# LISTA POR COMPRENSION FORMADO SOLO POR LOS NOMBRES QUE INICIEN CON LA LETRA A
def ejemplo12():
    import re
    lista = ["Arturo","Belen","Carlos","Alejandro","Diana",'Ana',"A"]
    lista1 = lista.copy()  # Copiar la lista original para no modificarla
    print("LISTA ORIGINAL")
    print(lista1)
    lista2 = []
    print("FORMA 1")
    patron = r"A.*"  # Expresión regular para buscar cadenas que comiencen con 'A'  A  AA  AAAAAAAA
    for elemento in lista:
        if re.fullmatch(patron, elemento):
           lista2.append(elemento)  # Agregar a la lista si coincide con el patrón
    print(lista2)
    print("FORMA 2")
    lista3 = []
    lista3 = [elemento for elemento in lista if re.match(patron, elemento)]  # Filtrar solo cadenas que comiencen con 'A'
    print(lista3)

def ejemplo13():
    import re
    lista = ["Arturo","Belen","Carlos","Alejandro","Diana",'Ana',"A"]
    lista1 = lista.copy()  # Copiar la lista original para no modificarla
    print("LISTA ORIGINAL")
    print(lista1)
    lista2 = []
    print("FORMA 1")
    patron = r"^A.*$"  # Expresión regular para buscar cadenas que comiencen con 'A'  A  AA  AAAAAAAA
    for elemento in lista:
        if re.fullmatch(patron, elemento):
           lista2.append(elemento)  # Agregar a la lista si coincide con el patrón
    print(lista2)

def ejemplo14():
    import re
    lista = ["Arturo","Belen","Carlos","Alejandro","Diana",'Ana',"A"]
    lista1 = lista.copy()  # Copiar la lista original para no modificarla
    print("LISTA ORIGINAL")
    print(lista1)
    print("FORMA 1")
    patron = r'^A.*$|\bA\b'  # Expresión regular para buscar cadenas que comiencen con 'A'  A  AA  AAAAAAAA
    
    for elemento in lista:
        if re.fullmatch(patron, elemento):
           lista.remove(elemento)  # Agregar a la lista si coincide con el patrón
    
    print(lista)

def ejemplo15():
    import re
    lista = ["Arturo", "Belen", "Carlos", "Alejandro", "Diana", 'Ana', "A"]
    lista1 = lista.copy()  # Copia de la lista original para no modificarla
    print("LISTA ORIGINAL")
    print(lista1)
    print("FORMA 1")
    patron = r'^A.*$'  # Este patrón ya incluye 'A' y cualquier cadena que empiece con 'A'
    
    # Filtramos los elementos que NO coincidan con el patrón
    lista_filtrada = [elem for elem in lista if not re.fullmatch(patron, elem)]
    
    print(lista_filtrada)

'''
El error original se debía a la modificación de la lista durante la iteración. Al iterar 
sobre una copia o usar una lista por comprensión, el problema se resuelve.
'''
def ejemplo16():
    import re
    lista = ["Arturo", "Belen", "Carlos", "Alejandro", "Diana", 'Ana', "A"]
    lista1 = lista.copy()  # Copia de la lista original para no modificarla
    print("LISTA ORIGINAL")
    print(lista1)
    print("FORMA 1")
    patron1 = r'^A.*$'  # Expresión regular para cadenas que comienzan con 'A'
    patron2 = r'^A$'     # Expresión regular para la cadena que es exactamente 'A'
    
    # Iteramos sobre una copia de la lista para evitar problemas
    for elemento in lista.copy():  # Usamos lista.copy() para iterar
        if re.fullmatch(patron1, elemento) or re.fullmatch(patron2, elemento):
            lista.remove(elemento)  # Eliminamos de la lista original
    
    print(lista)

def ejemplo17():
    import re
    lista = ["Arturo", "Belen", "Carlos", "Alejandro", "Diana", 'Ana', "A", "Alfredo"]
    lista1 = lista.copy()  # Copia de la lista original para no modificarla
    print("LISTA ORIGINAL")
    print(lista1)
    print("FORMA 1")
    patron1 = r'^A.*$'  # Expresión regular para cadenas que comienzan con 'A'
    
    # Iteramos sobre una copia de la lista para evitar problemas
    for elemento in lista.copy():  # Usamos lista.copy() para iterar
        if re.fullmatch(patron1, elemento):
           lista.remove(elemento)  # Eliminamos de la lista original
    print(lista)

def main():
    os.system("cls")
    ejemplo17()
          
if __name__ == "__main__":
   main()

'''
Símbolos básicos de expresiones regulares
Símbolo	Significado
.	Cualquier carácter excepto nueva línea (\n)
^	Inicio de la cadena
$	Fin de la cadena
*	Cero o más repeticiones del patrón anterior
+	Una o más repeticiones del patrón anterior
?	Cero o una repetición del patrón anterior (también se usa para hacer no-greedy)
{n}	Exactamente n repeticiones
{n,}	n o más repeticiones
{n,m}	Entre n y m repeticiones
[]	Clase de caracteres (ej: [aeiou], cualquier vocal)
[^ ]	Negación dentro de clase de caracteres (ej: [^aeiou], cualquier no-vocal)
`	`
()	Agrupación y captura

🔹 Secuencias especiales (con \)
Secuencia	Significado
\d	Cualquier dígito (equivale a [0-9])
\D	No dígito (equivale a [^0-9])
\w	Caracter alfanumérico o guion bajo ([a-zA-Z0-9_])
\W	Cualquier carácter no alfanumérico
\s	Espacio en blanco (espacio, tabulación, salto de línea)
\S	Cualquier no espacio
\b	Límite de palabra
\B	No-límite de palabra
\\	Barra invertida literal

🔹 Modificadores (flags)
Cuando usas re en Python, puedes pasar banderas (flags):

Bandera	Significado
re.IGNORECASE o re.I	Ignora mayúsculas/minúsculas (ej: a == A)
re.MULTILINE o re.M	^ y $ funcionan por línea, no solo al inicio/final del texto
re.DOTALL o re.S	El punto . incluye también los saltos de línea (\n)


'''