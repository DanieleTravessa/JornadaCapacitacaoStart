/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E2: Escreva um algoritmo para ler as dimens�es de um ret�ngulo (base e    |
| altura), calcular e escrever a �rea desse ret�ngulo.                     |
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

//Calcula a �rea do ret�ngulo
  nRetangulo = (nBase * nAltura)

//Mostra a �rea do Retangulo
  MSGALERT( nRetangulo, "A �rea do retangulo com as mendidas informadas, �:")

RETURN
