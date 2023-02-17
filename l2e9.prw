/*                |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E9- Dado um n�mero de 1 at� 12, apresentar o n�mero de dias do m�s 
|correspondente. Se o n�mero escolhido for 2 (fevereiro), considere 28 dias|
|Dica: O uso de Array pode simplificar as coisas, mas n�o � obrigat�rio.?? |
|--------------------------------------------------------------------------|
*/

#INCLUDE "TOTVS.CH"

User Function JsL2e9()

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

FUNCTION MAIN()
//Dado um n�mero de 1 at� 12, apresentar o n�mero de dias do m�s correspondente. 
//Se o n�mero escolhido for 2 (fevereiro), considere 28 dias.

Local nM := 0

ACCEPT "Informe o numero do mes correspondente : " TO nM

nM := val(nM)

Do CASE
Case nM = 4 .or. nM = 6 .or. nM = 9 .or. nM = 11
QOut ("O mes tem 30 dias!")
?""
CASE nM = 2
QOUT ("O mes tem 28 dias!") 
?""
OTHERWISE
QOUT ("O mes tem 31 dias!")
?""
ENDCASE

RETURN NIL

//CASE nM = 1 .or. nM = 3 .or. nM = 5 .or. nM = 7 .or. nM = 8 .or. nM = 10 .or. nM = 12 
