/*              |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 14:Carregar um array com 12 caracteres gerados aleatoriamente (randômicos). 
 Serão válidos apenas caracteres que representem letras minúsculas 
 (de “a” até “z”). A carga do array deverá ser feita através de uma função 
 estática que é chamada automaticamente no programa principal. Os caracteres
 NÃO podem se repetir. No final, exibir o vetor gerado.
 Obs: A exibição deverá ser feita função estática.
|--------------------------------------------------------------------------|*/
#INCLUDE"TOTVS.CH"

User Function JsL5e14()

Local aArray := {}
Local cMsg := "", nI := 0

GerarArray()

    For nI := 1 to 12
        cMsg+=aArray[nI] + ""
    Next nI        

    FwAlertInfo("Esse é o Array gerado com caracteres minúsculos aleatórios é: " + CRLF + "{";
    + cMsg + "}")

Return

Static Function GerarArray(aArray)
    
    Local nChar := 0
    Local cChar := ""
    Local nLarray := Len(aArray)

    // Adiciona caracteres aleatórios sem repetição ao array
    While nLarray < 12 
        nChar := Random(97,122)
        cChar := Chr(nChar)

        If !(cChar $ (aArray))
            aAdd(aArray, cChar)            
        Endif
    Enddo
    
Return
