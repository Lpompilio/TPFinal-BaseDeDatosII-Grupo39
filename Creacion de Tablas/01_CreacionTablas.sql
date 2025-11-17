-- TP FINAL - BASE DE DATOS II
-- Sistema de Gestión E-commerce
-- =========================================

CREATE DATABASE EcommerceDB;
GO
USE EcommerceDB;
GO

-- =======================
-- TABLA: CATEGORIAS
-- =======================
CREATE TABLE Categoria (
    IdCategoria INT IDENTITY PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(100)
);

-- =======================
-- TABLA: PRODUCTOS
-- =======================
CREATE TABLE Producto (
    IdProducto INT IDENTITY PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(100),
    Precio DECIMAL(10,2) NOT NULL,
    StockActual INT NOT NULL,
    IdCategoria INT NOT NULL FOREIGN KEY REFERENCES Categoria(IdCategoria)
);

-- =======================
-- TABLA: CLIENTES
-- =======================
CREATE TABLE Cliente (
    IdCliente INT IDENTITY PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Dni NVARCHAR(20) UNIQUE NOT NULL,
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(20),
    Email NVARCHAR(100)
);

-- =======================
-- TABLA: METODOS DE PAGO
-- =======================
CREATE TABLE MetodoPago (
    IdMetodoPago INT IDENTITY PRIMARY KEY,
    Tipo NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(100)
);

-- =======================
-- TABLA: VENTAS
-- =======================
CREATE TABLE Venta (
    IdVenta INT IDENTITY PRIMARY KEY,
    Fecha DATE NOT NULL,
    Total DECIMAL(10,2),
    IdCliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(IdCliente),
    IdMetodoPago INT NOT NULL FOREIGN KEY REFERENCES MetodoPago(IdMetodoPago)
);

-- =======================
-- TABLA: DETALLE VENTAS
-- =======================
CREATE TABLE DetalleVenta (
    IdDetalleVenta INT IDENTITY PRIMARY KEY,
    IdVenta INT NOT NULL FOREIGN KEY REFERENCES Venta(IdVenta),
    IdProducto INT NOT NULL FOREIGN KEY REFERENCES Producto(IdProducto),
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL
);

-- =======================
-- TABLA: PROVEEDORES
-- =======================
CREATE TABLE Proveedor (
    IdProveedor INT IDENTITY PRIMARY KEY,
    RazonSocial NVARCHAR(100) NOT NULL,
    Cuit NVARCHAR(20) UNIQUE NOT NULL,
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(20),
    Email NVARCHAR(100)
);

-- =======================
-- TABLA: COMPRAS
-- =======================
CREATE TABLE Compra (
    IdCompra INT IDENTITY PRIMARY KEY,
    Fecha DATE NOT NULL,
    Total DECIMAL(10,2),
    IdProveedor INT NOT NULL FOREIGN KEY REFERENCES Proveedor(IdProveedor)
);

-- =======================
-- TABLA: DETALLE COMPRAS
-- =======================
CREATE TABLE DetalleCompra (
    IdDetalleCompra INT IDENTITY PRIMARY KEY,
    IdCompra INT NOT NULL FOREIGN KEY REFERENCES Compra(IdCompra),
    IdProducto INT NOT NULL FOREIGN KEY REFERENCES Producto(IdProducto),
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL
);
