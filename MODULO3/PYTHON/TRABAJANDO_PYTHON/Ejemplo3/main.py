import os

# RECORRER UNA LISTA
def ejemplo1():
    nombres = ["Luis","Miguel","Carlos"]
    for elemento in nombres:
        print(elemento, end=' ')
    for i in range(len(nombres)):
        print(nombres[i], end=' ')

# RECORRER UN TEXTO
def ejemplo2():
    texto = 'En un puerto italiano'
    for letra in texto:
        print(letra, end='  ')
    print()
    for i in range(len(texto)):
        print(texto[i], end='  ')

# RECORRER UNA TUPLA
def ejemplo3():
    tupla = (1, 2, 3, 4)
    for elemento in tupla:
        print(elemento, end=' ')
    print()
    for i in range(len(tupla)):# 0 1 2 3
        print(tupla[i], end=' ')

def ejemplo4():
    x = range(2,7); print(x)
    lista = list(x)
    for elemento in lista:
        print(elemento)

def ejemplo5():
    texto = "Corazón"
    print(texto[4:6])

# LISTAS POR COMPRENSION
def ejemplo6():
    lista = [2, 3, 7, 8, 9, 10, [2,3],["hola","esta"], (1,2)]
    print(type(lista))
    pares = tuple([elemento for elemento in lista if elemento % 2 == 0])
    print(pares)
    lista = 5
    print(type(lista))

def ejemplo7():
    diccionario = {'nombre':'Luis', 'edad': 25, 'estatura':1.72}
    for k,v in enumerate(diccionario):
        print(k,'=',v)
    print
    for k, v in enumerate(diccionario.items()):
        print(k, '=', v)
    print()
    for k, v in diccionario.items():
        print(k, '=', v)

# SET = CONJUNTO
def ejemplo8():
    conjunto = {1, 3, 7, 2, 3}
    for elemento in conjunto:
        print(elemento, end=' ')

    lista = [1, 2, 1, 3, 4, 3, 1, 2]
    conjunto1 = set(lista)
    lista1 = list(conjunto1)
    print(lista1)

def ejemplo9():
    tupla = (2,3,4,5,6) #No se pueden modificar
    lista = list(tupla)
    lista.append(7)
    print(lista)
    tupla = tuple(lista)
    print(tupla)

def sumar(*args): #ARGUMENTOS POR VALOR
    suma = 0
    for indice,valor in enumerate(args):
        suma += valor
        print(indice,' ',valor)
    print("Suma: ", suma)

def sumar_valores_con_nombre(**args):
    suma = 0
    for nombre,valor in args.items():
        print(nombre,' ',valor)
        suma += valor
    print("Suma: ", suma)
    for elemento in args:
        print(elemento)

def ejemplo10():
    sumar(1, 2, 3, 4, 5, 10)

def ejemplo11():
    sumar_valores_con_nombre(n1=1, n2=2, n3=3, n4=10)
    
def main():
    os.system("cls")
    ejemplo11()
    print() 
    os.system("pause")
          
if __name__ == "__main__":
   main()