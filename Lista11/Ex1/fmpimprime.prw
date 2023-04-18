#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

#DEFINE PRETO RGB(000,000,000)
#DEFINE VERMELHO RGB(255,000,000)
#DEFINE MaxLine 750

User Function FmpImprime()

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
    
    cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD, B1_MSBLQL' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
    cQuery += "WHERE D_E_L_E_T_= ' ' AND B1_COD <> ' '"

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

   /* If (cAlias)->(EOF())
        cAlias := ''
    Endif*/

    RestArea(aArea)

Return cAlias

Static Function MontaRep(cAlias)
    Local cCaminho := GetTempPath()
    Local cArquivo := 'CadProd.pdf'

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
    
    oPrint:SetPortrait()
    oPrint:SetPaperSize(9)
    
    oPrint:StartPage()

    Cabecalho()
        
    ImpDados(cAlias)
    oPrint:EndPage()
    oPrint:Preview()

Return

Static Function Cabecalho()

    oPrint:Box(15,15,85,580,'-8')
    oPrint:Line(50,15,50,580, VERMELHO, '-6')

    //oPrint:Say(35,20,'Empresa/Filial: ' + AllTrim(SM0->M0_NOME), oFont14,/**/, PRETO)
    oPrint:Say(70,220,'Relatório de Preços', oFont16,,PRETO)

    oPrint:Say(nLinha,20,'CÓDIGO', oFont12,,PRETO)
    oPrint:Say(nLinha,80,'DESCRIÇÃO', oFont12,,PRETO)
    oPrint:Say(nLinha,200,'UNIDADE MEDIDA', oFont12,,PRETO)
    oPrint:Say(nLinha,320,'PRECO DE VENDA', oFont12,,PRETO)
    oPrint:Say(nLinha,485,'ARMAZEM', oFont12,,PRETO)
    //oPrint:Say(nLinha,485,'UF', oFont12,,PRETO)
    //oPrint:Say(nLinha,545,'CEP', oFont12,,PRETO)

    nLinha += 5

    oPrint:Line(nLinha,15,nLinha,580,/**/,'-6')

    nLinha += 20

Return

Static Function ImpDados(cAlias)
    Local cString := ''   
    Local cPreco := 0
    Private nCor := 0

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())
        If AllTrim((cAlias)->(B1_MSBLQL)) == '1'
            nCor := VERMELHO
        Else
            nCOR := PRETO
        EndIf

        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(B1_COD)), oFont10,, nCor)
     
        cString  := AllTrim((cAlias)->(B1_DESC))     
        VeriQuebLn(cString, 20, 80)

        cPreco := AllTrim(STR((cAlias)->(B1_PRV1),,2))

        oPrint:Say(nLinha, 200, AllTrim((cAlias)->(B1_UM)), oFont10,, nCor)               
        oPrint:Say(nLinha, 320, 'R$' + cPreco , oFont10,, nCor)
        oPrint:Say(nLinha, 485, AllTrim((cAlias)->(B1_LOCPAD)), oFont10,, nCor)
                
        nLinha += 30
        
        VeriQuebPg(MaxLine)
        (cALias)->(DbSkip())
    EndDo

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
