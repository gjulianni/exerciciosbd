-- criar banco de dados bd_aula03
CREATE DATABASE bdex;


-- criar tabelas do MER 
create table tbl_cliente (
	codigo_cliente INTEGER PRIMARY KEY,
	nome TEXT NOT NULL,
	cidade TEXT,
	endereco TEXT
);

create table tbl_titulo (
	codigo_titulo INTEGER PRIMARY KEY,
	titulo TEXT NOT NULL,
	descricao TEXT,
	categoria TEXT
);

create table tbl_livros (
	cod_livro INTEGER PRIMARY KEY,
	codigo_titulo INT REFERENCES tbl_titulo(codigo_titulo),
	status TEXT
);

create table tbl_emprestimo (
	numero_emprestimo INTEGER PRIMARY KEY,
	codigo_cliente INT REFERENCES tbl_cliente(codigo_cliente),
	codigo_livro INT REFERENCES tbl_livros(cod_livro)
);

-- criar domains
CREATE DOMAIN chk_status text check(value in ('DISPONIVEL','ALUGADO'));
CREATE DOMAIN chk_categoria text check(value in ('DRAMA','COMEDIA'));

-- adicionar domain a tabela
ALTER TABLE tbl_titulo ALTER COLUMN categoria SET DATA TYPE chk_categoria;
ALTER TABLE tbl_livros ALTER COLUMN status SET DATA TYPE chk_status;


-- adicionar chaves estrangeiras

-- Já fiz no create table direto


