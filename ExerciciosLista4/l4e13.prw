/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E13: Desenvolva uma rotina em que, com base em um código de produto informado|
|pelo usuário, retorne todos os pedidos de venda em que esse produto está  |
|sendo usado. Obs: Os números dos pedidos devem estar separados por vírgula|
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

USER FUNCTION JsL4e13()

//Declaração e Atribuição de variáveis                      
    Local oJnla := Nil
    Local cTitulo := "Consulta de Produto"
    Local cTexto := "Digite o código do produto a ser pesquisado: "
    Local cProduto := Space(10)
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0

//Solicita os valores   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 090,030 of oJnla PIXEL    
    @ 010, 095 MSGET  cProduto  SIZE 050, 010 OF oJnla PIXEL
    @ 050, 010 BUTTON "Consultar" SIZE 50, 012 OF oJnla PIXEL ACTION ConsProduto(cProduto)
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return
 
 Static Function ConsProduto(cProduto)

    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := "", cMsg := "" 

    RpcSetEnv("99", "01")
   
    cQuery := "SELECT C6_PRODUTO, C6_NUM" + CRLF 
    cQuery +="FROM " + RetSqlName('SC6') + " SC6" + CRLF  
    cQuery += "WHERE C6_PRODUTO = '"+ cProduto + "'" 
	 
    TCQUERY cQuery ALIAS &(cAlias) new 
    
    &(cAlias)->(dbGoTop())

	While &(cAlias)->(!EOF())
		cMsg += cProduto := &(cAlias)->(C6_NUM) +", "
	    &(cAlias)->(DbSkip())
	EndDo		         
    
    If cMsg == ""
       FwAlertInfo("Não possui itens com este código no sistema!") 
    Else	
        FwAlertInfo(cMsg, "Pedidos de Vendas")
    ENDIF        
    
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

RETURN
