/*---------------------------------------------------------------
 2: Ler 10 elementos de um array e apresentá-los na ordem inversa 
 em que foram lidos e armazenados.
-----------------------------------------------------------------*/
#include "TOTVS.CH"

User Function JsL5e2()

    Local aElementos := {}
    Local xElemento
    Local aInverte := {}
    Local nCont := 0

    For nCont:= 1 TO 10
        xElemento := FwInputBox("Insira um elemento: ")
        aAdd(aElementos, xElemento)            
    Next nCont

    For nCont := 10 to 1 step -1
        aADD(aInverte, aElementos[nCont]) 
        //cMsg1 += aElementos[nCont]
    Next nCont

    FwAlertInfo("Esses sao os elementos informados" + CRLF + ArrTokStr(aElementos, "  ") + CRLF + CRLF;
     + "Em ordem inversa:" + CRLF + ArrTokStr(aInverte, "  "), "Lista de Elementos")
Return

