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

User Function JsL3e6()
    Local cQuery  := ""
    Local cCod := ""
    Local nValor := 0
    Local lRepete := .T.
    
    cCod := alltrim(FwInPutBox("Digite o c�digo do produto: "))

    RpcSetEnv("99", "01")

     BEGINSQL Alias "SB1"
        SELECT 
            B1_COD,
            B1_DESC,
            B1_PRV1
        FROM 
            %table:SB1% SB1
        WHERE
            D_E_L_E_T_ <>'*' AND
            B1_COD = 'cCod' 
    ENDSQL
    
    TCQUERY cQuery ALIAS &(cAlias) NEW

        cDesc := &(cAlias)->(B1_DESC)
        nValor  := &(cAlias)->(B1_PRV1)
        cCod := &(Alias)->(B1_COD)
    
    While lRepete
        
        &(cAlias)->(DbGoTop())

        If ALLTRIM(&(cAlias)->(Codigo)) == " "
            FwAlertInfo("n�o possui itens com este c�digo no sistema") 
            
        Else 
            FwAlertInfo('C�digo: ' + cCod + CRLF + 'Descri��o: ' + cDescri + CRLF + 'Pre�o de venda: ' + ALLTRIM(STR(nValor)), 'Dados do Produto')
            &(cAlias)->(DbCloseArea())
               
        EndIF   
        lRepete := MsgYesNo("Deseja consultar outro c�digo? ", "Consulta de c�digo") 
    EndDo

    RpcClearEnv()

Return 
