# SoundsFromHell 🔥

## Tabla de contenido
| Indice | Título  |
|--|--|
| 1. | [Descripción](#Descripcion) |
| 2. | [Características](#Características) |
| 3. | [Tecnologías Utilizadas](#Tecnologias) |
| 4. | [Uso del Repositorio](#Uso) |
| 5. | [Instrucciones de Ejecución](#Instrucciones) |
| 6. | [Autor](#Autores) |

## Descripcion🚀

El proyecto soundsFromHell se basa en la gestion de base de datos debida para el funcionamiento de una tienda de musica, su correcto funcionamiento y demas cosas calcular costos y administrarla.

## Características🧮

La app como tal permite el debido funcionamiento entre las caraccteristicas de administracion de una tienda de musica llamada SoundsFromHell esta tienda se especializa en el manejo de los datos

## Tecnologias🖥️ 

- **SQL** : Se uso para el codigo de la base de datos.
- **UML STAR** : Se uso para el diseño del diagrama ER.
- **Workbench** : Se uso para el modelado fisico del MySQL.

## Uso📝

Este repositorio contiene el código fuente del proyecto SoundsFromHell, conteniendo todo el maquetado de la base de datos de una tienda de musica con todo lo adecuado estando lista para que agreguen datos y hagan consultas segun sea necesario.

## Instrucciones📐

## Requisitos del Sistema

1. **Sistema Operativo**: Windows, macOS o Linux.
2. **Software de Base de Datos**:
   - **MySQL**: Versión 8.0 o superior (recomendado).
   - **Cliente de MySQL**: MySQL Workbench o cualquier otro cliente compatible (como DBeaver, HeidiSQL, etc.).

## Instalación y Configuración

### Paso 1: Instalación de MySQL

1. **Descargar MySQL**:
   - Ve a [MySQL Community Downloads](https://dev.mysql.com/downloads/mysql/).
   - Selecciona la versión adecuada para tu sistema operativo.

2. **Instalar MySQL**:
   - Ejecuta el instalador descargado.
   - Sigue las instrucciones en pantalla y elige la instalación "Server Only" o "Full" según tus necesidades.
   - Configura la contraseña para el usuario `root` y asegúrate de recordar esta contraseña.

3. **Iniciar el Servicio de MySQL**:
   - Asegúrate de que el servicio MySQL esté corriendo. Esto puede hacerse desde el panel de servicios de tu sistema operativo o mediante el terminal con el comando `sudo service mysql start` en Linux.

### Paso 2: Instalación de MySQL Workbench

1. **Descargar MySQL Workbench**:
   - Ve a [MySQL Workbench Downloads](https://dev.mysql.com/downloads/workbench/).
   - Selecciona la versión adecuada para tu sistema operativo.

2. **Instalar MySQL Workbench**:
   - Ejecuta el instalador y sigue las instrucciones en pantalla.

### Paso 3: Configuración de la Base de Datos

1. **Abrir MySQL Workbench**:
   - Lanza MySQL Workbench y crea una nueva conexión utilizando las credenciales del usuario `root`.

2. **Ejecutar el archivo `ddl.sql`**:
   - Abre una nueva pestaña de SQL en MySQL Workbench.
   - Copia y pega el contenido del archivo `ddl.sql` en la ventana de consulta.
   - Haz clic en el botón "Ejecutar" (ícono del rayo) o presiona `Ctrl + Shift + Enter` para ejecutar el script. Esto creará la estructura de la base de datos.

3. **Cargar los datos iniciales con el archivo `dml.sql`**:
   - Abre otra pestaña de SQL en MySQL Workbench.
   - Copia y pega el contenido del archivo `dml.sql` en la ventana de consulta.
   - Ejecuta el script de la misma manera que en el paso anterior. Esto cargará los datos iniciales en las tablas correspondientes.

### Paso 4: Ejecutar Consultas, Procedimientos Almacenados, Funciones, Eventos y Triggers

1. **Ejecutar Consultas**:
   - En MySQL Workbench, puedes escribir tus consultas SQL en una nueva pestaña de consulta y ejecutarlas de la misma manera.

2. **Procedimientos Almacenados y Funciones**:
   - Si tienes scripts para crear procedimientos almacenados o funciones, puedes ejecutarlos en una pestaña de SQL, igual que los scripts anteriores.

3. **Eventos**:
   - Los eventos se crean de manera similar a las funciones y procedimientos. Asegúrate de tener habilitada la opción `EVENTS` en tu configuración de base de datos.

4. **Triggers**:
   - Los triggers también se crean mediante scripts SQL. Asegúrate de que el script esté en el formato correcto y ejecútalo en una pestaña de SQL.

## Autor👤

[Leonardo Gonzalez](https://github.com/DLeonardoG) 