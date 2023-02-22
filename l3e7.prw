/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E7:Faça um programa em que o usuário possa digitar um período (data início|
| / data fim) e saber quais são os pedidos de venda existentes no período  |
|informado.                                                                |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function JsL3e7()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cDataIni := ''
    Local cDataFim := ''
    Local cCod    := ''
    cDataIni := alltrim(FwInPutBox("Digite a data de início: "))
    cDataFim := alltrim(FwInPutBox("Digite a data de fim: "))
    rpcsetenv("99", "01")

    cQuery := 'SELECT C5_NUM' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5'  + CRLF
    cQuery += "WHERE C5_EMISSAO  BETWEEN '" + cDataIni + "' AND '" +  cDataFim + "' and D_E_L_E_T_ <> '*'" 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCod +='Código do pedido: ' + &(cAlias)->(C5_NUM) + CRLF
        &(cAlias)->(DbSkip())
    end

        FwAlertInfo(cCod, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
