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

#INCLUDE "TOTVS.CH"

user function tabelaDescontos()
local nValorCompra := 500
local nPercentualDesconto := 1
local nValorFinal := 0

do while nPercentualDesconto <= 25
    nValorFinal := nValorCompra - (nValorCompra * nPercentualDesconto / 100)
    ? "Valor da compra: " + alltrim(str(nValorCompra, 12, 2)) + " - Percentual de desconto: " + alltrim(str(nPercentualDesconto, 2, 0)) + "% - Valor final: " + alltrim(str(nValorFinal, 12, 2))
    nValorCompra += 100
    nPercentualDesconto += 1
enddo
return

RETURN

Explicação do código:

Começamos definindo as variáveis nValorCompra, nPercentualDesconto e nValorFinal como locais e com valores iniciais de 500, 1 e 0, respectivamente.
Em seguida, utilizamos um laço de repetição do while que vai executar enquanto o nPercentualDesconto for menor ou igual a 25.
Dentro do laço, calculamos o valor final da compra com o desconto acumulado e exibimos as informações no formato pedido pelo exercício utilizando a função alltrim para formatar as strings.
Por fim, incrementamos o valor da compra em 100 e o percentual de desconto em 1 para o próximo ciclo do laço.
O código retorna a tabela de descontos no formato pedido pelo exercício.
