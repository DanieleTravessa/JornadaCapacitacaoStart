/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.10 - Efetuar a leitura de 5 valores inteiros e exibir na tela o menor e|
| o maior deles.                                                           |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e10()

//Efetuar a leitura de 5 valores inteiros e exibir na tela o menor e o maior deles. 
    Local nA:=0, nB:=0, nC:=0, nD:=0, nE:=0, nMabx:=0, nMabn:=0, nMcdn:=0, nMcdx:=0, nMex:=0, nMen:=0, nMax:=0, nMin:=0

    nA := Val(FwInputBox("Informe um numero: "))
    nB := Val(FwInputBox("Informe outro numero: "))
    nC := Val(FwInputBox("Informe mais um : "))
    nD := Val(FwInputBox("Informe um mumero mais: "))
    nE := Val(FwInputBox("Informe um ultimo numero: "))

    nMabx := MAX(nA, nB) //Busca o valor m�ximo entre nA e nB
    nMcdx := MAX(nC, nD) //Busca o valor m�ximo entre nC e nD
    nMax := MAX(nMabx, nMcdx) //Busca o valor m�ximo entre o m�ximo de nA e nB com o m�ximo de nC e nD
    nMex := MAX(nMax, nE) //Busca o valor m�ximo final
    nMabn := MIN(nA, nB) //Busca o valor m�nimo entre nA e nB
    nMcdn := MIN(nC, nD) //Busca o valor m�nimo entre nC e nD
    nMin := MIN(nMabn, nMcdn) //Busca o valor m�nimo entre o m�nimo entre nA e nB com o m�nimo de nC e nD
    nMen := MIN(nMin, nE) //Busca o valor m�nimo final

    FwAlertInfo(AllTrim(Str(nMex)),"O maior dos valores inseridos �:" )
    FwAlertInfo(AllTrim(Str(nMen)),"O menor dos valores inseridos �:")

Return
