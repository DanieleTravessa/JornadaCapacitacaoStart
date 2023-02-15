/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|Ex40 - Fa�a um programa para o c�lculo de uma folha de pagamento, sabendo  |
|que os descontos s�o do imposto de Renda, que depende do sal�rio bruto     |
|(conforme tabela abaixo) e 10% para o INSS. Al�m disso, existe o FGTS que  |
|corresponde a 11% do sal�rio bruto, mas n�o � descontado (� a empresa que  |
|deposita).                                                                 |
||-------------------------------------------------------------------------||
||                                 Desconto IR                             ||
||-------------------------------------------------------------------------||
||                         Sal�rio Bruto Desconto (%)                      ||
||                      At� R$1200,00 (inclusive) Isento                   ||
||                       At� R$ 1800,00 (inclusive) 5%                     ||
||                      At� R$ 2500,00 (Inclusive) 10%                     ||
||                         Acima de R$2500,00 20%                          ||  
||-------------------------------------------------------------------------||
|O sal�rio l�quido corresponde ao sal�rio bruto menos descontos.  O programa|
|dever� pedir ao usu�rio o valor da sua hora e a quantidade de horas        |
|trabalhadas no m�s. Imprima na tela as informa��es, dispostas conforme o   |
|exemplo abaixo, no exemplo valor da hora � 5 e a quantidade de horas � 220.|
|---------------------------------------------------------------------------|
|                 Sal�rio bruto (5,5 * 220) : R$ 1210,00                    |
|                       ( � ) IR (5%) : R$ 60,50                            |
|                    ( � ) INSS ( 10% ) : R$ 121,00                         |
|                       FGTS ( 11%) : R$ 133,10                             |
|                   Total de descontos : R$ 181,50                          |
|                    Sal�rio L�quido : R$ 1028,50                           | 
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

// Solicitar o n�mero de horas trabalhadas, e o sal�rio por hora
    cHrTrab := FwInputBox("Informe o n�mero de horas trabalhadas: ", cHrTrab)
    cSalHora := FwInputBox("Informe o sal�rio por hora: ", cSalHora)

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

//Calculo Sal�rio Total
    nDescont := (nINSS + nIR)
    nSalTot := nSalBruto - nDescont
   
// Mostrar a folha completa
     
    FwAlertInfo("Sal�rio bruto (" + cSalHora + "*" + cHrTrab + "): R$" + AllTrim(Str(nSalBruto,10,2))+;
        "( � ) IR (" + AllTrim(Str(nIR)) + "%) : R$" + AllTrim(Str(nSIR))+;
        "( � ) INSS ( 10% ) : R$" + AllTrim(Str(nINSS))+ ;    
        "FGTS ( 11%) : R$" + AllTrim(Str(nFGTS)) +;    
        "Total de descontos : R$" + AllTrim(Str(nDescont))+;
        "Sal�rio L�quido : R$" + AllTrim(Str(nSalTot)), "Folha de Pagamento")

Return
