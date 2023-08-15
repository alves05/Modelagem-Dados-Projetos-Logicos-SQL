-- Ciração do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce;

-- Acessando banco de dados criado
USE ecommerce;

-- Criar tabela Cliente
CREATE TABLE clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit varchar(3),
    Lname varchar(20),
    CPF char(11) not null,
	Address varchar(255),
    DateOfBirth date,
    constraint unique_cpf_cliente unique (CPF)
);

alter table clients auto_increment=1;

-- Criar tabela Produto
CREATE TABLE products(
	idProduct int auto_increment primary key,
    Pname varchar(255) not null,
    classification_kids bool default False,
    Category enum('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    rating float default 0,
    size varchar(10),
    price float
);

alter table products auto_increment=1;

-- Criar tabela Pedido
CREATE TABLE orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    OrderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    OrderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default False,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

alter table orders auto_increment=1;

-- Criar tabela Estoque
CREATE TABLE productStorage(
	idProductStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

alter table productStorage auto_increment=1;

-- Criar tabela Fornecedor
CREATE TABLE supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
	CNPJ char(14),
    Address varchar(255),
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;

-- Criar tabela vendedor
CREATE TABLE seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(14),
    CPF char(11),
	Location varchar(255),
    contact char(11),
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment=1;

-- Criar tabela de relacionamento entre o produto e vendedor
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references products(idProduct)
);

-- Criar tabela de relacionamento entre o produto e pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references products(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder)

);

-- Criar tabela de relacionamento entre o produto e estoque
create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references products(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProductStorage)
);

-- Criar tabela de relacionamento entre o produto e fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_prodcut foreign key (idPsProduct) references products(idProduct)
);

