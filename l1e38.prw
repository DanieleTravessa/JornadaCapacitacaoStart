/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.38 - Faça um programa que receba a idade de dez pessoas e que calcule e|
|mostre a quantidade de pessoas com idade maior ou igual a 18 anos.        |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function Maiores()

    Local aIdade := {}
    Local nIdade := 0
    Local cIdade := ""
    Local nMaior := 0
    Local nNum

    For nNum := 1 to 10
    cIdade := FwInputBox("Informe a idade:", cIdade)
    nIdade := Val(cIdade)
        If nIdade >= 18
        AADD(aIdade, nIdade)    
        Endif 
    Next
nMaior := Len(aIdade)

FwAlertInfo(Str(nMaior) + " maiores de 18 anos.", "Foram registrados: ") 

//Insira sua data de nascimento

//Mostre nIdadeDias

RETURN
