#INCLUDE'totvs.ch'
#INCLUDE'topconn.ch'

/*/{Protheus.doc} User Function FwExcelSA2
    Rotina que gera uma planilha no Excel em resposta ao exercÃ­cio1 Lista12
    @type  Function
    @author Daniele Travessa
    @since 19/04/2023
    
    @see (tdn.totvs.com/display/public/mp/FWMsExcel)
        (tdn.totvs.com/display/framework/FWMsExcelEx)
    /*/
User Function FwExcelSA2()
       
    Local cAlias := GeraConsul()    
    Private cDiretorio := 'E:\STARTotvsJc\Excel\'
    Private cArquivo   := 'FwExcelSA2.xml'
    Private cCaminho   := cDiretorio + cArquivo
    Private oExcel
      
    //Criando o objeto que irá gerar o conteúdo do Excel
    oExcel := FWMSExcel():New()
                    
    oExcel:AddworkSheet("Fornecedores")                
    oExcel:AddTable ("Fornecedores","Dados dos Fornecedores")
    
    // ESQUERDA 1 - CENTRO 2 - DIREITA 3 -|- GERAL 1 - NUMERO 2 - MONETARIO 3 - DATETIME 4
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","Codigo",   1, 1)
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","Nome",     1, 1)
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","Loja",     2, 1)
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","CNPJ",     1, 1)
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","Endereço", 1, 1)
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","Bairro",   1, 1)
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","Cidade",   1, 1)
    oExcel:AddColumn("Fornecedores","Dados dos Fornecedores","Estado",   1, 1)

    ImpDados(cAlias)
    GeraPlanil()

Return

Static Function ImpDados(cAlias)
       
    Local cCodigo, cNome, cLoja, cCNPJ, cEndereco, cBairro, cCidade, cEstado      
        
    DbSelectArea(cAlias) 
            
    (cAlias)->(DbGoTop())      

    While !((cAlias)->(EoF()))

        cCodigo    := (cAlias)->(A2_COD)
        cNome      := (cAlias)->(A2_NOME)
        cLoja      := (cAlias)->(A2_LOJA)
        cCNPJ      := (cAlias)->(A2_CGC)
        cEndereco  := (cAlias)->(A2_END)
        cBairro    := (cAlias)->(A2_BAIRRO)
        cCidade    := (cAlias)->(A2_MUN)
        cEstado    := (cAlias)->(A2_EST)

        oExcel:AddRow("Fornecedores","Dados dos Fornecedores",{cCodigo, cNome, cLoja, cCnpj, cEndereco, cBairro, cCidade, cEstado})

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
        oExcel := MsExcel():New()             //Abre uma nova conexÃ£o com Excel
        oExcel:WorkBooks:Open(cCaminho)     //Abre uma planilha
        oExcel:SetVisible(.T.)                 //Visualiza a planilha
        oExcel:Destroy()                        //Encerra o processo do gerenciador de tarefas
    Else        
           //Se existir a pasta do LibreOffice 5
        If ExistDir("C:\Program Files (x86)\LibreOffice 5")
                WaitRun('C:\Program Files (x86)\LibreOffice 5\program\scalc.exe "'+cArquivo+'"', 1)
             
            //Senão, abre o XML pelo programa padrão
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
    
    cQuery += ' SELECT A2_COD, A2_NOME, A2_LOJA, A2_CGC, A2_END, A2_BAIRRO, A2_MUN, A2_EST ' + CRLF
    cQuery += ' FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
    cQuery += " WHERE D_E_L_E_T_= ' ' "

    TCQUERY cQuery ALIAS (cAlias) NEW 

    (cAlias)->(DbGoTop())

    RestArea(aArea)

Return cAlias
