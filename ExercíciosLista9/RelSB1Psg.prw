#INCLUDE'totvs.ch'

User function RELSB1PSG()

    Local cTitulo := 'Tabela de Preços'
    Private cAlias := 'SB1'
    Private cProgram := 'RELSB1PSG'
    Private cDesc1 := 'Relatório de'
    Private cDesc2 := 'Preço de Venda'
    Private cDesc3 := 'do Produto'
    Private cSize := 'M'
    Private aReturn := {'Zebrado',1,'Administração',1,2,'','',1}
    Private nLastKey := 0
    Private nLimite := 132
    Private cNomeRel := SetPrint(cAlias,cProgram,'',@cTitulo,cDesc1,cDesc2,cDesc3,.F.,,.T.,cSIZE,,.F.)
    
    //(cAlias, cProgram, [cPergunta],[cTitle],[cDesc1],[cDesc2],[cDesc3],[lDic],[aOrd],[lCompres],[cSize],[uParm12],[lFilter])
    
    If nLastKey == 27
        MSGSTOP( 'Atenção!', 'Processo de Impressão Cancelado')
        Return
    EndIF

    SetDefault(aReturn, cAlias)//Prepara o ambiente de impressão

    RptStatus({||Imprime()}, cTitulo, 'Gerando relatórios...')
Return    

Static Function Imprime()

    Local nLinha     := 2
    Local nColuna    := 2
    Local nRegistros := 0
    

    DbSelectArea('SB1')// Seleciona a área de trabalho ativa
    SB1->(DbSetOrder(1)) // Define o Indice a ser utilizado
    SB1->(dbGoTop()) // Vai para o primeiro registro 

    @ ++nLinha, 000 PSAY Replicate('-',nLimite)
    @ ++nLinha, 003 PSAY '| Código |' 
    @ nLinha, 022 PSAY '| Descrição |' 
    @ nLinha, 052 PSAY '| Unidade de Medida |' 
    @ nLinha, 075 PSAY '| Preço de Venda |' 
    @ nLinha, 077 PSAY '| Armazém |'
    @ ++nLinha, 000 PSAY Replicate('-',nLimite)
    
    While !SB1->(EOF()) 
      
        @ ++nLinha, nColuna PSAY AllTrim(SB1->B1_COD)
        @ nLinha, 022 PSAY (SB1->B1_DESC)
        @ nLinha, 062 PSAY AllTrim(SB1->B1_UM)        
        @ nLinha, 082 PSAY 'R$' + AllTrim(STR(SB1->B1_PRV1,,2))
        @ nLinha, 102 PSAY AllTrim(SB1->B1_LOCPAD)
        @ nLinha++
        @ ++nLinha, 000 PSAY Replicate('*',nLimite)
        @ nLinha++  

        nRegistros++       

        SB1->(DbSkip())
    EndDo

    @ ++nLinha, nColuna pSay Replicate("-", nLimite)
    @ ++nLinha, nColuna pSay ALLTRIM(STR(nRegistros)) + " Registro (s) Listado (s)"
    @ ++nLinha, nColuna pSay Replicate("-", nLimite)

    SET DEVICE TO SCREEN

    If aReturn[5] == 1
        SET PRINTER TO DbCommitAll()
        OurSpool(cNomeRel)
    EndIf 

    MS_FLUSH()
 
Return 
