/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.  |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function Antecessor()

    Local cValor
    Local nNumero     
    Local nAntecessor 

//Solicita o valor ao usu�rio
    cValor := FwInputBox("Informe um n�mero:", cValor)
    nNumero := VAL(cValor)
    nAntecessor := (nNumero - 1)

//Mostra nAntecessor
    MsgAlert(nAntecessor, "O antecessor do n�mero inserido �:")

RETURN
