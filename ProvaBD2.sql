create database prova_BD2
use prova_BD2

create table planeta(
	id int primary key,
	nome varchar(30),
	descricao varchar(40),
	fk_sistema int
)

create table sistema(
	id int primary key,
	descricao varchar(40)
)

create table raca(
	id int primary key,
	descricao varchar(40),
	nome varchar(40),
	data date
)

create table planeta_raca(
	fk_planeta int,
	fk_raca int ,
	primary key(fk_planeta, fk_raca)
)
--Alterar, inserir chaves em tabelas
alter table planeta 
add foreign key (fk_sistema)
references sistema(id)

alter table planeta_raca 
add foreign key (fk_planeta)
references planeta(id)

alter table planeta_raca 
add foreign key (fk_raca)
references raca(id)

-- Inserir atributos nas tabelas
insert into planeta
values (1, 'Terra', 'Cheio de água', 1),
	   (2, 'Marte', 'Extraterrestre', 2)
	   

insert into sistema
values (1, 'Sistema Solar'),
	   (2, 'Sistema Estelar')

insert into raca 
values (1, 'Brancos', 'pele clara', '01/01/01'),
	   (2, 'Negros', 'pele escura', '02/02/02')

insert into planeta_raca 
values (1,1), 
       (1,2), 
       (2,2) 

select * from raca
join planeta_raca on raca.id = planeta_raca.fk_raca
join planeta on planeta.id = planeta_raca.fk_planeta

-- Selecionar o nome das raças dentro do sistema solar
select raca.nome as 'Raça',
planeta.nome as 'Planeta',
sistema.descricao as 'Sistema' from raca
join planeta_raca on raca.id = planeta_raca.fk_raca
join planeta on planeta.id = planeta_raca.fk_planeta
join sistema on planeta.fk_sistema = sistema.id
where sistema.descricao = 'Sistema Solar'

-- Selecionar quantos planetas existem em cada tem em cada sistemas
select sistema.descricao as 'Sistema',
       count(planeta.nome) from planeta
join sistema on planeta.fk_sistema = sistema.id
group by sistema.descricao

-- Selecionar quantas raças existem em cada tem em cada planeta

select planeta.nome, count (raca.nome) as 'QTD' from planeta
join planeta_raca on planeta_raca.fk_planeta = planeta.id
join raca on planeta_raca.fk_raca = raca.id
group by planeta.nome



--sp_help raca ou sp_columns raca  (mostra informaçoes das tabelas)