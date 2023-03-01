/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E18: Desenvolva uma rotina que permita realizar cadastros de cursos.
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl4e18()

    Local cAlias := "ZZC", cTitulo := "Cadastros de Cursos"

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return

