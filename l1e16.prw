/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.16 - Escreva um algoritmo para ler as notas da 1a e 2a avalia��es de um|
|aluno, calcule e imprima a m�dia desse aluno. S� devem ser aceitos valores|
| v�lidos durante a leitura (0 a 10) para cada nota.                       |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e16()

Local cEntrada     := ""
Local nSoma        := 0
Local nResultado :=0
Local nCont := 1
Local cTitulo := "Programa calcula media de um aluno"

//Insira um numero
For nCont := 1 to 2
cEntrada := '1'
while Val(cEntrada < 0 .or. val(cEntrada)) > 10
cEntrada :=''
cEntrada := FwInputBox('Informe a nota do alino', cEntrada)
ENDDO
nSoma += Val(cEntrada)
next

nresultado := nSoma / 2
fwalertinfo('A media do aluno: ' + cvaltochar(nResultado), ctitulo)

RETURN
