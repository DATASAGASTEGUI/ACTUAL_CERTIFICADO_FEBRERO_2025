import sys
from PyQt5.QtWidgets import QApplication

from ventana4 import Ventana

if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = Ventana("VENTANA PYQT5")
    ventana.show()
    sys.exit(app.exec_())