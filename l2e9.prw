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

    Local nM := 0, a30 := {4, 6, 9, 11}

    nM := Val(FwInputBox("Informe o numero do mes correspondente : "))

    Do CASE
    //Case nM := 4 .or. nM = 6 .or. nM = 9 .or. nM = 11
    Case Ascan(a30,nM) > 0
        MsgInfo("O mes tem 30 dias!")
    CASE nM = 2
        MsgInfo("O mes tem 28 dias!") 
    OTHERWISE
        MsgInfo("O mes tem 31 dias!")
    ENDCASE

RETURN NIL

//CASE nM = 1 .or. nM = 3 .or. nM = 5 .or. nM = 7 .or. nM = 8 .or. nM = 10 .or. nM = 12 
