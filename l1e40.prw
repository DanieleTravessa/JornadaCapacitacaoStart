/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|Ex40 - Faça um programa para o cálculo de uma folha de pagamento, sabendo  |
|que os descontos são do imposto de Renda, que depende do salário bruto     |
|(conforme tabela abaixo) e 10% para o INSS. Além disso, existe o FGTS que  |
|corresponde a 11% do salário bruto, mas não é descontado (é a empresa que  |
|deposita).                                                                 |
||-------------------------------------------------------------------------||
||                                 Desconto IR                             ||
||-------------------------------------------------------------------------||
||                         Salário Bruto Desconto (%)                      ||
||                      Até R$1200,00 (inclusive) Isento                   ||
||                       Até R$ 1800,00 (inclusive) 5%                     ||
||                      Até R$ 2500,00 (Inclusive) 10%                     ||
||                         Acima de R$2500,00 20%                          ||  
||-------------------------------------------------------------------------||
|O salário líquido corresponde ao salário bruto menos descontos.  O programa|
|deverá pedir ao usuário o valor da sua hora e a quantidade de horas        |
|trabalhadas no mês. Imprima na tela as informações, dispostas conforme o   |
|exemplo abaixo, no exemplo valor da hora é 5 e a quantidade de horas é 220.|
|---------------------------------------------------------------------------|
|                 Salário bruto (5,5 * 220) : R$ 1210,00                    |
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
