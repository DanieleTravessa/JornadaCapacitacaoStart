/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E3- Fa�a um algoritmo que leia a idade de uma pessoa expressa em anos,    |
| meses e dias e escreva a idade dessa pessoa expressa apenas em dias.     |
|              Considerar ano com 365 dias e m�s com 30 dias               |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function IdadeDias()

	Local dData   := Date()
	Local cNascim  := ""
	//Local nIdadeDias := 0
    Local nIdade := 0
    Local dDataNasc

//Insira sua data de nascimento
	cNascim := FwInputBox("Insira sua data de nascimento: ", cNascim)
	dDataNasc := STOD( cNascim )
    
    nIdade := DateDiffDay(dData, dDataNasc)

//Mostre nIdadeDias
	MSGINFO( nIdade, "Sua idade em dias �: " )

RETURN
