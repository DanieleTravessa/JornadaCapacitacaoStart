/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E14 Faça uma função que que leia um array de 5 números inteiros e mostre-os|
| numa string.
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e14()
  Local aInteiros := {}
  Local nNumeros := 0
  Local cNumInt := ""
  Local nI := 0

    While nI < 5
      nNumeros := Val(FwInputBox("Insira um número:"))
      Aadd(aInteiros, nNumeros)
      cNumInt += AllTrim(Str(nNumeros)) + " "
    nI++
    EndDo

    FwAlertInfo(cNumInt, "Os números inseridos foram: ")

Return

