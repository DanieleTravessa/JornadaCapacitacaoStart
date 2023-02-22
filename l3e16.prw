/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E16:Crie uma função que permita ao usuário digitar o seu nome e em seguida|
|mostre-o de trás para frente utilizando apenas letras maiúsculas. Exemplo:|
|o Usuário digita o nome “Maria”
|o Deverá ser apresentado: “AIRAM”
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function Jsl3e16()
  Local cNome := ""
  Local nNum  := 0
  Local cMsg := ""

  cNome := FwInputBox("Informe seu nome: ")
  
  For nNum := Len(cNome) to 1 step -1
    cMsg+=SUBSTR(cNome, nNum, 1)
  Next
  
  MsgInfo(cMsg, "Seu Nome de trás pra frente!")

Return
