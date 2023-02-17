/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E5-Elaborar um programa que efetue a apresentação do valor da conversão em|
| real (R$) de um valor lido em dólar (US$). O programa deverá solicitar o |
| valor da cotação do dólar e, também, a quantidade de dólares disponível  |
|com o usuário.                                                            |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e5()

  Local nReal:= 0, nDolar := 0, nCotacao:=0 
    
  nDolar := Val(FwInputBox("Digite o valor em dolar: US$"))
  nCotacao := Val(FwInputBox("Digite o valor da cotacao: "))
    
  nReal := nDolar*nCotacao
        
  FwAlertInfo("R$"+AllTrim(Str(nReal,10,2)), "O valor informado convertido em reais é:")
         
Return 

