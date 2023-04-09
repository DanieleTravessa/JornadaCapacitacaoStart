#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function TRepSA2
	Exemplo de impressão com TReport, Lista 10, exercício 2.
	@type  Function
	@author Daniele Travessa
	@since 05/04/2023
/*/
User Function TRepSA2()

	Local oReport := GeraReport()

 	oReport:PrintDialog()

Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()

	Local oReport	:= TReport():New('TRepSA2', 'Relatorio de Fornecedores',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá todos os cadastros de fornecedor',.F.,,,, .T., .T.)	
	Local oSection	:= TRSection():New(oReport, "Dados dos Fornecedores",,,.F.,.T.)		
		
	TRCell():New(oSection, 'A2_COD',    'SA2', 'Codigo',    /*Pic*/, 8, /*Pixel*/, /**/, 'CENTER', .T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection, 'A2_LOJA',   'SA2', 'Loja', /*Pic*/, 5, /*Pixel*/, /**/, 'CENTER', .T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection, 'A2_NOME',   'SA2', 'Razao Social', /**/, 30, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',  /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
    TRCell():New(oSection, 'A2_MUN',    'SA2', 'Municipio', /*Pic*/, 15, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',  /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection, 'A2_EST',    'SA2', 'Estado',     /*Pic*/, 5, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection, 'A2_CEP',    'SA2', 'CEP',  '@R 99999-99',10, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',  /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection, 'A2_TEL',    'SA2', 'Telefone',   /*Pic*/,10, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',  /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
		
Return oReport

Static Function Imprime(oReport, cAlias)
	Local oSection := oReport:Section(1)
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/**/,/**/, cQuery), cAlias, .T., .T.)
	
	Count TO nTotReg 
	
	oReport:SetMeter(nTotReg)	
	oReport:SetTitle('Relatorio de Fornecedores')	
	oReport:StartPage()

	oSection:Init()  
	(cAlias)->(DBGoTop())
	
		oSection:Cell('Codigo'):SetValue((cAlias)->A2_COD)		
		oSection:Cell('Loja'):SetValue((cAlias)->A2_LOJA)		
		oSection:Cell('Razao Social'):SetValue((cAlias)->A2_NOME)				
		oSection:Cell('Municipio'):SetValue((cAlias)->A2_MUN)		
		oSection:Cell('Estado'):SetValue((cAlias)->A2_EST)		
		oSection:Cell('CEP'):SetValue((cAlias)->A2_CEP)				
		oSection:Cell('Telefone'):SetValue((cAlias)->A2_TEL)
				
		oSection:PrintLine()		
		oReport:ThinLine()		
		oReport:IncMeter()
			
	(cAlias)->(DBCloseArea())	
	oSection:Finish()				
	oReport:EndPage()
Return  

Static Function GeraQuery()
	Local cQuery := ''
	cQuery += 'SELECT A2_COD, A2_LOJA, A2_NOME, A2_MUN, A2_EST, A2_CEP, A2_TEL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' ' "
Return cQuery
