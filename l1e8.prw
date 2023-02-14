/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
 |--------------------------------------------------------------------------|
 |Player: Daniele Travessa Brito                           GM: Muriel Zounar|
 |--------------------------------------------------------------------------|
 |--------------------------------------------------------------------------|
|  E8 - A jornada de trabalho semanal de um funcionário é de 40 horas. O     |
|funcionário que trabalhar mais de 40 horas receberá hora extra, cujo cálculo|
|é o valor da hora regular com um acréscimo de 50%. Escreva um algoritmo que |
|leia o número de horas trabalhadas em um mês, o salário por hora e escreva o|
|salário total do funcionário, que deverá ser acrescido das horas extras,    |
|caso tenham sido trabalhadas (considere que o mês possua 4 semanas exatas). |
|----------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function SalTotal()

    Local cHrTrab  :=""
    Local nHrTrab  := 0
    Local cSalHora := ""
    Local nSalHora := 0
    Local nSalTot  := 0
    Local nHExtra  := 0

// Solicitar o número de horas trabalhadas, e o salário por hora
    cHrTrab := FwInputBox("Informe o número de horas trabalhadas: ", cHrTrab)
    cSalHora := FwInputBox("Informe o salário por hora: ", cSalHora)

    nHrTrab := Val(cHrTrab)
    nSalHora := Val(cSalHora)

// Checagem de condição para verificar se existem horas extras
   If nHrTrab > 40 
      nHExtra := nHrTrab - 40
      nSalTot := (40 * nSalHora) + (nHExtra * nSalHora * 1.5)
   Else
      nSalTot := nHrTrab * nSalHora
   EndIf

// Mostrar o salário total
   FwAlertInfo("O salário total de "+ cHrTrab + " horas trabalhadas é: " + "R$" + AllTrim(Str(nSalTot,10,2)),"Salário Total") 

Return
