/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.37- Uma loja tem tem uma pol�tica de descontos de acordo com o valor da|
|compra do cliente. Os descontos come�am a partir dos R$500. A cada 100    |
|reais acima dos R$500,00 o cliente ganha 1% de desconto cumulativo at� 25%|
|o Por exemplo: R$500 = 1%
|o R$600,00 = 2%
|o R$700,00 = 3%
|o ...
|Fa�a um programa que exiba essa tabela de descontos no seguinte formato:  |
|Valor da compra � porcentagem de desconto � valor final                   |
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

Explica��o do c�digo:

Come�amos definindo as vari�veis nValorCompra, nPercentualDesconto e nValorFinal como locais e com valores iniciais de 500, 1 e 0, respectivamente.
Em seguida, utilizamos um la�o de repeti��o do while que vai executar enquanto o nPercentualDesconto for menor ou igual a 25.
Dentro do la�o, calculamos o valor final da compra com o desconto acumulado e exibimos as informa��es no formato pedido pelo exerc�cio utilizando a fun��o alltrim para formatar as strings.
Por fim, incrementamos o valor da compra em 100 e o percentual de desconto em 1 para o pr�ximo ciclo do la�o.
O c�digo retorna a tabela de descontos no formato pedido pelo exerc�cio.
