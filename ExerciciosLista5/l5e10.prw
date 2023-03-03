/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E10:Ler dois arrays: A com 10 elementos e B com 15 elementos. Construir um
 array C, sendo este, a jun��o dos outros dois arrays. Desta forma, C dever�
 ter a capacidade de armazenar 25 elementos. Apresentar o array C.
|--------------------------------------------------------------------------|
*/
#INCLUDE "TOTVS.CH"

User Function JsL5e10()

    Local aArrayA := {}
    Local aArrayB := {}
    Local aArrayC := {}
    Local cMsg1 := cMsg2 := cMsg3 := ""
    Local nCont, nElementos

//Com o uso de for, populo randomicamente o array A para as primeiras 10 posi��es do array C.
    For nCont := 1 to 10
        nElementos := Random(1, 30) //Caso nao sejam valores randomicos comentar essa linha
        AADD(aArrayA, nElementos) //e trocar as diretrizes dessa AADD( aValores, nCont)
        cMsg1 += cValToChar(aArrayA[nCont]) + " "
    Next nCont

//Com outro for, populo randomicamente os elementos do array B para as posi��es finais do array C. 
    For nCont := 1 to 15
        nElementos := Random(1, 30)
        AADD(aArrayB, nElementos)
        cMsg2 += cValToChar(aArrayB[nCont]) + " "
    Next nCont

// Copio os elementos do array A para o array C
    aArrayC := ACLONE( aArrayA )
    /*Sem usar fun��o:
    For nCont := 1 to Len(aArray)
        aArrayC[nCont] := aArrayA[nCont] //ou AADD(aArrayC,aArray[nCont])
    Next*/

    //Copio os elementos do array B para o array C
    For nCont := 1 to Len(aArrayB)
        AADD(aArrayC, aArrayB[nCont])
    //Sem usar fun��o --> aArrayC[Len(aArrayA) + nCont] := aArrayB[nCont]
    Next

    // Imprimo o array C com a jun��o dos arrays A e B
    For nCont := 1 to 25
        cMsg3 += cValToChar(aArrayC[nCont]) + " "
    Next
    
    FwAlertInfo("A combina��o dos elementos do Array A de 10 posi��es:" + CRLF;
    + "{" + cValToChar(cMsg1) + "}" + CRLF + CRLF + "Com o Array B de 15 posi��es:" + CRLF;
    + "{" + cValtoChar(cMsg2) + "}" + CRLF + CRLF + "Resulta no Array C de 25 posi��es: " + CRLF;
    + "{" + cMsg3 + "}", "Array de 25 Posi��es")

Return
