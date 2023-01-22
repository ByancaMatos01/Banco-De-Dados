--quantidade de Alunos--
Select Id_turma, Count(*) as Qtde_aluno
From Turma_aluno
Group by ID_turma;

Select T.id_instrutor, count(*) as Qtde_Aluno
From Turma_aluno TA 
join 
Turma           T  on T.Id_turma= Ta.ID_Turma 
Group by T.Id_instrutor;
	 