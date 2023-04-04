#INCLUDE'totvs.ch'

User function RelSB1Ret()

    Local cTitulo := 'Tabela de Pre�os'
    Private cAlias := 'SB1'
    Private cProgram := 'RelSB1Ret'
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
       
    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))

    While !EOF()
        @ ++nLinha, 00 PSAY Replicate('*',nLimite)
        @ ++nLinha, 00 PSAY 'C�digo: ' + AllTrim(SB1->B1_COD)
        @ ++nLinha, 00 PSAY 'Descri��o: ' + AllTrim(SB1->B1_DESC)
        @ ++nLinha, 00 PSAY 'Unidade de Medida: ' + AllTrim(SB1->B1_UM)                  
        @ ++nLinha, 00 PSAY 'Pre�o de Venda: R$' + AllTrim(STR(SB1->B1_PRV1,,2))
        @ ++nLinha, 00 PSAY 'Armaz�m: ' + AllTrim(SB1->B1_LOCPAD)
        @ ++nLinha, 00 PSAY Replicate('*',nLimite)
        SB1->(DbSkip())
    EndDo

    SET DEVICE TO SCREEN

    If aReturn[5] == 1
        SET PRINTER TO DbCommitAll()
        OurSpool(cNomeRel)
    EndIf 

    MS_FLUSH()
Return 
