use empresa_db;

/*
qunanto cada cliente gastou ao longo do tempo no sistema
nome do cliente e quanto ele gastou
tabelas:
tb_cliente --> ClienteId(PK) / NomeCompleto
tb_pedido --> NumeroPedido(PK) / ClienteId(FK)
tb_detalhe_pedido --> NumeroPedido(FK) / 
*/

select c.nomeCompleto as 'Nome Completo', SUM(d.preco * d.quantidade) as 'Total de Compras' 
from tb_cliente c
join tb_pedido p on c.ClienteId = p.ClienteId
join tb_detalhe_pedido d on d.numeroPedido = p.numeroPedido
group by c.nomeCompleto
order by c.nomeCompleto;

-- E PARA LEVANTARMOS APENAS CLIENTE QUE TOTALIZARAM COMPRAS DE 5000

select c.nomeCompleto as 'Nome Completo', SUM(d.preco * d.quantidade) as 'Total de Compras' 
from tb_cliente c
join tb_pedido p on c.ClienteId = p.ClienteId
join tb_detalhe_pedido d on d.numeroPedido = p.numeroPedido
group by c.nomeCompleto
having SUM(d.preco * d.quantidade) > 5000
order by c.nomeCompleto;

/*
Surgiu uma necessidade de ver se as metas de um determinado pedido foram atingidas, se estão dentro de um valor aceitável ou se não não atingidas
O parametro para sabermos se ela foi atingida é o valor preço vezes quantidade
Se foi maior ou igual a 1500 a meta foi atingida, se estiver entre 100 e 1499 o valor está dentro do aceitável, se estiver abaixo de 1000 a meta não foi atingida
*/

select 
	numeroPedido as 'Número do Pedido',  -- final da coluna
	SUM(preco * quantidade) as 'Total',  -- final da coluna
	case
		when SUM(preco * quantidade) >= 1500 then 'Meta Atingida'
        when SUM(preco * quantidade) >= 1000 and SUM(preco * quantidade) < 1500 then 'Meta Aceitável'
        else 'Meta Não Foi Atingida'
    end as 'Metas' -- final da coluna
from tb_detalhe_pedido 
group by numeroPedido
order by SUM(preco * quantidade) desc;

/*
criar indice
*/

create index inx_numero_pedido on tb_detalhe_pedido(numeroPedido);

/*
tabela temporária
*/

create temporary table temp_cliente
(
	clienteId char(5),
    nomeCompleto varchar(50),
    contato varchar(35),
    cargo varchar(40)
);

insert into temp_cliente
select clienteId, nomeCompleto, contato, cargo 
from tb_cliente;

drop table temp_cliente;

create temporary table temp_cliente
select clienteId, nomeCompleto, contato, cargo 
from tb_cliente;

-- LISTAR TODOS OS CLIENTES(NOME DOS CLIENTES) QUE MORAM NA ALEMANHA(PAÍS)

select c.nomeCompleto as 'Cliente', e.pais as 'País'
from tb_cliente c
join tb_endereco e on e.clienteId = c.clienteId
where e.pais = 'Alemanha';

-- LISTAR TODOS OS CLIENTES QUE COMPRARAM PRODUTOS DA CATEGORIA BEBIDA

select c.nomecompleto, ca.descricao
from tb_cliente c
join tb_pedido p on c.clienteid = p.clienteid
join tb_detalhe_pedido d on p.numeropedido = d.numeropedido
join tb_produto pr on d.produtoid = pr.produtoid
join tb_categoria ca on pr.categoriaid = ca.categoriaid
where ca.descricao = 'Bebidas';

-- QUAL PRODUTO TEVE MAIOR QUANTIDADE DE VENDAS NO MÊS 7 DE 1996

select pr.descricao as 'Produto', SUM(d.quantidade) as 'Total Quantidade', p.datapedido as 'Data do Pedido'
from tb_pedido p
join tb_detalhe_pedido d on p.numeropedido = d.numeropedido
join tb_produto pr on d.produtoid = pr.produtoid
where p.datapedido >= '1996-07-01' and p.datapedido <= '1996-07-31'
group by pr.descricao
order by SUM(d.quantidade) desc limit 1;