/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
--------------------------------------------------------------------------
Player: Daniele Travessa Brito                           GM: Muriel Zounar
--------------------------------------------------------------------------
--------------------------------------------------------------------------
E16 – Crie uma rotina que retorne todos os clientes situados em um estado/
uf selecionado pelo usuário.                                                          
--------------------------------------------------------------------------
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function JsL4e16()

    Local cTitle := "CLIENTE X UF", cTexto := 'Informe a UF desejada: '
    Local cUF := Space(2)
    Local nOpcao := 0
    Local oJnla := NIL

	DEFINE MSDIALOG oJnla TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
       	@ 014, 010 SAY cTexto SIZE 050, 015 OF oJnla PIXEL
    	@ 012, 070 MSGET  cUF SIZE 010, 014 OF oJnla PIXEL
    	@ 010, 100 BUTTON "Busca" SIZE 035, 010 OF oJnla PIXEL ACTION UF(cUF)
    	@ 035, 100 BUTTON "Cancelar" SIZE 035, 010 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED

Return(cEstado)

Static Function UF(cUF)
	Local aArea := GetArea(), cAlias := GetNextAlias()
	Local cInfo := "", cQuery := ""
	
	PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := "SELECT A2_NOME " + "FROM " + RetSqlName('SA2') + " SA2" + " WHERE A2_EST = '" + cUF + "' AND D_E_L_E_T_ = ' '"

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cInfo 	+= (&(cAlias)->(A2_NOME)) + CRLF + '_________________________________________________' + CRLF + CRLF
		&(cAlias)->(DbSkip())
	end

	FwAlertInfo(cInfo, "Cliente do estado" + cUF)

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return


