/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
 |--------------------------------------------------------------------------|
 |Player: Daniele Travessa Brito                           GM: Muriel Zounar|
 |--------------------------------------------------------------------------|
 |--------------------------------------------------------------------------|
|  E8 - Fa�a um algoritmo para ler um nome de usu�rio (user name) e uma senha. Caso correspondam aos dados armazenados internamente no programa atrav�s do uso de constantes (�chumbado� / hard coded), deve ser apresentada a mensagem �Acesso permitido�. Caso o usu�rio/senha n�o coincidam, exibir a mensagem �Usu�rio ou senha inv�lido�. A verifica��o da senha s� dever� ocorrer caso o usu�rio coincida, por�m o usu�rio n�o deve saber especificamente se foi o nome de usu�rio ou a senha que n�o coincidiu.. |
|----------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

#define CHAVE "StartTOTVS2e"
#define NOME "Daniele"

User Function JsL2e8()

   Local cChave, cNome // Palavra chave

   //MsgInfo"--------------------------------------"
   cNome := FwInputBox("Qual o nome do usuario  : ")
   cChave := FwInputBox("Informe a palavra chave : ")

   /*?"--------------------------------------"*/
   
   IF ( cChave == CHAVE ) .and. (cNome == NOME)
      FwAlertSuccess("    ****Acesso concedido****")
   ELSE
      FwAlertError("! Seu acesso foi negado. Usuario ou senha invalidos!", CNome)
   ENDIF

Return
