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
├── src/
│   └── test/
│       └── java/                                             # Lógica y escenarios de prueba
│           ├── features/
│           │   └── auth/
│           │       └── login.feature                         # Tus escenarios de login
│           │       └── registro.feature                      # Tus escenarios de registro
│           │       └── helpers
│           │               └── build-payload-user.feature    # Payload para users                             
│           ├── runners/
│           │   └── KarateRunnerTest.java                     # Clase para ejecutar los tests
│           ├── utils/
│           │   └── utils.js                                  # Funciones JavaScript auxiliares
│           ├── karate-auth.json                              # Credenciales 
│           └── karate-config.js                              # Configuración global (URLs, variables)
│       └── resources/               
│           └── data/                                         # Archivos JSON/CSV con datos de prueba
│                └── user-data                                # Data Driven Testing
├── pom.xml                                                   # Configuración de dependencias Maven
├── README.md                                                 # Documentación del proyecto
└── testCases_Aprendiz.md                                     # Documentación de los casos
```

## 🚀 Configuración y Ejecución

### 1.Requisitos Previos
- Java JDK 11 o superior.
- Maven instalado y configurado en el PATH.
- Plugin Karate Runner (recomendado para VSCode/IntelliJ).


### 2. Ejecutar pruebas con Maven
   
Ejecución completa: 
```
mvn test
```


### 3. Revisar reportes

Al finalizar, Karate genera reportes en:
    
target/karate-reports/karate-summary.html