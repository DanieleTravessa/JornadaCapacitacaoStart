/*/               |------Jornada de Capacitação - Start--------|
                  |--------Exercícios ADVPL - Lista 01---------|
|----------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                             GM: Muriel Zounar|
|----------------------------------------------------------------------------|
|----------------------------------------------------------------------------|
|E13 - Elaborar um programa que exiba na tela automaticamente todos os       |
|múltiplos de um determinado número informado pelo usuário, existentes entre |
|1 e um limite, que também deverá ser informado pelo usuário. Faça com apenas|
|uma estrutura de repetição (For / While), antes de desenvolver, analise qual|
|será a melhor opção.                                                        |
|----------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e13()

    Private nNumero := 0, nMultiplo := 0, nLimite := 0, nOpt := 0

    nLimite := Val(FwInputBox("Informe o valor limite: "))
    nMultiplo := Val(FwInputBox("Informe o fator de multiplicacao desejado: "))
    
    nOpt := Aviso("Sorteio de Números", "Escolha uma opção de sorteio", {"**FOR**", "**WHILE**"}, 1,,,,,)

    If nOpt == 1
        u_For()
    
    ELSEIF nOpt == 2
        u_While()    
    EndIf
        
Return
    
Static Function u_While()
    Local nNumero := 0, cMsg := ""

    WHILE nNumero <= nLimite ///*No laço finito, a estrutura e a variavel com contador se iniciam simultaneamente.
        IF Mod(nNumero,nMultiplo) == 0
            cMsg += cValToChar(nNumero) + " , "  //MsgInfo(Str(nNumero))         //O programa exibe o valor contido na variável
        ENDIF
    ENDDO
    FwAlertInfo(cMsg,"Esses são os múltiplos de " + AllTrim(Str(nMulti)) + " até " +AllTrim(Str(nLimite)))

RETURN


Static Function u_For(nLimite, nMultiplo)       
    Local nNumero := 0, cMsg := ""

    FOR nNumero := 1 to nLimite 
        IF Mod(nNumero,nMultiplo) == 0
            cMsg += cValToChar(nNumero) + " , "
        ENDIF
    NEXT
    FwAlertInfo(cMsg,"Esses são os múltiplos de " + AllTrim(Str(nMulti)) + " até " +AllTrim(Str(nLimite)))      
RETURN
 
