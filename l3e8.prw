/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E8: Desenvolva um programa que retorne o produto de maior valor total dos |
|pedidos de venda (SC6). O código, descrição, valor unitário e valor total |
|devem ser apresentados.                                                   |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function JsL3e8()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ""
    Local cMsg    := ""
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'

    cQuery := "SELECT TOP 1 C6_PRODUTO, C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_VALOR, C5_NUM"+ CRLF 
    cQuery += "FROM " + RetSqlName('SC6') + CRLF 
    cQuery += "INNER JOIN " + RetSqlName('SC6') + "SC6" + "ON" + "C5_NUM" + "C6_NUM" + CRLF
    cQuery += " WHERE D_E_L_E_T_ = ' ' ORDER BY C6_VALOR DESC"

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
 
        cMsg := "Código: " + &(cAlias)->(C6_PRODUTO) + CRLF
        cMsg += "Descrição: " +  &(cAlias)->(C6_DESCRI) + CRLF
        cMsg += "Valor Unitário: R$" + ALLTRIM(STR(&(cAlias)->(C6_PRCVEN))) + CRLF
        cMsg += "Valor Total: R$" + AllTrim(Str(&(cAlias)->(C6_Valor))) + CRLF
           
        &(cAlias)->(DbSkip())
    EndDo        
        FwAlertInfo(cMsg, "Produto de Maior Valor")

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
