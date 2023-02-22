/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E12– Faça uma rotina que apresenta, dentre todosos produtos cadastrados,  |
|qual o produto com o maior preço de venda e o produto com o menor preço de|
| venda, ou seja, o produto mais caro e o mais barato.                     |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function Preco()

    Local aArea      := GetArea() // área atual da tabela
    Local cAlias     := GetNextAlias()
    Local cQuery     := ''
    Local cMsg       := ''

    //definir o ambiente de execução da consulta SQL.
    rpcsetenv("99", "01")

    cQuery := "SELECT TOP 1 MAX(C6_PRCVEN) AS MAIOR_VALOR, MIN(C6_PRCVEN) AS MENOR_VALOR " +CRLF
    cQuery += "FROM " + RetSqlName('SC6') + " SC6" 

    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cMsg := "item com maior preço: " + alltrim(str(&(cAlias)->(MAIOR_VALOR))) + CRLF
        cMsg += "item com menor preço: " + alltrim(str(&(cAlias)->(MENOR_VALOR))) 
 
        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cMsg, 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
