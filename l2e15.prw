/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E15 - Fazer um programa para calcular e exibir os "n" primeiros números da|
|série de Fibonacci. O usuário informará o valor de n.                     |
|--------------------------------------------------------------------------|/*/

#INCLUDE "TOTVS.CH"

User Function JsL2e15()

    LOCAL nNumero := 0

        nNumero := Val(FwInputBox("Insira quantos numeros da serie Fibonacci quer ver: "))
    
    CalcFib (nNumero)
 
Return

Static Function CalcFib (nNumero)

    LOCAL nA := 0, nB := 1, nC := 0, nCont := 1

    DO CASE
    CASE nNumero := 0
        MsgInfo(Str(nA))
    CASE nNumero := 1
        MsgInfo(Str(nB))
    OTHERWISE
        MsgInfo((Str(nCont,4)+ ":"+ AllTrim(Str(nB))),"A sequencia Fibonacci eh: ")
                
        WHILE (nCont < nNumero)
            nC := nA + nB
            nA := nB
            nB := nC
                nCont++
            MsgInfo(StrZero(nCont,4) + ":" + AllTrim(str(nC)))
       ENDDO   
    ENDCASE

RETURN
