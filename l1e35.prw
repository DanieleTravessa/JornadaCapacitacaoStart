/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.35 - Faça um programa que receba várias idades e que calcule e mostre a|
| média das idades digitadas. Finalize o processo de entrada de dados      |
|digitando a idade igual a zero.                                           |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e35()

    Local cEntrada := ""
    Local nSoma := 0
    Local nResultado     := 0
    Local nCont := 1
    Local lContinua := .T.

//Insira um numero
    While lContinua == .T.
        
        For nCont := 1 to 2
        cEntrada := '-1'
        nAntecessor = val(nNumero - 1)
        while val(cEntrada) < 0 .or. Val(cEntrada) > 10
        cEntrada:=''
        cEntrada := FwInputBox('Informe a Idade da Pessoa: ', cEntrada)
    ENDDO
        nSoma += Val(cEntrada)
        Next
        nResultado := nSoma / 2

        FwAlertInfo("A media das idades" + cvaltochar(nresultado), "Média das Idades")    
    
        cEntrada := FwInputBox("Digite zero para sair (0).", cEntrada)
        If cEntrada == "0"
            lContinua := .F.
        ENDIF
    ENDDO

RETURN
