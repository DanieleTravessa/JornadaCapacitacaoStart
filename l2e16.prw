/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.16 -16 - Fazer um programa que simule um cadastro de usuário e senha para um sistema qualquer.
O usuário informará um “username” e uma senha que deverá ser digitada duas vezes (confirmação de senha).
Realizar as seguintes consistências:
o O “username” deve possuir mais do que 5 caracteres.
o A senha e a confirmação da senha devem ser idênticas.
o A senha deve possuir ao menos 6 caracteres e deve conter obrigatoriamente:
? Ao menos uma letra maiúscula, um dígito numérico e um símbolo. Escreva um algoritmo para ler as notas da 1a e 2a avaliações de um|
|aluno, calcule e imprima a média desse aluno. Só devem ser aceitos valores|
| válidos durante a leitura (0 a 10) para cada nota.                       |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e16()

Local cEntrada     := ""
Local nSoma        := 0
Local nResultado :=0
Local nCont := 1
Local cTitulo := "Programa calcula media de um aluno"

//Insira um numero
For nCont := 1 to 2
cEntrada := '1'
while Val(cEntrada < 0 .or. val(cEntrada)) > 10
cEntrada :=''
cEntrada := FwInputBox('Informe a nota do alino', cEntrada)
ENDDO
nSoma += Val(cEntrada)
next

nresultado := nSoma / 2
fwalertinfo('A media do aluno: ' + cvaltochar(nResultado), ctitulo)

RETURN

/*65.Fazer um programa que simule um cadastro de usuário e senha para
um sistema qualquer. O usuário informará um “username” e uma
senha que deverá ser digitada duas vezes (confirmação de senha).
Realizar as seguintes consistências:
a. o “username” deve possuir mais do que 5 caracteres. b. a senha
e a confirmação da senha devem ser idênticas. c. a senha deve
possuir ao menos 6 caracteres e deve conter
obrigatoriamente: ao menos uma letra maiúscula, um dígito
numérico e um símbolo.*/
/***Fiz com Ajuda!!!***/

Function Main() 

	LOCAL cNome := "", cSenha := "", cConf := "", lSair := .f., lRet := .f. 

	WHILE lSair 
	ACCEPT "Digite o userName (no minimo 5 caracteres): " TO cNome 
		IF (len(cNome) <= 5) 
			?"Nome de usuario incorreto, tente novamente" 
			LOOP 
		ELSE 
		lSair := .t. 
		ENDIF 
	END 

	lSair := .f. 

	WHILE !lSair 
	ACCEPT "Digite uma senha: " TO cSenha 
		IF (len(cSenha) >= 6) 
			IF (lRet := verifica(cSenha)) == .f. 
			?"Formato incorreto, verifique se a senha possi 1 letra maiuscula, 1 digito e 1 simbolo"
			LOOP
			ENDIF
		ELSE
			?"Formato incorreta, verifique se a senha possi mais de 6 caracteres"
			Loop 
		ENDIF 
	
	ACCEPT "Digite a senha novamente: " to cConf 
		IF (cConf == cSenha) 
			?"***Usuario cadastrado com sucesso***"
			?""
			lSair := .t. 
		ELSE 
			?"Senhas diferentes, favor tentar novamente"
			?""
			LOOP 
		ENDIF 
	ENDDO
RETURN Nil 
		
	
	static Function verifica(cSenha) 
		
		Local lRetorno := .f., nCont := 0, aPossui :={"", "", ""} 
		
		FOR nCont := 1 to len(cSenha) 
			IF asc(SubStr(cSenha, nCont, 1)) >= 48 .and. asc(SubStr(cSenha, nCont, 1)) <= 57 
			aPossui[1] := "ok" 
			ENDIF 
			IF asc(SubStr(cSenha, nCont, 1)) >= 65 .and. asc(SubStr(cSenha, nCont, 1)) <= 90 
			aPossui[2] := "ok" 
			ENDIF 
			IF (asc(SubStr(cSenha, nCont, 1)) >= 33 .and. asc(SubStr(cSenha, nCont, 1)) <= 47) .or.(asc(SubStr(cSenha, nCont, 1)) >=58 .and. asc(SubStr(cSenha, nCont, 1)) <=64) .or. (asc(SubStr(cSenha, nCont, 1)) >= 91 .and. asc(SubStr(cSenha, nCont, 1)) <= 96) .or. (asc(SubStr(cSenha, nCont, 1)) >= 123 .and. asc(SubStr(cSenha, nCont, 1)) <= 126) 
			aPossui[3] := "ok" 
			ENDIF 
		NEXT 
			IF aPossui[1] =="ok" .and. aPossui[2] == "ok" .and. aPossui[3] == "ok" 
			lRetorno := .t. 
			ENDIF
			RETURN lRetorno
