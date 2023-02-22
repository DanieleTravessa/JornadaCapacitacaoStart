/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E7:Fa�a um programa em que o usu�rio possa digitar um per�odo (data in�cio|
| / data fim) e saber quais s�o os pedidos de venda existentes no per�odo  |
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
    cDataIni := alltrim(FwInPutBox("Digite a data de in�cio: "))
    cDataFim := alltrim(FwInPutBox("Digite a data de fim: "))
    rpcsetenv("99", "01")

    cQuery := 'SELECT C5_NUM' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5'  + CRLF
    cQuery += "WHERE C5_EMISSAO  BETWEEN '" + cDataIni + "' AND '" +  cDataFim + "' and D_E_L_E_T_ <> '*'" 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCod +='C�digo do pedido: ' + &(cAlias)->(C5_NUM) + CRLF
        &(cAlias)->(DbSkip())
    end

        FwAlertInfo(cCod, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
