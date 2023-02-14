/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.19- Escreva um algoritmo para imprimir os números de 1 (inclusive) a 10|
|(inclusive) em ordem decrescente.                                         |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function L1E19()

Local nCont := 0
Local aNum  := {}

//Insira um numero
for nCont := 1 to 10
    AADD(aNum, nCont)
next

for nCont := 10 to 1 step -1
    FwAlertInfo(cValtochar(aNum[ncont]), "ordem decrescente")
next
//Mostre nAntecessor

RETURN
