/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E5: Escreva um programa que pergunte a quantidade de Km percorridos por um
carro alugado e a quantidade de dias pelos quais ele foi alugado. Calcule o
preço a pagar, sabendo que o carro custa R$60,00/dia e R$0,15/Km rodado.
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL4e5()

//Declaração e Atribuição de variáveis                      
    Local oJnla := Nil
    Local cTitulo := "Aluguel de Carro"
    Local cTexto := "Digite os dias de aluguel: "
    Local cTexto2 := "Digite a quilometragem percorrida: "
    Local nTempo := Space(10), nKm := Space(10)
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0

//Solicita os valores   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 090,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 090,010 of oJnla PIXEL
    @ 010, 095 MSGET  nTempo    SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET  nKm    SIZE 050, 010 OF oJnla PIXEL  
    @ 050, 010 BUTTON "Calcular" SIZE 50, 012 OF oJnla PIXEL ACTION CalcAluguel(nTempo,nKm)
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function CalcAluguel(nTempo,nKm)

    Local nValorAlug := 0
    nTempo := Val(nTempo)
    nKm := Val(nKm)
    
//Calculos 
    nValorAlug := (nTempo*60)+(nKm*0,15)
    
//Apresentação dos resultados     
    FwAlertInfo("--> Com um aluguel de " +AllTrim(Str(nTempo)) + " dias;";
    + CRLF + "--> E uma distância percorrida de " +AllTrim(Str(nKm)) + " km;";
    + CRLF + "--> O Valor total a pagar é de R$ " + AllTrim(Str(nValorAlug,10,2)), "Cálculo do Aluguel do Veículo")    
Return
