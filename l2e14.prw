/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.14 - Faça um programa que calcule a somatória dos "n" primeiros números|
|naturais pares ou ímpares. O usuário informará através de digitação a     |
|quantidade de números desejada ("n") e escolherá entre par ou ímpar.      |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function Jsl2e14()

    LOCAL nNumero := 0, nSoma := 0, nLimite := 0, cIP := "", cPI := ""

    nLimite := Val(FwInputBox("Insira quantos numeros naturais quer calcular : "))
    cIp := Upper(FwInputBox("Quer calcular os valores pares ou impares? (P/I)"))

   
    WHILE ISDIGIT(nLimite) = .F. // Validacao para saber se o numero digitado eh inteiro e positivo
            nLimite := Val(FwInputBox("Valor invalido, digite aqui um numero inteiro positivo: "))
    ENDDO
 
    WHILE nNumero < nLimite 
        IF cIP == "P"
        nNumero := nNumero + 2
        nSoma += nNumero
        cPI := "Pares"
        ELSEIF cIP == "I"
        nNumero := nNumero + 1
        nSoma := nSoma + nNumero
        cPI := "Impares"
        ENDIF
    ENDDO
    FwAlertInfo(AllTrim(Str(nSoma)), "A somatoria dos " + AllTrim(Str(nLimite)) + " primeiros números naturais" + cPI + "é: ")
    
    RETURN
