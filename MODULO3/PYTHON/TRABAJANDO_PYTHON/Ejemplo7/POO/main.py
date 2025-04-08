from abc import ABC, abstractmethod
import math, os

class FiguraGeometrica(ABC):
    @abstractmethod
    def area(self):
        #pass
        raise NotImplementedError("Este método debe ser implementado por las subclases")
    @abstractmethod
    def perimetro(self):
        #pass
        raise NotImplementedError("Este método debe ser implementado por las subclases")    
    @abstractmethod
    def mostrar_informacion(self):
        #pass
        raise NotImplementedError("Este método debe ser implementado por las subclases")    
    
class Circulo(FiguraGeometrica):
    def __init__(self, radio=0.0):
        self._radio = radio

    @property       # get
    def radio(self):         
       return self._radio

    @radio.setter   # set
    def radio(self, nuevo_radio):
        self._radio = nuevo_radio

    def perimetro(self):
        return 2 * math.pi * self.radio
    
    def area(self):
        return math.pi * self.radio ** 2

    def mostrar_informacion(self):
        print(f"El radio del círculo es: {self.radio}")
        print(f"El área del círculo es: {self.area():.2f}")
        print(f"El perímetro del círculo es: {self.perimetro():.2f}")

class Rectangulo(FiguraGeometrica):
    def __init__(self, alto=0.0, ancho=0.0):
        self._alto = alto
        self._ancho = ancho

    @property       # get
    def alto(self):         
       return self._alto

    @alto.setter   # set
    def alto(self, nuevo_alto):
        self._alto = nuevo_alto

    @property       # get
    def ancho(self):         
       return self._ancho

    @ancho.setter   # set
    def ancho(self, nuevo_ancho):
        self._ancho = nuevo_ancho

    def area(self):
        return self.alto * self.ancho

    def perimetro(self):
        return 2 * (self.alto + self.ancho)

    def mostrar_informacion(self):
        print(f"El alto del rectángulo es: {self.alto}")
        print(f"El ancho del rectángulo es: {self.ancho}")
        print(f"El área del rectángulo es: {self.area():.2f}")
        print(f"El perímetro del rectángulo es: {self.perimetro():.2f}") 

class Cuadrado(FiguraGeometrica):
    def __init__(self, lado=0.0):
        self._lado = lado

    @property       # get
    def lado(self):         
       return self._lado

    @lado.setter   # set
    def lado(self, nuevo_lado):
        self._lado = nuevo_lado

    def area(self):
        return self.lado ** 2

    def perimetro(self):
        return 4 * self.lado

    def mostrar_informacion(self):
        print(f"El lado del cuadrado es: {self.lado}")
        print(f"El área del cuadrado es: {self.area():.2f}")
        print(f"El perímetro del cuadrado es: {self.perimetro():.2f}")  

class Principal:    
    def __init__(self):
        self.figuras = [
            Circulo(5),
            Rectangulo(4, 6),
            Cuadrado(3),
            Cuadrado(2),
            Rectangulo(3, 5),
            Circulo(10)
        ]
        for figura in self.figuras:
            if isinstance(figura, Circulo):
                print("Información del Círculo:")
                print("------------------------")
            elif isinstance(figura, Rectangulo):
                print("Información del Rectángulo:")
                print("---------------------------")
            elif isinstance(figura, Cuadrado):
                print("Información del Cuadrado:")
                print("-------------------------")
            else:
                print("Figura desconocida")

            figura.mostrar_informacion()
        print("\nFin del programa")

    def mimetodo1(self):
        c = Circulo(5)
        print("Area del círculo:", c.area())
        c.radio = 10
        print("Radio del círculo:", c.radio)
        print("Area del círculo:", c.area())
       
        

if __name__ == "__main__":
   os.system("cls")
   p = Principal()
   p.mimetodo1()
   os.system("pause")

