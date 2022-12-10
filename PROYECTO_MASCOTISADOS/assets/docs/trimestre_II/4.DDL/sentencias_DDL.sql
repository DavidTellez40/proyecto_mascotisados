/* ************************************************************************************* */
/* ---------------------------------------- DDL ---------------------------------------- */
/* ----------------------------- DATA DEFINITION LANGUAGE ------------------------------ */
/* -------------------------- LENGUAJE DE DEFINICIÓN DE DATOS -------------------------- */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* ------------------------------------------------------------------------------------- */
/* 01. Mostrar BBDDs : .................... SHOW DATABASES                               */
/* 02. Usar BBDD : ........................ USE __                                       */
/* 03. Eliminar BBDD : .................... DROP DATABASE __                             */
/* 04. Mostrar Tablas : ................... SHOW TABLES __.                              */
/* 05. Mostar Columnas : .................. SHOW COLUMNS FROM __ . DESCRIBE __           */
/* 06. Agregar Columna : .................. ALTER TABLE __ ADD __ __                     */
/* 07. Renombrar Columna : ................ ALTER TABLE __ CHANGE __ __                  */
/* 08. Eliminar Columna : ................. ALTER TABLE __ DROP __                       */
/* 09. Agregar Valor x Defecto Columna : .. ALTER TABLE __ ALTER __ SET DEFAULT __       */
/* 10. Eliminar Valor x Defecto Columna : . ALTER TABLE __ ALTER __ DROP DEFAULT         */
/* 11. Mostrar Creación Tabla : ........... SHOW CREATE TABLE __                         */
/* 12. Eliminar Restricción : ............. ALTER TABLE __ DROP CONSTRAINT __            */
/* 13. Eliminar Índice : .................. ALTER TABLE __ DROP INDEX __                 */
/* 14. Eliminar Llave Primaria : .......... ALTER TABLE __ DROP PRIMARY KEY              */
/* 15. Limpiar Registros : ................ TRUNCATE __                                  */
/* 16. Eliminar Tabla : ................... DROP TABLE __                                */
/* 17. Crear Tabla : ...................... CREATE TABLE __ ( __ , __ )                  */
/* 18. Renombrar Tabla : .................. RENAME TABLE __ TO __                        */
/* 19. Crear Llave Primaria : ............. ALTER TABLE __ ADD PRIMARY KEY ( __ )        */
/* 20. Crear Índice Campo : ............... CREATE INDEX __ ON __ ( __ )                 */
/* 21. Crear Índice Multicampo : .......... CREATE INDEX _ ON _ ( __ , __ )              */
/* 22. Crear Índice Único : ............... CREATE UNIQUE INDEX __ ON __ ( __ )          */
/* 23. Crear Restricción : ................ ALTER TABLE __ ADD CONSTRAINT __             */
/*     FOREIGN KEY ( __ ) REFERENCES __ ( __ ) ON DELETE CASCADE ON UPDATE CASCADE       */
/* ------------------------------------------------------------------------------------- */
/* ************************************************************************************* */
/* EN CONSOLA: XAMPP / SHELL / cd mysql/bin / mysql -h localhost -u root -p / ENTER      */
/* ************************************************************************************* */
-- ------------------------------------------------------------------------------------- --
-- 01. Mostrar BBDDs. ------------------------------------------------------------------ --
--     SHOW DATABASES : ---------------------------------------------------------------- -- 
-- ------------------------------------------------------------------------------------- --
SHOW DATABASES;
-- ------------------------------------------------------------------------------------- --
-- 02. Usar BBDD. ---------------------------------------------------------------------- --
--     USE __ : ------------------------------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
USE BBDD_MASCOTISADOS;
-- ------------------------------------------------------------------------------------- --
-- 03. Eliminar BBDD. ------------------------------------------------------------------ --
--     DROP DATABASE __ : -------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DROP DATABASE BBDD_MASCOTISADOS;
-- ------------------------------------------------------------------------------------- --
-- 04. Mostrar Tablas. ----------------------------------------------------------------- --
--     SHOW TABLES __ : ---------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW TABLES;
-- ------------------------------------------------------------------------------------- --
-- 05. Mostar Columnas. ---------------------------------------------------------------- --
--     SHOW COLUMNS FROM __ . DESCRIBE __ : -------------------------------------------- --
SHOW COLUMNS FROM USUARIOS;
SHOW COLUMNS FROM CLIENTES;
SHOW COLUMNS FROM PRODUCTOS;
SHOW COLUMNS FROM PEDIDOS;

-- ------------------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
-- 06. Agregar Columna. ---------------------------------------------------------------- --
--     ALTER TABLE __ ADD __ __ : ------------------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ADD email DATE;
ALTER TABLE CLIENTES ADD numero_tel INT;
ALTER TABLE PRODUCTOS ADD stock INT;
ALTER TABLE ROLES ADD nombre_rol CHAR;
ALTER TABLE PEDIDOS ADD direccion_envio VARCHAR;
ALTER TABLE METODO_PAGO ADD tipo_pago CHAR;


-- ------------------------------------------------------------------------------------- --
-- 07. Renombrar Columna. -------------------------------------------------------------- --
--     ALTER TABLE __ CHANGE __ __ : --------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS CHANGE primer_nombre nombre CHAR;
ALTER TABLE CLIENTES CHANGE id_usuario usuario_id INT;
ALTER TABLE PRODUCTOS CHANGE precio_unitario_compra precio_u_comp DECIMAL;

-- ------------------------------------------------------------------------------------- --
-- 08. Eliminar Columna. --------------------------------------------------------------- --
--     ALTER TABLE __ DROP __ : -------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP apellido_materno;
ALTER TABLE USUARIOS DROP img_usuario;
-- ------------------------------------------------------------------------------------- --
-- 09. Agregar Valor x Defecto Columna. ------------------------------------------------ --
--     ALTER TABLE __ ALTER __ SET DEFAULT __ :	---------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ALTER codigo_rol SET DEFAULT 1;
-- ------------------------------------------------------------------------------------- --
-- 10. Eliminar Valor x Defecto Columna. ----------------------------------------------- --
--     ALTER TABLE __ ALTER __ DROP DEFAULT : ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS ALTER codigo_rol DROP DEFAULT;
-- ------------------------------------------------------------------------------------- --
-- 11. Mostrar Creación Tabla. --------------------------------------------------------- --
--     SHOW CREATE TABLE __ : ---------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SHOW CREATE TABLE USUARIOS
SHOW CREATE TABLE PRODUCTOS
SHOW CREATE TABLE ROLES
-- ------------------------------------------------------------------------------------- --
-- 12. Eliminar Restricción. ----------------------------------------------------------- --
--     ALTER TABLE __ DROP CONSTRAINT __ : --------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

ALTER TABLE USUARIOS DROP CONSTRAINT fk_usuario_roles;
ALTER TABLE DETALLE_VENTA DROP CONSTRAINT  fk_detalle_compra_pedido;
ALTER TABLE DETALLE_VENTA DROP CONSTRAINT  fk_detalle_compra_producto;
ALTER TABLE LISTA_COMPRAS DROP CONSTRAINT fk_lista_compras_productos;
ALTER TABLE LISTA_COMPRAS DROP CONSTRAINT fk_lista_compras_COMPRAS;
ALTER TABLE PRODUCTOS DROP CONSTRAINT fk_producto_marca_producto;
ALTER TABLE PRODUCTOS DROP CONSTRAINT  fk_producto_categoria;
ALTER TABLE CLIENTES DROP CONSTRAINT fk_clientes_usuarios;
ALTER TABLE PEDIDOS DROP CONSTRAINT fk_pedidos_metodo_pago;
ALTER TABLE PEDIDOS DROP CONSTRAINT fk_pedidos_estado_pago;
ALTER TABLE PEDIDOS DROP CONSTRAINT  fk_pedido_clientes;
ALTER TABLE COMPRA DROP CONSTRAINT fk_detalle_compra_pedido;
ALTER TABLE COMPRA DROP CONSTRAINT fk_detalle_compra_producto;


-- ------------------------------------------------------------------------------------- --
-- 13. Eliminar Índice. ---------------------------------------------------------------- --
--     ALTER TABLE __ DROP INDEX __ : -------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP INDEX ind_usuario_roles;
ALTER TABLE CLIENTES DROP INDEX  ind_clientes_usuarios;
ALTER TABLE PEDIDOS DROP INDEX ind_pedidos_clientes;
ALTER TABLE PEDIDOS DROP INDEX ind_pedidos_metodo_pago;
ALTER TABLE PRODUCTOS DROP INDEX ind_producto_marca_producto;
ALTER TABLE PRODUCTOS DROP INDEX ind_producto_categoria;
ALTER TABLE DETALLE_VENTA DROP INDEX ind_detalle_compra_pedidos;
ALTER TABLE DETALLE_VENTA DROP INDEX fk_detalle_compra_producto;
ALTER TABLE LISTA_COMPRAS DROP INDEX fk_lista_compras_productos_idx;
ALTER TABLE LISTA_COMPRAS DROP INDEX fk_lista_compras_COMPRAS_idx;

-- ------------------------------------------------------------------------------------- --
-- 14. Eliminar Llave Primaria. -------------------------------------------------------- --
--     ALTER TABLE __ DROP PRIMARY KEY : ----------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
ALTER TABLE USUARIOS DROP PRIMARY KEY;
ALTER TABLE ROLES DROP PRIMARY KEY;
ALTER TABLE CLIENTES DROP PRIMARY KEY;
ALTER TABLE METODO_PAGO DROP PRIMARY KEY;
ALTER TABLE PEDIDOS DROP PRIMARY KEY;
ALTER TABLE MARCA_PRODUCTO DROP PRIMARY KEY;
ALTER TABLE CATEGORIAS DROP PRIMARY KEY;
ALTER TABLE PRODUCTOS DROP PRIMARY KEY;
ALTER TABLE COMPRAS DROP PRIMARY KEY;


-- ------------------------------------------------------------------------------------- --
-- 15. Limpiar Registros. -------------------------------------------------------------- --
--     TRUNCATE __ : ------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
TRUNCATE USUARIOS;
TRUNCATE PEDIDOS;
TRUNCATE CLIENTES;
TRUNCATE PRODUCTOS;

-- ------------------------------------------------------------------------------------- --
-- 16. Eliminar Tabla. ----------------------------------------------------------------- --
--     DROP TABLE __ : ----------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DROP TABLE USUARIOS;
DROP TABLE PEDIDOS;
DROP TABLE PRODUCTOS;
DROP TABLE CLIENTES;
DROP TABLE DETALLE_COMPRA;
DROP TABLE ROLES;

-- ------------------------------------------------------------------------------------- --
-- 17. Crear Tabla. -------------------------------------------------------------------- --
--     CREATE TABLE __ ( __ , __ ) : --------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

-- CREAR TABLA ROLES -------------------------------------------------------------------- --
CREATE TABLE roles  (
   codigo_rol  INT  NOT NULL AUTO_INCREMENT,
   nombre_rol  CHAR(10) NOT NULL,
  PRIMARY KEY ( codigo_rol )
  )ENGINE = InnoDB;
-- CREAR TABLA USUARIO -------------------------------------------------------------------- --
CREATE TABLE usuarios  (
   codigo_rol  INT  NOT NULL,
   id_usuario  INT NOT NULL AUTO_INCREMENT,
   primer_nombre  CHAR(10) NOT NULL,
   apellido_paterno  CHAR(15) NOT NULL,
   apellido_materno  CHAR(15) NOT NULL,
   email  VARCHAR(30) NOT NULL,
   passaword  VARCHAR(15) NOT NULL,
   nickname  VARCHAR(10) NOT NULL,
  PRIMARY KEY ( id_usuario ),
  UNIQUE INDEX  email_UNIQUE  ( email),
  UNIQUE INDEX  nickname_UNIQUE  ( nickname),
  INDEX  ind_usuario_roles  ( codigo_rol),
  CONSTRAINT  fk_usuario_roles
    FOREIGN KEY ( codigo_rol )
    REFERENCES roles  ( codigo_rol )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- CREAR CLIENTES -------------------------------------------------------------------- --

CREATE TABLE clientes  (
   id_usuario  INT NOT NULL,
   numero_tel  INT UNSIGNED NOT NULL,
   identificacion  INT UNSIGNED NOT NULL,
  PRIMARY KEY ( id_usuario ),
  UNIQUE INDEX  numero_tel_UNIQUE  ( numero_tel),
  UNIQUE INDEX  identificacion_UNIQUE  ( identificacion),
  INDEX  ind_clientes_usuarios  ( id_usuario),
  CONSTRAINT  fk_clientes_usuarios 
    FOREIGN KEY ( id_usuario )
    REFERENCES usuarios  ( id_usuario )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- CREAR TABLA METODO_PAGO -------------------------------------------------------------------- --

CREATE TABLE metodo_pago  (
   codigo_pago  INT UNSIGNED NOT NULL,
   tipo_de_pago  CHAR(20) NOT NULL,
  PRIMARY KEY ( codigo_pago)
  )ENGINE = InnoDB;

-- CREAR TABLA ESTADO_PAGO -------------------------------------------------------------------- --

CREATE TABLE estado_pago(
   id_estado INT UNSIGNED NOT NULL AUTO_INCREMENT,
   referencia  CHAR(30) NOT NULL,
  PRIMARY KEY ( id_estado)
  )ENGINE = InnoDB;

-- CREAR TABLA PEDIDOS -------------------------------------------------------------------- --

CREATE TABLE pedidos  (
   codigo_pedido  INT NOT NULL AUTO_INCREMENT,
   id_usuario  INT NOT NULL,
   id_estado  INT  NOT NULL,
   codigo_pago INT NOT NULL,
   fecha_pedido  DATE NOT NULL,
   precio_subtotal  DECIMAL(10,2)  NOT NULL,
   iva  DECIMAL(5,2) NULL DEFAULT 0,
   direccion_envio  VARCHAR(100) NULL DEFAULT 'no_aplica',
  PRIMARY KEY ( codigo_pedido ),
  INDEX  ind_pedido_cliente  ( cliente_id_usuario),
  INDEX  ind_pedido_metodo_pago  ( codigo_pago),
  INDEX  ind_pedido_estado_pago  (estado_pago),
  CONSTRAINT  fk_pedido_metodo_pago 
    FOREIGN KEY ( codigo_pago )
    REFERENCES metodo_pago  ( codigo_pago )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_pedido_estado_pago 
    FOREIGN KEY (id_estado)
    REFERENCES estado_pago  ( id_estado )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_pedido_cliente 
    FOREIGN KEY (id_usuario)
    REFERENCES clientes  ( id_usuario )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

 -- ----------------------------------------------------------------------------------------------------------
-- CREAR TABLA MARCA_PRODUCTO
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE marca_producto  (
   id_marca  INT NOT NULL AUTO_INCREMENT,
   tipo_marca  VARCHAR(30) NOT NULL,
  PRIMARY KEY ( id_marca )
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- CREAR TABLA CATEGORIAS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE categorias  (
   id_categoria  INT NOT NULL AUTO_INCREMENT,
   clase  VARCHAR(30) NOT NULL,
  PRIMARY KEY ( id_categoria )
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- CREAR TABLA PRODUCTOS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE productos(
   id_producto  INT NOT NULL AUTO_INCREMENT,
   id_marca  INT NOT NULL,
   id_categoria  INT NOT NULL,
   nombre  VARCHAR(100) NOT NULL,
   img_producto  BLOB NOT NULL,
   unidad_de_medida  CHAR(5) NOT NULL,
   precio_unitario_compra  DECIMAL(10,2) UNSIGNED NOT NULL,
   precio_unitario_venta  DECIMAL(10,2) NOT NULL,
   descripcion_gneral  VARCHAR(255) NOT NULL,
   stock  INT NOT NULL,
  PRIMARY KEY ( id_producto ),
  INDEX  ind_producto_marca_producto  ( id_marca),
  INDEX  ind_producto_categoria  (id_categoria),
  CONSTRAINT  fk_producto_marca_producto 
    FOREIGN KEY ( id_marca )
    REFERENCES marca_producto  ( id_marca )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_producto_categoria 
    FOREIGN KEY ( id_categoria )
    REFERENCES categorias  ( id_categoria )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- CREAR TABLA DETALLE VENTA
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE detalle_venta  (
   id_producto  INT NOT NULL,
   codigo_pedido  INT NOT NULL,
   cant_product  SMALLINT(20) UNSIGNED NOT NULL,
  INDEX  ind_detalle_compra_pedido  ( codigo_pedido),
  INDEX  fk_detalle_compra_producto  ( id_producto),
  CONSTRAINT  fk_detalle_compra_pedido1 
    FOREIGN KEY ( codigo_pedido )
    REFERENCES pedidos  ( codigo_pedido )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_detalle_compra_producto 
    FOREIGN KEY ( id_producto )
    REFERENCES productos  ( id_producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
--CREAR TABLA COMPRAS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE COMPRAS  (
   codigo_compra  INT NOT NULL,
   fecha_compra  DATE NOT NULL,
   documento  INT NOT NULL,
   total__a_pagar  DECIMAL(10,2) NOT NULL,
  PRIMARY KEY ( codigo_compra )
)ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- CREAR TABLA LISTA_COMPRAS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE lista_compras  (
   codigo_compra  INT NOT NULL,
   id_producto  INT  NOT NULL,
  precio_unit_compra DECIMAL(10,2) NOT NULL,
  INDEX  fk_lista_compras_productos_idx  ( productos_id_productos),
  INDEX  fk_lista_compras_COMPRAS_idx  ( codigo_compra),
  CONSTRAINT  fk_lista_compras_productos1 
    FOREIGN KEY ( productos_id_producto )
    REFERENCES productos  ( id_producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_lista_compras_COMPRAS 
    FOREIGN KEY ( codigo_compra )
    REFERENCES COMPRAS  ( codigo_compra )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- ------------------------------------------------------------------------------------- --
-- 18. Renombrar Tabla. ---------------------------------------------------------------- --
--     RENAME TABLE __ TO __ : --------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
RENAME TABLE PRODUCTOS TO PRODUCTO;
RENAME TABLE CLIENTES TO CLIENTE;
RENAME TABLE MARCA PRODUCTO TO MARCA_P;

-- ------------------------------------------------------------------------------------- --
-- 19. Crear Llave Primaria. ----------------------------------------------------------- --
--     ALTER TABLE __ ADD PRIMARY KEY ( __ ) : ----------------------------------------- --
-- ------------------------------------------------------------------------------------- --

ALTER TABLE ROLES ADD PRIMARY KEY (codigo_rol);
ALTER TABLE USUARIOS ADD PRIMARY KEY (id_usuario );
ALTER TABLE CLIENTES ADD PRIMARY KEY (id_usuario);
ALTER TABLE METODO_PAGO ADD PRIMARY KEY (codigo_estado);
ALTER TABLE PEDIDOS ADD PRIMARY KEY (codigo_pedido);
ALTER TABLE MARCA_PRODUCTO ADD PRIMARY KEY (id_marca);
ALTER TABLE CATEGORIAS ADD PRIMARY KEY (id_categoria);
ALTER TABLE PRODUCTOS ADD PRIMARY KEY (id_producto);
ALTER TABLE COMPRAS ADD PRIMARY KEY (codigo_compra);

-- ------------------------------------------------------------------------------------- --
-- 20. Crear Índice Campo. ------------------------------------------------------------- --
--     CREATE INDEX __ ON __ ( __ ) :  ------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

CREATE INDEX ind_usuario_roles ON USUARIOS (codigo_rol);
CREATE INDEX ind_clientes_usuarios ON CLIENTES (id_usuario);
CREATE INDEX  ind_pedido_cliente ON PEDIDOS (cliente_id_usuario);
CREATE INDEX  ind_pedido_metodo_pago  ON PEDIDOS (codigo_pago);
CREATE INDEX  ind_pedido_estado_pago  ON PEDIDOS (id_estado);
CREATE INDEX  ind_producto_categoria  ON PRODUCTOS (_id_categoria);
CREATE INDEX  ind_producto_marca_producto ON PRODUCTOS (id_marca);
CREATE INDEX ind_detalle_compra_pedido ON DETALLE_VENTA (codigo_pedido);
CREATE INDEX fk_detalle_compra_producto  ON DETALLE_VENTA (id_producto);
CREATE INDEX fk_lista_compras_productos_idx ON LISTA_COMPRAS (productos_id_producto);
CREATE INDEX  fk_lista_compras_COMPRAS1_idx ON LISTA_COMPRAS (codigo_compra);

-- ------------------------------------------------------------------------------------- --
-- 21. Crear Índice Multicampo. -------------------------------------------------------- --
--     CREATE INDEX _ ON _ ( __ , __ ) : ----------------------------------------------- -- 
-- ------------------------------------------------------------------------------------- --
CREATE INDEX ind_codigo_cred_identificacion_cred
ON CREDENCIALES (codigo_cred, identificacion_cred);
-- ------------------------------------------------------------------------------------- --
-- 22. Crear Índice Único. ------------------------------------------------------------- --
--     CREATE UNIQUE INDEX __ ON __ ( __ ) : ------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
CREATE UNIQUE INDEX email_UNIQUE ON USUARIOS (email);
CREATE UNIQUE INDEX nickname_UNIQUE ON USUARIOS (nickname);
CREATE UNIQUE INDEX numero_tel_UNIQUE   ON CLIENTES (numero_tel);
CREATE UNIQUE INDEX identificacion_UNIQUE   ON CLIENTES (identificacion);

-- ------------------------------------------------------------------------------------- --
-- 23. Crear Restricción. -------------------------------------------------------------- --
--     ALTER TABLE __ ADD CONSTRAINT __ FOREIGN KEY ( __ ) REFERENCES __ ( __ ) -------- --
--     ON DELETE CASCADE ON UPDATE CASCADE : ------------------------------------------- --
-- ------------------------------------------------------------------------------------- --

--------- RESTRICCIÓN TABLA USUARIOS---------------------------------------------------- --

ALTER TABLE USUARIOS ADD 
CONSTRAINT fk_usuario_roles
    FOREIGN KEY (codigo_rol)
    REFERENCES roles (codigo_rol)
    ON DELETE CASCADE
    ON UPDATE CASCADE;


--------- RESTRICCIÓN TABLA CLIENTES--------------------------------------------------- --

ALTER TABLE CLIENTES ADD
 CONSTRAINT  fk_clientes_usuarios 
    FOREIGN KEY ( id_usuario )
    REFERENCES usuarios  ( id_usuario )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

--------- RESTRICCIÓN TABLA PEDIDOS---------------------------------------------------- --

ALTER TABLE PEDIDOS ADD 
CONSTRAINT  fk_pedido_metodo_pago 
    FOREIGN KEY ( codigo_pago )
    REFERENCES metodo_pago  ( codigo_pago)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_pedido_cliente 
    FOREIGN KEY ( cliente_id_usuario )
    REFERENCES clientes  ( id_usuario )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

--------- RESTRICCIÓN TABLA PRODUCTOS---------------------------------------------------- --

ALTER TABLE PRODUCTOS ADD
CONSTRAINT  fk_producto_marca_producto 
    FOREIGN KEY ( id_marca )
    REFERENCES marca_producto  ( id_marca )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_producto_categoria 
    FOREIGN KEY ( _id_categoria )
    REFERENCES categorias  ( id_categoria )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

--------- RESTRICCIÓN TABLA DETALLE_VENTA---------------------------------------------------- --

ALTER TABLE DETALLE_VENTA ADD
CONSTRAINT  fk_detalle_compra_pedido
    FOREIGN KEY ( codigo_pedido )
    REFERENCES pedidos  ( codigo_pedido )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_detalle_compra_producto 
    FOREIGN KEY ( id_producto )
    REFERENCES productos ( id_producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE;
	
-- ------------------------------------------------------------------------------------- --
--------- RESTRICCIÓN TABLA LISTA_COMPRAS---------------------------------------------------- --

ALTER TABLE LISTA_COMPRAS ADD
CONSTRAINT  fk_lista_compras_productos 
    FOREIGN KEY ( productos_id_producto )
    REFERENCES productos  ( id_producto )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT  fk_lista_compras_COMPRAS
    FOREIGN KEY ( codigo_compra )
    REFERENCES COMPRAS  ( codigo_compra )
    ON DELETE CASCADE
    ON UPDATE CASCADE;
	