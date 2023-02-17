/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.6 -Efetuar a leitura de quatro números inteiros e apresentar os números|
| que são divisíveis por 2 e 3.                                            |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e6()
//Efetuar a leitura de quatro números inteiros e apresentar os números que são divisíveis por 2 e 3.
Local nN1 := 0, nN2 := 0, nN3 := 0, nN4 :=0

nN1 := Val(FwInputBox("Insira o 1° numero: "))
nN2 := Val(FwInputBox("Insira o 2° numero: "))
nN3 := Val(FwInputBox("Insira o 3° numero: ")) 
nN4 := Val(FwInputBox("Insira o 4° numero: "))

IF nN1%2 = 0 .and. nN1%3 = 0
  FwAlertInfo("O numero", +AllTrim(Str(nN1)), "é divisivel por 2 e 3 =", +AllTrim(Str(nN1)))
  FwAlertInfo("Dividido por 2 =", +AllTrim(Str(nN1/2)), "e dividido por 3 =", +AllTrim(Str(nN1/3)))
EndIf

IF nN2%2 = 0 .and. nN2%3 = 0
  FwAlertInfo("O numero", nN2, "é divisivel por 2 e 3 e", nN2)
  FwAlertInfo("Dividido por 2 e", +AllTrim(Str(nN2/2)), "e dividido por 3 e", +AllTrim(Str(nN2/3)))
ENDIF

IF nN3%2 = 0 .and. nN3%3 = 0
  FwAlertInfo("O numero", +AllTrim(Str(nN3)), "é divisivel por 2 e 3 e", +AllTrim(Str(nN3)))
  FwAlertInfo("Dividido por 2 e ", +AllTrim(Str(nN3/2)), "e dividido por 3 e", +AllTrim(Str(nN3/3)))
ENDIF

IF nN4%2 = 0 .and. nN4%3 = 0
  FwAlertInfo("O numero", +AllTrim(Str(nN4)), "é divisivel por 2 e 3 e", +AllTrim(Str(nN4)))
  FwAlertInfo("Dividido por 2 e", +AllTrim(Str(nN4/2)), "e dividido por 3 e", +AllTrim(Str(nN4/3)))
ENDIF

Return
