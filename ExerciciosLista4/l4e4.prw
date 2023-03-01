/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
 4 Faça um programa que leia a largura e a altura de uma parede em metros, 
 calcule sua área e a quantidade de tinta necessária para pintá-la, sabendo
 que cada litro de tinta pinta uma área de 2 metros quadrados
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'

User Function JsL4e4()

    Local oJnla := Nil
    Local cTitulo := "Calculadora de Pintura"
    Local cTexto := "Largura da Parede em m²: "
    Local cTexto2 := "Altura da Parede em m²: "
    Local nLargura := Space(10), nAltura := Space(10)
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0

//Insere a Altura e a Largura da Parede
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 080,010 of oJnla PIXEL    
    @ 031, 010 SAY cTexto2 SIZE 080,010 of oJnla PIXEL
    @ 010, 095 MSGET  nLargura    SIZE 050, 010 OF oJnla PIXEL
    @ 030, 095 MSGET  nAltura    SIZE 050, 010 OF oJnla PIXEL  
    @ 050, 010 BUTTON "Calcular" SIZE 50, 012 OF oJnla PIXEL ACTION CalcTinta(nLargura,nAltura)
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function CalcTinta(nLargura, nAltura)

    Local nArea := 0, nTinta := 0

    nLargura := Val(nLargura)
    nAltura := Val(nAltura)

    nArea := nLargura*nAltura
    nTinta := nArea/2

    FwAlertInfo("Com uma parede de "+Alltrim(STR(nArea))+"m²"+CRLF+"Usaremos "+Alltrim(STR(nTinta))+" litros de tinta",;
    "Calculadora de Pintura")

Return
