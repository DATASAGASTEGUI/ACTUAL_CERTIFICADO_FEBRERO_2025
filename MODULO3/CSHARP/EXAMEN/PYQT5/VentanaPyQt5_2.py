import sys
from PyQt5.QtWidgets import QApplication, QLabel, QWidget

class MiVentana(QWidget): # Crear una clase que herede de QWidget
    def __init__(self):
        super().__init__()
        self.inicializar_ui()
        
    def inicializar_ui(self):
        # Personalizar ventana
        self.setWindowTitle("Mi primera ventana")
        self.setFixedSize(400, 200)
        # Personalizar componentes
        self.etiqueta = QLabel("¡Hola Mundo!", self)
        self.etiqueta.move(0, 80)

if __name__ == "__main__":
    app = QApplication(sys.argv)

    ventana = MiVentana()
    ventana.show()

    sys.exit(app.exec_())