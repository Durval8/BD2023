CREATE TABLE Rent_a_Car_Balcao (
	[Numero] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Endereço] [varchar](1024) NOT NULL
)
GO

CREATE TABLE Rent_a_Car_Cliente (
	[NIF] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Endereco] [varchar](1024) NOT NULL,
	[Num_Carta] [varchar](32) NOT NULL
)
GO

CREATE TABLE Rent_a_Car_TipoVeiculo (
	[Codigo] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Designacao] [varchar](256) NOT NULL,
	[ArCondicionado] [bit] NOT NULL
)
GO

CREATE TABLE Rent_a_Car_Veiculo (
	[Matricula] [varchar](16) NOT NULL PRIMARY KEY,
	[Ano] [int] NOT NULL,
	[Marca] [varchar](256) NOT NULL,
	[Tipo_Veiculo_Codigo] [int] NOT NULL REFERENCES Rent_a_Car_TipoVeiculo ([Codigo])
)
GO

CREATE TABLE Rent_a_Car_Aluguer (
	[Numero] [int] NOT NULL PRIMARY KEY,
	[Duracao] [int] NOT NULL,
	[Data] [varchar](128) NOT NULL,
	[Balcao_Numero] [int] NOT NULL REFERENCES Rent_a_Car_Balcao ([Numero]),
	[Cliente_NIF] [int] NOT NULL REFERENCES Rent_a_Car_Cliente ([NIF]),
	[Veiculo_Matricula] [varchar](16) NOT NULL REFERENCES Rent_a_Car_Veiculo ([Matricula])
)
GO

CREATE TABLE Rent_a_Car_Similaridade (
	[CodigoA] [int] NOT NULL REFERENCES Rent_a_Car_TipoVeiculo ([Codigo]),
	[CodigoB] [int] NOT NULL REFERENCES Rent_a_Car_TipoVeiculo ([Codigo]),
	PRIMARY KEY ([CodigoA], [CodigoB])
)
GO

CREATE TABLE Rent_a_Car_Ligeiro (
	[Codigo] [int] NOT NULL PRIMARY KEY REFERENCES Rent_a_Car_TipoVeiculo ([Codigo]),
	[Portas] [int] NOT NULL,
	[Combustivel] [varchar](32) NOT NULL,
	[Num_Lugares] [int] NOT NULL
)
GO

CREATE TABLE Rent_a_Car_Pesado (
	[Codigo] [int] NOT NULL PRIMARY KEY REFERENCES Rent_a_Car_TipoVeiculo ([Codigo]),
	[Peso] [int] NOT NULL,
	[Passageiros] [int] NOT NULL
)
GO