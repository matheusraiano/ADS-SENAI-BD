-- deixar maiusculo
select upper('frase fica maiuscula') as 'upper';
select upper(first_name) from employees;

-- deixar minusculo
select lower('FRASE FICA MINUSCULA') as 'lower';

-- concatenar
select concat('pin', 'da', 'mo', 'nhan', 'ga', 'ba') as 'concat'; 

-- concatenar com separador
select concat_ws('-', '2024', '05', '05');

-- mostrar um numero em que posição da string a palavra está
select locate('nova', 'Cada dia é uma nova oportunidade para brilhar');

-- conta quantos caracteres tem
select length('Cada dia é uma nova oportunidade para brilhar');

-- mostra a string de modo invertido
select reverse('siul');

-- remove tudo que tiver no começo e no fim (que estiver no parametro)
select trim(both ' ' from '    MANO   ');

-- pega a quantidade de digitos escolhida da esqueda para direita
select left('pelmas-to', 6);

-- pega a quantidade de digitos escolhida da direita para esquerda
select right('pelmas-to', 2);

-- realiza cortes e busca em trechos da string
select substr('até ode eu posso ir', 5, 8);

-- verificar e selecionar a palavra pela fonética
create database teste1;
use teste1;

create table pessoa
(
	id int primary key auto_increment,
    nome varchar(40),
    cpf char(11)
);

insert into pessoa (nome, cpf) values 
('marcos', 11111111111),
('marcus', 22222222222),
('markus', 33333333333);

select * from pessoa where soundex(nome) = soundex('marcos');

-- tempo em dias, entre a data do pedido 
use empresa_db;

select numeroPedido, timestampdiff(day, dataPedido, dataEntrega) as 'diferença em dias' from tb_pedido;

-- mostra data atual
select curdate();

-- formartar data para padrao, por exemplo br
select date_format('1984-02-18', '%d/%m/%Y');

-- adicionar data
select date_add(curdate(), interval 30 day);

-- ver o periodo, diferança no caso
select period_diff('198402', '202604');

-- verifica quantos dias correram quantos dias passaram desde o primeiro dia do ano
select dayofyear('2026-04-23');

-- converte o primeiro parametro no que você colocar
select cast('2026-04-23' as date);
select cast(12 as char);
select cast(12 as decimal(4,2));

-- funções matemáticas
select 3 + 4;
select 12 - 1;
select 3 * 4;
select 9 / 2;

-- mostra o pi
select pi();

-- passo um numero com casa decimais e ele arredonda para o prox inteiro, cima
select ceiling(12.34);

-- passo um numero com casa decimais e ele arredonda para o prox inteiro, baixo
select floor(12.34);

-- exponenciação, primeiro o valor depois o expoente
select pow(4,2);

-- raiz quadrada
select sqrt(16);

-- seno
select sin(10);

-- hexadecimal
select hex(1200);

-- coloca o valor e depois a quantidade de casas depois da virgula que voce quer
select round(123.333333333, 2);

-- mostra qual o maior
select max(frete) from tb_pedido;

-- mostra qual o menor
select min(frete) from tb_pedido;

-- mostra a média
select avg(frete) from tb_pedido;

-- faz a soma
select sum(frete) from tb_pedido;

--
select count(*) from tb_pedido;