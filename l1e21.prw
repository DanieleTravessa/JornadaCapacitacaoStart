/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.21 - Ler um valor N e imprimir todos os valores
inteiros entre 1 (inclusive) e N (inclusive).
Considere que o N será sempre maior que ZERO.                     |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e21()

Local nI
Local nNum := 0
Local nNumLimite := -1
Local cRecebe := ''

while nNumLimite <=0
  cREcebe := FwInputBox('Insira um valor: (maior que 0)', cRecebe)
  nNumLimite := val(cRecebe)

  if nNumLimite <= 0
    fwAlertError('Insira um valor maior que 0', 'Numero invalido')
    ENDIF
    ENDDO
    for nI := 1 to nNumLimite
    if nI < nNumLimite
    nNum += alltrim(str(nI)) + ','
    else
      nnum += alltrim(str(nI))
      ENDIF
    next

FwAlertInfo(nNumeros, 'imprimindo numeros')

RETURN
