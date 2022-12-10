-- ----------------------------------------------------------------------------------------------------------
-- ESTRUCTURA BDD
-- ----------------------------------------------------------------------------------------------------------
CREATE SCHEMA Mascotisados DEFAULT CHARACTER SET utf8;
USE Mascotisados;

-- ----------------------------------------------------------------------------------------------------------
-- TABLA ROLES
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE roles(
  codigo_rol INT NOT NULL AUTO_INCREMENT,
  nombre_rol CHAR(10) NOT NULL,
  PRIMARY KEY (codigo_rol)
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA USUARIOS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE usuarios(
  id_usuario INT NOT NULL AUTO_INCREMENT,
  codigo_rol INT NOT NULL,
  primer_nombre CHAR(10) NOT NULL,
  apellido_paterno CHAR(15) NOT NULL,
  apellido_materno CHAR(15) NOT NULL,
  email VARCHAR(45) NOT NULL,
  passaword VARCHAR(15) NOT NULL,
  nickname VARCHAR(18) NOT NULL,
  UNIQUE INDEX email_UNIQUE (email),
  UNIQUE INDEX nickname_UNIQUE (nickname),
  INDEX ind_usuarios_roles (codigo_rol),
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_usuarios_roles
    FOREIGN KEY (codigo_rol)
    REFERENCES roles (codigo_rol)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- ----------------------------------------------------------------------------------------------------------
-- TABLA CLIENTES
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE clientes(
  id_usuario INT NOT NULL,
  numero_tel INT NOT NULL,
  identificacion INT NOT NULL,
  UNIQUE INDEX numero_tel_UNIQUE (numero_tel),
  UNIQUE INDEX identificacion_UNIQUE (identificacion),
  INDEX ind_clientes_usuarios (id_usuario),
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_clientes_usuarios
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- ----------------------------------------------------------------------------------------------------------
-- TABLA METODO PAGO
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE metodo_pago(
  codigo_pago INT NOT NULL AUTO_INCREMENT,
  tipo_de_pago CHAR(20) NOT NULL,
  PRIMARY KEY (codigo_pago)
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA ESTADO PAGO
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE estado_pago(
  id_estado INT NOT NULL AUTO_INCREMENT,
  referencia VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_estado)
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA PEDIDOS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE pedidos(
  codigo_pedido INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_estado INT NOT NULL,
  codigo_pago INT NOT NULL,
  fecha_pedido DATE NOT NULL,
  precio_subtotal DECIMAL(10,2) NOT NULL,
  iva DECIMAL(5,2) NULL DEFAULT 0,
  direccion_envio VARCHAR(100) NULL DEFAULT 'no_aplica',
  PRIMARY KEY (codigo_pedido),
  INDEX ind_pedidos_cliente (id_usuario),
  INDEX ind_pedidos_metodo_pago (codigo_pago),
  INDEX ind_pedidos_estado_pago (id_estado),
  CONSTRAINT fk_pedido_metodo_pago
    FOREIGN KEY (codigo_pago)
    REFERENCES metodo_pago (codigo_pago)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (id_usuario)
    REFERENCES clientes (id_usuario)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_pedidos_estado_pago
    FOREIGN KEY (id_estado)
    REFERENCES estado_pago (id_estado)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA MARCA PRODUCTO
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE marca_producto(
  id_marca INT NOT NULL AUTO_INCREMENT,
  tipo_marca VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_marca)
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA CATEGORIAS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE categorias (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  clase VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_categoria)
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA PRODUCTOS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE productos(
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_marca INT NOT NULL,
  id_categoria INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  unidad_de_medida CHAR(5) NOT NULL,
  precio_unitario_venta DECIMAL(10,2) NOT NULL,
  descripcion_gneral VARCHAR(255) NOT NULL,
  stock INT NOT NULL,
  PRIMARY KEY (id_producto),
  INDEX ind_producto_marca_producto (id_marca),
  INDEX ind_producto_categoria (id_categoria),
  CONSTRAINT fk_producto_marca_producto
    FOREIGN KEY (id_marca)
    REFERENCES marca_producto (id_marca)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_producto_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES categorias (id_categoria)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA DETALLE VENTA
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE detalle_venta(
  id_producto INT NOT NULL,
  codigo_pedido INT NOT NULL,
  cant_product SMALLINT(20) NOT NULL,
  INDEX ind_detalle_compra_pedido (codigo_pedido),
  INDEX fk_detalle_compra_producto (id_producto),
  CONSTRAINT fk_detalle_compra_pedido
    FOREIGN KEY (codigo_pedido)
    REFERENCES pedidos (codigo_pedido)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_detalle_compra_producto
    FOREIGN KEY (id_producto)
    REFERENCES productos (id_producto)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA COMPRAS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE compras(
  codigo_compra INT NOT NULL,
  fecha_compra DATE NOT NULL,
  documento INT NOT NULL,
  total__a_pagar DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (codigo_compra)
  )ENGINE = InnoDB;
-- ----------------------------------------------------------------------------------------------------------
-- TABLA LISTA COMPRAS
-- ----------------------------------------------------------------------------------------------------------
CREATE TABLE lista_compras(
  id_producto INT NOT NULL,
  codigo_compra INT NOT NULL,
  cant INT NOT NULL,
  precio_unit_compra DECIMAL(10,2) NOT NULL,
  INDEX ind_lista_compras_productos (id_producto),
  INDEX ind_lista_compras_compras (codigo_compra),
  CONSTRAINT fk_lista_compras_productos
    FOREIGN KEY (id_producto)
    REFERENCES productos (id_producto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_lista_compras_compras
    FOREIGN KEY (codigo_compra)
    REFERENCES compras (codigo_compra)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


------Insertar valores a las tablas----
INSERT INTO categorias VALUES
(null, 'comestibles'),
(null, 'Juguetes/accesorios'),
(null, 'Farmacia/nutrición');

INSERT INTO marca_producto VALUES
(null, 'Guaumor' ),
(null, 'pedigree'),
(null, 'Ganador Premium'),
(null, 'Max-Premium'),
(null, 'Equilibrio'),
(null, 'Miaumor'),
(null, 'Cat Chow'),
(null, 'DogChow');

- -----Crear una nueva tabla con llave primaria--------
CREATE TABLE ClientesFrecuentes (
  nombre varchar(20),
  clave varchar(10),
  primary key(nombre)
 );

------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM usuarios;
-- ------------------------------------------------------------------------------------- --
-- 2.2. Específicas. ------------------------------------------------------------------- --
--      SELECT __ , __ FROM __ : ------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT id_usuario, email, codigo_rol FROM usuarios;
-- ----------------------------------------------------------
- 2.3. Con Criterios. ----------------------------------------------------------------- --
--      SELECT __ , __ FROM __ WHERE __ = __ : ----------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_rol, id_usuario, email FROM usuarios
WHERE codigo_rol = 3;
-- ---------------------------------
- 2.4.1. O [OR] . --------------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ OR __ = __ : ---------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_rol, id_usuario, email FROM usuarios 
WHERE codigo_rol = 2 OR codigo_rol = 3;
-- ------------------------------------------------------------------------------------- --
-- 2.4.2. Y [AND] . -------------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ AND __ = __ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT id_usuario FROM usuarios 
WHERE codigo_rol = 4 AND codigo_rol = 3;
-- ------------------------------------------------------------------------------------- --
---------------------------------- --
-- 2.5.1. Diferente [<>] . -------------
SELECT * FROM productos WHERE stock >= 10;
-- ------------------------------------------------------------------------------------- --
-- 2.5.2. Menor que [<] . -------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ < __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM productos WHERE precio_unitario_venta < 100000;
-- ------------------------------------------------------------------------------------- --
-- 2.5.3. Mayor que [>] . -------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM lista_compras WHERE precio_unit_compra > 50000;
-- ------------------------------------------------------------------------------------- --
-- 2.5.4. Menor o igual que [<=] . ----------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM compras WHERE total__a_pagar >= 300000;
-- ------------------------------------------------------------------------------------- --
-- 2.5.5. Mayor o igual que [>=] . ----------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- --------------------------------------------------
-- 2.6.1. Comodín [LIKE '_%'] . -------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ LIKE '_%' : ---------------------------------- --
-- --selecciona las marcas de productos que comienzan con j----------------------------------------------------------------------------------- --
SELECT * FROM usuarios WHERE primer_nombre LIKE 'j%';

-- --selecciona las marcas de productos que terminan con w--
SELECT * FROM marca_producto WHERE tipo_marca LIKE '%w';

-- --selecciona las usuarios cuales apellido comienzan con c----------------------------------------------------------------------------------- --
SELECT * FROM usuarios WHERE apellido_paterno LIKE 'c%';

-- 2.6.2. Entre [BETWEEN] . ------------------------------------------------------------ --
--        SELECT __ , __ FROM __ WHERE __ BETWEEN __ AND __ : -------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM pedidos 
WHERE fecha_pedido BETWEEN '2020-01-01' AND '2021-01-01';

- 1.3. Eliminar. ---------------------------------------------------------------------- --
--      DELETE FROM __ WHERE __ = __ : ------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DELETE FROM usuarios 
WHERE id_usuario = '4';

-- 2.7.1. Ascendente [ASC] . ----------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ ORDER BY __ ASC; : ---------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM pedidos 
WHERE precio_subtotal >= 1000000 
ORDER BY fecha_pedido;

SELECT * FROM productos
WHERE precio_unitario_venta <= 5000 OR stock <= 10 
ORDER BY precio_unitario_venta ASC;

SELECT * FROM compras
WHERE total__a_pagar <=250000
ORDER BY fecha_compra ASC;

-- 2.8.3. Máximo [MAX()] . ------------------------------------------------------------- --
--        SELECT __ , MAX( __ ) FROM __ GROUP BY __ : -------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT id_producto, MAX(precio_unitario_venta) FROM productos
WHERE stock <= 50;
SELECT id_producto, MAX(precio_unitario_venta) FROM productos 
GROUP BY id_marca;

--eliminar tabla---
DROP TABLE pedidos;


-----Eliminar base de datos---
DROP DATABASE mascotisados;

INSERT INTO pedidos VALUES
(null, 3 , 1 , 1 ,'22-09-2022' , 64650 , 0 ,'carrera 5 este # 19f'
),
(null, 4 , 1 , 2 ,'18-04-2022', 302000 , 0 ,'diagolal 76c #48b sur'
),
(null, 5 , 3 , 3 ,'18-04-2022', 1152500 , 0 ,'diagolal 76c #48b sur'
),
(null, 6 , 2 , 1 ,'21-05-2022', 72220 , 0 ,'diagolal 76c #48b sur'
),
(null, 7 , 3 , 1 ,'21-05-2022', 1177284 , 0 ,'diagolal 76c #48b sur'
),
(null, 8 , 2 , 2 ,'18-02-2022', 125500 , 0 ,'calle45a#22sur21'
),
(null, 9 , 1 , 4 ,'20-07-2022', 479000 , 0 ,' Calle100-50'
);