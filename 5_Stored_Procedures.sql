/* CREACION DE STORED PROCEDURES */ 

/* SP 1*/
/* Ejecuta una consulta para determinar los destinos más frecuentados por los clientes en función de la cantidad de veces que cada ciudad de 
aeropuerto se ha utilizado como destino final en los vuelos y reservas. */
DELIMITER //
CREATE PROCEDURE destinos_frecuentados()
BEGIN
SELECT aer.ciudad, COUNT(destino_final) AS destino  FROM aeropuerto aer 
INNER JOIN vuelo v ON aer.ID_aeropuerto = v.destino_final
INNER JOIN reserva r ON v.ID_vuelo = r.ID_vuelo 
GROUP BY ciudad
ORDER BY destino DESC;
END //


/* SP 2 */
/* Realiza operaciones para actualizar la cantidad de asientos de una aeronave existente en la tabla flota, o para agregar una nueva aeronave a 
la tabla si no existe. Dependiendo de las condiciones y valores proporcionados, se ejecutan las operaciones adecuadas y se devuelven mensajes de 
error en caso de que los campos no cumplan con las condiciones establecidas. */
DELIMITER //
CREATE PROCEDURE update_add_flota (IN p_id_aeronave INT, IN p_tipo_aeronave VARCHAR(30), IN p_cantidad_asiento INT)
BEGIN
	DECLARE exists_aeronave BOOLEAN;
	SELECT EXISTS (SELECT ID_aeronave FROM flota WHERE ID_aeronave = p_id_aeronave) INTO exists_aeronave;
	IF p_tipo_aeronave = '' THEN
		SELECT 'El campo tipo de aeronave no puede estar vacio' AS ErrorMsg;
	ELSEIF exists_aeronave THEN
		UPDATE flota SET cantidad_asiento = p_cantidad_asiento WHERE ID_aeronave = p_id_aeronave;
	ELSEIF p_tipo_aeronave = '' THEN
		SELECT 'El campo tipo de aeronave no puede estar vacio';
	ELSE 
		INSERT INTO flota (ID_aeronave, tipo_aeronave, cantidad_asiento) VALUES 
        (p_id_aeronave, p_tipo_aeronave, p_cantidad_asiento);
	END IF;
END //


/* SP 3 */
/* Realiza operaciones para actualizar la información de un cliente existente en la tabla cliente, o para agregar un nuevo cliente a la tabla si 
no existe. Dependiendo de las condiciones y valores proporcionados, se ejecutan las operaciones adecuadas y se devuelven mensajes de error en caso 
de que los campos no cumplan con las condiciones establecidas. */ 
DELIMITER //
CREATE PROCEDURE update_add_cliente (IN p_id_cliente INT, IN p_nombre VARCHAR(60), IN p_apellido_paterno VARCHAR(60), 
IN p_apellido_materno VARCHAR(60), IN p_cedula VARCHAR(20), IN p_pasaporte VARCHAR(20), IN p_telefono VARCHAR(30), IN p_correo VARCHAR(60))
BEGIN
	DECLARE exists_cliente BOOLEAN;
	SELECT EXISTS (SELECT ID_cliente FROM cliente WHERE ID_cliente = p_id_cliente) INTO exists_cliente;
	IF p_cedula = '' THEN
		SELECT 'El campo cedula no puede estar vacio' AS ErrorMsg;
	ELSEIF exists_cliente THEN
		UPDATE cliente SET nombre = p_nombre, apellido_paterno = p_apellido_paterno, apellido_materno = p_apellido_materno, 
        cedula = p_cedula, pasaporte = p_pasaporte, telefono = p_telefono, correo = p_correo WHERE ID_cliente = p_id_cliente;
	ELSEIF p_cedula = '' THEN
		SELECT 'El campo cedula no puede estar vacio';
	ELSE 
		INSERT INTO cliente (ID_cliente, nombre, apellido_paterno, apellido_materno, cedula, pasaporte, telefono, correo) VALUES
        (p_id_cliente, p_nombre, p_apellido_paterno, p_apellido_materno, p_cedula, p_pasaporte, p_telefono, p_correo);
	END IF;
END //


/* SP 4 */
/* Realiza operaciones para actualizar la información de un empleado existente en la tabla empleado, o para agregar un nuevo empleado a la tabla si 
no existe. Dependiendo de las condiciones y valores proporcionados, se ejecutan las operaciones adecuadas y se devuelven mensajes de error en caso 
de que los campos no cumplan con las condiciones establecidas.*/
DELIMITER //
CREATE PROCEDURE update_add_empleado (IN p_id_empleado INT, IN p_nombre VARCHAR(60), IN p_apellido_paterno VARCHAR(60), 
IN p_apellido_materno VARCHAR(60), IN p_cargo VARCHAR(60), IN p_fecha_contratacion DATE, IN p_salario FLOAT)
BEGIN
	DECLARE exists_empleado BOOLEAN;
	SELECT EXISTS (SELECT ID_empleado FROM empleado WHERE ID_empleado = p_id_empleado) INTO exists_empleado;
	IF p_cargo = '' THEN
		SELECT 'El campo cargo no puede estar vacio' AS ErrorMsg;
	ELSEIF exists_empleado THEN
		UPDATE empleado SET nombre = p_nombre, apellido_paterno = p_apellido_paterno, apellido_materno = p_apellido_materno, 
        cargo = p_cargo, fecha_contratacion = p_fecha_contratacion, salario = p_salario WHERE ID_empleado = p_id_empleado;
	ELSEIF p_cargo = '' THEN
		SELECT 'El campo cargo no puede estar vacio';
	ELSE 
		INSERT INTO empleado (ID_empleado, nombre, apellido_paterno, apellido_materno, cargo, fecha_contratacion, salario) VALUES
        (p_id_empleado, p_nombre, p_apellido_paterno, p_apellido_materno, p_cargo, p_fecha_contratacion, p_salario);
	END IF;
END //


/* SP 5 */
/* Realiza operaciones para actualizar la información de un aeropuerto existente en la tabla aeropuerto, o para agregar un nuevo aeropuerto a la 
tabla si no existe. Dependiendo de las condiciones y valores proporcionados, se ejecutan las operaciones adecuadas y se devuelven mensajes de 
error en caso de que los campos no cumplan con las condiciones establecidas.*/
DELIMITER //
CREATE PROCEDURE update_add_aeropuerto (IN p_id_aeropuerto INT, IN p_codigo_IATA VARCHAR(3), IN p_ciudad VARCHAR(30), 
IN p_pais VARCHAR(30), IN p_coordenada POINT)
BEGIN
	DECLARE exists_aeropuerto BOOLEAN;
	SELECT EXISTS (SELECT ID_aeropuerto FROM aeropuerto WHERE ID_aeropuerto = p_id_aeropuerto) INTO exists_aeropuerto;
	IF p_codigo_IATA = '' THEN
		SELECT 'El campo codigo IATA no puede estar vacio' AS ErrorMsg;
	ELSEIF exists_aeropuerto THEN
		UPDATE aeropuerto SET codigo_IATA = p_codigo_IATA, ciudad = p_ciudad, pais = p_pais, coordenada = p_coordenada
        WHERE ID_aeropuerto = p_id_aeropuerto;
	ELSEIF p_codigo_IATA = '' THEN
		SELECT 'El campo codigo IATA no puede estar vacio';
	ELSE 
		INSERT INTO aeropuerto (ID_aeropuerto, codigo_IATA, ciudad, pais, coordenada) VALUES
        (p_id_aeropuerto, p_codigo_IATA, p_ciudad, p_pais, p_coordenada);
	END IF;
END //