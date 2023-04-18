#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function TRelSC7
	Exemplo de impressão com TReport, Lista 10, exercício 5.
	@type  Function
	@author Daniele Travessa
	@since 05/04/2023
/*/
User Function TRelSC7()

	Local oReport := GeraReport()

 	oReport:PrintDialog()

Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()

	Local oReport	:= TReport():New('TRelSC7', 'Relatório de Pedidos de Compras',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relatório imprimirá os pedidos de compras existentes',.F.,,,, .T., .T.)
	Local oSection1	:= TRSection():New(oReport, "Cabeçalho do Pedido",,,.F.,.T.)
	Local oSection2	:= TRSection():New(oSection1, "Itens do Pedido",,,.F.,.T.)
			
	
	TRCell():New(oSection1, 'C7_NUM',    'SC7', 'Numero',     /*Picture*/, 		 8, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_EMISSAO','SC7', 'Data Emissão','@R 99/99/9999', 12, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_FORNECE','SC7', 'Fornecedor', /*Picture*/, 		20, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',  /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_LOJA',   'SC7', 'LOJA',       /*Picture*/, 		 5, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_COND',   'SC7', 'Cond Pagto', /*Picture*/, 		 5, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    
	TRCell():New(oSection2, 'C7_PRODUTO','SC7', 'Cod Produto',/*Picture*/,      8, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER', /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C7_DESCRI',  'SC7', 'Descricao',  /*Picture*/, 	   20, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT'  , /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C7_QUANT',  'SC7', 'Qde Vendida',/*Picture*/, 	    5, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER', /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C7_PRECO',  'SC7', 'Valor Un.', '@E R$ 999999.99',13, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',   /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_TOTAL',  'SC7', 'Valor Tot.','@E R$ 999999.99',13, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',   /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

Return oReport

Static Function Imprime(oReport, cAlias)
	Local oSection1 := oReport:Section(1)
	Local oSection2 := oSection1:Section(1)
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()        
    Local cUltimo := ''   
	
	DBUseArea(.T., 'TOPCONN', TcGenQry(/**/,/**/, cQuery), cAlias, .T., .T.)
	
	Count TO nTotReg 
	
	oReport:SetMeter(nTotReg)	
	oReport:SetTitle('Relatório de Pedido de Compras Existentes')	
	oReport:StartPage()

	oSection1:Init()
	oSection2:Init()
	
	(cAlias)->(DBGoTop())
		
	While (cAlias)->(!EoF())
						
		If oReport:Cancel()
			Exit
		EndIf
        If AllTrim(cUltimo) <> AllTrim((cAlias)->(C7_NUM))
            If !Empty(cUltimo)
				oSection2:Finish()
				oSection1:Finish()
            	oReport:EndPage()
            EndIf
			oSection1:Init()
			oSection1:Cell('Numero'):SetValue((cAlias)->C7_NUM)		
			oSection1:Cell('Data Emissao'):SetValue((cAlias)->C7_EMISSAO)		
			oSection1:Cell('Fornecedor'):SetValue((cAlias)->C7_FORNECE)			
			oSection1:Cell('Loja'):SetValue((cAlias)->C7_LOJA)
			oSection1:Cell('Cond Pagto'):SetValue((cAlias)->C7_COND)
			oSection1:PrintLine()
			cUltimo := Alltrim((cAlias)->C7_NUM)
            //nPag++
			oSection2:Init()
		EndIf

		oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->C7_PRODUTO)		
		oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->C7_DESCRI)		
		oSection2:Cell('C7_QUANT'):SetValue((cAlias)->C7_QUANT)				
		oSection2:Cell('C7_PRECO'):SetValue((cAlias)->C7_PRECO)
		oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->C7_TOTAL)       		
		oSection2:PrintLine()
				
		oReport:ThinLine()		
		oReport:IncMeter()
		(cAlias)->(DBSkip())
		EndDo
	
	(cAlias)->(DBCloseArea())	
	oSection1:Finish()
	oSection2:Finish()
	oReport:EndPage()
Return  

Static Function GeraQuery()
	Local cQuery := ''
	cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' ' AND C7_NUM != ' '"
Return cQuery  
