/*5 � Utilize um PE para adicionar um bot�o �Mensagem� � rotina dos 
Pedidos de Compra, esse bot�o ter� uma fun��o simples, apenas deve 
apresentar uma mensagem dizendo: �Bot�o acionado com sucesso!�.*/

#INCLUDE 'TOTVS.CH'

USER FUNCTION MA120BUT()
 
    Local aArea := GetArea()
    Local aButtons := {} // Botoes a adicionar
    
    aAdd(aButtons,{"Mensagem",{|| U_MyMessage()},"Mensagem","Mensagem"}) 
    
    RestArea(aArea)
Return (aButtons )

User Function MyMessage()

    Local aArea := GetArea()
  
    MsgInfo("Bot�o acionado com sucesso!", "Muito Bem!!")

    RestArea(aArea)
Return
