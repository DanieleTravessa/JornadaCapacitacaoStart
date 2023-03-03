/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E8 � Fazer um programa que carregue um array de 8 elementos e que inverta 
 a ordem do seu conte�do. Apresente no final o array invertido.
 Obs: Usar apenas um array.
|--------------------------------------------------------------------------|
/*/
#INCLUDE "TOTVS.CH"

User Function JsL5e8()

Local aArray := {}
Local nValor := 0
Local nCombina
Local nCont

//Populo o array com 8 elementos
    For nCont := 1 to 8
        nValor := Random(1,20)
        AADD(aArray, nValor)
        cMsg+= cValtoChar(aArray[nCont]) + " "
        //AINS(aArray, 1)
    Next
/*
    For nCont := 0 to 7
        nCombina := aArray[8-nCont]
        nCombina2 := aArray[nCont+1]
        aArray[nCont+1] := nCombina
        aArray[8-nCont] := nCombina2
        cMsgInv+= cValtoChar(aArray[nCont+1]) + " "
    Next
*/
//Percorro metade do Array e com a ajuda de uma vari�vel auxiliar, troco o primeiro elemento com o �ltimo.
    For nCont := 1 to 4
        nCombina := aArray[nCont]
        aArray[nCont] := aArray[8 - nCont + 1]
        aArray[8 - nCont + 1] := nCombina
    Next
//Dentro da vari�vel cMsgInv adiciono os elementos do Array Invertido para exib�-lo.
    For nCont := 1 to 8
        cMsgInv+= cValtoChar(aArray[nCont]) + " "
    Next

    FwAlertInfo("O conte�do do Array: " + CRLF + "{" + cMsg + "}" + CRLF + CRLF;
        + "Apresentado de forma invertida �: " + CRLF + "{" + cMsgInv + "}", "Array Invertido")

Return
