/*/               |------Jornada de Capacitação - Start--------|
                  |--------Exercícios ADVPL - Lista 01---------|
|----------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                             GM: Muriel Zounar|
|----------------------------------------------------------------------------|
|----------------------------------------------------------------------------|
| Ex.13 - Elaborar um programa que exiba na tela automaticamente todos os múltiplos de um determinado número informado pelo usuário, existentes entre 1 e um limite, que também deverá ser informado pelo usuário. Faça com apenas uma estrutura de repetição (For / While), antes de desenvolver, analise qual será a melhor opção.Faça um algoritmo para ler: a descrição do produto (nome), a       |
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

User Function JsL1e13()

    Local cDesc := "" // descrição do produto
    Local cQtde := ""
    Local nQtde := 0 // quantidade adquirida
    Local cPreUni
    local nPreUni := 0 // preço unitário
    local nTotal := 0 // total
    local nDesconto := 0 // desconto
    local nTotAPagar := 0 // total a pagar

// ler os valores do usuário
    cDesc := FwInputBox("Digite a descrição do produto: ", cDesc)
    cQtde := FwInputBox("Digite a quantidade adquirida: ", cQtde)
    cPreUni := ("Digite o preço unitário: ", cPreUni)

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
    FwAlertInfo("Descrição do produto: " + cDesc)
    FwAlertInfo("Quantidade adquirida: " + Alltrim(Str(nQtde)))
    FwAlertInfo("Preço unitário: " + Alltrim(Str(nPreUni)))
    FwAlertInfo("Total: " + Alltrim(Str(nTotal)))
    FwAlertInfo("Desconto: " + Alltrim(Str(nDesconto)))
    FwAlertInfo("Total a pagar: " + Alltrim(Str(nTotAPagar)))
Return

/*56b.Elaborar um programa que exiba na tela automaticamente todos os múltiplos de um determinado número informado pelo usuário, 
existentes entre 1 e um limite, que também deverá ser informado pelo usuário. 
Fazer duas versões da solução utilizando diferentes estruturas de repetição, a sua escolha.  
Utilizar obrigatoriamente o laço finito (para) para esta solução. 
==> Versão: laço pré-teste (enquanto)*/

FUNCTION MAIN()

    Local nNumero := 0, nMultiplo := 0, nLimite := 0

    Accept "Informe o valor limite: " to nLimite
    Accept "Informe o fator de multiplicacao desejado: " to nMultiplo
    
    nLimite := Val(nLimite)
    nMultiplo := Val(nMultiplo)

    WHILE nNumero <= nLimite ///*No laço finito, a estrutura e a variavel com contador se iniciam simultaneamente.
        IF nNumero%(nMultiplo)=0
        ?nNumero          //O programa exibe o valor contido na variável
        nNumero := nNumero + nMultiplo
        ENDIF
    ENDDO
    QOUT("-> *** Esses sao os multiplos de", nMultiplo, "ate", +AllTrim(Str(nLimite))," ***")
    ?""

RETURN NIL

/*56.Elaborar um programa que exiba na tela automaticamente todos os múltiplos de um determinado número informado pelo usuário, 
existentes entre 1 e um limite, que também deverá ser informado pelo usuário. 
Fazer duas versões da solução utilizando diferentes estruturas de repetição, a sua escolha.  
Utilizar obrigatoriamente o laço finito (para) para esta solução. 
==> Versão: laço finito (para)*/

FUNCTION MAIN()

    Local nNumero := 0, nMultiplo := 0, nLimite := 0

    Accept "Informe o valor limite: " to nLimite
    Accept "Informe o fator de multiplicacao desejado: " to nMultiplo
    
    nLimite := Val(nLimite)
    nMultiplo := Val(nMultiplo)

    FOR nNumero:= 1 to nLimite ///*No laço finito, a estrutura e a variavel com contador se iniciam simultaneamente.
        IF nNumero%(nMultiplo)=0
        ?nNumero          //O programa exibe o valor contido na variável
        ENDIF
    NEXT
    QOUT("-> *** Esses sao os multiplos de", nMultiplo, "ate", +AllTrim(Str(nLimite))," ***")
    ?""

RETURN NIL
