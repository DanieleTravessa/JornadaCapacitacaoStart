/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 E12 - Ler um array A com 5 elementos. Construir um array B com a mesma 
 dimensão, onde cada elemento do array B deverá ser o valor inverso (sinal
trocado) do elemento correspondente do array A. 
Apresentar os elementos do array B.
|--------------------------------------------------------------------------|*/

User Function JsL5e12()

    Local aArrayA := {1, 2, -3, 4, -5}
    Local aArrayB := {}
    Local nI

    For nI := 1 to Len(aArrayA)
        aArrayB[nI] := aArrayA[nI] * -1
    Next

    // Imprime o array B com os valores invertidos
    FwAlertInfo("Array B: " + ArrTokStr(aArrayB, "  "))
Return
