import gzip
import shutil

# Archivos de entrada y salida
archivo_original = "bomba_1gb.zip"          # Asegúrate de que este archivo exista
archivo_comprimido = "bomba_1gb.zip.gz"     # Nombre del archivo .gz de salida

# Comprimir usando gzip
with open(archivo_original, "rb") as f_in:
    with gzip.open(archivo_comprimido, "wb") as f_out:
        shutil.copyfileobj(f_in, f_out)

print(f"Archivo comprimido correctamente: {archivo_comprimido}")
