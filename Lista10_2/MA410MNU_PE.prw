#INCLUDE'totvs.ch'

/*/{Protheus.doc} User Function MA410MNU
	Ponto de entrada para inclusão de botão para impressão com TReport, Lista 10.2, Exercício Único.
	@type  Function
	@author Daniele Travessa
	@since 12/04/2023
/*/
/*MA410MNU - Ponto de entrada disparado antes da abertura do Browse*/

User Function MA410MNU()
      
		aadd(aRotina,{'RELATORIO','U_TRepSC5' , 0 , 3,0,NIL})

Return aRotina
