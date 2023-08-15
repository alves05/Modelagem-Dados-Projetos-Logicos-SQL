-- Acessando banco de dados
use ecommerce;

-- Inserindo clientes
insert into Clients (Fname, Minit, Lname, CPF, Address, DateOfBirth) 
	   values('Joana','S','Pereira', 08642539744, 'Rua 1, 1, Bairro 1 - Recife/PE', '2000-01-01'),
		     ('Lucas','J','Almeida', 07456321566, 'Rua 2, 2, Bairro 2 - Recife/PE', '1994-10-08'),
			 ('Raimundo','S','Castro', 09745391230, 'Rua 3, 3, Bairo 3 - Recife/PE', '2006-10-12'),
			 ('Maria','S','Gonzaga', 69642539780, 'Rua 4, 4, Bairro 4 - Recife/PE', '2007-11-20'),
			 ('Ana','S','Ferreira', 01642536850, 'Rua 5, 5, Bairro 5 - Recife/PE', '2002-07-31'),
			 ('Ronald','S','Carneiro', 12842539790, 'Rua 6, 6, Bairoo 6 - Recife/PE', '2005-06-02');

-- Verificando valores inseridos
select * from clients;

-- Inserindo produtos
insert into products (Pname, classification_kids, category, rating, size, price)
		values('Fone de ouvido',false,'Eletrônico','4',null,9.99),
			  ('Barbie Elsa',true,'Brinquedos','3',null,489.60),
              ('Body Carters',true,'Vestimenta','5',null,21.99),
              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null,199.80),
              ('Sofá retrátil',False,'Móveis','3','3x57x80',2500.00),
              ('Farinha de arroz',False,'Alimentos','2',null,6.90),
              ('Fire Stick Amazon',False,'Eletrônico','3',null,199.90);

-- Verificando valores inseridos
select * from products;

-- Inserindo pedidos
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
		values(1, default,'compra via aplicativo',null,1),
			  (2,default,'compra via aplicativo',50,0),
              (3,'Confirmado',null,null,1),
              (4,default,'compra via web site',150,0);

-- Verificando valores inseridos
select * from orders;

-- Iserindo produtos/pedidos
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
		values (1,1,2,default),
			   (2,1,1,default),
               (3,2,1,default);
               
--- Verificando valores inseridos
select * from productOrder;

-- Inserindo estoque
insert into productStorage (storageLocation,quantity) 
		values ('Rio de Janeiro',1000),
			   ('Rio de Janeiro',500),
               ('São Paulo',10),
               ('São Paulo',100),
               ('São Paulo',10),
               ('Brasília',60);

-- Verificando valores inseridos
select * from productStorage;

-- Inserindo produto/estoque
insert into storageLocation (idLproduct, idLstorage, location)
		values (1,2,'RJ'),
			   (2,6,'GO');

-- Verificando valores inseridos
select * from storageLocation;

-- Inserindo fornecedores
insert into supplier (SocialName, CNPJ, Address, contact)
		values ('Almeida e filhos',12345678912345,'Rua 49, 5, Bairro 2, Rio de Janeiro/RJ','21985474'),
			   ('Eletrônicos Silva',85451964914345,'Rua 70, 1001, Bairro 5, Sao Paulo/SP','21985484'),
               ('Eletrônicos Valma',93456789393469,'Rua 30, 505, Bairro 45, Rio de Janeiro/RJ','21975474');

-- Verificando valores inseridos
select * from supplier;

-- Inserindo produto/fornecedor
insert into productSupplier (idPsSupplier, idPsProduct, quantity)
		values (1,1,500),
			   (1,2,400),
               (2,4,633),
               (3,3,5),
               (2,5,10);

-- Verificando valores inseridos
select * from productSupplier;

-- Inserindo vendedores
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact)
		values ('Tech eletronics', null,12345678945632, null, 'Rio de Janeiro', 219946287),
			   ('Botique Durgas',null,null,123456783,'Rio de Janeiro', 219567895),
               ('Kids World',null,45678912365448,null,'São Paulo', 1198657484);

-- Verificando valores inseridos
select * from seller;

-- Inserindo produto/vendedor
insert into productSeller (idPseller, idPproduct, prodQuantity)
		values (1,6,80),
               (2,7,10);

-- Verificando valores inseridos
select * from productSeller;