/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 E5 – Ler dois arrays (A e B), de 20 elementos cada e calcular um terceiro 
 (C), onde cada elemento será a soma dos correspondentes em A e B. Apresentar
 o array resultante.
|--------------------------------------------------------------------------|
*/

#include "TOTVS.CH"

User Function JsL5e5()

    Local aArrayA := {}, aArrayB := {}, aArrayC := {}
    Local nCont
    //Local cMsg1 := cMsg2 := cMsg3 := ""
    Local nValor := 0

    For nCont := 1 to 10
        nValor := Random(1,20)
        AADD(aArrayA, nValor)
        nValor := Random(1,20)
        AADD(aArrayB, nValor)
        nSoma := aArrayA[nCont] + aArrayB[nCont]
        AADD(aArrayC, nSoma)     
    Next nCont

    FwAlertInfo("A soma dos elementos do array A: " + CRLF + ArrTokStr(aArrayA, "  "); 
            + CRLF + CRLF + "Com os elementos do array B: " + CRLF + ArrTokStr(aArrayB, "  ");
            + CRLF + CRLF + "Resulta no Array C com os seguintes elementos: "; 
            + CRLF + ArrTokStr(aArrayC, "  "), "Soma de Vetores")
Return
