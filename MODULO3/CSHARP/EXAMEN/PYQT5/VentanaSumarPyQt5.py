from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QLineEdit, QPushButton
import sys



app = QApplication(sys.argv)

ventana = QWidget()
ventana.setWindowTitle("Sumar dos números")
ventana.setGeometry(100, 100, 300, 200)

# Entradas
entrada1 = QLineEdit(ventana)
entrada1.setPlaceholderText("Número 1")
entrada1.move(50, 30)

entrada2 = QLineEdit(ventana)
entrada2.setPlaceholderText("Número 2")
entrada2.move(50, 70)

# Botón
boton = QPushButton("Sumar", ventana)
boton.move(50, 110)
boton.clicked.connect(sumar)

# Resultado
resultado = QLabel("Resultado:", ventana)
resultado.move(50, 150)

ventana.show()

sys.exit(app.exec_())

def sumar():
    try:
        num1 = float(entrada1.text())
        num2 = float(entrada2.text())
        resultado.setText(f"Resultado: {num1 + num2}")
    except ValueError:
        resultado.setText("Por favor, introduce números válidos.")
