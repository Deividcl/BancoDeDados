create database BD_Atividade
use BD_Atividade

create table produto(
	chave_produto int not null,
	descricao varchar(30) not null,
	preco decimal(10,2) not null
	constraint pk_produto primary key(chave_produto)
)

create table compra(
	chave_compra int not null,
	codigo_nota varchar(30) not null,
	data date not null,
	cliente int,
	constraint pk_compra primary key(chave_compra)
)

create table cliente(
	chave_cliente int not null,
	nome varchar(50) not null,
	pin varchar(6) default '123456',
	cpf varchar(11) not null,
	constraint pk_cliente primary key(chave_cliente),
	constraint unique_cpf unique(cpf)
)

create table itens_compra(
	compra int not null,
	produto int not null,
	quantidade decimal(5,1) default 0,
	constraint pk_itens_compra primary key(compra,produto)
)


alter table compra add constraint fk_compra_cliente foreign key(cliente) references cliente(chave_cliente)
alter table itens_compra add constraint fk_itenscompra_compra foreign key(compra) references compra(chave_compra)
alter table itens_compra add constraint fk_itenscompra_produto foreign key(produto) references produto(chave_produto)

insert into produto values (1,'Pao',0.5), (2,'Coca-Cola',2),(3,'Bala',0.1),(4,'Queijo Frescal',6),(5,'Brahma',4),(6,'Lapis',2)
insert into cliente values (1,'Rodrigo','999999','1234543221'),(2,'Paulo','888888','191919191'),(3,'Jose','000000','0101010101')
insert into compra  values (1,'ASDAS1231','01-02-2001',3),(2,'AABBCC11','01-02-2001',3),(3,'LLLAAAL21','01-03-2001',1),(4,'QQWWQQ','02-02-2010',2)
insert into itens_compra values (1,1,1),(1,2,2),(1,3,4),(2,1,10),(2,3,10),(2,5,3),(3,1,100),(3,4,10),(4,1,100),(4,2,100),(4,5,200)


--1)Faça uma view que mostre a quantidade de compras feitas por cada cliente


create view QTDa_compra as select cliente.nome, count (*) as Quantidade from cliente
join compra on cliente.chave_cliente = compra.cliente
group by cliente.nome

select distinct * from QTDa_compra

--2)Faça uma view que retorne os 3 produtos mais caros, ordenados do mais caro para o mais barato

create view prod_caros as select preco as Valor from produto
select top 3 * from prod_caros order by valor desc

select top 3 * from produto order by preco desc

--3)Faça uma função que dado um id de compra, recebido por parâmetro, retorne o nome dos produtos e a quantidade que foram comprados

create function COP_retorn (@id_compra int)
returns table 
as return 
(select produto.descricao, itens_compra.quantidade from itens_compra
join produto on produto.chave_produto = itens_compra.produto 
where itens_compra.compra = @id_compra)

select distinct * from COP_retorn(2)


--4)Faça uma função que dado um id de compra, recebido por parâmetro,  retorne a quantidade de produtos que foram comprados

create function f_compra_quantidade (@id_comp int)
returns int
as begin
declare @compra int 
select @compra = sum(quantidade) from itens_compra
where compra = @id_comp
return @compra
end

select dbo.f_compra_quantidade(1)

select compra.codigo_nota, dbo.f_compra_quantidade(1) 
from compra where chave_compra = 1


--5)crie um novo atributo na tabela cliente 
 -- RG Varchar(20) 

  alter table cliente add RG varchar (20)
  select * from cliente

 --6) faça um procedimento que mostre o nome e o preço total dos produtos comprados em cada compra, bem como o valor total da compra. O layout deve ficar
 --como o exemplo abaixo:

  create view tabelinha as select descricao as Descrição, preco as Preço, quantidade as Quantidade from itens_compra
 join produto on produto = chave_produto
 join compra on compra = chave_compra

 select * from tabelinha order by Preço

 select  Descrição [Compra feita], Preço [Valor],
    SUM(Preço) [Valor P/Compra],
	SUM(Quantidade) [Total]
FROM
   tabelinha
  GROUP BY 
  Preço, Descrição
  ORDER BY 
  Preço, Descrição


  create procedure tabela
  as begin

--Coca-Cola   2.0
--Pao         1.0
--
--Total       3.0
----------------------------------------
--Coca-Cola   5.0
--Brahma      100.0
--
--Total       105.0