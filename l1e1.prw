/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
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

//Solicita o valor ao usuário
    cValor := FwInputBox("Informe um número:", cValor)
    nNumero := VAL(cValor)
    nAntecessor := (nNumero - 1)

//Mostra nAntecessor
    MsgAlert(nAntecessor, "O antecessor do número inserido é:")

RETURN
