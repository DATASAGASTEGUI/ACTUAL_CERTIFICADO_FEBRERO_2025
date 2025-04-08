import sys, os
import bcrypt, sqlite3
from PySide6.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit, QPushButton, QVBoxLayout,
    QMessageBox, QTableWidget, QTableWidgetItem, QHBoxLayout, QHeaderView, QMainWindow
)
from PySide6.QtGui import QFont, QIcon
from PySide6.QtCore import Qt


class VentanaGestionUsuarios(QMainWindow):
    def __init__(self):
        super().__init__()
        self.personalizar_ventana()
        self.personalizar_componentes()
        self.cargar_datos()

    def closeEvent(self, event):
        reply = QMessageBox.question(
            self,
            "Confirmar cierre",
            "¿Seguro que deseas salir?",
            QMessageBox.Yes | QMessageBox.No
        )
        if reply == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()

    def personalizar_ventana(self):
        self.setWindowTitle("Gestión de Usuarios")
        self.setFixedSize(600, 400)
        self.setStyleSheet("background-color: lightgray;")

        ruta_relativa = "favicon.ico"
        ruta_absoluta = os.path.abspath(ruta_relativa)
        if os.path.exists(ruta_absoluta):
            self.setWindowIcon(QIcon(ruta_absoluta))

        self.panel_principal = QWidget()
        self.setCentralWidget(self.panel_principal)

    def personalizar_componentes(self):
        layout_principal = QVBoxLayout()

        # TABLA DE USUARIOS
        self.tabla = QTableWidget()
        self.tabla.setColumnCount(3)
        self.tabla.setHorizontalHeaderLabels(["NOMBRE USUARIO", "CONTRASEÑA", "ROL"])
        self.tabla.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)

        # Conectar evento para rellenar campos
        self.tabla.cellClicked.connect(self.rellenar_campos_usuario)

        # CAMPOS
        self.txt_nombre_usuario = QLineEdit()
        self.txt_nombre_usuario.setPlaceholderText("Nombre Usuario")

        self.txt_contrasena = QLineEdit()
        self.txt_contrasena.setPlaceholderText("Contraseña")

        self.txt_rol = QLineEdit()
        self.txt_rol.setPlaceholderText("Rol (Administrador/Cajero/Almacén)")

        # BOTONES
        self.btn_agregar_usuario = QPushButton("Agregar Usuario")
        self.btn_agregar_usuario.clicked.connect(self.agregar_usuario)

        self.btn_editar_usuario = QPushButton("Editar Usuario")
        self.btn_editar_usuario.clicked.connect(self.editar_usuario)

        self.btn_eliminar_usuario = QPushButton("Eliminar Usuario")
        self.btn_eliminar_usuario.clicked.connect(self.eliminar_usuario)

        layout_botones = QHBoxLayout()
        layout_botones.addWidget(self.btn_agregar_usuario)
        layout_botones.addWidget(self.btn_editar_usuario)
        layout_botones.addWidget(self.btn_eliminar_usuario)

        layout_principal.addWidget(self.tabla)
        layout_principal.addWidget(self.txt_nombre_usuario)
        layout_principal.addWidget(self.txt_contrasena)
        layout_principal.addWidget(self.txt_rol)
        layout_principal.addLayout(layout_botones)

        self.panel_principal.setLayout(layout_principal)

    def obtener_conexion(self):
        nra = "ferreteria.sqlite3"
        conexion = None
        try:
            conexion = sqlite3.connect(nra)
        except sqlite3.Error:
            conexion = None
        return conexion

    def cargar_datos(self):
        conexion = self.obtener_conexion()
        if conexion is not None:
            try:
                query = "SELECT nombre_usuario, contrasena, rol FROM Usuario"
                cursor = conexion.cursor()
                cursor.execute(query)
                lista_tuplas = cursor.fetchall()
                self.tabla.setRowCount(len(lista_tuplas))
                for fila, tupla in enumerate(lista_tuplas): # 0, 1, 2, 3, 4
                    print(fila)
                    for columna, dato in enumerate(tupla):  # 0 1 2(walter, 13234, Cajero)
                        self.tabla.setItem(fila, columna, QTableWidgetItem(str(dato)))
            except Exception as e:
                QMessageBox.critical(self, "Error", f"Error al cargar datos: {str(e)}")
            finally:
                conexion.close()
        else:
            QMessageBox.critical(self, "Error", "No se pudo abrir la conexión")

    def encriptar_contrasena(self, contrasena):
        contrasena_byte = contrasena.encode()# str a bytes
        contrasena_hashed = bcrypt.hashpw(contrasena_byte, bcrypt.gensalt())
        return contrasena_hashed.decode()

    def agregar_usuario(self):
        conexion = self.obtener_conexion()
        if conexion is not None:
            nombre_usuario = self.txt_nombre_usuario.text()
            contrasena = self.txt_contrasena.text()
            rol = self.txt_rol.text()

            if not nombre_usuario or not contrasena or not rol:
                QMessageBox.warning(self, "Warning", "Debe llenar todos los campos")
                return

            try:
                cursor = conexion.cursor()
                query = """INSERT INTO Usuario(nombre_usuario, contrasena, rol) 
                           VALUES (?, ?, ?);"""
                cursor.execute(query, (nombre_usuario, self.encriptar_contrasena(contrasena), rol))
                conexion.commit()
                self.cargar_datos()
                self.limpiar_campos_usuario()
                QMessageBox.information(self, "Ok", "Usuario agregado")
            except Exception as e:
                QMessageBox.critical(self, "Error", f"Insert Error: {str(e)}")
            finally:
                conexion.close()
        else:
            QMessageBox.critical(self, "Error", "No se pudo abrir la conexión")

    def editar_usuario(self):
        conexion = self.obtener_conexion()
        if conexion is not None:
            fila_seleccionada = self.tabla.currentRow()
            if fila_seleccionada != -1:
                nombre_usuario_buscar = self.tabla.item(fila_seleccionada, 0).text()
                nombre_usuario_update = self.txt_nombre_usuario.text()
                contrasena_update = self.txt_contrasena.text()
                rol_update = self.txt_rol.text()

                if nombre_usuario_update and contrasena_update and rol_update:
                    try:
                        cursor = conexion.cursor()
                        query = """UPDATE Usuario 
                                   SET nombre_usuario = ?, contrasena = ?, rol = ? 
                                   WHERE nombre_usuario = ?;"""
                        cursor.execute(query, (nombre_usuario_update,
                                               self.encriptar_contrasena(contrasena_update),
                                               rol_update,
                                               nombre_usuario_buscar))
                        conexion.commit()
                        QMessageBox.information(self, "Ok", "Usuario actualizado")
                        self.cargar_datos()
                        self.limpiar_campos_usuario()
                    except Exception as e:
                        QMessageBox.critical(self, "Error", f"Update Error: {str(e)}")
                    finally:
                        conexion.close()
                else:
                    QMessageBox.warning(self, "Warning", "Debe llenar todos los campos")
            else:
                QMessageBox.warning(self, "Warning", "Debe seleccionar un usuario")
        else:
            QMessageBox.critical(self, "Error", "No se pudo abrir la conexión")

    def eliminar_usuario(self):
        reply = QMessageBox.question(
            self,
            "Confirmación",
            "¿Estás seguro de realizar esta acción?",
            QMessageBox.Yes | QMessageBox.No
        )
        if reply == QMessageBox.No:
            return

        conexion = self.obtener_conexion()
        if conexion is not None:
            fila_seleccionada = self.tabla.currentRow()
            if fila_seleccionada != -1:
                nombre_usuario_eliminar = self.tabla.item(fila_seleccionada, 0).text()
                try:
                    cursor = conexion.cursor()
                    query = "DELETE FROM Usuario WHERE nombre_usuario = ?;"
                    cursor.execute(query, (nombre_usuario_eliminar,))
                    conexion.commit()
                    QMessageBox.information(self, "Ok", "Usuario eliminado")
                    self.cargar_datos()
                    self.limpiar_campos_usuario()
                except Exception as e:
                    QMessageBox.critical(self, "Error", f"Delete Error: {str(e)}")
                finally:
                    conexion.close()
            else:
                QMessageBox.warning(self, "Warning", "Debe seleccionar un usuario")
        else:
            QMessageBox.critical(self, "Error", "No se pudo abrir la conexión")

    def limpiar_campos_usuario(self):
        self.txt_nombre_usuario.clear()
        self.txt_contrasena.clear()
        self.txt_rol.clear()

    def rellenar_campos_usuario(self, fila, columna):
        nombre_usuario = self.tabla.item(fila, 0).text()
        contrasena = self.tabla.item(fila, 1).text()
        rol = self.tabla.item(fila, 2).text()

        self.txt_nombre_usuario.setText(nombre_usuario)
        self.txt_contrasena.setText(contrasena)
        self.txt_rol.setText(rol)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    ventana = VentanaGestionUsuarios()
    ventana.show()
    sys.exit(app.exec())

