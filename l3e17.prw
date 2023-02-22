/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E17: Desenvolva uma função que solicite o nome do usuário e mostre-o na   |
|vertical.
Exemplo:
R
O
B
E
R
T
O
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e17()
  Local cNome := ""
  Local nNum  := 0
  Local cMsg := ""

  cNome := FwInputBox("Informe seu nome: ")
  
  For nNum := 1 to Len(cNome)
    cMsg+=SUBSTR(cNome, nNum, 1)+CRLF
  Next
  
  MsgInfo(cMsg, "Seu Nome na Vertical!")

Return
