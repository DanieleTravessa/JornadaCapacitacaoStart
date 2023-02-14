/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|Ex4: Escreva um algoritmo para ler o salário mensal atual de um funcionário|
| e o percentual de reajuste. Calcular e escrever o valor do novo salário.  |
|---------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function Salario()

    Local cSalario       :=""
    Local cPercentual    :=""
    Local nSalarioAtual  := 0
    Local nPercentual    := 0
    Local nSalReajustado := 0


//Insere o SalarioAtual
    cSalario := FwInputBox("Insira o Salário Atual: ", cSalario)
    nSalarioAtual := Val(cSalario)
    
//Insere o Percentual de Reajuste
    cPercentual := FwInputBox("Insira o percentual de reajuste", cPercentual)
    nPercentual := Val(cPercentual)
    
//Cálculo do Reajuste    
    nSalReajustado = (1+(nPercentual/100)) * nSalarioAtual

//Mostra o Salário Reajustado
    FwAlertInfo("O Salário reajustado é: " + Alltrim(Str(nSalReajustado,8,2)), "$$~Novo Salário~$$")
RETURN


           