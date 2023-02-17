/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.12 - 12 - Elaborar um programa que exiba na tela automaticamente todos os m�ltiplos de 3 existentes entre 1 e 100.|
|cada time). Escrever o nome do vencedor. Caso n�o haja vencedor dever� ser|
|impressa a palavra EMPATE.                                                |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e12()

Local cTime1 := "" // nome do primeiro time
Local cTime2 := "" // nome do segundo time
Local cGolsT1 := ""
Local nGolsT1 := 0 // n�mero de gols marcados pelo primeiro time
Local cGolsT2 := ""
Local nGolsT2 := 0 // n�mero de gols marcados pelo segundo time

// ler os valores do usu�rio
    cTime1 := FwInputBox("Digite o nome do primeiro time: ", cTime1)
    cGolsT1 := FwInputBox("Digite o n�mero de gols marcados pelo"+cTime1, cGolsT1)
    cTime2 := FwInputBox("Digite o nome do segundo time: ", cTime2)
    cGolsT2 := FwInputBox("Digite o n�mero de gols marcados pelo"+cTime2, cGolsT1)

    nGolsT1 := Val(cGolsT1)
    nGolsT2 := Val(cGolsT2)

// determinar o vencedor ou se houve empate
    If nGolsT1 > nGolsT2
        FwAlertSuccess("O vencedor � o time " + cTime1, "Campe�o!!!")
    Elseif nGolsT2 > nGolsT1
        FwAlertSuccess("O vencedor � o time " + cTime2, "Campe�o!!!")
    Else
        FwAlertInfo("Dessa vez ficou tudo igual!", "EMPATE")
    EndIf 
Return

/*55.Elaborar um programa que exiba na tela automaticamente todos os m�ltiplos de 3 existentes entre 1 e 100. 
Utilizar obrigatoriamente o la�o finito (para) para esta solu��o. 
==> Vers�o: la�o finito (para)*/

FUNCTION MAIN()

    Local nNumero := 1
        
    FOR nNumero:= 1 to 100 ///*No la�o finito, a estrutura e a variavel com contador se iniciam simultaneamente.
        IF nNumero%3=0
        ?nNumero          //O programa exibe o valor contido na vari�vel
        ENDIF
    NEXT
    ?"-> *** A Contagem chegou ao final! ***"
    ?""

RETURN NIL

