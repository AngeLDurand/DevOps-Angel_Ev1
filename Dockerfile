# Imagen base con versión fija de Python
FROM python:3.15.2-slim

# Crear usuario sin privilegios administrativos
RUN useradd --create-home --system appuser

# Directorio de trabajo
WORKDIR /app

# Copiar dependencias bloqueadas
COPY requirements.lock .

# Instalar dependencias verificando versiones y hashes
RUN python -m pip install \
    --no-cache-dir \
    --only-binary=:all: \
    --require-hashes \
    -r requirements.lock

# Copiar únicamente el código de la aplicación
COPY --chown=appuser:appuser src/ ./src/

# Ejecutar la aplicación con un usuario no privilegiado
USER appuser

# Puerto de la API
EXPOSE 8000

# Iniciar servidor FastAPI
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]