/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex39- Fa�a um programa que realiza o sorteio de um nome. Os nomes contidos|
|no programa devem os nomes dos participantes da trilha de capacita��o do  |
|Projeto Start II.                                                         | 
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e39()

Local aNomes   := {"Daniele","Edson","Fabio","Gabriela","Gustavo F","Gustavo Q","Henrique","Jo�o","Lucas","Matheus","Muriel","Natan","Ruan","Stephani","Tamiris","Vin�cius"}
Local cSorteio := ""
Local nSorteio := 0

//Sorteia um nome
nSorteio := Random(1,Len(aNomes))
cSorteio := aNomes[nSorteio]

//Mostra o nome sorteado
FwAlertInfo(Alltrim(Str(cSorteio)) + ": Voc� ganhou a chance de apresentar o pr�ximo exerc�cio!", "Parab�ns!")

RETURN
