CREATE DATABASE SistemaFinanceiro;
GO

USE SistemaFinanceiro;
GO

-- Tabela de ClienteFornecedor
CREATE TABLE ClienteFornecedor (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(20) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(100)
);
GO

-- Tabela de ContaBancaria
CREATE TABLE ContaBancaria (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente_fornecedor INT NOT NULL,
    banco VARCHAR(50) NOT NULL,
    agencia VARCHAR(20) NOT NULL,
    numero_conta VARCHAR(20) NOT NULL,
    saldo DECIMAL(15,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (id_cliente_fornecedor) REFERENCES ClienteFornecedor(id)
);
GO

-- Tabela de TransacaoFinanceira
CREATE TABLE TransacaoFinanceira (
    id INT IDENTITY(1,1) PRIMARY KEY,
    id_conta_bancaria INT NOT NULL,
    tipo VARCHAR(20) NOT NULL, -- 'entrada' ou 'saida'
    valor DECIMAL(15,2) NOT NULL,
    data_transacao DATE NOT NULL,
    descricao VARCHAR(200),
    FOREIGN KEY (id_conta_bancaria) REFERENCES ContaBancaria(id)
);
GO


CREATE INDEX idx_cpf_cnpj ON ClienteFornecedor(cpf_cnpj);
CREATE INDEX idx_numero_conta ON ContaBancaria(numero_conta);
CREATE INDEX idx_data_transacao ON TransacaoFinanceira(data_transacao);
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'SistemaFinanceiro')
    CREATE DATABASE SistemaFinanceiro;
GO

USE SistemaFinanceiro;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ClienteFornecedor')
BEGIN
    CREATE TABLE ClienteFornecedor (
        id INT IDENTITY(1,1) PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        cpf_cnpj VARCHAR(20) NOT NULL,
        endereco VARCHAR(150),
        telefone VARCHAR(20),
        email VARCHAR(100)
    );
END
GO
