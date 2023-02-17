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
|Ao menos uma letra mai�scula, um d�gito num�rico e um s�mbolo. Escreva um |
|algoritmo para ler as notas da 1a e 2a avalia��es de um aluno, calcule e  |
|imprima a m�dia desse aluno. S� devem ser aceitos valores v�lidos durante |
|a leitura (0 a 10) para cada nota.                       |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e16()

	LOCAL cNome := "", cConf := "", lSair := .f., lRet := .f. , cSenha :=""

	WHILE lSair 
	cNome := FwInputBox("Digite o userName (no minimo 5 caracteres): ")
		IF (Len(cNome) <= 5) 
			FwAlertError("Nome de usuario incorreto, tente novamente")
			LOOP 
		ELSE 
		lSair := .t. 
		ENDIF 
	END 

	lSair := .f. 

	While !lSair 
	cSenha := FwInputBox("Digite uma senha: ")
		IF (Len(cSenha) >= 6) 
			IF (lRet := verifica(cSenha)) == .f. 
			FwAlertError("Formato incorreto, verifique se a senha possi 1 letra maiuscula, 1 digito e 1 simbolo")
			Loop
			EndIf
		Else
			FwAlertError("Formato incorreto, verifique se a senha possi mais de 6 caracteres")
			Loop 
		EndIf 
	
	cConf := Val(FwInputBox("Digite a senha novamente: "))
	
	If (cConf == cSenha) 
		FwAlertSuccess("***Usuario cadastrado com sucesso***")
			lSair := .t. 
		ELSE 
		FwAlertError("Senhas diferentes, favor tentar novamente")
			Loop 
		EndIf
	EndDo
RETURN 
		
	
	Static Function verifica(cSenha) 
		
		Local lRetorno := .f., nCont := 0, aPossui :={"", "", ""} 
		
		For nCont := 1 to Len(cSenha) 
			IF Asc(SubStr(cSenha, nCont, 1)) >= 48 .and. asc(SubStr(cSenha, nCont, 1)) <= 57 
			aPossui[1] := "ok" 
			ENDIF 
			IF Asc(SubStr(cSenha, nCont, 1)) >= 65 .and. asc(SubStr(cSenha, nCont, 1)) <= 90 
			aPossui[2] := "ok" 
			ENDIF 
			IF (Asc(SubStr(cSenha, nCont, 1)) >= 33 .and. asc(SubStr(cSenha, nCont, 1)) <= 47) .or.(asc(SubStr(cSenha, nCont, 1)) >=58 .and. asc(SubStr(cSenha, nCont, 1)) <=64) .or. (asc(SubStr(cSenha, nCont, 1)) >= 91 .and. asc(SubStr(cSenha, nCont, 1)) <= 96) .or. (asc(SubStr(cSenha, nCont, 1)) >= 123 .and. asc(SubStr(cSenha, nCont, 1)) <= 126) 
			aPossui[3] := "ok" 
			ENDIF 
		NEXT 
			IF aPossui[1] =="ok" .and. aPossui[2] == "ok" .and. aPossui[3] == "ok" 
			lRetorno := .t. 
			ENDIF
	RETURN lRetorno
