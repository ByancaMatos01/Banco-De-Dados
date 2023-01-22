--  código de matricula, data de matrícula, 
-- nome, endereço, telefone, data de nascimento, altura e peso. 
CREATE TABLE ALUNO
(
	Matricula int not null primary key Identity (1,1),
	Data_Matricula date,
	Nome varchar(100) not null, 
	Data_Nasc date, 
	Altura  numeric (3,2),
	Peso    numeric (5,2),
	Rua varchar(100),
	Numero int,
	Complemento varchar(20),
	Bairro Varchar(45),
	Cidade Varchar(50),
	UF CHAR(2),
	CEP char(8),
	DDD varchar(3),
	Telefone varchar(8)
);
go
Create table Atividade
(
	Id_Atividade smallint not null primary key  Identity (1,1),
	Descr_Atividade Varchar(50) not null,
	Objetivo		Varchar(40)
);
go
-- RG, nome, data de nascimento, 
-- titulação e todos os telefones possíveis para sua localização. 
Create table Instrutor
(
	Id_Instrutor Smallint not null primary key identity (1,1),
	Nome_Instrutor Varchar(100) not null,
	Data_Nasc date,
	Titulacao varchar(50)
);
go
Create Table Telefone_Instrutor
(
	Id_Instrutor Smallint not null,
	DDD varchar(3),
	Telefone varchar(8),
	Constraint FK_Telefone_Instrutor Foreign key (Id_Instrutor)
		References Instrutor (Id_Instrutor)
)
go
-- número de alunos, horário da aula, duração da aula, data inicial, 
-- data final e tipo de atividade.
Create Table Turma
(
	Id_Turma smallint not null primary key  Identity (1,1),
	Qtde_Alunos smallint,
	Horario time,
	Duracao  tinyint, -- Em Minutos  0..255 --
	Data_Inicio date,
	Data_Fim    date,
	Id_Instrutor SmallInt,
	Id_Atividade smallint,
	Constraint Fk_Turma_Instrutor Foreign Key (Id_Instrutor) References Instrutor (Id_Instrutor),
	Constraint Fk_Turma_Atividade Foreign Key (Id_Atividade) References Atividade (Id_Atividade)
);
go
Create Table Monitor_Turma
(
	Id_Turma	 smallint not null,
	Matricula    int  -- Aluno Monitor --
	Constraint Fk_Monitor_Turma_Turma Foreign key (Id_Turma) References Turma (Id_Turma),
	Constraint Fk_Monitor_Turma_Aluno Foreign key (Matricula) References Aluno (Matricula)

);
go
Create Table Registro_Frequencia
(
	Id_Turma	 smallint not null,
	Matricula    int,
	Data_Falta   Date,
	Constraint Fk_Frequencia_Aluno Foreign key (Matricula) References Aluno (Matricula)
);
go
Create Table Turma_Aluno
(
	Id_Turma	 smallint not null,
	Matricula    int,
	Constraint Fk_Turma_Aluno_Turma Foreign key (Id_Turma) References Turma (Id_Turma),
	Constraint Fk_Turma_Aluno_Aluno Foreign key (Matricula) References Aluno (Matricula)
);
