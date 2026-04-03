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

show tables