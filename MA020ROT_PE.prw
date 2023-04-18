#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function TRepSC7
	Ponto de entrada para inclusão de botão para impressão de relatório com TReport;
	Lista 10, exercício 2.
	@type  Function
	@author Daniele Travessa
	@since 05/04/2023
/*/
User Function MA020ROT()

Local aRotUser := {}
	AAdd( aRotUser, { "TReport",   'U_TRepSA2', 0, 6 } )
	AAdd( aRotUser, { "MsPrinter", 'U_FWrepSA2', 0, 6 } )

Return aRotUser

/*Informações sobre o PE*/
//Define Array contendo as Rotinas a executar do programa     

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
