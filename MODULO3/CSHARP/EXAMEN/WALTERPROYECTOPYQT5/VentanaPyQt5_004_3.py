import sys, os, sqlite3
from PyQt5.QtWidgets import (
    QApplication, QMainWindow, QWidget, QLabel, QLineEdit, QPushButton,
    QMessageBox, QComboBox, QVBoxLayout, QHBoxLayout, QFormLayout
)
from PyQt5.QtGui import QIcon


# ============================
# CLASE DBManager
# ============================
class DBManager:
    def __init__(self, db_name="tienda.sqlite3"):
        self.db_name = db_name

    # SELECT
    def query(self, sql, params=()):
        conn = sqlite3.connect(self.db_name)
        cursor = conn.cursor()
        cursor.execute(sql, params)
        results = cursor.fetchall()
        conn.close()
        return results

    # INSERT UPDATE DELETE
    def execute(self, sql, params=()):
        conn = sqlite3.connect(self.db_name)
        cursor = conn.cursor()
        cursor.execute(sql, params)
        conn.commit() # CONFIRMAR LOS CAMBIOS
        conn.close()
        return cursor.rowcount


# ============================
# CLASE VENTANA (PyQt5 GUI)
# ============================
class Ventana(QMainWindow):
    def __init__(self):
        super().__init__()
        self.db = DBManager()  # usar la clase de gestión de BD
        self.personalizarVentana()
        self.personalizarComponentes()
        self.cargarIdsProductos()

    def personalizarVentana(self):
        self.setWindowTitle("VENTANA PYQT5")

        ruta_relativa = "PYTHON_0034/cross1.png"  # Ajusta a tu icono
        ruta_absoluta = os.path.abspath(ruta_relativa)
        self.setWindowIcon(QIcon(ruta_absoluta))

        self.setFixedSize(400, 200)
        self.setStyleSheet("background-color: lightgray;")

        self.pnlPrincipal = QWidget()
        self.setCentralWidget(self.pnlPrincipal)

    def personalizarComponentes(self):
        layoutPrincipal = QVBoxLayout()

        # ==== Selección de producto ====
        hlayoutSeleccion = QHBoxLayout()
        lblSeleccion = QLabel("Selecciona ID:")
        self.cbProductos = QComboBox()
        self.cbProductos.currentIndexChanged.connect(self.cargarProducto)
        hlayoutSeleccion.addWidget(lblSeleccion)
        hlayoutSeleccion.addWidget(self.cbProductos)
        layoutPrincipal.addLayout(hlayoutSeleccion)

        # ==== Formulario de producto ====
        formLayout = QFormLayout()
        self.txtCampos = {}
        etiquetas = ["ID:", "Nombre:", "Precio:", "Stock:",
                     "Fecha Creación:", "Disponible (Sí/No):", "Categoría:"]

        for texto in etiquetas:
            txt = QLineEdit()
            if texto == "ID:":
                txt.setReadOnly(True)
            self.txtCampos[texto] = txt
            formLayout.addRow(QLabel(texto), txt)

        layoutPrincipal.addLayout(formLayout)

        # ==== Botones ====
        hlayoutBotones = QHBoxLayout()
        self.btnInsertar = QPushButton("Insertar")
        self.btnInsertar.clicked.connect(self.insertarProducto)

        self.btnActualizar = QPushButton("Actualizar")
        self.btnActualizar.clicked.connect(self.actualizarProducto)

        self.btnEliminar = QPushButton("Eliminar")
        self.btnEliminar.clicked.connect(self.eliminarProducto)

        self.btnLimpiar = QPushButton("Limpiar")
        self.btnLimpiar.clicked.connect(self.limpiarCampos)

        for btn in [self.btnInsertar, self.btnActualizar, self.btnEliminar, self.btnLimpiar]:
            hlayoutBotones.addWidget(btn)

        layoutPrincipal.addLayout(hlayoutBotones)

        self.pnlPrincipal.setLayout(layoutPrincipal)

    # ============================
    # Métodos CRUD usando DBManager
    # ============================
    def cargarIdsProductos(self):
        self.cbProductos.clear()
        productos = self.db.query("SELECT Id_producto FROM Producto")
        for row in productos:
            self.cbProductos.addItem(str(row[0]))

    def cargarProducto(self):
        if self.cbProductos.currentText() == "":
            return
        id_prod = self.cbProductos.currentText()
        row = self.db.query("SELECT * FROM Producto WHERE Id_producto=?", (id_prod,))

        if row:
            mitupla = row[0]
            self.txtCampos["ID:"].setText(str(mitupla[0]))
            self.txtCampos["Nombre:"].setText(mitupla[1])
            self.txtCampos["Precio:"].setText(str(mitupla[2]))
            self.txtCampos["Stock:"].setText(str(mitupla[3]))
            self.txtCampos["Fecha Creación:"].setText(mitupla[4])
            self.txtCampos["Disponible (Sí/No):"].setText("Sí" if mitupla[5] else "No")
            self.txtCampos["Categoría:"].setText(mitupla[6])

    def insertarProducto(self):
        nombre = self.txtCampos["Nombre:"].text()
        precio = self.txtCampos["Precio:"].text()
        stock = self.txtCampos["Stock:"].text()
        fecha = self.txtCampos["Fecha Creación:"].text()
        disponible = self.txtCampos["Disponible (Sí/No):"].text().lower()
        categoria = self.txtCampos["Categoría:"].text()

        if not (nombre and precio and stock and fecha and disponible and categoria):
            QMessageBox.warning(self, "Advertencia", "Todos los campos deben estar completos.")
            return

        try:
            precio = float(precio)
            stock = int(stock)
        except:
            QMessageBox.critical(self, "Error", "Precio o Stock no son válidos.")
            return

        disponible_bool = disponible in ["sí", "si"]

        rows = self.db.execute("""INSERT INTO Producto 
                                   (Nombre, Precio, Stock, Fecha_creacion, Disponible, Categoria)
                                   VALUES (?, ?, ?, ?, ?, ?)""",
                                (nombre, precio, stock, fecha, disponible_bool, categoria))

        if rows > 0:
            QMessageBox.information(self, "Éxito", "Producto insertado correctamente.")
            self.cargarIdsProductos()
            self.limpiarCampos()

    def actualizarProducto(self):
        id_prod = self.txtCampos["ID:"].text()
        if not id_prod:
            QMessageBox.warning(self, "Advertencia", "Seleccione un producto para actualizar.")
            return

        nombre = self.txtCampos["Nombre:"].text()
        precio = self.txtCampos["Precio:"].text()
        stock = self.txtCampos["Stock:"].text()
        fecha = self.txtCampos["Fecha Creación:"].text()
        disponible = self.txtCampos["Disponible (Sí/No):"].text().lower()
        categoria = self.txtCampos["Categoría:"].text()

        try:
            precio = float(precio)
            stock = int(stock)
        except:
            QMessageBox.critical(self, "Error", "Precio o Stock no son válidos.")
            return

        disponible_bool = disponible in ["sí", "si"]

        rows = self.db.execute("""UPDATE Producto SET 
                                  Nombre=?, Precio=?, Stock=?, Fecha_creacion=?, Disponible=?, Categoria=? 
                                  WHERE Id_producto=?""",
                                (nombre, precio, stock, fecha, disponible_bool, categoria, id_prod))

        if rows > 0:
            QMessageBox.information(self, "Éxito", "Producto actualizado correctamente.")
            self.cargarIdsProductos()

    def eliminarProducto(self):
        id_prod = self.txtCampos["ID:"].text()
        if not id_prod:
            QMessageBox.warning(self, "Advertencia", "Seleccione un producto para eliminar.")
            return

        rows = self.db.execute("DELETE FROM Producto WHERE Id_producto=?", (id_prod,))
        if rows > 0:
            QMessageBox.information(self, "Éxito", "Producto eliminado correctamente.")
            self.cargarIdsProductos()
            self.limpiarCampos()

    def limpiarCampos(self):
        for txt in self.txtCampos.values():
            txt.clear()
        self.cbProductos.setCurrentIndex(-1)


# ============================
# MAIN
# ============================
if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = Ventana()
    ventana.show()
    sys.exit(app.exec_())
