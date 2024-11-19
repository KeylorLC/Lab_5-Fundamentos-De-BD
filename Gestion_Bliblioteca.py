import pyodbc
from datetime import datetime

# Función para conectar con la base de datos
def conectar_db():
    server = 'localhost' 
    database = 'IF4100_Limon_C34297'
    username = 'root'
    password = '1234'

    #Connection string for SQL Server
    conn_str = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'

    try:
        #Establish Connection
        connection = pyodbc.connect(conn_str)
        print("Connection established successfully")
        return connection
    except pyodbc.Error as e:
        print("Connection Failed")
        return None

# Función para insertar préstamos
def insertar_prestamo(codigo_usuario, codigo_ejemplar, fecha_devolucion):
    try:
        conexion = conectar_db()
        if not conexion:
            return
        cursor = conexion.cursor()

        fecha_prestamo = datetime.now()

        cursor.execute("""
            EXEC InsertarPrestamo ?, ?, ?, ?;
        """, codigo_usuario, codigo_ejemplar, fecha_prestamo, fecha_devolucion)
        conexion.commit()
        print("Préstamo insertado correctamente.")
    except Exception as e:
        print("Error al insertar préstamo:", e)
    finally:
        if conexion:
            conexion.close()

# Función para consultar libros
def consultar_libros(codigo=None, titulo=None, isbn=None, paginas=None, editorial=None):
    try:
        conexion = conectar_db()
        if not conexion:
            return
        cursor = conexion.cursor()

        cursor.execute("""
            EXEC ConsultarLibros ?, ?, ?, ?, ?;
        """, codigo, titulo, isbn, paginas, editorial)

        resultados = cursor.fetchall()
        if resultados:
            for row in resultados:
                print(row)
        else:
            print("No se encontraron resultados.")
    except Exception as e:
        print("Error al consultar libros:", e)
    finally:
        if conexion:
            conexion.close()

# Función para actualizar autores
def actualizar_autor(codigo_autor, nombre_nuevo):
    try:
        conexion = conectar_db()
        if not conexion:
            return
        cursor = conexion.cursor()

        cursor.execute("""
            EXEC ActualizarAutor ?, ?;
        """, codigo_autor, nombre_nuevo)
        conexion.commit()
        print("Autor actualizado correctamente.")
    except Exception as e:
        print("Error al actualizar autor:", e)
    finally:
        if conexion:
            conexion.close()

# Función para borrar estudiantes
def borrar_estudiante(codigo_usuario):
    try:
        conexion = conectar_db()
        if not conexion:
            return
        cursor = conexion.cursor()

        cursor.execute("""
            EXEC BorrarEstudiante ?;
        """, codigo_usuario)
        conexion.commit()
        print("Estudiante eliminado correctamente.")
    except Exception as e:
        print("Error al eliminar estudiante:", e)
    finally:
        if conexion:
            conexion.close()

# Ejemplo de uso directo
if __name__ == "__main__":
    # Insertar un préstamo
    insertar_prestamo(10039, 1, '2024-11-30')

    # Consultar libros por título
    #consultar_libros(titulo="Cien años de soledad")

    # Actualizar un autor
    #actualizar_autor(1, "Jorge Luis Borges Actualizado")

    # Eliminar un estudiante
    borrar_estudiante(10034)
