/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.32 - Fa�a um algoritmo para ler dois arrays aArray1 e aArray2 de 15    |
|n�meros cada. Calcular e escrever a quantidade de vezes que aArray1 e     |
|aArray2 possuem os mesmos n�meros e nas mesmas posi��es.                  |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e32()
    
    Local aArray1 := {} // criar o array1 vazio
    Local aArray2 := {} // criar o array2 vazio
    Local nNumero := 0
    Local nIguais := 0
    Local nI

    // loop para ler 15 n�meros para o array1
    For nI := 1 to 15
        nNumero := Val(FwInputBox("Digite um n�mero: "))
        aAdd(aArray1, nNumero) // adicionar o n�mero ao array1
    Next

    // loop para ler 15 n�meros para o array2
    For nI := 1 to 15
        nNumero := Val("Digite um n�mero: ")
        aAdd(aArray2, nNumero) // adicionar o n�mero ao array2
    Next

    // loop para comparar os arrays
    For nI := 1 to Len(aArray1)
        If aArray1[nI] = aArray2[nI]
            nIguais++ // incrementar a contagem de n�meros iguais
        Endif
    Next

    // escrever o resultado
    FwAlertInfo("Os arrays possuem " + cValToChar(nIguais) + " n�meros iguais nas mesmas posi��es.", "Resultado:")
Return
