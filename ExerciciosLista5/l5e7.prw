/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 E7: Ler um array A de 15 elementos e a partir dele construir um array B de
 mesmo tamanho, sendo o inverso de A, ou seja, o primeiro elemento de B
 deverá receber o último de A o segundo de B deverá receber o penúltimo de A
 e assim por diante.                                                         |
|--------------------------------------------------------------------------|
*/
#INCLUDE "TOTVS.CH"

User Function JsL5e7()

    Local aArrayA := {}, aArrayB := {}
    Local nValor := 0
    Local nCont
    
    For nCont := 1 to 15
        nValor := Random(1,30)
        AADD(aArrayA, nValor)    
    Next

    For nCont := 15 to 1 step -1
        AADD(aArrayB, aArrayA[nCont])        
    Next nCont

    FwAlertInfo("Esses são os elementos do Array A" + CRLF + ArrTokStr(aArrayA, "  ") + CRLF + CRLF;
    + "Dispostos de forma invertida: " + CRLF + ArrTokStr(aArrayB, "  "), "Array Invertidos")

Return
