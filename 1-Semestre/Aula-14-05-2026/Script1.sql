use empresa_db;

/*
TRAGA A DESCRIÇÃO DOS PRODUTOS QUE POSSUEM O PREÇO MAIOR QUE A MEDIA DE TODOS OS PRODUTOS
*/

-- montando a subquery
select avg(p2.preco) 
from tb_produto p2;

-- montando a query
select p.descricao 
from tb_produto p 
where p.preco > ();

-- query + subquery
select p.descricao 
from tb_produto p 
where p.preco > (
select avg(p2.preco) 
from tb_produto p2
);

/*
TRAGA TODOS OS CLIENTES QUE EXISTAM PEDIDOS NO MES DE 7 D 1996
*/

-- montando a subquery
select *
from tb_pedido p 
where p.dataPedido between '1996-07-01' and '1996-07-31';

-- monatando a query 
select c.*
from tb_cliente c 
where exists();

-- query + subquery *aqui foi utilizado o AND, pois como são dois SELECT com FROM diferentes precisa de algo para igualar as chaves das tabelas igual é feito no join
select c.*
from tb_cliente c 
where exists(
select *
from tb_pedido p 
where p.dataPedido between '1996-07-01' and '1996-07-31'
and c.clienteid = p.clienteId
);

/*
QUAIS CARGOS POSSUEM MÉDIA SALARIAL MAIOR QUE A MEDIA SALARIAL DO CARGO COORDENADOR DE VENDAS INTERNAS
*/

-- montando a subquery
select avg(f2.salario)
from tb_funcionario f2
where cargo = 'COORDENADOR DE VENDAS INTERNAS';

-- monatando a query 
select f1.cargo, avg(f1.salario) as 'Média Salário'
from tb_funcionario f1
group by f1.cargo
having avg(f1.salario) > ();

-- query + subquery
select f1.cargo, avg(f1.salario) as 'Média Salário'
from tb_funcionario f1
group by f1.cargo
having avg(f1.salario) > (
select avg(f2.salario)
from tb_funcionario f2
where cargo = 'COORDENADOR DE VENDAS INTERNAS'
);

/*
TRANSAÇÃO
*/

-- consultar cliente no banco
select * 
from tb_cliente
where clienteid = 'BBBBB';

-- alterar cliente
START TRANSACTION;
BEGIN;
update tb_cliente 
set nomeCompleto = 'AlteradoTurmaB' 
where clienteid = 'BBBBB';
ROLLBACK;
COMMIT;

/*
VIEW
*/

-- criando uma view
create view vw_numero_pedido_cliente as
select p.numeroPedido, c.nomeCompleto
from tb_pedido p
join tb_cliente c on p.clienteid = c.clienteid;

-- posso usar ela como uma tabela normal com select
select *
from vw_numero_pedido_cliente;

select numeroPedido
from vw_numero_pedido_cliente;

select numeroPedido
from vw_numero_pedido_cliente
where numeroPedido = 10643;

select npc.nomeCompleto, npc.dataPedido, d.*
from vw_numero_pedido_cliente npc
join tb_detalhe_pedido d on npc.numeroPedido = d.numeroPedido;

-- modificando uma view
alter view vw_numero_pedido_cliente as
select p.numeroPedido, c.nomeCompleto, p.dataEntrega
from tb_pedido p
join tb_cliente c on p.clienteid = c.clienteid;

/*
FUNÇÕES
*/

-- criando uma função
delimiter //
create function retorna_mensagem_boas_vindas()
returns varchar(70) deterministic
begin
	return 'Bem Vindos';
end //

-- usando a função
select retorna_mensagem_boas_vindas();

-- Função para fornecer a média do faturamento total
select round(avg(preco * quantidade), 2)
from tb_detalhe_pedido;

delimiter $$
create function media_faturamento()
returns float deterministic
begin
	declare media float;
    select round(avg(preco * quantidade), 2)
    into media -- into para colocar o valor na variavel
	from tb_detalhe_pedido;
    return media;
end $$

select media_faturamento();

-- função que retorna o faturamento de um pedido, recebendo o numero do pedido como argumento
select numeropedido, sum(preco * quantidade) as 'valor de cada pedido'
from tb_detalhe_pedido
group by numeropedido
order by numeropedido;

select numeropedido, sum(preco * quantidade)
from tb_detalhe_pedido
where numeropedido = 10250
group by numeropedido;

delimiter //
create function faturamento_numero_pedido(numPedido bigint)
returns float deterministic
begin
	declare faturamento float;
    select round(sum(preco * quantidade), 2)
    into faturamento
	from tb_detalhe_pedido
	where numeropedido = numPedido;
    return faturamento;
end //

select faturamento_numero_pedido(10250);

-- função que ao receber uma daa de nascimento, retorna se a pessoa é menor ou maior de idade
delimiter //
create function eh_maior_idade(dataNascimento date)
returns varchar(255) deterministic
begin
	declare resultado varchar(255);
    if timestampdiff(year, dataNascimento, curdate()) >= 18 then
		set resultado = 'maior de idade';
    elseif timestampdiff(year, dataNascimento, curdate()) < 18 then
		set resultado = 'menor de idade';
    end if;
    return resultado;
end //

select eh_maior_idade('2020-02-18');