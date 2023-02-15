/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|•30- Faça um algoritmo para ler 10 números e armazenar em um array. Após a|
|leitura total dos 10 números, o algoritmo deve escrever esses 10 números  |
|lidos na ordem inversa.                                                   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e30()

    Local aNumeros := {} // criar um array vazio
    Local nNumero := 0
    Local nI

    // loop para ler 10 números
    For nI := 1 to 10
        nNumero := Val(FwInputBox("Digite o número "))
        aAdd(aNumeros, nNumero) // adicionar o número ao array
    Next

    // loop para escrever os números na ordem inversa
    For nI := Len(aNumeros) to 1 step -1
        FwAlertInfo(cValToChar(aNumeros[nI]), "Números na ordem inversa: ")
    Next

Return
