/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|Ex.15 - Fazer um programa para calcular e exibir os "n" primeiros números da série de Fibonacci.
O usuário informará o valor de n.                                |
|--------------------------------------------------------------------------|
/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e15()

    Local nNum1 := 0
    Local nNum2 :=0

//Insira um numero
    nNum1 := Val(FwInputbox("Insira o primeiro valor: "))
    nNum2 := Val(FwInputbox("Insira o segundo valor: "))

    While nNum2 := 0
        FwAlertError('Valor Inválido!')
        nNum2 := Val(FwInputBox('Insira o segundo valor: '))
    ENDDO

    FwAlertInfo('O valor da divisão é: ' + AllTrim(Str(nNum1/nNum2)), "Valor da divisão")
Return

/*72.Fazer um programa para calcular e exibir os "n" primeiros números da série de Fibonacci. O usuário informará o valor de n. 
*/

Function Main()

    LOCAL nNumero := 0

        ACCEPT "Insira quantos numeros da serie Fibonacci quer ver: " TO nNumero
            nNumero := val(nNumero)

    CalcFib (nNumero)

    
Return NIL

function CalcFib (nNumero)

    LOCAL nA := 0, nB := 1, nC := 0, nCont := 1

    DO CASE
    CASE nNumero := 0
        ?nA
    CASE nNumero := 1
        ?nB
    OTHERWISE
        ?""
        ?"A sequencia Fibonacci eh: "
        ?""
        QOUT(StrZero(nCont,4), ":", AllTrim(str(nB)))
        WHILE (nCont < nNumero)
            nC := nA + nB
            nA := nB
            nB := nC
                nCont++
            ?StrZero(nCont,4) , ":" , AllTrim(str(nC))
       ENDDO   
    ENDCASE

RETURN NIL
