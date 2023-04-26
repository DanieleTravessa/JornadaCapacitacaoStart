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

		aadd(aRotina,{'Challenge','U_FWchalleng' , 0 , 3,0,NIL}) //Lista 10 - pt2
		aadd(aRotina,{'Chalg13_2','U_CopiaRelat' , 0 , 3,0,NIL}) //Lista 13 - Challenge pt 2

Return aRotina
