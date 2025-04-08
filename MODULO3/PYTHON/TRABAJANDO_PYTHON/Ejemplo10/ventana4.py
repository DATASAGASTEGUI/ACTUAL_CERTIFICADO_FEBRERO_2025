import sys, os
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5.QtGui import QIcon, QIcon, QPalette

class Ventana(QMainWindow):
    def __init__(self, titulo):
        super().__init__()
        self.personalizarVentana(titulo)

    def personalizarVentana(self, titulo):
        self.setWindowTitle(titulo)
        self.setFixedSize(480, 330)

        ruta_relativa = "PYTHON_0033/cross1.png"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        print(ruta_absoluta) # F:\CURSOS\TRABAJANDO\PROJECTS___PYTHON\PYTHON_TEXTO\PYTHON\PYTHON_0033\cross1.png
        self.setWindowIcon(QIcon(ruta_absoluta))
        
        self.setWindowIcon(QIcon(ruta_absoluta))
        self.setAutoFillBackground(True)
        self.setBackgroundRole(QPalette.Window)
        self.setStyleSheet("background-color: lightgray;")

        
