import os, math

def area_circulo(radio):
    return math.pi * radio ** 2 #math.sqrt(radio) = radio ** 0.5

def perimetro_circulo(radio):
    return 2 * math.pi * radio

def area_rectangulo(alto, ancho):
    return alto * ancho

def perimetro_rectangulo(alto, ancho):
    return 2 * (alto + ancho)

def area_cuadrado(lado):
    return lado ** 2

def perimetro_cuadrado(lado):
    return 4 * lado

def mostrar_informacion_circulo(radio):
    print(f"El radio del círculo es: {radio}")
    print(f"El área del círculo es: {area_circulo(radio):.2f}")
    print(f"El perímetro del círculo es: {perimetro_circulo(radio):.2f}")

def mostrar_informacion_rectangulo(alto, ancho):
    print(f"El alto del rectángulo es: {alto}")
    print(f"El ancho del rectángulo es: {ancho}")
    print(f"El área del rectángulo es: {area_rectangulo(alto,ancho):.2f}")
    print(f"El perímetro del rectángulo es: {perimetro_rectangulo(alto,ancho):.2f}")

def mostrar_informacion_cuadrado(lado):
    print(f"El lado del cuadrado es: {lado}")
    print(f"El área del cuadrado es: {area_cuadrado(lado):.2f}")
    print(f"El perímetro del cuadrado es: {perimetro_cuadrado(lado):.2f}")

def main():
    os.system("cls")
    figuras = [ 
       {"tipo": "círculo", "radio": 5},
       {"tipo": "rectángulo", "alto": 4, "ancho": 6},
       {"tipo": "cuadrado", "lado": 3},
       {"tipo": "triangulo", "base": 4, "altura": 3}  # Figura desconocida
     ]

    for figura in figuras:  
        if figura["tipo"] == "círculo":
            mostrar_informacion_circulo(figura["radio"])
        elif figura["tipo"] == "rectángulo":
            mostrar_informacion_rectangulo(figura["alto"], figura["ancho"])
        elif figura["tipo"] == "cuadrado":
            mostrar_informacion_cuadrado(figura["lado"])
        else:
            print("Figura desconocida")
    print("\nFin del programa")
    os.system("pause")
          
if __name__ == "__main__":
   main()