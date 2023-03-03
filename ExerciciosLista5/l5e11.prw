/*              |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E11 - Ler um array A com 10 elementos. Construir um array B com a mesma 
 dimensão, sendo que cada elemento de B seja o somatório do primeiro até o
elemento correspondente de A. Apresentar os elementos do array B.
|--------------------------------------------------------------------------|
*/

User Function JsL5e11()

    Local aArrayA := {}, aArrayB := {}
    Local nValores
    Local nCont
    Local nSoma := 0

//Populo o array A de 10 elementos
    For nCont := 1 to 10
        nValores := Random(1, 30) 
        AADD( aArrayA, nValores)
    Next nCont
    

//Adiciono cada elemento de array A ao somatório acumulado nSoma
//Armazenamos o resultado na posição correspondente de aB
    For nCont := 1 to 10
        nSoma += aArrayA[nCont]
        AADD(aArrayB,nSoma)
    Next

    // Imprime o array B com a soma cumulativa
    FwAlertInfo("Array B: " + arrTokStr(aArrayB, "  "))
Return
