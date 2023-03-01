#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function JsL4e14()

//Declaração e Atribuição de variáveis                      
    Local oJnla := Nil
    Local cTitulo := "Consulta de Produto"
    Local cTexto := "Digite o código do produto a ser pesquisado: "
    Local cProduto := Space(10)
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0

//Solicita os valores   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 090,010 of oJnla PIXEL    
    @ 010, 095 MSGET  cProduto  SIZE 050, 010 OF oJnla PIXEL
    @ 040, 010 BUTTON "Consultar" SIZE 70, 11 OF oJnla PIXEL ACTION ConsPed(cCodigo)
	@ 060, 010 BUTTON "Produtos cadastrados" SIZE 70, 11 OF oJnla PIXEL ACTION ProdutCad()
	@ 040, 100 BUTTON "Selecionar" SIZE 70, 11 OF oJnla PIXEL ACTION SelecProd(cCodigo)
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return
 
 Static Function ConsPed(cCodigo)

	Local aArea := GetArea()
	Local cAlias := GetNextAlias()
	Local cPed := '', cMsg := 'Pedidos de venda para o produto ' + ALLTRIM(cCodigo) +  ' são: ¦ '

  	rpcsetenv("99", "01")

	cQuery := 'SELECT C6_PRODUTO, C6_NUM' + CRLF + "FROM " + RetSqlName('SC6') + " SC6" + CRLF + "WHERE C6_PRODUTO = '" + cCodigo + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cPed := &(cAlias)->(C6_NUM)
		cMsg += cPed + " ¦ "
		&(cAlias)->(DbSkip())
	enddo

	FwAlertInfo(cMsg, "Pedidos de venda")
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)

Return

Static Function ProdutCad()

	Local aArea  := GetArea()
	Local cAlias := GetNextAlias()
	Local cMsg 	 := ""
	Local nCont  := 0 

    RpcSetEnv("99", "01")

    &(cAlias)->(DbGoTop())

     BEGINSQL Alias "SC6"
        SELECT 
            C6_PRODUTO,
            C6_DESCRI,            
        FROM 
            %table:SC6% SC6
        WHERE
            D_E_L_E_T_ <>'*' AND
            
    ENDSQL
    
    TCQUERY cQuery ALIAS &(cAlias) NEW
	
    &(cAlias)->(DbGoTop())

	While &(cAlias)->(!EOF())
		cMsg += "Código: "     + &(cAlias)->(C6_PRODUTO) + CRLF +; 
                "Descrição: "  + &(cAlias)->(C6_DESCRI) + CRLF +;
                "_______________________" + CRLF + CRLF
		&(cAlias)->(DbSkip())
		nCont++
		
		If nCont == 10
			FwAlertInfo(cMsg, "Produtos Cadastrados")
			cMsg := ''; nCont := 0
		Endif
	End

	FwAlertInfo(cMsg, "Produtos Cadastrados")
	&(cAlias)->(DbCloseArea())
	RestArea(aArea)

Return

Static Function SelecProd(cCodigo)

	Local aArea := GetArea(), cAlias := GetNextAlias(), cMsg := "", nI := 0

    RpcSetEnv("99", "01")

    &(cAlias)->(DbGoTop())

     BEGINSQL Alias "SC6"
        SELECT 
            C6_PRODUTO,
            C6_DESCRI,
            C6_QTDVEN,
			C6_PRCVEN,
			C6_VALOR
        FROM 
            %table:SC6% SC6
        WHERE
            D_E_L_E_T_ <>'*' AND
            B1_COD = 'cCod' 
        ORDER BY 
            C6_DESCRI ASC
    ENDSQL
    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

	While &(cAlias)->(!EOF())
		If cCodigo == ALLTRIM(&(cAlias)->(C6_PRODUTO))
			cMsg += "Código: "     + &(cAlias)->(C6_PRODUTO) + CRLF +; 
					"Descrição: "  + &(cAlias)->(C6_DESCRI) + CRLF +;
					"Quantidade: "       + Alltrim(STR(&(cAlias)->(C6_QTDVEN))) + CRLF+;
					"Preço de venda: R$" + Alltrim(STR(&(cAlias)->(C6_PRCVEN))) + CRLF+;
					"Valor total: R$"    + Alltrim(STR(&(cAlias)->(C6_VALOR))) + CRLF+;
					"_______________________" + CRLF + CRLF
			nI++
		Endif
		&(cAlias)->(DbSkip())
	EndDo

    If nI > 0
        FwAlertSuccess(cMsg, "Dados do Produto Cadastrado")
    Else
        FwAlertError("Código de produto não localizado!")
    Endif

	&(cAlias)->(DbCloseArea())
	RestArea(aArea)

Return
