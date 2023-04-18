#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO RGB(000,000,000)
#DEFINE VERMELHO RGB(255,000,000)
#DEFINE MaxLine 550

/*/{Protheus.doc} User Function FWrepSA2
    (Relatório da tabela SC7 usando a classe FWmsPrinter - Lista11 Ex5)
    @type  Function
    @author Daniele Travessa
    @since 14/04/2023
    /*/
User Function FWrelSC7()

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
    cQuery += "WHERE D_E_L_E_T_= ' ' AND C7_NUM != ' '" 

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

    RestArea(aArea)

Return cAlias

Static Function MontaRep(cAlias)
    Local cCaminho := GetTempPath()
    Local cArquivo := 'PedCompraGeral.pdf'

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

   // Cabecalho()
        
    ImpDados(cAlias)
   
    oPrint:EndPage()
    oPrint:Preview()

Return
Static Function Cabecalho()

    oPrint:Box(15,15,115,800,'-8')
    oPrint:Line(55,15,55,800, PRETO, '-6')

    oPrint:Say(45,330,'Pedido de Compras', oFont16,,PRETO)
    //oPrint:Line(nLinha,15,nLinha,800,/**/,'-6')
    nLinha := 75
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

    oPrint:Say(nLinha,020,'CODIGO',      oFont12,,PRETO)
    oPrint:Say(nLinha,080,'DESCRIÇÃO ',  oFont12,,PRETO)
    oPrint:Say(nLinha,280,'QDE PEDIDA ', oFont12,,PRETO)
    oPrint:Say(nLinha,480,'VALOR UNIT.', oFont12,,PRETO)
    oPrint:Say(nLinha,585,'VALOR TOTAL', oFont12,,PRETO)
    
    nLinha += 5

    oPrint:Line(nLinha,15,nLinha,800,/**/,'-6')

    nLinha += 20

    oPrint:Say(520, 015, 'Total do Pedido: ', oFont10,, PRETO)
    oPrint:Say(520, 400, 'Total de Páginas: ', oFont10,, PRETO)
    nLinha := 0
Return

Static Function ImpDados(cAlias)
    
    //Local cString := ''   
    Local cValor  := ''
    Local cPreco  := ''    
    Local cUltimo := ''
    Local cQuant  := ''
    //Local nTotal  := 0    
    //Local nTotreg   := 0
    Local nPag    := 0
    Local nLinha  := 105    
    Private nCor := PRETO

    DbSelectArea(cAlias)
    //COUNT to nTotreg

    (cAlias)->(DbGoTop())
    
    While (cAlias)->(!EOF())
        
        If AllTrim(cUltimo) <> AllTrim((cAlias)->(C7_NUM))
            If !Empty(cUltimo)
            oPrint:EndPage()
            EndIf
            oPrint:EndPage()
            oPrint:StartPage()
            nLinha := 105 //SA
            Cabecalho()                       
            oPrint:Say(nLinha, 020, AllTrim((cAlias)->(C7_NUM)), oFont10,, nCor)        
            oPrint:Say(nLinha, 080, AllTrim((cAlias)->(C7_EMISSAO)), oFont10,, nCor)
            oPrint:Say(nLinha, 180, AllTrim((cAlias)->(C7_FORNECE)), oFont10,, nCor)        
            oPrint:Say(nLinha, 480, AllTrim((cAlias)->(C7_LOJA)), oFont10,, nCor)                
            oPrint:Say(nLinha, 585, AllTrim((cAlias)->(C7_COND)), oFont10,, nCor)
            cUltimo := Alltrim((cAlias)->C7_NUM)
            nPag++
            
            
            nLinha += 80                
        EndIf
     
            oPrint:Say(nLinha, 020, AllTrim((cAlias)->(C7_PRODUTO)), oFont10,, nCor)                        
            oPrint:Say(nLinha, 080, AllTrim((cAlias)->(C7_DESCRI)), oFont10,, nCor)
            cQuant := cValToChar((cAlias)->(C7_QUANT))                      
            oPrint:Say(nLinha, 280, AllTrim(cQuant) , oFont10,, nCor)

            cPreco := AllTrim(STR((cAlias)->(C7_PRECO),,2))
            oPrint:Say(nLinha, 480, 'R$' + cPreco , oFont10,, nCor)

            cValor := AllTrim(STR((cAlias)->(C7_TOTAL),,2))
            oPrint:Say(nLinha, 585, 'R$' + cValor , oFont10,, nCor)

            nLinha += 30

           /* nTotal := nTotal + cValor
            nTotal := AllTrim(STR((nTotal),,2))
            oPrint:Say(520, 100, 'R$' + nTotal, oFont10,, nCor)*/
            
           
       
        VeriQuebPg(MaxLine)
        (cALias)->(DbSkip())
    EndDo
       
        nPag := CVALTOCHAR( nPag )
       
        oPrint:Say(520, 490, nPag, oFont10,, nCor)

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

    If nLinha > nMax

        oPrint:EndPage()
        oPrint:StartPage()

        nLinha := 105

        Cabecalho()
    EndIf
 
Return
