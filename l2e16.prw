/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E16- Fazer um programa que simule um cadastro de usu�rio e senha para um  |
|sistema qualquer. O usu�rio informar� um �username� e uma senha que dever�|
|ser digitada duas vezes (confirma��o de senha). Realizar as seguintes     |
|consist�ncias:                                                            |
|o O �username� deve possuir mais do que 5 caracteres.                     |
|o A senha e a confirma��o da senha devem ser id�nticas.                   |
|oA senha deve possuir ao menos 6 caracteres e deve conter obrigatoriamente|
|Ao menos uma letra mai�scula, um d�gito num�rico e um s�mbolo.            |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e16()
	Local cNome := ""
	Local cSaenha := ""
	Local cSenhaConf := ""
	Local lRetorno := .f.

	Do while empty(cNome) .or. len(cNome) <= 5
		cNome := FwInputBox("Digite um username com mais do que 5 caracteres:      ")
	Enddo

	Do while empty(cSaenha) .or. empty(cSenhaConf) .or. cSaenha <> cSenhaConf .or. len(cSaenha) < 6 .or. lRetorno := Valida(cSaenha) == .F.
		cSaenha := FwInputBox("Digite uma senha com ao menos 6 caracteres, contendo pelo menos uma letra mai�scula, um d�gito num�rico e um s�mbolo:      ")
		cSenhaConf := FwInputBox("Digite a confirma��o da senha:      ")
	Enddo

	FwAlertSuccess("Cadastro Realizado com sucesso!")

Return

Static Function Valida(cSaenha)

	Local nCaracter := len(cSaenha)
	Local bMaiuscula := .F.
	Local bDigito := .F.
	Local bSimbolo := .F.
	Local nI := 1
	Local cCaracter := Substr(cSaenha, nI, 1)
	
	Do While nI <= nCaracter
		If Upper(cCaracter) = cCaracter .and. Isalpha(cCaracter)
			bMaiuscula := .T.
		Endif
		If IsDigit(cCaracter)
			bDigito := .T.
		EndIf //.not. Isalnum(cCaracter)
		If Asc(cCaracter) >= 33 .and. Asc(cCaracter) <= 47 .or. Asc(cCaracter) >=58 .and. Asc(cCaracter) <=64 .or.;
		Asc(cCaracter) >= 91 .and. Asc(cCaracter) <= 96 .or. Asc(cCaracter) >= 123 .and. Asc(cCaracter) <= 126
			bSimbolo := .T.
		EndIf
	EndDo
		If bDigito == .T. .and. bMaiuscula == .T. .and. bSimbolo == .T.
		lRetorno := .T.
		EndIf
	
	Return lRetorno
