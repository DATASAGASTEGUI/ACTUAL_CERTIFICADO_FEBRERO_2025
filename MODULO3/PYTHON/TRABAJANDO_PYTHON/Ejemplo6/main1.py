import sys, os
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5.QtGui import QIcon

class Ventana(QMainWindow):
    def __init__(self):
        super().__init__()
        self.personalizarVentana()

    def personalizarVentana(self):
        self.setWindowTitle("VENTANA PYQT5")

        ruta_relativa = "C:/CERTIFICADO_27022025_MODULO1/MODULO3/PYTHON/TRABAJANDO_PYTHON/Ejemplo6/cross1.png"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        print(ruta_absoluta) # F:\CURSOS\TRABAJANDO\PROJECTS___PYTHON\PYTHON_TEXTO\PYTHON\PYTHON_0033\cross1.png
        self.setWindowIcon(QIcon(ruta_absoluta))

        self.setStyleSheet("background-color: lightgray;")
        self.setFixedSize(480, 330) 
        
if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = Ventana()
    ventana.show()
    sys.exit(app.exec_())