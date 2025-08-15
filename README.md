# Laborario de Diseño WEB

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