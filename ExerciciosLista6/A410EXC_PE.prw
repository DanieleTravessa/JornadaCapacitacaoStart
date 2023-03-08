/*2 – Crie um campo na tabela SC5 com as seguintes características:
o Nome do Campo: Tipo de Inclusão
o Opções do Campo (Lista): Manual / Automático
Após criar o campo, utilize um ponto de entrada para impedir a exclusão
de pedidos de venda que tenham esse novo campo com o valor “Automático”.*/

#INCLUDE "TOTVS.CH"

//Ponto de Entrada no pedidos de venda.
User Function A410EXC()

Local aArea := GetArea()
Local aAreaZC5 := SC5->(GetArea())
Local lValida := .F.

    If C5_TINCLUS == AllTrim("2") //valor do campo for Automático
        MSGINFO( "Condição do campo não permite exclusão do Pedido de Venda", "Atenção!!")
        lValida := .T.
    EndIf

    RestArea(aAreaZC5)
    RestArea(aArea)

Return lValida

 





