import sys, os
from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel, QWidget
from PyQt5.QtGui import QIcon, QFont
from PyQt5.QtCore import Qt

class Ventana(QMainWindow):
    def __init__(self):
        super().__init__()
        self.personalizarVentana()
        self.personalizarComponentes()

    def personalizarVentana(self):
        self.setWindowTitle("VENTANA PYQT5")

        ruta_relativa = "PYTHON_0033/cross1.png"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        print(ruta_absoluta) # F:\CURSOS\TRABAJANDO\PROJECTS___PYTHON\PYTHON_TEXTO\PYTHON\PYTHON_0033\cross1.png
        self.setWindowIcon(QIcon(ruta_absoluta))

        self.setStyleSheet("background-color: lightgray;")
        self.setFixedSize(480, 330) 

        self.pnlPrincipal = QWidget() # Crear un contenedor
        self.setCentralWidget(self.pnlPrincipal) # Establecer el contenedor como principal para nuestra ventana
    
    def personalizarComponentes(self):
        self.lblMensaje = QLabel("HOLA MUNDO", self.pnlPrincipal)
        self.lblMensaje.setFont(QFont("Courier New", 12))
        self.lblMensaje.setStyleSheet("color: #FF0000;")
        self.lblMensaje.setAlignment(Qt.AlignCenter)
        self.lblMensaje.setGeometry(0, 140, 480, 20)
        
if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = Ventana()
    ventana.show()
    sys.exit(app.exec_())