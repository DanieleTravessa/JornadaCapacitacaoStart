/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.31 - Faça um algoritmo para ler 10 números e armazenar em um array.    |
|Após isto, o algoritmo deve ordenar os números no array em ordem crescente|
|Escrever o vetor ordenado.                                                |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsArrcresc()

    Local aValor := {}
    Local nValor := 0
    Local cValor := ""
    Local aOrden := 0
    Local nNum

    For nNum := 1 to 10
        cValor := FwInputBox("Informe um valor qualquer: ", cValor)
        nValor := Val(cValor)
        AADD(aValor, nValor)    
    Next
    
    aOrden := Asort(aValor)

    For nNum := 1 to 10
        FwAlertInfo(cValtochar(aOrden[nNum]), "Ordem crescente")
    Next

RETURN
