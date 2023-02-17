/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.14 - Fa�a um programa que calcule a somat�ria dos "n" primeiros n�meros naturais pares ou �mpares. O usu�rio informar� atrav�s de digita��o a quantidade de n�meros desejada ("n") e escolher� entre par ou �mpar.Escreva um algoritmo para ler 2 valores e se o segundo valor      |
|informado for ZERO, deve ser lido um novo valor, ou seja, para o segundo  |
|valor n�o pode ser aceito o valor zero. Imprimir o resultado da divis�o do|
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

    FwAlertInfo("O valor da divisao �: " + AllTrim(STR(nNum1/nNum2)), "Valor da divis�o")

RETURN

/*60.Fa�a um programa que calcule a somat�ria dos "n" primeiros n�meros naturais pares ou �mpares. 
O usu�rio informar� atrav�s de digita��o: a quantidade de n�meros desejada ("n") e escolhe entre par o �mpar.*/

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
