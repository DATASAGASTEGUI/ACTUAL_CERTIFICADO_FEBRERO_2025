Estructura de Archivos (Python)
Copiar
Editar
implementacion/
│
├── figura_geometrica.py
├── triangulo.py
├── rectangulo.py
├── circulo.py
├── gestion_modelo.py
└── principal.py
📄 figura_geometrica.py
python
Copiar
Editar
from abc import ABC, abstractmethod

class FiguraGeometrica(ABC):
    def __init__(self, nombre=""):
        self._nombre = nombre

    @property
    def nombre(self):
        return self._nombre

    @nombre.setter
    def nombre(self, nombre):
        self._nombre = nombre

    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimetro(self):
        pass

    def __str__(self):
        return f"FiguraGeometrica{{nombre={self._nombre}}}"
📄 triangulo.py
python
Copiar
Editar
from figura_geometrica import FiguraGeometrica
import math

class Triangulo(FiguraGeometrica):
    def __init__(self, nombre="", base=0.0, altura=0.0):
        super().__init__(nombre)
        self.base = base
        self.altura = altura

    def area(self):
        return self.base * self.altura / 2

    def perimetro(self):
        return self.base + 2 * math.sqrt((self.base / 2) ** 2 + self.altura ** 2)

    def __str__(self):
        return super().__str__() + f" Triangulo{{base={self.base}, altura={self.altura}}}"
📄 rectangulo.py
python
Copiar
Editar
from figura_geometrica import FiguraGeometrica

class Rectangulo(FiguraGeometrica):
    def __init__(self, nombre="", ancho=0.0, alto=0.0):
        super().__init__(nombre)
        self.ancho = ancho
        self.alto = alto

    def area(self):
        return self.ancho * self.alto

    def perimetro(self):
        return 2 * (self.ancho + self.alto)

    def __str__(self):
        return super().__str__() + f" Rectangulo{{ancho={self.ancho}, alto={self.alto}}}"
📄 circulo.py
python
Copiar
Editar
from figura_geometrica import FiguraGeometrica
import math

class Circulo(FiguraGeometrica):
    def __init__(self, nombre="", radio=0.0):
        super().__init__(nombre)
        self.radio = radio

    def area(self):
        return math.pi * self.radio ** 2

    def perimetro(self):
        return 2 * math.pi * self.radio

    def __str__(self):
        return super().__str__() + f" Circulo{{radio={self.radio}}}"
📄 gestion_modelo.py
python
Copiar
Editar
class GestionModelo:
    def __init__(self, lista=None):
        self.lista = lista if lista is not None else []

    def mostrar_todos_figuras_geometricas(self):
        for fg in self.lista:
            print(fg)
📄 principal.py
python
Copiar
Editar
from triangulo import Triangulo
from rectangulo import Rectangulo
from circulo import Circulo
from gestion_modelo import GestionModelo

def main():
    lista = [
        Triangulo("T1", 2, 3),
        Triangulo("T2", 8, 4),
        Rectangulo("R1", 2, 3),
        Circulo("C1", 2),
        Circulo("C2", 4),
    ]

    gm = GestionModelo(lista)
    gm.mostrar_todos_figuras_geometricas()

if __name__ == "__main__":
    main()
