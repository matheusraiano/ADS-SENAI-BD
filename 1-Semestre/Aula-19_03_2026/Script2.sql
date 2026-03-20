CREATE DATABASE aulaDBTB;

USE aulaDBTB;

CREATE TABLE aluno
(
	id_matricula INT NOT NULL AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    nome_completo VARCHAR(65),
    CONSTRAINT PK_TB_ALUNO_ID PRIMARY KEY (id_matricula),
    CONSTRAINT UN_TB_ALUNO_ID UNIQUE (cpf)
);

CREATE TABLE aluno
(
	id_matricula INT NOT NULL AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    nome_completo VARCHAR(65),
    PRIMARY KEY (id_matricula, cpf),
    CONSTRAINT UN_TB_ALUNO_ID UNIQUE (cpf)
);

CREATE TABLE aluno
(
	id_matricula INT SERIAL DEFAULT VALUE,
    cpf CHAR(11) NOT NULL,
    nome_completo VARCHAR(65),
    id_curso INT NOT NULL,
    CONSTRAINT FK_TB_ALUNO_TB_CURSO FOREIGN KEY(id_curso) REFERENCES curso(id_curso),
    CONSTRAINT UN_TB_ALUNO_ID UNIQUE (cpf)
);

CREATE TABLE curso
(
	id_curso INT SERIAL DEFAULT VALUE,
    nome_curso VARCHAR(30)
);

DROP TABLE aluno;
DROP TABLE curso;

INSERT INTO curso (nome_curso) VALUES ('ADS');
INSERT INTO curso (nome_curso) VALUES ('MECA');

SELECT * FROM curso;

INSERT INTO aluno (cpf, nome_completo, id_curso) VALUES ('MANIN', '11111111111', '1');
INSERT INTO aluno (cpf, nome_completo, id_curso) VALUES ('MANO', '11111111112', '2');

SELECT * FROM aluno;