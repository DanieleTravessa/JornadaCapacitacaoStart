/*MVC
9 � Desenvolva um PE na rotina FISA010 (Cadastro de Munic�pios � M�dulo 09). 
Esse PE deve ser utilizado para que, quando o usu�rio confirmar a inclus�o 
de um novo munic�pio seja verificado se o nome j� existe para a UF selecionada.
Se j� existir, exibir uma mensagem e impedir que o processo continue. 
Caso contr�rio, deixar o programa prosseguir normalmente.*/

#INCLUDE "TOTVS.CH"

User Function FISA010()
    local aParam   := PARAMIXB
    local lRet     := .T.
    local oObj     := NIL
    local cIdPonto := ""
    local cIdModel := ""

    If aParam != NIL
          oObj := aParam[1] // Objeto do formul�rio ou do modelo, conforme o caso.
          cIDPonto := aParam[2] // ID do local de execu��o do ponto de entrada.
          cIDModel := aParam[3] // ID do formul�rio.

        If (cIDPonto == "MODELPOS")       // Na valida��o total do modelo.
            If ExistBlock("MuniciT")
                lRet := ExecBlock("MuniciT", .F.)
            EndIf
        EndIf
    EndIf

Return lRet

// Rotina para valida��o de cadastro de munic�pios.
User Function MuniciT()
    local aArea := GetArea()
    local cAlias := GetNextAlias()
    local cQuery := ""
    local nCount := 0
    local lRet := .T.

    
    cQuery := "SELECT CC2_EST, CC2_CODMUN, CC2_MUN FROM " + RetSqlName("CC2") + " WHERE CC2_EST = '" + M->CC2_EST  + "' AND CC2_MUN = '" + AllTrim(M->CC2_MUN) + "'"
    
    //TCQUERY cQuery ALIAS &(cAlias) NEW
    
    &(cAlias)->(DBGOTOP())

    While &(cAlias)->(!EOF())
        If nCount > 1
            MSGStop("O munic�pio j� existe!")
            lRet := .F.
        Else
            lRet := .T.
        EndIf
        nCount++
        &(cAlias)->(DBSKIP())
    EndDo

    &(cAlias)->(DBCLOSEAREA())
    RestArea(aArea)

Return lRet
