/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.22 - Ler um valor inteiro (aceitar somente valores
entre 1 e 10) e escrever a tabuada de 1 a 10 do
valor lido.                    |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e22()
    
    Local nValor := 0
    Local nI

    // loop para ler o valor até que um valor entre 1 e 10 seja informado
    While nValor < 1 .or. nValor > 10
      nValor := Val(FwInputBox("Digite um valor inteiro entre 1 e 10: "))
    Enddo

    // loop para escrever a tabuada de 1 a 10 do valor lido
    For nI := 1 to 10
        FwAlertInfo := (cValToChar(nValor) + " x " + cValToChar(nI) + " = " + cValToChar(nValor * nI), "Tabuada")
    Next

Return

