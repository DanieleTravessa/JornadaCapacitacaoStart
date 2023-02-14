/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.7 - As maçãs custam R$ 1,30 cada se forem compradas menos de uma dúzia,|
| e R$ 1,00 se forem compradas pelo menos 12. Escreva um programa que leia |
|o número de maçãs compradas, calcule e escreva o custo total da compra.   |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function TotalMacas()

Local cNmaca := ""
Local nQtde  := 0
Local nPreco := 0
Local nTotal := 0

//Solicita a quantidade de maças
   cNmaca := FwInputBox("Informe o a quantidade de maçãs compradas: ", cNmaca)
   nQtde := Val(cNmaca)
   
//Checagem da condição imposta pelo número de maçãs:
   If nQtde < 12
      nPreco := 1.30
   Else
      nPreco := 1.00
   EndIf
   
//Cálculo do custo total   
   nTotal := nQtde * nPreco

//Informa o custo total da compra
   FwAlertInfo("R$"+AllTrim(Str(nTotal,5,2)),"O custo total da compra de " + Alltrim(Str(nQtde)) + " maças é : ") 
   
Return
