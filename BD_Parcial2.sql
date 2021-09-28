
CREATE DATABASE Parcial_Analisis;
USE Parcial_Analisis;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaProveedores`()  BEGIN
    select codigo_proveedor as ID, nombre_proveedor, direccion_proveedor, telefono_proveedor, nit_proveedor, estatus_proveedor from proveedores; 
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaCompras_detalle`()  BEGIN
    select documento_compraenc as ID, codigo_producto, cantidad_compradet, costo_compradet, codigo_bodega from compras_detalle; 
END$$

DELIMITER ;



create table if not exists proveedores
(
    codigo_proveedor VARCHAR(5) PRIMARY KEY,
    nombre_proveedor VARCHAR(60),
    direccion_proveedor VARCHAR(60),
    telefono_proveedor VARCHAR(50),
    nit_proveedor VARCHAR(50),
    estatus_proveedor VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

create table if not exists marcas
(
    codigo_marca VARCHAR(5) PRIMARY KEY,
    nombre_marca VARCHAR(60),
    estatus_marca VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

create table if not exists productos
(
    codigo_producto VARCHAR(18) PRIMARY KEY,
    nombre_producto VARCHAR(60),
    codigo_linea VARCHAR(5),
    codigo_marca VARCHAR(5),
    existencia_producto FLOAT(10,2),
    estatus_producto VARCHAR(1),
    FOREIGN KEY (codigo_marca) REFERENCES marcas(codigo_marca)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

create table if not exists bodegas
(
    codigo_bodega VARCHAR(5) PRIMARY KEY,
    nombre_bodega VARCHAR(60),
    estatus_bodega VARCHAR(1)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

create table if not exists existencias
(
    codigo_bodega VARCHAR(5),
    nombre_bodega VARCHAR(60),
    codigo_producto VARCHAR(18),
    saldo_existencia FLOAT(10,2),
    PRIMARY KEY (codigo_bodega, codigo_producto),
    FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

create table if not exists compras_encabezado
(
    documento_compraenca VARCHAR(10) PRIMARY KEY,
    codigo_proveedor VARCHAR(5),
    fecha_compraenca DATE,
    total_compraenca FLOAT(10,2),
    estatus_compraenca VARCHAR(1),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedores(codigo_proveedor)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

create table if not exists compras_detalle
(
    documento_compraenca VARCHAR(10),
    codigo_producto VARCHAR(18),
    cantidad_compradet FLOAT(10,2),
    costo_compradet FLOAT(10,2),
    codigo_bodega VARCHAR(5),
    PRIMARY KEY (documento_compraenca, codigo_producto),
    FOREIGN KEY (documento_compraenca) REFERENCES compras_encabezado(documento_compraenca),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto),
    FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

create table if not exists pedido
(
    codigo_pedido VARCHAR(5) PRIMARY KEY,
    codigo_proveedor VARCHAR(5),
    nombre_proveedor VARCHAR(60),
    codigo_producto VARCHAR(18),
    nombre_producto VARCHAR(60),
    codigo_bodega VARCHAR(5),
    nombre_bodega VARCHAR(60),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedores(codigo_proveedor),
    FOREIGN KEY (codigo_bodega) REFERENCES bodegas(codigo_bodega),
    FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto)
) ENGINE=INNODB DEFAULT CHARSET=latin1;



