CREATE TABLE Stock_Armazem (
	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Morada] [varchar](256) NOT NULL
)
GO

CREATE TABLE Stock_Tipo_Fornecedor (
	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Designacao] [varchar](256) NOT NULL,
)
GO

CREATE TABLE Stock_Cond_Pagamento (
	[Codigo] [int] NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE Stock_Produtos (
	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Preco] [int] NOT NULL,
	[IVA] [int] NOT NULL,
	[Armazem_Codigo] [int] NOT NULL REFERENCES Stock_Armazem ([Codigo]),
)
GO

CREATE TABLE Stock_Fornecedor (
	[Codigo] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[NIF] [int] NOT NULL,
	[Endereco] [varchar](256) NOT NULL,
	[Cond_Pagamento_Codigo] [int] NOT NULL REFERENCES Stock_Cond_Pagamento ([Codigo]),
	[Tipo_Fornecedor_Codigo] [int] NOT NULL REFERENCES Stock_Tipo_Fornecedor ([Codigo])
)
GO

CREATE TABLE Stock_Encomenda (
	[Numero] [int] NOT NULL PRIMARY KEY,
	[Data] [varchar](32) NOT NULL,
	[Fornecedor_Codigo] [int] NOT NULL REFERENCES Stock_Fornecedor ([Codigo])
)
GO

CREATE TABLE Stock_Tem (
	[Produtos_Codigo] [int] NOT NULL REFERENCES Stock_Produtos ([Codigo]),
	[Encomenda_Numero] [int] NOT NULL REFERENCES Stock_Encomenda ([Numero]),
	PRIMARY KEY ([Produtos_Codigo], [Encomenda_Numero])
)
GO
