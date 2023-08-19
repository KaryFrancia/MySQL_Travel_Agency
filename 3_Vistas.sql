/* CREACION DE VISTAS */

/* Vista 1 */
/* Esta vista proporciona una descripción general de todas las reservas realizadas por los clientes. */
CREATE OR REPLACE VIEW vista_reserva 
AS SELECT c.nombre AS nombre, CONCAT(c.apellido_paterno, ' ', c.apellido_materno) AS apellidos, c.correo, aerolinea.nombre_aerolinea 
AS aerolinea, ae1.codigo_IATA AS origen, ae2.codigo_IATA AS 'destino final', esc.descripcion_escala AS escalas, fecha_hora_salida_real AS 
'fecha y hora salida', fecha_hora_llegada_real AS 'fecha y hora llegada' , s.descripcion_servicio AS equipaje, a.tipo_asiento AS asiento, 
r.fecha_reserva AS 'fecha reserva', (a.precio_asiento + e.precio_equipaje + v.precio_vuelo) AS precio_final, p.metodo_pago AS pago 
FROM reserva r
INNER JOIN cliente c ON r.ID_cliente = c.ID_cliente
INNER JOIN vuelo v ON r.ID_vuelo = v.ID_vuelo
INNER JOIN aeropuerto ae1 ON ae1.ID_aeropuerto = v.origen
INNER JOIN aeropuerto ae2 ON ae2.ID_aeropuerto = v.destino_final
INNER JOIN escala esc ON esc.ID_escala = v.ID_escala
INNER JOIN aerolinea ON aerolinea.ID_aerolinea = v.ID_aerolinea
INNER JOIN servicio s ON r.ID_servicio = s.ID_servicio 
INNER JOIN asiento a ON s.ID_asiento = a.ID_asiento
INNER JOIN equipaje e ON s.ID_equipaje = e.ID_equipaje
INNER JOIN pago p ON r.ID_pago = p.ID_pago
ORDER BY r.fecha_reserva DESC;
 

/* Vista 2 */
/* Esta vista proporciona una manera conveniente de acceder a la información sobre vuelos programados, mostrando detalles como la aerolínea, tipo 
de aeronave, aeropuertos de origen y destino, descripción de escalas y fechas y horas de salida y llegada programadas. */
CREATE OR REPLACE VIEW vista_vuelos_programados
AS SELECT aer.nombre_aerolinea AS aerolinea, f.tipo_aeronave AS aeronave, ae1.codigo_IATA AS origen, ae2.codigo_IATA AS 'destino final', 
esc.descripcion_escala AS escalas, v.fecha_hora_salida_programada AS 'Salida programada', v.fecha_hora_llegada_programada 
AS 'Llegada Programada' FROM vuelo v
INNER JOIN aerolinea aer ON v.ID_aerolinea = aer.ID_aerolinea
INNER JOIN flota f ON aer.ID_aeronave = f.ID_aeronave
INNER JOIN aeropuerto ae1 ON ae1.ID_aeropuerto = v.origen
INNER JOIN aeropuerto ae2 ON ae2.ID_aeropuerto = v.destino_final
INNER JOIN escala esc ON esc.ID_escala = v.ID_escala;


/* Vista 3 */
/* Esta vista proporciona una manera conveniente de acceder a los ingresos generados por ruta en función de los precios de los asientos, equipajes 
y vuelos en las reservas realizadas. Cada fila de la vista representará una ruta única y los ingresos totales asociados con esa ruta. */
CREATE OR REPLACE VIEW vista_ingresos_por_ruta
AS SELECT CONCAT(ae1.codigo_IATA, '-', ae2.codigo_IATA) AS ruta, SUM(a.precio_asiento + e.precio_equipaje + v.precio_vuelo) AS ingresos 
FROM vuelo v
INNER JOIN aeropuerto ae1 ON ae1.ID_aeropuerto = v.origen
INNER JOIN aeropuerto ae2 ON ae2.ID_aeropuerto = v.destino_final
INNER JOIN reserva r ON r.ID_vuelo = v.ID_vuelo
INNER JOIN servicio s ON r.ID_servicio = s.ID_servicio 
INNER JOIN asiento a ON s.ID_asiento = a.ID_asiento
INNER JOIN equipaje e ON s.ID_equipaje = e.ID_equipaje
GROUP BY ruta;


/* Vista 4 */
/* Esta vista proporciona una manera conveniente de acceder a información sobre la flota de aeronaves de diferentes aerolíneas. Cada fila de la 
vista representará una combinación de aerolínea, tipo de aeronave y cantidad de asientos asociados con esa aeronave en la flota de la aerolínea 
correspondiente. */
CREATE OR REPLACE VIEW vista_flota_aerolinea
AS SELECT aer.nombre_aerolinea AS aerolinea, f.tipo_aeronave as aeronave, f.cantidad_asiento as 'cantidad de asientos' 
FROM aerolinea aer
INNER JOIN flota f ON aer.ID_aeronave = f.ID_aeronave;


/* Vista 5 */
/* Esta vista proporciona una manera conveniente de acceder a los ingresos totales generados por aerolínea en función de los precios de los 
asientos, equipajes y vuelos en las reservas realizadas. Cada fila de la vista representará una aerolínea única y los ingresos totales asociados 
con esa aerolínea. */ 
CREATE OR REPLACE VIEW vista_ingresos_por_aerolinea
AS SELECT aer.nombre_aerolinea AS aerolinea, SUM(a.precio_asiento + e.precio_equipaje + v.precio_vuelo) AS ingresos
FROM vuelo v
INNER JOIN reserva r ON r.ID_vuelo = v.ID_vuelo
INNER JOIN servicio s ON r.ID_servicio = s.ID_servicio 
INNER JOIN asiento a ON s.ID_asiento = a.ID_asiento
INNER JOIN equipaje e ON s.ID_equipaje = e.ID_equipaje
INNER JOIN aerolinea aer ON aer.ID_aerolinea = v.ID_aerolinea
GROUP BY aerolinea;

/* Vista 6 */
/* Esta vista proporciona una manera conveniente de acceder a información detallada sobre las reservas que tienen un precio total mayor a $500, 
incluyendo detalles. */
CREATE OR REPLACE VIEW vista_reserva_mayor_500dolares
AS SELECT c.nombre AS nombre, CONCAT(c.apellido_paterno, ' ', c.apellido_materno) AS apellidos, c.correo, aerolinea.nombre_aerolinea 
AS aerolinea, ae1.codigo_IATA AS origen, ae2.codigo_IATA AS 'destino final', esc.descripcion_escala AS escalas, s.descripcion_servicio 
AS equipaje, a.tipo_asiento AS asiento, r.fecha_reserva AS fecha, (a.precio_asiento + e.precio_equipaje + v.precio_vuelo) AS precio_final, p.metodo_pago AS pago 
FROM reserva r
INNER JOIN cliente c ON r.ID_cliente = c.ID_cliente
INNER JOIN vuelo v ON r.ID_vuelo = v.ID_vuelo
INNER JOIN aeropuerto ae1 ON ae1.ID_aeropuerto = v.origen
INNER JOIN aeropuerto ae2 ON ae2.ID_aeropuerto = v.destino_final
INNER JOIN escala esc ON esc.ID_escala = v.ID_escala
INNER JOIN aerolinea ON aerolinea.ID_aerolinea = v.ID_aerolinea
INNER JOIN servicio s ON r.ID_servicio = s.ID_servicio 
INNER JOIN asiento a ON s.ID_asiento = a.ID_asiento
INNER JOIN equipaje e ON s.ID_equipaje = e.ID_equipaje
INNER JOIN pago p ON r.ID_pago = p.ID_pago
WHERE (a.precio_asiento + e.precio_equipaje + v.precio_vuelo) > 500
ORDER BY r.fecha_reserva DESC;

