-- Acessando o banco de dados
use ecommerce_refinado;

-- Inserindo valores na tabela clientes
insert into clientes (nome, sobrenome, razao_social, endereco, datanascimento)
	values('Ana', 'Araujo', null, 'Rua, 98, Bairro, Cidade/UF', '1998-09-05'),
		  ('Antonio', 'Lisboa', null, 'Rua, 1003, Bairro, Cidade/UF', '2007-03-24'),
		  (null, null, 'Comercial Bugigangas Ltda','Rua, 800, Bairro, Cidade/UF', null),
		  (null, null, 'Armarinho Souza Ltda','Rua, 900, Bairro, Cidade/UF', null),
		  ('Juliana', 'Medeiros', null,'Rua, 295, Bairro, Cidade/UF', '2000-12-25'),
		  (null, null, 'Loja Variedades Ltda','Rua, 9000, Bairro, Cidade/UF', null);

-- Inserindo valores na tabela tipo cliente
insert into tipo_cliente (natureza, CPF_CNPJ)
	values(default, '85239641792'),
		  (default, '45213652879'),
		  ('PJ', '41235628000121'),
		  ('PJ', '00263489000189'),
		  (default, '07563240594'),
		  ('PJ', '69325187000190');

-- Inserindo valores na tabela produtos
insert into produtos (nome_produto, classificacao_infantil, categoria, descricao, avaliacao, dimensoes, valor)
	values('Lego', True, 'Brinquedo', '20 peças', 4, null, 345.00),
		  ('Smartphone', default, 'Eletronico', null, 5, null, 999.50),
		  ('Casaco', default, 'Moda', 'Preto, com capuz', 5, 'GG', 120.00),
		  ('Jogo de jantar', default, 'Casa', '12 peças', 5, null, 230.00),
		  ('Vinho Suave', default, 'Alimento', 'Tinto suave', 4.5, '1L', 19.90),
		  ('Fone de ouvido', default, 'Eletronico', 'Cor preto, universal', 4.3, null, 17.00);

-- Inserindo valores na tabela forma de pagamento
insert into forma_pagamento (tipo_pagamento)
	values('PIX'),
		  ('PIX'),
		  ('Crédito'),
		  ('Débito'),
		  ('Débito'),
		  ('Boleto'),
		  ('PIX'),
		  ('Crédito'),
		  ('Crédito'),
		  ('Débito');

-- inserindo valores na tabela entregas
insert into entregas (identrega, status_entrega, cod_rastreio)
	values (1, default, 1234567890),
		   (2, default, 1234567891),
		   (3, default, 1234567892),
		   (4, default, 1234567893),
		   (5, default, 1234567894),
		   (6, default, 1234567895),
           (7, default, 1234567896),
           (8, default, 1234567897),
           (9, default, 1234567898),
           (10, default, 1234567899);

-- Inserindo valores na tabela pedidos
insert into pedidos (idpedido_cliente, idpedido_pagamento, descricao_pedido, frete_pedido, valor_total)
	values(1,2,'Compra por app', 12.90, 999.50),
		  (3,2, 'Compra por website', 50.00, 99.50),
          (2,3,'Compra por app com cupom de desconto', 25.00, 320.00),
          (3,3,'Compra por website', 25.00, 85.00),
          (4,3,'Compra por website', 70.00, 1200.00),
          (4,4,'Compra por website', 30.00, 460.00),
          (5,4,'Compra por app', 11.90, 999.50),
          (6,5,'Compra por website', 45.00, 1035.00),
          (6,6,'Compra por website', 35.00, 102.00),
          (3,3,'Compra por website', 29.90, 170.00);

-- Inserindo valores na tabela estoque
insert into estoque (localidade, quantidade)
	values('Pernumbuco', 500),
	      ('Paraiba', 100),
	      ('Piaui', 300),
	      ('Para', 200),
	      ('Sergipe', 150);

-- Inserindo dados na tabela fornecedor
insert into fornecedores (razao_social, nome_fantazia, endereco, contato)
	values('Insdustrias Reunidas ABCDE', 'Produtos ABCDE', 'São Paulo/SP', '11356325444'),
		  ('Fabrica Brinquedo Nacional', 'Fabrica Brincar', 'São Paulo/SP', '1144999999'),
		  ('Industria de Bebidas', null, 'São Paulo/SP', '11558888888'),
		  ('Insdustria Telefonica', null, 'São Paulo/SP', '11773333333');

-- Inserindo dados na tabela tipo de fornecedor
insert into tipo_fornecedor (natureza, CPF_CNPJ)
	values('PJ', 88888888000188),
		  ('PJ', 77777777000177),
		  ('PJ', 55555555000155),
		  ('PJ', 44444444000144);

-- Inserindo dados na tabela vendedor
insert into vendedores (razao_social, nome_fantazia, endereco, contato)
	values('Loja San Martin', null, 'Salvador/BA', '88999444871'),
		  ('Fabricia Menezes', null, 'Fortaleza/CE', '44555666123'),
		  ('Vitrine Legal', null, 'São Paulo/SP', '11745012354'),
		  ('Joao Kleber', null, 'São Paulo/SP', '11846352364');

-- Inserindo dados na tabela tipo vendedor
insert into tipo_vendedores (natureza, CPF_CNPJ)
	values('PJ', 44444444000144),
		  ('PF', 45465456001),
		  ('PJ', 22222222000122),
		  ('PF', 89542000144);

-- Inserindo dados na tabela vendedor produto		  
insert into vendedorProduto (idPVvendedor, idPVproduto, quantidade)
	values(1, 2, 10),				
          (2, 4, 7),
          (3, 5, 2),
          (4, 1, 6);

-- Inserindo dados na tabela pedido produto
insert into pedidoProduto (idPPproduto, idPPpedido, quantidade, status_produto)
	values(1, 1, 1, default),
		  (2, 4, 1, default),
          (3, 5, 1, default),
          (4, 10, 1, default),
          (5, 3, 1, default),
          (6, 7, 1, default);

-- Inserindo dados na tabela estoque localidade
insert into estoqueLocalidade (idELproduto, idELestoque, localidade)
	values(1, 2, 'São Paulo'),				
          (2, 4, 'Minas Gerais'),
          (3, 5, 'Bahia'),
          (4, 1, 'Rio Grande do Sul'),
          (5, 3, 'Rio de Janeiro');


-- Inserindo dados na tabela produto fornecedor
insert into produtoFornecedor (idPFfornecedor, idPFproduto, quantidade)
	values(1, 4, 10),				
          (2, 1, 7),
          (3, 5, 2),
          (4, 2, 6),
          (1, 3, 10),
          (1, 2, 10);
          

