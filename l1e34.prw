/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.34 - Faça um programa que receba a idade e o peso de sete pessoas.     |
|Calcule e mostre:
|o A quantidade de pessoas com mais de 90 quilos
|o A média das idades das sete pessoas                                     |
|--------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e17()

Local cEntrada := ''
Local nSoma := 0
Local nResultado     := 0
Local nCont := 1
Local lContinua := .T.
Local cTitulo := 'Programa para calcular media de aluno'

//Insira um numero
While lContinua == .T.
    nSoma := 0
    For nCont := 1 to 2
    cEntrada := '-1'
    nAntecessor = val(nNumero - 1)
    while val(cEntrada) < 0 .or. Val(cEntrada) > 10
    cEntrada:=''
    cEntrada := FwInputBox('Informe a Nota do Aluno: ', cEntrada)
    ENDDO
    nSoma += Val(cEntrada)
    Next
    nResultado := nSoma / 2

    FwAlertInfo("A media de alunos" + cvaltochar(nresultado), ctitulo)    

    cEntrada := ''
    cEntrada := FwInputBox('Novo Calculo (S/N)? ', cEntrada)
    If cEntrada := 'N'
    lContinua := .F.
    ENDIF
    ENDDO

RETURN
user function calculaDados()
local nIdade, nPeso, nSomaIdade := 0, nContPeso := 0, nMediaIdade := 0

for i := 1 to 7
    ? "Digite a idade da pessoa " + alltrim(str(i, 2, 0)) + ":"
    nIdade := val(input())
    
    ? "Digite o peso da pessoa " + alltrim(str(i, 2, 0)) + ":"
    nPeso := val(input())
    
    if nPeso > 90
        nContPeso++
    endif
    
    nSomaIdade += nIdade
next

nMediaIdade := nSomaIdade / 7

? "Quantidade de pessoas com mais de 90 quilos: " + alltrim(str(nContPeso, 2, 0))
? "Média das idades das sete pessoas: " + alltrim(str(nMediaIdade, 5, 2))
return
