#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function TReport
	Exemplo de impressão com TReport.
	@type  Function
	@author Daniele Travessa
	@since 05/04/2023
/*/
User Function TRepSB1()

	Local oReport := GeraReport()

 	oReport:PrintDialog()

Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()

	Local oReport	:= TReport():New('TRepSB1', 'Relatório de Preços',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá todos os cadastros de clientes',.F.,,,, .T., .T.)	
	Local oSection	:= TRSection():New(oReport, "Clientes Novos por UF",,,.F.,.T.)		
		
	TRCell():New(oSection, 'B1_COD', 'SB1', 'Codigo', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection, 'B1_DESC', 'SB1', 'Descricao', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection, 'B1_UM', 'SB1', 'Unidade de Medida', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection, 'B1_PRV1', 'SB1', 'Preco de Venda', '@E R$999999.99', 20, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection, 'B1_LOCPAD', 'SB1', 'Armazem', /*Picture*/, 20, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
		
Return oReport

Static Function Imprime(oReport, cAlias)
	Local oSection := oReport:Section(1)
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/**/,/**/, cQuery), cAlias, .T., .T.)
	
	Count TO nTotReg 
	
	oReport:SetMeter(nTotReg)	
	oReport:SetTitle('Relatório de Produtos')	
	oReport:StartPage()

	oSection:Init()  
	(cAlias)->(DBGoTop())
	
	While (cAlias)->(!EoF())
		
		If oReport:Cancel()
			Exit
		EndIf

		oSection:Cell('Codigo'):SetValue((cAlias)->B1_COD)		
		oSection:Cell('Descricao'):SetValue((cAlias)->B1_DESC)		
		oSection:Cell('Unidade de Medida'):SetValue((cAlias)->B1_UM)				
		oSection:Cell('Preco de Venda'):SetValue((cAlias)->B1_PRV1)
		oSection:Cell('Armazem'):SetValue((cAlias)->B1_LOCPAD)
		
		oSection:PrintLine()		
		oReport:ThinLine()		
		oReport:IncMeter()
		(cAlias)->(DBSkip())
	EndDo   
	
	(cAlias)->(DBCloseArea())	
	oSection:Finish()				
	oReport:EndPage()
Return  

Static Function GeraQuery()
	Local cQuery := ''
	cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' ' AND B1_COD != ' '" 
Return cQuery
