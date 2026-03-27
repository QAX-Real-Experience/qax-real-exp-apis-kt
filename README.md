# QAX Real Experience · APIs Karate Lab

Repositorio de automatización para pruebas de **APIs** usando **Karate DSL** y **Maven**, dentro del programa **QAX Real Experience** de **QAXpert**.

Este espacio está destinado a que los aprendices apliquen en un contexto real las prácticas, técnicas y criterios de calidad trabajados previamente en sus **mentorías 1:1**, desarrollando automatizaciones sobre features asignadas durante el sprint.

## Objetivo
Implementar pruebas automatizadas de APIs siguiendo el flujo de trabajo definido por QAX Real Experience, incluyendo buenas prácticas de automatización, versionamiento, revisión en pares y entregas mediante Pull Request.

## Alcance
En este repositorio se desarrollan automatizaciones orientadas al nivel **APIs**, usando Karate DSL con Maven como stack principal.

## Estructura base del proyecto

```bash
├── features/                # Escenarios de prueba organizados por módulos
│   ├── auth/
│   │   ├── login.feature
│   │   └── logout.feature
│   ├── users/
│   │   ├── createUser.feature
│   │   └── getUser.feature
│   └── payments/
│       └── createPayment.feature
│
├── common/                  # Features reutilizables (setup, login, etc.)
│   └── login.feature
│
├── data/                    # Archivos de datos externos
│   ├── validUsers.json
│   ├── invalidUsers.csv
│   └── config.yml
│
├── utils/                   # Funciones Java reutilizables
│   ├── authUtils.java
│   └── dateUtils.java
│
├── config/                  # Configuración de entornos
│   ├── dev.json
│   ├── qa.json
│   └── prod.json
│
├── reports/                 # Reportes de ejecución (HTML, JSON, etc.)
│
├── karate-config.js         # Configuración global (entornos, URLs, variables)
├── pom.xml                  # Configuración Maven
└── README.md                # Documentación del proyecto
```
## Instalación
Pendiente de documentar.

---

## Ejecución
Pendiente de documentar.

---

## Reportes
Pendiente de documentar.

---

## Referencias
- [QAX Real Experience Wiki](https://github.com/QAX-Real-Experience/.github/wiki)
- [QAXpert](https://qaxpert.com)

