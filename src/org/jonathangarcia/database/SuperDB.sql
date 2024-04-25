drop database if exists SuperDB; --

Create database SuperDB;
Use SuperDB;

Create Table Cargos(
	cargoId int not null auto_increment,
    nombreCargo varchar(30) not null,
    descripcionCargo varchar(100) not null,
    Primary key PK_cargoId(cargoId)
);

Create Table CategoriaProductos(
	categoriaProductosId int not null auto_increment,
    nombreCategoria varchar(30) not null,
    descripcionCategoria varchar(100) not null,
    Primary key PK_categoriaProductosId(categoriaProductosId)
);

Create Table Distribuidores(
	distribuidorId int not null auto_increment,
	nombreDistribuidor varchar(30) not null,
    direccionDistribuidor varchar(200) not null,
    nitDistribuidor varchar(15) not null,
    telefonoDistribuidor varchar(15) not null,
    web varchar(50) not null,
    Primary key PK_distribuidorId (distribuidorId)
);

Create Table Compras(
	compraId int not null auto_increment,
    fechaCompra date not null,
    totalCompra decimal(10, 2) not null,
    Primary key PK_compraId (compraId)
);

Create Table Clientes(
	clienteId int not null auto_increment,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    telefono varchar(15) not null,
    direccion varchar(200) not null,
    nit varchar(11) default 'CF',
    Primary key PK_clienteId(clienteId)
);

Create Table Productos(
    productoId int not null auto_increment,
    nombreProducto varchar(50) not null,
    descripcionProducto varchar(100) not null,
    cantidadStock int not null,
    precioVentaUnitario decimal(10, 2) not null,
    precioVentaMayor decimal(10, 2) not null,
    precioCompra decimal(10, 2) not null,
    imagenProducto blob,
    distribuidorId int not null,
    categoriaProductosId int not null,
    Primary Key PK_productoId(productoId),
    Constraint FK_Productos_Distribuidores Foreign Key Productos(distribuidorId)
        References Distribuidores(distribuidorId),
	Constraint FK_Productos_CategoriaProductos Foreign Key Productos(categoriaProductosId)
        References CategoriaProductos(categoriaProductosId)
);

Create Table Promociones(
	promocionId int not null auto_increment,
    precioPromocion decimal(10,2) not null,
    descripcionPromocion varchar(100) not null,
    fechaInicio date not null,
    fechaFinal date not null,
    productoId int not null,
    Primary Key promocionId(promocionId),
    Constraint FK_Promociones_Productos Foreign Key Promociones(productoId)
		References Productos(productoId)
); 

Create Table DetalleCompra(
	detalleCompraId int not null auto_increment,
    cantidadCompra int not null,
    productoId int not null,
    compraId int not null,
    Primary Key PK_detalleCompraId(detalleCompraId),
    Constraint FK_DetalleCompra_Producots Foreign Key DetalleCompra(productoId)
		References Productos(productoId),
	Constraint FK_DetalleCompra_Compras Foreign Key DetalleCompra(compraId)
		References Compras(compraId)
);

Create Table Empleados(
    empleadoId int not null auto_increment,
    nombreEmpleado varchar(30) not null,
    apellidoEmpleado varchar(30),
    sueldo decimal(10,2),
    horaEntrada time,
    horaSalida time,
    cargoId int not null,
    encargadoId int not null,
    Primary Key PK_empleadoId(empleadoId),
    Constraint FK_Productos_Cargos Foreign Key Productos(cargoId)
        References Cargos(cargoId),
    Constraint FK_encargadoId Foreign Key Empleados(encargadoId)
        References Empleados(empleadoId)
);

Create Table Facturas(
    facturaId int not null auto_increment,
    fecha date not null,
    hora time not null,
    clienteId int not null,
    empleadoId int not null,
    total decimal(10,2),
    Primary Key PK_facturaId(facturaId),
    Constraint FK_Factura_Clientes Foreign Key Facturas(clienteId)
        References Clientes(clienteId),
    Constraint FK_Facturas_Empleados Foreign Key Facturas(empleadoId)
        References Empleados(empleadoId)
);

Create Table ticketSoporte(
	ticketSoporteId int not null auto_increment,
    descripcionTicket VARCHAR(250),
    estatus VARCHAR(30),
    clienteId int not null,
    facturaId int not null,
    Primary Key PK_ticketSoporteId(ticketSoporteId),
    Constraint FK_ticketSporte_Clientes Foreign Key ticketSporte(clienteId)
        References Clientes(clienteId),
    Constraint FK_ticketSporte_Facturas Foreign Key ticketSporte(facturaId)
        References Facturas(facturaId)
);

Create Table DetalleFactura(
    detalleFacturaId int not null auto_increment,
    facturaId int not null,
    productoId int not null,
    Primary Key PK_detalleFacturaId(detalleFacturaId),
    Constraint FK_DetalleFactura_Facturas Foreign Key DetalleFactura(facturaId)
        References Facturas(facturaId),
    Constraint FK_DetalleFactura_Productos Foreign Key DetalleFactura(productoId)
        References Productos(productoId)
);

Insert into Clientes(nombre, apellido, telefono, direccion, nit) values
	('Luis', 'Cuxun', '1234-5678', 'Ciudad', '165-489'),
    ('Estuardo', 'Garcia', '9876-5432', 'Ciudad', '489-789'),
    ('Carlos', 'Mendez', '1899-1596', 'Ciudad', '132-489');
    
select * from Clientes;

    
SET GLOBAL time_zone = '-6:00';
    
    
    
    
    
    
    
    
    
    
    
    


