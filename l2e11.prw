/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E11 - Elaborar um programa que exiba na tela, automaticamente, 50 valores |
|gerados aleatoriamente, entre 10 e 99. Fazer 2 vers�es desta solu��o:     |
|o 1� - Utilizando For                                                     |
|o 2� � Utilizando While                                                   |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e11()
    
    Local nOpt := 0
    Private aNumero := {}
    Private nNumero := 0
    Private nCont := 0

    nOpt := Aviso("Sorteio de N�meros", "Escolha uma op��o de sorteio", {"**FOR**", "**WHILE**"}, 1,,,,,)

    If nOpt == 1
        u_For()
    
    ELSEIF nOpt == 2
        u_While()
    
    EndIf
        
Return

//==> Vers�o: For
//Aqui temos � estrutura, a vari�vel com contador se iniciando simultaneamente. 
Static Function u_For(nCont)
          
        For nCont:= 1 to 50
            nNumero := Random(10,99)
            aAdd(aNumero, nNumero)
        Next  //Volta para o in�cio da estrutura at� que a condi��o de sa�da seja cumprida
           
    ImprimA()

Return

//==> Vers�o: la�o com While
Static Function u_While()
    
    Local nCont := 1

    WHILE nCont <= 50 //Utilizando o While;
        nNumero := Random(10,99) //� atribu�da � vari�vel um valor aleat�rio
        aAdd(aNumero, nNumero)
        nCont++
    ENDDO
         
    ImprimA() 

Return

Static Function ImprimA()

    Local nCont:= 0
    Local cMsg := ""
      
    For nCont := 1 to Len(aNumero)
        cMsg += cValtochar(aNumero[nCont]) + " , "            
    Next

    FwAlertSuccess(cMsg, "*** A Contagem chegou ao final! ***")
Return

//minha primeira fun��o: imprimir e jogar num quadro 
