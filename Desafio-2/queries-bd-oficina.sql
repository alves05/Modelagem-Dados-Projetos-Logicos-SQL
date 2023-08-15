-- Acessando base de dados
use oficina;

-- Qual a quantidade de clientes?
select count(*) as Quantidade_clientes from clientes;

-- Quais clientes são pessoa fisica?
select concat(nome,' ', sobrenome) as ClientesPF, cpf_cnpj as CPF, contato 
	from clientes where nome != 'null';

-- Quais clientes são pessoa juridica?
select razao_social as ClientesPJ, cpf_cnpj as CNPJ, contato 
	from clientes where razao_social != 'null';
    
-- Qual o veiculo de cada cliente?
select
	concat(c.nome,' ',c.sobrenome) as ClientesPF,
    c.razao_social as ClientesPJ,
    v.modelo as Modelo,
    v.marca as Marca,
    v.ano as Ano_Modelo
from clientes c
join veiculoCliente vc on vc.idVCcliente = c.idcliente
join veiculos v on v.idveiculo = vc.idVCveiculo;

-- Quais os serviços da oficina?
select servicoTipo as Servicos from servico;

-- Qual a quatidade de serviços prestados aos clientes?
select count(*) as Total_Servicos from ordemServico;

-- Quais clientes fezeram mais de um serviço e o valor total?
select concat(c.nome,' ',c.sobrenome) as ClientePF, 
	   c.razao_social as ClientePJ, 
       count(*) as Quantidade_Servicos, 
       SUM(o.valor) as ValorTotal
	from clientes c
    join ordemServico o on c.idcliente = o.idordemcliente
    group by c.idcliente having Quantidade_Servicos > 1;

-- Quais os serviços realizados para cada cliente?
select 
	concat(c.nome,' ',c.sobrenome) as ClientePF, 
	c.razao_social as ClientePJ,
    s.servicoTipo as Servico, 
    o.valor as ValorTotal
from clientes c
join ordemServico o on c.idcliente = o.idordemcliente
join servicoOrdemServico sos on sos.idOSSordem = o.idordemServico
join servico s on s.idservico = sos.idOSSservico
order by o.valor desc;
    



	