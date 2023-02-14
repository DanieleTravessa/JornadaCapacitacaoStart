/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.7 - As ma��s custam R$ 1,30 cada se forem compradas menos de uma d�zia,|
| e R$ 1,00 se forem compradas pelo menos 12. Escreva um programa que leia |
|o n�mero de ma��s compradas, calcule e escreva o custo total da compra.   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function TotalMacas()

Local cNmaca := ""
Local nQtde  := 0
Local nPreco := 0
Local nTotal := 0

//Solicita a quantidade de ma�as
   cNmaca := FwInputBox("Informe o a quantidade de ma��s compradas: ", cNmaca)
   nQtde := Val(cNmaca)
   
//Checagem da condi��o imposta pelo n�mero de ma��s:
   If nQtde < 12
      nPreco := 1.30
   Else
      nPreco := 1.00
   EndIf
   
//C�lculo do custo total   
   nTotal := nQtde * nPreco

//Informa o custo total da compra
   FwAlertInfo("R$"+AllTrim(Str(nTotal,5,2)),"O custo total da compra de " + Alltrim(Str(nQtde)) + " ma�as � : ") 
   
Return
