/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E2-Elaborar um programa que efetue a apresentação do valor da conversão em|
| real (R$) de um valor lido em dólar (US$). O programa deverá solicitar o |
| valor da cotação do dólar e, também, a quantidade de dólares disponível  |
|com o usuário.                                                            |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL4e2()
           
    Local oJnla := NIL
    Local cTitle := "Calculadora de Conversão"
    Local cInfo := "Digite o valor em dolar: US$", cInfo2 := "Digite o valor da cotacao: "
    Local nOpcao := 0
    Local nCotacao := Space(10), nDolar := Space(10)

  DEFINE MSDIALOG oJnla TITLE cTitle FROM 000,000 TO 100, 400 PIXEL
    @ 014, 010 SAY    cInfo         SIZE 80, 12 OF oJnla PIXEL
    @ 030, 010 SAY    cInfo2        SIZE 80, 12 OF oJnla PIXEL
    @ 010, 090 MSGET  nCotacao  SIZE 45, 11 OF oJnla PIXEL
    @ 030, 090 MSGET  nDolar    SIZE 45, 11 OF oJnla PIXEL  
    @ 010, 140 BUTTON "Calcular"    SIZE 55, 11 OF oJnla PIXEL ACTION Cotacao(nDolar,nCotacao)
    @ 030, 140 BUTTON "Finalizar"   SIZE 55, 11 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function Cotacao(nDolar,nCotacao)
Local nReal:= 0//, nDolar := 0, nCotacao:=0 
nReal := Val(nDolar)*Val(nCotacao)
 FwAlertInfo("R$"+AllTrim(Str(nReal,10,2)), "O valor informado convertido em reais é:")

Return
