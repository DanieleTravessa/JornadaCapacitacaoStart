/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.20 - Escreva um algoritmo para imprimir os 10
primeiros números inteiros maiores que 100.                     |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e20()

Local nI    := ""
Local aDesc := {}
Local nCont := 0
Local cExibe:= ""

//Insira a Base
while nI < 112
  AADD(aDesc, nI)
  nI++
ENDDO

//Insira a Altura
for nCont := 1 to Len(aDesc)
  If nCont < len(aDesc)
    cExibe += alltrim(str(adesc[nCont])) + '. '
  endif
next nCont
MsgAlert(cExibe, "Resultado")

//Mostre nAntecessornRetangulo

RETURN

/*///Calcular e apresentar o valor do volume de uma lata de óleo, utilizando a fórmula: VOLUME = 3,14159 x R2 x ALTURA. 

  LOCAL nV := 0, nAlt := 0, nR := 0

  ACCEPT "Informe o raio da lata em metros: " TO nR
  ACCEPT "Informe a altura da lata em metro: " TO nAlt

  nR := Val(nR)
  nAlt := Val(nAlt)
 
  nV := (3.1415*nR^2)*nAlt
 
  QOut("O volume da lata e: ", +AllTrim(Str(round(nV,2)),"m³"))//Função Round ("",n) para arredondar o valor. 
  ?""

RETURN nil
/*/
