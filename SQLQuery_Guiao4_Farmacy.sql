CREATE TABLE Farmacy_Medico (
	[N_SNS] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](128) NOT NULL,
	[Especialista] [varchar](128) NOT NULL
)
GO

CREATE TABLE Farmacy_Paciente (
	[N_Utente] [int] NOT NULL PRIMARY KEY,
	[Data] [varchar](128) NOT NULL,
	[Endereco] [varchar](256) NOT NULL,
	[Nome] [varchar](256) NOT NULL
)
GO

CREATE TABLE Farmacy_Farmacia (
	[NIF] [int] NOT NULL PRIMARY KEY,
	[Telefone] [int] NOT NULL,
	[Endereco] [varchar](256) NOT NULL,
	[Nome] [varchar](256) NOT NULL
)
GO

CREATE TABLE Farmacy_Farmaceutica (
	[N_Registo_Nacional] [int] NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[Telefone] [int] NOT NULL,
	[Endereco] [varchar](256) NOT NULL
)
GO

CREATE TABLE Farmacy_Prescricao (
	[Numero] [int] NOT NULL PRIMARY KEY,
	[Data] [varchar](128) NOT NULL,
	[Medico_N_SNS] [int] NOT NULL REFERENCES Farmacy_Medico ([N_SNS]),
	[Paciente_N_Utente] [int] NOT NULL REFERENCES Farmacy_Paciente ([N_Utente]),
	[Farmacia_NIF_Farm] [int] NOT NULL REFERENCES Farmacy_Farmacia ([NIF])
)
GO

CREATE TABLE Farmacy_Farmaco (
	[Formula] [varchar](32) NOT NULL PRIMARY KEY,
	[Nome_Comercial] [varchar](128) NOT NULL,
	[Farmaceutica_N_Reg_Nacional][int] NOT NULL REFERENCES Farmacy_Farmaceutica ([N_Registo_Nacional])
)
GO

CREATE TABLE Farmacy_Vender (
	[Farmaco_Formula] [varchar](32) NOT NULL REFERENCES Farmacy_Farmaco ([Formula]),
	[Farmacia_NIF] [int] NOT NULL REFERENCES Farmacy_Farmacia ([NIF])
	PRIMARY KEY ([Farmaco_Formula], [Farmacia_NIF])
)
GO

CREATE TABLE Farmacy_Contem (
	[Farmaco_Formula] [varchar](32) NOT NULL REFERENCES Farmacy_Farmaco ([Formula]),
	[Prescricao_Numero] [int] NOT NULL REFERENCES Farmacy_Prescricao ([Numero]),
	PRIMARY KEY ([Farmaco_Formula], [Prescricao_Numero])
)
GO




