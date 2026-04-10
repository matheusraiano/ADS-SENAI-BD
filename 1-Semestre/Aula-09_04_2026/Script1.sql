select * from tb_categoria;
select * from tb_cliente;
select * from tb_detalhe_pedido;
select * from tb_endereco;
select * from tb_fornecedor;
select * from tb_funcionario;
select * from tb_pedido;
select * from tb_produto;

select NomeCompleto from tb_cliente;

select NomeCompleto,Cargo from tb_cliente;

select 'O funcionario',NomeCompleto,'atua no',Cargo from tb_cliente;

select * from tb_pedido where frete = 50;

select * from tb_pedido where frete > 50;

select * from tb_pedido where frete < 50;

select * from tb_pedido where frete >= 50;

select * from tb_pedido where frete <= 50;

select * from tb_pedido where frete <> 50; select * from tb_pedido where frete != 50;

select NumeroPedido as 'Numero do Pedido', ClienteId as 'Id do Cliente', current_date() as 'Data de Extração' from tb_pedido;

select
numeroPedido 'Numero do Pedido',
ClienteId 'Id do Cliente',
current_date() 'Data de Extração'
from tb_pedido;

select * from tb_pedido limit 15;

select * from tb_pedido order by NumeroPedido;

select * from tb_pedido order by NumeroPedido desc;

select * from tb_pedido order by NumeroPedido asc;

select * from tb_pedido order by Frete;

select distinct Frete from tb_pedido order by Frete;

select distinct ClienteId, Frete from tb_pedido order by ClienteId;

-- operadores lógicos AND / OR / NOT
select * from tb_pedido where Frete >= 30 and Frete <= 50 order by Frete;

select * from tb_pedido where Frete >= 50 or Frete = 0 order by Frete;

select * from tb_pedido where not Frete = 0 order by Frete;

select * from tb_fornecedor
where cargo = 'Gerente de Encomendas' or cargo = 'Gerente de Marketing' or cargo = 'Gerente de Vendas';

select * from tb_fornecedor where cargo like 'Gerente%';

select * from tb_fornecedor where cargo like '%de%';

select * from tb_fornecedor 
where cargo in('Gerente de Encomendas','Gerente de Marketing','Gerente de Vendas');

select * from tb_fornecedor 
where cargo not in('Gerente de Encomendas','Gerente de Marketing','Gerente de Vendas');

select * from tb_endereco where ClienteId is null;

select * from tb_endereco where ClienteId is null and FornecedorId is null;

select * from tb_endereco where FuncionarioId is not null;