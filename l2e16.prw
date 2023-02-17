/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.16 -16 - Fazer um programa que simule um cadastro de usu�rio e senha para um sistema qualquer.
O usu�rio informar� um �username� e uma senha que dever� ser digitada duas vezes (confirma��o de senha).
Realizar as seguintes consist�ncias:
o O �username� deve possuir mais do que 5 caracteres.
o A senha e a confirma��o da senha devem ser id�nticas.
o A senha deve possuir ao menos 6 caracteres e deve conter obrigatoriamente:
? Ao menos uma letra mai�scula, um d�gito num�rico e um s�mbolo. Escreva um algoritmo para ler as notas da 1a e 2a avalia��es de um|
|aluno, calcule e imprima a m�dia desse aluno. S� devem ser aceitos valores|
| v�lidos durante a leitura (0 a 10) para cada nota.                       |
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

/*65.Fazer um programa que simule um cadastro de usu�rio e senha para
um sistema qualquer. O usu�rio informar� um �username� e uma
senha que dever� ser digitada duas vezes (confirma��o de senha).
Realizar as seguintes consist�ncias:
a. o �username� deve possuir mais do que 5 caracteres. b. a senha
e a confirma��o da senha devem ser id�nticas. c. a senha deve
possuir ao menos 6 caracteres e deve conter
obrigatoriamente: ao menos uma letra mai�scula, um d�gito
num�rico e um s�mbolo.*/
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
