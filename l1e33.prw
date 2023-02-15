/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.33 - Fa�a um algoritmo para ler 20 n�meros e armazenar em um array     |
|aNumeros, verificar e escrever se existem n�meros repetidos no array      | 
|aNumeros e em que posi��es se encontram.                                  |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e33()
    Local aNumeros := {} // criar um array vazio
    Local nNumero := 0
    Local nI
    Local nJ

    // loop para ler 20 n�meros
    For nI := 1 to 20 
        nNumero := Val(FwInputBox("Digite um n�mero "))
        aAdd(aNumeros, nNumero) // adicionar o n�mero ao array
    Next

    // loop para verificar n�meros repetidos
    For nI := 1 to Len(aNumeros) - 1
        For nJ := nI + 1 to Len(aNumeros)
            If aNumeros[nI] = aNumeros[nJ]
                FwAlertInfo("O n�mero " + cValToChar(aNumeros[nI]) + " est� nas posi��es " + cValToCharn(nI) + " e " + cValToChar(nJ))
            Endif
        Next
    Next

Return
