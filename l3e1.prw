/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E1:
| Faça uma consulta na tabela SC7 para retornar todos os pedidos realizados|
|para o fornecedor “Super Cabos”. Apresente o resultado em uma função de   |
|mensagem com a seguinte estrutura:                                        |
|Pedido 1: PC0001                                                          |
|Pedido 2: PC0002                                                          |
|--------------------------------------------------------------------------|
/*/

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Jsl3e1()
    Local aArea   := GetArea()
    Local cPedido := "", cFornecedor := "F00004", cLoja := "01"
    Local nCont := 1


  PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'
  
    DbSelectArea('SC7') //
    DbSetOrder(3) //C7_FILIAL+C7_FORNECE+C7_LOJA+C7_NUM
    
    If DbSeek(xFilial("SC7") + cFornecedor + cLoja) //cFornecedor := SC7->C7_FORNECE //cLoja := SC7->C7_LOJA
      While SC7->(!EOF())            
        If SC7->C7_FORNECE == cFornecedor
        cPedido += "Pedido " +Str(nCont)+ ": " + AllTrim(SC7->C7_NUM)+";"+CRLF //A variável cCodigo recebe o conteúdo C7_NUM
        nCont++
        Else
          Exit
        EndIf
        
        DbSkip()
      EndDo
    EndIf

    FwAlertInfo(cPedido)

    DbCloseArea()
    RestArea(aArea)
Return
