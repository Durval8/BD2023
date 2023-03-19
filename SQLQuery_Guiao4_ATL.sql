CREATE TABLE ATL_Pessoa (
	[N_CC] [int] NOT NULL PRIMARY KEY,
	[Mail] [varchar](256) NOT NULL,
	[Data] [varchar](32) NOT NULL,
	[Nome] [varchar](128) NOT NULL,
	[Morada] [varchar](256) NOT NULL,
	[Contato] [varchar](32) NOT NULL
)
GO

CREATE TABLE ATL_Atividade (
	[ID] [int] NOT NULL PRIMARY KEY,
	[Custo] [int] NOT NULL, 
	[Designacao] [varchar](256) NOT NULL
)
GO

CREATE TABLE ATL_Aluno (
	[Pessoa_N_CC] [int] NOT NULL REFERENCES ATL_Pessoa ([N_CC]),
	PRIMARY KEY ([Pessoa_N_CC])
)
GO

CREATE TABLE ATL_Nao_Aluno (
	[Pessoa_N_CC] [int] NOT NULL REFERENCES ATL_Pessoa ([N_CC]),
	PRIMARY KEY ([Pessoa_N_CC])
)
GO

CREATE TABLE ATL_Professor (
	[Num_Funcionario] [int] NOT NULL PRIMARY KEY,
	[Nao_Aluno_N_CC] [int] NOT NULL REFERENCES ATL_Nao_Aluno ([Pessoa_N_CC])
)
GO

CREATE TABLE ATL_Encarregado_Edu (
	[Nao_Aluno_N_CC] [int] NOT NULL REFERENCES ATL_Nao_Aluno ([Pessoa_N_CC]),
	PRIMARY KEY ([Nao_Aluno_N_CC])
)
GO

CREATE TABLE ATL_Relacao (
	[Encarregado_Edu_N_CC] [int] NOT NULL REFERENCES ATL_Encarregado_Edu ([Nao_Aluno_N_CC]),
	[Relacao] [varchar](128) NOT NULL,
	PRIMARY KEY ([Encarregado_Edu_N_CC])
)
GO

CREATE TABLE ATL_Turma (
	[ID] [int] NOT NULL PRIMARY KEY,
	[Designacao] [varchar](256) NOT NULL,
	[Ano] [int] NOT NULL,
	[Professor_N_Funcionario] [int] NOT NULL REFERENCES ATL_Professor ([Num_Funcionario]),
)
GO

CREATE TABLE ATL_Disponibilidade (
	[Turma_ID] [int] NOT NULL REFERENCES ATL_Turma ([ID]),
	[Atividade_ID] [int] NOT NULL REFERENCES ATL_Atividade ([ID]),
	PRIMARY KEY ([Turma_ID], [Atividade_ID])
)
GO





