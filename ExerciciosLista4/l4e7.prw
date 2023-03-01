/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E7: Fazer um programa que simule um cadastro de usu�rio e senha para um  
 sistema qualquer. O usu�rio informar� um �username� e uma senha que dever�
 ser digitada duas vezes (confirma��o de senha). Realizar as seguintes 
 consist�ncias:
 o O �username� deve possuir mais do que 5 caracteres.
 o A senha e a confirma��o da senha devem ser id�nticas.
 o A senha deve possuir ao menos 6 caracteres e deve conter obrigatoriamente:
 ? Ao menos uma letra mai�scula, um d�gito num�rico e um s�mbolo.
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL4e7()
        
//Declara��o e Atribui��o de vari�veis                      
    Local oJnla 	:= Nil
    Local cTitulo 	:= "Tela de Login"
    Local cTexto  	:= "Digite um nome de usu�rio com ao menos 6 caracteres: "
    Local cTexto2 	:= "Digite uma senha de acesso com m�nimo de 6 caracteres: "
    Local cTexto3 	:= "Repita a senha digitada: "
    Local cUserName := Space(10), cPassWord := Space(10), cCheck := Space(10)
    Local nLinFim	:= 200, nColFim := 450
    Local nOpcao  	:= 0

//Solicita as informa��es
	DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    	@ 011, 010 SAY cTexto SIZE 100,050 of oJnla PIXEL    
    	@ 031, 010 SAY cTexto2 SIZE 100,050 of oJnla PIXEL
    	@ 051, 010 SAY cTexto3 SIZE 100,050 of oJnla PIXEL
    	@ 010, 150 MSGET cUserName SIZE 050, 010 OF oJnla PIXEL
    	@ 030, 150 MSGET cPassWord SIZE 050, 010 OF oJnla PIXEL PASSWORD 
    	@ 050, 150 MSGET cCheck    SIZE 050, 010 OF oJnla PIXEL PASSWORD 
    	@ 080, 010 BUTTON "Entrar" SIZE 50, 012 OF oJnla PIXEL ACTION Acesso(cUserName,cPassWord,cCheck)
    	@ 080, 150 BUTTON "Sair" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function Acesso(cUserName,cPassWord,cCheck)

	Local lRetorno := Valida(cPassWord)

	Do Case
    	Case Empty(cUserName) .or. Len(cUsername) <= 5
			FwAlertError("Campo obrigat�rio, favor inserir um usu�rio v�lido!")
		Case Empty(cPassWord) .and. Empty(cCheck) 
			FwAlertError("Campo obrigat�rio! Digite uma senha com ao menos 6 caracteres, uma letra mai�scula, um d�gito num�rico e um s�mbolo!")
		Case cPassWord <> cCheck .and. Len(cPassWord) < 6 .and. lRetorno == .F.
			FwAlertError("Digite uma senha com ao menos 6 caracteres, uma letra mai�scula, um d�gito num�rico e um s�mbolo:")
		Otherwise
			FwAlertSuccess("Cadastro Realizado com sucesso!")
	EndCase

Return
  
Static Function Valida(cPassWord)

	Local nCaracter  := len(cPassWord)
	Local lMaiuscula := .F.
	Local lDigito  := .F.
	Local lSimbolo := .F.
	Local nI := 1
	Local cCaracter := Substr(cPassWord, nI, 1)
	Local lRetorno := .F.
	
	For nI := 1 to nCaracter
		If IsUpper(cCaracter) .and. Isalpha(cCaracter)
			lMaiuscula := .T.
		Endif
		If IsDigit(cCaracter)
			lDigito := .T.
		EndIf //.not. Isalnum(cCaracter)
		If Asc(cCaracter) >= 33 .and. Asc(cCaracter) <= 47 .or. Asc(cCaracter) >=58 .and. Asc(cCaracter) <=64 .or.;
		Asc(cCaracter) >= 91 .and. Asc(cCaracter) <= 96 .or. Asc(cCaracter) >= 123 .and. Asc(cCaracter) <= 126
			lSimbolo := .T.
		EndIf
	Next
		If lDigito == .T. .and. lMaiuscula == .T. .and. lSimbolo == .T.
		lRetorno := .T.
		EndIf
	
	Return lRetorno
