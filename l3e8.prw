/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E8: Desenvolva um programa que retorne o produto de maior valor total dos |
|pedidos de venda (SC6). O c�digo, descri��o, valor unit�rio e valor total |
|devem ser apresentados.                                                   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function JsL3e8()
	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cQuery := "", cMsg := ""

	rpcsetenv("99", "01")

	cQuery := 'SELECT TOP 1 C6_PRODUTO, C6_DESCRI, C6_PRCVEN, C6_VALOR, C5_NUM' + CRLF + "FROM " + RetSqlName('SC5') + " SC5" + CRLF + "INNER JOIN " + RetSqlName('SC6') + " SC6" + " ON " + "C5_NUM = " + 'C6_NUM' + CRLF + "ORDER BY C6_VALOR DESC "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
	
		cMsg := "C�digo: "         + &(cAlias)->(C6_PRODUTO)               + CRLF +;
                "Descri��o: "      + &(cAlias)->(C6_DESCRI)                + CRLF +;
                "Valor Unit�rio R$: "+ ALLTRIM(STR(&(cAlias)->(C6_PRCVEN)))+ CRLF +;
                "Valor Total R$: "    + ALLTRIM(STR(&(cAlias)->(C6_VALOR)))   + CRLF + CRLF 
       
		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, "PRODUTO DE MAIOR VALOR: ")

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)
Return
