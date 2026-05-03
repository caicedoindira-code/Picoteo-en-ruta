# Picoteo en Ruta

## Descripción del proyecto

Picoteo en Ruta es un proyecto basado en una empresa ficticia dedicada al alquiler de carritos de comida, bebida y dulces para eventos.

La web del proyecto está pensada para promocionar el servicio de alquiler de stands y facilitar que los usuarios conozcan la oferta disponible.  
La aplicación Java permite gestionar parte de la información interna de la empresa mediante conexión con una base de datos MySQL.

## Objetivo de la aplicación

Esta aplicación de consola permite gestionar datos reales de la empresa Picoteo en Ruta utilizando Java, JDBC y MySQL.

Actualmente permite gestionar:

- Clientes
- Stands

## Tecnologías utilizadas

- Java
- Maven
- JDBC
- MySQL
- XAMPP / phpMyAdmin
- IntelliJ IDEA
- Git / GitHub

## Base de datos

La aplicación se conecta a la base de datos:
picoteo_en_ruta

La conexión se realiza mediante la clase:
database.ConexionBD

## Funcionalidades principales

### Gestión de clientes

La aplicación permite realizar un CRUD completo sobre clientes:

- Añadir cliente
- Listar clientes
- Buscar cliente por ID
- Modificar cliente
- Eliminar cliente 

### Gestión de stands

La aplicación permite realizar un CRUD completo sobre stands:

- Añadir stand
- Listar stands
- Buscar stand por ID
- Modificar stand
- Eliminar stand

### Interfaz básica

La aplicación utiliza un menú por consola que permite al usuario interactuar con el sistema.

Menú principal:

===== PICOTEO EN RUTA =====
1. Gestionar clientes
2. Gestionar stands
0. Salir

Esto permite realizar acciones reales sobre la base de datos de forma sencilla.

## Estructura del proyecto

```text
src/main/java
├── app
│   └── Main.java
├── database
│   └── ConexionBD.java
├── model
│   ├── Cliente.java
│   └── Stand.java
├── dao
│   ├── ClienteDAO.java
│   └── StandDAO.java
└── service
    ├── ClienteService.java
    └── StandService.java
```
## Explicación de la arquitectura

El proyecto está dividido en paquetes para separar responsabilidades:

- app: contiene la clase principal y el menú de consola.
- model: contiene las clases que representan las entidades del negocio.
- dao: contiene las clases encargadas de acceder a la base de datos mediante SQL.
- service: contiene la lógica de negocio y las validaciones.
- database: contiene la conexión JDBC con MySQL.

## Conexión JDBC

La conexión con la base de datos se realiza mediante JDBC.

La clase ConexionBD contiene los datos necesarios para conectarse a MySQL:

```
private static final String URL = "jdbc:mysql://localhost:3306/picoteo_en_ruta";
private static final String USUARIO = "root";
private static final String PASSWORD = "";
```

## MPO - Ampliación de Programación

Para la parte de MPO se ha realizado una mejora estructural del proyecto.

Se ha añadido una capa service para separar la lógica de negocio del acceso directo a la base de datos.

Antes, la clase Main llamaba directamente a las clases DAO.
Después de la mejora, la estructura es:

```
Main → Service → DAO → Base de datos
```

Esto mejora la organización del código y permite que cada clase tenga una responsabilidad clara.

### Mejoras realizadas para MPO

Se han creado las siguientes clases:

- ClienteService
- StandService

Estas clases permiten validar los datos antes de enviarlos a la base de datos.

### Validaciones de clientes

- El nombre no puede estar vacío.
- El apellido no puede estar vacío.
- El teléfono no puede estar vacío.
- El email debe tener un formato básico válido.

### Validaciones de stands

- El nombre del stand debe ser uno de los permitidos por la base de datos.
- La categoría debe ser dulce, salado o bebidas.
- El precio base no puede ser negativo.
- El estado debe ser disponible, ocupado, mantenimiento o inactivo.

### Ejecución del proyecto

- Iniciar XAMPP.
- Activar Apache y MySQL.
- Importar la base de datos picoteo_en_ruta en phpMyAdmin.
- Abrir el proyecto en IntelliJ IDEA.
- Comprobar que Maven ha descargado la dependencia de MySQL.
- Ejecutar la clase: app.Main

### Dependencia Maven utilizada

En el archivo pom.xml se ha añadido el conector de MySQL:
```
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.4.0</version>
</dependency>
```
## Conclusión

Esta aplicación demuestra el uso de Java, JDBC, Maven y MySQL para gestionar datos reales de una empresa ficticia.

Además, la incorporación de la capa service mejora la organización del código y permite justificar la parte de Ampliación de Programación mediante una mejora estructural basada en Programación Orientada a Objetos.
