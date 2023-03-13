/*5 – Utilize um PE para adicionar um botão “Mensagem” à rotina dos 
Pedidos de Compra, esse botão terá uma função simples, apenas deve 
apresentar uma mensagem dizendo: “Botão acionado com sucesso!”.*/

#INCLUDE 'TOTVS.CH'

USER FUNCTION MA120BUT()
 
    Local aArea := GetArea()
    Local aButtons := {} // Botoes a adicionar
    
    aAdd(aButtons,{"Mensagem",{|| U_MyMessage()},"Mensagem","Mensagem"}) 
    
    RestArea(aArea)
Return (aButtons )

User Function MyMessage()

    Local aArea := GetArea()
  
    MsgInfo("Botão acionado com sucesso!", "Muito Bem!!")

    RestArea(aArea)
Return
