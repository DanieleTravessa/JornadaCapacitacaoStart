/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E11 - Elaborar um programa que exiba na tela, automaticamente, 50 valores |
|gerados aleatoriamente, entre 10 e 99. Fazer 2 versões desta solução:     |
|o 1ª - Utilizando For                                                     |
|o 2ª – Utilizando While                                                   |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e11()
    
    Local nOpt := 0
    Private aNumero := {}
    Private nNumero := 0
    Private nCont := 0

    nOpt := Aviso("Sorteio de Números", "Escolha uma opção de sorteio", {"**FOR**", "**WHILE**"}, 1,,,,,)

    If nOpt == 1
        u_For()
    
    ELSEIF nOpt == 2
        u_While()
    
    EndIf
        
Return

//==> Versão: For
//Aqui temos à estrutura, a variável com contador se iniciando simultaneamente. 
Static Function u_For(nCont)
          
        For nCont:= 1 to 50
            nNumero := Random(10,99)
            aAdd(aNumero, nNumero)
        Next  //Volta para o início da estrutura até que a condição de saída seja cumprida
           
    ImprimA()

Return

//==> Versão: laço com While
Static Function u_While()
    
    Local nCont := 1

    WHILE nCont <= 50 //Utilizando o While;
        nNumero := Random(10,99) //É atribuída à variável um valor aleatório
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

//minha primeira função: imprimir e jogar num quadro 
