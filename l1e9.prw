/*                |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E9 - Ler um valor e escrever se � positivo, negativo ou zero              |
|--------------------------------------------------------------------------|
*/

#INCLUDE "TOTVS.CH"

User Function SinalNum()

Local nNumero := 0
Local cNumero := ""

//Insira um numero
cNumero := FwInputBox("Insira um n�mero: ", cNumero)
nNumero := Val(cNumero)

//Checagem do valor usando as condi��es dadas
    If nNumero > 0
        FwAlertSuccess("O n�mero " + cNumero + " informado � positivo!", "Positivo")
    Elseif nNumero = 0
        FwAlertInfo("O n�mero informado � zero", "Neutro")
    Else
        FwAlertError("O n�mero "+ cNumero + " informado � negativo", "Negativo") 
    Endif
RETURN
