import sys
from PyQt5.QtWidgets import QApplication, QWidget

app = QApplication(sys.argv)
window = QWidget()
window.setWindowTitle('Hola PyQt5')
window.resize(300, 200)
window.show()
sys.exit(app.exec_())