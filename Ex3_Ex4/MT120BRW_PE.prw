#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function TRepSC7
	Ponto de entrada para inclus�o de bot�o para impress�o com TReport, Lista 10, exerc�cio 3, 4 e 5.
	@type  Function
	@author Daniele Travessa
	@since 05/04/2023
/*/
/*MATA120.PRW // Sintaxe // MT120BRW - Adiciona bot�es � rotina ( ) --> Nil
Retorno Nil (nulo) Nil */

User Function MT120BRW()
/*//Define Array contendo as Rotinas a executar do programa     
// ----------- Elementos contidos por dimensao ------------    
// 1. Nome a aparecer no cabecalho                             
// 2. Nome da Rotina associada                                 
// 3. Usado pela rotina                                        
// 4. Tipo de Transa��o a ser efetuada                         
//    1 - Pesquisa e Posiciona em um Banco de Dados            
//    2 - Simplesmente Mostra os Campos                        
//    3 - Inclui registros no Bancos de Dados                  
//    4 - Altera o registro corrente                           
//    5 - Remove o registro corrente do Banco de Dados         
//    6 - Altera determinados campos sem incluir novos Regs     
AAdd( aRotina, { 'Documento', 'MsDocument('SC7', SC7->(recno()), 4)', 0, 4 } )*/
AAdd( aRotina, {'Rel Ped Selec', 'u_TRepSC7', 0, 6 } ) //Exerc�cio 3 e 4
AAdd( aRotina, {'Rel Ped Exist', 'u_TRelSC7', 0, 6 } ) //Exerc�cio 5

Return aRotina
