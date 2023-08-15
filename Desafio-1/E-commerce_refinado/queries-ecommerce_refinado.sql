-- Quantos pedidos foram feitos por cada cliente?
select razao_social as ClientePJ, concat(c.nome, ' ', c.sobrenome) as ClientePF, count(*) as quantidade
	from clientes c
	join pedidos p on c.idcliente = p.idpedido_cliente
	group by c.idcliente;

-- Quantos clientes fizeram mais que 2 pedidos?
select razao_social as ClientePJ, concat(c.nome, c.sobrenome) as ClientePF, count(*) as quantidade
from clientes c
join pedidos p on c.idcliente = p.idpedido_cliente
group by c.idcliente having quantidade > 2;

-- Relação de produtos fornecedores e estoques.
select 
	f.razao_social as Empresa,
    p.nome_produto as Produto,
    e.quantidade,
    e.localidade as Local_Fornecedor,
    l.localidade as Local_estoque
from fornecedores f
join produtoFornecedor pf on f.idfornecedor = pf.idPFfornecedor        
join produtos p on p.idproduto = pf.idPFproduto
join estoqueLocalidade l on l.idELproduto = p.idproduto
join estoque e on l.idELestoque = e.idestoque
order by e.quantidade;

-- Relação de nomes dos fornecedores e nomes dos produtos.
select f.razao_social as Fornecedor, p.nome_produto as Produto
from fornecedores f
join produtoFornecedor pf on f.idfornecedor = pf.idPFfornecedor
join produtos p on p.idproduto = pf.idPFproduto;

