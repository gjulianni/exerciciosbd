-- criar bd_aula04
CREATE DATABASE bd_aula04;

--tabelas para o exercicios
create domain chk_categoria text check (value='DRAMA' or value='COMEDIA');
create domain chk_status text check (value='DISPONIVEL' or value='ALUGADO');
create table tbl_cliente (codigo_cliente integer PRIMARY KEY, nome text not null, cidade text, endereco text);
create table tbl_titulo (codigo_titulo integer primary key, titulo text not null, descricao text, categoria chk_categoria);
create table tbl_livros (cod_livro integer PRIMARY KEY, codigo_titulo integer REFERENCES tbl_titulo(codigo_titulo), status chk_status DEFAULT 'DISPONIVEL');
create table tbl_emprestimo (numero_emprestimo integer PRIMARY KEY, codigo_cliente integer REFERENCES tbl_cliente(codigo_cliente), codigo_livro integer REFERENCES tbl_livros(cod_livro));
-- Inserir dados na tabela tbl_cliente
INSERT INTO tbl_cliente (codigo_cliente, nome, cidade, endereco)
values 
(1, 'João Silva', 'São Paulo', 'Rua A, 123'),
(2, 'Maria Santos', 'Rio de Janeiro', 'Av. B, 456'),
(3, 'Pedro Almeida', 'Belo Horizonte', 'Rua C, 789'),
(4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
(5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');

-- Inserir dados na tabela tbl_titulo
INSERT INTO tbl_titulo (codigo_titulo, titulo, descricao, categoria)
values
(1, 'Aventuras Urbanas', 'Uma história emocionante', 'DRAMA'),
(2, 'Mistérios Antigos', 'Enigmas por resolver', 'COMEDIA'),
(3, 'Amor nas Estrelas', 'Um romance intergalático', 'DRAMA'),
(4, 'Código Enigmático', 'Segredos ocultos', 'COMEDIA'),
(5, 'Histórias Perdidas', 'Contos esquecidos', 'DRAMA');

-- Inserir dados na tabela tbl_livros
INSERT INTO tbl_livros (cod_livro, codigo_titulo, status)
values
(1, 1, 'DISPONIVEL'),
(2, 1, 'ALUGADO'),
(3, 2, 'DISPONIVEL'),
(4, 3, 'ALUGADO'),
(5, 4, 'DISPONIVEL');


-- Inserir dados na tabela tbl_emprestimo
INSERT INTO tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
values
(1, 1, 2),
(2, 2, 4),
(3, 3, 1),
(4, 4, 5),
(5, 5, 3);

--selecionar todos os clientes
SELECT * from tbl_cliente

--Selecionar os clientes que moram em São Paulo
select * from tbl_cliente where cidade = 'São Paulo';

--Selecionar os clientes onde o código é maior que 3
select * from tbl_cliente where cidade = 'São Paulo';

--Selecionar todos os títulos
select * from tbl_titulo;

--crie uma tabela chamada tbl_cliente2 com uma coluna integer chamada código
create table tbl_cliente2 (
	codigo INTEGER
);

--Copie todos dos códigos da tbl_cliente para essa nova tabela usando o SQL Insert.
INSERT INTO tbl_cliente2 
SELECT codigo_cliente
FROM tbl_cliente

--Atualize todos os livros alugados para disponivel
UPDATE tbl_livros
SET status = 'DISPONÍVEL'
WHERE cod_livro >= 0;

--Delete todos as linhas da tabela tbl_cliente2 onde o código for maior que 3
UPDATE tbl_livros
SET status = 'DISPONÍVEL'
WHERE cod_livro >= 0;


