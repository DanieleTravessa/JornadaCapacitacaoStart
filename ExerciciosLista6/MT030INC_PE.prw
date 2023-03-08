/*6 – Utilizando Ponto de Entrada, crie uma rotina que fará com que qualquer cliente, quando for
cadastrado no Protheus, tenha o status de bloqueado (A1_MSBLQL = 1).*/

#INCLUDE "TOTVS.CH"

//Ponto de entrada após inclusão do cliente, concedendo o Status de Bloqueado  
User Function MT030INC()

    Local aArea := GetArea()
    Local aAreaA1 := SA1->(GetArea())
    Local lRetorno := .F.
     
    RecLock("SA1", .T.)
        SA1->A1_MSBLQL := "1"
        MsgInfo("Cliente cadastrado com sucesso, com status de bloqueado!")
    SA1->(MsUnlock())
         
    RestArea(aAreaA1)
    RestArea(aArea)

Return lRetorno

