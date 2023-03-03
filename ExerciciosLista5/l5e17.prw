/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 17 – Fazer um programa que trate de um array de 8 elementos numéricos.
Ele deverá apresentar um menu que permitirá as seguintes operações:
o Carregar o array através da leitura dos valores.
o Exibir o conteúdo do array.
o Classificar os valores em ordem crescente. Caso o array esteja vazio, informar.
o Classificar os valores em ordem decrescente. Caso o array esteja vazio, informar.
o Pesquisar a existência de um valor no array. Caso o array esteja vazio, informar.
o Informar o somatório dos valores do array.
o Informar a média dos valores do array.
o Informar o maior e o menor valor do array.
o Embaralhar o conteúdo do array.
o Informar os valores que se repetem e a quantidade de repetições.
|---------------------------------------------------------------------|*/

#INCLUDE"TOTVS.CH"

User Function JsL5e17()
    
    Private aArray := {}
    
    AMenuA()

Return

Static Function AMenuA()
   Local nOpc
   //Local aArray := {}

    nOpc := Aviso("Array", "Escolha uma opção:", { "CarregarManual", "CarregarAutomatico", "Exibir", "Ordenar",;
       "OrdenarDecrescente", "Pesquisar", "Somar", "Média", "Maior/Menor", "Embaralha", "Repete", "Sair" }, 2,"Manipulação de Array!",,;
        'ROTINAAUTO', .F.,,1)
        //, 10000 )
      
    Do Case
        Case nOpc == 1 //Carregar o array"        
            AcarregaM()            
        Case nOpc == 2 //Carregar o array"        
            AcarregA()  
        Case nOpc == 3 //Exibir o conteúdo do array"       
            AexibE()           
        Case nOpc == 4 //Classificar em ordem crescente"   
            AordenA()            
        Case nOpc == 5 //Classificar em ordem decrescente"     
            AordenaD()            
        Case nOpc == 6 //Pesquisar valor no array"    
            ApesquisA()          
        Case nOpc == 7 //Somatório dos valores do array"      
            AsomA()            
        Case nOpc == 8 //Média dos valores do array"   
            AmediA()          
        Case nOpc == 9 //Maior e menor valor do array"     
            AmaiorMenoR()            
        Case nOpc == 10 //Embaralhar o conteúdo do array"  
            AembaralhA()            
        Case nOpc == 11 //Valores que se repetem e a quantidade de repetições
            ArepetE()          
        Case nOpc == 12 //Sair      
            lExit := .T.
        OtherWise
            MSINFO("Opção inválida!")
    EndCase
Return

Static function ACarregaM()

    Local nValor := 0
    Local nI
    //Local aArray := {}

    For nI := 1 to 8
        nValor := Val(FwInputBox("Digite o valor para a posição " + Str(nI) + ":"))
        AADD(aArray, nValor)
    Next nI

    AmenuA()
Return 

Static Function AcarregA()

    Local nI, nNum := 0
	Local lret := .f.
    

	If Len(aArray) == 0
		For nI := 1 to 8
			nNum := RANDOMIZE(1,90)
			Aadd(aArray, nNum)
		Next

		MsgInfo('Array carregado!!')
    	
    Else
		lret := MSGYESNO("Array carregado, resetar?", "Formata Posições Array")
		If lret == .t.
			aArray := {}
		EndIf
		    MsgInfo("Array zerado!")
	EndIf

    AmenuA()

Return 

Static function AExibE()
    
    If Len(aArray) == 0
            MsgAlert("O array está vazio! Escolha a opção 'Carregar'!")
    Else
		MsgInfo(ArrToKStr(aArray, ", "), "Conteúdo do Array")
	Endif

    AmenuA()
Return 

Static function AordenA()
    
    Local nI := 0
    Local cMsg := ""
    
    If Len(aArray) == 0
            MsgAlert("O array está vazio! Escolha a opção de carregar!")
    Else
        Asort(aArray)

		For nI := 1 to Len(aArray)
			cMsg += cValToChar(aArray[nI]) + " "
		Next
    
		MsgInfo(cMsg, "Array em ordem crescente!")
	Endif
    AmenuA()
Return

Static Function AordenaD()

    Local nI
    Local cMsg := ""

    If Len(aArray) == 0
       MSGINFO("O array está vazio! Escolha a opção de carregar!")
    Else
        aArray := Asort(aArray)
		For nI := Len(aArray) to 1 step -1
			cMsg += cValToChar(aArray[nI]) + ", "
		Next      
    Endif
    	FwAlertInfo(cMsg, "Array disposto em ordem decrescente")

    AmenuA()

Return

Static Function ApesquisA()

    Local nValor := 0, nRetorno := 0

    If Len(aArray) == 0
       MSGINFO("O array está vazio! Escolha a opção de carregar!")
    Else
        nValor := Val(FwInputBox("Informe o valor que deseja pesquisar:"))
        nRetorno := ASCAN(aArray, nValor)
        If nRetorno > 0
            FwAlertSuccess("O valor " + cValToChar(nValor) + ". Foi encontrado na Posição: " + cValtoChar(nRetorno), "Encontrado!!!")
        Else
            FwAlertError("O valor " + cValToChar(nValor) + " não foi encontrado!", "Atenção!")
        EndIf
    EndIf

    AmenuA()

Return        

Static Function ASomA()

    Local nSoma := 0
    Local nI := 0

    If Len(aArray) == 0
        MSGINFO("O array está vazio! Escolha a opção de carregar!")
    Else
    	For nI := 1 to len(aArray)
			nSoma += aArray[nI]
		Next
    Endif
		MsgInfo('A somatória dos valores do array á: ' + cValToChar(nSoma))

    AmenuA()

Return

Static function AmediA()

	Local nSoma := 0, nI, nMedia := 0
  
  	If Len(aArray) == 0
        MSGINFO("O array está vazio! Escolha a opção de carregar!")
    Else
    	For nI := 1 to len(aArray)
	        nSoma += aArray[nI]
		Next

		nMedia := nSoma / len(aArray)

		MsgInfo('A média dos valores do array é: ' + cValToChar(nMedia))
	Endif

    AmenuA()

Return

Static function AmaiorMenor()
    
    Local nMaior := 0
    Local nMenor := 0

    If Len(aArray) == 0
        MSGINFO("O array está vazio! Escolha a opção de carregar!")
    Else
        Asort(aArray)

        nMaior := aTail(aArray)
        nMenor := aArray[1]
       
        FwAlertInfo("Maior valor no array: " + cValToChar(nMaior) + CRLF;
                    + "Menor valor no array: " + cValToChar(nMenor), "Maior e Menor Valor")
    EndIf

    AmenuA()

Return     
		       
Static function AembaralhA()

	Local nI := 0
    Local cMsg := ""
    Local nValor := 0
    
    If Len(aArray) == 0
        MSGINFO("O array está vazio! Escolha a opção de carregar!")
    Else
        For nI := 1 to 8 
            nPosi1 := Random(1, 8)
            nPosi2 := Random(1, 8)
            
            If aArray[nPosi1] <> aArray[nPosi2]
                nValor := aArray[nPosi1]
                aArray[nPosi1] := aArray[nPosi2]
                aArray[nPosi2] := nValor
            EndIf
            cMsg+=cValToChar(aArray[nI]) + " "
        Next
    EndIf

        FwAlertInfo("Os valores do Array embaralhados é: " + CRLF;
        + "{" + cMsg + "}", "Inversão de Array")

    AmenuA()

Return

Static Function ArepetE()

    Local nCont := 0, nI := 0
    Local cMsg := ""

    If Len(aArray) == 0
        MSGINFO("O array está vazio! Escolha a opção 'Carregar'!")
    Else
        For nI := 1 to Len(aArray)
            For nCont := nI+1 to Len(aArray)
                If aArray[nI] == aArray[nCont]
                    cMsg += "O valor " + cValToChar(aArray[nI]) + " repete nas posições " + cValToChar(nI);
                    + " e "+ cValToChar(nCont)
                EndIf
            Next
        Next
    EndIf
        FwAlertInfo(cMsg, "Repetições")

        AmenuA()

Return
