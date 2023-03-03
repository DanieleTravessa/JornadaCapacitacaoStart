/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 05---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E1. Fazer um programa que dados um número de 1 até 7, apresente o nome do 
 dia da semana correspondente. Considere 1 como “Domingo”.
|--------------------------------------------------------------------------|*/

#include "TOTVS.CH"

User Function JsL5e1

Local aSemana := {Domingo, Segunda, Terca, Quarta, Quinta, Sexta, Sabado}
Local nSemana := 0

nSemana := Val(FwInputBox("Insira um numero de 1 a 7: "))

FwAlertInfo("O dia da semana correspondente a esse numero e:" + aSemana[nSemana], "Dia da Semana")
Return
