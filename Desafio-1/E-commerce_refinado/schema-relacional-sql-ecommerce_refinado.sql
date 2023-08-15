-- Ciração do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce_refinado;

-- Acessando banco de dados criado
USE ecommerce_refinado;

-- Criar tabela Cliente
CREATE TABLE clientes(
	idcliente int auto_increment primary key,
    nome varchar(10),
    sobrenome varchar(20),
    razao_social varchar(100),
	endereco varchar(255),
    datanascimento date
);

alter table clientes auto_increment=1;

-- Criar tabela natureza do cliente
CREATE TABLE tipo_cliente(
	idtipo_cliente int auto_increment primary key,
    natureza enum('PF','PJ') default 'PF',
    CPF_CNPJ varchar(14) not null,
    constraint unique_cpf_cnpj_tipo_cliente unique(CPF_CNPJ),
    constraint fk_cliente_tipo_cliente foreign key (idtipo_cliente) references clientes(idcliente)
);

alter table tipo_cliente auto_increment=1;

-- Criar tabela Produto
CREATE TABLE produtos(
	idproduto int auto_increment primary key,
    nome_produto varchar(20) not null,
    classificacao_infantil bool default False,
    categoria enum('Eletronico', 'Moda', 'Brinquedo', 'Casa', 'Alimento') not null,
    descricao varchar(255),
    avaliacao float not null default 0,
    dimensoes varchar(10),
    valor float not null
);

alter table produtos auto_increment=1;

-- criar tabela entregas
create table entregas(
    identrega int not null auto_increment,
    status_entrega enum('Em andamento', 'Em processamento', 'Enviado', 'Entregue') default 'Em processamento',
    cod_rastreio char(10) not null,
    primary key (idEntrega),
    constraint unique_cod_rastreio unique(cod_rastreio)
);

alter table entregas auto_increment=1;

-- Criar tabela forma de pagamento
create table forma_pagamento(
	idforma_pagamento int auto_increment primary key,
    tipo_pagamento enum('Boleto', 'Crédito', 'Débito', 'PIX') default 'PIX'
);

alter table forma_pagamento auto_increment=1;

-- Criar tabela Pedido
CREATE TABLE pedidos(
	idpedido int auto_increment,
    idpedido_cliente int,
    idpedido_pagamento int,
    descricao_pedido varchar(255),
    frete_pedido float default 10,
    valor_total float,
    primary key (idpedido, idpedido_cliente, idpedido_pagamento),
    constraint fk_pedido_cliente 		 foreign key (idpedido_cliente)   references clientes(idcliente),
    constraint fk_pedido_forma_pagamento foreign key (idpedido_pagamento) references forma_pagamento(idforma_pagamento)
);

alter table pedidos auto_increment=1;

-- Criar tabela Estoque
CREATE TABLE estoque(
	idestoque int auto_increment primary key,
    localidade varchar(255),
    quantidade int default 0
);

alter table estoque auto_increment=1;

-- Criar tabela Fornecedor
CREATE TABLE fornecedores(
	idfornecedor int auto_increment primary key,
    razao_social varchar(100) not null,
    nome_fantazia varchar(100),
	endereco varchar(255),
    contato char(11) not null
);

alter table fornecedores auto_increment=1;

-- Criar tabela natureza do fornecedor
CREATE TABLE tipo_fornecedor(
	idtipo_fornecedor int auto_increment primary key,
    natureza enum('PF','PJ') default 'PF',
    CPF_CNPJ varchar(14) not null,
    constraint unique_cpf_cnpj_tipo_fornecedor unique(CPF_CNPJ),
    constraint fk_fornecedores_tipo_fornecedor foreign key (idtipo_fornecedor) references fornecedores(idfornecedor)
);

alter table tipo_fornecedor auto_increment=1;

-- Criar tabela vendedor
CREATE TABLE vendedores(
	idvendedor int auto_increment primary key,
    razao_social varchar(100) not null,
    nome_fantazia varchar(100),
    endereco varchar(255),
    contato char(11) not null
);

alter table vendedores auto_increment=1;

-- Criar tabela natureza do vendedor
CREATE TABLE tipo_vendedores(
	idtipo_vendedores int auto_increment primary key,
    natureza enum('PF','PJ') default 'PF',
    CPF_CNPJ varchar(14) not null,
    constraint unique_cpf_cnpj_tipo_vendedores unique(CPF_CNPJ),
    constraint fk_vendedores_tipo_vendedores foreign key (idtipo_vendedores) references vendedores(idvendedor)
);

alter table tipo_vendedores auto_increment=1;

-- Criar tabela de relacionamento entre o produto e vendedor
create table vendedorProduto(
	idPVvendedor int,
    idPVproduto int,
    quantidade int default 1,
    primary key (idPVvendedor, idPVproduto),
    constraint fk_vendedorproduto_vendedor foreign key (idPVvendedor) references vendedores(idvendedor),
    constraint fk_vendedorproduto_produto foreign key (idPVproduto) references produtos(idproduto)
);

-- Criar tabela de relacionamento entre o produto e pedido
create table pedidoProduto(
	idPPproduto int,
    idPPpedido int,
    quantidade int default 1,
    status_produto enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPPproduto, idPPpedido),
    constraint fk_pedidoproduto_produto foreign key (idPPproduto) references produtos(idproduto),
    constraint fk_pedidoproduto_pedido foreign key (idPPpedido) references pedidos(idpedido)
);

-- Criar tabela de relacionamento entre o produto e estoque
create table estoqueLocalidade(
	idELproduto int,
    idELestoque int,
    localidade varchar(255) not null,
    primary key (idELproduto, idELestoque),
    constraint fk_estoque_localizacao_produto foreign key (idELproduto) references produtos(idproduto),
    constraint fk_estoque_localizacao_estoque foreign key (idELestoque) references estoque(idestoque)
);

-- Criar tabela de relacionamento entre o produto e fornecedor
create table produtoFornecedor(
	idPFfornecedor int,
    idPFproduto int,
    quantidade int not null,
    primary key (idPFfornecedor, idPFproduto),
    constraint fk_produto_fornecedor_fornecedor foreign key (idPFfornecedor) references fornecedores(idfornecedor),
    constraint fk_produto_fornecedor_produto foreign key (idPFproduto) references produtos(idproduto)
);
