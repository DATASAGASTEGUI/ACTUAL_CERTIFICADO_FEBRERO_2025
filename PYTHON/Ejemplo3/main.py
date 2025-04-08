#!/usr/bin/env python
# -*- coding: utf8 -*-

from os import system
from math import pow
from MISMODULOS.indice_masa_corporal import clasificar_inc

# float, int, str, round, print, input, range, list

# CALCULAR EL INDICE DE MASA CORPORAL
def ejemplo1():
    print("CALCULO INDICE DE MASA CORPORAL")
    print("-------------------------------")
    estatura = float(input("Ingrese su estatura? "))
    peso = float(input("Ingrese su peso? "))
    imc = peso / pow(estatura,2)
    print(f"Indice Masa Corporal(IMC): {imc}")
    print(f"Indice Masa Corporal(IMC): {imc:.2f}")
    print(f"Indice Masa Corporal(IMC): {round(imc,2)}")
    if imc < 18.5:
       print('Peso insuficiente')
    elif imc >= 18.5 and imc < 25:
       print("Peso normal")
    elif imc >= 25 and imc < 30:
       print("Sobrepeso")
    else:
       print("Obeso")
    
    '''   
    elif imc >= 30:
       print("Obeso")
    '''

def ejemplo2():
    print("CALCULO INDICE DE MASA CORPORAL")
    print("-------------------------------")
    estatura = float(input("Ingrese su estatura? "))
    peso = float(input("Ingrese su peso? "))
    imc = peso / pow(estatura,2)
    print(f"Indice Masa Corporal(IMC): {imc}")
    print(f"Indice Masa Corporal(IMC): {imc:.2f}")
    print(f"Indice Masa Corporal(IMC): {round(imc,2)}")
    print(clasificar_inc(imc))
    
def ejemplo3():
    print("CONSTRUIR UNA SERIE 1....N")
    print("--------------------------")
    n = int(input("Ingresar número entero n? "))
    i = 1
    while(i <= n):
          print(i,end='  ')
          i += 1

def ejemplo4():
    print("CONSTRUIR UNA SERIE 1....N")
    print("--------------------------")
    n = int(input("Ingresar número entero n? "))
    i = 1
    while True:
          print(i,end='  ')
          i += 1
          if(i>n):
            break
          
def ejemplo5():
    print("CONSTRUIR UNA SERIE 1....N")
    print("--------------------------")
    n = int(input("Ingresar número entero n? "))
    for i in range(0,(n+1)): # 1 2 3 4 5
          print(i,end='  ')

def ejemplo5():
    print("COMBINACIONES DE 2 EN DOS CON LOS NUMEROS 1 2 3 4 5")
    print("---------------------------------------------------")
    for i in range(1,(5+1)): # 1 2 3 4 5        i=1          i=2
        for j in range(1, (5+1)): # 1 2 3 4 5   j=1 2 3 4 5  j=1 2 3 4 5
            print(f"{i},{j}")

def ejemplo6():
    print("COMBINACIONES DE 2 EN DOS CON LOS NUMEROS 1 2 3 4 5")
    print("--------------------------")
    for i in range(1,(5+1)): # 1 2 3 4 5        i=1          i=2
        for j in range(i, (5+1)): # 1 2 3 4 5   j=1 2 3 4 5  j=2 3 4 5
            print(f"{j}", end=" ")
        print()

def ejemplo7():
    print(list(range(1,5)))
    print(list(range(1,10,2)))


def ejemplo8():
    print("RECORRER UNA CADENA LETRA POR LETRA (POR ELEMENTO)")          
    print("--------------------------------------------------")
    texto = input('Ingresar un texto cualquier? ')
    for letra in texto:
        print(letra, end='  ')
    print()
    print("RECORRER UNA CADENA LETRA POR LETRA (POR INDICE)")          
    print("------------------------------------------------")
    texto = input('Ingresar un texto cualquier? ')
    for i in range(0,len(texto)): # 0 1 2 3 = len(texto)
        print(texto[i], end='  ')        

def main():
    system("cls")
    ejemplo8()
    system("pause > nul")
          
if __name__ == "__main__":
   main()