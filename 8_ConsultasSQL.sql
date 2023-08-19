USE Reserva_Vuelo;

/* Consulta de vistas */

SELECT * FROM vista_reserva_mayor_500dolares
WHERE aerolinea = 'Latam';

SELECT * FROM vista_reserva_mayor_500dolares
LIMIT 1;


/* Consulta de funciones */ 
/* Esta consulta devolvera el numero de vuelos a Bogota */
SELECT cantidad_destino('Bogota');

/* Esta consulta devolvera el total de ingresos generado por el cliente con el id 2 */
SELECT total_ingreso_cliente(2);
/* esta consulta devolvera el numero total de reservas del cliente con id 2 */
SELECT total_reserva_cliente (2);


/* Consulta de Stored Procedures */
/* Esta consulta devolverá una tabla con los destinos más frecuentes, ordenados por el número de vuelos a cada destino de mayor a menor */
CALL destinos_frecuentados();

/* Esta consulta arrojará un mensaje : El campo tipo de aeronave no puede estar vacio */
CALL update_add_flota(5,'',210);

/* Esta consulta verificará que la aeronave con el ID 4 existe, por lo tanto actualizará el registro del ID 4
y con el tipo de aeronave 'Boeing 777' de la tabla flota, actualizando la cantidad de asientos de 410 a 400 */
SELECT * FROM flota;
CALL update_add_flota(4,'Boeing 777', 400);

/* Esta consulta verificará que la aeronave con el ID 5 no existe, por lo tanto agregará una nueva aeronave a la tabla flota 
con el ID 5, el tipo de aeronave 'Airbus 320-271N' y la cantidad de asientos 186 */
CALL update_add_flota(5,'Airbus 320-271N', 186);


/* Consulta de triggers */ 

/* Se prueba el trigger en la tabla cliente */
SELECT * FROM cliente ORDER BY ID_cliente DESC;
/* se inserta con SP el registro de un cliente nuevo con ID_cliente=91 */
CALL update_add_cliente (91, 'Kelly', 'France', 'Rivera', 70139247, 'K125L', '+591999851236', 'k_sk@gmail.com');
/* se actualiza con SP el apellido del cliente nuevo, colocando su ID para que se actualice el 
apellido paterno ( de 'France' a 'Francia') */
CALL update_add_cliente (91, 'Kelly', 'Francia', 'Rivera', 70139247, 'K125L', '+591999851236', 'k_sk@gmail.com');

/* se prueba el trigger en la tabla empleado */
SELECT * FROM empleado;
/* con un SP se inserta el registro de un nuevo empleado */
CALL update_add_empleado (5, 'Stephanie', 'Gogh', 'Fernandez', 'Desarrolladora UX', '2023-01-17', 1200);
/* con un SP se actualiza el cargo y salario del empleado con ID igual a 3 debido a que recibió un ascenso en su puesto de trabajo */
CALL update_add_empleado (3, 'Laura', 'Romero', 'Sosa','supervisora de atencion al cliente', '2022-01-19', 1500);

/* se prueba el trigger en la tabla promocion, se elimina el registro con ID igual a 2 */
SELECT * FROM promocion;
DELETE FROM promocion WHERE id_promocion = 2;

/* se prueba el trigger en la tabla aeropuerto */
SELECT * FROM aeropuerto;
/* con un SP se actualiza la ciudad del aeoropuerto con ID igual a 1 (de 'Sao Paulo' a 'San Pablo') */
CALL update_add_aeropuerto (1, 'GRU', 'San Pablo', 'Brasil', POINT(-23.435556, -46.473056));
/* con un SP se inserta un registro nuevo en la tabla aeropuerto*/
CALL update_add_aeropuerto (8, 'MVD', 'Montevideo', 'Uruguay', POINT(-33.392778, -70.785556)); 

/* Finalmente, aquí se observa como quedaron registrados los datos en las tablas log */
SELECT * FROM log_accion_registro;
SELECT * FROM log_aeropuerto;

/* Consultas para exportar a tableau y generar un dashboard del primer trimestre */
SELECT * FROM vista_reserva;
SELECT * FROM vista_vuelos_programados;
SELECT * FROM vista_ingresos_por_ruta;
SELECT * FROM vista_flota_aerolinea;
SELECT * FROM vista_ingresos_por_aerolinea;
SELECT * FROM vista_reserva_mayor_500dolares;
SELECT * FROM aeropuerto;
SELECT * FROM cliente;

