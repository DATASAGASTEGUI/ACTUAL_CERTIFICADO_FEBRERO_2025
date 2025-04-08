# FORMAS DE IMPORTAR BIBLIOTECAS
import os
from os import system

import math
from math import sqrt, pow

import random

print("MOSTRAR MENSAJES EN PANTALLA")
print("----------------------------")
print('Hola Mundo')
print("Hola Mundo")

x = 5
print("X: ", x)

print(f"X: {x}")

print("X: " + str(x) + "Euros")

print("ENTRADA DE DATOS POR EL TECLADO")
print("-------------------------------")
print("Ingresa tu edad? ")
edad = input()
print(type(edad))
print("Edad: ", edad)

estatura = input("Ingresa tu estatura? ")
peso = input("Ingresa tu peso? ")
imc = float(peso) / (float(estatura) * float(estatura))
print("IMC: ", imc)

'''
int
float
str
bool: True, False
'''



'''
os.system("cls")
print('Hola Mundo') 
os.system('pause > nul')

x = 5
print(type(x))
x = "Hola"
print(type(x))
x = 1.7
print(type(x))
x = True
print(type(x))



print(math.sqrt(16))
print(math.pow(2,3))
print(random.randint(1,6))

def sumar(x,y):
    z = x+y
    print("z: ", z)
    return z

x = sumar(5,6)
print("Suma: ", x)

def mibucle(x):
    i = 1
    while(i <= x):
        print(i)
        i+=1 # i = i + 1

mibucle(5)
'''    



