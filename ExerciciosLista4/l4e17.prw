/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|H� algum tempo n�s criamos duas tabelas no dicion�rio de dados, a tabela de 
Alunos e a de Cursos, lembra? Chegou a hora de us�-las! 
Os pr�ximos exerc�cios estar�o associados a elas.
Ah! Mais uma coisa...
Para conseguir rodar essas rotinas, ser� necess�rio criar uma op��o (ou mais)
no Menu do Protheus.
Vamos l�!
17� Desenvolva uma rotina que permita realizar cadastros de alunos.
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl4e17()

    Local cAlias := "ZZS", cTitulo := "Cadastro de alunos "

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
