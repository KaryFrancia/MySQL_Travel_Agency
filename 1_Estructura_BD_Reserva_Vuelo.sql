CREATE SCHEMA Reserva_Vuelo;
USE Reserva_Vuelo;

/* CREACION DE LAS TABLAS, ESTABLECIENDO RELACIONES E INDICES */
/* PARA MANTENER LA INTEGRIDAD REFERENCIAL EN LA CREACIÓN DE LAS FOREING KEYS SE AÑADE ON DELETE NO ACTION ON UPDATE CASCADE /*

/* tabla cliente */
CREATE TABLE cliente
(ID_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60) NOT NULL,
apellido_paterno VARCHAR(60) NOT NULL,
apellido_materno VARCHAR (60) NOT NULL,
cedula VARCHAR(20) NOT NULL,
pasaporte VARCHAR(20) NOT NULL,
telefono VARCHAR(30),
correo VARCHAR(60));

/* tabla asiento */
CREATE TABLE asiento
(ID_asiento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tipo_asiento VARCHAR(20) NOT NULL,
precio_asiento FLOAT NOT NULL,
disponibilidad BOOLEAN NOT NULL);

/* tabla equipaje */
CREATE TABLE equipaje
(ID_equipaje INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tipo_equipaje VARCHAR(20) NOT NULL,
cantidad_equipaje INT NOT NULL,
peso_kg INT,
precio_equipaje FLOAT NOT NULL);

/* tabla aeropuerto */
CREATE TABLE aeropuerto
(ID_aeropuerto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
codigo_IATA VARCHAR(3) NOT NULL,
ciudad VARCHAR(30) NOT NULL,
pais VARCHAR(30) NOT NULL,
coordenada POINT NOT NULL);

/* tabla flota */
CREATE TABLE flota
(ID_aeronave INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tipo_aeronave VARCHAR(30) NOT NULL,
cantidad_asiento INT NOT NULL);

/* tabla empleado */
CREATE TABLE empleado
(ID_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60) NOT NULL,
apellido_paterno VARCHAR(60) NOT NULL,
apellido_materno VARCHAR(60) NOT NULL,
cargo VARCHAR(60) NOT NULL,
fecha_contratacion DATE,
salario FLOAT);     

/* tabla pago */
CREATE TABLE pago
(ID_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
metodo_pago VARCHAR(50) NOT NULL,
fecha_pago  DATE,
hora_pago TIME);

/* tabla escala */
CREATE TABLE escala
(ID_escala INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descripcion_escala VARCHAR(60) NOT NULL);

/* tabla servicio */
CREATE TABLE servicio
(ID_servicio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
descripcion_servicio VARCHAR(120) NOT NULL,
ID_asiento INT NOT NULL,
ID_equipaje INT NOT NULL);
/* FK de la tabla servicios */
ALTER TABLE servicio ADD CONSTRAINT FK_ID_asiento FOREIGN KEY FK_ID_asiento (ID_asiento)
    REFERENCES asiento (ID_asiento) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE servicio ADD CONSTRAINT FK_ID_equipaje FOREIGN KEY FK_ID_equipaje (ID_equipaje)
    REFERENCES  equipaje (ID_equipaje) ON DELETE NO ACTION ON UPDATE CASCADE;

/* tabla aerolinea */
CREATE TABLE aerolinea
(ID_aerolinea INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_aerolinea VARCHAR(30) NOT NULL,
ID_aeronave INT NOT NULL);
/* FK de la tabla aerolineas */
ALTER TABLE aerolinea ADD CONSTRAINT FK_ID_aeronave FOREIGN KEY FK_ID_aeronave (ID_aeronave)
    REFERENCES flota (ID_aeronave) ON DELETE NO ACTION ON UPDATE CASCADE;

/* tabla vuelo */
CREATE TABLE vuelo
(ID_vuelo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_aerolinea INT NOT NULL,
origen INT NOT NULL,
destino_final INT NOT NULL,
ID_escala INT NOT NULL,
fecha_hora_salida_real DATETIME,
fecha_hora_salida_programada DATETIME,
fecha_hora_llegada_real DATETIME,
fecha_hora_llegada_programada DATETIME,
precio_vuelo FLOAT NOT NULL);
/* FK de la tabla vuelos */
ALTER TABLE vuelo ADD CONSTRAINT FK_origen FOREIGN KEY FK_origen (origen)
    REFERENCES aeropuerto (ID_aeropuerto) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE vuelo ADD CONSTRAINT FK_destino_final FOREIGN KEY FK_destino_final (destino_final)
    REFERENCES aeropuerto (ID_aeropuerto) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE vuelo ADD CONSTRAINT FK_ID_aerolinea FOREIGN KEY FK_ID_aerolinea (ID_aerolinea)
    REFERENCES aerolinea (ID_aerolinea) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE vuelo ADD CONSTRAINT FK_ID_escala FOREIGN KEY FK_ID_escala (ID_escala)
    REFERENCES escala (ID_escala) ON DELETE NO ACTION ON UPDATE CASCADE;

/* tabla reserva */
CREATE TABLE reserva
(ID_reserva INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_vuelo INT NOT NULL,
ID_servicio INT NOT NULL,
ID_cliente INT NOT NULL,
fecha_reserva DATE NOT NULL,
hora_reserva TIME NOT NULL,
ID_pago INT NOT NULL);
/* FK de la tabla reservas */
ALTER TABLE reserva ADD CONSTRAINT FK_ID_vuelo FOREIGN KEY FK_ID_vuelo (ID_vuelo)
    REFERENCES vuelo (ID_vuelo) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE reserva ADD CONSTRAINT FK_ID_servicio FOREIGN KEY FK_ID_servicio (ID_servicio)
    REFERENCES servicio (ID_servicio) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE reserva ADD CONSTRAINT FK_ID_cliente FOREIGN KEY FK_ID_cliente (ID_cliente)
    REFERENCES cliente (ID_cliente) ON DELETE NO ACTION ON UPDATE CASCADE;    
ALTER TABLE reserva ADD CONSTRAINT FK_ID_pago FOREIGN KEY FK_ID_pago (ID_pago)
    REFERENCES pago (ID_pago) ON DELETE NO ACTION ON UPDATE CASCADE;


/* tabla comentario */
CREATE TABLE comentario
(ID_comentario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_cliente INT NOT NULL,
mensaje VARCHAR(120) NOT NULL,
fecha_hora_comentario  DATETIME);
/* FK de la tabla comentarios */
ALTER TABLE comentario ADD CONSTRAINT FK_ID_cliente_comentario FOREIGN KEY FK_ID_cliente_comentario (ID_cliente)
    REFERENCES cliente (ID_cliente) ON DELETE NO ACTION ON UPDATE CASCADE;

/* tabla promocion */
CREATE TABLE promocion
(ID_promocion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_aerolinea INT NOT NULL,
campania_promocion VARCHAR(50) NOT NULL,
descripcion_promocion VARCHAR(120) NOT NULL,
descuento FLOAT NOT NULL,
fecha_inicio DATE,
fecha_fin  DATE);
/* FK de la tabla promociones */
ALTER TABLE promocion ADD CONSTRAINT FK_ID_aerolinea_promo FOREIGN KEY FK_ID_aerolinea_promo (ID_aerolinea)
    REFERENCES aerolinea (ID_aerolinea) ON DELETE NO ACTION ON UPDATE CASCADE;

/* tabla aviso */
CREATE TABLE aviso
(ID_aviso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_cliente INT NOT NULL,
tipo_aviso VARCHAR(100) NOT NULL,
fecha_hora_aviso  DATETIME);
/* FK de la tabla avisos */
ALTER TABLE aviso ADD CONSTRAINT FK_ID_cliente_aviso FOREIGN KEY FK_ID_cliente_aviso (ID_cliente)
    REFERENCES cliente (ID_cliente) ON DELETE NO ACTION ON UPDATE CASCADE;


/* CREACION DE LAS TABLAS LOG */
CREATE TABLE log_accion_registro
(ID_log_accion_registro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_transaccion DATE,
hora_transaccion TIME,
accion VARCHAR(50),
tabla VARCHAR(100),
registro VARCHAR(1000),
usuario VARCHAR(100));

CREATE TABLE log_aeropuerto 
(ID_log_aeropuerto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ID_aeropuerto INT NOT NULL,
fecha_transaccion DATE,
hora_transaccion TIME,
accion VARCHAR(50),
registro VARCHAR(1000),
usuario VARCHAR(100));

ALTER TABLE log_aeropuerto ADD CONSTRAINT FK_ID_aeropuerto_log FOREIGN KEY FK_ID_aeropuerto_log (ID_aeropuerto)
    REFERENCES aeropuerto(ID_aeropuerto) ON DELETE NO ACTION ON UPDATE CASCADE;