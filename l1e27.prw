/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E.27- Escreva um algoritmo que imprima as seguintes sequ�ncias de n�meros:|
|o (1, 1 2 3 4 5 6 7 8 9 10)
|o (2, 1 2 3 4 5 6 7 8 9 10)
|o (3, 1 2 3 4 5 6 7 8 9 10)
|o (4, 1 2 3 4 5 6 7 8 9 10)e
|assim sucessivamente, at� que o primeiro n�mero (antes da v�rgula), tamb�m|
|chegue a 10.  Obs: Utilize la�o de repeti��o para o preenchimento dos     |
|n�meros antes e depois da v�rgula.                                        |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function AreaRetangulo()

Local nCont2 := 0
Local cLinha := 0
Local cResultado := 0
Local nCont := 1
Local cTitulo

//Insira a Base
//Insira a Altura
For nCont := 1 to 10
cLinha := ''
cLinha += cvaltochar(nCont) + ', '
for ncont2 := 1 to 10
  if ncont2 < 10
  clinha += cvaltochar(ncont2)
  else
  clinha += cvaltochar(ncont2)
  endif
next
cresultado += clinha + char(13)
NEXT

  FwAlertInfo('Resultado do Processamento '+ CRLF + cResultado, cTitulo)

RETURN

/*///Calcular e apresentar o valor do volume de uma lata de �leo, utilizando a f�rmula: VOLUME = 3,14159 x R2 x ALTURA. 

  LOCAL nV := 0, nAlt := 0, nR := 0

  ACCEPT "Informe o raio da lata em metros: " TO nR
  ACCEPT "Informe a altura da lata em metro: " TO nAlt

  nR := Val(nR)
  nAlt := Val(nAlt)
 
  nV := (3.1415*nR^2)*nAlt
 
  QOut("O volume da lata e: ", +AllTrim(Str(round(nV,2)),"m�"))//Fun��o Round ("",n) para arredondar o valor. 
  ?""

RETURN nil
/*/
