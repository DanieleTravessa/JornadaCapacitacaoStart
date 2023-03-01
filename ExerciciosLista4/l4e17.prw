/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Há algum tempo nós criamos duas tabelas no dicionário de dados, a tabela de 
Alunos e a de Cursos, lembra? Chegou a hora de usá-las! 
Os próximos exercícios estarão associados a elas.
Ah! Mais uma coisa...
Para conseguir rodar essas rotinas, será necessário criar uma opção (ou mais)
no Menu do Protheus.
Vamos lá!
17– Desenvolva uma rotina que permita realizar cadastros de alunos.
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl4e17()

    Local cAlias := "ZZS", cTitulo := "Cadastro de alunos "

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
