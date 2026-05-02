--CONSULTAS PARA LA BASE DE DATO UTILES:
-- El modelo funciona asi 
Cliente (ID_Cliente) → Evento (ID_Cliente) → Contrato (ID_Evento)

--1
SELECT c.ID_Contrato, c.fecha, c.precioTotal,
       cl.nombreCliente, cl.apellidoCliente
FROM Contrato c
JOIN Evento e ON c.ID_Evento = e.ID_Evento
JOIN Cliente cl ON e.ID_Cliente = cl.ID_Cliente;

--2.Ver los pagos realizados por cada contrato
SELECT p.ID_Pago, p.fechaPago, p.metodoPago, p.montoPago,
     c.ID_Contrato
FROM Pago p
JOIN Contrato c ON p.ID_Contrato = c.ID_Contrato;

--3. Consultar los stands más alquilados
SELECT s.nombreStand, COUNT(dc.ID_Stand) AS veces_alquilado
FROM detalle_contrato dc
JOIN Stand s ON dc.ID_Stand = s.ID_Stand
GROUP BY s.ID_Stand
ORDER BY veces_alquilado DESC;

--4. Ver qué empleado atiende cada stand
SELECT s.ID_Stand, s.nombreStand, e.nombreEmpleado, e.apellidoEmpleado
FROM Stand s
JOIN Empleado e ON s.ID_Empleado = e.ID_Empleado;

--5. Mostrar los contratos asociados a un evento específico
SELECT c.ID_Contrato, c.fecha, c.precioTotal
FROM Contrato c
WHERE c.ID_Evento = 1;   -- Cambia el ID según el evento

--6. Obtener cuánto ha gastado cada cliente
SELECT cl.nombreCliente, cl.apellidoCliente,
       SUM(c.precioTotal) AS total_gastado
FROM Cliente cl
JOIN Evento e ON cl.ID_Cliente = e.ID_Cliente
JOIN Contrato c ON e.ID_Evento = c.ID_Evento
GROUP BY cl.ID_Cliente
ORDER BY total_gastado DESC;

--7. Ver si los eventos están vinculados a clientes
SELECT ID_Evento, tipoEvento, fechaEvento, ID_Cliente
FROM Evento;

--8.Total de ingresos por tipo de evento
SELECT e.tipoEvento,
       SUM(c.precioTotal) AS ingresos
FROM Evento e
JOIN Contrato c ON e.ID_Evento = c.ID_Evento
GROUP BY e.tipoEvento
ORDER BY ingresos DESC;

--9. Total de ingresos por mes
SELECT DATE_FORMAT(c.fecha, '%Y-%m') AS mes,
       SUM(c.precioTotal) AS ingresos
FROM Contrato c
GROUP BY mes
ORDER BY mes;

--10. Stands disponibles
SELECT ID_Stand, nombreStand, categoria, precioBase
FROM Stand
WHERE estado = 'disponible';


