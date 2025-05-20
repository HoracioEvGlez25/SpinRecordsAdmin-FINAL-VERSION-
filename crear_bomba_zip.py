import zipfile

# Nombre del archivo zip que se va a crear
nombre_zip = "bomba_1gb.zip"

# Tamaño de cada bloque en bytes (1 MB)
tamano_bloque = 1024 * 1024

# Cantidad de bloques necesarios para llegar a 1 GB
cantidad_bloques = 1024  # 1024 MB = 1 GB

print(f"Creando '{nombre_zip}' con {cantidad_bloques} bloques de 1MB...")

with zipfile.ZipFile(nombre_zip, "w", compression=zipfile.ZIP_DEFLATED) as zipf:
    bloque = b'\x00' * tamano_bloque  # 1MB de ceros
    for i in range(cantidad_bloques):
        nombre_archivo = f"datos/parte_{i:04}.bin"
        zipf.writestr(nombre_archivo, bloque)
        if i % 100 == 0:
            print(f"  Escribiendo bloque {i+1}/{cantidad_bloques}...")

print("¡Listo! Archivo ZIP creado.")

