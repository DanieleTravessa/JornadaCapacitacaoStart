/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E16:Crie uma fun��o que permita ao usu�rio digitar o seu nome e em seguida|
|mostre-o de tr�s para frente utilizando apenas letras mai�sculas. Exemplo:|
|o Usu�rio digita o nome �Maria�
|o Dever� ser apresentado: �AIRAM�
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
  
  MsgInfo(cMsg, "Seu Nome de tr�s pra frente!")

Return
