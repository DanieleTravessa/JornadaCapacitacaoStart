/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E5-Elaborar um programa que efetue a apresenta��o do valor da convers�o em|
| real (R$) de um valor lido em d�lar (US$). O programa dever� solicitar o |
| valor da cota��o do d�lar e, tamb�m, a quantidade de d�lares dispon�vel  |
|com o usu�rio.                                                            |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e5()

  Local nReal:= 0, nDolar := 0, nCotacao:=0 
    
  nDolar := Val(FwInputBox("Digite o valor em dolar: US$"))
  nCotacao := Val(FwInputBox("Digite o valor da cotacao: "))
    
  nReal := nDolar*nCotacao
        
  FwAlertInfo("R$"+AllTrim(Str(nReal,10,2)), "O valor informado convertido em reais �:")
         
Return 

