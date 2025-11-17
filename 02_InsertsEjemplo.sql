USE EcommerceDB;
GO

-- ==========================
-- CATEGORIAS
-- ==========================
INSERT INTO Categoria (Nombre, Descripcion) VALUES
('Componentes', 'Procesadores, motherboards, memorias'),
('Periféricos', 'Mouse, teclados y auriculares'),
('Almacenamiento', 'SSD, HDD y memorias externas'),
('Monitores', 'Pantallas LED, LCD y curvos'),
('Accesorios', 'Cables, adaptadores, soportes');

-- ==========================
-- PRODUCTOS
-- ==========================
INSERT INTO Producto (Nombre, Descripcion, Precio, StockActual, IdCategoria) VALUES
('SSD Kingston NV2 1TB', 'Unidad SSD NVMe PCIe 4.0', 95000, 10, 3),
('Mouse Logitech G203', 'Mouse gamer RGB', 28000, 25, 2),
('Teclado Redragon Kumara', 'Teclado mecánico retroiluminado', 42000, 15, 2),
('Procesador Intel i5 12400F', 'CPU de 6 núcleos para gaming', 180000, 8, 1),
('Cable HDMI 2.1 2m', 'Cable de alta velocidad para 4K/8K', 9000, 30, 5),
('Monitor Samsung 27 Curvo', 'Monitor LED curvo Full HD', 190000, 5, 4);

-- ==========================
-- CLIENTES
-- ==========================
INSERT INTO Cliente (Nombre, Apellido, Dni, Direccion, Telefono, Email) VALUES
('Lucas', 'Pompilio', '40123123', 'Av. Belgrano 1234', '1123456789', 'lucas@mail.com'),
('Carla', 'Rivas', '38222111', 'Mitre 900', '1132225566', 'carla@mail.com'),
('Federico', 'Lopez', '39011777', 'Av. Libertad 500', '1144449999', 'fede@mail.com'),
('Sofia', 'Martinez', '37555111', 'Maipú 2100', '1122288899', 'sofia@mail.com');

-- ==========================
-- METODO DE PAGO
-- ==========================
INSERT INTO MetodoPago (Tipo, Descripcion) VALUES
('Efectivo', 'Pago en efectivo en el local'),
('Tarjeta de crédito', 'Visa / Mastercard / AMEX'),
('Transferencia', 'Transferencia bancaria');

-- ==========================
-- PROVEEDORES
-- ==========================
INSERT INTO Proveedor (RazonSocial, Cuit, Direccion, Telefono, Email) VALUES
('TechWorld SA', '30-12345678-9', 'Av. Corrientes 1200', '1133344455', 'compras@techworld.com'),
('DataLink SRL', '30-98765432-1', 'Rivadavia 2500', '1166677788', 'ventas@datalink.com'),
('HardComp SRL', '30-11223344-5', 'Pueyrredón 321', '1144456677', 'contacto@hardcomp.com');

-- ==========================
-- COMPRAS
-- ==========================
INSERT INTO Compra (Fecha, Total, IdProveedor) VALUES
('2025-10-01', 950000, 1),
('2025-10-05', 450000, 2);

-- ==========================
-- DETALLE COMPRA
-- ==========================
INSERT INTO DetalleCompra (IdCompra, IdProducto, Cantidad, PrecioUnitario) VALUES
(1, 1, 5, 80000),
(1, 2, 10, 20000),
(2, 3, 5, 30000);

-- ==========================
-- VENTAS
-- ==========================
INSERT INTO Venta (Fecha, Total, IdCliente, IdMetodoPago) VALUES
('2025-11-01', 315000, 1, 2),
('2025-11-03', 80000, 2, 3),
('2025-11-05', 370000, 3, 1);

-- ==========================
-- DETALLE VENTA
-- ==========================
INSERT INTO DetalleVenta (IdVenta, IdProducto, Cantidad, PrecioUnitario) VALUES
(1, 1, 1, 95000),
(1, 2, 2, 28000),
(2, 3, 2, 42000),
(3, 6, 1, 190000);

