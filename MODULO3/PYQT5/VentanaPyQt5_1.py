import sys

from PyQt5.QtWidgets import QApplication, QLabel, QWidget

app = QApplication(sys.argv)

ventana = QWidget()
ventana.setWindowTitle("Mi primera ventana")
ventana.setFixedSize(300, 200)

etiqueta = QLabel("¡Hola, PyQt5!", ventana)
etiqueta.move(100, 80)

ventana.show()

sys.exit(app.exec_())
