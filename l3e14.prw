/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E14 Fa�a uma fun��o que que leia um array de 5 n�meros inteiros e mostre-os|
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
      nNumeros := Val(FwInputBox("Insira um n�mero:"))
      Aadd(aInteiros, nNumeros)
      cNumInt += AllTrim(Str(nNumeros)) + " "
    nI++
    EndDo

    FwAlertInfo(cNumInt, "Os n�meros inseridos foram: ")

Return

