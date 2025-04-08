import sys,os, sqlite3
import bcrypt
from PyQt5.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit, QPushButton, QVBoxLayout,
    QMessageBox, QTableWidget, QTableWidgetItem, QHBoxLayout, QHeaderView
)
from PySide6.QtGui import QFont, QIcon

from VentanaPyQt5Hospital import Ventana


#from ventana_principal import VentanaPrincipal

class VentanaLogin(QWidget):
      def __init__(self):
          super().__init__()
          self.personalizar_ventana()
          self.personalizar_componentes()

      def personalizar_ventana(self):
          self.setWindowTitle("Gestión Login")  # Título para la ventana
          self.setFixedSize(400, 200)  # Tamaño de la ventana ancho y altura

          # Cambiar el icono de la ventanapython9_ventana_menu_mihaita/cross1.png con una ruta absoluta que se crea a partir de una relativa
          ruta_relativa = "favicon.ico"
          ruta_absoluta = os.path.abspath(ruta_relativa)
          self.setWindowIcon(QIcon(ruta_absoluta))          
           
      def personalizar_componentes(self):
          self.lblNombreUsuario = QLabel("Usuario")
          self.lblContrasena = QLabel("Contraseña")

          self.txtNombreUsuario = QLineEdit()

          self.txtContrasena = QLineEdit()
          self.txtContrasena.setEchoMode(QLineEdit.Password)

          self.btnLoguearse = QPushButton("Iniciar Sesión")
          self.btnLoguearse.clicked.connect(self.validar_credenciales)

          layout_principal = QVBoxLayout()
        
          layout_principal.addWidget(self.lblNombreUsuario)
          layout_principal.addWidget(self.txtNombreUsuario)

          layout_principal.addWidget(self.lblContrasena)
          layout_principal.addWidget(self.txtContrasena)

          layout_principal.addWidget(self.btnLoguearse)

          self.setLayout(layout_principal)

      def obtener_conexion(self):
        nra = "usuarios.sqlite3"
        conexion = None
        try:
            conexion = sqlite3.connect(nra)
        except sqlite3.Error:
            conexion = None
        return conexion

      def validar_credenciales(self):   
          conexion = self.obtener_conexion()
          if conexion != None:
             try:
                 nombre_usuario = self.txtNombreUsuario.text()
                 contrasena = self.txtContrasena.text()
                 cursor = conexion.cursor()
                 query = "SELECT contrasena,rol FROM Usuario WHERE nombre_usuario = ?"
                 cursor.execute(query,(nombre_usuario,))
                 resultado_t = cursor.fetchone()
                 if resultado_t:
                    contrasena_hash,rol = resultado_t # (dfsdfas, Cajero)
                    if bcrypt.checkpw(contrasena.encode(), contrasena_hash.encode()):
                       self.abrir_ventana_gestion_consultas()
                       print("ENTRO")
                    else:
                       QMessageBox.critical(self, "Error", "Contraseña Incorrecta")  
                 else:
                   QMessageBox.critical(self, "Error", "Usuario no Valido")  

             except Exception as e:
                 print(e)
                 QMessageBox.critical(self, "Error", "Query Select")
          else: 
             QMessageBox.critical(self, "Error", "Conexion")

      def abrir_ventana_gestion_consultas(self):        
          self.hide()
          self.ventana_principal = Ventana()
          self.ventana_principal.show()
          #QMessageBox.information(self, "Ok","Rol: " + rol)

if __name__ == "__main__":
   app = QApplication(sys.argv)
   ventana = VentanaLogin()
   ventana.show()
   sys.exit(app.exec())


