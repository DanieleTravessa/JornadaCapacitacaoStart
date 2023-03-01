/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E12:Faça um programa em que o usuário possa digitar um período (data início|
| / data fim) e saber quais são os pedidos de venda existentes no período  |
|informado.                                                                |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function JsL4e12()

//Declaração e Atribuição de variáveis                      
    Local oJnla := Nil
    Local cTitulo := "Consulta de Produto"
    Local cTexto := "Digite a data de início: "
    Local cTexto2 := "Digite a data fim: "
    Local dDataIni := Space(10), dDataFim := Space(10)
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0

//Solicita os valores   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 090,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 090,010 of oJnla PIXEL
    @ 010, 095 MSGET  dDataIni  SIZE 050, 010 OF oJnla PIXEL PICTURE '@R 99/99/9999'
    @ 030, 095 MSGET  dDataFim  SIZE 050, 010 OF oJnla PIXEL PICTURE '@R 99/99/9999' 
    @ 050, 010 BUTTON "Consultar" SIZE 50, 012 OF oJnla PIXEL ACTION ConsProduto(dDataIni,dDataFim)
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function ConsProduto(dDataIni,dDataFim)

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cCod    := ''
   

    RpcSetEnv("99", "01")

    cQuery := 'SELECT C5_NUM' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5'  + CRLF
    cQuery += "WHERE C5_EMISSAO  BETWEEN '" + dDataIni + "' AND '" +  dDataFim + "' and D_E_L_E_T_ <> '*'" 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
        cCod +="Código do pedido: " + &(cAlias)->(C5_NUM) + CRLF
        &(cAlias)->(DbSkip())
        nCont++
      If nCont == 10
        FwAlertInfo(cCod, 'Pedidos de compra')
        cCod := ""
        nCont := 0
      Endif
        &(cAlias)->(DbSkip())
    EndDo

        FwAlertInfo(cCod, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
 
	