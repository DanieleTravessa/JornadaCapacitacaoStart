/*/             |------Jornada de Capacitação - Start--------|
                |--------Exercícios ADVPL - Lista 04---------|
|--------------------------------------------------------------------------|
|Player: Daniele Travessa Brito                           GM: Muriel Zounar|
|--------------------------------------------------------------------------|
|--------------------------------------------------------------------------|
|E15: Altere o programa do exercício 11. Agora, caso o código informado não
 exista, o programa deve perguntar se o usuário deseja cadastrar um novo
produto, se a resposta for sim, deve-se abrir a tela de inclusão de produtos. 
|--------------------------------------------------------------------------|
/*/
#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function Jsl4e15()

//Declaração e Atribuição de variáveis                      
    Local cTitulo := "Consulta de Produto"
    Local cTexto := "Insira o código do produto: "
    Local nLinFim := 200, nColFim := 350
    Local nOpcao := 0
    Private cProduto := Space(10)
    Private oJnla := Nil

//Solicita os valores   
    DEFINE MSDIALOG oJnla TITLE cTitulo FROM 000,000 TO nLinFim, nColFim PIXEL
    @ 011, 010 SAY cTexto SIZE 090,010 of oJnla PIXEL    
    @ 010, 095 MSGET  cProduto SIZE 050, 010 OF oJnla PIXEL
    @ 050, 010 BUTTON "Consultar" SIZE 50, 012 OF oJnla PIXEL ACTION ConsultPro()
    @ 050, 095 BUTTON "Finalizar" SIZE 50, 012 OF oJnla PIXEL ACTION (nOpcao := 1, oJnla:End())
    ACTIVATE MSDIALOG oJnla CENTERED
Return

Static Function ConsultPro()

    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := "", cDesc := ""
    Local nValor := 0 
    Local lRepete := .T.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := "SELECT " + CRLF
    cQuery += " B1_COD " + CRLF
    cQuery += " ,B1_DESC " + CRLF
    cQuery += " ,B1_PRV1 " + CRLF
    cQuery += "FROM " + RetSqlName('SB1') +  CRLF
    cQuery += " ORDER BY B1_DESC ASC "
    
    TCQUERY cQuery ALIAS &(cAlias) NEW
                
        cDesc := &(cAlias)->(B1_DESC)
        nValor  := &(cAlias)->(B1_PRV1)
        
        If ALLTRIM(&(cAlias)->(cProduto)) == " "
            FwAlertInfo("não possui itens com este código no sistema") 
        Else 
            FwAlertInfo("Código: " + cProduto + CRLF + "Descrição: " + cDesc + CRLF + "Preço de venda: " + ALLTRIM(STR(nValor)), "Dados do Produto")
        EndIF
    
        lRepete := MsgYesNo("Deseja cadastrar o Produto? ", "Cadastro de Produto") 
        
        If lRepete == .T.
          AxCadastro("SB1", "Cadastro de Produtos")
          //AxInclui("SB1")                    
        Else
          oJnla:End()             
        EndIf  
 
    &(cAlias)->(DbCloseArea())
    RestArea(aArea)

Return 
