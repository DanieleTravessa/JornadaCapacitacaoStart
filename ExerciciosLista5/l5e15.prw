/*              |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
    15: Ler 12 elementos de um array e coloc�-los em ordem crescente.
        Obs: N�O � permitido o uso da fun��o ASORT().
|--------------------------------------------------------------------------|*/

#INCLUDE"TOTVS.CH"

User Function JsL5e15()

Local aArray := {}
Local nValores, nTemp, nI, nJ
Local nCont
Local nLarray := 0
Local cMsg := ""
Local cMsg2 := ""

    For nCont := 1 to 12
        nValores := Random(1, 30) //Caso nao sejam valores randomicos comentar essa linha
        AADD(aArray, nValores) //e trocar as diretrizes dessa AADD( aArray, nCont)
        cMsg += cValtoChar(aArray[nCont]) + " " 
    Next nCont
   
    nLarray := Len(aArray)

// Bubble Sort para ordenar o array em ordem crescente
    For nI := 1 to 12 
        For nJ:= 1 to 11 
            If aArray[nJ] > aArray[nJ+1]  //[nI+1]
                nTemp := aArray[nJ]
                aArray[nJ] := aArray[nJ+1]
                aArray[nJ+1] := nTemp                
            EndIf
        Endfor       
    Endfor

    For nCont := 1 to 12
        cMsg2+=CVALTOCHAR( aArray[nCont] ) + " "
    Next

    FwAlertInfo("Os valores do Array: " + CRLF + "{" + cMsg + "}" + CRLF + CRLF + "Em ordem crescente �: " + CRLF;
    + "{" + cMsg2 + "}", "Invers�o de Array")
    
Return
