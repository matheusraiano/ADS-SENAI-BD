CREATE DATABASE ex2;

DROP DATABASE ex2;

USE ex2;

CREATE TABLE usuarios
(
	usuario_id INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT PK_USUARIO PRIMARY KEY (usuario_id),
    email VARCHAR(60) NOT NULL,
    CONSTRAINT UN_EMAIL UNIQUE (email),
    senha INT NOT NULL
);

CREATE TABLE personagens
(
	personagem_id INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT PK_PERSONAGEM PRIMARY KEY (personagem_id),
    nm_personagem VARCHAR(30) NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT FK_USUARIO_TB FOREIGN KEY(usuario_id) REFERENCES usuarios(usuario_id),
	classe_id INT NOT NULL,
    CONSTRAINT FK_CLASSE_TB FOREIGN KEY(classe_id) REFERENCES classes(classe_id)
);

CREATE TABLE classes
(
	classe_id INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT PK_CLASSE PRIMARY KEY (classe_id),
    nome VARCHAR(30) NOT NULL,
    descricao TINYTEXT NOT NULL
);

CREATE TABLE classeshabilidades
(
	classe_id INT NOT NULL,
    CONSTRAINT FK_CLASSE FOREIGN KEY(classe_id) REFERENCES classes(classe_id),
	habilidade_id INT NOT NULL,
    CONSTRAINT FK_HABILIDADE FOREIGN KEY(habilidade_id) REFERENCES habilidades(habilidade_id)
);

CREATE TABLE habilidades
(
	habilidade_id INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT PK_HABILIDADE PRIMARY KEY (habilidade_id),
    nome VARCHAR(30) NOT NULL
);

-- correção

CREATE TABLE usuarios
(
	usuario_id int not null primary key auto_increment,
    email varchar(255) not null unique,
    senha varchar(255) not null
);

CREATE TABLE personagens
(
	id_personagem int not null primary key auto_increment,
    nome_personagem varchar(60),
    fk_id_usuario int not null,
    fk_id_classe int not null,
    foreign key(fk_id_usuario) references usuario(id_usuario),
    foreign key(fk_id_classe) references classes(id_classe)
);

CREATE TABLE classes
(
	id_classe INT NOT NULL AUTO_INCREMENT primary key,
    nome VARCHAR(60) NOT NULL,
    descricao TINYTEXT NOT NULL
);

-- forma que os DBA's resolvem
CREATE TABLE classeshabilidades
(
	fk_id_classe int not null,
    fk_id_habilidade int not null,
    constraint PK_TB_CLASSES_TB_HABILIDADES primary key(fk_id_classe,fk_id_habilidade),
    foreign key(fk_id_classe) references classes(id_classe),
    foreign key(fk_id_habilidade) references habilidades(id_habilidade)
);
-- forma que os ORM's resolvem
CREATE TABLE classeshabilidades
(
	id_classesHabilidades INT NOT NULL PRIMARY KEY auto_increment,
	fk_id_classe INT NOT NULL,
    fk_id_habilidade INT NOT NULL,
    foreign key(fk_id_classe) references classes(id_classe),
    foreign key(fk_id_habilidade) references habilidades(id_habilidade)
);

CREATE TABLE habilidades
(
	id_habilidade INT NOT NULL AUTO_INCREMENT primary key,
    nome VARCHAR(60) NOT NULL
);

insert into usuarios values
(1, 'um@gmail.com', '123'),
(2, 'dois@gmail.com', '1234'),
(3, 'tres@gmail.com', '12345'),
(4, 'quatro@gmail.com', '123456'),
(5, 'cinco@gmail.com', '1234567');

insert into personagens values
(1, 'um', 1, 1),
(2, 'dois', 2, 2),
(3, 'tres', 3, 3),
(4, 'quatro', 4, 4),
(5, 'cinco', 5, 5);

insert into classes values
(1, 'umm', 'pp'),
(2, 'doiss', 'p'),
(3, 'tress', 'm'),
(4, 'quatroo', 'g'),
(5, 'cincoo', 'gg');

insert into classeshabilidades values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into habilidades values
(1, 'ummm'),
(2, 'doisss'),
(3, 'tresss'),
(4, 'quatrooo'),
(5, 'cincooo');

insert into usuarios(email, senha) values
('um@gmail.com', '123'),
('dois@gmail.com', '1234'),
('tres@gmail.com', '12345'),
('quatro@gmail.com', '123456'),
('cinco@gmail.com', '1234567');

insert into personagens(nome, fk_id_usuario, fk_id_classe) values
('um', 1, 1),
('dois', 2, 2),
('tres', 3, 3),
('quatro', 4, 4),
('cinco', 5, 5);

insert into classes(nome, descricao) values
('umm', 'pp'),
('doiss', 'p'),
('tress', 'm'),
('quatroo', 'g'),
('cincoo', 'gg');

insert into classeshabilidades(fk_id_classe, fk_id_habilidade) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into habilidades(nome) values
('ummm'),
('doisss'),
('tresss'),
('quatrooo'),
('cincooo');

update usuarios set email = 'naoum@gmail.com' where usuario_id = 1;
update usuarios set senha = '321' where usuario_id = 1;
update usuarios set email = 'naodois@gmail.com' where usuario_id = 2;
update usuarios set senha = '4321' where usuario_id = 2;

update personagens set nome = 'naoum' where id_personagem = 1;
update personagens set nome = 'naodois' where id_personagem = 2;
update personagens set nome = 'naotres' where id_personagem = 3;

update classes set nome = 'naoumm' where id_classe = 1;
update classes set descricao = 'naopp' where id_classe = 1;
update classes set nome = 'naodoiss' where id_classe = 2;
update classes set descricao = 'naop' where id_classe = 2;

update habilidades set nome = 'naoummm' where id_habilidade = 1;
update habilidades set nome = 'naodoisss' where id_habilidade = 2;
update habilidades set nome = 'naotresss' where id_habilidade = 3;

delete from usuarios where usuario_id = 1;
delete from usuarios where usuario_id = 2;
delete from usuarios where usuario_id = 3;

delete from personagens where id_personagem = 1;
delete from personagens where id_personagem = 2;
delete from personagens where id_personagem = 3;

delete from classes where id_classe = 1;
delete from classes where id_classe = 2;
delete from classes where id_classe = 3;

delete from habilidades where id_habilidade = 1;
delete from habilidades where id_habilidade = 2;
delete from habilidades where id_habilidade = 3;
