/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.11 - Ler 3 valores, cada um representando as medidas dos lados de um   |
|tri�ngulo e escrever se formam ou n�o um tri�ngulo. OBS: para formar um   |
|tri�ngulo, o valor de cada lado deve ser menor que a soma dos outros 2 lados.|
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function Treangulo()

Local cLado1 := ""
Local nLado1 := 0
Local cLado2 := ""
Local nLado2 := 0
Local cLado3 := ""
Local nLado3 := 0

//Informar os lados
    cLado1 := FwInputBox("Informe o primeiro lado: ", cLado1)
    cLado2 := FwInputBox("Informe o segundo lado", cLado2)
    cLado3 := FwInputBox("Informe o terceiro lado", cLado3)

    nLado1 := Val(cLado1)
    nLado2 := Val(cLado2)
    nLado3 := Val(cLado3)

    If (((nLado1+nLado2)>nLado3) .and. ((nLado2+nLado3)>nLado1) .and. ((nLado1+nLado3)>nLado2))
        FwAlertSuccess("Os Lados " + cLado1 + ", " + cLado2 + ", " + cLado3 + " informados formam um tri�ngulo!", "� um tri�ngulo!")
    Else
        FwAlertError("Os Lados " + cLado1 + ", " + cLado2 + ", " + cLado3 + " informados n�o formam um tri�ngulo!", "N�o � um tri�ngulo!") 
    Endif 

RETURN
