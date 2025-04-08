import bcrypt

#mi_str = "Corazón de niño" # Unicode
#mi_bytes = b"Corazn de nio"
#mi_bytes = mi_str.enconde()

# Paso 1: la contraseña que escribe el usuario
contrasena_str = "MiSecreta123!" # str
print("Contraseña original:", contrasena_str) # MiSecreta123!

# Paso 2: convertir la contraseña a bytes
contrasena_byte = contrasena_str.encode() # str a bytes
print("Bytes:", contrasena_byte) # b'MiSecreta123!'

# Paso 3: generar hash con pip install bcrypt
contrasena_hashed = bcrypt.hashpw(contrasena_byte, bcrypt.gensalt(rounds=12))
print("Hash (bytes):", contrasena_hashed) # b'$2b$12$reG8YQDHpS3D3JsFyUa7SORFDSPpFUS.BH2q6E1e/tQO5SRbz/j6u'

# Paso 4: convertir a string para almacenar en DB
contrasena_hashed_str = contrasena_hashed.decode()
print("Hash (string para guardar en DB):", contrasena_hashed_str) # $2b$12$reG8YQDHpS3D3JsFyUa7SORFDSPpFUS.BH2q6E1e/tQO5SRbz/j6u

# Paso 5: verificación
entrada_usuario = "MiSecreta123!" # str
ok = bcrypt.checkpw(entrada_usuario.encode(), contrasena_hashed_str.encode())
print("¿Coincide?", ok)

entrada_usuario = "OtraClave"
ok = bcrypt.checkpw(entrada_usuario.encode(), contrasena_hashed_str.encode())
print("¿Coincide?", ok)
