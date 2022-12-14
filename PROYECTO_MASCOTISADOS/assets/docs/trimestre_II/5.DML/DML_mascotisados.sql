------------------------------------------------------
--INSERTAR ROLES A LA TABLA--
INSERT INTO roles VALUES
(1, 'admin'),
(2, 'user'),
(3, 'customer'),
(4, 'seller');

--Insertar Usuarios y su información a la tabla--
INSERT INTO usuario VALUES
(null, '1', null, 'Andres', 'Ruiz', 'perez', 'andres5220@gmail.com', 'XP19950704ar','andres95'),
(null, '3', null, 'Ana', 'jimenez', 'diaz', 'ana5842@gmail.com', 'jd1992841ghd','ana9208'),
(null, '2', null, 'felipe', 'rodriguez', 'lerma', 'felipe98@gmail.com', 'felipe1998rl' , 'felipe98'),
(null, '4', null, 'jose', 'cueva', 'suarez', 'josecueva7524@gmail.com', 'cueva200105cs','josecs2001');

-- 1.2. Actualizar. -------------------------------------------------------------------- --
--      UPDATE __ SET __ = __ WHERE __ = __ : ------------------------------------------ --
-- ------------------------------------------------------------------------------------- --
UPDATE roles SET 
nombre_rol = 'person'
WHERE codigo_rol = 3;
UPDATE usuario SET 
id_usuario = '2'
WHERE id_usuario = '4';
-- -----Crear una nueva tabla con llave primaria---------------------------------
CREATE TABLE ClientesFrecuentes (
  nombre varchar(20),
  clave varchar(10),
  primary key(nombre)
 );

- 2.1. Generales. --------------------------------------------------------------------- --
--      SELECT * FROM __ : ------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM usuario;
-- ------------------------------------------------------------------------------------- --
-- 2.2. Específicas. ------------------------------------------------------------------- --
--      SELECT __ , __ FROM __ : ------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT id_usuario, email, codigo_rol FROM usuario;
-- ----------------------------------------------------------
- 2.3. Con Criterios. ----------------------------------------------------------------- --
--      SELECT __ , __ FROM __ WHERE __ = __ : ----------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_rol, id_usuario, email FROM usuario
WHERE codigo_rol = 3;
-- ------------------------------------------------------------------------------------- --
-- 2.4. Con Operadores Lógicos. -------------------------------------------------------- --
--      OR, AND, NOT : ----------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
-- 2.4.1. O [OR] . --------------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ OR __ = __ : ---------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT codigo_rol, id_usuario, email FROM usuario 
WHERE codigo_rol = 2 OR codigo_rol = 3;
-- ------------------------------------------------------------------------------------- --
-- 2.4.2. Y [AND] . -------------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ AND __ = __ : --------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT id_usuario FROM usuario 
WHERE codigo_rol = 4 AND codigo_rol = 3;
-- ------------------------------------------------------------------------------------- --
---------------------------------- --
-- 2.5.1. Diferente [<>] . -------------
SELECT * FROM inventario WHERE stock_disponible >= 10;
-- ------------------------------------------------------------------------------------- --
-- 2.5.2. Menor que [<] . -------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ < __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM inventario WHERE gastos_inversion < 10000000;
-- ------------------------------------------------------------------------------------- --
-- 2.5.3. Mayor que [>] . -------------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM inventario WHERE total_venta > 500000;
-- ------------------------------------------------------------------------------------- --
-- 2.5.4. Menor o igual que [<=] . ----------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM inventario WHERE total_venta <= 500000;
-- ------------------------------------------------------------------------------------- --
-- 2.5.5. Mayor o igual que [>=] . ----------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ > __ : --------------------------------------- --
-- ------------------------------------------------------------------------------------- --
-- 2.6.1. Comodín [LIKE '_%'] . -------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ LIKE '_%' : ---------------------------------- --
-- --selecciona las marcas de productos que comienzan con j----------------------------------------------------------------------------------- --
SELECT * FROM marca_producto WHERE id_marca LIKE 'j%';

-- --selecciona las marcas de productos que terminan con a--
SELECT * FROM marca_producto WHERE id_marca LIKE '%a';

-- --selecciona las usuarios que comienzan con c----------------------------------------------------------------------------------- --
SELECT * FROM usuario WHERE primer_nombre LIKE 'c%';

-- 2.6.2. Entre [BETWEEN] . ------------------------------------------------------------ --
--        SELECT __ , __ FROM __ WHERE __ BETWEEN __ AND __ : -------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM credencial 
WHERE fecha_nacimiento BETWEEN '1960-01-01' AND '1989-01-01';

- 1.3. Eliminar. ---------------------------------------------------------------------- --
--      DELETE FROM __ WHERE __ = __ : ------------------------------------------------- --
-- ------------------------------------------------------------------------------------- --
DELETE FROM usuario 
WHERE id_usuario = '4';

-- 2.7.1. Ascendente [ASC] . ----------------------------------------------------------- --
--        SELECT __ , __ FROM __ WHERE __ = __ ORDER BY __ ASC; : ---------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT * FROM pedido 
WHERE precio_subtotal >= 1000000 
ORDER BY fecha_pedido;

SELECT * FROM producto
WHERE precio_unitario_venta <= 5000 OR precio_unitario_compra <= 4000 
ORDER BY precio_unitario_venta ASC;

SELECT * FROM detalle_compra
WHERE cant_product <=25
ORDER BY cant_product ASC;
-- ----------------------------------------

-- 2.8.3. Máximo [MAX()] . ------------------------------------------------------------- --
--        SELECT __ , MAX( __ ) FROM __ GROUP BY __ : -------------------------------- --
-- ------------------------------------------------------------------------------------- --
SELECT id_producto, MAX(precio_unitario_compra) FROM producto
WHERE precio_unitario_venta <= 15000;
SELECT id_producto, MAX(precio_unitario_venta) FROM producto 
GROUP BY id_marca;

