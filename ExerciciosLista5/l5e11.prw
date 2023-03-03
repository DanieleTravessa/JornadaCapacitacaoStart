/*              |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E11 - Ler um array A com 10 elementos. Construir um array B com a mesma 
 dimens�o, sendo que cada elemento de B seja o somat�rio do primeiro at� o
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
    

//Adiciono cada elemento de array A ao somat�rio acumulado nSoma
//Armazenamos o resultado na posi��o correspondente de aB
    For nCont := 1 to 10
        nSoma += aArrayA[nCont]
        AADD(aArrayB,nSoma)
    Next

    // Imprime o array B com a soma cumulativa
    FwAlertInfo("Array B: " + arrTokStr(aArrayB, "  "))
Return
