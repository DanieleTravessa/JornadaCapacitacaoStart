/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.36- Faça um programa para calcular n!(Fatorial de n), sendo que o valor|
| inteiro de n é fornecido pelo usuário. Sabe-se que: 4! = 4 * 3 * 2 * 1   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e36()

      Local nCnt
      Local nResultado := 1  // Resultado do fatorial
      Local nFator     := 0 // Número para o cálculo
 
      nFator := Val(FwInputBox("Insira o número para o cálculo de fatorial: "))

// Cálculo do fatorial
      For nCnt := nFator To 1 Step -1
            nResultado *= nCnt
      Next nCnt
 
// Exibe o resultado na tela, através da função alert
      FwAlertInfo("O fatorial de " + cValToChar(nFator) + ;
      " é " + cValToChar(nResultado))
 
// Termina o programa
Return
