/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|�30- Fa�a um algoritmo para ler 10 n�meros e armazenar em um array. Ap�s a|
|leitura total dos 10 n�meros, o algoritmo deve escrever esses 10 n�meros  |
|lidos na ordem inversa.                                                   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e30()

    Local aNumeros := {} // criar um array vazio
    Local nNumero := 0
    Local nI

    // loop para ler 10 n�meros
    For nI := 1 to 10
        nNumero := Val(FwInputBox("Digite o n�mero "))
        aAdd(aNumeros, nNumero) // adicionar o n�mero ao array
    Next

    // loop para escrever os n�meros na ordem inversa
    For nI := Len(aNumeros) to 1 step -1
        FwAlertInfo(cValToChar(aNumeros[nI]), "N�meros na ordem inversa: ")
    Next

Return
