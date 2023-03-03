/*             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E3: Elaborar um programa que popule um array de 30 posições com valores de 
 1 até 30. No final, exibir o conteúdo do array.                                                                    |
|--------------------------------------------------------------------------|*/

#include "TOTVS.CH"

User Function JsL5e3()

    Local aValores := {}
    Local nValores
    Local nCont

    For nCont := 1 to 30
        nValores := Random(1, 30) //Caso nao sejam valores randomicos comentar essa linha
        AADD( aValores, nValores) //e trocar as diretrizes dessa AADD( aValores, nCont)
    Next nCont
        //cMsg += aValores[nCont] + " "
        FwAlertInfo("Os valores do Array são: " + CRLF + ArrTokStr(aValores,"  "), "Array de 30 Posições")
    
Return
