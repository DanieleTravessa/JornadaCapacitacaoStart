/*/             |------Jornada de Capacita��o - Start--------|
                |--------Exerc�cios ADVPL - Lista 01---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E2�Fa�a uma consulta na tabela SC5 para retornar todos os pedidos de Venda|
|em que o �n�mero da nota� (C5_NOTA) n�o foi preenchido. Apresente em uma  |
|mensagem quais s�o os n�meros dos pedidos e o nome dos clientes.          |
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function JsL3e2()
    Local aArea  := GetArea()
    Local cPod   := ''
    LOCAL cNota  := ''
    Local cMsg   := ''
    Local nCont  := 0
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'COM'
    DbSelectArea('SC5')
    DbSetOrder(1)
    DbGoTop()
    
    
    while SC5->(!EOF())
        cPod  := SC5->C5_NUM
        cNota := SC5->C5_NOTA
        cNome := SA1->A1_NOME

        IF cNota == '         '         
            cMsg += 'Pedido : ' + cPod + CRLF +  'Cliente : ' + cNome + CRLF
            cMsg += '------------------------------' + CRLF + CRLF
            nCont++
        ENDIF
        if nCont == 10
        FwAlertInfo(cMsg, 'Dados dos Clientes')
        nCont := 0
        cMsg  := ''    
        endif
        DbSkip()
    end
    if nCont > 0
        FwAlertInfo(cMsg, 'Dados dos Clientes')
    ELSE
        MSGSTOP( "AA")
    endif
    DbCloseArea()
    RestArea(aArea)
Return
