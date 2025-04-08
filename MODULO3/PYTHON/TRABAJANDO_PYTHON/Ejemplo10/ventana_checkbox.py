import sys,os
from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel, QCheckBox, QPushButton, QMessageBox, QWidget
from PyQt5.QtGui import QFont, QIcon

class Ventana(QMainWindow):
    def __init__(self):
        super().__init__()
        self.personalizarVentana()
        self.personalizarComponentes()

    def personalizarVentana(self):
        self.setWindowTitle("VENTANA PYQT5")
        self.setStyleSheet("background-color: lightgray;")
        self.setFixedSize(480, 330)

        # Cambiar el icono de la ventana con una ruta absoluta que se crea a partir de una relativa
        ruta_relativa = "Ejemplo10/cross1.png"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        print(ruta_absoluta) # F:\CURSOS\TRABAJANDO\PROJECTS___PYTHON\PYTHON_TEXTO\PYTHON\PYTHON_0033\cross1.png
        self.setWindowIcon(QIcon(ruta_absoluta))

        self.pnlPrincipal = QWidget() # Crear un contenedor
        self.setCentralWidget(self.pnlPrincipal) # Establecer el contenedor como principal para nuestra ventana
  
    def personalizarComponentes(self):
        self.lblTitulo = QLabel(self.pnlPrincipal)
        self.lblTitulo.setText("SELECCIONAR UNA O VARIAS CIUDADES DESDE CHECKBOX")
        self.lblTitulo.setGeometry(0, 0, 480, 20)
        self.lblTitulo.setAlignment(Qt.AlignCenter)
        self.lblTitulo.setStyleSheet("background-color: black; color: yellow;")
        self.lblTitulo.setFont(QFont("Courier New", 9))

        self.lblMensaje = QLabel(self.pnlPrincipal)
        self.lblMensaje.setText("AQUI SE PONDRA LO QUE SELECCIONE")
        self.lblMensaje.setGeometry(0, 80, 480, 20)
        self.lblMensaje.setAlignment(Qt.AlignCenter)
        self.lblMensaje.setFont(QFont("Courier New", 9))

        self.chk1 = QCheckBox(self.pnlPrincipal)
        self.chk1.setText("SEVILLA")
        self.chk1.setGeometry(70, 160, 85, 20)
        self.chk1.setFont(QFont("Courier New", 8))

        self.chk2 = QCheckBox(self.pnlPrincipal)
        self.chk2.setText("MADRID")
        self.chk2.setGeometry(165, 160, 70, 20)
        self.chk2.setFont(QFont("Courier New", 8))

        self.chk3 = QCheckBox(self.pnlPrincipal)
        self.chk3.setText("BARCELONA")
        self.chk3.setGeometry(240, 160, 95, 20)
        self.chk3.setFont(QFont("Courier New", 8))

        self.chk4 = QCheckBox(self.pnlPrincipal)
        self.chk4.setText("BILBAO")
        self.chk4.setGeometry(340, 160, 85, 20)
        self.chk4.setFont(QFont("Courier New", 8))

        self.btoAceptar = QPushButton(self.pnlPrincipal)
        self.btoAceptar.setText("ACEPTAR")
        self.btoAceptar.setGeometry(70, 240, 80, 20)
        self.btoAceptar.clicked.connect(self.aceptar)
        self.btoAceptar.setFont(QFont("Courier New", 8))

        self.btoReiniciar = QPushButton(self.pnlPrincipal)
        self.btoReiniciar.setText("REINICIAR")
        self.btoReiniciar.setGeometry(200, 240, 80, 20)
        self.btoReiniciar.clicked.connect(self.reiniciar)
        self.btoReiniciar.setFont(QFont("Courier New", 8))

        self.btoSalir = QPushButton(self.pnlPrincipal)
        self.btoSalir.setText("SALIR")
        self.btoSalir.setGeometry(330, 240, 80, 20)
        self.btoSalir.clicked.connect(self.salir)
        self.btoSalir.setFont(QFont("Courier New", 8))

    def aceptar(self):
        try:
            selected_checkboxes = [checkbox.text() for checkbox in [self.chk1, self.chk2, self.chk3, self.chk4] if checkbox.isChecked()]
            mensaje = " - ".join(selected_checkboxes)
            if mensaje != "":
               self.lblMensaje.setText(mensaje)
            else:
               QMessageBox.critical(self, "ERROR", "SELECCIONE AL MENOS UN CHECKBOX")
        except Exception as e:
            QMessageBox.critical(self, "ERROR", "SELECCIONE AL MENOS UN CHECKBOX")

    def reiniciar(self):
        for checkbox in [self.chk1, self.chk2, self.chk3, self.chk4]:
            checkbox.setChecked(False)
        self.lblMensaje.setText("AQUI SE PONDRA LO QUE SELECCIONE")

    def salir(self):
        sys.exit()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = Ventana()
    ventana.show()
    sys.exit(app.exec_())