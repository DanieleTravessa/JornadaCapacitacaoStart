/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.15 - Acrescentar uma mensagem de 'VALOR INV�LIDO' no exerc�cio anterior|
| caso o segundo valor informado seja ZERO.                                |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e15()

Local nPrimeiroVal := 0
Local nSegundoVal :=0

//Insira um numero
nPrimeiroVal := val(FwInputbox('insira o primeiro vlaor: '))
nSengundoVal := val(FwInputbox('insira o segundo vlaor: '))

while nSegundoVal := 0
    FwAlertError('Valor Inv�lido!')
    nSegundoVal := Val(FwInputBox('Insira o segundo valor: '))
ENDDO

FwAlertInfo('O valor da divis�o �: ' + AllTrim(Str(nPrimeiroVal/nSegundoVal)), 'valor da blablabla')
RETURN
