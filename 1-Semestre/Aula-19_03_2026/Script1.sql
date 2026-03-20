CREATE DATABASE aulaDBTB;

USE aulaDBTB;

CREATE TABLE aluno
(
	nome_completo VARCHAR(65) NOT NULL,
    endereco VARCHAR(100) NULL,
    estado CHAR(2) DEFAULT 'SP',
    cpf CHAR(11) UNIQUE NOT NULL,
    idade TINYINT NOT NULL CHECK (idade >= 16)
);

CREATE TABLE aluno
(
	nome_completo VARCHAR(65) NOT NULL,
    endereco VARCHAR(100) NULL,
    estado CHAR(2) DEFAULT 'SP',
    cpf CHAR(11) NOT NULL,
    CONSTRAINT UN_TB_ALUNO_CPF UNIQUE (cpf),
    idade TINYINT NOT NULL,
    CONSTRAINT CHK_TB_ALUNO_IDADE CHECK (idade >=16),
    email VARCHAR(100) NOT NULL,
	CONSTRAINT UN_TB_ALUNO_EMAIL UNIQUE (email)
);

CREATE TABLE aluno
(
	nome_completo VARCHAR(65) NOT NULL,
    endereco VARCHAR(100) NULL,
    estado CHAR(2) DEFAULT 'SP',
    cpf CHAR(11) NOT NULL,
    idade TINYINT NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT UN_TB_ALUNO_CPF_EMAIL UNIQUE (cpf, email),
    CONSTRAINT CHK_TB_ALUNO_IDADE_ESTADO CHECK (idade >=16 AND estado = 'SP')
);

DROP TABLE aluno;

INSERT INTO aluno (nome_completo, endereco, estado, cpf, idade)
VALUES ('MANIN', 'RUA TATATA', 'SP', '11111111111', '18');

SELECT * FROM aluno;