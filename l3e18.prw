/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E18: Desenvolva uma fun��o que solicite o nome do usu�rio e mostre-o na   |
|vertical em escada. Exemplo:
|M
|MA
|MAR
|MARI
|MARIA
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e18()
  Local cNome := ""
  Local nNum  := 0
  Local cMsg := ""

  cNome := FwInputBox("Informe seu nome: ")
  
  For nNum := 1 to Len(cNome)
    cMsg+=SUBSTR(cNome, 1, nNum)+CRLF
  Next
  
  MsgInfo(cMsg, "Nome em escada")

Return
