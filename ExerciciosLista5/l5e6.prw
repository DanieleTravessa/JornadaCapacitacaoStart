/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E6 – Ler dois arrays, A e B de 10 elementos cada e calcular um array C onde
 seu primeiro elemento é o primeiro elemento de A, seu segundo elemento é o
primeiro de B, seu terceiro elemento é o segundo de A, e assim sucessivamente.
 Note que o array C deverá ter 20 elementos. Exibir o conteúdo do array C.
|--------------------------------------------------------------------------|*/

#include "TOTVS.CH"

User Function JsL5e6()

    Local aArrayA := {}, aArrayB := {}, aArrayC := {}
    Local nValor := 0
    Local nCont

    For nCont := 1 to 10
        nValor := Random(1,20)
        AADD(aArrayA, nValor)
        nValor := Random(1,20)
        AADD(aArrayB, nValor)        
    Next nCont

    For nCont := 1 to 10
        AADD(aArrayC, aArrayA[nCont])
        AADD(aArrayC, aArrayB[nCont])     
    Next

    FwAlertInfo("A combinação do Array A: " + CRLF + ArrTokStr(aArrayA, "  ") + CRLF; 
        + CRLF + "com o Array B:" + CRLF + ArrTokStr(aArrayB, "  ") + CRLF + CRLF;
        + "Resulta no Array C: " + CRLF + ArrTokStr(aArrayC, "  "), "Combinação Intercalada de Arrays")

Return
