CREATE TABLE Conferencia_Conferencia (
[Nº_Registo_Artigo] [int] NOT NULL PRIMARY KEY
)

CREATE TABLE Conferencia_Artigos_Cientificos(
[Nº_Registo] [int] NOT NULL PRIMARY KEY REFERENCES Conferencia_Conferencia(Nº_Registo_Artigo),
[Titulo] [varchar] NOT NULL
)

CREATE TABLE Conferencia_Instituição(
[Nome] [varchar] NOT NULL PRIMARY KEY,
[Endereço] [varchar] NOT NULL
)

CREATE TABLE Conferencia_Autores(
[Nome] [varchar] NOT NULL PRIMARY KEY,
[Email] [varchar] NOT NULL,
[Nome_Inst] [varchar] NOT NULL REFERENCES Conferencia_Instituição(Nome)
)

CREATE TABLE Conferencia_Escritos(
[Nº_Registo_Art] [int] NOT NULL REFERENCES Conferencia_Artigos_Cientificos(Nº_Registo),
[Nome_Autores] [varchar] NOT NULL REFERENCES Conferencia_Autores(Nome)
)

