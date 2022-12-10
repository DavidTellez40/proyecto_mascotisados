/*---------------------------------------------------CREAR BDD------------------------------------------------------------------------*/
create database mascotisados;
use mascotisados;

/*-------------------------------------------------CREAR TABLAS----------------------------------------------------------------------- */
create table roles(
  codigo_rol int not null auto_increment,
  nombre_rol char(10) not null,
  primary key (codigo_rol));
  
   create table usuarios(
  id_usuario int not null auto_increment,
  codigo_rol int not null,
  primer_nombre char(10) not null,
  apellido_paterno char(15) not null,
  apellido_materno char(15) not null,
  email varchar(45) not null,
  passaword varchar(15) not null,
  nickname varchar(18) not null,
  unique index email_unique (email),
  unique index nickname_unique (nickname),
  index ind_usuarios_roles (codigo_rol),
  primary key (id_usuario),
  constraint fk_usuarios_roles
    foreign key (codigo_rol)
    references roles (codigo_rol));
    
        create table clientes(
  id_usuario int not null,
  numero_tel int not null,
  identificacion int not null,
  unique index numero_tel_unique (numero_tel),
  unique index identificacion_unique (identificacion),
  index ind_clientes_usuarios (id_usuario),
  primary key (id_usuario),
  constraint fk_clientes_usuarios
    foreign key (id_usuario)
    references usuarios (id_usuario));
    
      create table metodo_pago(
  codigo_pago int not null auto_increment,
  tipo_de_pago char(20) not null,
  primary key (codigo_pago));
  
  create table estado_pago(
  id_estado int not null auto_increment,
  referencia varchar(30) not null,
  primary key (id_estado));
  
  create table pedidos(
  codigo_pedido int not null auto_increment,
  id_usuario int not null,
  id_estado int not null,
  codigo_pago int not null,
  fecha_pedido date not null,
  precio_subtotal decimal(10,2) not null,
  iva decimal(5,2) null default 0,
  direccion_envio varchar(100) null default 'no_aplica',
  primary key (codigo_pedido),
  index ind_pedidos_cliente (id_usuario),
  index ind_pedidos_metodo_pago (codigo_pago),
  index ind_pedidos_estado_pago (id_estado),
  constraint fk_pedido_metodo_pago
    foreign key (codigo_pago)
    references metodo_pago (codigo_pago),
  constraint fk_pedido_cliente
    foreign key (id_usuario)
    references clientes (id_usuario),
  constraint fk_pedidos_estado_pago
    foreign key (id_estado)
    references estado_pago (id_estado));
    
    create table marca_producto(
  id_marca int not null auto_increment,
  tipo_marca varchar(30) not null,
  primary key (id_marca));
  
  create table categorias (
  id_categoria int not null auto_increment,
  clase varchar(30) not null,
  primary key (id_categoria));
  
create table productos(
  id_producto int not null auto_increment,
  id_marca int not null,
  id_categoria int not null,
  nombre varchar(100) not null,
  unidad_de_medida char(5) not null,
  precio_unitario_venta decimal(10,2) not null,
  descripcion_gneral varchar(255) not null,
  stock int not null,
  primary key (id_producto),
  index ind_producto_marca_producto (id_marca),
  index ind_producto_categoria (id_categoria),
  constraint fk_producto_marca_producto
    foreign key (id_marca)
    references marca_producto (id_marca),
  constraint fk_producto_categoria
    foreign key (id_categoria)
    references categorias (id_categoria));
    
    create table detalle_venta(
  id_producto int not null,
  codigo_pedido int not null,
  cant_product smallint(20) not null,
  index ind_detalle_compra_pedido (codigo_pedido),
  index fk_detalle_compra_producto (id_producto),
  constraint fk_detalle_compra_pedido
    foreign key (codigo_pedido)
    references pedidos (codigo_pedido),
  constraint fk_detalle_compra_producto
    foreign key (id_producto)
    references productos (id_producto));
    
    CREATE TABLE compras(
  codigo_compra INT NOT NULL auto_increment,
  fecha_compra DATE NOT NULL,
  documento INT NOT NULL,
  total__a_pagar DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (codigo_compra));
  
  create table lista_compras(
  id_producto int not null,
  codigo_compra int not null,
  cant int not null,
  precio_unit_compra decimal(10,2) not null,
  index ind_lista_compras_productos (id_producto),
  index ind_lista_compras_compras (codigo_compra),
  constraint fk_lista_compras_productos
    foreign key (id_producto)
    references productos (id_producto),
  constraint fk_lista_compras_compras
    foreign key (codigo_compra)
    references compras (codigo_compra));
    
      /*----------------------------------------------- INSERCIÓN DE REGISTROS------------------------------------------------------------------------*/
    
    insert into roles(nombre_rol)
    values('admin');
     insert into roles( nombre_rol)
    values('empleado');
     insert into roles(nombre_rol)
    values('cliente');
     insert into roles(nombre_rol)
    values('person');
    
    insert into usuarios( codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values( 1, 'carlos', 'gonzales', 'benavides', 'carlosGonzález 1@gmail.com',
    'syyebf3762','Carloz07');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values( 2, 'victor', 'tellez', 'bermudez', 'Tellez2Bermudez@gmail.com',
    'ytah482','TlezBer');
    insert into usuarios( codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values(3, 'carolina', 'salcedo', 'garzon', 'Carolina3Salcedo@gmail.com',
    'syte_&','lina_02');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values(3, 'diego', 'lopez', 'prieto', 'Prieto Diego83@gmail.com',
    'sjje09','Diego#12');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values(3, 'karen', 'bolaños', 'valenzuela', 'Bolaños karen5@gmail.com',
    'djjhf27*','Blolmex');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values( 3, 'mateo', 'sanchez', 'ortiz', 'Ortiz 3Mateo@gmail.com',
    'msteo05d','ortizTXT');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values(3, 'oscar', 'gomez', 'mejia', 'Oscar7@gmail.com',
    'oscarito_tu','arorgar8_$');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values(3, 'angie', 'castillo', 'mora', 'AngieMora@gmail.com',
    'amazing262','ema0ss');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values( 3, 'ximena', 'cifuentes', 'gutierrez', 'Ximena9Cifuentes @gmail.com',
    'Escand34','xiwily_zt');
    insert into usuarios(codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname) values(4, 'stiven', 'cardenas', 'ordoñez', 'Ordóñez Stiven 10@gmail.com',
    'ostiñz21','Stiven_Dixxon');
    
    insert into clientes ( id_usuario, numero_tel, identificacion) 
    values(3, 7843214, 1024576875);
    insert into clientes ( id_usuario, numero_tel, identificacion) 
    values(4, 7041407, 1025456871);
    insert into clientes ( id_usuario, numero_tel, identificacion) 
    values(5, 4864286, 52642815);
    insert into clientes ( id_usuario, numero_tel, identificacion) 
    values(6, 7041409, 39814652);
    insert into clientes ( id_usuario, numero_tel, identificacion) 
    values(7, 8503220, 1022915830);
    insert into clientes ( id_usuario, numero_tel, identificacion) 
    values(8, 65443449, 1000733154);
    insert into clientes ( id_usuario, numero_tel, identificacion) 
    values(9, 8256732, 1000788393);
    
    insert into metodo_pago( tipo_de_pago) values('pse');
	insert into metodo_pago( tipo_de_pago) values('tarjeta_credito');
    insert into metodo_pago( tipo_de_pago) values('tarjeta Débito ');
	insert into metodo_pago( tipo_de_pago) values('efectivo');
    
    insert into estado_pago(referencia) values('pagado');
    insert into estado_pago(referencia) values('rechazado');
    insert into estado_pago(referencia) values('pendiente');
    
    insert into pedidos(id_usuario, id_estado, codigo_pago, fecha_pedido, precio_subtotal, 
    iva, direccion_envio) values( 3, 1, 1, '2022-09-22', '64650.06',0,'carrera 5 este # 19f');
    insert into pedidos(id_usuario, id_estado, codigo_pago, fecha_pedido, precio_subtotal, 
    iva, direccion_envio) values( 4, 1, 2, '2022-04-18', '302000.01',0,'diagolal 76c #48b sur');
	insert into pedidos(id_usuario, id_estado, codigo_pago, fecha_pedido, precio_subtotal, 
    iva, direccion_envio) values( 5, 3, 3, '2022-05-20', '1152500.11',0,'av 19# 78f sur');
    insert into pedidos(id_usuario, id_estado, codigo_pago, fecha_pedido, precio_subtotal, 
    iva, direccion_envio) values( 6, 2, 1, '2022-05-21', '72220',0, 'transv.16#32F');
    insert into pedidos(id_usuario, id_estado, codigo_pago, fecha_pedido, precio_subtotal, 
    iva, direccion_envio) values( 7, 3, 1, '2022-05-21', '72220',0, 'kra7#2489');
    insert into pedidos(id_usuario, id_estado, codigo_pago, fecha_pedido, precio_subtotal, 
    iva, direccion_envio) values( 8, 2, 2, '2022-05-21', '72220',0, 'calle45a#22sur21');
    insert into pedidos(id_usuario, id_estado, codigo_pago, fecha_pedido, precio_subtotal, 
    iva, direccion_envio) values( 9, 1, 4, '2022-05-21', '72220',0, 'no_aplica');
    
    insert into marca_producto( tipo_marca) values('Guaumor');
    insert into marca_producto( tipo_marca) values('Pedigree');
    insert into marca_producto( tipo_marca) values('Ganador Premium');
    insert into marca_producto( tipo_marca) values('Max -Premium');
    insert into marca_producto( tipo_marca) values('Equilibrio');
    insert into marca_producto( tipo_marca) values('Miaumor');
    insert into marca_producto( tipo_marca) values('Cat Chow');
    insert into marca_producto( tipo_marca) values('Dogchaow');
    
    insert into categorias(clase) values('comestibles');
    insert into categorias(clase) values('juguetes/accesorios');
    insert into categorias(clase) values('farmacia/nutricion');
    
    
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 1, 1, 'Guaumor - Cachorros Razas Medianas Y Grandes',
    '2kg','21550.02', 'Guaumor - Cachorros Razas Medianas Y Grandes, es libre de colorantes. 
    Tiene proteína de alta calidad para un crecimiento y desarrollo saludable. 
    Prebióticos que fortalecen el sistema inmune, aumentan las defensas y mejoran la salud intestinal.',13);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 1, 1, 'Guaumor - Cachorros Razas Medianas Y Grandes',
    '8kg','72220', 'Guaumor - Cachorros Razas Medianas Y Grandes, es libre de colorantes. 
    Tiene proteína de alta calidad para un crecimiento y desarrollo saludable. 
    Prebióticos que fortalecen el sistema inmune, aumentan las defensas y mejoran la salud intestinal.',24);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 1, 1, 'Guaumor - Cachorros Razas Medianas Y Grandes',
    '17kg','151000.05', 'Guaumor - Cachorros Razas Medianas Y Grandes, es libre de colorantes. 
    Tiene proteína de alta calidad para un crecimiento y desarrollo saludable. 
    Prebióticos que fortalecen el sistema inmune, aumentan las defensas y mejoran la salud intestinal.',16);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 2, 1, 'Guaumor - Cachorros Razas Medianas Y Grandes',
    '20kg','210000', 'Pedigree - Alimento Para Perro Adulto Raza Pequeña, es un alimento para perros adultos de razas
    pequeñas con trozos más pequeños ideal bocas más pequeñas, alimentación 100% completa y
    balanceada, nutrición para que tu perro este sano y protegido. Dale variedad con los irresistibles sobres de Pedigree.',2);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 3, 1, 'Pedigree - Alimento Para Perro Adulto Raza Pequeña',
    '2kg','30000', 'Pedigree - Alimento Para Perro Adulto Raza Pequeña, es un alimento para perros adultos de razas
    pequeñas con trozos más pequeños ideal bocas más pequeñas, alimentación 100% completa y balanceada, 
    nutrición para que tu perro este sano y protegido. Dale variedad con los irresistibles sobres de Pedigree.',14);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 4, 1, 'Max - Premium Adultos Razas Pequeñas Carne, Cereales Y Verduras',
    '15kg','230500', 'Guaumor - Cachorros Razas Medianas Y Grandes, es libre de colorantes. 
    Tiene proteína de alta calidad para un crecimiento y desarrollo saludable. 
    Prebióticos que fortalecen el sistema inmune, aumentan las defensas y mejoran la salud intestinal.',18);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 5, 1, 'Equilibrio - F Gato Filhote',
    '1,5kg','62750','Equilibrio gatos filhotes, Fos, mos y probióticos: auxilia en el equilibrio de la flora intestinal,
    yucca schidigera, contribuye para la reducción del olor de las heces. dha: contribuye para el desarrollo cognitivo',36);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 6, 1, 'Miaumor Adulto',
    '2kg','21550.02', 'Guaumor - Cachorros Razas Medianas Y Grandes, es libre de colorantes. 
    Tiene proteína de alta calidad para un crecimiento y desarrollo saludable. 
    Prebióticos que fortalecen el sistema inmune, aumentan las defensas y mejoran la salud intestinal.',25);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 7, 1, 'Cat Chow - Adultos Activos Carne',
    '7kg','32950', 'Cat Chow - Adultos Activos Carne, Ayuda a fortalecer las defensas naturales, con dha para favorecer el
    desarrollo del cerebro. vitamina a: ayuda a mantener una visión saludable. vitamina c: ayuda a combatir los
    radicales libres. vitamina e: esencial para la respuesta inmune del organismo. selenio: actúa conjuntamente 
    con la vitamina e como antioxidante celular.',9);
    insert into productos( id_marca, id_categoria, nombre, unidad_de_medida, 
    precio_unitario_venta, descripcion_gneral, stock) values( 8, 1, 'Dog Chow Perros Adultos Razas Medianas y Grandes Vida Sana',
    '22,7kg','196114.02', '"Es un concentrado ideal para cuidar la digestión de perros adultos de razas grandes.
Su fórmula contiene elemento de calidad que favorecerán la salud y vitalidad.
Tiene un sabor muy palatable que tu perro disfrutará.',20);

insert into detalle_venta(id_producto, codigo_pedido, cant_product)
values(1, 1, 3);
insert into detalle_venta(id_producto, codigo_pedido, cant_product)
values(3, 2, 2);
insert into detalle_venta(id_producto, codigo_pedido, cant_product)
values(6, 3, 5);
insert into detalle_venta(id_producto, codigo_pedido, cant_product)
values(5, 7, 1);
insert into detalle_venta(id_producto, codigo_pedido, cant_product)
values(10, 5, 6);
insert into detalle_venta(id_producto, codigo_pedido, cant_product)
values(7, 6, 2);
insert into detalle_venta(id_producto, codigo_pedido, cant_product)
values(8, 7, 5);

insert into compras( fecha_compra, documento, total__a_pagar) values(
'2022-09-22',1022201814, '139600');
insert into compras( fecha_compra, documento, total__a_pagar) values(
'2022-08-19',45879390, '1021500');
insert into compras( fecha_compra, documento, total__a_pagar) values(
'2022-08-24',39765901, '1556478.02');
insert into compras( fecha_compra, documento, total__a_pagar) values(
'2022-07-22',43210900, '25000');
insert into compras( fecha_compra, documento, total__a_pagar) values(
'2022-09-05',1026890926, '412500');

insert into lista_compras(id_producto, codigo_compra, cant, precio_unit_compra)
values(1, 2, 2, 69800);
insert into lista_compras(id_producto, codigo_compra, cant, precio_unit_compra)
values(2, 4, 5, 204300);
insert into lista_compras(id_producto, codigo_compra, cant, precio_unit_compra)
values(3, 6, 7, 322854);
insert into lista_compras(id_producto, codigo_compra, cant, precio_unit_compra)
values(4, 5, 1, 25000);
insert into lista_compras(id_producto, codigo_compra, cant, precio_unit_compra)
values(5, 2, 6, 68750);

/*ORDENAR REGISTROS ACENDENTEMENTE POR NOMBRE_USUARIO*/
select * from usuarios order by primer_nombre asc;

/*------------------------------------------------------SELECT Y JOINS----------------------------------------------------------------*/

select * from clientes;

select*from productos where stock=20;

/*BUSCAR PRUDUCTO CION FECHA DE PEDIDO*/
SELECT p.nombre,m.tipo_marca,d.cant_product,pe.fecha_pedido,pe.precio_subtotal
FROM detalle_venta d
join lista_compras l on d.id_producto = l.id_producto
join productos p on p.id_producto =  l.id_producto
join marca_producto m on p.id_marca = m.id_marca
join pedidos pe on pe.codigo_pedido = d.codigo_pedido
where pe.codigo_pedido = 1;

/*ORGANIZAR LOS USUARIOS POR TIPO DE ROL*/
select u.primer_nombre,u.apellido_paterno,u.apellido_materno,r.codigo_rol,r.nombre_rol 
from usuarios u join roles r on r.codigo_rol=u.codigo_rol;

/*BUSCAR TODOS LOS USUARIOS CON TIPO DE ROL EMPLEADO*/
select u.primer_nombre,u.apellido_paterno,u.apellido_materno,r.nombre_rol,u.email
from usuarios u join roles r on r.codigo_rol=u.codigo_rol
where r.codigo_rol = 3;

/*---------------------------------------------------------------FUNCIONES--------------------------------------------------------*/

/*FUNCION PARA CONSULTAR RANGO DE PRECIOS IGUALES O SIMILARES ALGUNO EN ESPECIFICO*/
 delimiter //
create function consul_rango_precio(nom_pr decimal(10,2)) returns int
begin
    declare cant_precio int;
    select count(precio_unitario_venta) into cant_precio from productos where precio_unitario_venta >= nom_pr;
    return cant_precio;
end //
delimiter ;

select consul_rango_precio('100000') as cant;

/*FUNCION PARA CONSULTAR EL CORREO DE ALGUN USUARIO*/
 delimiter //
create function consult_correo(id int) returns varchar(45)
begin
    declare correo varchar(45);
    select email into correo from usuarios where id_usuario = id;
    return correo;
end //
delimiter ;
select consult_correo(2) as 'correo  del usuario';


/*---------------------------------------------------------------VISTAS------------------------------------------------------------------*/

/*VISTA PARA MOSTRAR USUARIOS CON TIPO DE ROL*/
create view 
vista_usuario_roles as
select  u.primer_nombre, u.apellido_materno, u.apellido_paterno,r.nombre_rol as roles
from usuarios as u
inner join roles as r on  u.codigo_rol=r.codigo_rol;

select * from vista_usuario_roles;

/*VISTA PARA MOSTRAR EL STOCK DE LOS PRODUCTOS CON CATEGORIA Y PRECIO DE VENTA*/
create view 
vista_producto_categoria as
select  p.id_producto, p.precio_unitario_venta,p.stock,c.clase as categorias
from productos as p
inner join categorias as c on  p.id_categoria=c.id_categoria;

select * from vista_producto_categoria;

/*-------------------------------------------------------------------PROCEDIMIENTOS----------------------------------------------------------*/

/*PROCEDIMIENTO PARA BUSCAR EL STOCK DE UN PRODUCTO */
drop procedure if exists Proc_productos_stock;

delimiter //
create procedure Proc_productos_stock()
begin
select nombre,precio_unitario_venta,stock
from productos
where stock<3;
end //
delimiter ;

call Proc_productos_stock ();

/*PROCEDIMIENTO PARA CONOCER LOS DATOS DE  UN USUARIO TIPO CLIENTE*/
drop procedure if exists Proc_usuario_pedidos;

delimiter //
create procedure Proc_usuario_pedidos()
begin
select primer_nombre,apellido_materno,apellido_paterno, email 
from usuarios
where codigo_rol=3 ;
end //
delimiter ;

call Proc_usuario_pedidos();

/*----------------------------------------------------------------TRIGGERS--------------------------------------------------------------------------------*/

/* COMPRA STOCK*/
delimiter $$
create trigger before_compra_insert
	before insert on lista_compras
	for each row
begin
	update productos set
	stock = productos.stock + new.cant
	where new.id_producto = productos.id_producto;
end;$$
delimiter ;

/*VENTA STOCK*/

delimiter $$
create trigger before_pedido_insert
	before insert on detalle_venta
	for each row
begin
	update productos set
	stock = productos.stock - new.cant_product
	where new.id_producto = productos.id_producto;
end;$$
delimiter ;

/* ELIMINACION DE USUARIOS*/

create trigger 
eliminacion_datos_user before delete on usuarios 
for each row insert into registros_eliminados (id_usuario, codigo_rol, primer_nombre, apellido_paterno, apellido_materno, 
    email, passaword, nickname, fecha_eliminacion) values( old.id_usuario, old.codigo_rol, old.primer_nombre, old.apellido_paterno, old.apellido_materno, 
    old.email, old.passaword, old.nickname,now());


    /*CREAR TABLA PARA TRIGGER*/
    create table registros_eliminados(
  id_usuario int not null,
  codigo_rol int not null,
  primer_nombre char(10) not null,
  apellido_paterno char(15) not null,
  apellido_materno char(15) not null,
  email varchar(45) not null,
  passaword varchar(15) not null,
  nickname varchar(18) not null,
  fecha_eliminacion date not null,
  primary key (id_usuario));