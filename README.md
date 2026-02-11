

```html
# 🚀 Sistema de Gestión "Gestión"

Bienvenido al repositorio oficial de **Gestión**. Sigue estos pasos detallados para configurar el entorno y poner en marcha el sistema.

---

## 🛠️ Requisitos e Instalación

### 1. Obtener el Proyecto
Descarga el código fuente directamente desde GitHub:
```bash
git clone [https://github.com/caniones/Gestion.git](https://github.com/caniones/Gestion.git)

```

### 2. Motor de Base de Datos (Firebird)

El sistema utiliza **Firebird**. Para instalarlo:

* Dirígete a la carpeta `/data` dentro del proyecto descargado.
* Ejecuta el instalador del motor que encontrarás allí.

### 3. Administrador de DB (FlameRobin)

Para gestionar y registrar la base de datos, descarga e instala **FlameRobin**:

* 👉 [Descargar FlameRobin Releases](https://github.com/mariuz/flamerobin/releases)

---

## 🗄️ Configuración de la Base de Datos

### Registro Inicial

1. Abre FlameRobin y registra la **base de datos vacía** que viene en el proyecto.
2. **Credenciales de Admin:**
* **Usuario:** `SYSDBA`
* **Contraseña:** `masterkey`



### Configuración de Usuarios y Roles

El sistema requiere una estructura de permisos específica para funcionar:

| Usuario | Contraseña | Rol Asignado | Propósito |
| --- | --- | --- | --- |
| `VENDEDOR` | `vendedor` | `VENDEDORES` | Acceso por defecto |
| `ISIDORO` | `isidoro` | `USUARIOS` | Gestión de Artículos |

> [!TIP]
> Puedes crear tantos usuarios como necesites (como el ejemplo de ISIDORO), siempre asegurándote de asignarles el rol **USUARIOS** para que puedan modificar artículos.

---

## ⚙️ Configuración del Sistema

### Archivo de Configuración (.INI)

Debes indicarle al programa dónde encontrar la base de datos:

1. Localiza el archivo con extensión `.INI` en la carpeta raíz.
2. Modifica la **ruta de la base de datos** para que coincida con tu ubicación local.

> [!IMPORTANT]
> **Nota para Windows:** Si no encuentras el archivo, asegúrate de tener activada la opción **"Mostrar extensiones de nombre de archivo"** en el Explorador de Archivos.

---

## ✅ ¡Listo!

El sistema ya está operativo. Ahora puedes iniciar sesión con los usuarios creados y comenzar la gestión.

---

