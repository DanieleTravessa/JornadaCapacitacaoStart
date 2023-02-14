/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|---------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                            GM: Muriel Zounar|
|---------------------------------------------------------------------------|
|---------------------------------------------------------------------------|
|Ex4: Escreva um algoritmo para ler o sal�rio mensal atual de um funcion�rio|
| e o percentual de reajuste. Calcular e escrever o valor do novo sal�rio.  |
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
    cSalario := FwInputBox("Insira o Sal�rio Atual: ", cSalario)
    nSalarioAtual := Val(cSalario)
    
//Insere o Percentual de Reajuste
    cPercentual := FwInputBox("Insira o percentual de reajuste", cPercentual)
    nPercentual := Val(cPercentual)
    
//C�lculo do Reajuste    
    nSalReajustado = (1+(nPercentual/100)) * nSalarioAtual

//Mostra o Sal�rio Reajustado
    FwAlertInfo("O Sal�rio reajustado �: " + Alltrim(Str(nSalReajustado,8,2)), "$$~Novo Sal�rio~$$")
RETURN


           