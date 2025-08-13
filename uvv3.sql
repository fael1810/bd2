DROP DATABASE IF EXISTS UVV_CC3M;
CREATE DATABASE UVV_CC3M;
USE UVV_CC3M;

-- ============================
-- TABELA: ClienteFornecedor
-- ============================
CREATE TABLE ClienteFornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(100),
    INDEX idx_cpf_cnpj (cpf_cnpj)
);

-- ============================
-- TABELA: ContaBancaria
-- ============================
CREATE TABLE ContaBancaria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    banco VARCHAR(100) NOT NULL,
    agencia VARCHAR(20) NOT NULL,
    numero_conta VARCHAR(20) NOT NULL,
    saldo DECIMAL(15,2) DEFAULT 0
);

-- ============================
-- TABELA: ContaPagar
-- ============================
CREATE TABLE ContaPagar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fornecedor_id INT NOT NULL,
    valor DECIMAL(15,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    pago BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (fornecedor_id) REFERENCES ClienteFornecedor(id)
);

-- ============================
-- TABELA: ContaReceber
-- ============================
CREATE TABLE ContaReceber (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    valor DECIMAL(15,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    recebido BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (cliente_id) REFERENCES ClienteFornecedor(id)
);

-- ============================
-- DADOS DE TESTE
-- ============================

-- Inserir clientes/fornecedores
INSERT INTO ClienteFornecedor (nome, cpf_cnpj, endereco, telefone, email) VALUES
('João Silva', '12345678901', 'Rua A, 100', '11999999999', 'joao@email.com'),
('Empresa XYZ', '11222333444455', 'Av. Central, 500', '1122223333', 'contato@xyz.com');

-- Inserir contas bancárias
INSERT INTO ContaBancaria (banco, agencia, numero_conta, saldo) VALUES
('Banco do Brasil', '1234', '56789-0', 1500.00),
('Caixa Econômica', '5678', '12345-6', 5000.00);

-- Inserir contas a pagar
INSERT INTO ContaPagar (fornecedor_id, valor, data_vencimento, pago) VALUES
(2, 1000.00, '2025-08-20', FALSE),
(2, 500.00, '2025-09-10', TRUE);

-- Inserir contas a receber
INSERT INTO ContaReceber (cliente_id, valor, data_vencimento, recebido) VALUES
(1, 2000.00, '2025-08-25', FALSE),
(1, 750.00, '2025-09-05', TRUE);