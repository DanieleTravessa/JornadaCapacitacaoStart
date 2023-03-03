/*              |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
13: Carregar um Array com 50 caracteres gerados aleatoriamente (rand�micos).
 Ser�o v�lidos apenas caracteres que representem letras mai�sculas (de �A� 
 at� �Z�). A carga do array dever� ser feita atrav�s de uma fun��o est�tica
 que � chamada automaticamente no programa principal. Obs: Os caracteres 
 podem se repetir.
|--------------------------------------------------------------------------|*/

#INCLUDE "TOTVS.CH"

User Function JsL5e13()

    Local aCaracteres := {}
    Local nCont := 0
    Local cMsg := ""

    CargaAleatoria(aCaracteres)        

// Percorre e Imprime o array com os caracteres aleat�rios
    For nCont := 1 To Len(aCaracteres)
        cMsg += cValToChar(aCaracteres[nCont]) + " "
    Next nCont

    FwAlertInfo("Esse � o Array gerado com caracteres aleat�rios: " + CRLF; 
    + "{" + cMsg + "}", "Array com Caracteres Aleat�rios")
    
Return

// Fun��o para carregar um array com caracteres aleat�rios
Static Function CargaAleatoria(aCaracteres)
  
    Local nCaractere := 0
    Local cCaractere := ""
    Local nI

//Gera valor aleat�rio entre 65 e 90, convertendo para o c�digo ASCII correspondente.
    For nI := 1 to 50
        nCaractere := Random(65,90)
        cCaractere := CHR(nCaractere)        
        AADD(aCaracteres, cCaractere)
    Next nI

Return aCaracteres
