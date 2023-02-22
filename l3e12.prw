/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E12� Fa�a uma rotina que apresenta, dentre todosos produtos cadastrados,  |
|qual o produto com o maior pre�o de venda e o produto com o menor pre�o de|
| venda, ou seja, o produto mais caro e o mais barato.                     |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function Preco()

    Local aArea      := GetArea() // �rea atual da tabela
    Local cAlias     := GetNextAlias()
    Local cQuery     := ''
    Local cMsg       := ''

    //definir o ambiente de execu��o da consulta SQL.
    rpcsetenv("99", "01")

    cQuery := "SELECT TOP 1 MAX(C6_PRCVEN) AS MAIOR_VALOR, MIN(C6_PRCVEN) AS MENOR_VALOR " +CRLF
    cQuery += "FROM " + RetSqlName('SC6') + " SC6" 

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cMsg := "item com maior pre�o: " + alltrim(str(&(cAlias)->(MAIOR_VALOR))) + CRLF
        cMsg += "item com menor pre�o: " + alltrim(str(&(cAlias)->(MENOR_VALOR))) 
 
        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cMsg, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
