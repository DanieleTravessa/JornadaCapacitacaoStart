/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.25 - Escreva um algoritmo para ler 10 n�meros e ao final da leitura    |
|escrever a soma total dos 10 n�meros lidos.                               |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsSoma()

  Local nValor := 0
  Local cValor := ""
  Local nSoma := 0
  Local nNum

  For nNum := 1 to 10
    cValor := FwInputBox("Informe um valor qualquer: ", cValor)
    nValor := Val(cValor)
    nSoma += nValor 
  Next

  FwAlertInfo(Str(nSoma), "A Soma dos valores informados �: ") 

RETURN
