# Sistema de Gestión 🚀

Bienvenido al sistema de **Gestión**. Sigue esta guía paso a paso para configurar el entorno y poner en marcha la aplicación.

---

## ⚙️ Instalación y Configuración

Sigue estos pasos para la instalación inicial:

### 1. Clonar el Proyecto
Descarga los archivos del repositorio oficial:
```bash
git clone [https://github.com/caniones/Gestion.git](https://github.com/caniones/Gestion.git)
2. Motor de Base de Datos (Firebird)

El sistema utiliza Firebird como motor de base de datos.

    Dirígete a la carpeta /data dentro del proyecto.

    Ejecuta el instalador del motor Firebird que se encuentra allí.

3. Administrador de DB

Para gestionar la base de datos, instala FlameRobin:

    Descargar FlameRobin aquí

4. Registro de la Base de Datos

Registra la base de datos vacía (incluida en el proyecto) con las siguientes credenciales:

    Usuario: SYSDBA

    Contraseña: masterkey

5. Configuración del Archivo .INI

Debes vincular el sistema con la base de datos:

    Localiza el archivo .INI en la carpeta del proyecto.

    Modifica la ruta de la base de datos para que coincida con tu ubicación local.

    💡 Tip: Si no encuentras el archivo, asegúrate de tener habilitada la opción "Mostrar extensiones de nombre de archivo" en el Explorador de Windows.

👤 Configuración de Usuarios

El sistema requiere roles específicos para funcionar correctamente:
Usuario de Ventas (Por defecto)

    Usuario: VENDEDOR

    Contraseña: vendedor

    Rol: VENDEDORES

Gestión de Artículos

Para que un usuario pueda modificar artículos, debes crearlo y asignarle el rol correspondiente:

    Crear usuario (Ejemplo: ISIDORO / Pass: isidoro).

    Asignar el Rol: USUARIOS.

    ¡Listo! El usuario ya tiene permisos para gestionar el catálogo.

✅ Finalización

Una vez completados estos pasos, el sistema estará totalmente operativo.
