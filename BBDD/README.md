# Base de Datos - Picoteo en Ruta

## Descripción

Esta carpeta contiene la documentación y los scripts SQL correspondientes a la base de datos del proyecto **Picoteo en Ruta**.

Picoteo en Ruta es una empresa ficticia dedicada al alquiler de stands de comida, bebida y dulces para eventos. La base de datos modela la información interna necesaria para gestionar clientes, empleados, stands, eventos, contratos, detalles de contrato y pagos.

## Objetivo de la base de datos

El objetivo de esta base de datos es organizar la información principal del negocio y permitir consultas útiles para la gestión de la empresa.

La base de datos permite almacenar información sobre:

- Clientes que contratan servicios.
- Eventos organizados por los clientes.
- Stands disponibles para alquilar.
- Empleados relacionados con los stands.
- Contratos asociados a eventos.
- Detalles de cada contrato.
- Pagos realizados por los contratos.

## Nombre de la base de datos

```sql
picoteo_en_ruta
```
## Entidades principales
### Cliente

Almacena los datos de los clientes que contratan servicios.

Campos principales:

- ID_Cliente
- nombreCliente
- apellidoCliente
- telefono
- email

### Empleado

Almacena la información de los empleados de la empresa.

Campos principales:

- ID_Empleado
- nombreEmpleado
- apellidoEmpleado
- telefonoEmpleado
- emailEmpleado
- dniEmpleado
- estadoEmpleado

### Stand

Almacena los stands disponibles para eventos.

Campos principales:

- ID_Stand
- nombreStand
- categoria
- precioBase
- estado
- ID_Empleado

### Evento

Almacena los eventos solicitados por los clientes.

Campos principales:

- ID_Evento
- tipoEvento
- fechaEvento
- lugarEvento
- ID_Cliente

### Contrato

Almacena los contratos asociados a eventos.

Campos principales:

- ID_Contrato
- fecha
- precioTotal
- ID_Evento

### detalle_contrato

Almacena los stands incluidos dentro de cada contrato.

Campos principales:

- ID_DetalleContrato
- precioUnitario
- cantidad
- ID_Contrato
- ID_Stand

### Pago

Almacena los pagos realizados por los contratos.

Campos principales:

- ID_Pago
- fechaPago
- metodoPago
- montoPago
- ID_Contrato

## Relaciones principales

La base de datos incluye las siguientes relaciones:

- Un cliente puede tener varios eventos.
- Cada evento pertenece a un cliente.
- Cada evento puede tener un contrato.
- Cada contrato pertenece a un evento.
- Un contrato puede tener varios detalles de contrato.
- Cada detalle de contrato relaciona un contrato con un stand.
- Un stand puede aparecer en varios detalles de contrato.
- Un contrato puede tener pagos asociados.
- Un empleado puede estar asignado a uno o varios stands.

## Archivos incluidos

Esta carpeta contiene los siguientes archivos:

- base_datos_completa.sql: exportación completa de la base de datos desde phpMyAdmin.
- creacion_tablas.sql: script SQL con la creación de tablas, claves, índices y restricciones.
- insercion_datos.sql: script SQL con los datos de ejemplo.
- consultas.sql: consultas SQL útiles para la gestión del negocio.
- BBDD - PICOTEO EN RUTA (1).pdf: documentación de la base de datos, diagrama E/R y modelo relacional.
- captura tablas php (1).pdf: evidencias visuales de la base de datos en phpMyAdmin.

## Consultas incluidas

El archivo consultas.sql contiene consultas reales relacionadas con la empresa, por ejemplo:

- Listado de clientes.
- Listado de stands disponibles.
- Consulta de eventos junto con los datos del cliente.
- Consulta de contratos con información del evento.
- Consulta de detalles de contrato y stands contratados.
- Consulta de pagos.
- Estadísticas simples del negocio.

## Relación con la web

La web de Picoteo en Ruta presenta la empresa y promociona el servicio de alquiler de stands para eventos.

La base de datos representa el funcionamiento interno de esa empresa, permitiendo gestionar clientes, eventos, stands, contratos y pagos.

De esta forma, la base de datos está relacionada conceptualmente con el portal web del proyecto.

## Cómo importar la base de datos
1.  Abrir XAMPP.
2. Activar Apache y MySQL.
3. Entrar en phpMyAdmin.
4. Crear una base de datos llamada picoteo_en_ruta.
5. Importar el archivo base_datos_completa.sql.

## Conclusión

Esta base de datos permite representar de forma organizada el funcionamiento interno de Picoteo en Ruta. Incluye entidades, relaciones, claves primarias, claves foráneas, restricciones, datos de ejemplo y consultas útiles para la gestión de la empresa.