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

User Function Antecessor()

Local nCnt
Local nResultado := 1  // Resultado do fatorial
Local nFator     := 5 // N�mero para o c�lculo
 
// C�lculo do fatorial
For nCnt := nFator To 1 Step -1
nResultado *= nCnt
Next nCnt
 
// Exibe o resultado na tela, atrav�s da fun��o alert
Alert("O fatorial de " + cValToChar(nFator) + ;
      " � " + cValToChar(nResultado))
 
// Termina o programa
Return

RETURN
