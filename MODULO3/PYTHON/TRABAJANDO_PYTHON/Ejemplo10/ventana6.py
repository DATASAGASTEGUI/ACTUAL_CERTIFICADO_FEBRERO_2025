import sys, os
from PyQt5.QtWidgets import º
from PyQt5.QtGui import QIcon, QFont
from PyQt5.QtCore import Qt

class Ventana(QMainWindow):
    def __init__(self):
        super().__init__()
        self.bandera = True
        self.personalizarVentana()
        self.personalizarComponentes()

    def personalizarVentana(self):
        self.setWindowTitle("VENTANA PYQT5")  # Crear una ventana y poner un título
        self.setFixedSize(480, 330) # Poner un ancho y altura a la ventana y no redimensiona
        self.setStyleSheet("background-color: lightgray;") # Color de fondo

        ruta_relativa = "PYTHON_0033/cross1.png"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        print(ruta_absoluta) # F:\CURSOS\TRABAJANDO\PROJECTS___PYTHON\PYTHON_TEXTO\PYTHON\PYTHON_0033\cross1.png
        self.setWindowIcon(QIcon(ruta_absoluta)) 

        self.pnlPrincipal = QWidget() # Crear un contenedor
        self.setCentralWidget(self.pnlPrincipal) # Establecer el contenedor como principal para nuestra ventana
    
    def personalizarComponentes(self):
        self.lblMensaje = QLabel("HOLA MUNDO", self.pnlPrincipal)
        self.lblMensaje.setFont(QFont("Courier New", 12))
        self.lblMensaje.setStyleSheet("color: #FF0000;")
        self.lblMensaje.setAlignment(Qt.AlignCenter)
        self.lblMensaje.setGeometry(0, 90, 480, 20)

        self.cmdAceptar = QPushButton("ACEPTAR", self.pnlPrincipal)
        self.cmdAceptar.setFont(QFont("Courier New", 8))
        self.cmdAceptar.setStyleSheet("background-color: black; color: white;")
        self.cmdAceptar.setGeometry(200, 190, 80, 20)
        self.cmdAceptar.clicked.connect(self.cmdAceptarClicked)

    def cmdAceptarClicked(self):
        if self.bandera:
            self.lblMensaje.setVisible(False)
            self.bandera = False
        else:
            self.lblMensaje.setVisible(True)
            self.bandera = True


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ventana = Ventana()
    ventana.show()
    sys.exit(app.exec_())