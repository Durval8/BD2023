USE PUBS;
GO

--- a) Todos os tuplos da tabela autores (authors) ;
--SELECT *
--	FROM authors

--- b) O primeiro nome, o �ltimo nome e o telefone dos autores;
--- SELECT au_fname, au_lname, phone from authors;

--- c) Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o �ltimo nome (ascendente);
--select au_fname, au_lname, phone from authors
--order by au_fname, au_lname

--- d) Consulta definida em c) mas renomeando os atributos para (first_name, last_name,telephone);
--select au_fname as first_name, au_lname as last_name, phone as telephone
---	from authors
--	order by au_fname, au_lname

--- e) Consulta definida em d) mas s� os autores da Calif�rnia (CA) cujo �ltimo nome � diferente de �Ringer�;
--select au_fname as first_name, au_lname as last_name, phone as telephone
--	from authors
--	where au_lname != 'Ringer' and state = 'CA'
--	order by au_fname, au_lname

--- f) Todas as editoras (publishers) que tenham �Bo� em qualquer parte do nome;
--select pub_name 
--	from publishers
--	where pub_name like '%BO%'

--- g) Nome das editoras que t�m pelo menos uma publica��o do tipo �Business�;
--select pub_name from titles, publishers
--	where type='Business' and titles.pub_id=publishers.pub_id

--- h) N�mero total de vendas de cada editora;
