/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E9: Ler 8 elementos em um array A tipo vetor. Construir um array B de mesma
 dimensão onde cada elemento é o triplo do elemento correspondente do array
  A.                    |
|--------------------------------------------------------------------------|
*/

#include "TOTVS.CH"

User Function JsL5e9()

    Local aArrayA := {}, aArrayB := {}
    Local nValor := 0
    Local nCont
    //Local cMsgA := "", cMsgB := ""

    For nCont := 1 to 8
        nValor := Random(1,30)
        AADD(aArrayA, nValor)
        AADD(aArrayB, nValor*3)
        /*cMsgA+=aArrayA[nCont] + ""
        cMsgB+=aArrayB[nCont] + ""*/
    Next nCont

    FwAlertInfo("Esses sao os elementos do Array A" + CRLF + ArrTokStr(aArrayA, "  ") + CRLF +CRLF;
    + "E o Array B com os valores de A triplicados: " + CRLF + ArrTokStr(aArrayB, "  "), "Array Triplicado")

Return    

