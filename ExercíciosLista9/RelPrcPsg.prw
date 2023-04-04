#INCLUDE'totvs.ch'

User function RELPRCPSG()

    Local cTitulo := 'Tabela de Pre�os'
    Private cAlias := 'SB1'
    Private cProgram := 'RELPRCPSG'
    Private cDesc1 := 'Relat�rio de'
    Private cDesc2 := 'Produto'
    Private cDesc3 := 'para Venda'
    Private cSize := 'M'
    Private aReturn := {'Zebrado',1,'Administra��o',1,2,'','',1}
    Private nLastKey := 0
    Private nLimite := 132
    Private cNomeRel := SetPrint(cAlias,cProgram,'',@cTitulo,cDesc1,cDesc2,cDesc3,.F.,,.T.,cSIZE,,.F.)
    
    //(cAlias, cProgram, [cPergunta],[cTitle],[cDesc1],[cDesc2],[cDesc3],[lDic],[aOrd],[lCompres],[cSize],[uParm12],[lFilter])
    
    If nLastKey == 27
        MSGSTOP( 'Aten��o', 'Processo de Impress�o Cancelado')
        Return
    EndIF
    
    SetDefault(aReturn, cAlias)

    RptStatus({||Imprime()}, cTitulo, 'Gerando relat�rios...')
Return    

Static Function Imprime()

    Local nLinha := 2
    Local nColuna := 2
    Local nAvanColuna := nColuna + 10
    Local nValor  

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))

    nValor := AllTrim(STR(SB1->B1_PRV1,,2))  

    @ ++nLinha, 000 PSAY Replicate('*',nLimite)
    @ ++nLinha, nColuna PSAY '| C�digo |' 
    @ nLinha, nAvanColuna PSAY '| Descri��o |' 
    @ nLinha, 22 PSAY '| Unidade de Medida |' 
    @ nLinha, 32 PSAY '| Pre�o de Venda |' 
    @ nLinha, 42 PSAY '| Armaz�m |'
    @ ++nLinha, 000 PSAY Replicate('*',nLimite)
    
    While !EOF() .and. !lEnd      
        @ nLinha++
        @ ++nLinha, 000 PSAY Replicate('*',nLimite)
        @ nLinha++
        @ ++nLinha, nColuna PSAY PADC(AllTrim(SB1->B1_COD),5)
        @ nLinha, nAvanColuna PSAY PADC(AllTrim(SB1->B1_DESC),5)
        @ nLinha, 22 PSAY PADC(AllTrim(SB1->B1_UM),5)
            If Empty(nValor)
            nValor := 0
            nValor := AllTrim(Str(nValor,,2))
            EndIf
        @ nLinha, 32 PSAY 'R$' + nValor
        @ nLinha, 42 PSAY PADC(AllTrim(SB1->B1_LOCPAD),5)          
        SB1->(DbSkip())
    EndDo

    SET DEVICE TO SCREEN

    If aReturn[5] == 1
        SET PRINTER TO DbCommitAll()
        OurSpool(cNomeRel)
    EndIf 

    MS_FLUSH()
 
Return 
