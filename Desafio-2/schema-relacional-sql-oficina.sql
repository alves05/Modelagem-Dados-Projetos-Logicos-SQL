-- Criando a base de dados Oficina
CREATE DATABASE oficina;

-- Acessando a base de dados
use oficina;

-- Criando tabela cliente
create table clientes(
	idcliente int auto_increment primary key,
	nome varchar(10),
	sobrenome varchar(10),
	razao_social varchar(20),
	cpf_cnpj varchar(14) not null,
	contato varchar(11) not null,
	constraint unique_cliente_cpf_cnpj unique(cpf_cnpj)
);

alter table clientes auto_increment=1;

-- Criando tabela veiculo
create table veiculos(
	idveiculo int auto_increment primary key,
	marca varchar(10) not null,
	modelo varchar(20) not null,
	ano char(4) not null,
	placa char(7) not null,
	constraint unique_veiculo_placa unique(placa)
);

alter table veiculos auto_increment=1;

-- Criando tabela forma de pagamento
create table forma_pagamento(
	idformaPagamento int auto_increment primary key,
	tipo enum('PIX', 'Dinheiro', 'Cartão') default 'Dinheiro' not null
);

alter table forma_pagamento auto_increment=1;

-- Criando tabela ordem de serviço
create table ordemServico(
	idordemServico int auto_increment,
	idordemCliente int,
	idordemPagamento int,
	valor float,
	primary key (idordemServico, idordemCliente, idordemPagamento),
	constraint fk_ordem_cliente foreign key (idordemCliente) references clientes(idcliente),
	constraint fk_ordem_pagamento foreign key (idordemPagamento) references forma_pagamento(idformaPagamento)
);

alter table ordemServico auto_increment=1;

-- Criando tabela serviço
create table servico(
	idservico int auto_increment primary key,
	servicoTipo varchar(45) not null,
	valor float
);

alter table servico auto_increment=1;

-- Criando tabela veiculo / cliente
create table veiculoCliente(
	idVCveiculo int,
	idVCcliente int,
	descricaoServico varchar(100),
	primary key (idVCveiculo, idVCcliente),
	constraint fk_veiculo_cliente_veiculo foreign key (idVCveiculo) references veiculos(idveiculo),
	constraint fk_veiculo_cliente_cliente foreign key (idVCcliente) references clientes(idcliente)
);


-- Criando tabela ordem de serviço / serviço
create table servicoOrdemServico(
	idOSSordem int,
	idOSSservico int,
	quantidadeServico int,
	primary key (idOSSordem, idOSSservico),
	constraint fk_ordem_servico_servico_ordem foreign key (idOSSordem) references ordemServico(idordemServico),
	constraint fk_ordem_servico_servico_servico foreign key (idOSSservico) references servico(idservico)
);





