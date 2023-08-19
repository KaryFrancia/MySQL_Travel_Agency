/* SE CREA TRES USUARIOS NUEVOS A LOS CUALES SE LE ASIGNARA UNA SERIE DE PERMISOS */
USE mysql;
SHOW TABLES;
SELECT * FROM user;

CREATE USER 'usuariolectura'@'localhost' IDENTIFIED BY 'usuariolectura';
CREATE USER 'usuariomodifica'@'localhost' IDENTIFIED BY 'usuariomodifica';
CREATE USER 'usuarioelimina'@'localhost' IDENTIFIED BY 'usuarioelimina';

/* El usuario 'usuariolectura' tendrá permisos para realizar consultas de lectura en todas las tablas de la base de datos 'reserva_vuelo'. */ 
GRANT SELECT ON Reserva_Vuelo.* TO 'usuariolectura'@'localhost';
SHOW GRANTS FOR 'usuariolectura'@'localhost';

/* El usuario 'usuariomodifica' tendrá permisos para realizar consultas de lectura (SELECT), actualización (UPDATE) e inserción (INSERT) de
datos en todas las tablas de la base de datos 'reserva_vuelo', pero con respecto a las tablas log solo tendrá permisos de lectura por medidas de
seguridad en la auditoría.*/
GRANT SELECT, UPDATE, INSERT ON Reserva_Vuelo.*  TO 'usuariomodifica'@'localhost';
GRANT SELECT, UPDATE, INSERT ON Reserva_Vuelo.log_accion_registro TO 'usuariomodifica'@'localhost';
REVOKE UPDATE, INSERT ON Reserva_Vuelo.log_accion_registro FROM 'usuariomodifica'@'localhost';
GRANT SELECT, UPDATE, INSERT ON Reserva_Vuelo.log_aeropuerto TO 'usuariomodifica'@'localhost';
REVOKE  UPDATE, INSERT ON Reserva_Vuelo.log_aeropuerto FROM 'usuariomodifica'@'localhost';
SHOW GRANTS FOR 'usuariomodifica'@'localhost';

/* El usuario 'usuarioelimina' tendrá permisos para realizar consultas de lectura (SELECT) y eliminación (DELETE) de datos de la tabla empleado */
GRANT SELECT, DELETE ON Reserva_Vuelo.empleado TO 'usuarioelimina'@'localhost';
SHOW GRANTS FOR 'usuarioelimina'@'localhost';