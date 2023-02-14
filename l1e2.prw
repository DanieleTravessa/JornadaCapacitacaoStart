/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E2: Escreva um algoritmo para ler as dimensões de um retângulo (base e    |
| altura), calcular e escrever a área desse retângulo.                     |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function AreaRetangulo()

  Local cVBase
  Local cVAltura
  Local nBase   
  Local nAltura   
  Local nRetangulo

//Insira a Base
  cVBase := FwInputBox("Informe a medida da base:", cVBase)
  nBase := VAL(cVBase)

//Insira a Altura
  cVAltura := FwInputBox("Informe a medida da altura:", cVAltura)
  nAltura := VAL(cVAltura)

//Calcula a área do retângulo
  nRetangulo = (nBase * nAltura)

//Mostra a área do Retangulo
  MSGALERT( nRetangulo, "A área do retangulo com as mendidas informadas, é:")

RETURN
