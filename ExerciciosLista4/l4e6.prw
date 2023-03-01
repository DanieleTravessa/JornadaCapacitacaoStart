/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E6 Faça um algoritmo para ler um nome de usuário (user name) e uma senha. 
 Caso correspondam aos dados armazenados internamente no programa através do
 uso de constantes (hard coded), deve ser apresentada a mensagem “Acesso 
 permitido”. Caso o usuário/senha não coincidam, exibir a mensagem “Usuário
 ou senha inválido”. A verificação da senha só deverá ocorrer caso o usuário
 coincida, porém o usuário não deve saber especificamente se foi o nome de 
 suário ou a senha que não coincidiu.          |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"
#DEFINE cUser  "Daniele"
#DEFINE cPword "l4e6"

User Function JsL4e6()

//Declaração e Atribuição de variáveis                      
    Local oJnla := Nil
    Local cTitulo := "Tela de Login"
    Local cTexto := "Digite o nome de usuário: "
    Local cTexto2 := "Digite a senha de acesso: "
    Local cUserName := Space(10), cPassWord := Space(10)
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0

//Solicita as informações   
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
        FwAlertError('Usuário ou Senha inválido!')
    EndIf

Return
