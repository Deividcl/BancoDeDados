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
values (1, 'Terra', 'Cheio de �gua', '1'),
	   (2, 'Marte', 'Extraterrestre', '2')
select * from planeta

insert into sistema
values (1, 'Sistema Solar'),
	   (2, 'Sistema Estelar')
select * from Sistema

insert into raca
values (1, 'Brancos', 'pele clara', '01/01/01'),
	   (2, 'Negros', 'pele escura', '01/01/01')
select * from raca
