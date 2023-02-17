/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex12 - Elaborar um programa que exiba na tela automaticamente todos os    |
|múltiplos de 3 existentes entre 1 e 100.                                  |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e12()

    Local nNumero := 1, cMsg := ""
            
    FOR nNumero := 1 to 100 
        IF Mod(nNumero,3) == 0
            cMsg += cValToChar(nNumero) + " , " 
        ENDIF
    NEXT
        FwAlertInfo(cMsg, "Esses são os múltiplos de 3 existentes entre 1 e 100!")
    
Return
