/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E11 � Crie uma fun��o que retorne todos os fornecedores situados em       |
|S�o Paulo (SP).                                                           |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function JsL3e11()

	Local aArea := GetArea(), cAlias := GetNextAlias()
	Local cArmazena := '', cQuery := ''

	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := "SELECT A2_NOME " + "FROM " + RetSqlName('SA2') + " SA2" + CRLF + " WHERE A2_EST = 'SP' AND D_E_L_E_T_ = ' '"

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cArmazena 	+= (&(cAlias)->(A2_NOME)) + CRLF + '_________________________________________________' + CRLF + CRLF
		&(cAlias)->(DbSkip())
	end

	FwAlertInfo(cArmazena, 'FORNECEDORES DE S�O PAULO')

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
