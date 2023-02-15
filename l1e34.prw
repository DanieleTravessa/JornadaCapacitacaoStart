/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.34 - Faça um programa que receba a idade e o peso de sete pessoas.     |
|Calcule e mostre:                                                         | 
|o A quantidade de pessoas com mais de 90 quilos                           | 
|o A média das idades das sete pessoas                                     |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e34()

    Local nIdade
    Local nPeso
    Local nSomaIdade := 0
    Local nContPeso := 0
    Local nMediaIdade := 0
    Local nI

    For nI := 1 to 7
        nIdade := Val(FwInputBox("Digite a idade da pessoa "))

        nPeso := Val(FwInputBox("Digite o peso da pessoa "))
            
        If nPeso > 90
            nContPeso++
        Endif
    
        nSomaIdade += nIdade
    Next

    nMediaIdade := nSomaIdade / 7

    FwAlertInfo(AllTrim(Str(nContPeso, 2, 0)), "Quantidade de pessoas com mais de 90 quilos: ")
    FwAlertInfo(Alltrim(Str(nMediaIdade, 5, 2)), "Média das idades das sete pessoas: ")
Return
