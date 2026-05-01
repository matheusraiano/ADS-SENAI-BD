use empresa_db;

select 'cliente', clienteId 
from tb_endereco
union
select 'funcionario', funcionarioId 
from tb_endereco
union
select 'fornecedor', fornecedorId 
from tb_endereco;

select 'cliente', clienteId 
from tb_endereco
union all
select 'funcionario', funcionarioId 
from tb_endereco
union all
select 'fornecedor', fornecedorId 
from tb_endereco;

select categoriaId 'categoria', descricao 'produto', preco - (preco * 0.02) 'c/ desconto' 
from tb_produto 
where categoriaId = 1
union
select categoriaId 'categoria', descricao 'produto', preco - (preco * 0.03) 'c/ desconto' 
from tb_produto 
where categoriaId = 4;

select c.descricao 'categoria', p.descricao 'produto', p.preco - (p.preco * 0.02) 'c/ desconto' 
from tb_produto p
inner join tb_categoria c
on p.categoriaId = c.categoriaId
where c.descricao = 'Bebidas'
union
select c.descricao 'categoria', p.descricao 'produto', p.preco - (p.preco * 0.03) 'c/ desconto' 
from tb_produto p
inner join tb_categoria c
on p.categoriaId = c.categoriaId
where c.descricao = 'Laticínios';

select c.NomeCompleto 'Nome do Cliente', p.NumeroPedido 'Número do Pedido', f.NomeCompleto 'Nome do Funcionário'
from tb_pedido p
inner join tb_cliente c
on p.ClienteId = c.ClienteId
inner join tb_funcionario f
on p.FuncionarioId = f.FuncionarioId;

select c.NomeCompleto, e.Logradouro, e.cidade
from tb_endereco e
inner join tb_cliente c
on c.clienteid = e.clienteid;

insert into tb_cliente (clienteid, nomecompleto, contato, cargo) values
('AAAAA', 'TESTE 1', 'TESTE', 'TESTE'),
('BBBBB', 'TESTE 2', 'TESTE', 'TESTE');

select c.clienteid, c.NomeCompleto, e.Logradouro, e.cidade
from tb_endereco e
right join tb_cliente c
on c.clienteid = e.clienteid;

create table tb_info_prod_fornecedor
(
	empresa varchar(100),
    contato varchar(100),
    des_prod varchar(70),
    desc_categ varchar(70)
);

insert into tb_info_prod_fornecedor
select f.empresa 'Empresa do Fornecedor', f.contato 'Contato do Fornecedor', p.descricao 'Produto', c.descricao 'Categoria'
from tb_produto p
inner join tb_fornecedor f
on p.fornecedorid = f.fornecedorid
inner join tb_categoria c
on p.categoriaid = c.categoriaid;

select * from tb_info_prod_fornecedor;

select c.descricao 'Categoria', p.preco 'Preço'
from tb_produto p
inner join tb_categoria c
on p.categoriaid = c.categoriaid
where c.descricao = 'Condimentos'
order by p.preco;

update tb_produto p 
inner join tb_categoria c
on p.categoriaid = c.categoriaid
set p.preco = p.preco + 1 
where c.descricao = 'Condimentos';