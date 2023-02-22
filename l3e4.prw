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


User Function L3_E4()
    Local cDes   := ''
    LOCAL cGrup  := ''
    Local cMsg   := ''
    Local nCont  := 1


    rpcsetenv("99", "01")

    BEGINSQL Alias "SB1"
        SELECT 
            B1_DESC,
            B1_GRUPO
        FROM %table:sb1% SB1
        where D_E_L_E_T_ <>'*'
    ENDSQL



    while SB1->(!EOF())
        cDes  := SB1->B1_DESC
        cGrup := SB1->B1_GRUPO

        IF cGrup == '02  '
            cMsg += 'produto ' +Alltrim(str(nCont))+' : ' + cDes + CRLF
            cMsg += '------------------------------' + CRLF + CRLF
            nCont++
        ENDIF

        if nCont == 10
        FwAlertInfo(cMsg, 'Dados dos Clientes')
        nCont := 0
        cMsg  := ''
        endif

        SB1->(DBSKIP())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Dados dos Clientes')
    endif

    SB1->(DBCLOSEAREA())
Return
