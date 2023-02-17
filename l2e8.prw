/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
 |--------------------------------------------------------------------------|
 |Player: Daniele Travessa Brito                           GM: Muriel Zounar|
 |--------------------------------------------------------------------------|
 |--------------------------------------------------------------------------|
|  E8 - Faça um algoritmo para ler um nome de usuário (user name) e uma senha. Caso correspondam aos dados armazenados internamente no programa através do uso de constantes (“chumbado” / hard coded), deve ser apresentada a mensagem “Acesso permitido”. Caso o usuário/senha não coincidam, exibir a mensagem “Usuário ou senha inválido”. A verificação da senha só deverá ocorrer caso o usuário coincida, porém o usuário não deve saber especificamente se foi o nome de usuário ou a senha que não coincidiu.. |
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
