CREATE DATABASE aulaDB;

DROP DATABASE aulaDB;

USE aulaDB;

CREATE TABLE aluno
(
	id_matricula INT SERIAL DEFAULT VALUE,
    cpf CHAR(11) NOT NULL,
    nome_completo VARCHAR(60),
    id_curso INT NOT NULL,
    CONSTRAINT FK_TB_ALUNO_TB_CURSO FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE curso
(
	id_curso INT SERIAL DEFAULT VALUE,
    nome_curso VARCHAR(30)
);

ALTER TABLE aluno ADD eh_ativo BIT;

ALTER TABLE aluno MODIFY COLUMN eh_ativo BIT NOT NULL DEFAULT 1;

CREATE TABLE teste
(
	id_teste int,
    fk_id_matricula int
);

ALTER TABLE teste ADD PRIMARY KEY(id_teste);

ALTER TABLE teste ADD FOREIGN KEY(fk_id_matricula) REFERENCES aluno(id_matricula);

ALTER TABLE teste ADD campo_teste VARCHAR(50);

ALTER TABLE teste DROP campo_teste;

ALTER TABLE teste DROP CONSTRAINT teste_ibfk_2;

DROP TABLE teste;