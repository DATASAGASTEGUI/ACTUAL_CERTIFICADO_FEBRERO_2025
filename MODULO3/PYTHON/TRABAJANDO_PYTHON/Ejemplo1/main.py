#!/usr/bin/env python
# -*- coding: utf8 -*-

# import os
from os import system
#from  mis_funciones import cuadrado
import mis_funciones

# Comentarios de una línea
'''
Comentarios
de varios
líneas
'''

"""
Comentarios de varias
líneas
"""
def ejemplo1():
    print('Hola Mundo')
    print("Hola Mundo")

def ejemplo2():
    import mis_funciones
    print(mis_funciones.cuadrado(5))

def ejemplo3():
    from mis_funciones import cuadrado
    print(cuadrado(5))

def ejemplo4():
    import mis_funciones as m
    print(m.cubo(5))

def ejemplo5():
    import os as o
    o.system('cls')

def ejemplo6():
    from mis_funciones import cuadrado as c  # Renombra sqrt como raiz
    print(c(8))

def ejemplo7():
    x = "Hola"
    print(type(x))
    x = 5
    print(type(x))
    x = 1.72
    print(type(x))
    x = True #False
    print(type(x))

def ejemplo8():
    x = 5
    if x > 0:
       print('Positivo')
    else:
       print('Negativo')

def ejemplo9():
    x = 3
    if x>0 and x<=10: # and or not
       print('Nota valida')

def ejemplo10():
    x = 10
    y = 1.72
    z = False
    print(str(x) + str(y) + str(z))
    print("x: ", x)
    print("x: " + str(x))

def main():
    system("cls")
    ejemplo10()
    system('pause')
          
if __name__ == "__main__":
   main()