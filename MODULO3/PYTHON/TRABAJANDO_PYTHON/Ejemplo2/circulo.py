import math

class Circulo:
      
      @staticmethod  
      def perimetro(radio):
          print("Radio: ", radio)
          return round(2 * math.pi * radio,2)
          
      @staticmethod
      def area(radio):
          return round(math.pi * math.pow(radio,2),2)
      
def cuadro(x):
    return x*x


c = Circulo()
print("Perimetro: ", Circulo.perimetro(5.1))
print("Area: ", c.area(5.1))

c1 = Circulo()
c2 = Circulo()
c3 = Circulo()

lista = [c1, c2, c3, 6, 1.72, "Hola", True]
for elemento in lista:
    if isinstance(elemento, Circulo):
       print("Perimetro: ", elemento.perimetro(3))


'''
list
len
print
set
str
int
float
round
tuple
range
'''