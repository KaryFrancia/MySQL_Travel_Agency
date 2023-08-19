/* CREACION DE TRIGGERS */

/* Trigger 1 */
/* Se dispara después de insertar un nuevo registro en la tabla cliente. Registra la acción de inserción junto con los detalles relevantes del 
registro insertado en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la 
operación. Esto es útil para llevar un registro de las modificaciones realizadas en la base de datos. */
CREATE TRIGGER tr_insert_clientes
AFTER INSERT ON cliente
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(),'insercion', 'cliente', CONCAT('Nuevo registro insertado: ', NEW.ID_cliente, NEW.nombre, 
NEW.apellido_paterno, NEW.apellido_materno, NEW.cedula, NEW.pasaporte, NEW.telefono, NEW.correo), CURRENT_USER());


/* Trigger 2 */
/* Se dispara después de actualizar un registro en la tabla cliente. Registra la acción de actualización junto con los detalles relevantes del
registro actualizado en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la 
operación.*/
CREATE TRIGGER tr_update_clientes
AFTER UPDATE ON cliente
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(),'actualizacion', 'cliente', CONCAT('Nuevo registro actualizado: ', NEW.ID_cliente, NEW.nombre, 
NEW.apellido_paterno, NEW.apellido_materno, NEW.cedula, NEW.pasaporte, NEW.telefono, NEW.correo), CURRENT_USER());


/* Trigger 3 */
/* Se dispara antes de insertar un nuevo registro en la tabla empleado. Registra la acción de inserción junto con los detalles relevantes del 
registro en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la operación. */
CREATE TRIGGER tr_insert_empleados
BEFORE INSERT ON empleado
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(), 'insercion', 'empleado', CONCAT('Nuevo registro insertado: ', NEW.ID_empleado, NEW.nombre, 
NEW.apellido_paterno, NEW.apellido_materno, NEW.cargo, NEW.fecha_contratacion, NEW.salario), CURRENT_USER());


/* Trigger 4 */
/* Se dispara antes de actualizar un registro en la tabla empleado. Registra la acción de actualización junto con los detalles relevantes del 
registro en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la operación. */
CREATE TRIGGER tr_update_empleados
BEFORE UPDATE ON empleado
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(), 'actualizacion', 'empleado', CONCAT('Nuevo registro actualizado: ', NEW.ID_empleado, NEW.nombre, 
NEW.apellido_paterno, NEW.apellido_materno, NEW.cargo, NEW.fecha_contratacion, NEW.salario), CURRENT_USER());


/* Trigger 5 */
/* Se dispara antes de eliminar un registro de la tabla empleado. Registra la acción de eliminación junto con los detalles relevantes del registro 
en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la operación.*/
CREATE TRIGGER tr_delete_empleados
BEFORE DELETE ON empleado
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(), 'eliminacion', 'empleado', CONCAT('Registro eliminado: ', OLD.ID_empleado, OLD.nombre, 
OLD.apellido_paterno, OLD.apellido_materno, OLD.cargo, OLD.fecha_contratacion, OLD.salario), CURRENT_USER());


/* Trigger 6 */
/* Se dispara después de eliminar un registro de la tabla promocion. Registra la acción de eliminación junto con los detalles relevantes del 
registro en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la operación.*/
CREATE TRIGGER tr_delete_promociones
AFTER DELETE ON promocion
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(), 'eliminacion', 'promocion', CONCAT('Registro eliminado: ', OLD.ID_promocion, OLD.ID_aerolinea, 
OLD.campania_promocion, OLD.descripcion_promocion, OLD.descuento, OLD.fecha_inicio, OLD.fecha_fin), CURRENT_USER());


/* Trigger 7 */
/* Se dispara después de insertar un nuevo registro en la tabla flota. Registra la acción de inserción junto con los detalles relevantes del 
registro en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la operación. */
CREATE TRIGGER tr_insert_flota
AFTER INSERT ON flota
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(), 'insercion', 'flota', CONCAT('Nuevo registro insertado: ', NEW.ID_aeronave, NEW.tipo_aeronave, 
NEW.cantidad_asiento), CURRENT_USER());


/* Trigger 8 */
/* Se dispara después de actualizar un registro en la tabla flota. Registra la acción de actualización junto con los detalles relevantes del 
registro en un log de auditoría log_accion_registro, incluyendo la fecha, hora, acción, tabla, registro y usuario involucrados en la operación. */
CREATE TRIGGER tr_update_flota
AFTER UPDATE ON flota
FOR EACH ROW
INSERT INTO log_accion_registro (fecha_transaccion, hora_transaccion, accion, tabla, registro, usuario) VALUES 
(CURDATE(), CURRENT_TIME(), 'actualizacion', 'flota', CONCAT('Nuevo registro actualizado: ', NEW.ID_aeronave, NEW.tipo_aeronave, 
NEW.cantidad_asiento), CURRENT_USER());


/* Trigger 9 */
/* Se dispara después de actualizar un registro en la tabla aeropuerto. Registra la acción de actualización junto con los detalles relevantes del 
registro en un log específico log_aeropuerto, incluyendo la fecha, hora, acción, registro y usuario involucrados en la operación. */
CREATE TRIGGER tr_update_aeropuertos
AFTER UPDATE ON aeropuerto
FOR EACH ROW
INSERT INTO log_aeropuerto (ID_aeropuerto, fecha_transaccion, hora_transaccion, accion, registro, usuario)  VALUES
(NEW.ID_aeropuerto, CURDATE(), CURRENT_TIME(), 'actualizacion', CONCAT('Nuevo registro actualizado: ', NEW.ID_aeropuerto, NEW.codigo_IATA, 
NEW.ciudad, New.pais), CURRENT_USER());


/* Trigger 10 */
CREATE TRIGGER tr_insert_aeropuertos
AFTER INSERT ON aeropuerto
FOR EACH ROW
INSERT INTO log_aeropuerto (ID_aeropuerto, fecha_transaccion, hora_transaccion, accion, registro, usuario)  VALUES
(NEW.ID_aeropuerto, CURDATE(), CURRENT_TIME(), 'insercion', CONCAT('Nuevo registro insertado: ', NEW.ID_aeropuerto, NEW.codigo_IATA, 
NEW.ciudad, New.pais), CURRENT_USER());
