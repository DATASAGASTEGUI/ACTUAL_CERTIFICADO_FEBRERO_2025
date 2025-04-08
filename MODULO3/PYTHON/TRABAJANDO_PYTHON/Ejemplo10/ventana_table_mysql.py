import sys, os
import mysql.connector
# pip install mysql-connector-python
from PyQt5.QtWidgets import (
    QWidget, QApplication, QMainWindow, QTableWidget, QTableWidgetItem, QHeaderView, QPushButton
)
from PyQt5.QtGui import QFont, QIcon
from PyQt5.QtCore import Qt

class Ventana(QMainWindow):
    def __init__(self):
        super().__init__()
        self.personalizarVentana()
        self.personalizarComponentes()
        self.datos = self.obtener_datos_db()
        self.indice_actual = 0
        self.cargarSiguiente5()

    def personalizarVentana(self):
        self.setFixedSize(480, 330)
        self.setWindowTitle("VENTANA PYQT5")
        self.setStyleSheet("background-color: lightgray;")

        ruta_relativa = "PYTHON_0033/cross1.png"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        self.setWindowIcon(QIcon(ruta_absoluta))

    def personalizarComponentes(self):
        self.tblMostrar = QTableWidget(self)
        self.tblMostrar.setColumnCount(3)
        self.tblMostrar.setRowCount(0)
        self.tblMostrar.setHorizontalHeaderLabels(["ID", "NOMBRE", "ESTATURA"])
        self.tblMostrar.horizontalHeader().setStyleSheet("color: black; background-color: white;")
        self.tblMostrar.horizontalHeader().setFont(QFont("Courier New", 9, QFont.Bold))
        self.tblMostrar.setFont(QFont("Courier New", 9))
        self.tblMostrar.setStyleSheet("background-color: lightgray;")
        self.tblMostrar.setGeometry(10, 10, 460, 307)

        header = self.tblMostrar.horizontalHeader()
        header.setSectionResizeMode(QHeaderView.Stretch)
        header.setStretchLastSection(True)

        self.botonMostrar5en5 = QPushButton("Mostrar 5 en 5", self)
        self.botonMostrar5en5.setFont(QFont("Courier New", 0, 8))
        self.botonMostrar5en5.setStyleSheet("background-color: black; color: white;")
        self.botonMostrar5en5.clicked.connect(self.cargarSiguiente5)
        self.botonMostrar5en5.setGeometry(180, 260, 120, 20)

    def obtener_datos_db(self):
        try:
            conn = mysql.connector.connect(
                host='localhost',
                user='root',         # <--- CAMBIA ESTO
                password='12345678',  # <--- CAMBIA ESTO
                database='PYQTDB',
                port=3307
            )
            cursor = conn.cursor()
            cursor.execute("SELECT id, nombre, estatura FROM Personas ORDER BY id")
            datos = cursor.fetchall()
            conn.close()
            return datos
        except mysql.connector.Error as err:
            print("Error al conectar a la base de datos:", err)
            return []

    def cargarSiguiente5(self):
        if self.indice_actual >= len(self.datos):
            return

        self.indice_id = 0
        self.indice_estatura = 2

        self.limpiarTabla()

        k = 0
        for i in range(self.indice_actual, min(self.indice_actual + 5, len(self.datos))):
            persona = self.datos[i]
            self.tblMostrar.insertRow(k)
            self.tblMostrar.setItem(k, 0, QTableWidgetItem(str(persona[0])))
            self.tblMostrar.setItem(k, 1, QTableWidgetItem(persona[1]))
            self.tblMostrar.setItem(k, 2, QTableWidgetItem(self.decimalesfijo(float(persona[2]))))

            item0 = self.tblMostrar.item(k, self.indice_id)
            item0.setTextAlignment(Qt.AlignCenter | Qt.AlignVCenter)

            item2 = self.tblMostrar.item(k, self.indice_estatura)
            item2.setTextAlignment(Qt.AlignRight | Qt.AlignVCenter)

            k += 1

        self.indice_actual += 5

    def decimalesfijo(self, estatura):
        parte_entera = int(estatura)
        parte_decimal = estatura - parte_entera
        parte_decimal_1 = int(parte_decimal * 100)
        if parte_decimal_1 % 10 == 0:
            return str(estatura) + "0"
        else:
            return str(estatura)

    def limpiarTabla(self):
        self.tblMostrar.setRowCount(0)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = Ventana()
    ventana.show()
    sys.exit(app.exec_())
