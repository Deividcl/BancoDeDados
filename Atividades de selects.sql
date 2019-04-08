create database Exercicios
use Exercicios


create table usuario(
id_usuario INT primary key,
id_tipo_usuario INT,
nome VARCHAR(80),
sexo CHAR(1)
)

create table Emprestimo (
numero_exemplar INT,
id_obra INT,
id_usuario INT, 
data_inicio DATE,
data_fim DATE,
devolucao DATE,
primary key ( data_inicio, id_obra, id_usuario)
)

create table TipoUsuario(
id_tipo_usuario INT primary key,
tipo VARCHAR (45)
)

create table Exemplar (
numero_exemplar INT primary key,
id_obra INT,
id_editora INT,
valor DECIMAL(13,2)
)

-- foreign key(id_obra, id_editora)
-- )
drop table Exemplar
drop table Emprestimo
create table Editora(
id_editora INT primary key,
nome_editora VARCHAR(80)
)

create table Obra(
id_obra INT primary key,
nome_obra VARCHAR(80)
)

create table Pais(
id_pais CHAR(3) primary key,
nome_pais VARCHAR(90)
)

create table Autor(
id_autor INT primary key,
id_pais CHAR(3),
nome_autor VARCHAR(75)
)

create table Autoria(
fk_id_obra INT,
fk_id_autor INT,
primary key(fk_id_obra, fk_id_autor)
)

alter table usuario add foreign key(id_tipo_usuario) references TipoUsuario(id_tipo_usuario)
alter table Autor add foreign key(id_pais) references Pais(id_pais)
alter table Emprestimo add foreign key(numero_exemplar) references Exemplar(numero_exemplar)
alter table Emprestimo add foreign key(id_obra) references Obra(id_obra)
alter table Emprestimo add foreign key(id_usuario) references usuario(id_usuario)
alter table Exemplar add foreign key(id_obra) references Obra(id_obra)
alter table Exemplar add foreign key(id_editora) references Editora(id_editora)
alter table Autoria add foreign key(fk_id_obra) references Obra(id_obra)
alter table Autoria add foreign key(fk_id_autor) references Autor(id_autor)


insert into Pais values('CAN', 'Canadá'),
						('POR', 'Portugal'),
						('FRA','França'),
						('BRA','Brasil'),
						('ARG', 'Argentina')


insert into Autor values(1, 'CAN', 'RAMEZ ELMASRI'), 
						(2, 'CAN', 'SHAMKANT B. NAVATHE'),		
						(3, 'POR', 'HENRY F. KORT'), 
						(4, 'FRA', 'ABRAHAM SILBERCHATZ'), 
						(5, 'FRA', 'VALDURIEZ PATRICK'),
						(6, 'BRA', 'NÍVIO ZIVIANI'),
						(7, 'ARG', 'MARCOS VIANA VILLAS')

insert into usuario values ('1', '2', 'Cris dos Santos', 'F'),
							('2', '2', 'Diego Augusto Barros', 'M'),
							('3', '1', 'Marcelo Andrade', 'M'),
							('4', '1', 'Márcio Duarte', 'M'),
							('5', '1', 'Ana Maria Silva', 'F'),
							('6', '1', 'Ana Luiza da Silva', 'F'),
							('7', '1', 'Francisco Diniz', 'F'),
							('8', '1', 'Carlos Rodrigues', 'M'),
							('9', '1', 'Ana Carolina Costa', 'F'),
							('10', '1', 'Francisca Diniz', 'F'),
							('11', '3', 'Maria dos Santos', 'F'),
							('12', '3', 'André Silva', 'M')

insert into TipoUsuario values ('1', 'Aluno'),
								('2', 'Professor'),
								('3', 'Funcionário')

insert into Exemplar values ('1', '1', '1', '99.00'),
							('2', '2', '2', '100.00'),
							('3', '3', '3', '50.00'),
							('4', '4', '4', '45.00'),
							('5', '4', '4', '50.00'),
							('6', '5', '5', '110.00'),
							('7', '5', '5', '110.00')

insert into Obra values ('1', 'Sistemas de Banco de Dados: Fundamentos e Aplicações'),
						('2', 'Sistemas de Banco de Dados'),
						('3', 'Princípios de Sistemas de Banco de Dados Distribuídos'),
						('4', 'Projeto de Algoritmos com Implementação em C e Pascal'),
						('5', 'Estrutura de Dados')

insert into Editora values ('1', 'LTC'),
							('2', 'Campus'),
							('3', 'FTD'),
							('4', 'Atlas'),
							('5', 'Bookman')

insert into Emprestimo values ('1', '1', '1', '10/06/2018', '20/06/2018', '19/06/2018'),
							('1', '1', '1', '10/07/2018', '20/07/2018', '15/07/2018'),
							('1', '2', '1', '12/07/2018', '23/07/2018', NULL),
							('1', '3', '2', '08/07/2018', '15/07/2018', '16/07/2018'),
							('1', '3', '3', '16/07/2018', '20/07/2018', '22/07/2018'),
							('1', '3', '4', '23/07/2018', '28/07/2018', '25/07/2018'),
							('1', '3', '4', '28/07/2018', '05/08/2018', NULL),
							('1', '4', '5', '12/07/2018', '19/07/2018', '20/01/2018'),
							('2', '4', '6', '20/07/2018', '28/07/2018', NULL),
							('3', '5', '7', '20/07/2018', '28/07/2018', '28/01/2018')

insert into Autoria values ('1', '1'),
						('1', '2'),
						('2', '3'),
						('3', '4'),
						('3', '5'),
						('4', '6'),
						('5', '7')

select * from Pais
select * from Autor
select * from TipoUsuario
select * from Emprestimo
select * from usuario
select * from Exemplar
select * from Obra
select * from Autoria
select * from Editora

--[SELECT SIMPLES] Selecione o nome e o id dos países de língua portuguesa.select nome_pais, id_pais from Pais where id_pais = 'POR'

--[SELECT SIMPLES] Selecione o id e nome de todos os usuários do sexo feminino.
select id_usuario, nome from usuario where sexo = 'F'

--[SELECT SIMPLES] Selecione o id e nome de todos os usuários do sexo masculino.select id_usuario, nome from usuario where sexo = 'M'

--[SELECT SIMPLES] Selecione o id e nome de todos os usuários que não tem Ana no nome.select id_usuario, nome from usuario where nome not like '%Ana%'

--[SELECT SIMPLES] Selecione o id e nome de todos os usuários que tenham dos Santos no nome
select id_usuario, nome from usuario where nome like '%dos Santos%'

--[SUBQUERY] Selecione o id e o nome dos usuários com empréstimoselect id_usuario, nome from usuario where id_usuario in
						(select id_usuario from Emprestimo where id_usuario <> 0)

--[SUBQUERY] Selecione o id e o nome dos autores canadensesselect id_autor, nome_autor from Autor where id_pais in 
						(select id_pais from Pais where id_pais = 'CAN') 

--[SUBQUERY] Selecione o id e o nome dos usuários que já devolveram o empréstimoselect id_usuario, nome from usuario where id_usuario in
						(select id_usuario from Emprestimo where devolucao is not null)

--[JOIN EXPLÍCITO] Selecione o id, nome do usuário e data de devolução de todos os empréstimos feitos.select c.id_usuario as 'Usuário', c.nome as 'Nome do usuário', d.devolucao as 'Data de devolução' from usuario as c
join Emprestimo as d on d.id_usuario = c.id_usuario where devolucao is not null

--[JOIN EXPLÍCITO] Selecione nome da obra e nome da editoraselect e.nome_editora as 'Nome da Editora', c.nome_obra as 'Nome da obra' from Obra as c
join Editora as e on e.id_editora = c.id_obra

--[JOIN EXPLÍCITO] Selecione o nome da editora e o nome de seus autoresselect e.nome_editora as 'Nome da Editora', c.nome_autor as 'Nome do Autor' from Editora as e
join Autor as c on c.id_autor = e.id_editora

--[JOIN EXPLÍCITO] Selecione o nome do pais e o nome de suas obras--select e.nome_pais as 'Nome do País', c.nome_obra as 'Nome das obras' from Pais as e
--join Obra as c on c.id_obra = e.id_pais 

--[JOIN EXPLÍCITO] Selecione o id e nome dos usuários que ainda não devolveram os empréstimosselect c.id_usuario as 'Usuário', c.nome as 'Nome do usuário' from usuario as c
join Emprestimo as d on d.id_usuario = c.id_usuario where devolucao is null

--[NATURAL JOIN] Selecione o nome da editora e o nome da obra
select e.nome_editora as 'Nome da editora', c.nome_obra as 'Nome da obra' from Editora as e
inner join Obra as c on c.id_obra = e.id_editora

--[NATURAL JOIN] Selecione id_obra, obra, nome dos autores e valor do exemplar
select c.id_obra as 'ID Obra', c.nome_obra as 'Nome das Obras', d.nome_autor as 'Nome do Autor', e.valor as 'Valor' from Obra as c
inner join Autor as d on d.id_autor = c.id_obra
inner join Exemplar as e on e.numero_exemplar = c.id_obra

--[NATURAL JOIN] Selecione id_obra e nome da obra dos exemplares com valor menor do que 100select c.id_obra as 'ID Obra', c.nome_obra as 'Nome da Obra' from Obra as c
inner join Exemplar as e on e.numero_exemplar = c.id_obra where e.valor < 100

--[NATURAL JOIN] Selecione id, nome e descrição do tipo de usuário de todos os usuáriosselect d.id_usuario as 'ID Usuario', d.nome as 'Nome Do Usuario', e.tipo as 'Descrição do usuario' from usuario as d
inner join TipoUsuario as e on e.id_tipo_usuario = d.id_usuario

--[NATURAL JOIN] Selecione nome do autor e nome da obra dos autores brasileiros--select c.nome_autor as 'Nome do Autor', d.nome_obra as 'Nome da Obra' from Autor as c--inner join Obra as d on d.id_obra = c.id_autor --inner join Pais as p on p.id_pais = c.id_autor where p.id_pais = 'BRA'--[VIEWS] Crie uma visão UsuarioView com todos os dados da tabela usuáriocreate view UsuarioView as select * from usuario as dselect * from UsuarioView--[VIEWS] Crie uma visão UsuarioFemininoView com todos os dados da tabela usuário com sexo feminino
create view UsuarioFemininoView as select * from usuario where sexo = 'F'
select * from UsuarioFemininoView

--[VIEWS] Crie uma visão ProfessoresView com todos os dados dos usuários professores
create view ProfessoresView as select * from usuario as c where id_tipo_usuario = '2'
select * from ProfessoresView

--[VIEWS] Crie uma visão DevedoresView com id e nome dos usuário e valor do exemplar que não foram devolvidoscreate view DevedoresView as select c.id_usuario as 'ID usuario', c.nome as 'Nome do usuario', d.valor as 'Valor do Exemplar' from usuario as cjoin Exemplar as d on d.numero_exemplar = c.id_usuariojoin Emprestimo as e on e.id_usuario = c.id_usuario  where devolucao is nullselect * from DevedoresView








