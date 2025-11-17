TP Final – Base de Datos II
Sistema de Gestión para E-commerce (Grupo 39)

Este proyecto implementa la base de datos completa para un sistema de gestión de un e-commerce orientado a productos de informática.
El trabajo incluye el modelado de datos, creación de tablas, carga de datos de prueba, vistas, triggers, procedimientos almacenados y funciones.


Descripción General del Sistema

El sistema administra:

Productos y categorías

Clientes

Proveedores

Compras y ventas

Control automático de stock

Consultas y reportes comerciales

Incluye mecanismos automáticos para mantener la integridad y consistencia de los datos.


Componentes Implementados
✔️ Vistas

vw_ComprasPorProveedor: resumen de compras por proveedor

vw_ProductosConStockBajo: lista de productos con stock crítico

vw_ResumenVentasCliente: ventas totales por cliente

✔️ Triggers

trg_AumentarStockCompra: incrementa stock al registrar compras

trg_DescontarStockVenta: descuenta stock al registrar ventas

✔️ Procesos Almacenados

sp_ActualizarPreciosPorCategoria

sp_ListarVentasPorCliente

sp_BuscarProductoPorNombre

sp_VentasPorRangoDeFechas (opcional)

sp_TotalVendidoEnRangoDeFechas (opcional)

✔️ Funciones

fn_CantidadProductosPorCategoria

fn_TotalGastadoPorCliente


Datos de Prueba

El archivo 02_inserts_prueba.sql contiene una carga completa con datos para todas las tablas de:

Categorías

Productos

Clientes

Métodos de pago

Proveedores

Compras y sus detalles

Ventas y sus detalles

Permite verificar el funcionamiento de los triggers, vistas y procedimientos.


Cómo Probar el Proyecto

Ejecutar 01_creacion_tablas.sql

Ejecutar 02_inserts_prueba.sql

Ejecutar vistas, triggers, SPs y funciones

Probar consultas desde pruebas.sql


Integrantes

Facundo Alberti

Lucas Castro

Lucas Pompilio