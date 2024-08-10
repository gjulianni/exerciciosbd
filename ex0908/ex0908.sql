-- Criar banco de dados bd_sistema_bancario
CREATE DATABASE bd_sistema_bancario;


-- Criar 5 tabelas quaisquer
CREATE TABLE usuario (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(70)
);

CREATE TABLE vendedor (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(70)
);

CREATE TABLE produto (
	id SERIAL PRIMARY KEY,
	preco FLOAT,
	nome VARCHAR(50)
);

CREATE TABLE venda (
	id SERIAL PRIMARY KEY,
	id_venda INT REFERENCES produto(id),
	por_vendedor INT REFERENCES vendedor(id)
);

CREATE TABLE fazenda (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50),
	localizacao VARCHAR (60)
);


-- Criar tabelas conforme MER (Sistema Bancario):
CREATE TABLE cliente (
	nome_cliente VARCHAR(50) PRIMARY KEY,
	cidade_cliente VARCHAR(20),
	endereco_cliente VARCHAR(60)
);

CREATE TABLE emprestimo (
	numero_emprestimo BIGINT PRIMARY KEY,
	nome_agencia VARCHAR(25), 
	valor FLOAT
);

CREATE TABLE conta (
	numero_conta BIGINT PRIMARY KEY,
	nome_agencia VARCHAR(25),
	saldo DECIMAL
);

CREATE TABLE agencia (
	nome_agencia VARCHAR(25) PRIMARY KEY,
	cidade_agencia VARCHAR(30),
	depositos DECIMAL
);

-- Deletar as 5 tabelas criadas aleatoriamente
DROP TABLE usuario;
DROP TABLE vendedor;
DROP TABLE produto;
DROP TABLE fazenda;
DROP TABLE venda;

-- alterar as tabelas conforme o MER atualizado

--Alterando o nome das tabelas
ALTER TABLE cliente RENAME TO tbl_cliente;
ALTER TABLE emprestimo RENAME TO tbl_emprestimo;
ALTER TABLE conta RENAME TO tbl_conta;
ALTER TABLE agencia RENAME TO tbl_agencia;


--Alterando as tabelas
ALTER TABLE tbl_cliente ADD idade INT, ADD CPF CHAR(11); -- Adição das colunas na table tbl_cliente
ALTER TABLE tbl_agencia RENAME COLUMN cidade_agencia TO endereco_agencia; -- Renomeando coluna cidade_agencia para endereco_agencia


-- Criar um esquema com o seu nome
CREATE SCHEMA gabriel;

