/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|4 Faça um SELECT na tabela SB1 que retorne todos os produtos que pertencem|
|ao grupo “Películas”. Apresente a descrição desses produtos através da    |
|função FwAlertInfo()                                                      |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function JsL3e4()

    Local cDesc   := ""
    LOCAL cGrp  := ""
    Local cMsg   := ""
    Local nCont  := 1

    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_DESC,
            B1_GRUPO
        FROM 
            %table:SB1% SB1
        WHERE
            D_E_L_E_T_ <>'*'
    ENDSQL

    while SB1->(!EOF())
        cDesc  := SB1->B1_DESC
        cGrp := SB1->B1_GRUPO

        IF cGrp == "G002" //Grupo de Produtos *Películas*
            cMsg += '----------------------------------------------------------' + CRLF
            cMsg += "  Produto " +Alltrim(str(nCont))+" : " + cDesc + CRLF
            cMsg += '----------------------------------------------------------' + CRLF
            nCont++
        ENDIF
       
        SB1->(DBSKIP())
    EndDo
    
     FwAlertInfo(cMsg, "Produtos pertencentes ao Grupo Películas")

    RpcClearEnv()
Return
