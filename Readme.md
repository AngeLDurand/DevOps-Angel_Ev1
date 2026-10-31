# Metodología de trabajo

Para este proyecto decidí utilizar Gitflow. Elegí esa forma de trabajar porque me ayuda a mantener el código ordenado y me acostumbra a trabajar como se hace en el mundo real.

Tener una rama `main` para el código que funciona bien y una rama `develop` para ir subiendo mis avances, me asegura de no romper el proyecto. Además, crear ramas `feature` me permite enfocarme en desarrollar una sola cosa a la vez. Si algo se rompe y es urgente, sé que puedo sacar un `hotfix` sin que se mezcle con otros desarrollos que tengo a medias.

# Mis Convenciones de Trabajo

1. **Nombres de las ramas:**
   - Para agregar nuevas cosas usaré: `feature/agregar-login` (ejemplo)
   - Para arreglar errores urgentes usaré: `hotfix/caida-base-de-datos` (ejemplo)

2. **Nombres de los commits:** 
   Usaré mensajes cortos pero claros para saber qué cambios hice en cada momento.
   - `feat:` cuando agregue algo nuevo (ejemplo: `feat: agrego formulario de contrato`).
   - `fix:` cuando solucione un error (ejemplo: `fix: arreglo el boton enviar`).
   - `docs:` cuando solo modifique el README u otra documentación.
  
3. **Reglas para juntar el código (Merge):**
   - Para simular un entorno de trabajo real, evitaré hacer merge directo a las ramas `main` o `develop` desde la terminal.
   - Todo lo integraré creando Pull Requests (PR) en GitHub. Así me obligo a hacer una última revisión visual de mi propio código antes de aceptarlo y juntarlo con lo principal.

**Nota:** Corrección crítica de emergencia aplicada.

---

# Integración y Entrega Continua (CI/CD) - Evaluación 2

Para automatizar el ciclo de vida de la aplicación y garantizar su calidad, se implementó un pipeline de CI/CD utilizando **GitHub Actions** y **Contenedores**.

## 1. Contenedores y Orquestación (IE1 e IE5)
El proyecto está dockerizado para facilitar su portabilidad y despliegue en la nube:
- **Dockerfile:** Utiliza una imagen optimizada de Python (`python:3.9-slim`) para empaquetar la aplicación de forma ligera y eficiente.
- **Docker Compose:** Se implementó `docker-compose.yml` para orquestar los servicios, permitiendo escalar y levantar el entorno completo con un solo comando.

## 2. Pipeline Automatizado (IE2, IE3 e IE4)
El flujo de trabajo en GitHub Actions consta de tres etapas principales que aseguran la trazabilidad desde el desarrollo hasta producción:

- **Build and Test (Pruebas Automatizadas - IE2):** En cada push o Pull Request, el pipeline instala las dependencias y ejecuta pruebas automatizadas utilizando `pytest` para garantizar la estabilidad del código.
- **Security Scan (Seguridad - IE3):** Se integró la herramienta `bandit` para realizar un análisis de vulnerabilidades en el código Python, cumpliendo con las políticas de seguridad y gobernanza.
- **Deploy Simulation (Despliegue Trazable - IE4):** Esta etapa está configurada para ejecutarse *únicamente* cuando los cambios llegan a la rama `main`. Simula un despliegue en un entorno cloud levantando los contenedores mediante Docker Compose directamente en el runner de GitHub.