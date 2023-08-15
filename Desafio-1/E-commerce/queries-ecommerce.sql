-- Quantidade de clientes
select count(*) from clients;

-- Pedidos feito pelos clientes
select * from clients c, orders o where c.idClient = idOrderClient;

-- Cliente, pedido e status do pedido (resumido)
select concat(Fname,' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

-- Quantidade de pedidos realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by idClient; 