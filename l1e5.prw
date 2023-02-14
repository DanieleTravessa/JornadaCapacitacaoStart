/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E5 - O custo de um carro novo ao consumidor é a soma do custo de fábrica  |
| com a porcentagem do distribuidor e dos impostos (aplicados ao custo de  |
| fábrica). Supondo que o percentual do distribuidor seja de 28% e os      |
| impostos de 45%, escrever um algoritmo para ler o custo de fábrica de um |
| carro, calcular e escrever o custo final ao consumidor.                  |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function CustoCarro()

Local nCarroNovo := 0
Local cCustoFab  := ""
Local nCustoFab  := 0
Local nImpostos  := 0
Local nPorcDistri:= 0

//Insira o CustodeFabrica
cCustoFab := FwInputBox("Informe o valor do custo de Fábrica:", cCustoFab)
nCustoFab := Val(cCustoFab)

//Cálculos dos impostos e Percentual do Distribuidor
nImpostos := (nCustoFab * 45)/100
nPorcDistri := (nCustoFab * 28)/100

//Cálculo do Custo Final ao Consumidor
nCarroNovo := nCustoFab + nImpostos + nPorcDistri

//Mostre nCarroNovo
FwAlertInfo("O valor do veículo é: " + Alltrim(Str(nCarroNovo,10,2)), "Valor do Carro")

RETURN
