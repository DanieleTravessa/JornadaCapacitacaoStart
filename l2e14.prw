/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.14 - Faça um programa que calcule a somatória dos "n" primeiros números naturais pares ou ímpares. O usuário informará através de digitação a quantidade de números desejada ("n") e escolherá entre par ou ímpar.Escreva um algoritmo para ler 2 valores e se o segundo valor      |
|informado for ZERO, deve ser lido um novo valor, ou seja, para o segundo  |
|valor não pode ser aceito o valor zero. Imprimir o resultado da divisão do|
|primeiro valor lido pelo segundo valor lido.                              |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function Jsl1e14()

    Local nNum1 := 0
    Local nNum2 := 0

//Insira um numero
    nNum1 := Val(FwInputBox("Insira o primeiro valor: ", nNum1))


    While nNum2 == 0
        nNum2 := Val(FwInputBox("Insira o segundo valor: ", nNum2))
    End

    FwAlertInfo("O valor da divisao é: " + AllTrim(STR(nNum1/nNum2)), "Valor da divisão")

RETURN

/*60.Faça um programa que calcule a somatória dos "n" primeiros números naturais pares ou ímpares. 
O usuário informará através de digitação: a quantidade de números desejada ("n") e escolhe entre par o ímpar.*/

FUNCTION MAIN()

    LOCAL nNumero := 0, nSoma := 0, nLimite := 0, cIP := "", cPI := ""
    ACCEPT "Insira quantos numeros naturais quer calcular : " to nLimite
    ACCEPT "Quer calcular os valores pares ou impares? (P/I) " to cIP

   
    WHILE ISDIGIT(nLimite) = .F. // Validacao para saber se o numero digitado eh inteiro e positivo
            ACCEPT "Valor invalido, digite aqui um numero inteiro positivo: " to nLimite
    ENDDO

    nLimite := Val(nLimite)
    cIP := UPPER(cIP)


    WHILE nNumero < nLimite 
        IF cIP == "P"
        nNumero := nNumero + 2
        nSoma := nSoma + nNumero
        cPI := "Pares"
        ELSEIF cIP == "I"
        nNumero := nNumero + 1
        nSoma := nSoma + nNumero
        cPI := "Impares"
        ENDIF
    ENDDO
    ?"A somatoria dos", nLimite, "primeiros numeros naturais", cPI, "e: ", +AllTrim((Str(nSoma)))
    ?""

RETURN NIL
