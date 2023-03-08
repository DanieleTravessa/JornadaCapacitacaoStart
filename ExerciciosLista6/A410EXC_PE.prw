/*2 � Crie um campo na tabela SC5 com as seguintes caracter�sticas:
o Nome do Campo: Tipo de Inclus�o
o Op��es do Campo (Lista): Manual / Autom�tico
Ap�s criar o campo, utilize um ponto de entrada para impedir a exclus�o
de pedidos de venda que tenham esse novo campo com o valor �Autom�tico�.*/

#INCLUDE "TOTVS.CH"

//Ponto de Entrada no pedidos de venda.
User Function A410EXC()

Local aArea := GetArea()
Local aAreaZC5 := SC5->(GetArea())
Local lValida := .F.

    If C5_TINCLUS == AllTrim("2") //valor do campo for Autom�tico
        MSGINFO( "Condi��o do campo n�o permite exclus�o do Pedido de Venda", "Aten��o!!")
        lValida := .T.
    EndIf

    RestArea(aAreaZC5)
    RestArea(aArea)

Return lValida

 





