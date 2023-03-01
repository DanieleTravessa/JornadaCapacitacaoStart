#INCLUDE "TOTVS.CH"

User Function JsL4e8()
        
//Declaração e Atribuição de variáveis                      
    Local oJnla := Nil
    Local cTitulo := "Calcula IMC"
    Local cTexto := "Digite o peso em kg: "
    Local cTexto2 := "Digite a altura em metros: "
    Local nPeso := Space(10), nAltura := Space(10)
    Local nLinFim := 200, nColFim := 450
    Local nOpcao := 0

//Solicita as informações   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 90,020 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 90,020 of oJnla PIXEL
    @ 010, 095 MSGET nPeso SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET nAltura SIZE 050, 010 OF oJnla PIXEL
    @ 050, 010 BUTTON "Calcular" SIZE 50, 012 OF oJnla PIXEL ACTION CalcIMC(nPeso,nAltura)
    @ 050, 095 BUTTON "Sair" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function CalcIMC(nPeso,nAltura)

    Local nImc := 0

    nAltura:= Val(nAltura)
    nPeso := Val(nPeso)

    nImc := nPeso/(nAltura^2)

    Do Case
    Case nImc < 18.5
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF +"Classificação: Magreza")
    Case nImc >= 18.5 .and. nImc <= 24.9
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF +"Classificação: Saudável")
    Case nImc >= 25.0 .and. nImc <= 29.9
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF +"Classificação: Sobrepeso")
    Case nImc >= 30.0 .and. nImc <= 39.9
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF +"Classificação: Obesidade Severa - Grau II")
    OtherWise
        FwAlertInfo("Seu IMC é: "+ STR(nImc, 6, 2) + CRLF +"Classificação: Obesidade Mórbida - Grau III")
    EndCase

Return
