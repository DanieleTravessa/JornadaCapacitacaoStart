#INCLUDE'totvs.ch'
#INCLUDE'topconn.ch'

/*/{Protheus.doc} User Function FwExcelSA2
    Rotina que gera uma planilha no Excel em resposta ao exerc√≠cio1 Lista12
    @type  Function
    @author Daniele Travessa
    @since 19/04/2023
    
    @see (tdn.totvs.com/display/public/mp/FWMsExcel)
        (tdn.totvs.com/display/framework/FWMsExcelEx)
    /*/
User Function FwExcelZSC()
       
    Local cAlias := GeraConsul()  
    Private cDiretorio := 'E:\STARTotvsJc\Excel\'
    Private cArquivo   := 'FwExcelZSC.xml'
    Private cCaminho   := cDiretorio + cArquivo
    Private oExcel
      
    //Criando o objeto que ir· gerar o conte˙do do Excel
    oExcel := FWMSExcel():New()       
  
    ImpDados(cAlias)
    GeraPlanil()

Return

Static Function ImpDados(cAlias)
       
    Local cCodigo, cNome, cIdade, cCurso, cAtual
        
    DbSelectArea(cAlias) 
            
    (cAlias)->(DbGoTop())      
    
    
    While !((cAlias)->(EoF()))

        cCodigo := (cAlias)->(ZSC_COD)
        cNome   := (cAlias)->(ZSC_NOME)
        cIdade  := (cAlias)->(ZZS_IDADE)
        cCurso  := (cAlias)->(ZZC_NOME)
        
        If cAtual <> cCurso
        oExcel:AddworkSheet(cCurso)                
        oExcel:AddTable (cCurso,"Dados dos Alunos")
    
    // ESQUERDA 1 - CENTRO 2 - DIREITA 3 -|- GERAL 1 - NUMERO 2 - MONETARIO 3 - DATETIME 4
        oExcel:AddColumn(cCurso,"Dados dos Alunos","Codigo", 1, 1)
        oExcel:AddColumn(cCurso,"Dados dos Alunos","Nome",   1, 1)
        oExcel:AddColumn(cCurso,"Dados dos Alunos","Idade",  1, 1)
        cAtual := (cAlias)->(ZZC_NOME) 
        EndIF
        
        oExcel:AddRow(cCurso,"Dados dos Alunos",{cCodigo, cNome, cIdade})

        (cAlias)->(DbSkip())
    EndDo
      
    (cAlias)->(DbCloseArea())
   
Return

Static Function GeraPlanil()
    //Ativando o arquivo e gerando o xml
    oExcel:Activate()
    
    oExcel:GetXMLFile(cCaminho)
         
    //Abrindo o excel e abrindo o arquivo xml
    If ApOleClient('MsExcel')
        oExcel := MsExcel():New()             //Abre uma nova conex√£o com Excel
        oExcel:WorkBooks:Open(cCaminho)     //Abre uma planilha
        oExcel:SetVisible(.T.)                 //Visualiza a planilha
        oExcel:Destroy()                        //Encerra o processo do gerenciador de tarefas
    Else        
           //Se existir a pasta do LibreOffice 5
        If ExistDir("C:\Program Files (x86)\LibreOffice 5")
                WaitRun('C:\Program Files (x86)\LibreOffice 5\program\scalc.exe "'+cArquivo+'"', 1)
             
            //Sen„o, abre o XML pelo programa padr„o
        Else
                ShellExecute("Open", cArquivo, "", "C:\", 1)
        EndIf
    EndIf
    
    FwAlertSuccess('Arquivo Gerado!','Arquivo Gerado com Sucesso!!')     
  
    oExcel:DeActivate()

Return  

Static Function GeraConsul()

    Local aArea := GetArea()
    Local cQuery := ''
    Local cAlias := GetNextAlias()
    
    cQuery += ' SELECT ZSC.ZSC_COD, ZSC.ZSC_NOME, ZZS.ZZS_IDADE, ZZC.ZZC_NOME ' + CRLF
    cQuery += ' FROM ' + RetSqlName('ZSC') + ' ZSC ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('ZZS') + ' ZZS ' + CRLF
    cQuery += ' ON ZSC.ZSC_COD = ZZS.ZZS_COD ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('ZZC') + ' ZZC ' + CRLF
    cQuery += ' ON ZSC.ZSC_CURSO = ZZC.ZZC_COD ' + CRLF
    cQuery += " WHERE ZSC.D_E_L_E_T_=' ' "

    TCQUERY cQuery ALIAS (cAlias) NEW 

    RestArea(aArea)

Return cAlias
