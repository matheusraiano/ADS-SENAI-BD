USE aulaDBTB;

CREATE TABLE aluno
(
	cpf CHAR(11),
    nome_aluno VARCHAR(65),
    cpf TINYTEXT,
    html TEXT,
    html MEDIUMTEXT,
    capacidades SET('comunicação','argumentação','enrolação'),
    habilidades ENUM('banco de dados','front end')
);