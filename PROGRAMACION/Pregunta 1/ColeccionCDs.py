# IMPORTAR LIBRERIAS
import sqlite3 as lite
from prettytable import PrettyTable

# ME CONECTO A LA BASE DE DATOS LLAMADA "coleccion"
conexion = lite.connect("coleccion.sqlite")

# ESTABLEZCO UN CURSOR PARA SABER EN QUE PUNTO DE LA BASE DE DATOS VOY A TRABAJAR
cursor = conexion.cursor()

# REALIZO UNA CONSULTA A LA BASE DE DATOS
cursor.execute("SELECT * FROM coleccion;")

# ME DEVUELVE LOS DATOS QUE CONTIENE LA BASE DE DATOS
datos = cursor.fetchall()

# CREO UNA TABLA CON LOS ENCABEZADOS
tabla = PrettyTable()
tabla.field_names = ["ID", "Titulo", "Artista", "Anolanzamiento", "Generomusical"]

# AGREGO LAS FILAS A LA TABLA
for fila in datos:
    tabla.add_row(fila)

# IMPRIMO LA TABLA
print(tabla)

# MENÚ DE OPERACIONES
while True:
    print("\n--- MENÚ DE OPERACIONES ---")
    print("1. Añadir un nuevo registro")
    print("2. Leer un registro existente")
    print("3. Actualizar un registro existente")
    print("4. Eliminar un registro existente")
    print("5. Salir")

    opcion = input("Ingrese una opción (1-5): ")

    if opcion == "1":
        # AÑADIR UN NUEVO REGISTRO
        titulo = input("Ingrese el título del álbum: ")
        artista = input("Ingrese el nombre del artista: ")
        anolanzamiento = input("Ingrese el año de lanzamiento: ")
        generomusical = input("Ingrese el género musical: ")

        cursor.execute("INSERT INTO coleccion (titulo, artista, anolanzamiento, generomusical) VALUES (?, ?, ?, ?);", (titulo, artista, anolanzamiento, generomusical))
        conexion.commit()

        print("El registro ha sido añadido con éxito.")

    elif opcion == "2":
        # LEER UN REGISTRO EXISTENTE
        id_registro = input("Ingrese el ID del registro que desea leer: ")

        cursor.execute("SELECT * FROM coleccion WHERE id = ?;", (id_registro,))
        registro = cursor.fetchone()

        if registro is not None:
            print("ID:", registro[0])
            print("Título:", registro[1])
            print("Artista:", registro[2])
            print("Año de lanzamiento:", registro[3])
            print("Género musical:", registro[4])
        else:
            print("El registro no ha sido encontrado.")

    elif opcion == "3":
        # ACTUALIZAR UN REGISTRO EXISTENTE
        id_registro = input("Ingrese el ID del registro que desea actualizar: ")

        cursor.execute("SELECT * FROM coleccion WHERE id = ?;", (id_registro,))
        registro = cursor.fetchone()

        if registro is not None:
            print("ID:", registro[0])
            print("Título:", registro[1])
            print("Artista:", registro[2])
            print("Año de lanzamiento:", registro[3])
            print("Género musical:", registro[4])
        else:
            print(f"No se encontró ningún registro con el ID {id}")

    elif opcion == "3":
        # Actualizar un registro
        id = input("Ingrese el ID del registro que desea actualizar: ")
        titulo = input("Ingrese el nuevo título: ")
        artista = input("Ingrese el nuevo artista: ")
        anolanzamiento = input("Ingrese el nuevo año de lanzamiento: ")
        generomusical = input("Ingrese el nuevo género musical: ")

        cursor.execute(f"UPDATE coleccion SET titulo = '{titulo}', artista = '{artista}', anolanzamiento = '{anolanzamiento}', generomusical = '{generomusical}' WHERE id = {id}")
        conexion.commit()

        if cursor.rowcount > 0:
            print(f"Se actualizó correctamente el registro con ID {id}")
        else:
            print(f"No se encontró ningún registro con el ID {id}")

    elif opcion == "4":
        # Eliminar un registro
        id = input("Ingrese el ID del registro que desea eliminar: ")
        cursor.execute(f"DELETE FROM coleccion WHERE id = {id}")
        conexion.commit()

        if cursor.rowcount > 0:
            print(f"Se eliminó correctamente el registro con ID {id}")
        else:
            print(f"No se encontró ningún registro con el ID {id}")

    else:
        print("Opción inválida, por favor ingrese una opción válida.")



