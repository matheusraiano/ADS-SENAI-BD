CREATE DATABASE ex1;

USE ex1;

CREATE TABLE usuarios
(
	usuario_id INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT PK_USUARIO PRIMARY KEY (usuario_id),
    CONSTRAINT UN_USUARIO UNIQUE (usuario_id),
    email VARCHAR(60) NOT NULL,
    CONSTRAINT UN_EMAIL UNIQUE (email),
    senha INT NOT NULL
);

CREATE TABLE personagens
(
	personagem_id INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT PK_PERSONAGEM PRIMARY KEY (personagem_id),
    CONSTRAINT UN_PERSONAGEM UNIQUE (personagem_id),
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
    CONSTRAINT UN_CLASSE UNIQUE (classe_id),
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
    CONSTRAINT UN_HABILIDADE UNIQUE (habilidade_id),
    nome VARCHAR(30) NOT NULL
);