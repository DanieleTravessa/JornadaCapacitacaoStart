/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.14 - Escreva um algoritmo para ler 2 valores e se o segundo valor      |
|informado for ZERO, deve ser lido um novo valor, ou seja, para o segundo  |
|valor n�o pode ser aceito o valor zero. Imprimir o resultado da divis�o do|
|primeiro valor lido pelo segundo valor lido.                              |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function Jsl1e14()

Local nNum1 := 0
Local nNum2 := 0

//Insira um numero
    nNum1 := Val(FwInputBox("Insira o primeiro valor: ", nNum1))

//Mostre nAntecessor
While nNum2 == 0
    nNum2 := Val(FwInputBox("Insira o segundo valor: ", nNum2))
End

FwAlertInfo('O valor da divisao �: ' + AllTrim(STR(nNum1/nNum2)), "Valor da divis�o')")

RETURN
