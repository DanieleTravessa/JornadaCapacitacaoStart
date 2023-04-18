#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO RGB(000,000,000)
#DEFINE VERMELHO RGB(255,000,000)
#DEFINE MaxLine 550

/*/{Protheus.doc} User Function FWrepSA2
    (Relatório da tabela SC7 usando a classe FWmsPrinter - Lista11 Ex3 e 4)
    @type  Function
    @author Daniele Travessa
    @since 14/04/2023
    /*/
User Function FWrepSC7()

    Local cAlias := GeraCons()

    If !Empty(cAlias)
    Processa({||MontaRep(cAlias)}, 'Aguarde...', 'Imprimindo relatório...', .F.)
    else
        FwAlertError('Nenhum registro encontrado','Atenção!')
    endif

Return

Static Function GeraCons()

    Local aArea := GetArea()
    Local cQuery := ''
    Private cAlias := GetNextAlias()
    
    cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
    cQuery += "WHERE D_E_L_E_T_= ' ' AND C7_NUM = '" + SC7->C7_NUM + "'" 

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

    RestArea(aArea)

Return cAlias

Static Function MontaRep(cAlias)
    Local cCaminho := GetTempPath()
    Local cArquivo := 'PedCompra.pdf'

    Private nLinha := 75
    Private nColIni := 020
    Private nColFim := 820
    Private oPrint

    Private oFont10 := TFont():New('Arial',/**/,10,/**/,.F.,/**/,/**/,/**/,/**/,.F.,.F.)
    Private oFont12 := TFont():New('Arial',/**/,12,/**/,.T.,/**/,/**/,/**/,/**/,.F.,.F.)
    Private oFont14 := TFont():New('Arial',/**/,14,/**/,.T.,/**/,/**/,/**/,/**/,.F.,.F.)
    Private oFont16 := TFont():New('Arial',/**/,16,/**/,.T.,/**/,/**/,/**/,/**/,.T.,.F.)

    oPrint := FwMSPrinter():New(cArquivo,IMP_PDF,.F.,'',.T.,/*TR*/,@oPrint,/*''*/,/*LS*/,/**/,/*lRaw*/,.T.)
    
    oPrint:cPathPDF := cCaminho  

    oPrint:Setup()
    
    oPrint:SetLandscape()
    oPrint:SetPaperSize(9)
    
    oPrint:StartPage()

    Cabecalho()
        
    ImpDados(cAlias)
   
    oPrint:EndPage()
    oPrint:Preview()

Return
Static Function Cabecalho()

    oPrint:Box(15,15,115,800,'-8')
    oPrint:Line(55,15,55,800, PRETO, '-6')

    oPrint:Say(45,330,'Pedido de Compras', oFont16,,PRETO)
    //oPrint:Line(nLinha,15,nLinha,800,/**/,'-6')

    oPrint:Say(nLinha,20,'NÚMERO', oFont12,,PRETO)
    oPrint:Say(nLinha,80,'DATA EMISSÃO', oFont12,,PRETO)
    oPrint:Say(nLinha,180,'FORNECEDOR', oFont12,,PRETO)
    oPrint:Say(nLinha,480,'LOJA', oFont12,,PRETO)    
    oPrint:Say(nLinha,585,'CONDIÇÃO DE PAGAMENTO', oFont12,,PRETO)
    
    nLinha += 5

    oPrint:Line(nLinha,15,nLinha,800,/**/,'-6')

    nLinha += 70

    oPrint:Box(118,15,550,800,'-8')
    
    oPrint:Say(135,330,'Itens do Pedido', oFont16,,PRETO)

    oPrint:Say(nLinha,20,'PRODUTO', oFont12,,PRETO)
    oPrint:Say(nLinha,80,'DESCRIÇÃO', oFont12,,PRETO)
    oPrint:Say(nLinha,280,'QDE VENDIDA', oFont12,,PRETO)
    oPrint:Say(nLinha,480,'VALOR UNIT.', oFont12,,PRETO)
    oPrint:Say(nLinha,585,'VALOR TOTAL', oFont12,,PRETO)
    
    nLinha += 5

    oPrint:Line(nLinha,15,nLinha,800,/**/,'-6')

    nLinha += 20

    oPrint:Say(520, 015, 'Total do Pedido: ', oFont10,, PRETO)

Return

Static Function ImpDados(cAlias)
    
    //Local cString := ''   
    Local cValor  := ''
    Local CNumPed := ''
    Local cPedSel :=''
    Local nTotal  := 0
    Local nLinha  := 105

    Private nCor := PRETO

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(C7_NUM)), oFont10,, nCor)        
        oPrint:Say(nLinha, 080, AllTrim((cAlias)->(C7_EMISSAO)), oFont10,, nCor)
        oPrint:Say(nLinha, 180, AllTrim((cAlias)->(C7_FORNECE)), oFont10,, nCor)        
        oPrint:Say(nLinha, 480, AllTrim((cAlias)->(C7_LOJA)), oFont10,, nCor)                
        oPrint:Say(nLinha, 585, AllTrim((cAlias)->(C7_COND)), oFont10,, nCor)
        
        nLinha += 80
     

    While (cAlias)->(!EOF())
        If cNumPed == cPedSel

            oPrint:Say(nLinha, 020, AllTrim((cAlias)->(C7_PRODUTO)), oFont10,, nCor)        
                
            oPrint:Say(nLinha, 080, AllTrim((cAlias)->(C7_PRODUTO)), oFont10,, nCor)        
                
            oPrint:Say(nLinha, 280, AllTrim((cAlias)->(C7_QUANT)), oFont10,, nCor)

            cValor := AllTrim(STR((cAlias)->(C7_PRECO),,2))
            oPrint:Say(nLinha, 480, 'R$' + cValor , oFont10,, nCor)

            cValor := AllTrim(STR((cAlias)->(C7_TOTAL),,2))
            oPrint:Say(nLinha, 585, 'R$' + cValor , oFont10,, nCor)

            nTotal += val(cValor)//Ex. 4
        EndIf
        nLinha += 30
        
        VeriQuebPg(MaxLine)
        (cALias)->(DbSkip())
    EndDo

        nTotal := AllTrim(STR((nTotal),,2))
        oPrint:Say(520, 100, 'R$' + nTotal, oFont10,, nCor)

    (cAlias)->(DbCloseArea())
Return

Static Function VeriQuebLn(cString, nLineTam, nCol)
    Local cLinha   := ''
    Local lTemQbra := .F.
    Local nQtdLine := MLCount(cString, nLineTam, /*Tab. Size*/, .F.)
    Local nI       := 1
    
    If nQtdLine > 1
        lTemQbra := .T.
        For nI := 1 to nQtdLine
            // A função MemoLine copia a quantidade de caracteres de acordo com o tamanho definido em "nLineTam" e atribui o valor em "cLinha", fazendo isso para cada linha.
            // Obs: A quantidade de linhas necessárias foi definida pela função MLCount
            cLinha := MemoLine(cString, nLineTam, nI) 
            oPrint:Say(nLinha, nCol, cLinha, oFont10,, nCor)
            nLinha += 10
        next
    Else
        oPrint:Say(nLinha, nCol, cString, oFont10,, nCor)
    Endif
    If lTemQbra
        nLinha -= nQtdLine * 10 
    Endif
Return

//função que faz quebra de página
Static Function VeriQuebPg(nMax)
if nLinha > nMax
    oPrint:EndPage()
    oPrint:StartPage()

    nLinha := 105

    Cabecalho()
EndIf
Return
