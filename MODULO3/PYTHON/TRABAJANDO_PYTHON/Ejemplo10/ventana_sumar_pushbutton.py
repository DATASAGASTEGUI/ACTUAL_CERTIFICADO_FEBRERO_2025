import sys,os
from PyQt5.QtWidgets import QMainWindow, QRadioButton, QApplication, QWidget, QLabel, QLineEdit, QPushButton, QMessageBox, QVBoxLayout
from PyQt5.QtGui import QFont, QIcon
from PyQt5.QtCore import Qt

class Ventana(QMainWindow):
    def __init__(self):
        super().__init__()
        self.personalizarVentana()
        self.personalizarComponentes()

    def personalizarVentana(self):
        self.setWindowTitle("VENTANA PYQT5")
        self.setFixedSize(480, 330)
        self.setStyleSheet("background-color: lightgray;")

        # Cambiar el icono de la ventana con una ruta absoluta que se crea a partir de una relativa
        ruta_relativa = "Ejemplo10/cross1.png"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        print(ruta_absoluta) # F:\CURSOS\TRABAJANDO\PROJECTS___PYTHON\PYTHON_TEXTO\PYTHON\PYTHON_0033\cross1.png
        self.setWindowIcon(QIcon(ruta_absoluta))

        # Centrar la ventana en la pantalla
        self.pnlPrincipal = QWidget() # Crear un contenedor principal
        self.setCentralWidget(self.pnlPrincipal) # Establecer el contenedor principal para nuestra ventana
    

    def personalizarComponentes(self):
        self.lblTitulo = QLabel("SUMAR DOS NUMEROS", self.pnlPrincipal)
        self.lblTitulo.setFont(QFont("Courier New", 9))
        self.lblTitulo.setStyleSheet("background-color: black; color: yellow;")
        self.lblTitulo.setAlignment(Qt.AlignCenter)
        self.lblTitulo.setGeometry(0, 0, 480, 20)

        self.lblNumero1 = QLabel("Número 1?", self.pnlPrincipal)
        self.lblNumero1.setFont(QFont("Courier New", 9))
        self.lblNumero1.setGeometry(130, 80, 147, 17)

        self.lblNumero2 = QLabel("Número 2?", self.pnlPrincipal)
        self.lblNumero2.setFont(QFont("Courier New", 9))
        self.lblNumero2.setGeometry(130, 120, 147, 17)

        self.lblSuma = QLabel("Suma :", self.pnlPrincipal)
        self.lblSuma.setFont(QFont("Courier New", 9))
        self.lblSuma.setGeometry(130, 160, 147, 17)

        self.txtNumero1 = QLineEdit(self.pnlPrincipal)
        self.txtNumero1.setGeometry(235, 80, 120, 20)
        self.txtNumero1.setFont(QFont("Courier New", 9))
        self.txtNumero1.setAlignment(Qt.AlignCenter)
        self.txtNumero1.setStyleSheet("color: blue;")

        self.txtNumero2 = QLineEdit(self.pnlPrincipal)
        self.txtNumero2.setGeometry(235, 120, 120, 20)
        self.txtNumero2.setFont(QFont("Courier New", 9))
        self.txtNumero2.setAlignment(Qt.AlignCenter)
        self.txtNumero2.setStyleSheet("color: blue;")

        self.txtSuma = QLineEdit(self.pnlPrincipal)
        self.txtSuma.setGeometry(235, 160, 120, 20)
        self.txtSuma.setFont(QFont("Courier New", 9))
        self.txtSuma.setReadOnly(True)
        self.txtSuma.setAlignment(Qt.AlignCenter)
        self.txtSuma.setStyleSheet("color: red;")

        self.btoSumar = QPushButton("SUMAR", self.pnlPrincipal)
        self.btoSumar.setGeometry(110, 240, 80, 20)
        self.btoSumar.setFont(QFont("Courier New", 8))
        self.btoSumar.clicked.connect(self.sumar)

        self.btoReiniciar = QPushButton("REINICIAR", self.pnlPrincipal)
        self.btoReiniciar.setGeometry(200, 240, 80, 20)
        self.btoReiniciar.setFont(QFont("Courier New", 8))
        self.btoReiniciar.clicked.connect(self.reiniciar)

        self.btoSalir = QPushButton("SALIR", self.pnlPrincipal)
        self.btoSalir.setGeometry(290, 240, 80, 20)
        self.btoSalir.setFont(QFont("Courier New", 8))
        self.btoSalir.clicked.connect(self.salir)

    def sumar(self):
        try:
            numero1 =float(self.txtNumero1.text())
            numero2 = float(self.txtNumero2.text())   # 1.3
            suma = numero1 + numero2
            self.txtSuma.setText(str(round(suma, 2)))
        except Exception as e:
            QMessageBox.critical(self, "ERROR", "ENTRADA INCORRECTA")
            #QMessageBox.information(self, "INFORMACION", "ENTRADA INCORRECTA")
            #QMessageBox.warning(self, "WARNING", "ENTRADA INCORRECTA")


    def reiniciar(self):
        self.txtNumero1.clear()
        self.txtNumero2.clear()
        self.txtSuma.clear()

    def salir(self):
        self.close()

if __name__ == "__main__":
    os.system("cls")
    app = QApplication(sys.argv)
    ventana = Ventana()
    ventana.show()
    sys.exit(app.exec_())
    os.system("pause")