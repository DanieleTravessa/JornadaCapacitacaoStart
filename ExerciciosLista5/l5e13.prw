/*              |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
13: Carregar um Array com 50 caracteres gerados aleatoriamente (randômicos).
 Serão válidos apenas caracteres que representem letras maiúsculas (de “A” 
 até “Z”). A carga do array deverá ser feita através de uma função estática
 que é chamada automaticamente no programa principal. Obs: Os caracteres 
 podem se repetir.
|--------------------------------------------------------------------------|*/

#INCLUDE "TOTVS.CH"

User Function JsL5e13()

    Local aCaracteres := {}
    Local nCont := 0
    Local cMsg := ""

    CargaAleatoria(aCaracteres)        

// Percorre e Imprime o array com os caracteres aleatórios
    For nCont := 1 To Len(aCaracteres)
        cMsg += cValToChar(aCaracteres[nCont]) + " "
    Next nCont

    FwAlertInfo("Esse é o Array gerado com caracteres aleatórios: " + CRLF; 
    + "{" + cMsg + "}", "Array com Caracteres Aleatórios")
    
Return

// Função para carregar um array com caracteres aleatórios
Static Function CargaAleatoria(aCaracteres)
  
    Local nCaractere := 0
    Local cCaractere := ""
    Local nI

//Gera valor aleatório entre 65 e 90, convertendo para o código ASCII correspondente.
    For nI := 1 to 50
        nCaractere := Random(65,90)
        cCaractere := CHR(nCaractere)        
        AADD(aCaracteres, cCaractere)
    Next nI

Return aCaracteres
