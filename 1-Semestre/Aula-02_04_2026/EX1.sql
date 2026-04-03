create database seguradora;

use seguradora;

create table clientes
(
	cd_cliente int not null primary key auto_increment,
    nm_cliente varchar(60) not null,
    ds_endereco varchar(120) null,
    cd_cep char(8)
);

create table carros
(
	cd_placa char(7) not null primary key,
    ds_carro varchar(30) not null,
    ds_cor varchar(20) not null,
    ds_modelo varchar(30) not null
);

create table apolices
(
	cd_apolice int not null primary key auto_increment,
    ds_apolice varchar(60) not null,
    dt_vigencia date not null,
    dt_emissao date not null,
    vl_apolice decimal(6,2),
    fk_cd_cliente int not null,
    fk_cd_placa char(7) not null,
    constraint FK_TB_CLIENTES_APOLICES foreign key(fk_cd_cliente) references clientes(cd_cliente),
    constraint FK_TB_CARROS_APOLICES foreign key(fk_cd_placa) references carros(cd_placa)
);

create table acidentes
(
	cd_acidente int not null primary key,
    ds_local varchar(120) not null,
    ds_acidente varchar(255) not null,
    dt_acidente date not null,
    hr_acidente time not null,
    fk_cd_placa char(7) not null,
    constraint FK_TB_CARROS_ACIDENTE foreign key(fk_cd_placa) references carros(cd_placa)
);

insert into clientes values
(1, 'um', 'Av. AlgumCoisa', '90843568'),
(2, 'dois', 'R. AlgumCoisa', '0987732'),
(3, 'tres', 'Av. AlgumCoisa2', '9564493'),
(4, 'quatro', 'R. AlgumCoisa2', '27848834'),
(5, 'cinco', 'Av. Solta', '8956634');

insert into carros values
(1, 'pp', 'branco', 'seda'),
(2, 'p', 'vermelho', 'suv'),
(3, 'm', 'azul', 'coupe'),
(4, 'g', 'preto', 'seda'),
(5, 'gg', 'cinza', 'coupe');

insert into apolices values
(1, 'tragico', '10/05/2026', '05/03/2015', '500.00', 1, 1),
(2, 'nada', 'p', '8/05/2026', '05/03/2015', '500.00', 2, 2),
(3, 'feio', 'm', '13/04/2026', '05/03/2015', '500.00', 3, 3),
(4, 'pt', 'g', '20/09/2026', '05/03/2015', '500.00', 4, 4),
(5, 'tranquilo', 'gg', '07/11/2026', '05/03/2015', '500.00', 5, 5);

insert into acidentes values
(1, 'deserto', 'feio', '02/01/2009', '15:32', 1),
(2, 'cheio', 'tragico', '01/04/2009', '12:52', 2),
(3, 'lotado', 'tranquilo', '05/06/2009', '09:12', 3),
(4, 'vazio', 'complicado', '09/03/2009', '16:38', 4),
(5, 'grande', 'destruido', '14/09/2009', '19:27', 5);

insert into clientes(nm_cliente, ds_endereco, cd_cep) values
('um', 'Av. AlgumCoisa', '90843568'),
('dois', 'R. AlgumCoisa', '0987732'),
('tres', 'Av. AlgumCoisa2', '9564493'),
('quatro', 'R. AlgumCoisa2', '27848834'),
('cinco', 'Av. Solta', '8956634');

insert into carros(ds_carro, ds_cor, ds_modelo) values
('pp', 'branco', 'seda'),
('p', 'vermelho', 'suv'),
('m', 'azul', 'coupe'),
('g', 'preto', 'seda'),
('gg', 'cinza', 'coupe');

insert into apolices(ds_apolice, dt_vigencia, dt_emissao, vl_apolice, fk_cd_cliente, fk_cd_placa) values
('tragico', '10/05/2026', '05/03/2015', '500.00', 1, 1),
('nada', 'p', '8/05/2026', '05/03/2015', '500.00', 2, 2),
('feio', 'm', '13/04/2026', '05/03/2015', '500.00', 3, 3),
('pt', 'g', '20/09/2026', '05/03/2015', '500.00', 4, 4),
('tranquilo', 'gg', '07/11/2026', '05/03/2015', '500.00', 5, 5);

insert into acidentes(ds_local, ds_acidente, dt_acidente, hr_acidente, fk_cd_placa) values
('deserto', 'feio', '02/01/2009', '15:32', 1),
('cheio', 'tragico', '01/04/2009', '12:52', 2),
('lotado', 'tranquilo', '05/06/2009', '09:12', 3),
('vazio', 'complicado', '09/03/2009', '16:38', 4),
('grande', 'destruido', '14/09/2009', '19:27', 5);

update clientes set nm_cliente = 'naoum' where cd_cliente = 1;
update clientes set ds_endereco = 'R. AlgumaCoisa3' where cd_cliente = 1;
update clientes set cd_cep = '94677213' where cd_cliente = 1;

update carros set ds_carro = 'gg' where cd_placa = 1;
update carros set ds_cor = 'rosa' where cd_placa = 1;
update carros set ds_modelo = 'coupe' where cd_placa = 1;

update apolices set ds_apolice = 'nada' where cd_apolice = 1;
update apolices set dt_vigencia = '01/04/2001' where cd_apolice = 1;
update apolices set dt_emissao = '14/02/2025' where cd_apolice = 1;
update apolices set vl_apolice = '645.99' where cd_apolice = 1;

update acidentes set ds_local = 'agua' where cd_acidente = 1;
update acidentes set ds_acidente = 'tragico' where cd_acidente = 1;
update acidentes set dt_acidente = '09/12/2009' where cd_acidente = 1;
update acidentes set hr_acidente = '06:54' where cd_acidente = 1;

delete from clientes where cd_cliente = 1;
delete from clientes where cd_cliente = 2;
delete from clientes where cd_cliente = 3;

delete from carros where cd_placa = 1;
delete from carros where cd_placa = 2;
delete from carros where cd_placa = 3;

delete from apolices where cd_apolice = 1;
delete from apolices where cd_apolice = 2;
delete from apolices where cd_apolice = 3;

delete from acidentes where cd_acidente = 1;
delete from acidentes where cd_acidente = 2;
delete from acidentes where cd_acidente = 3;