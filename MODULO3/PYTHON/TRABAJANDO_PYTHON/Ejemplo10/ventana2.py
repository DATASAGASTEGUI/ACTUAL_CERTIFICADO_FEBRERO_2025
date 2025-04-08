import sys
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QMessageBox

class MiVentana(QWidget):   #class MiVentana extends JFrame  public MiVentana()
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Mi primera ventana PyQt5")
        self.setGeometry(100, 100, 300, 200)  # Posición y tamaño (x, y, ancho, alto)

        # Crear un botón
        self.boton = QPushButton("Haz clic aquí", self)
        self.boton.setGeometry(80, 80, 140, 40)  # Posición y tamaño del botón

        # Conectar el clic del botón con la función mostrar_mensaje
        self.boton.clicked.connect(self.mostrar_mensaje)

    def mostrar_mensaje(self):
        QMessageBox.information(self, "Mensaje", "¡Hola! Has pulsado el botón.")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = MiVentana()
    ventana.show()
    sys.exit(app.exec_())
