CREATE DATABASE ex1;

DROP DATABASE ex1;

USE ex1;

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
	if_classesHabilidades INT NOT NULL PRIMARY KEY auto_increment,
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