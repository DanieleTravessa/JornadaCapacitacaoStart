#INCLUDE "TOTVS.CH"

User Function JsL4e9()
    
//Declaração e Atribuição de variáveis                      
    Local oJnla := Nil
    Local cTitulo := "Calcula TMB"
    Local cTexto := "Digite o peso em kg: "
    Local cTexto2 := "Digite a altura em cm: "
    Local cTexto3 := "Informe a idade: "
    Local nPeso := Space(10), nAltura := Space(5), nIdade := Space(5)
    Local nLinFim := 200, nColFim := 450
    Local nOpcao := 0

//Solicita as informações   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 60,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 60,010 of oJnla PIXEL
    @ 051, 010 SAY cTexto3 SIZE 60,010 of oJnla PIXEL
    @ 010, 095 MSGET  nPeso SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET  nAltura SIZE 050, 010 OF oJnla PIXEL
    @ 050, 095 MSGET  nIdade  SIZE 050, 010 OF oJnla PIXEL
    @ 070, 005 BUTTON "Mulher" SIZE 50, 11 OF oJnla PIXEL ACTION TmbM(nPeso, nAltura, nIdade)
    @ 070, 060 BUTTON "Homem"  SIZE 50, 11 OF oJnla PIXEL ACTION TmbH(nPeso, nAltura, nIdade)
    @ 070, 120 BUTTON "Sair" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function TmbM(nPeso, nAltura, nIdade)
    
    Local nTmb := 0

    nTmb := 655.1+(9.563*VAL(nPeso))+(1.850*VAL(nAltura))-(4.676*VAL(nIdade))
    FwAlertInfo("Sua Taxa Metabólica Basal é: "+ ALLTRIM(STR(nTmb)) + " Calorias/Dia","Taxa Metabólica Basal")

Return

Static Function TmbH(nPeso, nAltura, nIdade)

    Local nTmb := 0

    nTmb := 66.5 + (13.75 * VAL(nPeso)) + (5.003 * VAL(nAltura)) - (6.75 * VAL(nIdade))
    FwAlertInfo("Sua Taxa Metabólica Basal é: "+ ALLTRIM(STR(nTmb)) + " Cal/Dia","Taxa Metabólica Basal")

Return
