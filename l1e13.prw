/*/               |------Jornada de Capacitação - Start--------|
                  |--------Exercícios ADVPL - Lista 01---------|
|----------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                             GM: Muriel Zounar|
|----------------------------------------------------------------------------|
|----------------------------------------------------------------------------|
| Ex.13 - Faça um algoritmo para ler: a descrição do produto (nome), a       |
|quantidade adquirida e o preço unitário.                                    |
|Calcular e escrever o total (total = quantidade adquirida * preço unitário),|
|o desconto e o total a pagar (total a pagar = total - desconto), sabendo-se |
|que:                                                                        |   
|      o Se quantidade <= 5 o desconto será de 2%                            |
|      o Se quantidade > 5 e quantidade <= 10 o desconto será de 3%          |
|      o Se quantidade > 10 o desconto será de 5%                            |
|----------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function Antecessor()

Local nNumero     := ""
Local nAntecessor := ""

//Insira um numero
nAntecessor = val(nNumero - 1)

//Mostre nAntecessor

RETURN
