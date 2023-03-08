/*4 – Você acabou de mudar a legenda no browse dos pedidos de venda, 
agora, utilizando outro PE, altere as imagens da janela onde é possível 
identificar o que cada legenda representa. Deve ficar desse jeito:*/

#INCLUDE "TOTVS.CH"
 
User Function MA410LEG()

 Local aArea := GetArea() 
 Local aLegNew := ParamIXB

    AAdd(aLegNew, {"CHECKOK", "Pedido Em Aberto"})
    AAdd(aLegNew, {"BR_CANCEL", "Pedido Encerrado"})
    AAdd(aLegNew, {"GCTPIMSE", "Pedido Liberado"})
    AAdd(aLegNew, {"BR_AZUL","Pedido Bloquedo por regra"}) //Pedido Bloquedo por regra
    AAdd(aLegNew, {"BR_LARANJA","Pedido Bloquedo por verba"}) //Pedido Bloquedo por verba
    
    RestArea(aArea)
Return aLegNew 
    
