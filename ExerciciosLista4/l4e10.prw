/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 04---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|Ex10 - Fa�a um programa para o c�lculo de uma folha de pagamento, sabendo  |
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

User Function JsL4e10()

//Declara��o e Atribui��o de vari�veis                      
    Local oJnla := Nil
    Local cTitulo := "Calcula Folha de Pagamento"
    Local cTexto := "Informe o n�mero de horas trabalhadas: "
    Local cTexto2 := "Informe o sal�rio por hora: "
    Local nHrTrab := Space(10), nSalHora := Space(10)
    Local nLinFim := 200, nColFim := 450
    Local nOpcao := 0

// Solicitar o n�mero de horas trabalhadas, e o sal�rio por hora 
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 60,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 60,010 of oJnla PIXEL
    @ 010, 095 MSGET  nHrTrab SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET  nSalHora SIZE 050, 010 OF oJnla PIXEL
    @ 070, 005 BUTTON "Calcula" SIZE 50, 11 OF oJnla PIXEL ACTION CalFolha(nHrTrab, nSalHora)
    @ 070, 120 BUTTON "Finaliza" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function CalFolha(cHrTrab, nSalHora)
 
    Local nIR      := 0, nSIR, nINSS := 0, nFGTS := 0
    Local nDescont := 0, nSalBruto := 0, nSalTot := 0     
  
    nHrTrab := Val(nHrTrab)
    nSalHora := Val(nSalHora)

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
     
    FwAlertInfo('Sal�rio bruto (' + ALLTRIM(STR(nSalHora)) + '*' + ALLTRIM(STR(nHrTrab)) + ')_______: R$ ' + ALLTRIM(StrZero(nSalBruto,7,2))+CRLF+;
                '( � ) IR ('+ALLTRIM(nSIR)+')_______________: R$ '+ALLTRIM(StrZero(nSIR,5,2))+CRLF+;
                '( � ) INSS (10%)____________: R$ '+ALLTRIM(StrZero(nINSS,6,2))+CRLF+;
                'FGTS (11%)_______________: R$ '+ALLTRIM(StrZero(nFGTS,6,2))+CRLF+;
                'Total de descontos__________: R$ '+ALLTRIM(StrZero(nDescont,6,2))+CRLF+;
                'Sal�rio L�quido_____________: R$ '+ALLTRIM(StrZero(nSalTot,7,2)))

Return
