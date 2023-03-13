/*3 – Desenvolva uma rotina utilizando um PE para que ao incluir ou alterar um Pedido de Venda,
todos os produtos desse pedido fiquem com a observação “Inc. PE - ” antes da descrição.
o Exemplo:
? Item 1: Inc. PE – Creatina
? Item 2: Inc. PE – Whey Protein
? ...*/

User Function M410STTS()

    Local aArea := GetArea()
    Local aAreaC7 := SC7->(GetArea())
    Local nOper := PARAMIXB[1]
    
    If nOper == 3 .or. nOper == 4 
        SC7->C7_DESCRI := ("Inc. PE - " + SC7->C7_DESCRI)
    EndIf

    RestArea(aArea)
    RestArea(aAreaC7)
Return
