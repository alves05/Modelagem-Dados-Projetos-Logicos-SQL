-- Acessando database oficina
use oficina;

-- Inserindo dados tabela cliente
insert into clientes (nome, sobrenome, razao_social, cpf_cnpj, contato)
		values('João', 'Silva', null, '852145632141', '31999999999'),
			  ('Pedro', 'Almeida', null, '98541321478', '81888888888'),
			  ('Maria', 'Lima', null, '00052413652', '74555555555'),
			  (null, null, 'Jurandir Transporte', '11111111000199', '81995555555'),
			  (null, null, 'Bezerra Entregas', '22222222000144', '21778888888');

-- Inserindo dados tabela veiculos
insert into veiculos (marca, modelo, ano, placa)
		values('Chevrolet', 'Onix', '2015', 'MMM1111'),
			  ('Hyundai', 'HB20', '2019', 'KKK2222'),
			  ('Honda', 'Civic', '2014', 'UUU7777'),
			  ('Hyundai', 'HR', '2012', 'JJJ8888'),
			  ('Renault', 'Master', '2020', 'LLL5555');

-- Inserindo dados tabela forma de pagamento
insert into forma_pagamento (tipo)
		values('PIX'),
			  ('Dinheiro'),
			  ('PIX'),
			  ('Cartão'),
			  ('Cartão');

-- Inserindo dados tabela ordem de serviço
insert into ordemServico (idordemCliente, idordemPagamento, valor)
		values(1, 5, 635.00),
			  (2, 1, 700.00),
			  (3, 3, 150.00),
			  (4, 4, 1200.00),
			  (5, 3, 2000.00),
			  (1, 2, 100.00),
			  (4, 1, 500.00);

-- Inserindo dados tabela serviço
insert into servico (servicoTipo, valor)
		values('Troca de Oleo', 150.00),
			  ('Substituição da bomba de combustivel', 700.00),
			  ('Troca da correia do alternador', 100.00),
			  ('Troca de junta do cabeçote', 1200.00),
			  ('Conserto da transmissão', 2000.00),
			  ('Revisão sistema de freios', 500.00),
			  ('Concerto injeção eletronica e troca de velas', 635.00);

-- Inserindo dados tabela veiculo/cliente
insert into veiculoCliente (idVCveiculo, idVCcliente, descricaoServico)
		values(1, 1, 7),
			  (2, 3, 3),
			  (3, 2, 6),
			  (4, 5, 4),
			  (4, 4, 1),
			  (5, 4, 2);


-- Inserindo dados tabela oredem serviço / serviço
insert into servicoOrdemServico (idOSSordem, idOSSservico, quantidadeServico)
		values(1, 7, 1),
			  (2, 2, 1),
			  (3, 1, 1),
			  (4, 4, 1),
			  (5, 5, 1),
			  (6, 3, 1),
			  (7, 6, 1);
			  