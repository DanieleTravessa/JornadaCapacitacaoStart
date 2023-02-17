/*/               |------Jornada de Capacita��o - Start--------|
                  |--------Exerc�cios ADVPL - Lista 01---------|
|----------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                             GM: Muriel Zounar|
|----------------------------------------------------------------------------|
|----------------------------------------------------------------------------|
| Ex.13 - Elaborar um programa que exiba na tela automaticamente todos os m�ltiplos de um determinado n�mero informado pelo usu�rio, existentes entre 1 e um limite, que tamb�m dever� ser informado pelo usu�rio. Fa�a com apenas uma estrutura de repeti��o (For / While), antes de desenvolver, analise qual ser� a melhor op��o.Fa�a um algoritmo para ler: a descri��o do produto (nome), a       |
|quantidade adquirida e o pre�o unit�rio.                                    |
|Calcular e escrever o total (total = quantidade adquirida * pre�o unit�rio),|
|o desconto e o total a pagar (total a pagar = total - desconto), sabendo-se |
|que:                                                                        |   
|      o Se quantidade <= 5 o desconto ser� de 2%                            |
|      o Se quantidade > 5 e quantidade <= 10 o desconto ser� de 3%          |
|      o Se quantidade > 10 o desconto ser� de 5%                            |
|----------------------------------------------------------------------------|

/*/

#INCLUDE "TOTVS.CH"

User Function JsL1e13()

    Local cDesc := "" // descri��o do produto
    Local cQtde := ""
    Local nQtde := 0 // quantidade adquirida
    Local cPreUni
    local nPreUni := 0 // pre�o unit�rio
    local nTotal := 0 // total
    local nDesconto := 0 // desconto
    local nTotAPagar := 0 // total a pagar

// ler os valores do usu�rio
    cDesc := FwInputBox("Digite a descri��o do produto: ", cDesc)
    cQtde := FwInputBox("Digite a quantidade adquirida: ", cQtde)
    cPreUni := ("Digite o pre�o unit�rio: ", cPreUni)

    nPreUni := Val(cPreUni)
    nQtde := Val(cQtde)
    
// calcular o total
    nTotal := nQtde * nPreUni

// calcular o desconto de acordo com a quantidade adquirida
    If nQtde <= 5
        nDesconto := (nTotal*2)/100
    Elseif nQtde > 5 .and. nQtde <=10
        nDesconto := (nTotal*3)/100
    Else
        nDesconto := (nTotal * 5)/100
    Endif 

// calcular o total a pagar
    nTotAPagar := nTotal - nDesconto

// exibir os resultados
    FwAlertInfo("Descri��o do produto: " + cDesc)
    FwAlertInfo("Quantidade adquirida: " + Alltrim(Str(nQtde)))
    FwAlertInfo("Pre�o unit�rio: " + Alltrim(Str(nPreUni)))
    FwAlertInfo("Total: " + Alltrim(Str(nTotal)))
    FwAlertInfo("Desconto: " + Alltrim(Str(nDesconto)))
    FwAlertInfo("Total a pagar: " + Alltrim(Str(nTotAPagar)))
Return

/*56b.Elaborar um programa que exiba na tela automaticamente todos os m�ltiplos de um determinado n�mero informado pelo usu�rio, 
existentes entre 1 e um limite, que tamb�m dever� ser informado pelo usu�rio. 
Fazer duas vers�es da solu��o utilizando diferentes estruturas de repeti��o, a sua escolha.  
Utilizar obrigatoriamente o la�o finito (para) para esta solu��o. 
==> Vers�o: la�o pr�-teste (enquanto)*/

FUNCTION MAIN()

    Local nNumero := 0, nMultiplo := 0, nLimite := 0

    Accept "Informe o valor limite: " to nLimite
    Accept "Informe o fator de multiplicacao desejado: " to nMultiplo
    
    nLimite := Val(nLimite)
    nMultiplo := Val(nMultiplo)

    WHILE nNumero <= nLimite ///*No la�o finito, a estrutura e a variavel com contador se iniciam simultaneamente.
        IF nNumero%(nMultiplo)=0
        ?nNumero          //O programa exibe o valor contido na vari�vel
        nNumero := nNumero + nMultiplo
        ENDIF
    ENDDO
    QOUT("-> *** Esses sao os multiplos de", nMultiplo, "ate", +AllTrim(Str(nLimite))," ***")
    ?""

RETURN NIL

/*56.Elaborar um programa que exiba na tela automaticamente todos os m�ltiplos de um determinado n�mero informado pelo usu�rio, 
existentes entre 1 e um limite, que tamb�m dever� ser informado pelo usu�rio. 
Fazer duas vers�es da solu��o utilizando diferentes estruturas de repeti��o, a sua escolha.  
Utilizar obrigatoriamente o la�o finito (para) para esta solu��o. 
==> Vers�o: la�o finito (para)*/

FUNCTION MAIN()

    Local nNumero := 0, nMultiplo := 0, nLimite := 0

    Accept "Informe o valor limite: " to nLimite
    Accept "Informe o fator de multiplicacao desejado: " to nMultiplo
    
    nLimite := Val(nLimite)
    nMultiplo := Val(nMultiplo)

    FOR nNumero:= 1 to nLimite ///*No la�o finito, a estrutura e a variavel com contador se iniciam simultaneamente.
        IF nNumero%(nMultiplo)=0
        ?nNumero          //O programa exibe o valor contido na vari�vel
        ENDIF
    NEXT
    QOUT("-> *** Esses sao os multiplos de", nMultiplo, "ate", +AllTrim(Str(nLimite))," ***")
    ?""

RETURN NIL
