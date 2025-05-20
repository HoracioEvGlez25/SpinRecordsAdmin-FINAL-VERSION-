import gzip
import shutil

# Archivos de entrada y salida
archivo_original = "bomba_1gb.zip"
archivo_gz = "bomba_1gb.zip.gz"

# Comprimir usando gzip
with open(archivo_original, "rb") as f_in:
    with gzip.open(archivo_gz, "wb") as f_out:
        shutil.copyfileobj(f_in, f_out)

print("Archivo GZ creado:", archivo_gz)
