/*7 – Utilize um PE para adicionar uma nova opção ao botão “Outras Ações” do cadastro de fornecedores. 
Essa opção deverá ter o nome “Cad. Produtos” e quando clicar nela, deverá abrir o browse do cadastro 
de produtos, permitindo realizar qualquer uma das operações padrão (Incluir, Alterar, Visualizar, Excluir...)*/

// Rotina mBrowse da tabela SB1 para cadastro de produtos.
// Fonte: TDN

#INCLUDE "TOTVS.CH"

// Rotina mBrowse da tabela SB1 para cadastro de produtos.
User Function MA020ROT()

Local aRotUser := {}//Define Array contendo as Rotinas a executar do programa     

// ----------- Elementos contidos por dimensao ------------    
// 1. Nome a aparecer no cabecalho                             
// 2. Nome da Rotina associada                                 
// 3. Usado pela rotina                                        
// 4. Tipo de Transacao a ser efetuada                         
//    1 - Pesquisa e Posiciona em um Banco de Dados            
//    2 - Simplesmente Mostra os Campos                        
//    3 - Inclui registros no Bancos de Dados                  
//    4 - Altera o registro corrente                           
//    5 - Remove o registro corrente do Banco de Dados         
//    6 - Altera determinados campos sem incluir novos Regs     
//AAdd( aRotUser, { 'Documento', 'MsDocument('SA2', SA2->(recno()), 4)', 0, 4 } )
	AAdd( aRotUser, { "Cad. Produto", U_MbrownS, 0, 4 } )

Return aRotUser


User Function MbrownS()

    Local aArea     := GetArea()
    Local cAlias    := "SB1"
    Local aRotina   := {}
    
    
    aRotina := {{ "Pesquisar" ,    "AxPesqui" ,     0, 1 },;
                { "Visualizar",    "AxVisual" ,     0, 2 },;
                { "Incluir" ,      "AxInclui" ,     0, 3 },;
                { "Alterar" ,      "AxAltera" ,     0, 4 },;
                { "Excluir" ,      "AxDeleta" ,     0, 5 }}
    
	DbSelectArea("SB1")
    ("SB1")->(DbSetOrder(1))

    MBrowse(,,,,cAlias,,,,,,,,,,,,,,,,)

    DbCloseArea()
    RestArea(aArea)

Return



