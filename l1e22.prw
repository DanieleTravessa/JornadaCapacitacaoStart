/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.22 - Ler um valor inteiro (aceitar somente valores
entre 1 e 10) e escrever a tabuada de 1 a 10 do
valor lido.                    |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e22()

Local nBase      := ""
Local nAltura    := ""
Local nRetangulo := ""

//Insira a Base
//Insira a Altura
nRetangulo = val(nBase * nAltura)

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
