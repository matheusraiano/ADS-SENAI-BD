create database loja;

drop database loja;

use loja;

create table clientes
(
	id_cliente int primary key auto_increment,
    
    nome varchar(60) not null,
    
    email varchar(100) not null unique
);

create table pedidos
(
	id_pedido int primary key auto_increment,
    
    descricao varchar(100) not null,
    
    valor decimal(10,2) not null,
    
    fk_id_cliente int not null,
    constraint FK_ID_CLIENTE foreign key(fk_id_cliente) references clientes(id_cliente)
);

insert into clientes(id_cliente, nome, email) values(1, 'L', 'l@gmail.com');
insert into clientes(nome, email) values('Li', 'li@gmail.com');

insert into clientes(nome, email) values
('gh', 'gh@gmail.com'),
('deca', 'deca@gmail.com'),
('testo', 'testo@gmail.com');

insert into pedidos(descricao, valor, fk_id_cliente) VALUES
('RX7600', '1599.99', 1),
('RYZEN 9 5950X', '3799.99', 2);

insert into clientes values(6, 'Liv', 'liv@gmail.com');

update clientes set nome = 'dura' where id_cliente = 5;
update clientes set email = 'dura@gmail.com' where id_cliente = 5;

delete from pedidos where id_pedido = 2;

select * from clientes;
select * from pedidos;