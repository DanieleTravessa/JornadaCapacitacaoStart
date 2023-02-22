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

User Function JsL3e6()
    Local cQuery  := ""
    Local cCod := ""
    Local nValor := 0
    Local lRepete := .T.
    
    cCod := alltrim(FwInPutBox("Digite o código do produto: "))

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
            FwAlertInfo("não possui itens com este código no sistema") 
            
        Else 
            FwAlertInfo('Código: ' + cCod + CRLF + 'Descrição: ' + cDescri + CRLF + 'Preço de venda: ' + ALLTRIM(STR(nValor)), 'Dados do Produto')
            &(cAlias)->(DbCloseArea())
               
        EndIF   
        lRepete := MsgYesNo("Deseja consultar outro código? ", "Consulta de código") 
    EndDo

    RpcClearEnv()

Return 
