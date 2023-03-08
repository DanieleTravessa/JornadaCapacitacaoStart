/*5 � Utilizando Ponto de Entrada, crie uma rotina que far� com que qualquer produto, 
quando for cadastrado no Protheus, tenha o status de bloqueado (B1_MSBLQL = 1).*/

#INCLUDE "TOTVS.CH"

//Ponto de entrada ap�s inclus�o do produto  
User Function MT010INC()

    Local aArea := GetArea()
    Local aAreaB1 := SB1->(GetArea())
    Local lRetorno := .F.
     
        RecLock("SB1", .T.)
// Mant�m a parametriza��o de inclus�o do exerc�cio anterior adicionando ao campo Descri��o: "Cad. Manual".
            SB1->B1_DESC := "Cad. Manual - " + M->B1_DESC   
// O cadastro inclu�do automaticamente com status de bloqueado.
            SB1->B1_MSBLQL := "1"                           
            MsgInfo("Produto inclu�do com sucesso, com status de bloqueado")
        SB1->(MsUnlock())
         
    RestArea(aAreaB1)
    RestArea(aArea)

Return lRetorno
