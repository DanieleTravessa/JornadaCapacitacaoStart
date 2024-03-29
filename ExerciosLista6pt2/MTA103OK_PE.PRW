/*1 � Utilizando Ponto de Entrada, fa�a uma valida��o na inclus�o / altera��o dos Pedidos de Compra,
onde n�o ser� poss�vel adicionar um novo item (nova linha no grid) caso o campo �Tipo de
Entrada� n�o esteja preenchido. A cada tentativa de adicionar um novo item, se o Tipo de Entrada
n�o estiver preenchido, uma mensagem de erro deve ser apresentada.*/

#Include "TOTVS.CH"

User Function MTA103OK()
	Local aArea := GetArea()
	Local lRet := .T.
	Local nLinha := 0
	Local nPosTes := GDFieldPos("C7_TES")
	Local cTes
				
		//Faz a abertura da tabela de TES, e define o �ndice 1 para uso
	//	DbSelectArea("SF4")
	//	SF4->(DbSetOrder(1)) // F4_FILIAL + F4_CODIGO
	
		//Percorrendo todas as linhas do documento de entrada
		For nLinha := 1 To Len(aCols)
			If INCLUI .or. ALTERA			
			//Pegando as informa��es de TES conforme a grid
			cTes    := aCols[nLinha][nPosTes]
					
				//Se conseguir posicionar na tabela de TES
				If SC7->(DbSeek(FWxFilial("SC7") + cTes))
			
					//Se no cadastro de TES estiver estiver vazio
					If SC7->C7_TES == Empty(cTes)
						MsgStop("Na linha " + cValToChar(nLinha) + ", o cadastro de TES n�o est� preenchido! Preencha o tipo de entrada.", "Aten��o!")
						lRet := .F.
						Exit
					EndIf
				EndIf	
			EndIf
		Next		
	RestArea(aArea)
Return lRet
