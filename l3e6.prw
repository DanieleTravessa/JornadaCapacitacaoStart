/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E6: Faça um programa em que o usuário possa digitar um código de produto e|
|saber se esse código existe no sistema ou não. Caso exista, apresente o   |
|Código, Descrição e o Preço de Venda, caso contrário, apresente uma       |
|mensagem informando que não existe.                                       |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'


User Function BusProdSQL()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cCodigo := ''
    Local cDescri := ''
    Local nValor := 0
    cCodigo := alltrim(FwInPutBox("Digite o código do produto: "))

    rpcsetenv("99", "01")

    cQuery := 'SELECT trim(B1_COD) as Codigo, B1_DESC, B1_PRV1' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1'  + CRLF
    cQuery += "WHERE B1_COD = '" + cCodigo + "'" + "and D_E_L_E_T_ <> '*'" 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    if ALLTRIM(&(cAlias)->(Codigo)) == ''
       FwAlertInfo("não possui itens com este código no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF())
        cDescri := &(cAlias)->(B1_DESC)
        nValor  := &(cAlias)->(B1_PRV1)
        &(cAlias)->(DbSkip())
    end

        FwAlertInfo('Código: ' + cCodigo + CRLF + 'Descrição: ' + cDescri + CRLF + 'Preço de venda: ' + ALLTRIM(STR(nValor)), 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
