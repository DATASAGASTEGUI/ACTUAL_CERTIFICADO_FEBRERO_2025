
import os
from circulo import Circulo

if __name__ == "__main__":
   os.system('cls')
   radio = float(input('INGRESE RADIO? '))
   print('Perimetro: ', Circulo.perimetro(radio))
   print('Area     : ', Circulo.area(radio))