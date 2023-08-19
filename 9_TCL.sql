/*  SENTENCIAS DEL SUBLENGUAJE TCL */

/* Se setea la variable autocommit en 0 */
SELECT @@autocommit;
SET autocommit = 0;

/* EJEMPLO 1: Se realiza eliminacion e insercion de registros en la tabla empleado */

/* Esta secuencia de comandos inicia una transacción, luego selecciona la primera fila de la tabla 'empleado', 
elimina la fila con 'ID_empleado' igual a 1 y finalmente selecciona nuevamente la primera fila de la tabla actualizada.
Es importante destacar que la transacción permite que todos estos comandos se ejecuten como una unidad indivisible. 
Si ocurriera algún error antes de confirmar la transacción, se desharían todos los cambios realizados hasta ese punto (en este caso, 
se desharía la eliminación de la fila con 'ID_empleado' igual a 1). */
START TRANSACTION; 
SELECT * FROM empleado LIMIT 1;
DELETE FROM empleado WHERE ID_empleado = 1;
SELECT * FROM empleado LIMIT 1;
/* Para confirmar y guardar definitivamente los cambios realizados dentro de la transacción, se debe ejecutar el comando COMMIT. 
Pero como no se quiere eliminar el registro, se va a deshacer los cambios (sin guardar) utilizando el comando ROLLBACK.*/ 
ROLLBACK;
/*COMMIT;*/

/* Con esta secuencia de comandos se inicia una transacción, y se inserta un nuevo registro en la tabla 'empleado', luego se realiza 
una consulta para verificar que la inserción se haya realizado correctamente. Como se mencionó anteriormente, la transacción permite 
que todos estos comandos se ejecuten como una unidad indivisible, por lo que si ocurriera algún error antes de confirmar la transacción, 
se desharían todos los cambios realizados hasta ese punto (en este caso, se desharía la inserción del nuevo empleado). */ 
START TRANSACTION;
SELECT * FROM empleado;
CALL update_add_empleado (6, 'Kary', 'Francia', 'Vasquez', 'analista de negocios', '2023-02-19', 2500);

/*Para confirmar y guardar definitivamente los cambios realizados dentro de la transacción, se ejecuta el comando COMMIT. 
Si se quisiera deshacer los cambios sin guardar, se puede utilizar el comando ROLLBACK.*/ 
/* ROLLBACK; */ 
COMMIT;


/* Ejemplo 2: Se realiza insercion de registros en la tabla cliente, con uso de savepoints */

/* Al igual que en las explicaciones anteriores, esta secuencia de comandos inicia una transacción, agrega nuevos registros 
a la tabla 'cliente' y crea dos savepoints (puntos de guardado lote_1 y lote_2) para marcar diferentes lotes de inserciones. 
Los savepoints se utilizan para marcar posiciones específicas en la transacción, lo que permite deshacer cambios hasta ese punto 
en particular.*/
START TRANSACTION;
SELECT * FROM cliente;
INSERT INTO cliente (ID_cliente, nombre, apellido_paterno, apellido_materno, cedula, pasaporte, telefono, correo) VALUES
(NULL, 'Pedro', 'Mora', 'Aguilar', '45517518', 'A1542D', '+59194425534', 'p.mora@hotmail.com'),
(NULL, 'Martina', 'Guichon', 'Quintero', '75517519', 'L1672R', '+59199825534', 'marti_15@gmail.com'),
(NULL, 'Andres', 'Rivera', 'Gutierrez', '60551851', 'K8542D', '+59894425524', 'andy@hotmail.com'),
(NULL, 'Julieta', 'Cepeda', 'Brito', '43228516', 'K9542D', '+59899628514', 'cjuli@gmail.com');
SAVEPOINT lote_1;
INSERT INTO cliente (ID_cliente, nombre, apellido_paterno, apellido_materno, cedula, pasaporte, telefono, correo) VALUES
(NULL, 'Gianella', 'Neyra', 'Rivero', '35517523', 'L1542R', '+59199995534', 'giani.neyra@hotmail.com'),
(NULL, 'Laura', 'Spoya', 'Rullian', '71139548', 'K3572R', '+59199724434', 'spoya@gmail.com'),
(NULL, 'Paolo', 'Guerrero', 'Farfan', '50558851', 'K8542D', '+59199342528', 'p.guerreo@hotmail.com'),
(NULL, 'Tommy', 'Portocarrero', 'Mosca', '43255588', 'L9542B', '+59899628521', 'tommy.porto@gmail.com');
SAVEPOINT lote_2;
/* Se realiza una consulta SELECT en la tabla 'cliente' y se ordena los resultados en orden descendente según el campo 'ID_cliente'; 
mostrando todos los registros de la tabla después de las inserciones realizadas hasta ese punto. */
SELECT * FROM cliente ORDER BY ID_cliente DESC;
/* Se realiza un "rollback" en la transacción hasta el savepoint "lote_1". Es decir, todos los cambios realizados después de ese punto 
seran deshechos, incluidas las inserciones realizadas en el "lote_2". */
ROLLBACK TO lote_1;
/* Después del "rollback", se realiza nuevamente una consulta SELECT en la tabla 'clientes' y se ordena los resultados en orden descendente 
según el campo 'ID_cliente'; mostrando los registros de la tabla después del "rollback" para que se visualice que las inserciones del "lote_1" 
fueron deshechas */
SELECT * FROM cliente ORDER BY ID_cliente DESC;
/* Finalmente, para confirmar y guardar definitivamente los cambios realizados dentro de la transacción, se ejecuta el comando COMMIT. */
COMMIT; 
SET autocommit = 1;