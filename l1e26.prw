/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E26- Faça um algoritmo que calcule e escreva a média aritmética dos números|
|inteiros entre 15 (inclusive) e 100 (inclusive).                          |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e26()

Local nCont := 0
Local nNum  := 0
Local nSoma := 0

//Insira a Base
//Insira a Altura
for nCont := 15 to 100
nSoma += nCont
nNum++
next

fwalertinfo('A soma dos valores e ' + Alltrim(Str(nSoma/nNum)), 'Resultado')

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
