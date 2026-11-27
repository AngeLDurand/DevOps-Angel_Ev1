# Imagen base con versión fija de Python
FROM python:3.15.2-slim

# Aplicar actualización de seguridad para libzstd1
# Corrige CVE-2026-124851 en Debian 13
RUN apt-get update \
    && apt-get install -y --no-install-recommends --only-upgrade libzstd1 \
    && rm -rf /var/lib/apt/lists/*

# Crear usuario sin privilegios administrativos
RUN useradd --create-home --system appuser

# Directorio de trabajo
WORKDIR /app

# Copiar dependencias bloqueadas
COPY requirements.lock .

# Instalar dependencias verificadas y retirar pip del entorno de ejecución
RUN python -m pip install \
    --no-cache-dir \
    --only-binary=:all: \
    --require-hashes \
    -r requirements.lock \
    && python -m pip uninstall --yes pip

# Copiar únicamente el código de la aplicación
COPY --chown=appuser:appuser src/ ./src/

# Ejecutar la aplicación con un usuario no privilegiado
USER appuser

# Puerto de la API
EXPOSE 8000

# Iniciar servidor FastAPI
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]