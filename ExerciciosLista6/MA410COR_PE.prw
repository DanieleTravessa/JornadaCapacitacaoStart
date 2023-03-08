/*3 – Utilize um Ponto de Entrada para alterar as legendas da rotina “Pedidos de Venda”.
As legendas devem utilizar as seguintes imagens:
o Pedido em aberto: “CHECKOK”
o Pedido encerrado: “BR_CANCEL”
o Pedido Liberado: “GCTPIMSE”
Após a alteração o browse dos pedidos de venda devem ficar da seguinte forma:*/

#INCLUDE "TOTVS.CH"

//Adiciona cores no browse de legenda 
User Function MA410COR()

Local aArea := GetArea()
Local aCores := ParamIXB 

//Adiciona cores no browse de legenda 
  aAdd(aCores,{"Empty(C5_LIBEROK).And.Empty(C5_NOTA) .And. Empty(C5_BLQ) .And. C5_X_CONF = 'S'","CHECKOK","Pedido Em Aberto"})		//Pedido em Aberto
  aAdd(aCores,{"!Empty(C5_NOTA).Or.C5_LIBEROK=='E' .And. Empty(C5_BLQ)" ,"BR_CANCEL","Pedido Encerrado"})	//Pedido Encerrado
  aAdd(aCores,{"!Empty(C5_LIBEROK).And.Empty(C5_NOTA).And. Empty(C5_BLQ)","GCTPIMSE","Pedido Liberado"}) //Pedido Liberado
     
    RestArea(aArea)
Return aCores

/*
aAdd(aCores,{"C5_BLQ == '1'",'BR_AZUL','Pedido Bloquedo por regra'}) //Pedido Bloquedo por regra
aAdd(aCores,{"C5_BLQ == '2'",'BR_LARANJA','Pedido Bloquedo por verba'})	//Pedido Bloquedo por verba
aAdd(aCores,{'C5_X_CAMPO="N"','BR_PINK','Descrição do novo status'})     // Pedido "Novo STATUS"*/
*/
