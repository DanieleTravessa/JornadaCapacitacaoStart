/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E19: Solicite ao usuário que escreva uma frase, após isso conte:
|o Quantos espaços em branco existem na frase
|o Quantas vezes cada vogal aparece na frase.
| Ex: A: 5, E: 2, I: 2, O: 1, U: 0
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e19()
  Local cFrase := ""
  Local nEspaço:= 0, nA := 0, nE := 0, nI := 0, nO := 0, nU := 0, nCel := 0

  cFrase := Upper(FwInputBox("Escreva uma frase"))
  //aFrase := Separa(cFrase,",",.t.)
  //cEspaço := ASC(32)

  For nCel := 1 to Len(cFrase)
    If ASC(Substr(cFrase, ncel, 1)) == 32
      nEspaço++
    EndIf 
    If Substr(cFrase, nCel, 1) == "A"
      nA++
    EndIf
    IF Substr(cFrase, nCel, 1) == "E"
      nE++
    EndIf
    IF Substr(cFrase, nCel, 1) == "I"
      nI++
    EndIf
    IF Substr(cFrase, nCel, 1) == "O"
      nO++
    EndIf
    IF Substr(cFrase, nCel, 1) == "U"
      nU++
    ENDIF
NEXT

  FwAlertInfo(Str(nEspaço) + " espaços, "+CRLF+Str(nA) + " vogais A; "+CRLF+Str(nE) + " vogais E; "+CRLF+Str(nI) + " vogais I; "+CRLF+Str(nO) + " vogais O; "+CRLF+Str(nU) + " vogais U; "+CRLF,"A frase digitada possui: ")

Return
