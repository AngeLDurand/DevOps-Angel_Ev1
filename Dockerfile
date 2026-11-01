# Se utiliza una imagen ligera de Python para optimizar tiempos de despliegue
FROM python:3.10-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia e instala dependencias primero para aprovechar la caché de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia el código fuente y las pruebas
COPY src/ ./src/
COPY tests/ ./tests/

# Expone el puerto donde correrá el microservicio
EXPOSE 8000

# Comando para ejecutar la aplicación de forma eficiente
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]

