# 🥋 QAXpert — Aprendiz API Automation

Este proyecto usa **Karate Framework** para automatizar pruebas para la API de Aprendiz. Además, implementa un modelo BDD para validar flujos de autenticación y gestión de datos.


## 🛠️ Stack Tecnológico

- Engine: Karate DSL (Basado en Cucumber/Gherkin)
- Runtime: Java 11+
- Build Tool: Maven
- Reports: Karate HTML Reports*


## 📂 Estructura del Proyecto

```
src/test/java
├── features/            # Archivos .feature (Escenarios de prueba)
│   └── auth/            # Pruebas de Autenticación (Login)
├── karate-config.js     # Configuración global y variables de entorno
└── LoginRunner.java     # Runner para ejecución completa
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