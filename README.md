# 🥋 QAXpert — Aprendiz API Automation

Este proyecto usa **Karate Framework** para automatizar pruebas para la API de Aprendiz. Además, implementa un modelo BDD para validar flujos de autenticación y gestión de datos.


## 🛠️ Stack Tecnológico

- Engine: Karate DSL (Basado en Cucumber/Gherkin)
- Runtime: Java 11+
- Build Tool: Maven
- Reports: Karate HTML Reports*


## 📂 Estructura del Proyecto

```
qax-real-exp-apis-kt/
├── src/                                     # Carpeta raíz del código y tests
├── karate-config.js                         # Configuración global del framework Karate
├── LICENSE                                  # Licencia del repositorio
├── pom.xml                                  # Archivo de configuración de Maven
├── README.md                                # Documentación general del proyecto
└── testCases Aprendiz.md                    # Detalle de los casos de prueba definidos
└── Auth Aprendiz.postman_collection         # Colección de Postman para pruebas manuales
```

## 🚀 Configuración y Ejecución

### 1.Requisitos Previos
- Java JDK 11 o superior.
- Maven instalado y configurado en el PATH.
- Plugin Karate Runner (recomendado para VSCode/IntelliJ).


### 2. Ejecutar pruebas con Maven
   
Ejecución completa: 
```
mvn test -Dtest=LoginRunner
```


### 3. Revisar reportes

Al finalizar, Karate genera reportes en:
    
target/karate-reports/karate-summary.html