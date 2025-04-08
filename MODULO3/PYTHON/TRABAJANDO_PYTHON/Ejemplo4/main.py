import os, math

class Circulo:
    # VARIABLES DE INSTANCIA Y CONSTRUCTORES
    def __init__(self,radio=0):
        self.__radio = radio

    # METODOS SET Y GET
    def set_radio(self, radio):
        self.__radio = radio

    def get_radio(self):
        return self.__radio
    
    # METODOS CALCULO
    def perimetro(self):
        return round(2 * math.pi * self.__radio,2)
    
    def area(self):
        return round(math.pi * math.pow(self.__radio,2),2)
    
    def perimetro_area(self):
        return (self.perimetro(), self.area())

def ejemplo1():
    c = Circulo(5)
    print("Perimetro: ", c.perimetro())

    c1 = Circulo()
    c1.set_radio(6)
    print("Perimetro: ", c1.perimetro())

    c1.set_radio(7)
    print("Perimetro: ", c1.perimetro())

    print("Radio: ", c1.get_radio())

    print("Perimetro : ", c1.perimetro_area()[0])
    print("Area      : ", c1.perimetro_area()[1])


def main():
    os.system("cls")
    ejemplo1()
    os.system("pause")


if __name__ == "__main__":
   main()