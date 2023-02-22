/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E9: Desenvolva uma rotina em que, com base em um código de produto informado|
|pelo usuário, retorne todos os pedidos de venda em que esse produto está  |
|sendo usado. Obs: Os números dos pedidos devem estar separados por vírgula|
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

USER FUNCTION JsL3e9()

    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cMsg   := ''
    Local cPed   := ''
    rpcsetenv("99", "01")

    cPed := alltrim((FwInputBox("Digite o código do produto a ser pesquisado: ")))

    cQuery := "SELECT SB1.B1_COD, CONCAT(SC6.C6_NUM, ', ') AS NUMPED_CODPROD" + CRLF
    cQuery +="FROM " + RetSqlName('SB1') + " SB1"  + CRLF
    cQuery += "INNER JOIN SC6990 AS SC6 ON SC6.C6_PRODUTO = SB1.B1_COD" + CRLF
    cQuery += "WHERE SB1.B1_COD = '" + cPed+ "'" 

    TCQUERY cQuery ALIAS &(cAlias) new 
    &(cAlias)->(dbGoTop())

    if ALLTRIM(&(cAlias)->(NUMPED_CODPROD)) == ''
       FwAlertInfo("não possui itens com este código no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF())
        cMsg := "O produto " + ALLTRIM( cPed ) 
        cMsg += " se encontra nos itens " + alltrim((&(cAlias)->(NUMPED_CODPROD)))
        &(cAlias)->(DbSkip())
       
    END

    FwAlertInfo(cMsg, 'Dados do Produto')
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

RETURN
