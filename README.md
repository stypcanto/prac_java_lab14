# Lab14 - Implementación Web con Servlets y JSP

Este proyecto es una aplicación web en **Java** que implementa un CRUD básico de usuarios utilizando **Servlets, JSP, JDBC y MySQL**.

La aplicación permite registrar, listar y gestionar usuarios en una base de datos.

---

## 🚀 Tecnologías utilizadas

- **Java 17+**
- **Jakarta Servlet API**
- **JSP (Java Server Pages)**
- **JDBC**
- **MySQL 8**
- **Maven**
- **HTML5, CSS3**

---

## 📂 Estructura del proyecto

```src
├── main
│ ├── java
│ │ └── styp
│ │ └── com
│ │ └── lab13implementacionweb
│ │ ├── controller
│ │ │ └── UsuarioServlet.java # Controlador principal
│ │ ├── dao
│ │ │ ├── ConnectionDB.java # Conexión a la BD
│ │ │ ├── IUsuarioDAO.java # Interfaz DAO
│ │ │ └── UsuarioDAOImpl.java # Implementación DAO
│ │ └── dto
│ │ └── UsuarioDTO.java # Objeto de transferencia
│ ├── resources
│ │ └── script.sql # Script de creación de BD y tabla usuario
│ └── webapp
│ ├── WEB-INF
│ │ └── web.xml # Configuración del proyecto
│ ├── css
│ │ ├── reset.css
│ │ └── structure.css
│ ├── index.jsp # Página de inicio
│ └── mensaje.jsp # Vista de mensajes
└── test
├── java
└── resources

```


---

## 🗄️ Base de Datos

El script de creación de la base de datos se encuentra en `src/main/resources/script.sql`.

Ejemplo de tabla `usuario`:

```sql
CREATE TABLE `usuario` (
                         `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
                         `usuario` VARCHAR(50) NOT NULL UNIQUE,
                         `clave` VARBINARY(255)(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Datos iniciales
INSERT INTO usuario (usuario, clave)
VALUES
  ('styp',  AES_ENCRYPT('1234','cibertec')),
  ('admin', AES_ENCRYPT('admin123','cibertec')),
  ('juan',  AES_ENCRYPT('clave123','cibertec'));



SELECT usuario, CAST(AES_DECRYPT(clave,'cibertec') AS CHAR) AS clave
FROM usuario;
```

---

## 📸 Imágenes del Login

### 🔹 Página Inicial
Vista principal del sistema, donde se presenta el formulario de inicio de sesión.

![Página Inicial](Documents/1.png)

---

### 🔹 Página Logueada
Vista después de un inicio de sesión exitoso, mostrando la pantalla protegida para usuarios autenticados.

![Página Logueada](Documents/2.png)

---

### 🔹 Página sin Login
Vista cuando un usuario intenta acceder a una página restringida sin haberse autenticado.

![Página sin Login](Documents/3.png)

---



---
## Cómo ejecutarlo
## 1️⃣ `docker-compose down --volumes --remove-orphans`

- **`docker-compose down`** → Detiene y elimina los contenedores definidos en tu `docker-compose.yml`.
- **`--volumes`** → Elimina los volúmenes asociados (por ejemplo, datos de MySQL). Esto reinicia la base de datos desde cero.
- **`--remove-orphans`** → Borra contenedores que están corriendo pero **no** están en el `docker-compose.yml` actual (restos de pruebas viejas).

💡 **Uso principal:** Dejar el entorno limpio y evitar conflictos con versiones anteriores.

---

## 2️⃣ `docker-compose build --no-cache`

- **`docker-compose build`** → Reconstruye las imágenes de los servicios.
- **`--no-cache`** → Ignora la caché y fuerza la reconstrucción desde cero (descarga de dependencias, copia de archivos, etc.).

💡 **Uso principal:** Útil cuando hiciste cambios en el código y no quieres que Docker use versiones antiguas.

---

## 3️⃣ `docker-compose up`

- Levanta los contenedores definidos en `docker-compose.yml`.
- Si quieres ver logs en vivo, simplemente ejecútalo así:
  ```bash
  docker-compose up

## Conexión de base datos
jdbc:mysql://localhost:3306/asistencia?allowPublicKeyRetrieval=true&useSSL=false