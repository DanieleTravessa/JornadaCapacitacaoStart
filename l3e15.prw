/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E15 - Desenvolva um programa que receba a temperatura média de cada mês do|
|ano e armazene-as em um array. Após isso, calcule a média de temperatura  |
|anual e mostre todas as temperaturas acima da média anual e em que mês    |
|ocorreram exemplo:
|Média Anual: 28 Graus
|Fevereiro: 29 Graus
|Novembro: 31 Graus
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e15()

  Local nTemp   := 0, nSoma   := 0, nMedia  := 0, nCont := 0
  Local aTemp   := {}
  Local cMsg    := '', cMes :=''
  
  For nCont := 1 to 12
    nTemp := Val(FwInputBox("Informe a temperatura do mês de " + mesextenso(nCont)))
    Aadd(aTemp, nTemp)
    nSoma += nTemp
  Next

  nMedia := nSoma / 12

    For nCont := 1 to 12
            cMes := MesExtenso(nCont)

        if aTemp[nCont] > nMedia
            cMsg += cMes +": "+  cValToChar(aTemp[nCont]) +"°C" + CRLF
        endif
    NEXT

FwAlertInfo("A média anual das temperaturas é: " + ALLTRIM(STR(nMedia,5,2)) + "°C" + CRLF + CRLF +;
                "As temperaturas dos seguintes meses estão acima da média anual: " + CRLF + CRLF + cMsg,;
                "TEMPERATURAS DO ANO")
  
Return
