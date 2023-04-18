#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO RGB(000,000,000)
#DEFINE VERMELHO RGB(255,000,000)
#DEFINE MaxLine 750

/*/{Protheus.doc} User Function FWrepSA2
    (Relatório da tabela SC5 usando a classe FWmsPrinter - Lista11 Ex2)
    @type  Function
    @author Daniele Travessa
    @since 14/04/2023
    /*/
User Function FWrepSA2()

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
    
    cQuery += 'SELECT A2_COD, A2_LOJA, A2_NOME, A2_MUN, A2_EST, A2_CEP, A2_TEL, A2_MSBLQL' + CRLF
    cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
    cQuery += "WHERE D_E_L_E_T_= ' ' AND A2_COD = '" + SA2->A2_COD + "'" 

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

   /* If (cAlias)->(EOF())
        cAlias := ''
    Endif*/

    RestArea(aArea)

Return cAlias

Static Function MontaRep(cAlias)
    Local cCaminho := GetTempPath()
    Local cArquivo := 'RepFornec.pdf'

    Private nLinha := 105
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

    oPrint:Box(15,15,85,800,'-8')
    oPrint:Line(50,15,50,800, VERMELHO, '-6')

    //oPrint:Say(35,20,'Empresa/Filial: ' + AllTrim(SM0->M0_NOME), oFont14,/**/, PRETO)
    oPrint:Say(70,300,'Relatório de Fornecedores', oFont16,,PRETO)

    oPrint:Say(nLinha,20,'CÓDIGO', oFont12,,PRETO)
    oPrint:Say(nLinha,80,'LOJA', oFont12,,PRETO)
    oPrint:Say(nLinha,150,'RAZÃO SOCIAL', oFont12,,PRETO)
    oPrint:Say(nLinha,320,'MUNICIPIO', oFont12,,PRETO)    
    oPrint:Say(nLinha,485,'UF', oFont12,,PRETO)
    oPrint:Say(nLinha,545,'CEP', oFont12,,PRETO)
    oPrint:Say(nLinha,670,'TELEFONE', oFont12,,PRETO)

    nLinha += 5

    oPrint:Line(nLinha,15,nLinha,800,/**/,'-6')

    nLinha += 20

Return

Static Function ImpDados(cAlias)
    Local cString := ''   
    Private nCor := 0

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    //While (cAlias)->(!EOF())
        If AllTrim((cAlias)->(A2_MSBLQL)) == '1'
            nCor := VERMELHO
        Else
            nCOR := PRETO
        EndIf

        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(A2_COD)), oFont10,, nCor)        
        oPrint:Say(nLinha, 080, AllTrim((cAlias)->(A2_LOJA)), oFont10,, nCor)
        
        cString  := AllTrim((cAlias)->(A2_NOME))     
        VeriQuebLn(cString, 020, 150)

        cString  := AllTrim((cAlias)->(A2_MUN))     
        VeriQuebLn(cString, 020, 320)

        oPrint:Say(nLinha, 485, AllTrim((cAlias)->(A2_EST)), oFont10,, nCor)
        oPrint:Say(nLinha, 545, AllTrim((cALias)->(A2_CEP)) , oFont10,, nCor)
        oPrint:Say(nLinha, 670, AllTrim((cAlias)->(A2_TEL)), oFont10,, nCor)

        nLinha += 30
        
        VeriQuebPg(MaxLine)
        (cALias)->(DbSkip())
    //EndDo

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
