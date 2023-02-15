/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex39- Faça um programa que realiza o sorteio de um nome. Os nomes contidos|
|no programa devem os nomes dos participantes da trilha de capacitação do  |
|Projeto Start II.                                                         | 
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e39()

Local aNomes   := {"Daniele","Edson","Fabio","Gabriela","Gustavo F","Gustavo Q","Henrique","João","Lucas","Matheus","Muriel","Natan","Ruan","Stephani","Tamiris","Vinícius"}
Local cSorteio := ""
Local nSorteio := 0

//Sorteia um nome
nSorteio := Random(1,Len(aNomes))
cSorteio := aNomes[nSorteio]

//Mostra o nome sorteado
FwAlertInfo(Alltrim(Str(cSorteio)) + ": Você ganhou a chance de apresentar o próximo exercício!", "Parabéns!")

RETURN
