/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E19� Altere a rotina do exerc�cio anterior para que n�o seja poss�vel 
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

    FwAlertError('N�o � poss�vel excluir cursos cadastrados!')
  

Return lRet
