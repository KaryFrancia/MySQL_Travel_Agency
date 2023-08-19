/* CREACION DE FUNCIONES */

/* Funcion 1 */
/* La funcion calcula la cantidad de vuelos con destino a una ciudad específica y devuelve este valor como resultado. Para llamar a esta función 
se pasa una ciudad como parámetro para obtener la cantidad de vuelos con destino a esa ciudad.*/
DELIMITER //
CREATE FUNCTION `cantidad_destino`(p_ciudad VARCHAR (30)) RETURNS INT
READS SQL DATA
BEGIN
	DECLARE resultado INT;
    
    SET resultado = (SELECT COUNT(destino_final) AS destino FROM vuelo v INNER JOIN reserva r 
    ON v.ID_vuelo = r.ID_vuelo INNER JOIN aeropuerto AS aer ON aer.ID_aeropuerto=v.destino_final WHERE ciudad = p_ciudad);

RETURN resultado;
END //


/* Funcion 2 */
/* la funcion calcula el ingreso total generado por un cliente específico a partir de servicios (asientos y equipaje) y vuelos. Para llamar a esta 
función se pasa el ID de un cliente como parámetro para obtener el total de ingresos correspondiente. */
DELIMITER //
CREATE FUNCTION `total_ingreso_cliente`(p_id_cliente INT) RETURNS INT
READS SQL DATA
BEGIN
	DECLARE ingreso_servicio INT;
    DECLARE ingreso_vuelo INT;
    
    SET ingreso_servicio = (SELECT SUM(a.precio_asiento + e.precio_equipaje) FROM servicio s INNER JOIN asiento a 
    ON s.ID_asiento = a.ID_asiento INNER JOIN equipaje e ON s.ID_equipaje = e.ID_equipaje INNER JOIN reserva r 
    ON s.ID_servicio = r.ID_servicio WHERE r.ID_cliente = p_id_cliente);
    
    SET ingreso_vuelo = (SELECT SUM(precio_vuelo) FROM vuelo AS v INNER JOIN reserva AS r 
    ON v.ID_vuelo = r.ID_vuelo WHERE r.ID_cliente = p_id_cliente);
    
    RETURN ingreso_servicio + ingreso_vuelo;
END //


/* Funcion 3 */
/* La función calcula el total de reservas realizadas por un cliente específico. Para llamar a esta función se pasa el ID de un cliente como 
parámetro para obtener la cantidad total de reservas correspondiente. */
DELIMITER //
CREATE FUNCTION total_reserva_cliente (p_id_cliente INT) RETURNS INT
READS SQL DATA
BEGIN
	DECLARE resultado INT;
    SET resultado = (SELECT COUNT(*) FROM reserva WHERE reserva.ID_cliente = p_id_cliente);
    RETURN resultado;
END //
