create database XPTO_Pesquisas;

CREATE TABLE Endereco (
    id_endereco INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(60) NOT NULL,
    estado VARCHAR(60) NOT NULL 
);

CREATE TABLE Departamento (
    id_departamento INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    filial VARCHAR(20) NOT NULL
);

CREATE TABLE Financa (
    id_financa INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fonte_financa VARCHAR(60) NOT NULL,
    quantia DECIMAL(10,2) NOT NULL CHECK (quantia > 0)
);

CREATE TABLE Projeto (
    id_projeto INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL,
    id_financa INT,
    custo DECIMAL(10,2) NOT NULL CHECK (custo > 0),
    FOREIGN KEY (id_financa) REFERENCES Financa(id_financa)
);

CREATE TABLE Pesquisador (
    id_pesquisador INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    status ENUM('Ativo', 'Inativo') NOT NULL DEFAULT 'Ativo',
    id_endereco INT,
    id_departamento INT,
    id_projeto INT,
    valor_bolsa DECIMAL(10,2) NOT NULL CHECK (valor_bolsa > 0),
	FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco),
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_projeto) REFERENCES Projeto(id_projeto)
);

-- Tabela Endereco
INSERT INTO Endereco (cidade, estado)
VALUES ('Boa Vista', 'Roraima'),
       ('Palmas', 'Tocantins'),
       ('Porto Alegre', 'Rio Grande do Sul'),
       ('Macapa', 'Amapa'),
       ('Belem', 'Para'),
       ('Palmas', 'Tocantins'),
       ('Boa Vista', 'Roraima'),
       ('Florianopolis', 'Santa Catarina'),
       ('Porto Velho', 'Rondonia'),
       ('Rio Branco', 'Acre'),
       ('Cabo Frio', 'Rio de janeiro'),
       ('Campinas', 'Sao Paulo'),
       ('Guarulhos', 'Sao Paulo'),
       ('Belo Horizonte', 'Minas Gerais'),
       ('Sao Paulo', 'Sao Paulo');

-- Tabela Departamento
INSERT INTO Departamento (nome, filial)
VALUES ('DIDES', 'Boa Vista'),
       ('DIMAC', 'Palmas');

-- Tabela Financa
INSERT INTO Financa (fonte_financa, quantia)
VALUES ('Governo Federal', 50000.00),
       ('ONG Internacional', 75000.00);

-- Tabela Projeto
INSERT INTO Projeto (nome, id_financa, custo)
VALUES ('Acesso a Oportunidades', 1, 10000.00),
       ('Emprego no Turismo', 2, 15000.00);

-- Tabela Pesquisador
INSERT INTO Pesquisador (nome, status, id_endereco, id_departamento, id_projeto, valor_bolsa)
VALUES ('Miguel Silva', 'Ativo', 1, 1, 1, 3100.00),
       ('Arthur Carvalho', 'Ativo', 2, 2, 2, 2500.00);
