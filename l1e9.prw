/*                |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E9 - Ler um valor e escrever se é positivo, negativo ou zero              |
|--------------------------------------------------------------------------|
*/

#INCLUDE "TOTVS.CH"

User Function SinalNum()

Local nNumero := 0
Local cNumero := ""

//Insira um numero
cNumero := FwInputBox("Insira um número: ", cNumero)
nNumero := Val(cNumero)

//Checagem do valor usando as condições dadas
    If nNumero > 0
        FwAlertSuccess("O número " + cNumero + " informado é positivo!", "Positivo")
    Elseif nNumero = 0
        FwAlertInfo("O número informado é zero", "Neutro")
    Else
        FwAlertError("O número "+ cNumero + " informado é negativo", "Negativo") 
    Endif
RETURN
