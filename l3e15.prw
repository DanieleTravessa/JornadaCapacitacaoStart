/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E15 - Desenvolva um programa que receba a temperatura m�dia de cada m�s do|
|ano e armazene-as em um array. Ap�s isso, calcule a m�dia de temperatura  |
|anual e mostre todas as temperaturas acima da m�dia anual e em que m�s    |
|ocorreram exemplo:
|M�dia Anual: 28 Graus
|Fevereiro: 29 Graus
|Novembro: 31 Graus
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e15()

  Local nTemp   := 0, nSoma   := 0, nMedia  := 0, nCont := 0
  Local aTemp   := {}
  Local cMsg    := '', cArmazMes :=''
  
  For nCont := 1 to 12
    nTemp := Val(FwInputBox("Informe a temperatura do m�s de " + mesextenso(nCont)))
    Aadd(aTemp, nTemp)
    nSoma += nTemp
  Next

  nMedia := nSoma / 12

    For nCont := 1 to 12
            cArmazMes := MesExtenso(nCont)

        if aTemp[nCont] > nMedia
            cMsg += cArmazMes +' - '+  cValToChar(aTemp[nCont]) +'�C' + CRLF
        endif
    NEXT

FwAlertInfo('A m�dia das temperaturas anual: ' + ALLTRIM(STR(nMedia,5,2)) + '�C' + CRLF + CRLF +;
                'As temperaturas dos seguintes meses est�o acima da m�dia: '     + CRLF + CRLF + cMsg,;
                'TEMPERATURAS ACIMA DA M�DIA ')
  
Return
