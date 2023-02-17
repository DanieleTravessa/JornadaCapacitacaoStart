/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|image.png
Ex40 - Faça um programa para o cálculo de uma folha de pagamento, sabendo  |
|que os descontos são do imposto de Renda, que depende do salário bruto     |
|(conforme tabela abaixo) e 10% para o INSS. Além disso, existe o FGTS que  |
|corresponde a 11% do salário bruto, mas não é descontado (é a empresa que  |
|deposita).                                                                 |
||-------------------------------------------------------------------------||
||                                 Jogo Adivinhe o Número                             ||
||-------------------------------------------------------------------------||
||                        
Obs:Faça a pt 1 em um arquivo e o game completo (pt 1+pt 2) em outro arquivo.             ||
||                      Até R$1200,00 (inclusive) Isento                   ||
||                       Até R$ 1800,00 (inclusive) 5%                     ||
||                      Até R$ 2500,00 (Inclusive) 10%                     ||
||                         Acima de R$2500,00 20%                          ||  
||-------------------------------------------------------------------------||
|Parte 1: Elaborar um jogo do tipo adivinhe o número. Onde deverá ser sorteado um número entre 0 e 100. Em seguida solicitado que o usuário adivinhe qual foi o número sorteado. Após o “chute” do usuário apresentar uma mensagem informando se o número sorteado é maior, menor ou igual ao número “chutado”.O salário líquido corresponde ao salário bruto menos descontos.  O programa|
|deverá pedir ao usuário o valor da sua hora e a quantidade de horas        |
|trabalhadas no mês. Imprima na tela as informações, dispostas conforme o   |
|exemplo abaixo, no exemplo valor da hora é 5 e a quantidade de horas é 220.|
|---------------------------------------------------------------------------|
|  Parte 2: Continue o desenvolvimento do jogo. Agora, o programa deverá continuar dando dicas a cada palpite do usuário até que ele acerte o número sorteado. Quando o usuário acertar o número gerado deverá ser apresentado o resultado do teste da seguinte forma:
• Em menos de 5 tentativas exibir a mensagem: “Você é muito bom, acertou em “x” tentativas.”
• Em mais que 5 e menos que 9 tentativas: “Você é bom, acertou em “x” tentativas".
• Em mais que 9 e menos que 13 tentativas: “Você é mediano, acertou em “x” tentativas”.
• Em mais que 13: “Você é muito fraco, acertou em “x” tentativas”               Salário bruto (5,5 * 220) : R$ 1210,00                    |
|                       ( – ) IR (5%) : R$ 60,50                            |
|                    ( – ) INSS ( 10% ) : R$ 121,00                         |
|                       FGTS ( 11%) : R$ 133,10                             |
|                   Total de descontos : R$ 181,50                          |
|                    Salário Líquido : R$ 1028,50                           | 
|---------------------------------------------------------------------------|
/*/
#INCLUDE "TOTVS.CH"

User Function JsL1e40()

    Local cHrTrab  :=""
    Local nHrTrab  := 0
    Local cSalHora := ""
    Local nSalHora := 0
    Local nIR      := 0
    Local nSIR
    Local nINSS    := 0
    Local nFGTS    := 0
    Local nDescont := 0
    Local nSalBruto:= 0
    Local nSalTot  := 0     

// Solicitar o número de horas trabalhadas, e o salário por hora
    cHrTrab := FwInputBox("Informe o número de horas trabalhadas: ", cHrTrab)
    cSalHora := FwInputBox("Informe o salário por hora: ", cSalHora)

    nHrTrab := Val(cHrTrab)
    nSalHora := Val(cSalHora)

// Checagem de IR
    Do Case                        
        Case nSalBruto <= 1200
            nIR = 0
        Case nSalBruto > 1200 .and. nSalBruto <= 1800
            nIR := 5
        Case nSalBruto > 1800 .and. nSalBruto <= 2500
            nIR := 10                     
        Otherwise
            nIR := 20
    ENDCASE

//Calculos Impostos
    nFGTS := (nSalBruto * 11)/100
    nINSS := (nSalBruto * 10)/100 
    nSIR  := (nSalBruto * nIR)/100

//Calculo Salário Total
    nDescont := (nINSS + nIR)
    nSalTot := nSalBruto - nDescont
   
// Mostrar a folha completa
     
    FwAlertInfo("Salário bruto (" + cSalHora + "*" + cHrTrab + "): R$" + AllTrim(Str(nSalBruto,10,2))+;
        "( – ) IR (" + AllTrim(Str(nIR)) + "%) : R$" + AllTrim(Str(nSIR))+;
        "( – ) INSS ( 10% ) : R$" + AllTrim(Str(nINSS))+ ;    
        "FGTS ( 11%) : R$" + AllTrim(Str(nFGTS)) +;    
        "Total de descontos : R$" + AllTrim(Str(nDescont))+;
        "Salário Líquido : R$" + AllTrim(Str(nSalTot)), "Folha de Pagamento")

Return

Function Main()
//Jogo Adivinha o número.
    Local nN 
    Local nChute := 0
    Local nTent := 0

    nN := Random()% 100 + 1
    while nChute != nN

        ACCEPT "Digite um numero (de 1 a 100): " to nChute
        nChute = val(nChute)

        if(nChute == nN)
            QOUT("Parabens, voce acertou.")
            QOUT("O total de erro foi de: " + alltrim(str(nTent)))

        elseif (nChute > nN)
            QOUT("O valor digitado e maior, tente novamente.")
            nTent +=1

        else
            QOUT("O valor digitado e baixo, tente novamente.")
            nTent +=1

        ENDIF

    ENDDO

RETURN NIL





/*74.Jogo Adivinha o número - parte 2: Continue o desenvolvimento do jogo. Agora, o programa deverá continuar dando dicas a cada palpite do usuário até que ele acertar o número sorteado. Quando o usuário acertar o número gerado deverá ser apresentado o resultado do teste. Da seguinte forma: 
• Em menos de 5 tentativas exibir a mensagem: “Você é muito bom, acertou em x tentativas.” 
• Em mais do que 5 e menos do que 9 tentativas: “Você é bom, acertou em x tentativas". 
• Em mais do que 9 e menos do que 13 tentativas: “Você é mediano, acertou em x tentativas”. 
• Em mais do que 13: “Você é muito fraco, acertou em x tentativas” 
*/
Function Main()

    Local nN 
    Local nChute := 0
    Local nTent := 0

    nN := Random()% 100 + 1
    while nChute != nN

        ACCEPT "Digite um numero (de 1 a 100): " to nChute
        nChute = val(nChute)

        if(nChute == nN)
            QOUT("Parabens, voce acertou.")
            QOUT("O total de erro foi de: " + alltrim(str(nTent)))

        elseif (nChute > nN)
            QOUT("O valor digitado e maior, tente novamente.")
            nTent +=1
        else
            QOUT("O valor digitado e baixo, tente novamente.")
            nTent +=1
        ENDIF
      
    ENDDO
    
    IF nTent <=5
        ?"Voce e muito bom, acertou em ", +AllTrim(STR(nTent)),"tentativas"
    ELSEIF nTent > 5 .and. nTent <= 9
        ?"Voce e bom, acertou em ", +AllTrim(STR(nTent)),"tentativas"
    ELSEIF nTent > 9 .and. nTent <= 13
        ?"Voce e mediano, acertou em ", +AllTrim(STR(nTent)),"tentativas"
    ELSEIF nTent > 13
        ?"Voce e muito fraco, acertou em ", +AllTrim(STR(nTent)),"tentativas"
    ENDIF
RETURN NIL
