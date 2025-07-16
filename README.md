# Karate API Test Project

Este proyecto utiliza Karate para la automatización de pruebas de servicios API.

## Tabla de Contenidos

- [Descripción](#descripción)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Ejecución de Pruebas](#ejecución-de-pruebas)
- [Tags Disponibles](#tags-disponibles)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Recursos](#recursos)

## Descripción

Este repositorio contiene pruebas automatizadas de la API [ServeRest](https://serverest.dev/) utilizando el framework
Karate. El proyecto implementa la automatización completa de la API de usuarios siguiendo los criterios de aceptación
especificados.

### Historia de Usuario

Como un administrador del sistema,  
Quiero poder gestionar los usuarios a través de la API,  
Para administrar la base de datos de usuarios.

### Criterios de Aceptación Implementados

1. ✅ Se puede obtener una lista de todos los usuarios.
2. ✅ Se puede registrar un nuevo usuario con datos válidos.
3. ✅ Se puede buscar un usuario específico por su ID.
4. ✅ Se puede actualizar la información de un usuario existente.
5. ✅ Se puede eliminar un usuario del sistema.

## Requisitos

Antes de ejecutar este proyecto, asegúrate de tener instalado lo siguiente en tu máquina:

- **Java JDK 8 o superior**  
  Puedes descargarlo desde [Oracle](https://www.oracle.com/java/technologies/downloads/) o
  usar [OpenJDK](https://adoptopenjdk.net/).

- **Apache Maven 3.6 o superior**  
  Descárgalo desde [Maven Downloads](https://maven.apache.org/download.cgi).

- **Git** (opcional, para clonar el repositorio)  
  Descárgalo desde [Git Downloads](https://git-scm.com/downloads).

- **Editor de código** (opcional, recomendado: IntelliJ IDEA, VS Code, Eclipse, etc.)

### Verifica la instalación

Puedes verificar que Java y Maven están correctamente instalados ejecutando estos comandos en tu terminal:

```bash
java -version
mvn -version
```

Ambos deben mostrar la versión instalada.

## Instalación

Clona el repositorio y navega al directorio del proyecto:

```bash
git clone https://github.com/esmithas/ServeRest-karate.git
cd ServeRest-karate
```

Instala las dependencias usando Maven:

```bash
mvn clean install
```

## Ejecución de Pruebas

La forma recomendada de ejecutar los tests es especificando el ambiente y el tag que deseas correr. Por ejemplo:

```bash
mvn test -Dkarate.env=dev -Dkarate.options="--tags @getUser"
```

- Cambia `dev` por el ambiente que desees (`dev`, `test`, `prod`, etc.).
- Cambia `@getUser` por el tag que quieras ejecutar (ver lista de tags abajo).

Los reportes se generarán en la carpeta `target/karate-reports`.

## Tags Disponibles

| Tag           | Descripción                        |
|---------------|------------------------------------|
| `@smoke`      | Pruebas críticas (smoke tests)     |
| `@getUser`    | Escenarios para obtener usuario(s) |
| `@createUser` | Escenarios para crear ususarios    |
| `@searchUser` | Escenarios para buscar usuarios    |
| `@editUser`   | Escenarios para editar usuarios    |
| `@deleteUser` | Escenarios para eliminar usuarios  |

> Puedes combinar varios tags usando `,` (coma) o excluir con `~@tag`.

Ejemplo:

```bash
mvn test -Dkarate.env=dev -Dkarate.options="--tags @getUser,@smoke"
```

## Estructura del Proyecto

```
karate/
├── pom.xml
└── src/
    └── test/
        └── java/
            ├── features/
            │   ├── users/
            │   │   ├── Listar usuarios.feature
            │   │   └── Buscar usuario.feature
            │   └── ...
            ├── schemas/
            │   └── users/
            │       ├── user-schema-karate.json
            ├── helpers/
            │   └── generators.js
            └── logback-test.xml
```

## Recursos

- [Documentación oficial de Karate](https://karatelabs.github.io/karate/)
- [Guía de Karate en español](https://karatelabs.github.io/karate/#karate-in-spanish) 