/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.33 - Faça um algoritmo para ler 20 números e armazenar em um array     |
|aNumeros, verificar e escrever se existem números repetidos no array      | 
|aNumeros e em que posições se encontram.                                  |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e33()
    Local aNumeros := {} // criar um array vazio
    Local nNumero := 0
    Local nI
    Local nJ

    // loop para ler 20 números
    For nI := 1 to 20 
        nNumero := Val(FwInputBox("Digite um número "))
        aAdd(aNumeros, nNumero) // adicionar o número ao array
    Next

    // loop para verificar números repetidos
    For nI := 1 to Len(aNumeros) - 1
        For nJ := nI + 1 to Len(aNumeros)
            If aNumeros[nI] = aNumeros[nJ]
                FwAlertInfo("O número " + cValToChar(aNumeros[nI]) + " está nas posições " + cValToCharn(nI) + " e " + cValToChar(nJ))
            Endif
        Next
    Next

Return
