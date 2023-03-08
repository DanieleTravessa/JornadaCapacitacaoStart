/*MVC
.. 8 � Implementar a mesma rotina do Exerc�cio 1. */

#INCLUDE "TOTVS.CH"

User Function Item()
    local aParam   := PARAMIXB
    local lRet     := .T.
    local oObj     := ""
    local cIdPonto := ""
    local cIdModel := ""

    If aParam <> NIL
        oObj     := aParam[1]
        cIdPonto := aParam[2]
        cIdModel := aParam[3]

        If cIdPonto == "MODELCOMMITTTS" //depois da mensagem de integra��o com o TAF
            //Os pontos de entrada MT010INC, MT010ALT e MTA010E est�o sendo tratados aqui
			//Chamada ap�s a grava��o total do modelo e dentro da transa��o.
            If ExistBlock("CadMan")
                lRet := ExecBlock("CadMan", .F., .F.)
            EndIf
        EndIf
    EndIf

Return lRet


Static Function CadMan()

    Local aArea := GetArea()

    RECLOCK("SB1", .F.)
        SB1->B1_DESC := ("Cad. Manual - " + M->B1_Desc)
    SB1->(MSUNLOCK())

    RestArea(aArea)
Return





		/*ElseIf cIdPonto == "MODELCOMMITNTTS" //depois da mensagem de integra��o com o TAF
			//ApMsgInfo("Chamada ap�s a grava��o total do modelo e fora da transa��o.")
			//ApMsgInfo("MODELCOMMITNTTS")
 
		ElseIf cIdPonto == "MODELCANCEL"
           
            //validar o bot�o Cancelar
			cMsg := "Deseja realmente sair?"
			xRet := ApMsgYesNo(cMsg)
			 
		ElseIf cIdPonto == "BUTTONBAR"
            //Criar um bot�o na barra de bot�es da rotina
			//xRet := {{"Salvar", "SALVAR", {||alert("bot�o salvar")}}}
 
		EndIf*/


