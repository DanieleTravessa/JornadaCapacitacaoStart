/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex20 - Escreva um algoritmo para imprimir os 10 primeiros números inteiros|
| maiores que 100.                                                         |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e20()

  Local nContador := 0
  Local nNumero := 101

// loop para imprimir os 10 primeiros números inteiros maiores que 100
  While nContador < 10
    FwAlertInfo(cValToChar(nNumero), "Resultado: ")
      nNumero++
      nContador++
  Enddo

Return
