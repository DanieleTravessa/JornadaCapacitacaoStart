/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E19– Altere a rotina do exercício anterior para que não seja possível 
 excluir um curso cadastrado. 
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function JsL4e19()

    Local cAlias := 'ZZC', cTitulo := 'Cadastros de Cursos', lFunExc := 'U_BloqExc()'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, lFunExc, NIL)

Return

User Function BloqExc()
    
    Local lRet := .F.

    FwAlertError('Não é possível excluir cursos cadastrados!')
  

Return lRet
