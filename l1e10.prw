/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.10 - Ler 3 valores (considere que n�o ser�o informados valores iguais) |
|e escrev�-los em ordem crescente.                                         |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function Ocrescente()

Local cValor1 := ""
Local nValor1 := 0
Local cValor2 := ""
Local nValor2 := 0
Local cValor3 := ""
Local nValor3 := 0
Local nAux  := 0
Local nAux2 := 0
Local nAux3 := 0

//Ler os tr�s valores
    cValor1 := FwInputBox("Digite o primeiro valor: ", cValor1)
    cValor2 := FwInputBox("Digite o segundo valor: ", cValor2)
    cValor3 := FwInputBox("Digite o terceiro valor: ", cValor3)
    
    nValor1 := Val(cValor1)
    nValor2 := Val(cValor2)
    nValor3 := Val(cValor3)

//Checar a ordem dos valores e reorden�-los
    If nValor1 > nValor2 
        nAux := nValor1
        nValor1 := nValor2
        nValor2 := nAux
    EndIf

    If nValor2 > nValor3 
        nAux2 := nValor2
        nValor2 := nValor3
        nValor3 := nAux2
    EndIf

    If nValor1 > nValor2
        nAux3 := nValor1
        nValor1 := nValor2
        nValor2 := nAux3
    EndIf

// Mostrar os valores em ordem crescente
   FwAlertInfo(Str(nValor1) + ',' + Str(nValor2) + ',' + Str(nValor3), 'Esses s�o os valores ' + cValor1 + ', ' + cValor2 + ", " + cValor3 + ' informados, ordenados de forma crescente: ')
//
Return
