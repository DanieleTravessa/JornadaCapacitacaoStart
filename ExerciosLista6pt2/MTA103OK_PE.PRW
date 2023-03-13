/*1 – Utilizando Ponto de Entrada, faça uma validação na inclusão / alteração dos Pedidos de Compra,
onde não será possível adicionar um novo item (nova linha no grid) caso o campo “Tipo de
Entrada” não esteja preenchido. A cada tentativa de adicionar um novo item, se o Tipo de Entrada
não estiver preenchido, uma mensagem de erro deve ser apresentada.*/

#Include "TOTVS.CH"

User Function MTA103OK()
	Local aArea := GetArea()
	Local lRet := .T.
	Local nLinha := 0
	Local nPosTes := GDFieldPos("C7_TES")
	Local cTes
				
		//Faz a abertura da tabela de TES, e define o índice 1 para uso
	//	DbSelectArea("SF4")
	//	SF4->(DbSetOrder(1)) // F4_FILIAL + F4_CODIGO
	
		//Percorrendo todas as linhas do documento de entrada
		For nLinha := 1 To Len(aCols)
			If INCLUI .or. ALTERA			
			//Pegando as informações de TES conforme a grid
			cTes    := aCols[nLinha][nPosTes]
					
				//Se conseguir posicionar na tabela de TES
				If SC7->(DbSeek(FWxFilial("SC7") + cTes))
			
					//Se no cadastro de TES estiver estiver vazio
					If SC7->C7_TES == Empty(cTes)
						MsgStop("Na linha " + cValToChar(nLinha) + ", o cadastro de TES não está preenchido! Preencha o tipo de entrada.", "Atenção!")
						lRet := .F.
						Exit
					EndIf
				EndIf	
			EndIf
		Next		
	RestArea(aArea)
Return lRet
