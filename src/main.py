from fastapi import FastAPI

app = FastAPI(title="Microservicio API DevOps")

@app.get("/")
def read_root():
    return {"mensaje": "¡Hola, pipeline CI/CD!"}

@app.get("/health")
def health_check():
    # Ruta básica para monitorear que el servicio está vivo
    return {"status": "ok"}