/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.36- Fa�a um programa para calcular n!(Fatorial de n), sendo que o valor|
| inteiro de n � fornecido pelo usu�rio. Sabe-se que: 4! = 4 * 3 * 2 * 1   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e36()

      Local nCnt
      Local nResultado := 1  // Resultado do fatorial
      Local nFator     := 0 // N�mero para o c�lculo
 
      nFator := Val(FwInputBox("Insira o n�mero para o c�lculo de fatorial: "))

// C�lculo do fatorial
      For nCnt := nFator To 1 Step -1
            nResultado *= nCnt
      Next nCnt
 
// Exibe o resultado na tela, atrav�s da fun��o alert
      FwAlertInfo("O fatorial de " + cValToChar(nFator) + ;
      " � " + cValToChar(nResultado))
 
// Termina o programa
Return
