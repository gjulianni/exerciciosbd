create database bd_aula07;
\c bd_aula07
create table tbl_fornecedor (cod_fornecedor serial primary key, nome text not null, status integer, cidade text);
create table tbl_peca (cod_peca serial primary key, nome text not null, cor text, preco numeric, cidade text);
create table tbl_estoque (cod_compra serial primary key, 
						 cod_fornecedor integer references tbl_fornecedor(cod_fornecedor),
						cod_peca integer references tbl_peca(cod_peca),
						quantidade integer);
						
insert into tbl_fornecedor(nome,status,cidade) 
values ('A',30,'LONDRES'),('B',20,'PARIS'),('C',10,'PARIS'),('D',10,'LONDRES');

INSERT INTO tbl_peca(nome, cor, preco, cidade) values
('PLACA','AZUL',5,'LONDRES'),('MESA','VERMELHA',10,'PARIS'),('CADERNO','PRETA',14,'ROMA'),
('TESOURA','VERMELHA',12,'LONDRES');

INSERT INTO tbl_estoque(cod_fornecedor, cod_peca, quantidade) values
(1,1,30),(2,1,30),(3,2,10),(3,3,50);

--1 Listar o nome dos fornecedores(maiusculo) e das peças(minusculo) que se situam na mesma cidade, ordenado pelo nome
SELECT UPPER(f.nome) AS fornecedor, LOWER(p.nome) AS peca
FROM tbl_fornecedor f
JOIN tbl_estoque e ON f.cod_fornecedor = e.cod_fornecedor
JOIN tbl_peca p ON e.cod_peca = p.cod_peca
WHERE f.cidade = p.cidade
ORDER BY fornecedor, peca;

--2 listar as cidades onde existem fornecedores (sem valores duplicados)
SELECT DISTINCT cidade
FROM tbl_fornecedor;

--3 Listar o nome e a cor das peças do fornecedor com código 3, ordenado pelo nome da peça
SELECT nome, cor FROM tbl_peca WHERE cod_peca IN (SELECT cod_peca FROM tbl_estoque WHERE cod_fornecedor = 3) 
ORDER BY nome;

--4 Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1. 
SELECT f.nome, f.cidade
FROM tbl_fornecedor f
JOIN tbl_estoque e ON f.cod_fornecedor = e.cod_fornecedor
WHERE e.cod_peca = 1
GROUP BY f.nome, f.cidade
HAVING SUM(e.quantidade) > 10;

--5 Listar a quantidade total de peças com código 1, fornecidas pelos fornecedores.
SELECT SUM(e.quantidade) AS total_quantidade FROM tbl_estoque e WHERE e.cod_peca = 1;

--6 Listar a média dos preços das peças fornecidas pelo fornecedor com código 3.
SELECT AVG(p.preco) AS media_preco
FROM tbl_peca p
JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
WHERE e.cod_fornecedor = 3;

--7 lista o valor da pecas mais cara e a mais barata.
SELECT AVG(p.preco) AS media_preco
FROM tbl_peca p
JOIN tbl_estoque e ON p.cod_peca = e.cod_peca
WHERE e.cod_fornecedor = 3;

--8 listar a quantidade de peças cadastradas
SELECT SUM(quantidade) AS total_pecas
FROM tbl_estoque;

--9 listar a quantidade de cidades diferentes onde existem peças cadastradas
SELECT COUNT(DISTINCT cidade) AS quantidade_cidades FROM tbl_peca;

--10 listar a media dos precos de todas as peças, com somente 1 digito após a virgula.
SELECT ROUND(AVG(preco), 1) AS media_precos
FROM tbl_peca;

