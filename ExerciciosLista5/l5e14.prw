/*              |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 14:Carregar um array com 12 caracteres gerados aleatoriamente (rand�micos). 
 Ser�o v�lidos apenas caracteres que representem letras min�sculas 
 (de �a� at� �z�). A carga do array dever� ser feita atrav�s de uma fun��o 
 est�tica que � chamada automaticamente no programa principal. Os caracteres
 N�O podem se repetir. No final, exibir o vetor gerado.
 Obs: A exibi��o dever� ser feita fun��o est�tica.
|--------------------------------------------------------------------------|*/
#INCLUDE"TOTVS.CH"

User Function JsL5e14()

Local aArray := {}
Local cMsg := "", nI := 0

GerarArray()

    For nI := 1 to 12
        cMsg+=aArray[nI] + ""
    Next nI        

    FwAlertInfo("Esse � o Array gerado com caracteres min�sculos aleat�rios �: " + CRLF + "{";
    + cMsg + "}")

Return

Static Function GerarArray(aArray)
    
    Local nChar := 0
    Local cChar := ""
    Local nLarray := Len(aArray)

    // Adiciona caracteres aleat�rios sem repeti��o ao array
    While nLarray < 12 
        nChar := Random(97,122)
        cChar := Chr(nChar)

        If !(cChar $ (aArray))
            aAdd(aArray, cChar)            
        Endif
    Enddo
    
Return
