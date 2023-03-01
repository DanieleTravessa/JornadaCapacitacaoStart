/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E6 Fa�a um algoritmo para ler um nome de usu�rio (user name) e uma senha. 
 Caso correspondam aos dados armazenados internamente no programa atrav�s do
 uso de constantes (hard coded), deve ser apresentada a mensagem �Acesso 
 permitido�. Caso o usu�rio/senha n�o coincidam, exibir a mensagem �Usu�rio
 ou senha inv�lido�. A verifica��o da senha s� dever� ocorrer caso o usu�rio
 coincida, por�m o usu�rio n�o deve saber especificamente se foi o nome de 
 su�rio ou a senha que n�o coincidiu.          |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"
#DEFINE cUser  "Daniele"
#DEFINE cPword "l4e6"

User Function JsL4e6()

//Declara��o e Atribui��o de vari�veis                      
    Local oJnla := Nil
    Local cTitulo := "Tela de Login"
    Local cTexto := "Digite o nome de usu�rio: "
    Local cTexto2 := "Digite a senha de acesso: "
    Local cUserName := Space(10), cPassWord := Space(10)
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0

//Solicita as informa��es   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 090,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 090,010 of oJnla PIXEL
    @ 010, 095 MSGET  cUserName SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET  cPassWord SIZE 050, 010 OF oJnla PIXEL PASSWORD 
    @ 050, 010 BUTTON "Entrar" SIZE 50, 012 OF oJnla PIXEL ACTION Acesso(cUserName,cPassWord)
    @ 050, 095 BUTTON "Sair" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function Acesso(cUserName,cPassWord)

    cPassWord := Alltrim(cPassWord)
    cUserName := Alltrim(cUserName)

	If cUserName == cUser .and. cPassWord == cPword
    	FwAlertSuccess('Acesso permitido!')
    Else
        FwAlertError('Usu�rio ou Senha inv�lido!')
    EndIf

Return
