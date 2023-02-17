/*/               |------Jornada de Capacita��o - Start--------|
                  |--------Exerc�cios ADVPL - Lista 01---------|
|----------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                             GM: Muriel Zounar|
|----------------------------------------------------------------------------|
|----------------------------------------------------------------------------|
|E13 - Elaborar um programa que exiba na tela automaticamente todos os       |
|m�ltiplos de um determinado n�mero informado pelo usu�rio, existentes entre |
|1 e um limite, que tamb�m dever� ser informado pelo usu�rio. Fa�a com apenas|
|uma estrutura de repeti��o (For / While), antes de desenvolver, analise qual|
|ser� a melhor op��o.                                                        |
|----------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e13()

    Private nNumero := 0, nMultiplo := 0, nLimite := 0, nOpt := 0

    nLimite := Val(FwInputBox("Informe o valor limite: "))
    nMultiplo := Val(FwInputBox("Informe o fator de multiplicacao desejado: "))
    
    nOpt := Aviso("Sorteio de N�meros", "Escolha uma op��o de sorteio", {"**FOR**", "**WHILE**"}, 1,,,,,)

    If nOpt == 1
        u_For()
    
    ELSEIF nOpt == 2
        u_While()    
    EndIf
        
Return
    
Static Function u_While()
    Local nNumero := 0, cMsg := ""

    WHILE nNumero <= nLimite ///*No la�o finito, a estrutura e a variavel com contador se iniciam simultaneamente.
        IF Mod(nNumero,nMultiplo) == 0
            cMsg += cValToChar(nNumero) + " , "  //MsgInfo(Str(nNumero))         //O programa exibe o valor contido na vari�vel
        ENDIF
    ENDDO
    FwAlertInfo(cMsg,"Esses s�o os m�ltiplos de " + AllTrim(Str(nMulti)) + " at� " +AllTrim(Str(nLimite)))

RETURN


Static Function u_For(nLimite, nMultiplo)       
    Local nNumero := 0, cMsg := ""

    FOR nNumero := 1 to nLimite 
        IF Mod(nNumero,nMultiplo) == 0
            cMsg += cValToChar(nNumero) + " , "
        ENDIF
    NEXT
    FwAlertInfo(cMsg,"Esses s�o os m�ltiplos de " + AllTrim(Str(nMulti)) + " at� " +AllTrim(Str(nLimite)))      
RETURN
 
