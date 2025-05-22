CREATE DATABASE loja_pascotto;
USE loja_pascotto;

CREATE TABLE fornecedor(
	id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (250),
    cnpj VARCHAR (50),
    telefone VARCHAR (50),
	cpf VARCHAR (50)
);

CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100),
    preco DECIMAL,
    quantidade_estoque INT,
    id_fornecedor INT,
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor (id_fornecedor)
);

CREATE TABLE cargos (
	id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (50),
    descricao VARCHAR (250)
);

CREATE TABLE colaborador (
	id_colaborador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (250),
    id_cargo INT,
    salario DECIMAL,
	CONSTRAINT fk_colaborador_cargo FOREIGN KEY (id_cargo) REFERENCES cargos (id_cargo)
);

CREATE TABLE pedidos (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
	data_pedido DATE,
	quantidade INT,
	id_colaborador INT,
	id_produto INT,
	CONSTRAINT fk_pedido_colaborador FOREIGN KEY (id_colaborador) REFERENCES colaborador (id_colaborador),
	CONSTRAINT fk_pedido_produto FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

ALTER TABLE fornecedor ADD email VARCHAR (100);

CREATE TABLE categorias (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	nome_categoria VARCHAR (100)
);
    
ALTER TABLE produtos ADD id_categoria INT;
ALTER TABLE produtos ADD CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria);

INSERT INTO fornecedor (nome, cnpj, telefone, cpf, email) VALUES
("Coca-Cola", "12.456.784/0001-00", "+55 (11) 91234-6147", "123.456.789-22", "coca@gmail.com"),
("Heineken", "98.765.432/0001-11", "+55 (11) 99876-5432", "987.654.321-33", "heineken@gmail.com");
INSERT INTO categorias (nome_categoria) VALUES
("Refrigerante"),
("Bebida Alcoolica");
INSERT INTO produtos (nome, preco, quantidade_estoque, id_fornecedor, id_categoria) VALUES
("Coca-Cola", 11.55, 50, 1, 1),
("Cerveja Heineken", 12.29, 44, 2, 2);
INSERT INTO cargos (nome, descricao) VALUES
("Vendedor", "Realiza as Vendas"),
("Gerente", "Gerencia a Loja");
INSERT INTO colaborador (nome, id_cargo, salario) VALUES
("Joao", 2, 5000.00),
("Robson", 1, 2249.00);
INSERT INTO pedidos (data_pedido, quantidade, id_colaborador, id_produto) VALUES
("22-05-2025", 5, 2, 1),
("19-05-2025", 7, 2, 2);

ALTER TABLE fornecedor DROP cpf;
UPDATE colaborador SET salario = 2500 WHERE id_colaborador = 1;

SELECT a.nome = b.nome

FROM

produtos a

INNER JOIN

fornecedor b

ON

a.id_produto = b.id_fornecedor;