/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
 |--------------------------------------------------------------------------|
 |Player: Daniele Travessa Brito                           GM: Muriel Zounar|
 |--------------------------------------------------------------------------|
 |--------------------------------------------------------------------------|
|  E8 - A jornada de trabalho semanal de um funcion�rio � de 40 horas. O     |
|funcion�rio que trabalhar mais de 40 horas receber� hora extra, cujo c�lculo|
|� o valor da hora regular com um acr�scimo de 50%. Escreva um algoritmo que |
|leia o n�mero de horas trabalhadas em um m�s, o sal�rio por hora e escreva o|
|sal�rio total do funcion�rio, que dever� ser acrescido das horas extras,    |
|caso tenham sido trabalhadas (considere que o m�s possua 4 semanas exatas). |
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

// Solicitar o n�mero de horas trabalhadas, e o sal�rio por hora
    cHrTrab := FwInputBox("Informe o n�mero de horas trabalhadas: ", cHrTrab)
    cSalHora := FwInputBox("Informe o sal�rio por hora: ", cSalHora)

    nHrTrab := Val(cHrTrab)
    nSalHora := Val(cSalHora)

// Checagem de condi��o para verificar se existem horas extras
   If nHrTrab > 40 
      nHExtra := nHrTrab - 40
      nSalTot := (40 * nSalHora) + (nHExtra * nSalHora * 1.5)
   Else
      nSalTot := nHrTrab * nSalHora
   EndIf

// Mostrar o sal�rio total
   FwAlertInfo("O sal�rio total de "+ cHrTrab + " horas trabalhadas �: " + "R$" + AllTrim(Str(nSalTot,10,2)),"Sal�rio Total") 

Return
