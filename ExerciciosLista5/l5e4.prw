/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E4 � Elaborar um programa que popule um array de 10 posi��es com valores 
 pares a partir de 2 at� o 20. No final, exibir o conte�do do array.                                                  |
|--------------------------------------------------------------------------|*/
#include "TOTVS.CH"

User Function JsL5e4()

    Local aValores := {}
    Local nCont

    For nCont := 2 to 20 step 2
        AADD( aValores, nCont) 
    Next nCont

/*    For nCont := 1 to 20
        cMsg += aValores[nCont] + " "
    Next nCont*/
        FwAlertInfo("Os valores do Array sao: " + CRLF + ArrTokStr(aValores, "  "), "Array 10 Posicoes com Valores Pares")


Return

