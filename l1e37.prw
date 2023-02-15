/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.37- Uma loja tem tem uma política de descontos de acordo com o valor da|
|compra do cliente. Os descontos começam a partir dos R$500. A cada 100    |
|reais acima dos R$500,00 o cliente ganha 1% de desconto cumulativo até 25%|
|o Por exemplo: R$500 = 1%
|o R$600,00 = 2%
|o R$700,00 = 3%
|o ...
|Faça um programa que exiba essa tabela de descontos no seguinte formato:  |
|Valor da compra – porcentagem de desconto – valor final                   |
|--------------------------------------------------------------------------|

/*/
n
#INCLUDE "TOTVS.CH"

User Function JsL1e37()
    
    Local nVCompra := 500
    Local nPercentual := 1
    Local nVFinal := 0

    Do While nPercentual <= 25
        nVFinal := nVCompra - (nVCompra * nPercentual / 100)
        FwAlertInfo("Valor da compra: " + Alltrim(Str(nVCompra,12,2)) + " - Percentual de desconto: " + AllTrim(Str(nPercentual,2,0)) + "% - Valor final: " + AllTrim(Str(nVFinal,12,2)), "Desconto Progressivo!")
        nVCompra += 100
        nPercentual += 1
    Enddo
Return

