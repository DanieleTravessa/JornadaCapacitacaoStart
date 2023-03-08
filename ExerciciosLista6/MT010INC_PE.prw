/*5 – Utilizando Ponto de Entrada, crie uma rotina que fará com que qualquer produto, 
quando for cadastrado no Protheus, tenha o status de bloqueado (B1_MSBLQL = 1).*/

#INCLUDE "TOTVS.CH"

//Ponto de entrada após inclusão do produto  
User Function MT010INC()

    Local aArea := GetArea()
    Local aAreaB1 := SB1->(GetArea())
    Local lRetorno := .F.
     
        RecLock("SB1", .T.)
// Mantém a parametrização de inclusão do exercício anterior adicionando ao campo Descrição: "Cad. Manual".
            SB1->B1_DESC := "Cad. Manual - " + M->B1_DESC   
// O cadastro incluído automaticamente com status de bloqueado.
            SB1->B1_MSBLQL := "1"                           
            MsgInfo("Produto incluído com sucesso, com status de bloqueado")
        SB1->(MsUnlock())
         
    RestArea(aAreaB1)
    RestArea(aArea)

Return lRetorno
