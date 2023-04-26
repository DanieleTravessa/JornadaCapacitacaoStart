#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function RelAutVend
	Relat�rio de impress�o autom�tica com TReport, Lista 13, Challenge, pt1.
	@type  Function
	@author Daniele Travessa
	@since 12/04/2023
/*/
User Function RelAutVend()

	Local oReport := GeraReport()
	Private cLogProcess := " "
	
	cLogProcess += 'Manipulando Pedido de Vendas...' + CRLF
	cLogProcess += 'Solicitado Salvamento do Registro...' + CRLF 
	cLogProcess += 'Chamada da Fun��o de Gera��o de Relat�rio...' + CRLF
	cLogProcess += 'Configura��o do relat�rio sendo estabelecida...' + CRLF
	cLogProcess += "Cria��o da Estrutura, estabelecendo as se��es de Cabe�alho e Grid/Itens..." + CRLF

	oReport:nDevice := 6
	oReport:SetEnvironment(2)

 	oReport:PrintDialog()

Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias()	
	Local oReport	:= TReport():New((SC5->C5_NUM), 'Relat�rio de Pedido de Vendas',,{|oReport| Imprime(oReport, cAlias)}, 'Esse relat�rio imprimir� pedido de vendas',.F.,,,, .T., .T.)
	Local oSection1	:= TRSection():New(oReport, "Cabe�alho do Pedido",,,.F.,.T.)
	Local oSection2	:= TRSection():New(oSection1, "Itens do Pedido",,,.F.,.T.)	

	//cLogProcess += "Cria��o da Estrutura, estabelecendo as se��es de Cabe�alho e Grid/Itens..." + CRLF

	TRCell():New(oSection1, 'C5_NUM',    'SC5', 'Numero',     /*Picture*/, 		8, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'A1_NOME','SA1', 'Nome do Cliente', /*Picture*/, 	20, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',  /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C5_EMISSAO','SC5', 'Data Emiss�o','@R 99/99/9999', 12, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'E4_DESCRI','SE4', 'Condi��o de Pag', /*Picture*/,  15, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
	TRCell():New(oSection2, 'C6_ITEM',   'SC6', 'N�mero do Item', /*Picture*/, 	5, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER',/**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_PRODUTO','SC6', 'Cod Produto',/*Picture*/,      8, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER', /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_DESCRI',  'SC6', 'Descricao',  /*Picture*/, 	30, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT'  , /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_QTDVEN', 'SC6', 'Qde Vendida',/*Picture*/, 	    5, /*Pixel*/, /**/, 'CENTER',.T., 'CENTER', /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_PRCVEN', 'SC6', 'Valor Un.', '@E R$ 999999.99',13, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',   /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C6_VALOR',  'SC6', 'Valor Tot.','@E R$ 999999.99',13, /*Pixel*/, /**/, 'LEFT',  .T., 'LEFT',   /**/,/**/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)

	oBreak := TRBreak():New(oSection1, oSection1:Cell('Numero'),'Total do Pedido',.T.,,.T.)
	TRFunction():New(oSection2:Cell('C6_VALOR'),'Total do Pedido','SUM',oBreak,'Total do Pedido: ',,,.T.,.T.,.F.)

Return oReport

Static Function Imprime(oReport, cAlias)
	Local oSection1 := oReport:Section(1)
	Local oSection2 := oSection1:Section(1)
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()	
	Local cNome := AllTrim(SC5->C5_NUM)

	cLogProcess += 'Gerando a consulta ao Banco de Dados...' + CRLF 
	
	oReport:cFile := cNome

	cPedSel := ''
	cNumPed := ''

	DBUseArea(.T., 'TOPCONN', TcGenQry(/**/,/**/, cQuery), cAlias, .T., .T.)

	Count TO nTotReg
	
	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relat�rio de Pedido de Compras')
	oReport:StartPage()

	cLogProcess += 'Iniciando a p�gina do relat�rio...' + CRLF

	oSection1:Init()
	(cAlias)->(DBGoTop())

	cLogProcess += 'Populando os dados do cabe�alho, gerados na consulta...' + CRLF

	oSection1:Cell('C5_NUM'):SetValue((cAlias)->C5_NUM)
	oSection1:Cell('A1_NOME'):SetValue((cAlias)->A1_NOME)
	oSection1:Cell('C5_EMISSAO'):SetValue((cAlias)->C5_EMISSAO)
	oSection1:Cell('E4_DESCRI'):SetValue((cAlias)->E4_DESCRI)
	
	oSection1:PrintLine()

	cNumPed := AllTrim((cAlias)->C5_NUM)
	
	
	cPedSel := cNumPed

	cLogProcess += 'Populando os dados do corpo do relat�rio, gerados na consulta...' + CRLF

	While (cAlias)->(!EoF())
		
		If oReport:Cancel()
			Exit
		EndIf
			
		If cNumPed == cPedSel
		oSection2:Init()
		
		oSection2:Cell('C6_ITEM'):SetValue((cAlias)->C6_ITEM)
		oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->C6_PRODUTO)
		oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->C6_DESCRI)
		oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->C6_QTDVEN)
		oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->C6_PRCVEN)
		oSection2:Cell('C6_VALOR'):SetValue((cAlias)->C6_VALOR)
		EndIf
		oSection2:PrintLine()
		oReport:ThinLine()
		oReport:IncMeter()
		(cAlias)->(DBSkip())
	EndDo   
	
	(cAlias)->(DBCloseArea())
	oSection1:Finish()
	oSection2:Finish()
	oReport:EndPage()

	cLogProcess += 'Encerrando a p�gina, retornando o relat�rio pronto para impress�o...' + CRLF
	cLogProcess += 'Relat�rio Gerado!' + CRLF

	GeraLogPro()
Return

Static Function GeraQuery()

	Local cQuery := ' '

	cQuery += ' SELECT SC5.C5_NUM, SA1.A1_NOME, SC5.C5_EMISSAO, SE4.E4_DESCRI, SC6.C6_ITEM, SC6.C6_PRODUTO,' + CRLF
	cQuery += ' SC6.C6_DESCRI, SC6.C6_QTDVEN, SC6.C6_PRCVEN, SC6.C6_VALOR ' + CRLF
	cQuery += ' FROM ' + RetSqlName('SC5') + ' SC5 ' + CRLF
	cQuery += ' INNER JOIN ' + RetSqlName('SA1') + ' SA1 ' + CRLF
	cQuery += ' ON SC5.C5_CLIENTE = SA1.A1_COD' + CRLF
	cQuery += ' INNER JOIN ' + RetSqlName('SC6') + ' SC6 ' + CRLF
	cQuery += ' ON SC5.C5_NUM = SC6.C6_NUM' + CRLF
	cQuery += ' INNER JOIN ' + RetSqlName('SE4') + ' SE4 ' + CRLF
	cQuery += ' ON SC5.C5_CONDPAG = SE4.E4_CODIGO ' + CRLF
	cQuery += " WHERE SC5.D_E_L_E_T_ = ' ' " + CRLF
	cQuery += " AND SC5.C5_NUM = '" + SC5->C5_NUM + "' "

Return cQuery

Static Function GeraLogPro()

    Local cDiretorio := U_GerDirPedV()
	Local cPedido := (SC5->C5_NUM)
    Local cArquivo :=  cPedido + '.txt'
    Local lSobrescreve
    Local cEstrutura := ''
	Local oWriter := FwFileWriter():New(cDiretorio + cArquivo,.T.)
	
	cEstrutura := Replicate('*',50) + CRLF
	cEstrutura += Replicate(' ',15) + 'Relat�rio de Log de Processamento' + CRLF
	cEstrutura += Replicate('*',50) + CRLF
	cEstrutura += Replicate(' ',20) + 'Pedido: ' + cPedido + CRLF
	cEstrutura += Replicate('*',50) + CRLF
	cEstrutura += CRLF	

    if File(cDiretorio + cArquivo)
        if MsgYesNo('O arquivo j� existe gostaria de sobrescrev�-lo?', 'Aten��o!')
            lSobrescreve := .T.    
        else
            FwAlertInfo('Procedimento cancelado pelo usu�rio', 'Arquivo n�o foi criado!')             
        endif
    endif
    If !File(cDiretorio + cArquivo) .or. lSobrescreve == .T.
        if !oWriter:Create()
            FwAlertError('Houve um erro ao gerar o arquivo' + CRLF + 'Erro: ' + oWriter:Error():Message,'Erro!')
        else
            oWriter:Write(cEstrutura + cLogProcess)
            	FwAlertSuccess('Arquivo gerado com sucesso','Arquivo Gerado!')    
            oWriter:Close()
                if MsgYesNo('Arquivo gerado com sucesso ('+cDiretorio+cArquivo+')!' + CRLF + 'Deseja Abrir o arquivo?', 'Abrir?')
                    ShellExecute('OPEN', cArquivo, '', cDiretorio, 1)
                endif    
        endif    
    endif
Return 
