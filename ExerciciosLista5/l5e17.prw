/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 17 � Fazer um programa que trate de um array de 8 elementos num�ricos.
Ele dever� apresentar um menu que permitir� as seguintes opera��es:
o Carregar o array atrav�s da leitura dos valores.
o Exibir o conte�do do array.
o Classificar os valores em ordem crescente. Caso o array esteja vazio, informar.
o Classificar os valores em ordem decrescente. Caso o array esteja vazio, informar.
o Pesquisar a exist�ncia de um valor no array. Caso o array esteja vazio, informar.
o Informar o somat�rio dos valores do array.
o Informar a m�dia dos valores do array.
o Informar o maior e o menor valor do array.
o Embaralhar o conte�do do array.
o Informar os valores que se repetem e a quantidade de repeti��es.
|---------------------------------------------------------------------|*/

#INCLUDE"TOTVS.CH"

User Function JsL5e17()
    
    Private aArray := {}
    
    AMenuA()

Return

Static Function AMenuA()
   Local nOpc
   //Local aArray := {}

    nOpc := Aviso("Array", "Escolha uma op��o:", { "CarregarManual", "CarregarAutomatico", "Exibir", "Ordenar",;
       "OrdenarDecrescente", "Pesquisar", "Somar", "M�dia", "Maior/Menor", "Embaralha", "Repete", "Sair" }, 2,"Manipula��o de Array!",,;
        'ROTINAAUTO', .F.,,1)
        //, 10000 )
      
    Do Case
        Case nOpc == 1 //Carregar o array"        
            AcarregaM()            
        Case nOpc == 2 //Carregar o array"        
            AcarregA()  
        Case nOpc == 3 //Exibir o conte�do do array"       
            AexibE()           
        Case nOpc == 4 //Classificar em ordem crescente"   
            AordenA()            
        Case nOpc == 5 //Classificar em ordem decrescente"     
            AordenaD()            
        Case nOpc == 6 //Pesquisar valor no array"    
            ApesquisA()          
        Case nOpc == 7 //Somat�rio dos valores do array"      
            AsomA()            
        Case nOpc == 8 //M�dia dos valores do array"   
            AmediA()          
        Case nOpc == 9 //Maior e menor valor do array"     
            AmaiorMenoR()            
        Case nOpc == 10 //Embaralhar o conte�do do array"  
            AembaralhA()            
        Case nOpc == 11 //Valores que se repetem e a quantidade de repeti��es
            ArepetE()          
        Case nOpc == 12 //Sair      
            lExit := .T.
        OtherWise
            MSINFO("Op��o inv�lida!")
    EndCase
Return

Static function ACarregaM()

    Local nValor := 0
    Local nI
    //Local aArray := {}

    For nI := 1 to 8
        nValor := Val(FwInputBox("Digite o valor para a posi��o " + Str(nI) + ":"))
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
		lret := MSGYESNO("Array carregado, resetar?", "Formata Posi��es Array")
		If lret == .t.
			aArray := {}
		EndIf
		    MsgInfo("Array zerado!")
	EndIf

    AmenuA()

Return 

Static function AExibE()
    
    If Len(aArray) == 0
            MsgAlert("O array est� vazio! Escolha a op��o 'Carregar'!")
    Else
		MsgInfo(ArrToKStr(aArray, ", "), "Conte�do do Array")
	Endif

    AmenuA()
Return 

Static function AordenA()
    
    Local nI := 0
    Local cMsg := ""
    
    If Len(aArray) == 0
            MsgAlert("O array est� vazio! Escolha a op��o de carregar!")
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
       MSGINFO("O array est� vazio! Escolha a op��o de carregar!")
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
       MSGINFO("O array est� vazio! Escolha a op��o de carregar!")
    Else
        nValor := Val(FwInputBox("Informe o valor que deseja pesquisar:"))
        nRetorno := ASCAN(aArray, nValor)
        If nRetorno > 0
            FwAlertSuccess("O valor " + cValToChar(nValor) + ". Foi encontrado na Posi��o: " + cValtoChar(nRetorno), "Encontrado!!!")
        Else
            FwAlertError("O valor " + cValToChar(nValor) + " n�o foi encontrado!", "Aten��o!")
        EndIf
    EndIf

    AmenuA()

Return        

Static Function ASomA()

    Local nSoma := 0
    Local nI := 0

    If Len(aArray) == 0
        MSGINFO("O array est� vazio! Escolha a op��o de carregar!")
    Else
    	For nI := 1 to len(aArray)
			nSoma += aArray[nI]
		Next
    Endif
		MsgInfo('A somat�ria dos valores do array �: ' + cValToChar(nSoma))

    AmenuA()

Return

Static function AmediA()

	Local nSoma := 0, nI, nMedia := 0
  
  	If Len(aArray) == 0
        MSGINFO("O array est� vazio! Escolha a op��o de carregar!")
    Else
    	For nI := 1 to len(aArray)
	        nSoma += aArray[nI]
		Next

		nMedia := nSoma / len(aArray)

		MsgInfo('A m�dia dos valores do array �: ' + cValToChar(nMedia))
	Endif

    AmenuA()

Return

Static function AmaiorMenor()
    
    Local nMaior := 0
    Local nMenor := 0

    If Len(aArray) == 0
        MSGINFO("O array est� vazio! Escolha a op��o de carregar!")
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
        MSGINFO("O array est� vazio! Escolha a op��o de carregar!")
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

        FwAlertInfo("Os valores do Array embaralhados �: " + CRLF;
        + "{" + cMsg + "}", "Invers�o de Array")

    AmenuA()

Return

Static Function ArepetE()

    Local nCont := 0, nI := 0
    Local cMsg := ""

    If Len(aArray) == 0
        MSGINFO("O array est� vazio! Escolha a op��o 'Carregar'!")
    Else
        For nI := 1 to Len(aArray)
            For nCont := nI+1 to Len(aArray)
                If aArray[nI] == aArray[nCont]
                    cMsg += "O valor " + cValToChar(aArray[nI]) + " repete nas posi��es " + cValToChar(nI);
                    + " e "+ cValToChar(nCont)
                EndIf
            Next
        Next
    EndIf
        FwAlertInfo(cMsg, "Repeti��es")

        AmenuA()

Return
