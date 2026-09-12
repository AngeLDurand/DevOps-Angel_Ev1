# Repositorio para la evaluación del pipeline DevOps utilizando la metodología **GitFlow**.

---

## 1. Justificación de la Estrategia de Ramificación
Para este proyecto se seleccionó el modelo **GitFlow**, evaluándolo frente a otras alternativas:
* **GitFlow (Seleccionado):** Ideal para proyectos con ciclos de lanzamiento estructurados. Utiliza ramas dedicadas (`develop`, `feature/`, `hotfix/`), permitiendo un control estricto antes de llegar a producción (`main`).
* **GitHub Flow:** Un modelo más ligero y directo donde todo sale de `main` y se fusiona rápidamente mediante Pull Requests. Es útil para despliegues continuos en aplicaciones web o SaaS, pero menos estructurado para entornos académicos con múltiples versiones.
* **Trunk-Based Development:** Los desarrolladores integran el código en una sola rama central (*trunk*) de manera frecuente. Exige una cobertura de pruebas automatizadas muy alta para evitar romper producción, siendo complejo para equipos que recién se inician en DevOps.

---

## 2. Guía de Buenas Prácticas y Convenciones

### A. Nombre de Ramas
Se establece la siguiente nomenclatura estándar para mantener el orden en el control de versiones:
* `main`: Rama principal que contiene el código estable y listo para producción.
* `develop`: Rama de integración para las nuevas funcionalidades desarrolladas por el equipo.
* `feature/<nombre-descriptivo>`: Utilizada para el desarrollo de nuevas características del microservicio (ej. `feature/agregar-microservicio`).
* `hotfix/<nombre-descriptivo>`: Utilizada exclusivamente para solucionar errores críticos detectados en producción de forma urgente (ej. `hotfix/correccion-urgente`).

### B. Convención de Mensajes de Commit
Se utiliza el estándar de **Conventional Commits** para asegurar la legibilidad del historial:
* `feat:` Para agregar una nueva funcionalidad o módulo (ej. `feat: agrego archivos del microservicio de predicccion`).
* `fix:` Para correcciones de errores o bugs en producción (ej. `fix: correccion de error critico en produccion`).
* `docs:` Para cambios o mejoras en la documentación y archivos README (ej. `docs: agrego README con metodologia y convenciones`).

### C. Estructura de Carpetas del Proyecto
```text
DevOps-Angel/
├── .github/              # Configuración de automatizaciones y flujos de trabajo
├── notebooks/            # Cuadernos Jupyter con el modelo de machine learning
│   └── Plant_Village.ipynb
├── .gitignore            # Archivos ignorados por Git
└── README.md             # Documentación técnica del repositorio
```
### D. Estrategias de Revisión y Control de Versiones
Para garantizar la calidad y estabilidad del código en nuestro entorno colaborativo, se establecen las siguientes reglas de revisión:
* **Protección de ramas principales:** Se prohíbe realizar *commits* directos sobre las ramas `main` y `develop`.
* **Uso obligatorio de Pull Requests (PR):** Toda integración de nuevas funcionalidades (desde `feature/`) o correcciones (desde `hotfix/`) debe realizarse obligatoriamente a través de un PR.
* **Validación previa al Merge:** Antes de aprobar e integrar cualquier cambio, el código debe someterse a una revisión visual (para detectar conflictos o malas prácticas) y debe aprobar exitosamente las validaciones automáticas configuradas en nuestro pipeline de CI (GitHub Actions).
* 

## 3. Trazabilidad del Desarrollo
A continuación se documenta el flujo de trabajo ejecutado paso a paso en el control de versiones: 

* **1. Clonación e inicialización:**
  Cloné el repositorio desde GitHub a mi computador para establecer la base de trabajo local. Luego creé y subí la rama `develop` para separar el código en desarrollo de la versión estable de producción (`main`).

* **2. Incorporación del microservicio (Rama Feature):**
  Creé la rama `feature/agregar-microservicio` para trabajar de manera aislada. Ahí subí los archivos del modelo de predicción, asegurando que la rama principal se mantuviera limpia mientras agregaba los componentes nuevos.

* **3. Integración mediante Pull Request:**
  Abrí un Pull Request hacia la rama `develop` para revisar visualmente los cambios antes de hacer el merge y comprobar que no existieran conflictos en el código.

* **4. Corrección de emergencia (Rama Hotfix):**
  Para solucionar un inconveniente de forma urgente, creé una rama `hotfix/correccion-urgente` a partir de `main`. Tras aplicar la corrección, realicé el doble Pull Request exigido por GitFlow para actualizar tanto producción como desarrollo.


## 4. Automatización y CI/CD
Para simular un entorno cloud y establecer las bases de la automatización DevOps, se implementó GitHub Actions como herramienta de Integración Continua (CI).

Configuración del Flujo: Se definió un workflow básico dentro de la carpeta .github/workflows configurado para ejecutarse automáticamente ante dos eventos críticos de GitFlow: cada vez que se realiza un push hacia la rama develop y cuando se genera un Pull Request hacia la rama main.

Rol de la herramienta en el flujo real: En un proceso de desarrollo real, esta automatización es la primera línea de defensa. Su rol fundamental dentro del ciclo CI/CD es asegurar la calidad del código, automatizando tareas de validación, pruebas y compilación de forma aislada cada vez que un desarrollador envía cambios. Al contextualizarlo en un entorno real, esto previene que errores humanos lleguen a la rama principal, agiliza el feedback para los programadores (quienes saben inmediatamente si su código falla) y mantiene el repositorio siempre en un estado funcional, preparándolo para una eventual fase de Entrega/Despliegue Continuo (CD).
