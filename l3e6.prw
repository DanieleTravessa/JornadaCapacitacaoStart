/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E6: Fa�a um programa em que o usu�rio possa digitar um c�digo de produto e|
|saber se esse c�digo existe no sistema ou n�o. Caso exista, apresente o   |
|C�digo, Descri��o e o Pre�o de Venda, caso contr�rio, apresente uma       |
|mensagem informando que n�o existe.                                       |
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
    cCodigo := alltrim(FwInPutBox("Digite o c�digo do produto: "))

    rpcsetenv("99", "01")

    cQuery := 'SELECT trim(B1_COD) as Codigo, B1_DESC, B1_PRV1' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1'  + CRLF
    cQuery += "WHERE B1_COD = '" + cCodigo + "'" + "and D_E_L_E_T_ <> '*'" 
    TCQUERY cQuery ALIAS &(cAlias) NEW
    &(cAlias)->(DbGoTop())

    if ALLTRIM(&(cAlias)->(Codigo)) == ''
       FwAlertInfo("n�o possui itens com este c�digo no sistema") 
       RETURN
    ENDIF

    while &(cAlias)->(!EOF())
        cDescri := &(cAlias)->(B1_DESC)
        nValor  := &(cAlias)->(B1_PRV1)
        &(cAlias)->(DbSkip())
    end

        FwAlertInfo('C�digo: ' + cCodigo + CRLF + 'Descri��o: ' + cDescri + CRLF + 'Pre�o de venda: ' + ALLTRIM(STR(nValor)), 'Dados do Produto')
        &(cAlias)->(DbCloseArea())
        RestArea(aArea)
Return 
